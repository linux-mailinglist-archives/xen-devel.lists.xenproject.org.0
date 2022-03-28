Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C89934E8BF7
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 04:13:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295275.502382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYes5-0002HZ-2G; Mon, 28 Mar 2022 02:12:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295275.502382; Mon, 28 Mar 2022 02:12:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYes4-0002Ff-SX; Mon, 28 Mar 2022 02:12:40 +0000
Received: by outflank-mailman (input) for mailman id 295275;
 Mon, 28 Mar 2022 02:12:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GJzZ=UH=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nYes3-0002FX-18
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 02:12:39 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87d73073-ae3c-11ec-a405-831a346695d4;
 Mon, 28 Mar 2022 04:12:37 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id C0C155C020F;
 Sun, 27 Mar 2022 22:12:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sun, 27 Mar 2022 22:12:33 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 27 Mar 2022 22:12:32 -0400 (EDT)
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
X-Inumbo-ID: 87d73073-ae3c-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=9t2EleITAOfSKUTni
	7B+knWPJP1OOCutW/VQVn038jw=; b=LWu+R3ScPZY/fZgzrwyfONUYB3Bcb+jMF
	/dj9Gtnr9aooL5NoSA8I4gvlWJdoygIWdWxtE+JjCvjAdq9c6Q47yWccIctY7wX1
	ur4XkeLXAmom56pkybwzLRyWosNdgKxRC37+VeVh+NTUaab8gNN7hNtq37cvJqjI
	sREO+jYMe4rzkS77aQ2yc15kFRR4UdNAILwgINSaGJ7V6Y/vcLLvjEThsTfsRBtf
	5nvY7uNziBJ5iK0f3e0Fv6dD0/L9XNS09r6QNTOQhwTwsfDpJDXPu5FHZe2xdFkx
	FFchUKKdHiCGfe/V1iRDGd6C/jXx8fHvuT6lOfAZPFrXABoLSCLIA==
X-ME-Sender: <xms:kRlBYsTku-erb-ujuIVmjwufnRleJk1BbVQC0u0wXJGZS-hnsMAkyA>
    <xme:kRlBYpybLp954MSBcAavk5faezUxTn0UJFw3dkeqegBh3guVzZ9u7HKukiruhkW8O
    xy-Bk_kqie7lQ>
X-ME-Received: <xmr:kRlBYp3B1lm7aUZ1jS1ywibiHsGiunAhrGwEBwiimmy4A9ci_kKBTvNhmYzSNg9GXf9xZlFT6qodS4z9vBqz4gY2anx-Mbs8SA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehiedgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeekfedt
    kefggedugfdvgfegtdelveektdekgfejteegveeijeeutdeuvedulefgffenucffohhmrg
    hinhepgigvnhhprhhojhgvtghtrdhorhhgpdhquhgsvghsqdhoshdrohhrghenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkh
    esihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:kRlBYgDqAhrNOOXvXn2hqpcfCfHdqJujo00OSi2De5FZqjtrXmeGYA>
    <xmx:kRlBYlhmvaUhWa-Zpv8-VCyCD6BfJGW3IBMvKMedYpoTZtZ6GtkQqA>
    <xmx:kRlBYso_nuV7NNtaKzke0tU0FaRbYKwqH_F3Y-HQsjPzrOAmaJVwMA>
    <xmx:kRlBYovmfS_b76j12_yhuJgO5ect32H1r3DsAJi2lZBRjFaWOLuJ4Q>
Date: Mon, 28 Mar 2022 04:12:29 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Damien Miller <djm@mindrot.org>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	OpenBSD technical mailing list <tech@openbsd.org>
Subject: Re: Security support status of xnf(4) and xbf(4)
Message-ID: <YkEZjYJOcjaRhP89@mail-itl>
References: <Yj3qW/y20htoSvuK@itl-email>
 <37a4b6-cd56-1993-be2-b5522b9aa4d7@mindrot.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZKs4wXnCuVSz9WDk"
Content-Disposition: inline
In-Reply-To: <37a4b6-cd56-1993-be2-b5522b9aa4d7@mindrot.org>


--ZKs4wXnCuVSz9WDk
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Mar 2022 04:12:29 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Damien Miller <djm@mindrot.org>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	OpenBSD technical mailing list <tech@openbsd.org>
Subject: Re: Security support status of xnf(4) and xbf(4)

On Mon, Mar 28, 2022 at 12:45:24PM +1100, Damien Miller wrote:
> On Fri, 25 Mar 2022, Demi Marie Obenour wrote:
>=20
> > Linux=E2=80=99s netfront and blkfront drivers recently had a security
> > vulnerability (XSA-396) that allowed a malicious backend to potentially
> > compromise them.  In follow-up audits, I found that OpenBSD=E2=80=99s x=
nf(4)
> > currently trusts the backend domain.  I reported this privately to Theo
> > de Raadt, who indicated that OpenBSD does not consider this to be a
> > security concern.
> >=20
> > This is obviously a valid position for the OpenBSD project to take, but
> > it is surprising to some (such as myself) from the broader Xen
> > ecosystem.  Standard practice in the Xen world is that bugs in frontends
> > that allow a malicious backend to cause mischief *are* considered
> > security bugs unless there is explicit documentation to the contrary.
> > As such, I believe this deserves to be noted in xnf(4) and xbf(4)=E2=80=
=99s man
> > pages.  If the OpenBSD project agrees, I am willing to write a patch,
> > but I have no experience with mandoc so it might take a few tries.
>=20
> Hang on, what is a "malicious backend" in this context? Is it something
> other than the Xen Hypervisor? If not, then it seems not to be a useful
> attack model, as the hypervisor typically has near-complete access to
> guests' memory and CPU state.

No, Xen supports running backends for PV devices in arbitrary domain,
not only dom0. You can read more about it at
https://wiki.xenproject.org/wiki/Driver_Domain
See also Andrew's response, Xen is way more disaggregated than KVM.

Qubes OS makes heavy use of this feature - for example network traffic
never passes through dom0 (which has no network interfaces at all!). You
can read more about it at the link below (especially look for the
diagram at the end, if you want just a quick look):
https://www.qubes-os.org/doc/architecture/

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--ZKs4wXnCuVSz9WDk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmJBGY4ACgkQ24/THMrX
1yx0vQgAkNtrh8mQbf7AKPIp0HO470TPuT2c9uReJpxpfDWJRA/EQsB4+0Xbafw7
xLv3QN/xd9ZHbK2SC6RZQI59ETTs3tUHa2Agsoo9I7uwPdL/Hdob4d3iIqcQbIzJ
lwWRdIrzJnldHRaF3bNkwR5XaCYRUi+aJJziSP/OeYkmscVquA+VSStwBrQFpEG6
azSwSbPkak56O5zhCTCpRMu9dRdkKOjKG3PtbO26bAGOst+daJHG6WLwCcgnGwmB
gmh6pRwFx6CE4tCCOkChpsITGz9yLL58eVAgDaZP6h4q4mlFd5S4DtEKF35ETdxL
0ep8tDZxUm9wZmgKbeWORjBkn8Az8Q==
=3zdN
-----END PGP SIGNATURE-----

--ZKs4wXnCuVSz9WDk--

