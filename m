Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D67B85F3300
	for <lists+xen-devel@lfdr.de>; Mon,  3 Oct 2022 17:58:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414939.659382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofNpL-0004CE-IQ; Mon, 03 Oct 2022 15:57:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414939.659382; Mon, 03 Oct 2022 15:57:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofNpL-00048o-Fl; Mon, 03 Oct 2022 15:57:55 +0000
Received: by outflank-mailman (input) for mailman id 414939;
 Mon, 03 Oct 2022 15:57:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1PaK=2E=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1ofNpK-00048i-0a
 for xen-devel@lists.xenproject.org; Mon, 03 Oct 2022 15:57:54 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22d0fcab-4334-11ed-9377-c1cf23e5d27e;
 Mon, 03 Oct 2022 17:57:52 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8E464B8118C
 for <xen-devel@lists.xenproject.org>; Mon,  3 Oct 2022 15:57:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA104C43142
 for <xen-devel@lists.xenproject.org>; Mon,  3 Oct 2022 15:57:49 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id z4so17246682lft.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Oct 2022 08:57:49 -0700 (PDT)
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
X-Inumbo-ID: 22d0fcab-4334-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664812669;
	bh=HK0PyG2JOynGOGBkEbuAK3OGKXVMbzzRaU3W5vyNt+4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AQMIy+gZU0FZvbsFZaA/iufqEOae9NC0wo+dRflAhYnC6jnM8qSAMMBMY+3W28QKZ
	 kRwJYifri5QB9yfwmbwltmeQRWrijo0neN4OzKpExGNS60zUst3JDaOz9Nkjln/KTo
	 SoYQcATvD+6B3JC7uJA5ZWuFhPXPGwjdlWyFmV7TdIprBNkBfsC21GZ50M9btExCZa
	 TCJV52bpxRJTRoU/N+YlX8Lo02hgoxge/+vYcEnQo7jAUcPJr407xs5RjvWJoAtIT2
	 dZseqkmkGvasBrxYV6hUGHAj2Vgo+N6nhSFfen709qiFlb9Gxs3jCwjNIyibuhvO34
	 IXEA13xKVue3A==
X-Gm-Message-State: ACrzQf0l5VVDuLzwNVZUqki+/jlaMho4eP8F8hBl1Mbu+D3xdzXCXQyi
	XO1Q71ZNv/+vy+z5kMiBPVyGKJzNq+G28FMKIrA=
X-Google-Smtp-Source: AMsMyM5zBei2ibLZSe5zBohqN76AF5p5VnNKqtesYDF5KeePFuwB202Vk4nYzh88dwPErgPxMR/ChrhAsD0uBYHKM5o=
X-Received: by 2002:a05:6512:261b:b0:4a1:abd7:3129 with SMTP id
 bt27-20020a056512261b00b004a1abd73129mr7960216lfb.637.1664812667660; Mon, 03
 Oct 2022 08:57:47 -0700 (PDT)
MIME-Version: 1.0
References: <20221003112625.972646-1-ardb@kernel.org> <20221003112625.972646-5-ardb@kernel.org>
 <Yzr9R2ziBAJgzAqR@itl-email>
In-Reply-To: <Yzr9R2ziBAJgzAqR@itl-email>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 3 Oct 2022 17:57:36 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHjZRdhNdBjCJkmY16a005+wSemceWWLStDWEBywUp7uA@mail.gmail.com>
Message-ID: <CAMj1kXHjZRdhNdBjCJkmY16a005+wSemceWWLStDWEBywUp7uA@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] efi: memmap: Disregard bogus entries instead of
 returning them
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: linux-efi@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Peter Jones <pjones@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Kees Cook <keescook@chromium.org>, 
	Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Oct 2022 at 17:18, Demi Marie Obenour
