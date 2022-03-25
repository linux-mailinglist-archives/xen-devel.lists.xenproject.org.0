Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6F64E7B1D
	for <lists+xen-devel@lfdr.de>; Sat, 26 Mar 2022 00:11:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294968.501908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXt3t-0001u0-QB; Fri, 25 Mar 2022 23:09:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294968.501908; Fri, 25 Mar 2022 23:09:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXt3t-0001rG-My; Fri, 25 Mar 2022 23:09:41 +0000
Received: by outflank-mailman (input) for mailman id 294968;
 Fri, 25 Mar 2022 23:09:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R2Zm=UE=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1nXt3r-0001rA-DT
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 23:09:39 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3929ca3-ac90-11ec-8fbc-03012f2f19d4;
 Sat, 26 Mar 2022 00:09:37 +0100 (CET)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id A4CEA5C0170;
 Fri, 25 Mar 2022 19:09:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 25 Mar 2022 19:09:35 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Mar 2022 19:09:34 -0400 (EDT)
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
X-Inumbo-ID: a3929ca3-ac90-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=YIVbw2RUEfbKJ7Bmz
	AZ0kThlZmuPh3+JXCa3Y4y5CKc=; b=Bl1bnau/ZgoqUP4+jGD9qM8Y6gFoND6GY
	/oodkZv7tjE1CCNh9pMz24XMHmoA3ucVh7/8s1CJ9py5LkAt2AB74N25gOavjUjK
	XbDhMYyCDOJiCpTTIs0NaBXma4+j82gfjBbu4yoW9bhId6FstUB8mLiBFisn7AIj
	SfuViiwKRpssIOqWCHDzpw5LujrdibjoRYlRVL1JLeK1Wmyi2xgNVrjVqmegIIeJ
	3OuPk/d/qdU+cVT5fxPj6ztlARONTpJy2D/YdMVDPTlOU4od54xgY6F0uYfo+8Kc
	DyGebEIGEsvAkYxA4/mX8KyuMuv0KYantZrr6xIO5lPlb5hNfGDdA==
X-ME-Sender: <xms:r0s-YiAq3A9XkhEWfFaimJjAIvaEfTgMPew5XqMQWOrIQLbk3wyUTg>
    <xme:r0s-YsjLDGyOFIeyzy208IbS2t50bt1C0zElaJg8xC7Z6Z8Mf06HToW03VWMR5d_E
    HJcty8HCmTcGN4>
X-ME-Received: <xmr:r0s-YlnMSMRacsE0CJlV3NTsCY3Gc5p9PuxqmgXNkJvnG-ewWmRYjhJDVuZsIkZQsWh5vw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehvddgtdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfvfhfhffujggtsehgtderredtfeejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeuudegudfgteefjeefhedtgfegteff
    ledvgedvjeethffhkeefleduteevudfhueenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:r0s-Ygxkhs_736pFYKvMQOxJ1x6jvkUyrKVn_mpgwJyW8LYndMshqg>
    <xmx:r0s-YnQlb_lddfXhHDidMmgRZvLdu4uJGtyrbyI11PuZnn9ueWYXHQ>
    <xmx:r0s-YrbGz6_e_AAo1CujOBWefrukjomWNSdJ1kWG-RgevaaEpFvQLA>
    <xmx:r0s-YiftJWK6Hn71LbV2L4P1189ZUbE0WICYWcFnRWae1PsnmKLmmw>
Message-ID: <facfd815-8d07-50a1-b61f-54b2b0913484@invisiblethingslab.com>
Date: Fri, 25 Mar 2022 19:09:27 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Chris Cappuccio <chris@nmedia.net>
Cc: Roger Pau Monn? <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 OpenBSD technical mailing list <tech@openbsd.org>
References: <Yj3qW/y20htoSvuK@itl-email> <Yj5FXBj7qKIvs94O@ref.nmedia.net>
From: Demi Marie Obenour <demi@invisiblethingslab.com>
Subject: Re: Security support status of xnf(4) and xbf(4)
In-Reply-To: <Yj5FXBj7qKIvs94O@ref.nmedia.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ijCKG9nR3nMLAHue6dxG010W"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ijCKG9nR3nMLAHue6dxG010W
Content-Type: multipart/mixed; boundary="------------if3O66mD9HtiyVFts70gifiu";
 protected-headers="v1"
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Chris Cappuccio <chris@nmedia.net>
Cc: Roger Pau Monn? <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 OpenBSD technical mailing list <tech@openbsd.org>
Message-ID: <facfd815-8d07-50a1-b61f-54b2b0913484@invisiblethingslab.com>
Subject: Re: Security support status of xnf(4) and xbf(4)
References: <Yj3qW/y20htoSvuK@itl-email> <Yj5FXBj7qKIvs94O@ref.nmedia.net>
In-Reply-To: <Yj5FXBj7qKIvs94O@ref.nmedia.net>

