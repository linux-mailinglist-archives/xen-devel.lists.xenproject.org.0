Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2B65F2575
	for <lists+xen-devel@lfdr.de>; Sun,  2 Oct 2022 23:24:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414700.659052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1of6Qi-0007eb-5x; Sun, 02 Oct 2022 21:23:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414700.659052; Sun, 02 Oct 2022 21:23:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1of6Qi-0007bA-2u; Sun, 02 Oct 2022 21:23:20 +0000
Received: by outflank-mailman (input) for mailman id 414700;
 Sun, 02 Oct 2022 21:23:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gGO=2D=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1of6Qg-0007b4-1j
 for xen-devel@lists.xenproject.org; Sun, 02 Oct 2022 21:23:18 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bff718d-4298-11ed-9375-c1cf23e5d27e;
 Sun, 02 Oct 2022 23:23:14 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E870C60F49
 for <xen-devel@lists.xenproject.org>; Sun,  2 Oct 2022 21:23:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA81CC43140
 for <xen-devel@lists.xenproject.org>; Sun,  2 Oct 2022 21:23:11 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id o7so6833584lfk.7
 for <xen-devel@lists.xenproject.org>; Sun, 02 Oct 2022 14:23:11 -0700 (PDT)
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
X-Inumbo-ID: 6bff718d-4298-11ed-9375-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664745791;
	bh=0nNY8bCYUKoCFv7L9DxhKWtTW9KM4y+517wmHIAOs58=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NhOMyRznBbhA6BsLS63d0grbgr/ob9A1/EnJfFdIN2JJAnzrc71FV7Gy6Arty4L2T
	 +LfGqx41AfuldsgDDesSwpT9MLGgJa1auhABxu+6/BS7MtGbcLCOPeYrD7v0l/PzeT
	 3aVmZr4BpfZgJ+Svc89R6L+g4KFC/aSrChYtODfCDfWsnwppvFTZtt0xQ2gIYjlz0U
	 ocVOiRwkR6Mw4xAnX5dIX2QpZ+FRxe4gT0Np/LbkHEeuPdq6d2ZJFotbit9mr4dXz9
	 KBAK92Un0j/gIews+sWPBTF3zvF4JNT/GA4ts3kHym2bpJa5G3xfyfXFkL5o8+AGHn
	 keVgfvHkUddSw==
X-Gm-Message-State: ACrzQf3u1x7ugLdJw/NjzKpBwYAhFZarWNVfNo7Tc2fz02IFyfFdGEGn
	lwc8sTkFhI4TgWOLRB+ceDJf4qRkATDm8WMjMww=
X-Google-Smtp-Source: AMsMyM65/tOSFAGff3kubN/KRJEKo5eRy1SIh573DTKw2LTBa6vPYzy9QMui3K/FZnPpk1r072gHON+N+0xFncjh3MY=
X-Received: by 2002:a05:6512:150e:b0:492:d9fd:9bdf with SMTP id
 bq14-20020a056512150e00b00492d9fd9bdfmr6130056lfb.583.1664745789709; Sun, 02
 Oct 2022 14:23:09 -0700 (PDT)
MIME-Version: 1.0
References: <20221002095626.484279-1-ardb@kernel.org> <20221002095626.484279-5-ardb@kernel.org>
 <Yzm8H3iS7ziWsh7E@itl-email>
In-Reply-To: <Yzm8H3iS7ziWsh7E@itl-email>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 2 Oct 2022 23:22:58 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFWS0kXp7f75x=BDYDyTHKNzMCTZ_bXg7v23Aw=pJtSzQ@mail.gmail.com>
Message-ID: <CAMj1kXFWS0kXp7f75x=BDYDyTHKNzMCTZ_bXg7v23Aw=pJtSzQ@mail.gmail.com>
Subject: Re: [RFC PATCH 4/5] efi: Apply allowlist to EFI configuration tables
 when running under Xen
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: linux-efi@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Peter Jones <pjones@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Kees Cook <keescook@chromium.org>, 
	Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2 Oct 2022 at 18:28, Demi Marie Obenour
