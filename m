Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9AA223FFF
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 17:55:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwShz-0007dz-IB; Fri, 17 Jul 2020 15:55:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lz8P=A4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jwShx-0007dh-Qt
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 15:55:33 +0000
X-Inumbo-ID: f2065ab2-c845-11ea-9634-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f2065ab2-c845-11ea-9634-12813bfff9fa;
 Fri, 17 Jul 2020 15:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595001333;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=kKIOm/tLpKkO/RVdK+qmAj3dALPw+NZ9MyRrdA1DLO0=;
 b=Ri38g88KCU/RENntFXHbyr5aKEXXRSKd+sgccQn134GCcEGS7gm+Eu+F
 Dbwz5+/kdSBTiwTCmBHiIIBeAYQN47ENIUfzeV9SuRkUYVXyQT4l21WqR
 MtJ1ht1mce+C/7Br0Be5lZwnq6aWnRMOEfyJSmp5tfV2awJyBvusfXS8P s=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Uk5dgXX6t9+WlglZ22k8Jzk7xLoljM4XJQahP791WhUUnZxnRm/ENxJaYiiHRBXXD0cdaq1Urv
 IMexfZZ9dZNymctlfxs1XqiTE3XhLVDkGDXfxDeL/B0d6gHD2VuDgFPMa0e0P6LIxVpFf0lAMk
 FM1X+Swji/dVQJ9ZtqpIEPwlhwgYiqlHRR8Ox4syoD9khzB0KEseGMMMRoih55p53QNGw+xZc0
 CyuupfvhKJSX9TWFAOdOcz4aCN/JCE8Cag6t65e/ivMrMX00oQLdSiAcJUSDJJ1qAsI8ST1YXZ
 r80=
X-SBRS: 2.7
X-MesageID: 22631661
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,362,1589256000"; d="scan'208";a="22631661"
Date: Fri, 17 Jul 2020 17:55:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
Message-ID: <20200717155525.GY7191@Air-de-Roger>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <E9CBAA57-5EF3-47F9-8A40-F5D7816DB2A4@arm.com>
 <20200717111644.GS7191@Air-de-Roger>
 <3B8A1B9D-A101-4937-AC42-4F62BE7E677C@arm.com>
 <20200717143120.GT7191@Air-de-Roger>
 <8AF78FF1-C389-44D8-896B-B95C1A0560E2@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8AF78FF1-C389-44D8-896B-B95C1A0560E2@arm.com>
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

On Fri, Jul 17, 2020 at 03:21:57PM +0000, Bertrand Marquis wrote:
> > On 17 Jul 2020, at 16:31, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > On Fri, Jul 17, 2020 at 01:22:19PM +0000, Bertrand Marquis wrote:
> >>> On 17 Jul 2020, at 13:16, Roger Pau Monné <roger.pau@citrix.com> wrote:
> >>>> * ACS capability is disable for ARM as of now as after enabling it
> >>>> devices are not accessible.
> >>>> * Dom0Less implementation will require to have the capacity inside Xen
> >>>> to discover the PCI devices (without depending on Dom0 to declare them
> >>>> to Xen).
> >>> 
> >>> I assume the firmware will properly initialize the host bridge and
> >>> configure the resources for each device, so that Xen just has to walk
> >>> the PCI space and find the devices.
> >>> 
> >>> TBH that would be my preferred method, because then you can get rid of
> >>> the hypercall.
> >>> 
> >>> Is there anyway for Xen to know whether the host bridge is properly
> >>> setup and thus the PCI bus can be scanned?
> >>> 
> >>> That way Arm could do something similar to x86, where Xen will scan
> >>> the bus and discover devices, but you could still provide the
> >>> hypercall in case the bus cannot be scanned by Xen (because it hasn't
> >>> been setup).
> >> 
> >> That is definitely the idea to rely by default on a firmware doing this properly.
> >> I am not sure wether a proper enumeration could be detected properly in all
> >> cases so it would make sens to rely on Dom0 enumeration when a Xen
> >> command line argument is passed as explained in one of Rahul’s mails.
> > 
> > I assume Linux somehow knows when it needs to initialize the PCI root
> > complex before attempting to access the bus. Would it be possible to
> > add this logic to Xen so it can figure out on it's own whether it's
> > safe to scan the PCI bus or whether it needs to wait for the hardware
> > domain to report the devices present?
> 
> That might be possible to do but will anyway require a command line argument
> to be able to force xen to let the hardware domain do the initialization anyway in
> case Xen detection does not work properly.
> In the case where there is a Dom0 i would more expect that we let it do the initialization
> all the time unless the user is telling using a command line argument that the current one
> is correct and shall be used.

FRT, on x86 we let dom0 enumerate and probe the PCI devices as it
feels like, but vPCI traps have already been set to all the detected
devices, and vPCI already supports letting dom0 size the BARs, or even
change it's position (theoretically, I haven't seen a dom0 change the
position of the BARs yet).

So on Arm you could also let dom0 do all of this, the question is
whether vPCI traps could be set earlier (when dom0 is created) if the
PCI bus has been initialized and can be scanned.

I have no idea however how bare metal Linux on Arm figures out the
state of the PCI bus, or if it's something that's passed on the DT, or
signaled somehow from the firmware/bootloader.

