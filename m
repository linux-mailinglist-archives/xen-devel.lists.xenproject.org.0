Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEB43DEED8
	for <lists+xen-devel@lfdr.de>; Tue,  3 Aug 2021 15:12:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163474.299448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAuDX-0001qC-9O; Tue, 03 Aug 2021 13:12:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163474.299448; Tue, 03 Aug 2021 13:12:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAuDX-0001nL-5j; Tue, 03 Aug 2021 13:12:23 +0000
Received: by outflank-mailman (input) for mailman id 163474;
 Tue, 03 Aug 2021 13:12:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TXgv=M2=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mAuDV-0001nC-RE
 for xen-devel@lists.xenproject.org; Tue, 03 Aug 2021 13:12:21 +0000
Received: from out3-smtp.messagingengine.com (unknown [66.111.4.27])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6f8f15f8-f45c-11eb-9ac0-12813bfff9fa;
 Tue, 03 Aug 2021 13:12:21 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C3F085C0108;
 Tue,  3 Aug 2021 09:12:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 03 Aug 2021 09:12:20 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Aug 2021 09:12:19 -0400 (EDT)
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
X-Inumbo-ID: 6f8f15f8-f45c-11eb-9ac0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ma+ZMt
	lzF5hVOkev2788QqmzXu/scgSF9F/FCsJEjDM=; b=mJYBEA1sTlb8umcRnPW2dz
	cp22JG8Zf2V4nAVLCm+xG1NK8rIx+kIjZxcB64k1I9CjyPtP886ZUz0QIvb36blB
	HS9ontuAj2nGjb0x1vbngBcg4pvwtTW4x7fj37gL8TRRd9l4gFlQ4NeA/mDLmnmp
	SUifnJsSHAq/XCOJazXx/ugkYutfcJoKTn9hx8tWrKkHqk+WIk3rai74gyce2Yzf
	YJHCKIoHUMDnsZY/ACe7DiFEPULOSG2FCL3LdySFL1im0qGBrexfGHlFFFfT1BZ5
	f22qCXJ6LjeSghEl3UMZfO6l/ElxEgvIdez7UQza50LxNdpUfy4PEKB8pWnsBmTQ
	==
X-ME-Sender: <xms:s0AJYdI_Azjo5tUVMf2G4l7VAfnVmlVd5Qh30m3j8YwmHOmZOq8h_w>
    <xme:s0AJYZL0Rv6dcg809wxK7NuT7UXK0xxJXG24dRHaqh_e7jirOSXenciHIuOn8yJdY
    ZQrNPVKi459ww>
X-ME-Received: <xmr:s0AJYVum6Q0_5yCGvcviroN1Fpv5IzF8sNWV6rM29_p7_c4C_4r7OftYtr4uglw1nfVArM6iRM5hcPPs0z3RtAej-xm_zSJU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieeggdehkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteevffei
    gffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:s0AJYeYCuWJxPpmrXSiVrJqcVGSAA7e_h9zx_0GhKG0MQ2QM562Dlw>
    <xmx:s0AJYUakrJ127Mw2mfRFo4ohkNkFiTDv6udGYnyeb_sU0vHP343iyw>
    <xmx:s0AJYSByh-OaJa4mbsG4ZUG9jNK8hWdog9auw-P2hRRfJ3Ge9c0hsA>
    <xmx:tEAJYfxEOwPa8vkI8Ldm3d9IfXLFmzFf2l1BD_PZlpspMedSHmLYKw>
Date: Tue, 3 Aug 2021 15:12:16 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] VT-d: Tylersburg errata apply to further steppings
Message-ID: <YQlAsAneiMOD+SMq@mail-itl>
References: <07ded368-5c12-c06e-fd94-d7ae52d18836@suse.com>
 <YQk0vrH5Oe62ozbW@mail-itl>
 <ec1cc65d-5a10-7ef3-2643-622302cdafb7@suse.com>
 <YQk+I2FglGrnuyPw@mail-itl>
 <10425176-438f-370b-9d60-183d6e0f5441@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bNUBwrql5Ygim7fF"
Content-Disposition: inline
In-Reply-To: <10425176-438f-370b-9d60-183d6e0f5441@suse.com>


--bNUBwrql5Ygim7fF
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 3 Aug 2021 15:12:16 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] VT-d: Tylersburg errata apply to further steppings

On Tue, Aug 03, 2021 at 03:06:50PM +0200, Jan Beulich wrote:
> On 03.08.2021 15:01, Marek Marczykowski-G=C3=B3recki wrote:
> > Ok, then, just setting iommu_intremap=3Dfalse should do the right thing,
>=20
> ... if "iommu=3Dforce" is in use (but not otherwise), ...

But that's the purpose of iommu=3Dforce, no?
With "iommu=3Dforce": strictly require IOMMU
Without "iommu=3Dforce": use IOMMU on best-effort basis

It makes sense to refuse the boot if intremap is broken in the first
case. But also, it makes sense to allow using IOMMU without intremp in
the second case.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--bNUBwrql5Ygim7fF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmEJQLAACgkQ24/THMrX
1yxCyggAmDY8OXGnFJLLAVpVOpM5lWYZY+wBLvzj1n0BXxzW1rIMfjv67gopkWbh
i8Oj/P5dIjLx2L/tY5HwFcRHyJ4W53zkTKpCPYo8SiYyqHxZ16dkOPgoI2hmd0Yy
yXX8iLTO4IVLx8Hibs9gSfXcQXh3mnKt3eyIOPq/xztQS18lcjkti9k1YeJqibnM
TVNzPRm1jfk96pOrv703BcZkRWr7OvlCjkGXHh3BSBSMOZr4jW7WJ+PiXjmH+v+s
7U6d6rGJz5ubloAISsJwy+J2dO8EZ/sVYbEUkYCE9XKygotJFcBctcQ+NMQyxI39
bw/7L1+wZkMGgy/6kSgex5KuCkZWeA==
=0VDS
-----END PGP SIGNATURE-----

--bNUBwrql5Ygim7fF--