<demi@invisiblethingslab.com> wrote:
>
> On Sun, Oct 02, 2022 at 11:56:25AM +0200, Ard Biesheuvel wrote:
> > As it turns out, Xen does not guarantee that EFI bootservices data
> > regions in memory are preserved, which means that EFI configuration
> > tables pointing into such memory regions may be corrupted before the
> > dom0 OS has had a chance to inspect them.
> >
> > Demi Marie reports that this is causing problems for Qubes OS when it
> > attempts to perform system firmware updates, which requires that the
> > contents of the ESRT configuration table are valid when the fwupd user
> > space program runs.
> >
> > However, other configuration tables such as the memory attributes
> > table or the runtime properties table are equally affected, and so we
> > need a comprehensive workaround that works for any table type.
> >
> > So let's first disregard all EFI configuration tables except the ones
> > that are known (or can be expected) to reside in memory regions of a
> > type that Xen preserves, i.e., ACPI tables (which are passed in
> > EfiAcpiReclaimMemory regions) and SMBIOS tables (which are usually
> > passed in EfiRuntimeServicesData regions, even though the UEFI spec onl=
y
> > mentions this as a recommendation). Then, cross reference unknown table=
s
> > against either the EFI memory map (if available) or do a Xen hypercall
> > to determine the memory type, and allow the config table if the type is
> > one that is guaranteed to be preserved.
> >
> > Future patches can augment the logic in this routine to allow other
> > table types based on the size of the allocation, or based on a table
> > specific header size field.
> >
> > Co-developed-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> > Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  drivers/firmware/efi/efi.c |  7 ++
> >  drivers/xen/efi.c          | 69 ++++++++++++++++++++
> >  include/linux/efi.h        |  2 +
> >  3 files changed, 78 insertions(+)
> >
> > diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
> > index 11857af72859..e8c0747011d7 100644
> > --- a/drivers/firmware/efi/efi.c
> > +++ b/drivers/firmware/efi/efi.c
> > @@ -556,6 +556,13 @@ static __init int match_config_table(const efi_gui=
d_t *guid,
> >
> >       for (i =3D 0; efi_guidcmp(table_types[i].guid, NULL_GUID); i++) {
> >               if (!efi_guidcmp(*guid, table_types[i].guid)) {
> > +                     if (IS_ENABLED(CONFIG_XEN_EFI) &&
> > +                         !xen_efi_config_table_is_usable(guid, table))=
 {
> > +                             if (table_types[i].name[0])
> > +                                     pr_cont("(%s=3D0x%lx) ",
> > +                                             table_types[i].name, tabl=
e);
> > +                             return 1;
> > +                     }
> >                       *(table_types[i].ptr) =3D table;
> >                       if (table_types[i].name[0])
> >                               pr_cont("%s=3D0x%lx ",
> > diff --git a/drivers/xen/efi.c b/drivers/xen/efi.c
> > index d1ff2186ebb4..3f1f365b37d0 100644
> > --- a/drivers/xen/efi.c
> > +++ b/drivers/xen/efi.c
> > @@ -292,3 +292,72 @@ void __init xen_efi_runtime_setup(void)
> >       efi.get_next_high_mono_count    =3D xen_efi_get_next_high_mono_co=
unt;
> >       efi.reset_system                =3D xen_efi_reset_system;
> >  }
> > +
> > +static const efi_guid_t cfg_table_allow_list[] __initconst =3D {
> > +     ACPI_20_TABLE_GUID,
> > +     ACPI_TABLE_GUID,
> > +     SMBIOS_TABLE_GUID,
> > +     SMBIOS3_TABLE_GUID,
> > +};
>
> This allowlist seems redundant.  Either the tables are already in memory
> that Xen will preserve or they aren=E2=80=99t.  In both cases the subsequ=
ent
> code will do the right thing.

Will it? Currently, Xen simply accepts all ACPI and SMBIOS tables,
regardless of what type of memory region they reside in (if any).

So what will happen with buggy firmware where the ACPI or SMBIOS
tables are not covered by the memory map at all? Currently, this works
fine but now, it will be rejected. And without ACPI tables, the boot
will not get far enough to even inform the user what is wrong. And
SMBIOS tables are used for platform quirks, which means they might be
essential for a platform to boot as well.

