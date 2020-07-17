Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E74A3223E0E
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 16:31:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwROe-0007wM-Of; Fri, 17 Jul 2020 14:31:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lz8P=A4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jwROd-0007wH-0P
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 14:31:31 +0000
X-Inumbo-ID: 33493316-c83a-11ea-bb8b-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 33493316-c83a-11ea-bb8b-bc764e2007e4;
 Fri, 17 Jul 2020 14:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594996289;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Uuz5TL1fbxmFd/n15nm7iobrvGenyCZTAFr40EETJ/o=;
 b=VjCYi1ytCL6qjxG+OrwlpZ9sWnA6hYWL6yuifGPrACXFyTr+jCReyD8q
 V+4kA+LsPaoOA/hLkXWkRsS9qRgM1HMKEJ+5WGeHPk1hhYYHrzl9VEb7l
 ngeNAnkAsMf2HRel6eBk+sAlpz1P2iBvBja+O6YvV9pavYB+/5YxjpJLH A=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: zv4vvE8+FHpYV52xZ64iapQfIP83JUgHH1n6cqrJJxPwVpwxGXN7+FCzHVSviIKwIUcXqoqGSQ
 bo0Bs1T2B9wQ5bUbZfUiGeeyM1+5VfyyT+BibpKhA3xJSG6TtOcbnmFNjkYJT8CtdwMeT1fMBf
 blyGKUfHHSoct6GGA0Ef1Ypho3jlxA/a0OEa4W5/TzfE3nELBzec4QCguNbWugzoEt4ZDVj6oy
 jLX/qN/SUnjn7GS5YTTG8DJ6183d8PRxO66vUkSPWoIEYiuHkgdcf7guKsIqJ3jL+reh4Jp009
 87k=
X-SBRS: 2.7
X-MesageID: 22623847
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,362,1589256000"; d="scan'208";a="22623847"
Date: Fri, 17 Jul 2020 16:31:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
Message-ID: <20200717143120.GT7191@Air-de-Roger>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <E9CBAA57-5EF3-47F9-8A40-F5D7816DB2A4@arm.com>
 <20200717111644.GS7191@Air-de-Roger>
 <3B8A1B9D-A101-4937-AC42-4F62BE7E677C@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3B8A1B9D-A101-4937-AC42-4F62BE7E677C@arm.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jul 17, 2020 at 01:22:19PM +0000, Bertrand Marquis wrote:
