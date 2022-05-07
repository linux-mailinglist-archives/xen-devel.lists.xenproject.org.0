Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9D651E41A
	for <lists+xen-devel@lfdr.de>; Sat,  7 May 2022 06:27:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323571.545296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnC1z-0006Ev-PF; Sat, 07 May 2022 04:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323571.545296; Sat, 07 May 2022 04:26:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnC1z-0006CK-LO; Sat, 07 May 2022 04:26:59 +0000
Received: by outflank-mailman (input) for mailman id 323571;
 Sat, 07 May 2022 04:26:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iHlD=VP=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1nnC1x-0006CE-FJ
 for xen-devel@lists.xenproject.org; Sat, 07 May 2022 04:26:57 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec6a3549-cdbd-11ec-8fc4-03012f2f19d4;
 Sat, 07 May 2022 06:26:55 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id AAC565C00D4;
 Sat,  7 May 2022 00:26:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sat, 07 May 2022 00:26:53 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 May 2022 00:26:53 -0400 (EDT)
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
X-Inumbo-ID: ec6a3549-cdbd-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651897613; x=
	1651984013; bh=UjF4a0x/jI5KpzirwbXr3IlpbRiot7nUSen/bltVqso=; b=P
	wPcP1SILJ7ZGyel76cqDNTaRG8hPf0Y8rqeMMJdJWZA7YkBvesqugCxHdYb6qdUZ
	ZvTYycivdB8x7WKYzPYBLPFpqldtYBSaFli36es/IG1jssTdkSMhgB+yCFvrH3hL
	Lg9E3S4iRGjp7igVwqNv+wsJXat0eFT5IllJEAO2qg2nZWiTyAGM2afs7i3QW2Bx
	wBFX5rG8jNsGlK58o15AiOyqhC2p7nle+R+KKEn5NlxkLwmZp0vTqGlLowcTH71y
	+mGWGvuVfD5m+doPpen4OhChwL97ywFZvgCgTfNquNL5GVPp93TVk3T/mlkIGZGn
	CFx5dLL+jiC6gCVW1sUFg==
X-ME-Sender: <xms:DfV1YpuF2DgQlgBbPAl8LWrErY6ZfG7DbRfbmti1Yqrgbye1neOTfg>
    <xme:DfV1YidBFJlUoTmDqxOQV3vmc51YoogTHFha7Iu4STkYKteUcSLO_-4IQ7FD5W5_j
    yAF7THV52us8Ks>
X-ME-Received: <xmr:DfV1YswffTkmSi1U9RXalNX55dO_f-6KRnS7C5_f9EJ4EgDZkAVgbffCgJNy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeggdejlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeetgeekhfetudfhgfetffegfffg
    uddvgffhffeifeeikeektdehgeetheffleenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:DfV1YgM-y2EBUZVjtltFYaEe1qZkqViAKFYS_ykCRqIkzbDGSk9T8A>
    <xmx:DfV1Yp_dRz7OOUGs9Rzln5HZjFDSoXEqGD7EPu-KcVWxx1L1bIKrIw>
    <xmx:DfV1YgXTMMfYcT75INMRmHwtEEIMVcFPlDZ9Yk2YJRiwRL_Mxcsy9w>
    <xmx:DfV1YuLRemMWL8seSYmK1zHKp3qtGXPExDiacJfVZUyEoBOJCa8Zvg>
Date: Sat, 7 May 2022 00:26:48 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4] Preserve the EFI System Resource Table for dom0
Message-ID: <YnX1CxHVBT2jNE45@itl-email>
References: <YnNi7iW2s5jsJIiA@itl-email>
 <f06cbdd3-06d5-dd72-88d5-477cabf65b45@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sIQBc1dY37ee9/6a"
Content-Disposition: inline
In-Reply-To: <f06cbdd3-06d5-dd72-88d5-477cabf65b45@suse.com>


--sIQBc1dY37ee9/6a
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 7 May 2022 00:26:48 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4] Preserve the EFI System Resource Table for dom0

