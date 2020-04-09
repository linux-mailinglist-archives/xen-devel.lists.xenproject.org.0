Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6921A397B
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 20:01:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMbUL-0007vU-6n; Thu, 09 Apr 2020 18:01:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0x02=5Z=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1jMbUJ-0007vO-PY
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 18:01:15 +0000
X-Inumbo-ID: 1a5d4fe6-7a8c-11ea-8319-12813bfff9fa
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a5d4fe6-7a8c-11ea-8319-12813bfff9fa;
 Thu, 09 Apr 2020 18:01:14 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 5E4155C1780;
 Thu,  9 Apr 2020 14:01:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 09 Apr 2020 14:01:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=gRT/1G
 S2FNE/8Wz1ufJKMIEmWJdN8Pr16tSQgYlosk0=; b=rI99I94ieaKiZqAKXxB6X6
 R2NlVaYYO7Kxgfb/kMvwPw0+BuD5/dlhWCE1u0b5mT0XQCQhYCvSvm5AWsftdMna
 RwBNcZM/WihKx6o6B640AwU3ACdHizg6NphPBNNEk3U4ZOlNfc046wg63tnQrl29
 TQ0plNll24D+ilqVcEIuMaY3cr9lM5/P2UB+9QnDUz+Oh6qL8m6dOhxdtKPjqKlV
 ColNi7OEJIhG01hGSFwTZSFgIAcKPsiZDdc73pVEx4nfJZ7dFI/kl6AgTGstrS6E
 sh6VT0rt2NLPi/fe/c32JysRhRhG//OfLcTdPxwLtUxtT2/7k7/Y5u6WqFi+TQhw
 ==
X-ME-Sender: <xms:6mKPXsO1aGDudd6wuRaPvrhwImHnXpyN4RwS4UJ9dtZ8NBHCscAPiw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudelgdduudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:6mKPXug8uI_RR_rkK7gU5fNZG9FIwqN1hysr51P8Nmw3h_Y4rW-1bg>
 <xmx:6mKPXjT7BNxhU_XrZ9IK3G7PH2lu0HDHdYbxnqNTe40z1aWF-1oS1Q>
 <xmx:6mKPXpqgENYCxrvEwrHBlNwOQBZFhrKGDIPH3xnMh9-T-3rf4PSfqQ>
 <xmx:6mKPXhyhiqZD2h4mwn-GDyHQ_dAoClgzkMPt61t-oeixBxxO7obCYQ>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id EF6B6306005C;
 Thu,  9 Apr 2020 14:01:12 -0400 (EDT)
Date: Thu, 9 Apr 2020 20:01:09 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: preparations for 4.13.1 and 4.12.3
Message-ID: <20200409180109.GK2995@mail-itl>
References: <f8ecb6b1-00de-67c1-07c6-6fdb92dd63ae@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Bzq2cJcN05fcPrs+"
Content-Disposition: inline
In-Reply-To: <f8ecb6b1-00de-67c1-07c6-6fdb92dd63ae@suse.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--Bzq2cJcN05fcPrs+
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: preparations for 4.13.1 and 4.12.3

On Thu, Apr 09, 2020 at 09:41:49AM +0200, Jan Beulich wrote:
> All,
>=20
> the releases are due in a week or two. Please point out backports
> you find missing from the respective staging branches, but which
> you consider relevant. (Ian, I notice there haven't been any
> tools side backports at all so far. Julien, Stefano - same for
> Arm.)

Proposed backports (tools):

0d99c909d7 libxl: wait for console path before firing console_available
d094e95fb7 libxl: fix cleanup bug in initiate_domain_create()
1f706eace3 libxl: create domain 'error' node in xenstore
e19b4b3b55 tools/python: mismatch between pyxc_methods flags and PyObject d=
efinitions
1430c5a8ca tools/python: Python 3 compatibility

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--Bzq2cJcN05fcPrs+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl6PYuUACgkQ24/THMrX
1yw/Mwf+Ns82HujB6laFsidLGACV6xGcbI2eK1zMjoH972p/6ZDTK4f/BVL2y4Pa
8GT5E5p1XbtB+eM3OyZCwD5rj61X0yf4NxEFB6VRb7qKWiAKewMsgwPrTlVrdLsu
RYwlbTHYEHCq9ABCDWMBrIxGT7hFQnqxEjASbmbExAN48Q2JmN1+zuy64utkquao
QibnHVUDEl+Rti0Q+gFrHK3vbil1Dx8uEX+zjCISxav9I/gRZI7Je8YZGz7PIyuz
Ta04O5uKXMXqQWOCTOO8iSl2arzX4s80kj183fdhPCLuHgOUfNftcQuauD07FJMk
ib0UYgy3pt5eLe9R7OZnEXtUbrq6bg==
=nggg
-----END PGP SIGNATURE-----

--Bzq2cJcN05fcPrs+--

