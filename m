Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 551863F1864
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 13:41:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168560.307752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGgQ6-0004gu-3p; Thu, 19 Aug 2021 11:41:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168560.307752; Thu, 19 Aug 2021 11:41:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGgQ6-0004eB-0T; Thu, 19 Aug 2021 11:41:14 +0000
Received: by outflank-mailman (input) for mailman id 168560;
 Thu, 19 Aug 2021 11:41:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s4yt=NK=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mGgQ4-0004e0-4J
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 11:41:12 +0000
Received: from wout1-smtp.messagingengine.com (unknown [64.147.123.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 393591ee-9e4a-48a7-90c8-24d23d2935c1;
 Thu, 19 Aug 2021 11:41:11 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 86BAD32009E7;
 Thu, 19 Aug 2021 07:41:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 19 Aug 2021 07:41:09 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 07:41:07 -0400 (EDT)
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
X-Inumbo-ID: 393591ee-9e4a-48a7-90c8-24d23d2935c1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=jyw7M7
	yeQEgGhMnlJckFsYqDVnFrmExkBoa+gx3cV88=; b=eaazrwWbekb39pQOu5VCba
	W8wn6ke0B4xbKriR7Wusbg7IyV0nZSzzQP/KV1+PwGM2pI6roYdOtRXSYf6RPtzx
	aoQ1ixgOQGjjYQHOrpWV7QZhrnx5ZFc//wi7h5R/F89jpvViIi835v3dEpXHD6qe
	6mg0brKTNzNA4aZ4oeJOFBKKJ3M6840pdL7eg3MBDrKh5lp86kGP+ZvLt4zXAGOY
	1S+dSyWKQXgmBSyLRjtbgf7XzGc9m69CD+pHkAoVnO6FRXoyH9jTUMkZtLH94ESn
	iBbv+YulNwdXsKkeZPW5x0e6VFsGXbvjhCkwrBr4t9JRfAFecmxsZENv5H5OH+kQ
	==
X-ME-Sender: <xms:VEMeYdYCaVFjNOU64aI43-PuvMV7wIcNDukNnrw8zRNZwPADDi3DYw>
    <xme:VEMeYUaVgHtX7lQfVcbKmugFNn50zhB3-7kLRAC84rZvfYY-9yCWGCTRHSGTVjyJA
    CcxLtLKeTixMQ>
X-ME-Received: <xmr:VEMeYf_KxGNd6tPbuCE_v7jWNTT6MIA8iR9KQ5A7oKuTDyu5FG0ysg7rN3k_1tmirstTi86L8S30Px1QSXmNjYwIUa-bWGPt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgdegudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteevffei
    gffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:VEMeYbr0ItP_cziifbh0LgAHMrTjxUDryhdUx-NSziiA9xfqy3-EVA>
    <xmx:VEMeYYoTfXGsrfAUCAJDDSeU6bOyITqGMx34pfWwPzVGNplObn8khw>
    <xmx:VEMeYRTq7eGsbASvPgECFPYi1_Vl0vLFBb09PFPN5eNIrrylIAD27Q>
    <xmx:VUMeYf1H_5V9hq_lagz55KXhgE2HYKsmONO67VaXQzTjD1MBtXR7WA>
Date: Thu, 19 Aug 2021 13:41:04 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/xstate: reset cached register values on resume
Message-ID: <YR5DUPS+2oFCqcWW@mail-itl>
References: <20210818113017.454251-1-marmarek@invisiblethingslab.com>
 <45de5185-b514-8c52-6922-4c587818c698@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eTPGmSdK73dw3Lan"
Content-Disposition: inline
In-Reply-To: <45de5185-b514-8c52-6922-4c587818c698@citrix.com>


--eTPGmSdK73dw3Lan
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Aug 2021 13:41:04 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/xstate: reset cached register values on resume

On Wed, Aug 18, 2021 at 01:44:31PM +0100, Andrew Cooper wrote:
> On 18/08/2021 12:30, Marek Marczykowski-G=C3=B3recki wrote:
> > set_xcr0() and set_msr_xss() use cached value to avoid setting the
> > register to the same value over and over. But suspend/resume implicitly
> > reset the registers and since percpu areas are not deallocated on
> > suspend anymore, the cache gets stale.
> > Reset the cache on resume, to ensure the next write will really hit the
> > hardware. Choose value 0, as it will never be a legitimate write to
> > those registers - and so, will force write (and cache update).
> >
> > Note the cache is used io get_xcr0() and get_msr_xss() too, but:
> > - set_xcr0() is called few lines below in xstate_init(), so it will
> >   update the cache with appropriate value
> > - get_msr_xss() is not used anywhere - and thus not before any
> >   set_msr_xss() that will fill the cache
> >
> > Fixes: aca2a985a55a "xen: don't free percpu areas during suspend"
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
>=20
> I'd prefer to do this differently.=C2=A0 As I said in the thread, there a=
re
> other registers such as MSR_TSC_AUX which fall into the same category,
> and I'd like to make something which works systematically.

I'm not sure if I understand your message: do you want me to do things
differently, or are you working on an alternative fix yourself?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--eTPGmSdK73dw3Lan
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmEeQ1EACgkQ24/THMrX
1yz6xgf/RWnzxspo5EBNvkTiUrIy2dJpgW1Z19fMvmc5gQkO7mOjr7hq8iszpw/G
mBYsHB2Ny0PQb2enh5vGHWo5g8EnZ8uNVUHMDJ4w9hZtu6lPawFuhKFZTI1PxHZW
KwHLs7V1ZKziFATJRytr4lxHaYRZM5GRACnGUR5JYzAV8Axn54IyIYNHFceuOUDM
F+dFpgP4+j6FM40okpq4+I7aNChLcX0HMuRk77YFqd4vTqjKf6WK8yYw1CWfVw/5
GaoWjYyrI+OIQm4KzHEERl0tuSic3l4BfuMeTFKY0/eT45KxYpEn9Wo8lF/xlLuv
bBCfZR9bsGxmenNndOKKRKw2ENx1sw==
=5yAv
-----END PGP SIGNATURE-----

--eTPGmSdK73dw3Lan--

