Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6590D4129B3
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 02:01:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191254.341207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSTED-0001Pa-Mq; Tue, 21 Sep 2021 00:01:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191254.341207; Tue, 21 Sep 2021 00:01:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSTED-0001Nb-JU; Tue, 21 Sep 2021 00:01:41 +0000
Received: by outflank-mailman (input) for mailman id 191254;
 Tue, 21 Sep 2021 00:01:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9eYo=OL=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mSTEB-0001NV-SH
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 00:01:40 +0000
Received: from wout4-smtp.messagingengine.com (unknown [64.147.123.20])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13015cec-5035-4e35-b2d4-5cb794d9c324;
 Tue, 21 Sep 2021 00:01:38 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id B964E3200B5E;
 Mon, 20 Sep 2021 20:01:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 20 Sep 2021 20:01:36 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Sep 2021 20:01:32 -0400 (EDT)
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
X-Inumbo-ID: 13015cec-5035-4e35-b2d4-5cb794d9c324
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=elddKd
	D4BPQ0M+cJwTBaZFkbiRuFjkdQnumS8prRBsE=; b=v4Pz4Ctd6lSYg77kUzC3vv
	7tV7NeWPWhYBvJW48B09tcF4tugDz/Q+ZL+eUMY4wUKYpSahhf4SmJiONTv+ChOu
	+QhIvU3VLWYZgEExcs5GM2X1R9AN7gCk7WXert82s1zszvgsRPCutKL9jy1KBQvT
	OmbY1FSiaMiDqetNLHe2igFwMm4RXDkwPy9XaA8CWOHyorBi2bIf/MrmGb0gnkxo
	ZxDJHXCk2CS1JSUpHnTemx4vSwkxvUE+y6lVJMMrNwkhlxGsRfAqcrxDj/LPntJG
	yQEV2CWKxf7aNQIuoGIO05HQmhxlj42o6zLNCHnMDwfWB62nvMmK0E6TIjOzvFkA
	==
X-ME-Sender: <xms:3iBJYRW3dCGreU2LQrLa5VmdUqU7kTqcSYXQYwzLXuXjj9zP9-eI0g>
    <xme:3iBJYRnugGD-Or2uZSV4eEK4BOyjnzLogB9Tw9SyhV9oOCG7BDtgzglvvErALpVdu
    QamPmf-TKgC0g>
X-ME-Received: <xmr:3iBJYdYuPBELwQxKMChTDVktKmW-1_8kx-eY_PtOHoZbw2GleuRGYi50MfNUA3X8KeoAjwKUZL449si9kiLLI12Y9VGgfFQw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeifedgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:3iBJYUWh324LKSPb-1Ky676Loi0y0Y5CsUnPzrWBIEWCYZxB8-wnoA>
    <xmx:3iBJYbls-90q_PdrkBsnPyZY49B9EBFxGBTjsyGX-0vkTE5V-hyavQ>
    <xmx:3iBJYRcdLpGjcqBgL7SpRsBAH3TyHVsHItquiG-w2GJ74itgw3w0tA>
    <xmx:3yBJYZUwVrj9amEgmY4hmE6piESnkSfYnnLxyRW8Xa0TeLBBXZSCGg>
Date: Tue, 21 Sep 2021 02:01:28 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, efault@gmx.de,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2] x86/setup: call early_reserve_memory() earlier
Message-ID: <YUkg2NsVB1xwX3dI@mail-itl>
References: <20210920120421.29276-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aUPRBE57vyxN5AhB"
Content-Disposition: inline
In-Reply-To: <20210920120421.29276-1-jgross@suse.com>


--aUPRBE57vyxN5AhB
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Sep 2021 02:01:28 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, efault@gmx.de,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2] x86/setup: call early_reserve_memory() earlier

On Mon, Sep 20, 2021 at 02:04:21PM +0200, Juergen Gross wrote:
> Commit a799c2bd29d19c565 ("x86/setup: Consolidate early memory
> reservations") introduced early_reserve_memory() to do all needed
> initial memblock_reserve() calls in one function. Unfortunately the
> call of early_reserve_memory() is done too late for Xen dom0, as in
> some cases a Xen hook called by e820__memory_setup() will need those
> memory reservations to have happened already.
>=20
> Move the call of early_reserve_memory() before the call of
> e820__memory_setup() in order to avoid such problems.
>=20
> Cc: stable@vger.kernel.org
> Fixes: a799c2bd29d19c565 ("x86/setup: Consolidate early memory reservatio=
ns")
> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
=2Ecom>
> Signed-off-by: Juergen Gross <jgross@suse.com>

I confirm this fixes my boot issue too.

Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
> V2:
> - update comment (Jan Beulich, Boris Petkov)
> - move call down in setup_arch() (Mike Galbraith)
> ---
>  arch/x86/kernel/setup.c | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
>=20
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index 79f164141116..40ed44ead063 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -830,6 +830,20 @@ void __init setup_arch(char **cmdline_p)
> =20
>  	x86_init.oem.arch_setup();
> =20
> +	/*
> +	 * Do some memory reservations *before* memory is added to memblock, so
> +	 * memblock allocations won't overwrite it.
> +	 *
> +	 * After this point, everything still needed from the boot loader or
> +	 * firmware or kernel text should be early reserved or marked not RAM in
> +	 * e820. All other memory is free game.
> +	 *
> +	 * This call needs to happen before e820__memory_setup() which calls the
> +	 * xen_memory_setup() on Xen dom0 which relies on the fact that those
> +	 * early reservations have happened already.
> +	 */
> +	early_reserve_memory();
> +
>  	iomem_resource.end =3D (1ULL << boot_cpu_data.x86_phys_bits) - 1;
>  	e820__memory_setup();
>  	parse_setup_data();
> @@ -876,18 +890,6 @@ void __init setup_arch(char **cmdline_p)
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

--aUPRBE57vyxN5AhB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmFJINkACgkQ24/THMrX
1yxeEgf+OTiRexZli2dhF3IwJBnJzNUlMY1c9IGqgKF1TZ0LZafQLFWuvFG0sN8Q
U+Cla7L/0wYCu+M3TLT502GYcD2B1xbA2IdugAVXCgShZoRqHPE4tiF7+UuUb1jo
DvroNdgMPgPelkQvexh/OG2XMrSwEjalNV+WH9axOAOlUC0p8ji+7DRhZX9au6fV
qQrjeOfxipfe2XL8RC8ED8dXx7c+xYzpTyphfzhdAwGwMHWpAjzmuHqbGIN2V/IP
xLNETBqQfk+M2VjVPihda8RFue3V/nc4fVL+e5X/EkSW24WC0+5h/U2U1cy0HKqI
8nwCQvL/CmtUZPZbZJCrQ6mM+rob7w==
=Cn+N
-----END PGP SIGNATURE-----

--aUPRBE57vyxN5AhB--

