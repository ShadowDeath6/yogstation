/obj/item/weapon/pai_cable
	desc = "A flexible coated cable with a universal jack on one end."
	name = "data cable"
	icon = 'icons/obj/power.dmi'
	icon_state = "wire1"

	var/obj/machinery/machine
	var/mob/living/silicon/pai/owner

/obj/item/weapon/pai_cable/proc/plugin(obj/machinery/M, mob/user)
	if(istype(M, /obj/machinery/door) || istype(M, /obj/machinery/camera))
		if(!user.drop_item())
			return
		user.visible_message("[user] inserts [src] into a data port on [M].", "<span class='notice'>You insert [src] into a data port on [M].</span>", "<span class='italics'>You hear the satisfying click of a wire jack fastening into place.</span>")
		src.loc = M
		src.machine = M
		src.owner << output("1", "pai.browser:onCableConnected")
	else
		user.visible_message("[user] dumbly fumbles to find a place on [M] to plug in [src].", "<span class='warning'>There aren't any ports on [M] that match the jack belonging to [src]!</span>")

/obj/item/weapon/pai_cable/attack(obj/machinery/M, mob/user)
	src.plugin(M, user)