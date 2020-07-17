Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A9D22402C
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 18:08:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwSuj-0000tL-BJ; Fri, 17 Jul 2020 16:08:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lz8P=A4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jwSuh-0000tG-BX
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 16:08:43 +0000
X-Inumbo-ID: c84bf6ee-c847-11ea-b7bb-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c84bf6ee-c847-11ea-b7bb-bc764e2007e4;
 Fri, 17 Jul 2020 16:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595002121;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4ugp0nuCggopPu9xvsiebu27ZkSjhyh/jUgO1t4HHRg=;
 b=G9Wq0IO00k///GVG63J7FvhPhGEtNwhLvOIZJnvF6DepExXXjrPgSoBP
 rrEFXhZlgQjodW+0EpET3Q2PL5tqXE8JH9RUooHyl7bWTrXTAhOzdL+gR
 LQpb/Mr0JeWP7pdlQceyYjkjXrAeq0RWy+OSaflbFNin3yx+rTWuh2WZs E=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: LasNCKAHIc0ypFYjyIbg/sA4ZD7GfwzcX70V8O1SPBdRPEKZzAPp2Z+LMJAsNAM82Nth268l9V
 Dj19Kv9ClUt9duPqwNgc7CXvyMNwR14OTkslEu/mz7U5fhKtU7iun1pBb4ri0eRp4gA27soIeH
 d8idJhOwXL2cCLB15WHMUj7Ybsv8zP1laeurgntgzL3tO93xBtPh91LVBirPMIQhNMoTeaFn/l
 O7lBj6InR6k0wpVqedZ/kExOkxIJiIv7L8wHzVPFag+PwpTp08wDUmcJkCACfH1CkIVJ3rtnj+
 jWY=
