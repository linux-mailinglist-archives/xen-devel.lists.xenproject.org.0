Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 847505F330C
	for <lists+xen-devel@lfdr.de>; Mon,  3 Oct 2022 18:00:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414946.659393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofNrV-0005vm-VB; Mon, 03 Oct 2022 16:00:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414946.659393; Mon, 03 Oct 2022 16:00:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofNrV-0005ty-SK; Mon, 03 Oct 2022 16:00:09 +0000
Received: by outflank-mailman (input) for mailman id 414946;
 Mon, 03 Oct 2022 16:00:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1PaK=2E=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1ofNrU-0005tp-I1
 for xen-devel@lists.xenproject.org; Mon, 03 Oct 2022 16:00:08 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73958607-4334-11ed-9377-c1cf23e5d27e;
 Mon, 03 Oct 2022 18:00:07 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2DBE3B81189
 for <xen-devel@lists.xenproject.org>; Mon,  3 Oct 2022 16:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA6E7C43140
 for <xen-devel@lists.xenproject.org>; Mon,  3 Oct 2022 16:00:05 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id s17so1984455ljs.12
 for <xen-devel@lists.xenproject.org>; Mon, 03 Oct 2022 09:00:05 -0700 (PDT)
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
X-Inumbo-ID: 73958607-4334-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664812806;
	bh=B3UehTQ0iZXIQsaNP2ErI1eh7d2NC3uBWlqaRsGMZ7w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BXw7OlQOcO+Lx8ciDJvK2GtnPEJ0AZpgO283Cm2fktlMO2+6BvB2OuTxEl3xaZH2C
	 c9mNceRiW8qc4C4dNHDsdGwPZ0pG7Rn9hGJpp6T+usgF7Eyu5KW0OG04cI1nZaBUet
	 xtw2zxZ7idk/4zlf7yyhBGB9YVTMFuzcQK3cV7C1AGeKKd/XMsm0kOPUtDQbKJejQa
	 Mxrepr6uSvsudW/Rc7Kaypr/3+ej1kPNeG5aIVVvGnxFy43GbYn1pfNbjPVBDEvcry
	 5cn5eTvhHXStZXlxk0tkZUkYPLd988wkCfKuy8LejPlfkq8PJgOrzlyH613E8R58J2
	 z2AgqrQWaPiRA==
X-Gm-Message-State: ACrzQf1qLt2+QpeSMV3Y4mnP3tQlMDMPNFv9mmn6LjYacAMVEnewrkE/
	65xxIHIDCDO2gTDAGBAJr/E5BYR7WKAqYADEy24=
X-Google-Smtp-Source: AMsMyM76GdGG/AcxOxDqgV1MySSXcIQv5dlPIEhnRlae1lqaUkXnKMnbHbJddFJUo49QeKlaz0aBbFDJwBkdXRP+vlk=
X-Received: by 2002:a05:651c:1590:b0:26c:4311:9b84 with SMTP id
 h16-20020a05651c159000b0026c43119b84mr5010050ljq.152.1664812803907; Mon, 03
 Oct 2022 09:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <20221003112625.972646-1-ardb@kernel.org> <20221003112625.972646-6-ardb@kernel.org>
 <Yzr/1s9CbA0CClmt@itl-email>
In-Reply-To: <Yzr/1s9CbA0CClmt@itl-email>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 3 Oct 2022 17:59:52 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEXhDXRSnBp8P=urFj8UzzeRtYS9V8Tdt9GSrZTnGRFhA@mail.gmail.com>
Message-ID: <CAMj1kXEXhDXRSnBp8P=urFj8UzzeRtYS9V8Tdt9GSrZTnGRFhA@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] efi: xen: Implement memory descriptor lookup based
 on hypercall
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: linux-efi@vger.kernel.org, 
	Xen developer discussion <xen-devel@lists.xenproject.org>, Peter Jones <pjones@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Kees Cook <keescook@chromium.org>, 
	Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Oct 2022 at 17:29, Demi Marie Obenour