On Fri, May 06, 2022 at 12:59:05PM +0200, Jan Beulich wrote:
> On 05.05.2022 07:38, Demi Marie Obenour wrote:
> > @@ -1056,13 +1091,11 @@ static void __init efi_exit_boot(EFI_HANDLE Ima=
geHandle, EFI_SYSTEM_TABLE *Syste
> >      EFI_STATUS status;
> >      UINTN info_size =3D 0, map_key;
> >      bool retry;
> > -#ifdef CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP
> >      unsigned int i;
> > -#endif
> > =20
> >      efi_bs->GetMemoryMap(&info_size, NULL, &map_key,
> >                           &efi_mdesc_size, &mdesc_ver);
> > -    info_size +=3D 8 * efi_mdesc_size;
> > +    info_size +=3D 8 * (efi_mdesc_size + 1);
>=20
> I think I did ask on an earlier version already why you're making this
> change. It continues to look to me like a leftover which was needed by
> an early version only.

Will revert in v5.

> > @@ -1077,6 +1110,35 @@ static void __init efi_exit_boot(EFI_HANDLE Imag=
eHandle, EFI_SYSTEM_TABLE *Syste
> >          if ( EFI_ERROR(status) )
> >              PrintErrMesg(L"Cannot obtain memory map", status);
> > =20
> > +        for ( i =3D 0; i < efi_memmap_size; i +=3D efi_mdesc_size )
> > +        {
> > +            if ( !is_esrt_valid(efi_memmap + i) )
> > +                continue;
>=20
> Instead of repeating the size calculation below, could you make the
> function (with an altered name) simply return the size (and zero if
> not [valid] ESRT), simplifying things below?

Will fix in v5.

> > +            if ( ((EFI_MEMORY_DESCRIPTOR *)(efi_memmap + i))->Type !=3D
> > +                 EfiRuntimeServicesData )
> > +            {
> > +                /* ESRT needs to be moved to memory of type EfiRuntime=
ServicesData
> > +                 * so that the memory it is in will not be used for ot=
her purposes */
>=20
> Nit: Comment style.

Will fix in v5.

> > +                size_t esrt_size =3D offsetof(ESRT, Entries) +
> > +                    ((ESRT *)esrt)->Count * sizeof(ESRT_ENTRY);
> > +                void *new_esrt =3D NULL;
> > +                status =3D efi_bs->AllocatePool(EfiRuntimeServicesData=
, esrt_size, &new_esrt);
>=20
> Nit: Please have a blank line between declaration(s) and statement(s).

Will fix in v5.

> > +                if ( status !=3D EFI_SUCCESS )
> > +                {
> > +                    PrintErrMesg(L"Cannot allocate memory for ESRT", s=
tatus);
>=20
> Neither this nor ...
>=20
> > +                    break;
> > +                }
> > +                memcpy(new_esrt, (void *)esrt, esrt_size);
> > +                status =3D efi_bs->InstallConfigurationTable(&esrt_gui=
d, new_esrt);
> > +                if ( status !=3D EFI_SUCCESS )
> > +                {
> > +                    PrintErrMesg(L"Cannot install new ESRT", status);
> > +                    efi_bs->FreePool(new_esrt);
>=20
> ... this ought to be fatal to the booting of Xen. Yet PrintErrMesg()
> ends in blexit().

Whoops!  I did not realized PrintErrMsg() was fatal.

> > +                }
> > +            }
> > +            break;
> > +        }
> > +
> >          efi_arch_process_memory_map(SystemTable, efi_memmap, efi_memma=
p_size,
> >                                      efi_mdesc_size, mdesc_ver);
>=20
> The allocation may have altered the memory map and hence invalidated what
> was retrieved just before. You'd need to "continue;" without setting
> "retry" to true, but then the question is why you make this allocation
> after retrieving the memory map in the first place. It's not entirely
> clear to me if it can be done _much_ earlier (if it can, doing it earlier
> would of course be better), but since you need to do it before
> ExitBootServices() anyway, and since you will need to call GetMemoryMap()
> afterwards again, you could as well do it before calling GetMemoryMap().

This would mean the allocation would need to be unconditional.  Right
now, I avoid the allocation if it is not necessary.

> > --- a/xen/common/efi/efi.h
> > +++ b/xen/common/efi/efi.h
> > @@ -10,6 +10,23 @@
> >  #include <xen/spinlock.h>
> >  #include <asm/page.h>
> > =20
> > +typedef struct _ESRT_ENTRY {
> > +    EFI_GUID FwClass;
> > +    UINT32 FwType;
> > +    UINT32 FwVersion;
> > +    UINT32 FwLowestSupportedVersion;
> > +    UINT32 FwCapsuleFlags;
> > +    UINT32 FwLastAttemptVersion;
> > +    UINT32 FwLastAttemptStatus;
> > +} ESRT_ENTRY;
> > +
> > +typedef struct _ESRT {
> > +    UINT32 Count;
> > +    UINT32 Max;
> > +    UINT64 Version;
> > +    ESRT_ENTRY Entries[];
> > +} ESRT;
>=20
> I'm pretty sure I did indicate before that types used in just a single
> source file should be put in that source file, unless we obtain them
> by importing a header (e.g. the ones in include/efi/) from elsewhere.

Will fix in v5.

> > --- a/xen/common/efi/runtime.c
> > +++ b/xen/common/efi/runtime.c
> > @@ -269,7 +269,7 @@ int efi_get_info(uint32_t idx, union xenpf_efi_info=
 *info)
> >      case XEN_FW_EFI_MEM_INFO:
> >          for ( i =3D 0; i < efi_memmap_size; i +=3D efi_mdesc_size )
> >          {
> > -            EFI_MEMORY_DESCRIPTOR *desc =3D efi_memmap + i;
> > +            const EFI_MEMORY_DESCRIPTOR *desc =3D efi_memmap + i;
> >              u64 len =3D desc->NumberOfPages << EFI_PAGE_SHIFT;
> > =20
> >              if ( info->mem.addr >=3D desc->PhysicalStart &&
>=20
> With the restructured approach I don't think this stray change should
> be left in here anymore. Or am I overlooking anything requiring this
> adjustment?

It=E2=80=99s a trivial cleanup but I can get rid of it.

> > --- a/xen/include/efi/efiapi.h
> > +++ b/xen/include/efi/efiapi.h
> > @@ -882,6 +882,9 @@ typedef struct _EFI_BOOT_SERVICES {
> >  #define SAL_SYSTEM_TABLE_GUID    \
> >      { 0xeb9d2d32, 0x2d88, 0x11d3, {0x9a, 0x16, 0x0, 0x90, 0x27, 0x3f, =
0xc1, 0x4d} }
> > =20
> > +#define ESRT_GUID    \
> > +    { 0xb122a263, 0x3661, 0x4f68, {0x99, 0x29, 0x78, 0xf8, 0xb0, 0xd6,=
 0x21, 0x80} }
>=20
> Like above I'm pretty sure I did ask that you do not alter this
> imported header. If gnu-efi now has these definitions, we should
> import them all in one go (i.e. then the two struct declarations
> would also want to go into their appropriate place under include/efi/.
> Otherwise this wants putting next to the other GUIDs defined in
> boot.c.

Will fix in v5.

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--sIQBc1dY37ee9/6a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmJ19QwACgkQsoi1X/+c
IsFS5RAA0P8Hl2FV9XnN6W5BN591niY0nEeEW+804VSnesT0pTrhjbhLFP10SV21
a4ubt6aRhEJN5CxAmq3kX+D28JYIEE3UC+HB0V66UnsRoBZTKXs298fzijNxJ7rw
a5GqIdQOWXjaNEoyAMN7cdLNo1MdDo60MjsNnIP4SAp7ppOKcPvFDSrUkBsIuWcX
MwzGafQPuML1b1BQj6sZWknTcZbE6uhCXw4zncelIptKRDjk6QaRYbTWti+Xtm/d
RPmhLSwwOSE5JgEQKZ7CvhKnDT7DEvsZvnZf0MmXf8aSdFZLXFt8bER61avHgBCG
3MMV8LtPo7nkASDWS9f32Q+bFApdC4iE3gFtM+VfGHicyptEg1gw89P3WmX49FyR
wFpQ/v+vSn1+CoXmopioUx5AyrWfRbh33iN9j0T2IPq6tpkAGso/EQVOV2R/LY9X
YI2b5g/KSzXuRV7Aqj+cU2Mj3gCAR5ifbDUc4AnmxXsY+uFA98w2E5deK1MMfrAM
adXgdXfyAGmuW9el7HP4w8zW2EZZzTjWsDuCF4UVW4igxJ4hz45w7PuyutM3/5yz
ub2LEWilq9ub5710seI7YEy9EReM+aoE/2U3DmJ5ftBi8xiuZbB6jNGa+BykY4ei
1FzXe684SMjkWPg/0kKrE4sfdyTSWPCAMWiKgMHDPAO75jD0OHM=
=VTnj
-----END PGP SIGNATURE-----

--sIQBc1dY37ee9/6a--