X-SBRS: 2.7
X-MesageID: 22960547
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,362,1589256000"; d="scan'208";a="22960547"
Date: Fri, 17 Jul 2020 18:08:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
Message-ID: <20200717160834.GA7191@Air-de-Roger>
References: <1dd5db2d-98c7-7738-c3d4-d3f098dfe674@suse.com>
 <F09F9354-EC9B-4D76-809B-A25AF4F7D863@arm.com>
 <a5007a6c-bdfe-04d4-8107-53cb222b95e8@suse.com>
 <DA19A9EC-A828-4EBC-BCAA-D1D9E4F222BB@arm.com>
 <20200717144139.GU7191@Air-de-Roger>
 <90AE8DAB-2223-46DC-A263-D78365E5435E@arm.com>
 <20200717150507.GW7191@Air-de-Roger>
 <FBE040A9-D088-43D6-8929-FFEDE9DDDE34@arm.com>
 <20200717153043.GX7191@Air-de-Roger>
 <C5B2BDD5-E504-4871-8542-5BA8C051F699@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <C5B2BDD5-E504-4871-8542-5BA8C051F699@arm.com>
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
Cc: Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jul 17, 2020 at 03:51:47PM +0000, Bertrand Marquis wrote:
> 
> 
> > On 17 Jul 2020, at 17:30, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > 
> > On Fri, Jul 17, 2020 at 03:23:57PM +0000, Bertrand Marquis wrote:
> >> 
> >> 
> >>> On 17 Jul 2020, at 17:05, Roger Pau Monné <roger.pau@citrix.com> wrote:
> >>> 
> >>> On Fri, Jul 17, 2020 at 02:49:20PM +0000, Bertrand Marquis wrote:
> >>>> 
> >>>> 
> >>>>> On 17 Jul 2020, at 16:41, Roger Pau Monné <roger.pau@citrix.com> wrote:
> >>>>> 
> >>>>> On Fri, Jul 17, 2020 at 02:34:55PM +0000, Bertrand Marquis wrote:
> >>>>>> 
> >>>>>> 
> >>>>>>> On 17 Jul 2020, at 16:06, Jan Beulich <jbeulich@suse.com> wrote:
> >>>>>>> 
> >>>>>>> On 17.07.2020 15:59, Bertrand Marquis wrote:
> >>>>>>>> 
> >>>>>>>> 
> >>>>>>>>> On 17 Jul 2020, at 15:19, Jan Beulich <jbeulich@suse.com> wrote:
> >>>>>>>>> 
> >>>>>>>>> On 17.07.2020 15:14, Bertrand Marquis wrote:
> >>>>>>>>>>> On 17 Jul 2020, at 10:10, Jan Beulich <jbeulich@suse.com> wrote:
> >>>>>>>>>>> On 16.07.2020 19:10, Rahul Singh wrote:
> >>>>>>>>>>>> # Emulated PCI device tree node in libxl:
> >>>>>>>>>>>> 
> >>>>>>>>>>>> Libxl is creating a virtual PCI device tree node in the device tree to enable the guest OS to discover the virtual PCI during guest boot. We introduced the new config option [vpci="pci_ecam"] for guests. When this config option is enabled in a guest configuration, a PCI device tree node will be created in the guest device tree.
> >>>>>>>>>>> 
> >>>>>>>>>>> I support Stefano's suggestion for this to be an optional thing, i.e.
> >>>>>>>>>>> there to be no need for it when there are PCI devices assigned to the
> >>>>>>>>>>> guest anyway. I also wonder about the pci_ prefix here - isn't
> >>>>>>>>>>> vpci="ecam" as unambiguous?
> >>>>>>>>>> 
> >>>>>>>>>> This could be a problem as we need to know that this is required for a guest upfront so that PCI devices can be assigned after using xl. 
> >>>>>>>>> 
> >>>>>>>>> I'm afraid I don't understand: When there are no PCI device that get
> >>>>>>>>> handed to a guest when it gets created, but it is supposed to be able
> >>>>>>>>> to have some assigned while already running, then we agree the option
> >>>>>>>>> is needed (afaict). When PCI devices get handed to the guest while it
> >>>>>>>>> gets constructed, where's the problem to infer this option from the
> >>>>>>>>> presence of PCI devices in the guest configuration?
> >>>>>>>> 
> >>>>>>>> If the user wants to use xl pci-attach to attach in runtime a device to a guest, this guest must have a VPCI bus (even with no devices).
> >>>>>>>> If we do not have the vpci parameter in the configuration this use case will not work anymore.
> >>>>>>> 
> >>>>>>> That's what everyone looks to agree with. Yet why is the parameter needed
> >>>>>>> when there _are_ PCI devices anyway? That's the "optional" that Stefano
> >>>>>>> was suggesting, aiui.
> >>>>>> 
> >>>>>> I agree in this case the parameter could be optional and only required if not PCI device is assigned directly in the guest configuration.
> >>>>> 
> >>>>> Where will the ECAM region(s) appear on the guest physmap?
> >>>>> 
> >>>>> Are you going to re-use the same locations as on the physical
> >>>>> hardware, or will they appear somewhere else?
> >>>> 
> >>>> We will add some new definitions for the ECAM regions in the guest physmap declared in xen (include/asm-arm/config.h)
> >>> 
> >>> I think I'm confused, but that file doesn't contain anything related
> >>> to the guest physmap, that's the Xen virtual memory layout on Arm
> >>> AFAICT?
> >>> 
> >>> Does this somehow relate to the physical memory map exposed to guests
> >>> on Arm?
> >> 
> >> Yes it does.
> >> We will add new definitions there related to VPCI to reserve some areas for the VPCI ECAM and the IOMEM areas.
> > 
> > Yes, that's completely fine and is what's done on x86, but again I
> > feel like I'm lost here, this is the Xen virtual memory map, how does
> > this relate to the guest physical memory map?
> 
> Sorry my bad, we will add values in include/public/arch-arm.h, wrong header :-)

Oh right, now I see it :).

Do you really need to specify the ECAM and MMIO regions there?

Wouldn't it be enough to specify the ECAM regions on the DT or the
ACPI MCFG table and get the MMIO regions directly from the BARs of the
devices?

Roger.

