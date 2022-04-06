Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FDD4F5E6A
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 14:58:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299868.511129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc5FG-0005pM-RG; Wed, 06 Apr 2022 12:58:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299868.511129; Wed, 06 Apr 2022 12:58:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc5FG-0005nX-O2; Wed, 06 Apr 2022 12:58:46 +0000
Received: by outflank-mailman (input) for mailman id 299868;
 Wed, 06 Apr 2022 12:58:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uak5=UQ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nc5FF-0005nP-H2
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 12:58:45 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 496ca0d6-b5a9-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 14:58:44 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id A3C513200754;
 Wed,  6 Apr 2022 08:58:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 06 Apr 2022 08:58:41 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Apr 2022 08:58:40 -0400 (EDT)
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
X-Inumbo-ID: 496ca0d6-b5a9-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=UaXu2ljbFxpHZm2ZR
	ElGGgxV/C/16vS/A9gfGX6+AH8=; b=UMNSFCDaADd5TjYUg8XrRRm5seh2o6lXO
	53vv6jtkPTF5RFs0OPj6nNoivT1rrlA6Was2rwhT+XJxDyHv6l18H+ArkVxKeVq1
	8awYQAIu9o83g3Z/Ehz8Q9jLsCjf5sCNrsfDAoU0CWZ7MHr15fEx9+RGxezpBuZS
	NTVb/qcIpD+2wD1UDNMWq9tWj5pREZ8W+U/qQT+g+1V4bjQQfro8tO706S8d26dt
	jUYlUkfSfQsdifGfkYZOcdc2fDNUGpXi+OIZXAclQSGsVavhILYpNNFUmzCmoMR3
	jyEDFOmNrZyeZzzRMXu/cPza6bsoEIV5VeDxKPJB3ZqTXJT7HVYwA==
X-ME-Sender: <xms:gI5NYoTJ6ceLts4ZpAyoqT-kFUNTxy866iAII-KqCTJA9Ay7tKeBaA>
    <xme:gI5NYlyBPa8Hej19Cl5RN0ZI2q46jNUV1HOFWGqB87ZcNvQ4LLtOPqhZTITBxFs21
    4LqWMV5wNY0vA>
X-ME-Received: <xmr:gI5NYl0Umd9K7puxUvymX4rbtHljuJgsSZiWbiEZ1R-YEOHVRWdSTXk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejiedgheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:gI5NYsClGG0l9V_-vep8L1hk-O_P2JB2naFYzrQRSFLzGM-6ev_pAg>
    <xmx:gI5NYhjXrCEwMm0N6-wecMGwaswRpTzQ-AHz5Q15pBMa6sh9cHG9Uw>
    <xmx:gI5NYorB3TpeiTkoWRDMde-aThT1rBlUT-Gn1USvuSqO9zHH3HxRlA>
    <xmx:gY5NYrcDVhCPEC0auNXobCb4LFU34jC174zb2mpxOHEiV2moCMHFqw>
Date: Wed, 6 Apr 2022 14:58:37 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Increasing domain memory beyond initial maxmem
Message-ID: <Yk2OfpSaz9U0agrn@mail-itl>
References: <YkUlLvnEDdc5hwN4@mail-itl>
 <2684376b-3ae6-a2b7-581f-2bd38ab6056b@suse.com>
 <YkWYGFJ/Cl+B2C37@mail-itl>
 <362b6115-e296-e01e-520f-31a0826426eb@suse.com>
 <YkWgQNKK7SarjKDN@mail-itl>
 <a9325c01-f6bd-46e8-d730-3f18b71b9969@suse.com>
 <YkxtOxOCY8nxy0Gt@mail-itl>
 <8e392b3c-8808-509e-adb7-f4a3c1a5c86c@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="K+cFpVUOlasexP8z"
Content-Disposition: inline
In-Reply-To: <8e392b3c-8808-509e-adb7-f4a3c1a5c86c@suse.com>


--K+cFpVUOlasexP8z
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 6 Apr 2022 14:58:37 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Increasing domain memory beyond initial maxmem

