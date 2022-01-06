Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A35148680B
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 17:59:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254179.435780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5W6g-00014W-3j; Thu, 06 Jan 2022 16:59:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254179.435780; Thu, 06 Jan 2022 16:59:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5W6g-00011r-0G; Thu, 06 Jan 2022 16:59:18 +0000
Received: by outflank-mailman (input) for mailman id 254179;
 Thu, 06 Jan 2022 16:59:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a426=RW=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1n5W6d-00011h-EE
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 16:59:15 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f74ce459-6f11-11ec-9ce5-af14b9085ebd;
 Thu, 06 Jan 2022 17:59:12 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id CF91A3203661;
 Thu,  6 Jan 2022 11:59:07 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 06 Jan 2022 11:59:08 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Jan 2022 11:59:05 -0500 (EST)
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
X-Inumbo-ID: f74ce459-6f11-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=0vGvuv
	juDyt65yvtD1GJB2V8OzoYjUroXY3LcTsJRBA=; b=AJU/XMZPfjlQwqtfnQH9Kp
	9iQBSyqhKuVR6g1HxAKZtdQ/2GZIRuKEXQaGlTF6BWlbFaxQBylyzF+4C7wGX//H
	AAyg9C/fNCAdcFHdA9P97dzVWZKGVsqeYc2n3wUERI4QAslmGwZ4eOqpLelYowWN
	7GUUPJ6IFu9fbwRDaknxmBAmv3oF87aOBcmD4qwjZUVjzqfKRpWE0sFxuetYgYaU
	G0C56fBvjYxjMhCGzyBYqEgKL4i2DRGESPJeKnYAESfI6G7oDWr9MkDdehGyoj1K
	jSueILlbmoSc9mO0pa0hqFh8rOPWnWKUVpbdDnc4dgKmKZcE7S/ghu+unRiC+UaQ
	==
X-ME-Sender: <xms:2x_XYaLbFwehld-mPPno9AT51iE59R2AHuNbZbt_2LeApryDwm4Nsw>
    <xme:2x_XYSIsyrFvGPJhXYI4KR3W5Ze-TdtOwkgXozvacYPoUAeko2ftynq7adpIttyv5
    Lvd2qKC5D5Xzg>
X-ME-Received: <xmr:2x_XYauuc3lC4_7BLg2-fdq0-DDjC0PhdIXSaNg0QoG9DH3oxeKIfU5THG3L05tKMvS8HerZsLhathEeVIBIHg5I3rJSBb3G>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudefledgleegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:2x_XYfZstjlZ1xfkGd8v9mGQUhOnnGdvAhXZ1SHEYSquHLepH967vg>
    <xmx:2x_XYRYtnXsKV3kN14uNVcb6I1STkD783yCCeXC-mogyzpER6jHH1Q>
    <xmx:2x_XYbCSnP3mJOlSjA5nKZbYcJMzAZ0lbS5jDlrzLfrHpMQlsumK0A>
    <xmx:2x_XYWNtm-1qHMWvzYzzCndRCEo8yRErfttxFoftHkHzKTqgHItgnw>
Date: Thu, 6 Jan 2022 17:59:03 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: Live update of Xenstore-stubdom
Message-ID: <Ydcf17CezyPpQS8E@mail-itl>
References: <a6ba7e89-f70b-3c51-5a65-06c62f5cd512@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a0uNv+m80abC6JxE"
Content-Disposition: inline
In-Reply-To: <a6ba7e89-f70b-3c51-5a65-06c62f5cd512@suse.com>


--a0uNv+m80abC6JxE
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 6 Jan 2022 17:59:03 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: Live update of Xenstore-stubdom

On Thu, Jan 06, 2022 at 03:33:49PM +0100, Juergen Gross wrote:
> I'm currently thinking how to implement live update of Xenstore-stubdom.
>=20
> I should note that my plan is to support live update for a Xenstore PVH
> stubdom only, as kexec functionality is much easier to implement for
> that case.
>=20
> The main problem is to transfer the Xenstore state to the new instance.
>=20
> Originally my idea was to keep the state in memory and hand it over to
> the new kernel as a module. This would probably work, but there is one
> basic problem with that approach: the Xenstore domain might need quite
> some additional memory to hold the module (roughly up to twice the
> memory it has in use when starting the live update).
>=20
> As a result the live update sequence would need to:
>=20
> 1. increase the maximum allowed memory of the Xenstore domain
> 2. allocate additional memory for the module
> 3. create the module
> 4. kexec to the new kernel
> 5. build the Xenstore from the module
> 6. free the module memory
> 7. decrease the max memory of the domain again
>=20
> The first and last step would need to be done by xenstore-control in
> dom0, while all the other steps would be done in the Xenstore-stubdom.
>=20
> As an alternative I was thinking to add some basic file operations to
> Xenstore-stubdom. This would have the additional benefit of having an
> easy way to add Xenstore logging support to the stubdom without the risk
> to lose logging data when using the console for that purpose.

What specifically is wrong about using console for logging? Rate limits?

> So what are the thoughts for the way to go with Xenstore-stubdom live
> update? Should I use stubdom memory for the state, or should I go with a
> file based approach (and if yes, 9pfs or pvcalls based)?

Personally, I'd go with memory, as IMHO it the cleanest design from
disaggregation point of view (what was in stubomain, remains in
stubdomain, no extra external interface necessary).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--a0uNv+m80abC6JxE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmHXH9YACgkQ24/THMrX
1yxBqQf/R+xOKA4SAt7+X07JsFPxrGMFMHQw7jqaU99Swx8+Ul8+2UT5meQPg71H
jq8japwTOBeAB/l74qJM3OvGRUxERdF7JbDCSuZDEqrmSyww0Uydg23GusqNez5I
J5NNSllOSJH3Ojjxtnq19YhOPoBEyDdpyQ+Aozlz1ysmMcbNjdXUN25lgOUB8ZTY
AW3+Jm0oG2vjtI8r8a+7sF99GRuHwZjRcfH5p3Ysi19zEYKoK7FWeQ93vPfT6305
DfTSqn/1Fc07vBAoJgPnYJ+zZ7Xtewd98xC0jxTSMKVnHlN25LeyLo6+J30t7kTU
35LOKhCVw4I7AK9rRS7JZ5/VcrxetA==
=/5IL
-----END PGP SIGNATURE-----

--a0uNv+m80abC6JxE--

