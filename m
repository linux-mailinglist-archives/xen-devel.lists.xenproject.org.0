Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7159A9C5EA5
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2024 18:19:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834802.1250630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAuWg-0001fM-KB; Tue, 12 Nov 2024 17:18:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834802.1250630; Tue, 12 Nov 2024 17:18:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAuWg-0001cW-GJ; Tue, 12 Nov 2024 17:18:02 +0000
Received: by outflank-mailman (input) for mailman id 834802;
 Tue, 12 Nov 2024 17:18:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TvMk=SH=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1tAuWf-0001cL-9E
 for xen-devel@lists.xen.org; Tue, 12 Nov 2024 17:18:01 +0000
Received: from fout-b8-smtp.messagingengine.com
 (fout-b8-smtp.messagingengine.com [202.12.124.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a341f7b-a11a-11ef-99a3-01e77a169b0f;
 Tue, 12 Nov 2024 18:17:49 +0100 (CET)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfout.stl.internal (Postfix) with ESMTP id D93B01140158;
 Tue, 12 Nov 2024 12:17:47 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Tue, 12 Nov 2024 12:17:48 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Nov 2024 12:17:46 -0500 (EST)
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
X-Inumbo-ID: 0a341f7b-a11a-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIwMi4xMi4xMjQuMTUxIiwiaGVsbyI6ImZvdXQtYjgtc210cC5tZXNzYWdpbmdlbmdpbmUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjBhMzQxZjdiLWExMWEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDMxODc1Ljg3NjM1Mywic2VuZGVyIjoiZGVtaUBpbnZpc2libGV0aGluZ3NsYWIuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbi5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1731431867;
	 x=1731518267; bh=ijnLtDgvmWOar4/me3j4PwWALwrWFCx/YAIFNwDgOBw=; b=
	lS+Fn4zYVlZXHHy+GfYpm/GzyedEGFcQHnVIZlu9zNgjMGUHl6XkWtqxutBuBMD0
	JWMy6u+dboC5tq1FbfOgiqzrU+lIm7rfI5QjhH6VldPD7a6HO7TYzZI+ZInPG3q6
	2fgBU+WsaBuUdO+H7OJhHyBM8Kf/8PJVhng6AOUbSpapTPBZdpsgEIBWOtLagXai
	aCNeCv/9XJsm9hM6S9oteY8HSIhdQdHjhdncf6gb7bbnXxuAXr+m9CYXlSwQb7O/
	n9P5vE4DT+5qwILyBeRzG+MlhUFcVkDW2QDjaUmVtwKEcrVJR+bcgmxJwf6v4gUy
	xoS30AbiuUlOUErXRXKTsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1731431867; x=1731518267; bh=ijnLtDgvmWOar4/me3j4PwWALwrWFCx/YAI
	FNwDgOBw=; b=kPskJuplgj0NZxMxMWgPy410eOS/88O0doZx2uri4jNyd1Hr+kQ
	d+hch0Y3U7WKRFt/y5I9/fuvQG24+EVLjTcjEkgufFeVAfCnZ5fyf2uyd+D/Q+wm
	qB8YAeI2I/c5yZ6Wn9RW62RLg2iyOBQ22fN0b5hjhzL9DBkMLaeiwG7sPC25fuLc
	a35TdwcJVfqc3aTOSqScr1m//c2ohXYYhggqStVL7eAk5I5kyAmzHoIi1VJtMqqY
	VQY9NMY5i7GepezFf0c+84OmzXJHs1I3CDYJGMbLze+9lU4hNAKijILvLvqj8igy
	WgIhdo+ir0hJAuSJ5oVcn0rVLDfGPpINg7Q==
X-ME-Sender: <xms:u40zZ7Rx02M1_2f6Bgx1-R7cLUQQqmzspx4yrAzuliQ1d2KQo-J91A>
    <xme:u40zZ8w9FavlOqOON5rqXruL7P5cnMK60jmb-Dr1FTeQPL_hkXwlURkhQOnQe62Pa
    SOr-DmlfSjEKkQ>
X-ME-Received: <xmr:u40zZw3wAMX71O-kTKaIsDr2XyAR1L9OY3v44jpWctvEw7Wy9qi0Ho5Bf2EZk1YdS6eozQbJm3ygGC7p9-KctwPG66ZWNkyRLk4RTr9pHGZg2UH5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeggdelhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecu
    hfhrohhmpeffvghmihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeduieelfeeu
    tedvleehueetffejgeejgeffkeelveeuleeukeejjeduffetjeekteenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhi
    sghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehoshhsqdhsvggtuhhrihhthieslhhishhtshdrohhp
    vghnfigrlhhlrdgtohhmpdhrtghpthhtohepgigvnhdqrghnnhhouhhntggvsehlihhsth
    hsrdigvghnrdhorhhgpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigv
    nhdrohhrghdprhgtphhtthhopeigvghnqdhushgvrhhssehlihhsthhsrdigvghnrdhorh
    hgpdhrtghpthhtohepshgvtghurhhithihqdhtvggrmhdqmhgvmhgsvghrshesgigvnhdr
    ohhrgh
X-ME-Proxy: <xmx:u40zZ7BP8Y9x5dbJFapL0dHJOItfObf9Zv2RypGXR1F5z9w9JycH9Q>
    <xmx:u40zZ0jS2mlypibJLGqdReyo0kREI8cWJSe2Rv-7Op18NIOHwYUtZw>
    <xmx:u40zZ_rUXnY2Q4DAgLwzaMQXbPhRai3aMcvoWedDMJRIBIKZTOAH0g>
    <xmx:u40zZ_jbzi78V9kDhB31SeBie1useTaol-G3oKh9H2g8C_RA3KAAZg>
    <xmx:u40zZ8fxEqtbaIIiEkkRym-hjm-q_J1YFGm6IqvbgCPbYX-i6R4jR-kS>
Feedback-ID: iac594737:Fastmail
Date: Tue, 12 Nov 2024 12:17:32 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: oss-security@lists.openwall.com, xen-announce@lists.xen.org,
	xen-devel@lists.xen.org, xen-users@lists.xen.org
Cc: "Xen.org security team" <security-team-members@xen.org>
Subject: Re: [oss-security] Xen Security Advisory 464 v2 (CVE-2024-45819) -
 libxl leaks data to PVH guests via ACPI tables
Message-ID: <ZzONuZFo1-AXNOFd@itl-email>
References: <E1tApeV-001S2c-2H@xenbits.xenproject.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7Jj9SHbtbfH3XlO5"
Content-Disposition: inline
In-Reply-To: <E1tApeV-001S2c-2H@xenbits.xenproject.org>


--7Jj9SHbtbfH3XlO5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 Nov 2024 12:17:32 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: oss-security@lists.openwall.com, xen-announce@lists.xen.org,
	xen-devel@lists.xen.org, xen-users@lists.xen.org
Cc: "Xen.org security team" <security-team-members@xen.org>
Subject: Re: [oss-security] Xen Security Advisory 464 v2 (CVE-2024-45819) -
 libxl leaks data to PVH guests via ACPI tables

On Tue, Nov 12, 2024 at 12:05:47PM +0000, Xen Security wrote:
> Only PVH guests can leverage the vulnerability.  HVM and PV guests
> cannot leverage the vulnerability.  Note that PV guests when run inside
> the (PVH) shim can't leverage the vulnerability.

Is this unconditional (perhaps because the relevant data gets zeroed out
by the shim), or does it only apply when the PV guest can't extract data
=66rom the shim's memory?  For instance, 32-bit PV guests aren't security
supported anymore, but the PV shim isn't supposed to rely on the
security of the shim itself, only of the rest of the system.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--7Jj9SHbtbfH3XlO5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmczjbQACgkQszaHOrMp
8lNKRQ//fncRGpQS3i56xefRQVPTv0stbt6+FFFlM//dfnsbm3VBG6UNGKvU0wx3
mLCt6zBq1GvcApEyWPaoDUKAp8d+GKlBzMITEvsA7udAp48dAPcMel0/SE03faxW
P4g9MuLmiQuXDbjlhA+mwVNSxqrV+R9fDp0IstFy2XgnpWC1pjImtaUYITS2E1NK
QlSUWNVmnqrlKdbxxSGmJUYE2MDJ5C7QVsdra4jcCIjpkcQrpmyxNx6HM3EJRc7V
0PUd+XP8PYnpU4SSFgOmYXEhVDJGTISE1XIGDnhF8zzLVU5IPZLLNGu2kZyz1T2x
vxgsDb8FSsqleGIZXNZeNYLHzCKcEWrhxJCuH0El221MnIb0QP6iSKP1EQfNQShX
lUcJFNng63latxvebGUNpZ4GSkG21gpIF/0be2KZNCt1a8cUQM+A1/YCAf0e+idP
SX37fovtsg2wP+Z4R0vUCkacgj37PaCp40Fe7nRxcSan1wsCF40hnfJ2qENuWp8N
skEFG3u4yZ7onaayoQYi/LIAe1tj9oa8FnXbB2YwWwySS9W5YPZAGg7HlCtZapNN
PAPcou8vGFseKRVHbU5ojY33g3Ok72nd8Ge2djJopeQNDF4RkH7NauxFbxP3UDs+
RZ9jhJDHijOQHU20kmUEUudro7gZAMkkKzuNkTVt+BcZA0h/9Xs=
=72sK
-----END PGP SIGNATURE-----

--7Jj9SHbtbfH3XlO5--