--------------if3O66mD9HtiyVFts70gifiu
Content-Type: multipart/mixed; boundary="------------Yi9a2ONcc0prGhbMQsIODScr"

--------------Yi9a2ONcc0prGhbMQsIODScr
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 3/25/22 18:42, Chris Cappuccio wrote:
> Demi Marie Obenour [demi@invisiblethingslab.com] wrote:
>> Linux???s netfront and blkfront drivers recently had a security
>> vulnerability (XSA-396) that allowed a malicious backend to potentiall=
y
>> compromise them.  In follow-up audits, I found that OpenBSD???s xnf(4)=

>> currently trusts the backend domain.  I reported this privately to The=
o
>> de Raadt, who indicated that OpenBSD does not consider this to be a
>> security concern.
>>
>=20
> A malicious backend could completely compromise the virtual host in an
> infinite number of ways.

This is only true if the backend runs in dom0 (the privileged
administrative VM) or is otherwise trusted (perhaps because it stores
the root filesystem).  It is not true in general, and is explicitly
false in Qubes OS.  In Qubes OS, the only backend that can directly
compromise the VM is the disk backend running in dom0 that provides
the default volumes.  The network backend and other disk backends are
explicitly considered to be untrusted.

> Perhaps a small patch to find incorrect values
> would be of value, but even then, a patch would only be a very slight
> improvment. If you patch the manual page, should OpenBSD start putting
> notifications in all manual pages that a compromised virtual machine
> backend may compromise the integrity of the virtual host?

No, because emulated devices are provided by an I/O emulator that is
considered trusted.  xnf(4) and xbf(4) devices can be provided by a
backend that is not dom0 and which has (barring other vulnerabilities)
no other way to attack the guest.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab
--------------Yi9a2ONcc0prGhbMQsIODScr
Content-Type: application/pgp-keys; name="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=3Dx+Ro
-----END PGP PUBLIC KEY BLOCK-----

--------------Yi9a2ONcc0prGhbMQsIODScr--

--------------if3O66mD9HtiyVFts70gifiu--

--------------ijCKG9nR3nMLAHue6dxG010W
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmI+S60ACgkQsoi1X/+c
IsG7bhAAuTfCR/Q8m4Px+JEwt2K2BtLYFmxJt1f0GHVDg4dgzjptE3zgupuCIvEk
zjObaFPqS5/RJ+Ab4F8kzV/5muCKOE7yD2t3bzLsyw1Ig4MScEaKD0B38kfMjAQq
709QG+mXHKUkR2+ILVRKYzOWFdc2uAXpUunrGAGTel6t9Q0UoaTArbpvNGrSIPea
j8ZbuyR+5Nn9Y/yQSh29pE3+2lwSADnqwLjCwhm4TQfV/TYHNbYDNaXaS6dp6jvX
JZ5kG4CSc/V/SsxRqjbJFhiwx11IFRDp+tmDPFvmUO7ODKC61EM3qTZDtRLjp6D1
E9E9naEvjNsqRF1jAwo2oZa05wC0+1ns20Eo82gHnlc0SNjwyxvFDDKgwRig76A9
jcSfPbOVoPYXl3zftCI9CNZsJfYWCa+onwlQc8RWyg6b0omIxVu2iSrK48u+dfoE
OydMDD7/fKKoDm2KnTWCUCTaEmDskX+bms0GThPfMqZbCD355ja2a8ZPzyVG2XK7
jTjq4wx5u5J3rYcTCi6a2Lz5t/f3NaBqqAZ8HGimvuoKWjsrsdfOyPHa74/AKgrj
m76yArsl7y3Q4E/+tF8c8vmeI925EHCut6oxCvDLOSIJMDM4yMU1GXmU+vHAWYn7
JFEnhR+Uc42RrHynrq+9L9SagNIdFvTxPCL8M1Q5WaMxYllZI9I=
=NKC+
-----END PGP SIGNATURE-----

--------------ijCKG9nR3nMLAHue6dxG010W--

