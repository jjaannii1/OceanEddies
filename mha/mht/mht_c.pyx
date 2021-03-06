import consts
from eddy import Eddy
from node import Node
from libc.math cimport sin, cos, acos, asin, sqrt, fabs, fmin, fmax

cdef double pi = 3.14159265

cdef double radians(double deg):
	return deg * pi / 180.0

# Uses http://en.wikipedia.org/wiki/Haversine_formula
cdef double get_dist(double lon1, double lat1, double lon2, double lat2):
	cdef double tmp, rad_dist, dlon
	if (lat1 == lat2) and (lon1 == lon2):
		return 0
	lat1 = radians(lat1)
	lat2 = radians(lat2)
	dlon = radians(fabs(lon2-lon1))
	tmp = sqrt(sin((lat2-lat1)/2)**2 + cos(lat1)*cos(lat2)*sin(dlon/2)**2)
	rad_dist = 2*asin(fmax(fmin(tmp, 1.0), -1.0)) # Force the number to be within the domain
	return rad_dist * 6371.01 # km

cdef bint gate(old_node, new_node, double gate_dist):
	cdef double dist, adj_gate_dist
	dist = get_dist(old_node.obj.Lon, old_node.obj.Lat, new_node.obj.Lon, new_node.obj.Lat)
	adj_gate_dist = gate_dist - fabs(old_node.obj.Lat)
	if dist > adj_gate_dist:
		return False
	else:
		new_node.dist = dist
		return True

def gate_and_add(pnodes, new, gate_dist):
	for pnode in pnodes:
		if type(pnode.obj) is Eddy and gate(pnode, new, gate_dist):
			cpy = Node(new.obj)
			cpy.add_child(Node(consts.END))
			cpy.dist = new.dist
			pnode.add_child(cpy)
