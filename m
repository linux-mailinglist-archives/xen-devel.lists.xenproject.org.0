Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5875F3F0168
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 12:13:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168163.307011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGIYk-0002IJ-6Y; Wed, 18 Aug 2021 10:12:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168163.307011; Wed, 18 Aug 2021 10:12:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGIYk-0002F0-3F; Wed, 18 Aug 2021 10:12:34 +0000
Received: by outflank-mailman (input) for mailman id 168163;
 Wed, 18 Aug 2021 10:12:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWQ4=NJ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mGIYi-0002Eu-4E
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 10:12:32 +0000
Received: from wout5-smtp.messagingengine.com (unknown [64.147.123.21])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc113c14-000c-11ec-a543-12813bfff9fa;
 Wed, 18 Aug 2021 10:12:30 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id A038032008FE;
 Wed, 18 Aug 2021 06:12:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 18 Aug 2021 06:12:29 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Aug 2021 06:12:27 -0400 (EDT)
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
X-Inumbo-ID: cc113c14-000c-11ec-a543-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=sCajfi
	d2OmcBm3OIACz3F+0P88NFlDLda2u1HLFijaI=; b=qhV3dkPV8nGDSmTnSP1c/9
	T/SqUHOwlpBJBdNN+bVi5TvSwxjsbjEUA2hxBZ+WmVUYBnqDogu6WSgOxmrU0P3s
	V+6kx0UVwR/hoVzy4/Fr99Y6Z1lR2UbJmypO93E05gIJ0H54jj+zHmg6EwVhcpvS
	JnfMBLatYBpx6T2nO3XyURIygsdWTlbkepI1lHJmCjD6Zftwo/uLxe39/LciOiYS
	n57TgWXAFgGpGIY+NdUXx9t3ICWlHXBXNWIpJQsc30y7WKWOZy3CkVYF+6nUJsIC
	EFWgrQVb1cVIWGoWxm+97o0zx3E+StmBMn8dlSqo6srvDgPj6yOW+cMFlricubuQ
	==
X-ME-Sender: <xms:DN0cYTHzj7dqyTt-3rL8XVFv-jYSQDsvJn-d8ld0j_jrQsEBgUWk0g>
    <xme:DN0cYQWu6nP1fF3pnypd_TfoQxhg_mBJRbafny0vMag1vIY7gZvGUiV3bIqssFT6G
    rjRgqkifOHxeQ>
X-ME-Received: <xmr:DN0cYVLuQO2_WOH0UgjI-V2UftU1QojJS9bZfp_GR3diruH5Biwd-UhaykhbBALm4YfYf6wUoJ8H5RZ586q-I-ebv3pEBYxM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleehgddvhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepheevvdeu
    veehkeehhfevgffggfevudegteeugfeliedvhefgueeiuefgteetieffnecuffhomhgrih
    hnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhm
X-ME-Proxy: <xmx:DN0cYRGRPm-s7LYViLqUL1F5aPu3Axg9k5vntB7oVYCLr8Oi0xVgMQ>
    <xmx:DN0cYZXO6En1ITfmxue_D-Km_2RKR7NHEXkmm4xfov3_dO6nPqYmmg>
    <xmx:DN0cYcNv_MlvmnREBqaV9BFVblFn6exHEuOVFdXXX5aN9gbDmZA7JA>
    <xmx:Dd0cYYdN9tQI93UpsnSX6dkfoE-qvgCXvQoGjNnSvm-arJLX4RgNpQ>
Date: Wed, 18 Aug 2021 12:12:25 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: S3 resume issue in cpufreq ->
 get_cpu_idle_time->vcpu_runstate_get
Message-ID: <YRzdCeS28NPlkFL+@mail-itl>
References: <YRvMy9NgGxYKRcNc@mail-itl>
 <42948041-59a5-e243-ed39-6e2afe3fd1cd@suse.com>
 <d700e9f6-8c64-52b6-6881-5816c2895200@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="axqHX3htufpSzeW/"
