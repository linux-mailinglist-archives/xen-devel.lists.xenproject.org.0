Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F61F40AC01
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 12:50:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186411.335135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ60N-0005du-Pu; Tue, 14 Sep 2021 10:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186411.335135; Tue, 14 Sep 2021 10:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ60N-0005c7-Mv; Tue, 14 Sep 2021 10:49:35 +0000
Received: by outflank-mailman (input) for mailman id 186411;
 Tue, 14 Sep 2021 10:49:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v6J8=OE=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mQ60M-0005c1-Nb
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 10:49:34 +0000
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1fc0724e-6372-4ee7-8913-11cf3edeec0d;
 Tue, 14 Sep 2021 10:49:32 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 79C745C0212;
 Tue, 14 Sep 2021 06:49:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 14 Sep 2021 06:49:32 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 06:49:30 -0400 (EDT)
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
X-Inumbo-ID: 1fc0724e-6372-4ee7-8913-11cf3edeec0d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=tHeJnF
	1k6ZyHrxR5t5ZIhno68yHo7xZ7224tLpR6g/I=; b=APRgfJAdR+9vVcfDaslR2x
	5+B8MflgQL6X4jjhWtV4ne9qsJmsiuX4sZmXojOFaqfhbI7CVfqShb8eN+U5V9Ta
	EZOEMFo0kLQwaqaOAWlaAJqcYZi0uL8t8QQZfTd++gkAyTKQI2H34KlCHnJys1mv
	0L0l2l+p9qxg3ofLU2J6fV42fGlB1RB/kJl2qKJulO2baFkDiCTYxqcmu/PLIc5N
	xtuz61NqBziez18OaJJH6/YFBZGJzEuLTFrxzSuJNLdLg14DyugG7KUd8+RQznkX
	kbhU4v4ejXiozBECA+6tZfw7tJJaDj9blxxblKMjeBkiF+SL4D/KuOlvtmHqc+Fw
	==
X-ME-Sender: <xms:O35AYb8RvWQBkRZ6Mh-KmCgSn2H2pHuiAjuLxhLmIMoMisgOADNnpg>
    <xme:O35AYXtEfAhPQG0YW5bj7pZFisfR80uL8T3miWOJGApUeR6t7vRknII2ns4PA55Jl
    hH9pOFNOnJ3pQ>
X-ME-Received: <xmr:O35AYZACNAUmJma3BROdGO2R1Ps9ipSreOOHL2-HkksunEHuu1ldTYlqM-XJdcmfPG9YkELajcbs9GoxIO8UvXN8kNRD2fV7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledgfeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:O35AYXfjFXMBjdJLsWzx6d4CBg0OZNW6A6nwNoRqa9ZwG4d1woANTg>
    <xmx:O35AYQOIpsrWxQHr1MDWDrrFdH1PoUWbaA1cIHp0kwIodM5EPgyIwQ>
    <xmx:O35AYZk3xWTDMCBrzCaUvM__NwPg3lchBp5Qy1i3WfOxpJdM5DDogw>
    <xmx:PH5AYcBkHmQFWFAwvg_Nmjyzc2-ciSOPgMcdlsJyEz9kSJmYZhGvjA>
Date: Tue, 14 Sep 2021 12:49:27 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>, stable@vger.kernel.org
Subject: Re: [PATCH] x86/setup: call early_reserve_memory() earlier
Message-ID: <YUB+N+bVrd4TCt9X@mail-itl>
References: <20210914094108.22482-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ng3gYZ7HeyL14wKB"
Content-Disposition: inline
In-Reply-To: <20210914094108.22482-1-jgross@suse.com>


--Ng3gYZ7HeyL14wKB
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Sep 2021 12:49:27 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>, stable@vger.kernel.org
Subject: Re: [PATCH] x86/setup: call early_reserve_memory() earlier

On Tue, Sep 14, 2021 at 11:41:08AM +0200, Juergen Gross wrote:
> Commit a799c2bd29d19c565 ("x86/setup: Consolidate early memory
> reservations") introduced early_reserve_memory() to do all needed
> initial memblock_reserve() calls in one function. Unfortunately the
> call of early_reserve_memory() is done too late for Xen dom0, as in
> some cases a Xen hook called by e820__memory_setup() will need those
> memory reservations to have happened already.
>=20
> Move the call of early_reserve_memory() to the beginning of
> setup_arch() in order to avoid such problems.
>=20
> Cc: stable@vger.kernel.org
> Fixes: a799c2bd29d19c565 ("x86/setup: Consolidate early memory reservatio=
ns")
> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
=2Ecom>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Thanks, it works!

Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
>  arch/x86/kernel/setup.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>=20
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index 79f164141116..f369c51ec580 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -757,6 +757,18 @@ dump_kernel_offset(struct notifier_block *self, unsi=
gned long v, void *p)
> =20
>  void __init setup_arch(char **cmdline_p)
>  {
> +	/*
> +	 * Do some memory reservations *before* memory is added to
> +	 * memblock, so memblock allocations won't overwrite it.
> +	 * Do it after early param, so we could get (unlikely) panic from
> +	 * serial.
> +	 *
> +	 * After this point everything still needed from the boot loader or
> +	 * firmware or kernel text should be early reserved or marked not
> +	 * RAM in e820. All other memory is free game.
> +	 */
> +	early_reserve_memory();
> +
>  #ifdef CONFIG_X86_32
>  	memcpy(&boot_cpu_data, &new_cpu_data, sizeof(new_cpu_data));
> =20
> @@ -876,18 +888,6 @@ void __init setup_arch(char **cmdline_p)
> =20
>  	parse_early_param();
> =20
> -	/*
> -	 * Do some memory reservations *before* memory is added to
> -	 * memblock, so memblock allocations won't overwrite it.
> -	 * Do it after early param, so we could get (unlikely) panic from
> -	 * serial.
> -	 *
> -	 * After this point everything still needed from the boot loader or
> -	 * firmware or kernel text should be early reserved or marked not
> -	 * RAM in e820. All other memory is free game.
> -	 */
> -	early_reserve_memory();
> -
>  #ifdef CONFIG_MEMORY_HOTPLUG
>  	/*
>  	 * Memory used by the kernel cannot be hot-removed because Linux
> --=20
> 2.26.2
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Ng3gYZ7HeyL14wKB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmFAfjcACgkQ24/THMrX
1yyiDAf/cbECScwjsEcDuWCxieb4bXydSDNTKkPbdFll3q6+HMw1aHcvhY/WBej7
xt4vOb/dbqLjRBSPH3w3vCVw8r2zGk8QjhojMNN/8uRqkDpax/KsutFiEs8XsfTC
3NME49YGNCXocNGHIVF79/PNZpKpPIHN40CA/B8r5/OqM6DEBKt9KNWDX7Z9fb/o
s/NdqU/1hFWswunAL87hJ3e/XU8pu1mxP794sAq8XRCwBQjlKoBrdHDBF6QlLau8
Q2qx8U9y7sWNsf4hsGXkgcjLvy7R+zOCvzzXtF4m0SkueVPOm4ilUG4/65X+kcy5
3i+rBfYZ41Qb8csPFnFJOPud0tuTdQ==
=mhfL
-----END PGP SIGNATURE-----

--Ng3gYZ7HeyL14wKB--