<demi@invisiblethingslab.com> wrote:
>
> On Mon, Oct 03, 2022 at 01:26:23PM +0200, Ard Biesheuvel wrote:
> > The ESRT code currently contains some sanity checks on the memory
> > descriptor it obtains, but these can only trigger when the descriptor is
> > invalid (if at all).
> >
> > So let's drop these checks, and instead, disregard descriptors entirely
> > if the start address is misaligned, or the number of pages reaches
> > beyond the end of the address space. Note that the memory map as a whole
> > could still be inconsistent, i.e., multiple entries might cover the same
> > area, or the address could be outside of the addressable VA space, but
> > validating that goes beyond the scope of these helpers.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  drivers/firmware/efi/efi.c  | 13 +++++++------
> >  drivers/firmware/efi/esrt.c | 18 +-----------------
> >  2 files changed, 8 insertions(+), 23 deletions(-)
> >
> > diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
> > index 11857af72859..55bd3f4aab28 100644
> > --- a/drivers/firmware/efi/efi.c
> > +++ b/drivers/firmware/efi/efi.c
> > @@ -461,19 +461,20 @@ int efi_mem_desc_lookup(u64 phys_addr, efi_memory_desc_t *out_md)
> >       efi_memory_desc_t *md;
> >
> >       if (!efi_enabled(EFI_MEMMAP)) {
> > -             pr_err_once("EFI_MEMMAP is not enabled.\n");
> > +             pr_warn_once("EFI_MEMMAP is not enabled.\n");
> >               return -EINVAL;
> >       }
> >
> > -     if (!out_md) {
> > -             pr_err_once("out_md is null.\n");
> > -             return -EINVAL;
> > -        }
> > -
>
> Nit: this seems unrelated.
>
> >       for_each_efi_memory_desc(md) {
> >               u64 size;
> >               u64 end;
> >
> > +             /* skip bogus entries */
> > +             if ((md->phys_addr & (EFI_PAGE_SIZE - 1)) ||
> > +                 (md->phys_addr > 0 &&
> > +                  (md->num_pages > (U64_MAX - md->phys_addr + 1) >> EFI_PAGE_SHIFT)))
> > +                     continue;
>
> Should this also check if md->num_pages is 0?

Yes, probably.

>  Also, should this check
> be part of for_each_efi_memory_desc()?
>

No, I don't think so. The for_each_xxx() helpers we have throughout
the kernel usually don't incorporate such checks, and I'd prefer to
adhere to the principle of least surprise here.

> > +
> >               size = md->num_pages << EFI_PAGE_SHIFT;
> >               end = md->phys_addr + size;
> >               if (phys_addr >= md->phys_addr && phys_addr < end) {
> > diff --git a/drivers/firmware/efi/esrt.c b/drivers/firmware/efi/esrt.c
> > index 2a2f52b017e7..8f86f2b0734b 100644
> > --- a/drivers/firmware/efi/esrt.c
> > +++ b/drivers/firmware/efi/esrt.c
> > @@ -247,9 +247,6 @@ void __init efi_esrt_init(void)
> >       int rc;
> >       phys_addr_t end;
> >
> > -     if (!efi_enabled(EFI_MEMMAP))
> > -             return;
> > -
> >       pr_debug("esrt-init: loading.\n");
> >       if (!esrt_table_exists())
> >               return;
> > @@ -263,21 +260,8 @@ void __init efi_esrt_init(void)
> >               return;
> >       }
> >
> > -     max = efi_mem_desc_end(&md);
> > -     if (max < efi.esrt) {
> > -             pr_err("EFI memory descriptor is invalid. (esrt: %p max: %p)\n",
> > -                    (void *)efi.esrt, (void *)max);
> > -             return;
> > -     }
> > -
> > +     max = efi_mem_desc_end(&md) - efi.esrt;
> >       size = sizeof(*esrt);
> > -     max -= efi.esrt;
> > -
> > -     if (max < size) {
> > -             pr_err("ESRT header doesn't fit on single memory map entry. (size: %zu max: %zu)\n",
> > -                    size, max);
> > -             return;
> > -     }
>
> This can still happen if the ESRT pointer is very very close to the end
> of a memory map entry, unless there is another check that handles
> such cases.

You're right - I missed that.