Content-Disposition: inline
In-Reply-To: <d700e9f6-8c64-52b6-6881-5816c2895200@suse.com>


--axqHX3htufpSzeW/
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Aug 2021 12:12:25 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: S3 resume issue in cpufreq ->
 get_cpu_idle_time->vcpu_runstate_get

On Wed, Aug 18, 2021 at 08:24:39AM +0200, Juergen Gross wrote:
> Marek,
>=20
> On 17.08.21 17:15, Juergen Gross wrote:
> > On 17.08.21 16:50, Marek Marczykowski-G=C3=B3recki wrote:
> > I'll be looking into that.
>=20
> Could you please try the attached patch?

It works, thanks!

So, the only other suspend-related issue I'm aware of, is:
https://lore.kernel.org/xen-devel/20210131021526.GB6354@mail-itl/

But I don't have reliable reproducer for that one...


> From e38d0816a33fbaa3c0c45bcd6e9d433b1e021222 Mon Sep 17 00:00:00 2001
> From: Juergen Gross <jgross@suse.com>
> To: xen-devel@lists.xenproject.org
> Cc: George Dunlap <george.dunlap@citrix.com>
> Cc: Dario Faggioli <dfaggioli@suse.com>
> Date: Wed, 18 Aug 2021 08:18:20 +0200
> Subject: [PATCH] xen/sched: fix get_cpu_idle_time() for smt=3D0 suspend/r=
esume
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>=20
> With smt=3D0 during a suspend/resume cycle of the machine the threads
> which have been parked before will briefly come up again. This can
> result in problems e.g. with cpufreq driver being active as this will
> call into get_cpu_idle_time() for a cpu without initialized scheduler
> data.
>=20
> Fix that by letting get_cpu_idle_time() deal with this case.
>=20
> Fixes: 132cbe8f35632fb2 ("sched: fix get_cpu_idle_time() with core schedu=
ling")
> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
=2Ecom>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
> An alternative way to fix the issue would be to keep the sched_resource
> of offline cpus allocated like we already do with idle vcpus and units.
> This fix would be more intrusive, but it would avoid similar other bugs
> like this one.
> ---
>  xen/common/sched/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index 6d34764d38..9ac1b01ca8 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -337,7 +337,7 @@ uint64_t get_cpu_idle_time(unsigned int cpu)
>      struct vcpu_runstate_info state =3D { 0 };
>      const struct vcpu *v =3D idle_vcpu[cpu];
> =20
> -    if ( cpu_online(cpu) && v )
> +    if ( cpu_online(cpu) && v && get_sched_res(cpu) )
>          vcpu_runstate_get(v, &state);
> =20
>      return state.time[RUNSTATE_running];
> --=20
> 2.26.2
>=20






--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--axqHX3htufpSzeW/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmEc3QkACgkQ24/THMrX
1yyX+gf/SxaLEAhmNLmKuWOzKe52OE7cK0qIk+dNRfuokpkliCkN2fOMTxN9UwWQ
bn6vdtT8FufG0RclzKUJ/DHqdA51XAN61B/84Wr6dOb5j6sNa8KKhqeGqmfQySU2
m4/e2F09OpVLY4rXrxNJBnyTsd8vsXgjtgLym1R7jVkFYKYsgrhPOMDyU9N6vh91
+RcsMCKmtjN1TxFmxyyCqqhW3I8mf/2ybKRaKsKYDHKXMAY7d8IMikGd2dZVQT5F
FHGf07r3inGsxBYo2e8ei2F21uxvbRCHeLm2Jl69WtXnDrie12vrfhskuIJb2Ve3
IrjOFr/bro0qgyJgHMuq3zsbWucZUA==
=tem9
-----END PGP SIGNATURE-----

--axqHX3htufpSzeW/--