> 
> 
> > On 17 Jul 2020, at 13:16, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > 
> > I've wrapped the email to 80 columns in order to make it easier to
> > reply.
> > 
> > Thanks for doing this, I think the design is good, I have some
> > questions below so that I understand the full picture.
> > 
> > On Thu, Jul 16, 2020 at 05:10:05PM +0000, Rahul Singh wrote:
> >> Hello All,
> >> 
> >> Following up on discussion on PCI Passthrough support on ARM that we
> >> had at the XEN summit, we are submitting a Review For Comment and a
> >> design proposal for PCI passthrough support on ARM. Feel free to
> >> give your feedback.
> >> 
> >> The followings describe the high-level design proposal of the PCI
> >> passthrough support and how the different modules within the system
> >> interacts with each other to assign a particular PCI device to the
> >> guest.
> >> 
> >> # Title:
> >> 
> >> PCI devices passthrough on Arm design proposal
> >> 
> >> # Problem statement:
> >> 
> >> On ARM there in no support to assign a PCI device to a guest. PCI
> >> device passthrough capability allows guests to have full access to
> >> some PCI devices. PCI device passthrough allows PCI devices to
> >> appear and behave as if they were physically attached to the guest
> >> operating system and provide full isolation of the PCI devices.
> >> 
> >> Goal of this work is to also support Dom0Less configuration so the
> >> PCI backend/frontend drivers used on x86 shall not be used on Arm.
> >> It will use the existing VPCI concept from X86 and implement the
> >> virtual PCI bus through IO emulation such that only assigned devices
> >> are visible to the guest and guest can use the standard PCI
> >> driver.
> >> 
> >> Only Dom0 and Xen will have access to the real PCI bus, guest will
> >> have a direct access to the assigned device itself. IOMEM memory
> >> will be mapped to the guest and interrupt will be redirected to the
> >> guest. SMMU has to be configured correctly to have DMA
> >> transaction.
> >> 
> >> ## Current state: Draft version
> >> 
> >> # Proposer(s): Rahul Singh, Bertrand Marquis
> >> 
> >> # Proposal:
> >> 
> >> This section will describe the different subsystem to support the
> >> PCI device passthrough and how these subsystems interact with each
> >> other to assign a device to the guest.
> >> 
> >> # PCI Terminology:
> >> 
> >> Host Bridge: Host bridge allows the PCI devices to talk to the rest
> >> of the computer.  ECAM: ECAM (Enhanced Configuration Access
> >> Mechanism) is a mechanism developed to allow PCIe to access
> >> configuration space. The space available per function is 4KB.
> >> 
> >> # Discovering PCI Host Bridge in XEN:
> >> 
> >> In order to support the PCI passthrough XEN should be aware of all
> >> the PCI host bridges available on the system and should be able to
> >> access the PCI configuration space. ECAM configuration access is
> >> supported as of now. XEN during boot will read the PCI device tree
> >> node “reg” property and will map the ECAM space to the XEN memory
> >> using the “ioremap_nocache ()” function.
> > 
> > What about ACPI? I think you should also mention the MMCFG table,
> > which should contain the information about the ECAM region(s) (or at
> > least that's how it works on x86). Just realized that you don't
> > support ACPI ATM, so you can ignore this comment.
> 
> Yes for now we did not consider ACPI support.

I have 0 knowledge of ACPI on Arm, but I would assume it's also using
the MCFG table in order to report ECAM regions to the OSPM. This is a
static table that's very simple to parse, and it contains the ECAM
IOMEM area and the segment assigned to that ECAM region.

This is better than DT because ACPI already assigns segment numbers to
each ECAM region.

Even if not currently supported in the code implemented so far
describing the plan for it's implementation here seems fine IMO, as
it's going to be slightly different from what you need to do when
using DT.

> > 
> >> 
> >> If there are more than one segment on the system, XEN will read the
> >> “linux, pci-domain” property from the device tree node and configure
> >> the host bridge segment number accordingly. All the PCI device tree
> >> nodes should have the “linux,pci-domain” property so that there will
> >> be no conflicts. During hardware domain boot Linux will also use the
> >> same “linux,pci-domain” property and assign the domain number to the
> >> host bridge.
> > 
> > So it's my understanding that the PCI domain (or segment) is just an
> > abstract concept to differentiate all the Root Complex present on
> > the system, but the host bridge itself it's not aware of the segment
> > assigned to it in any way.
> > 
> > I'm not sure Xen and the hardware domain having matching segments is a
> > requirement, if you use vPCI you can match the segment (from Xen's
> > PoV) by just checking from which ECAM region the access has been
> > performed.
> > 
> > The only reason to require matching segment values between Xen and the
> > hardware domain is to allow using hypercalls against the PCI devices,
> > ie: to be able to use hypercalls to assign a device to a domain from
> > the hardware domain.
> > 
> > I have 0 understanding of DT or it's spec, but why does this have a
> > 'linux,' prefix? The segment number is part of the PCI spec, and not
> > something specific to Linux IMO.
> 
> This is exact that this is only needed for the hypercall when Dom0 is
> doing the full enumeration and communicating the devices to Xen. 
> On all other cases this can be deduced from the address of the access.

You also need the SBDF nomenclature in order to assign deices to
guests from the control domain, so at least there needs to be some
consensus from the hardware domain and Xen on the segment numbering in
that regard.

Same applies to dom0less mode, there needs to be some consensus about
the segment numbers used, so Xen can identify the devices assigned to
each guests without confusion.

> Regarding the DT entry, this is not coming from us and this is already
> defined this way in existing DTBs, we just reuse the existing entry. 

Is it possible to standardize the property and drop the linux prefix?

> > 
> >> 
> >> When Dom0 tries to access the PCI config space of the device, XEN
> >> will find the corresponding host bridge based on segment number and
> >> access the corresponding config space assigned to that bridge.
> >> 
> >> Limitation:
> >> * Only PCI ECAM configuration space access is supported.
> >> * Device tree binding is supported as of now, ACPI is not supported.
> >> * Need to port the PCI host bridge access code to XEN to access the
> >>  configuration space (generic one works but lots of platforms will
> >>  required  some specific code or quirks).
> >> 
> >> # Discovering PCI devices:
> >> 
> >> PCI-PCIe enumeration is a process of detecting devices connected to
> >> its host. It is the responsibility of the hardware domain or boot
> >> firmware to do the PCI enumeration and configure the BAR, PCI
> >> capabilities, and MSI/MSI-X configuration.
> >> 
> >> PCI-PCIe enumeration in XEN is not feasible for the configuration
> >> part as it would require a lot of code inside Xen which would
> >> require a lot of maintenance. Added to this many platforms require
> >> some quirks in that part of the PCI code which would greatly improve
> >> Xen complexity. Once hardware domain enumerates the device then it
> >> will communicate to XEN via the below hypercall.
> >> 
> >> #define PHYSDEVOP_pci_device_add        25 struct
> >> physdev_pci_device_add {
> >>    uint16_t seg;
> >>    uint8_t bus;
> >>    uint8_t devfn;
> >>    uint32_t flags;
> >>    struct {
> >>        uint8_t bus;
> >>        uint8_t devfn;
> >>    } physfn;
> >>    /*
> >>     * Optional parameters array.
> >>     * First element ([0]) is PXM domain associated with the device (if
> >>     * XEN_PCI_DEV_PXM is set)
> >>     */
> >>    uint32_t optarr[XEN_FLEX_ARRAY_DIM];
> >> };
> >> 
> >> As the hypercall argument has the PCI segment number, XEN will
> >> access the PCI config space based on this segment number and find
> >> the host-bridge corresponding to this segment number. At this stage
> >> host bridge is fully initialized so there will be no issue to access
> >> the config space.
> >> 
> >> XEN will add the PCI devices in the linked list maintain in XEN
> >> using the function pci_add_device(). XEN will be aware of all the
> >> PCI devices on the system and all the device will be added to the
> >> hardware domain.
> >> 
> >> Limitations:
> >> * When PCI devices are added to XEN, MSI capability is
> >>  not initialized inside XEN and not supported as of now.
> > 
> > I assume you will mask such capability and will prevent the guest (or
> > hardware domain) from interacting with it?
> 
> No we will actually implement that part but later. This is not supported in
> the RFC that we will submit. 

OK, might be nice to note this somewhere, even if it's not implemented
right now. It might also be relevant to start thinking about which
capabilities you have to expose to guests, and how you will make those
safe. This could even be in a separate document, but ideally a design
document (or set of documents) should try to cover all the
implementation that will be done in order to support a feature.

> > 
> >> * ACS capability is disable for ARM as of now as after enabling it
> >>  devices are not accessible.
> >> * Dom0Less implementation will require to have the capacity inside Xen
> >>  to discover the PCI devices (without depending on Dom0 to declare them
> >>  to Xen).
> > 
> > I assume the firmware will properly initialize the host bridge and
> > configure the resources for each device, so that Xen just has to walk
> > the PCI space and find the devices.
> > 
> > TBH that would be my preferred method, because then you can get rid of
> > the hypercall.
> > 
> > Is there anyway for Xen to know whether the host bridge is properly
> > setup and thus the PCI bus can be scanned?
> > 
> > That way Arm could do something similar to x86, where Xen will scan
> > the bus and discover devices, but you could still provide the
> > hypercall in case the bus cannot be scanned by Xen (because it hasn't
> > been setup).
> 
> That is definitely the idea to rely by default on a firmware doing this properly.
> I am not sure wether a proper enumeration could be detected properly in all
> cases so it would make sens to rely on Dom0 enumeration when a Xen
> command line argument is passed as explained in one of Rahul’s mails.

I assume Linux somehow knows when it needs to initialize the PCI root
complex before attempting to access the bus. Would it be possible to
add this logic to Xen so it can figure out on it's own whether it's
safe to scan the PCI bus or whether it needs to wait for the hardware
domain to report the devices present?

> > 
> >> 
> >> # Enable the existing x86 virtual PCI support for ARM:
> >> 
> >> The existing VPCI support available for X86 is adapted for Arm. When
> >> the device is added to XEN via the hyper call
> >> “PHYSDEVOP_pci_device_add”, VPCI handler for the config space access
> >> is added to the PCI device to emulate the PCI devices.
> >> 
> >> A MMIO trap handler for the PCI ECAM space is registered in XEN so
> >> that when guest is trying to access the PCI config space, XEN will
> >> trap the access and emulate read/write using the VPCI and not the
> >> real PCI hardware.
> >> 
> >> Limitation:
> >> * No handler is register for the MSI configuration.
> > 
> > But you need to mask MSI/MSI-X capabilities in the config space in
> > order to prevent access from domains? (and by mask I mean remove from
> > the list of capabilities and prevent reads/writes to that
> > configuration space).
> > 
> > Note this is already implemented for x86, and I've tried to add arch_
> > hooks for arch specific stuff so that it could be reused by Arm. But
> > maybe this would require a different design document?
> 
> as said, we will handle MSI support in a separate document/step.
> 
> > 
> >> * Only legacy interrupt is supported and tested as of now, MSI is not
> >>  implemented and tested.
> >> 
> >> # Assign the device to the guest:
> >> 
> >> Assign the PCI device from the hardware domain to the guest is done
> >> using the below guest config option. When xl tool create the domain,
> >> PCI devices will be assigned to the guest VPCI bus.
> >> 
> >> pci=[ "PCI_SPEC_STRING", "PCI_SPEC_STRING", ...]
> >> 
> >> Guest will be only able to access the assigned devices and see the
> >> bridges. Guest will not be able to access or see the devices that
> >> are no assigned to him.
> >> 
> >> Limitation:
> >> * As of now all the bridges in the PCI bus are seen by
> >>  the guest on the VPCI bus.
> > 
> > I don't think you need all of them, just the ones that are higher up
> > on the hierarchy of the device you are trying to passthrough?
> > 
> > Which kind of access do guest have to PCI bridges config space?
> 
> For now the bridges are read only, no specific access is required by guests. 
> 
> > 
> > This should be limited to read-only accesses in order to be safe.
> > 
> > Emulating a PCI bridge in Xen using vPCI shouldn't be that
> > complicated, so you could likely replace the real bridges with
> > emulated ones. Or even provide a fake topology to the guest using an
> > emulated bridge.
> 
> Just showing all bridges and keeping the hardware topology is the simplest
> solution for now. But maybe showing a different topology and only fake
> bridges could make sense and be implemented in the future.

Ack. I've also heard rumors of Xen on Arm people being very interested
in VirtIO support, in which case you might expose both fully emulated
VirtIO devices and PCI passthrough devices on the PCI bus, so it would
be good to spend some time thinking how those will fit together.

Will you allocate a separate segment unused by hardware to expose the
fully emulated PCI devices (VirtIO)?

Will OSes support having several segments?

If not you likely need to have emulated bridges so that you can adjust
the bridge window accordingly to fit the passthrough and the emulated
MMIO space, and likely be able to expose passthrough devices using a
different topology than the host one.

> > 
> >> 
> >> # Emulated PCI device tree node in libxl:
> >> 
> >> Libxl is creating a virtual PCI device tree node in the device tree
> >> to enable the guest OS to discover the virtual PCI during guest
> >> boot. We introduced the new config option [vpci="pci_ecam"] for
> >> guests. When this config option is enabled in a guest configuration,
> >> a PCI device tree node will be created in the guest device tree.
> >> 
> >> A new area has been reserved in the arm guest physical map at which
> >> the VPCI bus is declared in the device tree (reg and ranges
> >> parameters of the node). A trap handler for the PCI ECAM access from
> >> guest has been registered at the defined address and redirects
> >> requests to the VPCI driver in Xen.
> > 
> > Can't you deduce the requirement of such DT node based on the presence
> > of a 'pci=' option in the same config file?
> > 
> > Also I wouldn't discard that in the future you might want to use
> > different emulators for different devices, so it might be helpful to
> > introduce something like:
> > 
> > pci = [ '08:00.0,backend=vpci', '09:00.0,backend=xenpt', '0a:00.0,backend=qemu', ... ]
> > 
> > For the time being Arm will require backend=vpci for all the passed
> > through devices, but I wouldn't rule out this changing in the future.
> 
> We need it for the case where no device is declared in the config file and the user
> wants to add devices using xl later. In this case we must have the DT node for it
> to work. 

There's a passthrough xl.cfg option for that already, so that if you
don't want to add any PCI passthrough devices at creation time but
rather hotplug them you can set:

passthrough=enabled

And it should setup the domain to be prepared to support hot
passthrough, including the IOMMU [0].

> Regarding possibles backend this could be added in the future if required. 
> 
> > 
> >> Limitation:
> >> * Only one PCI device tree node is supported as of now.
> >> 
> >> BAR value and IOMEM mapping:
> >> 
> >> Linux guest will do the PCI enumeration based on the area reserved
> >> for ECAM and IOMEM ranges in the VPCI device tree node. Once PCI
> >> device is assigned to the guest, XEN will map the guest PCI IOMEM
> >> region to the real physical IOMEM region only for the assigned
> >> devices.
> > 
> > PCI IOMEM == BARs? Or are you referring to the ECAM access window?
> 
> Here by PCI IOMEM we mean the IOMEM spaces referred to by the BARs
> of the PCI device

OK, might be worth to use PCI BARs explicitly rather than PCI IOMEM as
I think that's likely to be confused with the config space IOMEM.

> > 
> >> As of now we have not modified the existing VPCI code to map the
> >> guest PCI IOMEM region to the real physical IOMEM region. We used
> >> the existing guest “iomem” config option to map the region.  For
> >> example: Guest reserved IOMEM region:  0x04020000 Real physical
> >> IOMEM region:0x50000000 IOMEM size:128MB iomem config will be:
> >> iomem = ["0x50000,0x8000@0x4020"]
> >> 
> >> There is no need to map the ECAM space as XEN already have access to
> >> the ECAM space and XEN will trap ECAM accesses from the guest and
> >> will perform read/write on the VPCI bus.
> >> 
> >> IOMEM access will not be trapped and the guest will directly access
> >> the IOMEM region of the assigned device via stage-2 translation.
> >> 
> >> In the same, we mapped the assigned devices IRQ to the guest using
> >> below config options.  irqs= [ NUMBER, NUMBER, ...]
> > 
> > Are you providing this for the hardware domain also? Or are irqs
> > fetched from the DT in that case?
> 
> This will only be used temporarily until we have proper support to do this
> automatically when a device is assigned. Right now our current implementation
> status requires the user to explicitely redirect the interrupts required by the PCI
> devices assigned but in the final version this entry will not be needed.

Right, I'm not sure whether this should be marked somehow as **
WORKAROUND ** or ** TEMPORARY ** in the document, since it's not
supposed to be part of the final implementation.

> Dom0 relies on the entries declared in the DT.
> 
> > 
> >> Limitation:
> >> * Need to avoid the “iomem” and “irq” guest config
> >>  options and map the IOMEM region and IRQ at the same time when
> >>  device is assigned to the guest using the “pci” guest config options
> >>  when xl creates the domain.
> >> * Emulated BAR values on the VPCI bus should reflect the IOMEM mapped
> >>  address.
> > 
> > It was my understanding that you would identity map the BAR into the
> > domU stage-2 translation, and that changes by the guest won't be
> > allowed.
> 
> In fact this is not possible to do and we have to remap at a different address
> because the guest physical mapping is fixed by Xen on Arm so we must follow
> the same design otherwise this would only work if the BARs are pointing to an
> address unused and on Juno this is for example conflicting with the guest
> RAM address.

This was not clear from my reading of the document, could you please
clarify on the next version that the guest physical memory map is
always the same, and that BARs from PCI devices cannot be identity
mapped to the stage-2 translation and instead are relocated somewhere
else?

I'm then confused about what you do with bridge windows, do you also
trap and adjust them to report a different IOMEM region?

Above you mentioned that read-only access was given to bridge
registers, but I guess some are also emulated in order to report
matching IOMEM regions?

Roger.

[0] https://xenbits.xen.org/docs/unstable/man/xl.cfg.5.html#Other-Options

