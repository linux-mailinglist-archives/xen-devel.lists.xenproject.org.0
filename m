Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD7250AD26
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 03:17:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310603.527514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhhvS-00015D-I3; Fri, 22 Apr 2022 01:17:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310603.527514; Fri, 22 Apr 2022 01:17:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhhvS-000125-EF; Fri, 22 Apr 2022 01:17:34 +0000
Received: by outflank-mailman (input) for mailman id 310603;
 Fri, 22 Apr 2022 01:17:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Gha=VA=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nhhvQ-00011x-SL
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 01:17:33 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa567f6f-c1d9-11ec-8fc2-03012f2f19d4;
 Fri, 22 Apr 2022 03:17:31 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 00B773204C42;
 Thu, 21 Apr 2022 21:17:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 21 Apr 2022 21:17:28 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Apr 2022 21:17:26 -0400 (EDT)
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
X-Inumbo-ID: fa567f6f-c1d9-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650590247; x=
	1650676647; bh=QWT3dbAmUvyabDJUMuZpvTjLmuuGeRRGSg6uQOlr4Nk=; b=b
	nZBbUJ9qksaSSNy91F2QrNz2iCVGdrtUfjfYJBXRYFqF7elJOIa/V8Gng08lJh0H
	Y1CDpnxviT9H56iffyjEJdSt4mBmQaSJHa6ZQ+b+7qiDZTEi75dGrxfvBjtXjvQh
	rRAKawrcUZrJNTPhLpPT3RwzwpJ1k3+Ng4ejWMMWPSmsW4A27jLOEXl6waB74IfU
	C/i3ZAURjg5qlbx0ht8HgWDX3L6lMVDQey+0ynwlCaXf28ZlwvG9NXq44l/JbS82
	j7Ai90VRyDUIp7THWVzpAZKVddOorOuH6yw7qZxjGe89URzyr3y99hKkborYdlMq
	uzRgnWaHowzKy8PrGVRAQ==
X-ME-Sender: <xms:JwJiYsHaysRo9p-Ot2o9doSJSBuEmCeothrGehqPscProo9qa7D7pw>
    <xme:JwJiYlWmylq-nUvz8KAk1xeYkIotLBWPLTZTTg7389HhTBePcwkpDysoE2EYOlgpg
    LmeK0fUqWzkqA>
X-ME-Received: <xmr:JwJiYmKIdb1yDZLIdlDOBm9bDqT_4rsQZ3sRkdyU6xo4rzejHnSLpiNQnkrfeNebd2XJlEoIMfdZ-W0R54b2PfrANzse_9-Qkg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtdefgdeggecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeekgfel
    ueffhfekkeefffelvdefffettefhtdetkeejudeihefgveevvdefjefhueenucffohhmrg
    hinhepghhithdrihhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtg
    homh
X-ME-Proxy: <xmx:JwJiYuGJzj5ov-nb0-hl62QAOuOcbD6rDdY69yaDjjFAeDytCQtVIg>
    <xmx:JwJiYiWfgMMF_sRisc9vkPcpOodmjq18CTO_6cdg4aIEEGmbzXoQ_Q>
    <xmx:JwJiYhOdwRmnFYHJ1MclSp4ollCvMiDycIe-p6bJCmOK7PIFI7G4Ew>
    <xmx:JwJiYleQHig7dLTpAZQMc-vhpCRXnuRkQyPXb5FdaxpbgLJlYt10Ww>
Date: Fri, 22 Apr 2022 03:17:23 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 0/1] Adjust odd Python bindings
Message-ID: <YmICI1BPTBIqdgBq@mail-itl>
References: <cover.1650551486.git.ehem+xen@m5p.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AxwdiV6ExxuBrUzG"
Content-Disposition: inline
In-Reply-To: <cover.1650551486.git.ehem+xen@m5p.com>


--AxwdiV6ExxuBrUzG
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 Apr 2022 03:17:23 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 0/1] Adjust odd Python bindings

On Thu, Apr 21, 2022 at 07:31:26AM -0700, Elliott Mitchell wrote:
> I'm unsure how widely the Python bindings are used.  Certainly they were
> used for PyGRUB.  Have any other projects used them so far?  What I'm
> doing is likely to be contributed to the Xen Project, and I suspect the
> existence of other projects would be known...

Yes, Python bindings are used outside of xen.git. I'm aware of few
places in Qubes OS, but I expect there are other users too. So, I'm
afraid breaking the current import method isn't really an option. What
you could try, is to make both versions work at the same time, but TBH
I'm not sure how to do that with C extension.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--AxwdiV6ExxuBrUzG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmJiAiMACgkQ24/THMrX
1yz6wQf/cIPnIRxyOglAypJxmkOB99sDBRozgGKP0UjlAVZ7gHhE9mdcounJNNgN
XajK56k8+NQGfcJXjGBEEpnyJqsDXX5sl382c4NFVewgZf4jso2CiTl3YDzisKz8
KFTsRldcZeqZs7X0+Ly7ypHjgCDe3AJ/9XsDw9FNYhntdS/3gDURhA4yNfq8uwKC
5ShvPdM10dR5tPNC6ZC/k39JF3fosqkzQN/TGxLcWXATlqhKWvXCJZSfSigoPQg4
sarX9heJ1DcmvzXHxH94aT/6WX1ZlAkZkWDx/HgzV4gs2ymAaPh8ov8a2NktTUrX
+NLH/QK0zmbbp97ZRcdbnH6u12Xefg==
=4Q1I
-----END PGP SIGNATURE-----

--AxwdiV6ExxuBrUzG--

