Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AA8339134
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 16:25:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97194.184497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKjew-0007SN-P0; Fri, 12 Mar 2021 15:25:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97194.184497; Fri, 12 Mar 2021 15:25:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKjew-0007Ry-Ln; Fri, 12 Mar 2021 15:25:02 +0000
Received: by outflank-mailman (input) for mailman id 97194;
 Fri, 12 Mar 2021 15:25:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=25cJ=IK=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1lKjev-0007Rt-94
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 15:25:01 +0000
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 787a0a92-413d-47e1-b028-8d1a64ee8e12;
 Fri, 12 Mar 2021 15:25:00 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 48CEB5C0101;
 Fri, 12 Mar 2021 10:25:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 12 Mar 2021 10:25:00 -0500
Received: from mail-itl (ip5b434f04.dynamic.kabel-deutschland.de [91.67.79.4])
 by mail.messagingengine.com (Postfix) with ESMTPA id 12F62108005F;
 Fri, 12 Mar 2021 10:24:57 -0500 (EST)
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
X-Inumbo-ID: 787a0a92-413d-47e1-b028-8d1a64ee8e12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xzg0Ty
	omI36gh5b53iHyS/0ykRdT0c907OhwYFupXHA=; b=s56Xkd0ejuxPaprQj9//7z
	GONr5jM9uepxrcz+x3W9YmhxOZzupG+m3g3ZzryaFL+6XXKBqIThlYJPsAzyoHvY
	KiC+XOVhtzxBiXvOXKBUrlvZMHWGetnZeD5ouUtiLTYvXyck6UEx8hi1HR3G6JGR
	g3wcETgub75fIdEaVSi8MsjwSs6HcDZZb4UCEZse0prosJ39ggGS9abuvuGyjJXe
	KX1d/FSHWyRWl0aD+xhwvufjTYybYs8QC56NjF6JYK+Q9hg6JVDv8PjZa+tifzfL
	sxA+6CTZfjt9ubKJaiwxHbxn1nKf4yP9MKhLJ3TVG2pnyCJ3OoLZqhYV01DKy+xQ
	==
X-ME-Sender: <xms:yodLYClleXOfA96Y-oum5-YNVyPh3G2tB9h3421UvbqE0V5PhExh6w>
    <xme:yodLYJ0EVVPu5GdvFpPesPsn47LD8g3-ehWIkoBMpfQDV9DR5L9usHInTiMiXwfpc
    -HLVDb03fJahA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddvvddgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucfkpheple
    durdeijedrjeelrdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtg
    homh
X-ME-Proxy: <xmx:y4dLYApddDspCEqJMf0fvy7IPxulm_DPzymduJW0TY-g6guW_Djtag>
    <xmx:y4dLYGkFPpJyhajHX2scBSNlWqdb6iAxDwFoLZH-tVmx-FIbx_Yx-A>
    <xmx:y4dLYA1oVETXBfOrHF4OfeW9L7qKZNb98hTRds4VlhBqbxnhEdSwTA>
    <xmx:zIdLYNz9wVfuAOikXh2aBlCYP6Wqicp0yZgbHZueMzSMvezGb6-8ZQ>
Date: Fri, 12 Mar 2021 16:24:53 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Bob Eshleman <bobbyeshleman@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, piotr.krol@3mdeb.com,
	Olivier Lambert <olivier.lambert@vates.fr>,
	Trammell Hudson <hudson@trmm.net>
Subject: Re: Working Group for Secure Boot
Message-ID: <YEuHxZy1daBQjGma@mail-itl>
References: <9280f0d0-e994-71c1-9482-63f97296acb7@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/yH1B15JiJxZxna/"
Content-Disposition: inline
In-Reply-To: <9280f0d0-e994-71c1-9482-63f97296acb7@gmail.com>


--/yH1B15JiJxZxna/
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Mar 2021 16:24:53 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Bob Eshleman <bobbyeshleman@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, piotr.krol@3mdeb.com,
	Olivier Lambert <olivier.lambert@vates.fr>,
	Trammell Hudson <hudson@trmm.net>
Subject: Re: Working Group for Secure Boot

On Thu, Mar 11, 2021 at 10:34:02AM -0800, Bob Eshleman wrote:
> Hey all,
>=20
> We would like to start a working group for secure boot support in Xen
> to coordinate the various interested parties and set out a plan for
> the feature and its implications for the whole Xen system.
>=20
> The end goal is a full implementation that restricts the interfaces
> dom0 has to affect Xen, akin to Linux's lockdown LSM.  This implicates
> important parts of the ABI (e.g., /dev/xen/privcmd/) and so will
> require input from the greater community.
>=20
> I'm not familiar with how working groups function in the Xen project,
> so this email also opens the floor for suggestions as to how this might
> be managed.
>=20
> We'd love to hear from anyone interested in such a group and how the
> community as a whole feels about such an effort.

Count me in too.

Also, I'm cc-ing Trammell, who might be interested too.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--/yH1B15JiJxZxna/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmBLh8YACgkQ24/THMrX
1yypnwf/dAFTUF0m98AGgQO9xAbLGmP+Vb7Y32jqQyuQavdV9veAh5h/m2IYoYDp
eW8mzVWXaRllyEOaqwpZjf4qhb74m2CUU1BjN446LaAQLfPoW8En8YhT0ZiwGjR3
4OR7ZTZUPY40thzCqpeVdQQCILjcGUf1R6HuPK0qiDuOrh4z4NxTRqgigPBEdYrw
U2nGFt9xncr5KqTCHFg8wGTm40Ypb4+8M7p1UWz8o/inlLATraIkk9fiXMEndghH
odtLRN1tfo7Rs0eoT7zIe48TJW/B/lo+gVqJ+C2JE2cKjwxdx0GIge4s4GYjwdwh
r6yhG+mFpC24ZCHYna87EloSUw+cAQ==
=Qepr
-----END PGP SIGNATURE-----

--/yH1B15JiJxZxna/--