> >>> This should be limited to read-only accesses in order to be safe.
> >>> 
> >>> Emulating a PCI bridge in Xen using vPCI shouldn't be that
> >>> complicated, so you could likely replace the real bridges with
> >>> emulated ones. Or even provide a fake topology to the guest using an
> >>> emulated bridge.
> >> 
> >> Just showing all bridges and keeping the hardware topology is the simplest
> >> solution for now. But maybe showing a different topology and only fake
> >> bridges could make sense and be implemented in the future.
> > 
> > Ack. I've also heard rumors of Xen on Arm people being very interested
> > in VirtIO support, in which case you might expose both fully emulated
> > VirtIO devices and PCI passthrough devices on the PCI bus, so it would
> > be good to spend some time thinking how those will fit together.
> > 
> > Will you allocate a separate segment unused by hardware to expose the
> > fully emulated PCI devices (VirtIO)?
> > 
> > Will OSes support having several segments?
> > 
> > If not you likely need to have emulated bridges so that you can adjust
> > the bridge window accordingly to fit the passthrough and the emulated
> > MMIO space, and likely be able to expose passthrough devices using a
> > different topology than the host one.
> 
> Honestly this is not something we considered. I was more thinking that
> this use case would be handled by creating an other VPCI bus dedicated
> to those kind of devices instead of mixing physical and virtual devices.

Just mentioning it and your plans when guests might also have fully
emulated devices on the PCI bus would be relevant I think.

Anyway, I don't think it's something mandatory here, as from a guest
PoV how we expose PCI devices shouldn't matter that much, as long as
it's done in a spec compliant way.

So you can start with this approach if it's easier, I just wanted to
make sure you have in mind that at some point Arm guests might also
require fully emulated PCI devices so that you don't paint yourselves
in a corner.

> > 
> >>> 
> >>>> 
> >>>> # Emulated PCI device tree node in libxl:
> >>>> 
> >>>> Libxl is creating a virtual PCI device tree node in the device tree
> >>>> to enable the guest OS to discover the virtual PCI during guest
> >>>> boot. We introduced the new config option [vpci="pci_ecam"] for
> >>>> guests. When this config option is enabled in a guest configuration,
> >>>> a PCI device tree node will be created in the guest device tree.
> >>>> 
> >>>> A new area has been reserved in the arm guest physical map at which
> >>>> the VPCI bus is declared in the device tree (reg and ranges
> >>>> parameters of the node). A trap handler for the PCI ECAM access from
> >>>> guest has been registered at the defined address and redirects
> >>>> requests to the VPCI driver in Xen.
> >>> 
> >>> Can't you deduce the requirement of such DT node based on the presence
> >>> of a 'pci=' option in the same config file?
> >>> 
> >>> Also I wouldn't discard that in the future you might want to use
> >>> different emulators for different devices, so it might be helpful to
> >>> introduce something like:
> >>> 
> >>> pci = [ '08:00.0,backend=vpci', '09:00.0,backend=xenpt', '0a:00.0,backend=qemu', ... ]
> >>> 
> >>> For the time being Arm will require backend=vpci for all the passed
> >>> through devices, but I wouldn't rule out this changing in the future.
> >> 
> >> We need it for the case where no device is declared in the config file and the user
> >> wants to add devices using xl later. In this case we must have the DT node for it
> >> to work. 
> > 
> > There's a passthrough xl.cfg option for that already, so that if you
> > don't want to add any PCI passthrough devices at creation time but
> > rather hotplug them you can set:
> > 
> > passthrough=enabled
> > 
> > And it should setup the domain to be prepared to support hot
> > passthrough, including the IOMMU [0].
> 
> Isn’t this option covering more then PCI passthrough ?
> 
> Lots of Arm platform do not have a PCI bus at all, so for those
> creating a VPCI bus would be pointless. But you might need to
> activate this to pass devices which are not on the PCI bus.

Well, you can check whether the host has PCI support and decide
whether to attach a virtual PCI bus to the guest or not?

Setting passthrough=enabled should prepare the guest to handle
passthrough, in whatever form is supported by the host IMO.

> >>>> Limitation:
> >>>> * Need to avoid the “iomem” and “irq” guest config
> >>>> options and map the IOMEM region and IRQ at the same time when
> >>>> device is assigned to the guest using the “pci” guest config options
> >>>> when xl creates the domain.
> >>>> * Emulated BAR values on the VPCI bus should reflect the IOMEM mapped
> >>>> address.
> >>> 
> >>> It was my understanding that you would identity map the BAR into the
> >>> domU stage-2 translation, and that changes by the guest won't be
> >>> allowed.
> >> 
> >> In fact this is not possible to do and we have to remap at a different address
> >> because the guest physical mapping is fixed by Xen on Arm so we must follow
> >> the same design otherwise this would only work if the BARs are pointing to an
> >> address unused and on Juno this is for example conflicting with the guest
> >> RAM address.
> > 
> > This was not clear from my reading of the document, could you please
> > clarify on the next version that the guest physical memory map is
> > always the same, and that BARs from PCI devices cannot be identity
> > mapped to the stage-2 translation and instead are relocated somewhere
> > else?
> 
> We will.
> 
> > 
> > I'm then confused about what you do with bridge windows, do you also
> > trap and adjust them to report a different IOMEM region?
> 
> Yes this is what we will have to do so that the regions reflect the VPCI mappings
> and not the hardware one.
> 
> > 
> > Above you mentioned that read-only access was given to bridge
> > registers, but I guess some are also emulated in order to report
> > matching IOMEM regions?
> 
> yes that’s exact. We will clear this in the next version.

If you have to go this route for domUs, it might be easier to just
fake a PCI host bridge and place all the devices there even with
different SBDF addresses. Having to replicate all the bridges on the
physical PCI bus and fixing up it's MMIO windows seems much more
complicated than just faking/emulating a single bridge?

Roger.