<demi@invisiblethingslab.com> wrote:
>
> On Mon, Oct 03, 2022 at 01:26:24PM +0200, Ard Biesheuvel wrote:
> > Xen on x86 boots dom0 in EFI mode but without providing a memory map.
> > This means that some sanity checks we would like to perform on
> > configuration tables or other data structures in memory are not
> > currently possible. Xen does, however, expose EFI memory descriptor info
> > via a Xen hypercall, so let's wire that up instead.
> >
> > Co-developed-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> > Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  drivers/firmware/efi/efi.c |  5 ++-
> >  drivers/xen/efi.c          | 34 ++++++++++++++++++++
> >  include/linux/efi.h        |  1 +
> >  3 files changed, 39 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
> > index 55bd3f4aab28..2c12b1a06481 100644
> > --- a/drivers/firmware/efi/efi.c
> > +++ b/drivers/firmware/efi/efi.c
> > @@ -456,7 +456,7 @@ void __init efi_find_mirror(void)
> >   * and if so, populate the supplied memory descriptor with the appropriate
> >   * data.
> >   */
> > -int efi_mem_desc_lookup(u64 phys_addr, efi_memory_desc_t *out_md)
> > +int __efi_mem_desc_lookup(u64 phys_addr, efi_memory_desc_t *out_md)
> >  {
> >       efi_memory_desc_t *md;
> >
> > @@ -485,6 +485,9 @@ int efi_mem_desc_lookup(u64 phys_addr, efi_memory_desc_t *out_md)
> >       return -ENOENT;
> >  }
> >
> > +extern int efi_mem_desc_lookup(u64 phys_addr, efi_memory_desc_t *out_md)
> > +      __weak __alias(__efi_mem_desc_lookup);
> > +
> >  /*
> >   * Calculate the highest address of an efi memory descriptor.
> >   */
> > diff --git a/drivers/xen/efi.c b/drivers/xen/efi.c
> > index d1ff2186ebb4..74f3f6d8cdc8 100644
> > --- a/drivers/xen/efi.c
> > +++ b/drivers/xen/efi.c
> > @@ -26,6 +26,7 @@
> >
> >  #include <xen/interface/xen.h>
> >  #include <xen/interface/platform.h>
> > +#include <xen/page.h>
> >  #include <xen/xen.h>
> >  #include <xen/xen-ops.h>
> >
> > @@ -292,3 +293,36 @@ void __init xen_efi_runtime_setup(void)
> >       efi.get_next_high_mono_count    = xen_efi_get_next_high_mono_count;
> >       efi.reset_system                = xen_efi_reset_system;
> >  }
> > +
> > +int efi_mem_desc_lookup(u64 phys_addr, efi_memory_desc_t *out_md)
> > +{
> > +     static_assert(XEN_PAGE_SHIFT == EFI_PAGE_SHIFT,
> > +                   "Mismatch between EFI_PAGE_SHIFT and XEN_PAGE_SHIFT");
> > +     struct xen_platform_op op = {
> > +             .cmd = XENPF_firmware_info,
> > +             .u.firmware_info = {
> > +                     .type = XEN_FW_EFI_INFO,
> > +                     .index = XEN_FW_EFI_MEM_INFO,
> > +                     .u.efi_info.mem.addr = phys_addr,
> > +                     .u.efi_info.mem.size = U64_MAX - phys_addr,
> > +             }
> > +     };
> > +     union xenpf_efi_info *info = &op.u.firmware_info.u.efi_info;
> > +     int rc;
> > +
> > +     if (!efi_enabled(EFI_PARAVIRT) || efi_enabled(EFI_MEMMAP))
> > +             return __efi_mem_desc_lookup(phys_addr, out_md);
> > +
> > +     rc = HYPERVISOR_platform_op(&op);
> > +     if (rc) {
> > +             pr_warn("Failed to lookup header 0x%llx in Xen memory map: error %d\n",
> > +                     phys_addr, rc);
> > +     }
> > +
> > +     out_md->phys_addr       = info->mem.addr;
>
> This will be equal to phys_addr, not the actual start of the memory
> region.
>
> > +     out_md->num_pages       = info->mem.size >> EFI_PAGE_SHIFT;
>
> Similarly, this will be the number of bytes in the memory region
> after phys_addr, not the total number of bytes in the region.  These two
> differences mean that this function is not strictly equivalent to the
> original efi_mem_desc_lookup().
>
> I am not sure if this matters in practice, but I thought you would want
> to be aware of it.

This is a bit disappointing. Is there no way to obtain this
information via a Xen hypercall?

In any case, it means we'll need to round down phys_addr to page size
at the very least.