On Wed, Apr 06, 2022 at 07:13:18AM +0200, Juergen Gross wrote:
> On 05.04.22 18:24, Marek Marczykowski-G=C3=B3recki wrote:
> > On Tue, Apr 05, 2022 at 01:03:57PM +0200, Juergen Gross wrote:
> > > Hi Marek,
> > >=20
> > > On 31.03.22 14:36, Marek Marczykowski-G=C3=B3recki wrote:
> > > > On Thu, Mar 31, 2022 at 02:22:03PM +0200, Juergen Gross wrote:
> > > > > Maybe some kernel config differences, or other udev rules (memory=
 onlining
> > > > > is done via udev in my guest)?
> > > > >=20
> > > > > I'm seeing:
> > > > >=20
> > > > > # zgrep MEMORY_HOTPLUG /proc/config.gz
> > > > > CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> > > > > CONFIG_MEMORY_HOTPLUG=3Dy
> > > > > # CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
> > > > > CONFIG_XEN_BALLOON_MEMORY_HOTPLUG=3Dy
> > > > > CONFIG_XEN_MEMORY_HOTPLUG_LIMIT=3D512
> > > >=20
> > > > I have:
> > > > # zgrep MEMORY_HOTPLUG /proc/config.gz
> > > > CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> > > > CONFIG_MEMORY_HOTPLUG=3Dy
> > > > CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE=3Dy
> > > > CONFIG_XEN_BALLOON_MEMORY_HOTPLUG=3Dy
> > > > CONFIG_XEN_MEMORY_HOTPLUG_LIMIT=3D512
> > > >=20
> > > > Not sure if relevant, but I also have:
> > > > CONFIG_XEN_UNPOPULATED_ALLOC=3Dy
> > > >=20
> > > > on top of that, I have a similar udev rule too:
> > > >=20
> > > > SUBSYSTEM=3D=3D"memory", ACTION=3D=3D"add", ATTR{state}=3D=3D"offli=
ne", ATTR{state}=3D"online"
> > > >=20
> > > > But I don't think they are conflicting.
> > > >=20
> > > > > What type of guest are you using? Mine was a PVH guest.
> > > >=20
> > > > PVH here too.
> > >=20
> > > Would you like to try the attached patch? It seemed to work for me.
> >=20
> > Unfortunately it doesn't help, now the behavior is different:
> >=20
> > Initially guest started with 800M:
> >=20
> >      [root@personal ~]# free -m
> >                    total        used        free      shared  buff/cach=
e   available
> >      Mem:            740         223         272           2         24=
3         401
> >      Swap:          1023           0        1023
> >=20
> > Then increased:
> >=20
> >      [root@dom0 ~]$ xl mem-max personal 2048
> >      [root@dom0 ~]$ xenstore-write /local/domain/$(xl domid personal)/m=
emory/static-max $((2048*1024))
> >      [root@dom0 ~]$ xl mem-set personal 2000
> >=20
> > And guest shows now only a little more memory, but not full 2000M:
> >=20
> >      [root@personal ~]# [   37.657046] xen:balloon: Populating new zone
> >      [   37.658206] Fallback order for Node 0: 0
> >      [   37.658219] Built 1 zonelists, mobility grouping on.  Total pag=
es: 175889
> >      [   37.658233] Policy zone: Normal
> >=20
> >      [root@personal ~]#
> >      [root@personal ~]# free -m
> >                    total        used        free      shared  buff/cach=
e   available
> >      Mem:            826         245         337           2         24=
4         462
> >      Swap:          1023           0        1023
> >=20
> >=20
> > I've applied the patch on top of 5.16.18. If you think 5.17 would make a
> > difference, I can try that too.
>=20
> Hmm, weird.
>=20
> Can you please post the output of
>=20
> cat /proc/buddyinfo
> cat /proc/iomem
>=20
> in the guest before and after the operations?

Ok, that was a stupid mistake on my side - I've run out of host memory.
With that fixed, it seems to work, on 5.16.18 too.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--K+cFpVUOlasexP8z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmJNjn0ACgkQ24/THMrX
1yxYYAf/TYbp93H4jclpmuhGLbyZ03BaX3pLYKVJBpVlo33V4op1tPtLUMEkYM9U
Qq/zzZuv9sVeDq3ge3X0yT7mRhOa41SxKT4GDyCjjKNdngFy67JWvgRIY4ZDn/t9
jclQe6VToBnN6sgnv0erBJalYrRKnx9WeKZzJdNqjlfxPd6AvgnNMNZnMxzi/7zT
MM/CrnVLjbi239aplFUPxr3Be7/L8z9IrcU8qBJk2bMCncLPt0KJsmn+Jymer58B
x0gzOgtyFjW0KngocDWBBegQcCZWeNjUztNpmdHY2EYhq4SqqNunK1mTuQ3+wTgB
yxbOE3+WMEBrc1Gnr1J56TIZbuc8Sw==
=1sHk
-----END PGP SIGNATURE-----

--K+cFpVUOlasexP8z--

