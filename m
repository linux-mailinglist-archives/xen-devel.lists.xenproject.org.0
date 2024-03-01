Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 307ED86EA40
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 21:25:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687793.1071608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg9RK-00029G-Ps; Fri, 01 Mar 2024 20:25:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687793.1071608; Fri, 01 Mar 2024 20:25:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg9RK-000268-N4; Fri, 01 Mar 2024 20:25:06 +0000
Received: by outflank-mailman (input) for mailman id 687793;
 Fri, 01 Mar 2024 20:25:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KIEr=KH=neowutran.ovh=xen@srs-se1.protection.inumbo.net>)
 id 1rg9RI-000261-Mn
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 20:25:05 +0000
Received: from neowutran.ovh (core.neowutran.ovh [51.83.40.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8a64ffd-d809-11ee-afd8-a90da7624cb6;
 Fri, 01 Mar 2024 21:25:03 +0100 (CET)
Received: from neowutran.ovh (maisonhome.neowutran.ovh [82.65.3.49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by neowutran.ovh (Postfix) with ESMTPSA id 0E3EB61294;
 Fri,  1 Mar 2024 20:25:01 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: c8a64ffd-d809-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=neowutran.ovh; s=mail;
	t=1709324701; bh=aBzntxj8KXmquB5SuuEJ6uhNlrgNKsqUvjbkWtV3rM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XfW7SoC/6OeafIOUwfDzDrpOpwlMPPNsPEB0jrrxu73vYk8wC2Z3K38FJCzw0zOkS
	 W8ePslNKV+0xbr51WZJMfkPAREKtWN1Mzs15A0K3BxFNAvRJ9IJawraS9scAnc2Imr
	 Q+fCeZ+bthuxaAo4f+vJ3BOo4jYvJhoThzhxfnGIVKUXZg4XYM8a7I5zvoviCmO1A3
	 3bfoGvq13Eqpr9rwYQRzn0cSJ32ZscVu/w4Y72Lsw6vfdKaIMU/HKAt1366GxThh0k
	 tmfnd8atfye4GTw9aBpAMiAPbi6kXWkLkpXJIAb27kR+9YdY5ZU2ZVFiI6ItqyyF00
	 J24/pcpiC2qvxjLtXbzvE1WbbIfXT3KTr4JF8mLGdOiZfAo0k9+UHkQ/JrDwBhJcux
	 q3+/1xoXMscl/Ja9/LYYbsnRPzKeu06ZChxp11IW20CMtYz1RMtYMH/z9xCZxDlWBR
	 ptqifV90rP5eqSB8xFVUw5ATd33I/MBiLnkB880g5K4+3IWD7NhxD5edUJDA0buNmI
	 tlrKkFdKfOXtrrXthTabBvm/4xoxoMMyOv4H1BTc1NQ802XA989TCu3Ts7bqwcmrsP
	 OMz8z08nDoiFCFSmeAaCoSk1hABiJecaq97/tIhGkgDx5TQiICxqPthKHwVYGkOSRF
	 CLNlz7rTxq//ljH1h056DvX4=
Date: Fri, 1 Mar 2024 21:24:48 +0100
From: Neowutran <xen@neowutran.ovh>
To: Jan Beulich <jbeulich@suse.com>
Cc: Neowutran <xen@neowutran.ovh>, xen-devel@lists.xenproject.org, 
	Anthony Perard <anthony.perard@citrix.com>, George Dunlap <george.dunlap@citrix.com>
Subject: Re: hvmloader - allow_memory_relocate overlaps
Message-ID: <qlc7q5dm2o5jeaodayvxpokhm6f3idjkh5pgmca3gy7jgurmnl@gwttnbtl32lr>
References: <7oe275z3eap7rhdwmrm4mvqnjnhrpag5cjwnfvwsf7rchhkyjv@pd3abzwdhg6v>
 <217649a9-8399-48d3-ba49-ae22cacf0d4b@suse.com>
 <lyqv62ezqqaybcfuhkvbhiltvnxyy32wzr36kclh7bzrupcvib@a5fpoe6atykl>
 <1c857c96-9f2d-4787-8804-799a63a00480@suse.com>
 <7lhrvh2ad46gjke5kvy4pbvrhstv7ihwm64suqrkle4v43tos6@oktohrjfupkc>
 <6db70696-4b40-46d2-b19c-881820338ba4@suse.com>
 <56c24b5b-42a0-4022-bb14-f90a3881fdc1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <56c24b5b-42a0-4022-bb14-f90a3881fdc1@suse.com>

On 2024-02-07 16:02, Jan Beulich wrote:
> On 04.01.2024 14:16, Jan Beulich wrote:
> > On 22.12.2023 16:49, Neowutran wrote:
> >> Full logs without my patch to set allow-memory-relocate (https://github.com/neowutran/qubes-vmm-xen/blob/allowmemoryrelocate/ALLOWMEMORYRELOCATE.patch)
> >> https://pastebin.com/g 
> >> QGg55WZ
> >> (GPU passthrough doesn't work, hvmloader overlaps with guest memory)
> > 
> > So there are oddities, but I can't spot any overlaps. What's odd is that
> > the two blocks already above 4Gb are accounted for (and later relocated)
> > when calculating total MMIO size. BARs of size 2Gb and more shouldn't be
> > accounted for at all when deciding whether low RAM needs relocating, as
> > those can't live below 4Gb anyway. I vaguely recall pointing this out
> > years ago, but it was thought we'd get away for a fair while. What's
> > further odd is where the two blocks are moved to: F800000 moves (down)
> > to C00000, while the smaller FC00000 moves further up to FC80000.
> > 
> > I'll try to get to addressing at least the first oddity; if I can figure
> > out why the second one occurs, I may try to address that as well.
> 
> Could you give the patch below a try? I don't have a device with large
> enough a BAR that I could sensibly pass through to a guest, so I was
> only able to build-test the change.

Hi and thanks,
I just tested it, it indeed work well when the GPU have bar > 1Go. 

------------
Setup: 
I removed my patch 
(


--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -2431,6 +2431,10 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
                                        libxl__xs_get_dompath(gc, guest_domid)),
                         "%s",
                         libxl_bios_type_to_string(guest_config->b_info.u.hvm.bios));
+        libxl__xs_printf(gc, XBT_NULL,
+                         libxl__sprintf(gc, "%s/hvmloader/allow-memory-relocate", libxl__xs_get_dompath(gc, guest_domid)),
+                         "%d",
+                         0);
     }
     ret = xc_domain_set_target(ctx->xch, dm_domid, guest_domid);
     if (ret<0) {


)
and applied your suggested "skip huge BARs" patch. 
My GPU: nvidia 4080
-------------

When the option "Resizable BAR support" is activated in my bios,
the BAR1 size of my gpu is reported to be 16GB. With this patch, gpu
passthrough work. 

When the option "Resizable BAR support" is desactivated in my bios,
the BAR1 size of my gpu is reported to be 256MB. With this patch,
gpu passthrough doesn't work (same crash as before)


( note: the option "Resizable BAR support" may or may not exist
depending on the motherboard model, on some it is 'hardcoded' to
activated, on some it is 'hardcoded' to desactivated)

> Jan
> 
> hvmloader/PCI: skip huge BARs in certain calculations
> 
> BARs of size 2Gb and up can't possibly fit below 4Gb: Both the bottom of
> the lower 2Gb range and the top of the higher 2Gb range have special
> purpose. Don't even have them influence whether to (perhaps) relocate
> low RAM.
> 
> Reported-by: Neowutran <xen@neowutran.ovh>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> If we wanted to fit e.g. multiple 1Gb BARs, it would likely be prudent
> to similarly avoid low RAM relocation in the first place. Yet accounting
> for things differently depending on many large BARs there are would
> require more intrusive code changes.
> 
> That said, I'm open to further lowering of the threshold. That'll
> require different justification then, though.
> 
> --- a/tools/firmware/hvmloader/pci.c
> +++ b/tools/firmware/hvmloader/pci.c
> @@ -33,6 +33,13 @@ uint32_t pci_mem_start = HVM_BELOW_4G_MM
>  const uint32_t pci_mem_end = RESERVED_MEMBASE;
>  uint64_t pci_hi_mem_start = 0, pci_hi_mem_end = 0;
>  
> +/*
> + * BARs larger than this value are put in 64-bit space unconditionally.  That
> + * is, such BARs also don't play into the determination of how big the lowmem
> + * MMIO hole needs to be.
> + */
> +#define HUGE_BAR_THRESH GB(1)
> +
>  enum virtual_vga virtual_vga = VGA_none;
>  unsigned long igd_opregion_pgbase = 0;
>  
> @@ -286,9 +293,11 @@ void pci_setup(void)
>              bars[i].bar_reg = bar_reg;
>              bars[i].bar_sz  = bar_sz;
>  
> -            if ( ((bar_data & PCI_BASE_ADDRESS_SPACE) ==
> -                  PCI_BASE_ADDRESS_SPACE_MEMORY) ||
> -                 (bar_reg == PCI_ROM_ADDRESS) )
> +            if ( is_64bar && bar_sz > HUGE_BAR_THRESH )
> +                bar64_relocate = 1;
> +            else if ( ((bar_data & PCI_BASE_ADDRESS_SPACE) ==
> +                       PCI_BASE_ADDRESS_SPACE_MEMORY) ||
> +                      (bar_reg == PCI_ROM_ADDRESS) )
>                  mmio_total += bar_sz;
>  
>              nr_bars++;
> @@ -367,7 +376,7 @@ void pci_setup(void)
>              pci_mem_start = hvm_info->low_mem_pgend << PAGE_SHIFT;
>      }
>  
> -    if ( mmio_total > (pci_mem_end - pci_mem_start) )
> +    if ( mmio_total > (pci_mem_end - pci_mem_start) || bar64_relocate )
>      {
>          printf("Low MMIO hole not large enough for all devices,"
>                 " relocating some BARs to 64-bit\n");
> @@ -446,8 +455,9 @@ void pci_setup(void)
>           *   the code here assumes it to be.)
>           * Should either of those two conditions change, this code will break.
>           */
> -        using_64bar = bars[i].is_64bar && bar64_relocate
> -            && (mmio_total > (mem_resource.max - mem_resource.base));
> +        using_64bar = bars[i].is_64bar && bar64_relocate &&
> +            (mmio_total > (mem_resource.max - mem_resource.base) ||
> +             bar_sz > HUGE_BAR_THRESH);
>          bar_data = pci_readl(devfn, bar_reg);
>  
>          if ( (bar_data & PCI_BASE_ADDRESS_SPACE) ==
> @@ -467,7 +477,8 @@ void pci_setup(void)
>                  resource = &mem_resource;
>                  bar_data &= ~PCI_BASE_ADDRESS_MEM_MASK;
>              }
> -            mmio_total -= bar_sz;
> +            if ( bar_sz <= HUGE_BAR_THRESH )
> +                mmio_total -= bar_sz;
>          }
>          else
>          {
> 



