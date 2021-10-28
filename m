Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6372543E970
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 22:17:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218277.378631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgBpk-0005lH-Oh; Thu, 28 Oct 2021 20:17:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218277.378631; Thu, 28 Oct 2021 20:17:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgBpk-0005iq-LF; Thu, 28 Oct 2021 20:17:08 +0000
Received: by outflank-mailman (input) for mailman id 218277;
 Thu, 28 Oct 2021 20:17:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9gJ2=PQ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mgBpj-0005ik-3E
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 20:17:07 +0000
Received: from out3-smtp.messagingengine.com (unknown [66.111.4.27])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 051323d6-382c-11ec-84b7-12813bfff9fa;
 Thu, 28 Oct 2021 20:17:05 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 707855C00D4;
 Thu, 28 Oct 2021 16:17:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 28 Oct 2021 16:17:05 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Oct 2021 16:17:03 -0400 (EDT)
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
X-Inumbo-ID: 051323d6-382c-11ec-84b7-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=5lHMBp
	j8jcGhebPQpTOYiDXSyqlgx4IThAJ8eNFDX74=; b=EdZx+kAdnMwb+jYdhFSU3e
	bjAyzKrEqfJWbH8NMq+8P3rgLpwXXxothhyPrsrrB7FijmdAiE3kTdiSaL6ELrkT
	6usso22/FeGG99cGO+Ph93+EJpvTpQEcnJWoyivkRRkiZJjj6bA2Urq20u3f9cQw
	+IvnaGABJKbPCBezGm7NpTY8bqaMWPNpXN/HHIFM98l8qNxwoZQ6l3u7F9rwv6Py
	GPv0hTLLcRhCHj9+tPx3DpKtsBAqWRuVhYW1Wq7M11DTUCSjWnFDxMGzlF66hdW4
	w9438SdXzq3mTqfgWTnu9KpP07Ew1QKyAlYDPTmcGg1cVmBANbfP2ugyf6TB7VxQ
	==
X-ME-Sender: <xms:QAV7YaVQwb3n3EJGIi7y8xDS1Rk2gH8TrVPUPUbbaye6nO6xKmU2Eg>
    <xme:QAV7YWmw1S9CbPYM1-onq01RVYnW7vZSfKrLuRH60K-8MrKJLtvK2PkfFH2aVtqTp
    17Q_xzmNLOWSw>
X-ME-Received: <xmr:QAV7YebKpgB9bhmmBy4NhwiDaQWekCU4YL0Ph_3uPTZGxAtrB0bP6JkMkdldR8PPR712_MZzK0Uy411HqXthWPqY8QAiQSu9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegvddgheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:QAV7YRV0Oua-q3Zjs057wE7yKHqDWdUI3tbpTUwc6BMpV1i2JE1-UQ>
    <xmx:QAV7YUkPzgCHsZyTaE0evbjrq6ZnLHs93XsSdDZTAeT37FFyJlByow>
    <xmx:QAV7YWe0ql_7UYnHIDd4q7YBe4rnnYKXqVi5d6ik6-AR2LhprXlU1w>
    <xmx:QQV7YeifmEzqBzluQBehlZzliUIALZsSO2Ifp7GSY2Wd20N9sbQ5DQ>
Date: Thu, 28 Oct 2021 22:16:59 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH] xen/balloon: add late_initcall_sync() for initial
 ballooning done
Message-ID: <YXsFO2TMRiJTQM2q@mail-itl>
References: <20211028105952.10011-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="E2YpY0crIIXSHyLi"
Content-Disposition: inline
In-Reply-To: <20211028105952.10011-1-jgross@suse.com>


--E2YpY0crIIXSHyLi
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 Oct 2021 22:16:59 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH] xen/balloon: add late_initcall_sync() for initial
 ballooning done

On Thu, Oct 28, 2021 at 12:59:52PM +0200, Juergen Gross wrote:
> When running as PVH or HVM guest with actual memory < max memory the
> hypervisor is using "populate on demand" in order to allow the guest
> to balloon down from its maximum memory size. For this to work
> correctly the guest must not touch more memory pages than its target
> memory size as otherwise the PoD cache will be exhausted and the guest
> is crashed as a result of that.
>=20
> In extreme cases ballooning down might not be finished today before
> the init process is started, which can consume lots of memory.
>=20
> In order to avoid random boot crashes in such cases, add a late init
> call to wait for ballooning down having finished for PVH/HVM guests.
>=20
> Cc: <stable@vger.kernel.org>
> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
=2Ecom>
> Signed-off-by: Juergen Gross <jgross@suse.com>

It may happen that initial balloon down fails (state=3D=3DBP_ECANCELED). In
that case, it waits indefinitely. I think it should rather report a
failure (and panic? it's similar to OOM before PID 1 starts, so rather
hard to recover), instead of hanging.

Anyway, it does fix the boot crashes.

> ---
>  drivers/xen/balloon.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
> index 3a50f097ed3e..d19b851c3d3b 100644
> --- a/drivers/xen/balloon.c
> +++ b/drivers/xen/balloon.c
> @@ -765,3 +765,23 @@ static int __init balloon_init(void)
>  	return 0;
>  }
>  subsys_initcall(balloon_init);
> +
> +static int __init balloon_wait_finish(void)
> +{
> +	if (!xen_domain())
> +		return -ENODEV;
> +
> +	/* PV guests don't need to wait. */
> +	if (xen_pv_domain() || !current_credit())
> +		return 0;
> +
> +	pr_info("Waiting for initial ballooning down having finished.\n");
> +
> +	while (current_credit())
> +		schedule_timeout_interruptible(HZ / 10);
> +
> +	pr_info("Initial ballooning down finished.\n");
> +
> +	return 0;
> +}
> +late_initcall_sync(balloon_wait_finish);
> --=20
> 2.26.2
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--E2YpY0crIIXSHyLi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmF7BTsACgkQ24/THMrX
1yyExQf8C+Zlijc1idL0I+sDb62ywXLbZxjsytrZOhBRNZO84RpHwSdxw1Q3Nbpq
KWfXMw4PJX6IWvACg4Oy7VVfpXR/6/pZLJStFl4j8iPha+gF5kph2uFwQhHbNjSO
kk3E9UIQpwLHNixP4CPG5Aa74Ta8Seth7Fl63JpYc4H0eR4rwwEL2ifOz73ElBEK
VpMxsPf/20XEHITTeluwxv/otMuZtBok9ZEC5irOmOfkghwVJ855dcBYk+FSFlX3
+1ZKbB+CU0SOkqnEjSBjlctJl9awkdpKD8voE1IjMDSDdGcDHE50MSjQdfZqtWF6
Ehku7nMKd8rRz8Xz1pwE3+3Ny2SlDw==
=4WvB
-----END PGP SIGNATURE-----

--E2YpY0crIIXSHyLi--

