Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 033394ED916
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 14:00:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296897.505547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZtT2-0006IE-Tq; Thu, 31 Mar 2022 11:59:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296897.505547; Thu, 31 Mar 2022 11:59:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZtT2-0006Fn-Qp; Thu, 31 Mar 2022 11:59:56 +0000
Received: by outflank-mailman (input) for mailman id 296897;
 Thu, 31 Mar 2022 11:59:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZIho=UK=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1nZtT0-0006Fh-Ke
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 11:59:54 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11e52b6b-b0ea-11ec-a405-831a346695d4;
 Thu, 31 Mar 2022 13:59:52 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id AAAB65C0158;
 Thu, 31 Mar 2022 07:59:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 31 Mar 2022 07:59:50 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 31 Mar 2022 07:59:50 -0400 (EDT)
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
X-Inumbo-ID: 11e52b6b-b0ea-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=lDbZgsxIIeNbo+B49
	jvK6OmafuHV6dWbW9wBQx5FHDA=; b=J4M4wHmeFD1KxqiBuzglrZ+lYMgSQPY9b
	YAxyTq/JhBzsQD+HqxQWhcpbdc5bFJRFc9CMbBUtzrYQwy1Q3IfDjmN2ftUbdLPO
	+Sb3NsUzKuToeeqwV/XiB+xwqT0MklAOYL3+QB4g98uBDC6h6X1LkmXItIloXihM
	U6DcAlwmLqChlG43FVn8be+QxoswIXpW5qU8Xca2bmmMBm7D6wUnBoyNPh6vlIDB
	AJIeMl6jC7UXvheDQd/Q6714QFItVueIZ205t+SayUDN/DTyhIYnfHq+61euVU0s
	DVh9Dz4KT/V+NJ7C+GgHDXL4XQPiLYvYiKawTPBfirkCvRZPpWbTg==
X-ME-Sender: <xms:tpdFYks3Z9KWxiW9_Qfi_EKBsEHi4MK66zndP9WjyisuHgO6tIvcxg>
    <xme:tpdFYhcJupzW912KAZ0XXzvsIVa1x0I2SdGB87y0qTLd8-BLcPCUUPDwfFRS0c90S
    oaIu31XFIAF65g>
X-ME-Received: <xmr:tpdFYvzg9Cn2WJ2a-TwvYZEa0-e48u-RvvQUDQ4-s-3ztsyA1mKslD7sJKp0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeigedggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedttedtueeivdefiedugfejtdeutdel
    fedvueekledtudegjedviedukeefhfeuteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:tpdFYnOfmRSpqg_3PzqDfSyJOHZpqJ2696jr76DUSvJTUSe-j6xomw>
    <xmx:tpdFYk_68b42UuLy4i_f3pfVtb7WFFeIofr9Abdfqq1ebV_wge5i8w>
    <xmx:tpdFYvUppXfVrkrpIae7ty_8fvIcSurRBf5En2vA6KbkBDkkipucow>
    <xmx:tpdFYtKnt8jgUSnWZB1P04d92nobeXFw0XYXvMLgqCBlulleaWDPsw>
Date: Thu, 31 Mar 2022 07:57:56 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] Grab the EFI System Resource Table and check it
Message-ID: <YkWXszMR0/b3BcZg@itl-email>
References: <YkS3FthpZU0xQ2Y7@itl-email>
 <783D6789-9BC6-49BC-8345-478A862083E2@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Wu1PtQnvB+OmM4YK"
Content-Disposition: inline
In-Reply-To: <783D6789-9BC6-49BC-8345-478A862083E2@arm.com>


--Wu1PtQnvB+OmM4YK
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 31 Mar 2022 07:57:56 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] Grab the EFI System Resource Table and check it

On Thu, Mar 31, 2022 at 07:04:34AM +0000, Luca Fancellu wrote:
> Hi,
>=20
> >=20
> > diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> > index 458cfbbed4..398a2411a1 100644
> > --- a/xen/arch/arm/efi/efi-boot.h
> > +++ b/xen/arch/arm/efi/efi-boot.h
> > @@ -187,7 +187,8 @@ static bool __init meminfo_add_bank(struct meminfo =
*mem,
> >=20
> > static EFI_STATUS __init efi_process_memory_map_bootinfo(EFI_MEMORY_DES=
CRIPTOR *map,
> >                                                 UINTN mmap_size,
> > -                                                UINTN desc_size)
> > +                                                UINTN desc_size,
> > +                                                const EFI_MEMORY_DESCR=
IPTOR *const esrt_desc)
> > {
> >     int Index;
> >     EFI_MEMORY_DESCRIPTOR *desc_ptr =3D map;
> > @@ -199,6 +200,7 @@ static EFI_STATUS __init efi_process_memory_map_boo=
tinfo(EFI_MEMORY_DESCRIPTOR *
> >               desc_ptr->Type =3D=3D EfiLoaderCode ||
> >               desc_ptr->Type =3D=3D EfiLoaderData ||
> >               (!map_bs &&
> > +               desc !=3D esrt_desc &&
>=20
> I was going to test it but this line is breaking arm build.

Not too surprising; I don=E2=80=99t think I actually built this for ARM.  C=
an
you post the error you get?  I=E2=80=99ll send a v3 once that is fixed.

> >                (desc_ptr->Type =3D=3D EfiBootServicesCode ||
> >                 desc_ptr->Type =3D=3D EfiBootServicesData))) )
> >         {
> >=20
>=20
> I see CC list is pretty small, did you forget to add the maintainers?

Yeah, I did indeed forget.

> Cheers,
> Luca
>=20

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--Wu1PtQnvB+OmM4YK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmJFl7IACgkQsoi1X/+c
IsHTRhAAlUkks26pVs/P6n+tdFMNSXQ3Fc69bDDNxUrlr9pAxGLrGByHARjNeNHH
+p5sfr7WVhDfcytHIAIWTgM3g3iaU4QN08gHQFcbtGmGDJEJ3QL2JH/k8dYTpC0s
8ZhPZcSDF4Ouhn05hyarIwLvJKBtx59X0Ekn8KIvOveZwh7uGtjZTmkhfkLZ7kij
tFX5cnhCxXdon6FzrK//y0GxlddJXM9TVk5pd2DJR7x9kMaczRvAJ6U6idaqioKY
Ccd7UM70lbPqdSfelwrNfe6AMyTRJVM6tE/qriHDAKzYYk6MD2xp+zjOT1BxUx9x
2eH69gPxNvfI/K/0sduZx0Y01Js5HRp1bMXdZcev5t/52nZ2zyasKbR+46YHsOBi
AWLFuAfZ+k480Fp+/UFPIGsuQkIQ1SBrRHfd8VM8V2kw1naWKL4e3lT+/j1nREyx
lQnmUwaSjRfUIkzoanfQsDtthOZged8vVkmoVyCKt4yq60t1cI7FvlbOytEsEPh8
eMefvJTKmLWbW2IMrpiiIUq1vFlv2aJcYoOmKUnb/Qk4Yzv/KUZbF5mRud1/nXnH
VKK23cXdTtV1rhLaiuTbVkHwGO2ah9kh7PsqcAJhlRKQN7FBZK/4EaAf4snm7kPr
CeNER+35nNa4O1EvkQ62YfniyX4Dr6wQADzUXA4+6zT54hp9+Mc=
=YA3H
-----END PGP SIGNATURE-----

--Wu1PtQnvB+OmM4YK--

