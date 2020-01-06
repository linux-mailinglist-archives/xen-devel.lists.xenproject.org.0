Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E20F21313E8
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 15:42:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioTWm-0004Ou-Q7; Mon, 06 Jan 2020 14:38:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tjc+=23=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1ioTWl-0004Ol-8t
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 14:38:43 +0000
X-Inumbo-ID: 3c265e86-3092-11ea-ab12-12813bfff9fa
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c265e86-3092-11ea-ab12-12813bfff9fa;
 Mon, 06 Jan 2020 14:38:42 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 563AB75A;
 Mon,  6 Jan 2020 09:38:41 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Mon, 06 Jan 2020 09:38:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Hg6rci
 SSb+e+hCV5/O+E3dBhJDMHcdusftaG+jDIhRY=; b=cHJF2fug9YjKqLBYRUfZeN
 n9yG0kAqAcHdQ+Ve2RoLZDPY94cfQj0/tArGCQIl9LJqCubTPnl5QQaGrx+gJPIQ
 n3j59YDLYiseU6cB2BkCWlDiaDL64p5oJwPMYoATvkLOStt/WYivc2m6rRFA1I3k
 oobwLM40RCMN5REvCr0Wj0M5BgYDZEl5PMsEdiar735pMeeuigNF9Aou3iTlZrVV
 d0EEILiiDzkjhUsQnL8nGir5BRRyHVupXKFRvVqUNje0Qw5O6gL8/Oht7IbbKT1h
 DhwTCoqZdVK1AuKjhh88ScTdmxNdDC6NkQBSa8f4NElf+IB1nuC+HJoevbuy96Ew
 ==
X-ME-Sender: <xms:cEYTXgptFag89IgPL1YDTTNAroykdZcW52XfA9lt3VFDv_rWpeYM4A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdehtddgieekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:cEYTXvYEd58VkWrSuajDLVagVa2W03jBElTkS7N9F4x5lqUuMy1dUA>
 <xmx:cEYTXj5AiQW1SNxRvEoiR-LGFegOTXIms37JEEXcRWYZ7J6RfrzZKw>
 <xmx:cEYTXqSlagrUPGXdk50bWBUaq4F8R37YuVjEBLC6jSRmfH6495iDVw>
 <xmx:cEYTXon1Mq08zOTiIOkMn1fg7fDeCxbxzsg0-1XNXaKPOe9Djgubvw>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id EA8D880063;
 Mon,  6 Jan 2020 09:38:39 -0500 (EST)
Date: Mon, 6 Jan 2020 15:38:36 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20200106143836.GK1314@mail-itl>
References: <20200105084148.18887-1-marmarek@invisiblethingslab.com>
 <24083.16958.769634.476071@mariner.uk.xensource.com>
MIME-Version: 1.0
In-Reply-To: <24083.16958.769634.476071@mariner.uk.xensource.com>
Subject: Re: [Xen-devel] [PATCH] libxl: create backend/ xenstore dir for
 driver domains
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: multipart/mixed; boundary="===============3761429362414940548=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3761429362414940548==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Hlh2aiwFLCZwGcpw"
Content-Disposition: inline


--Hlh2aiwFLCZwGcpw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] libxl: create backend/ xenstore dir for driver domains

On Mon, Jan 06, 2020 at 02:20:46PM +0000, Ian Jackson wrote:
> Marek Marczykowski-G=C3=B3recki writes ("[PATCH] libxl: create backend/ x=
enstore dir for driver domains"):
> > Cleaning up backend xenstore entries is a responsibility of the backend.
> > When backend lives outside of dom0, the domain needs proper permissions
> > to do it. Normally it is given permission to remove the device dir
> > itself, but not the dir containing it (named after frontend ID). After a
> > whole those empty leftover directories accumulate to the point xenstore
> > returning E2BIG on listing them.
> >=20
> > Fix this by giving backend domain write access also to backend/
> > directory itself when c_info->driver_domain option is set. The code
> > removing relevant dir is already there (just lacked permissions to do s=
o).
> >=20
> > Note this also allows the backend domain to create new entries,
> > pretending to host backend devices it don't have. But since libxl uses
> > /libxl/ xenstore dir for this information (still outside of backend
> > domain control), this shouldn't be an issue.
>=20
> This seems quite hazardous to me.  The reasoning you use to show that
> this iws OK seems fragile, and in general it doesn't feel right to
> give the particular backend such wide scope.
>=20
> Can we find another way to address this problem ?  I think the
> containing directory should be removed by the toolstack.  Why is this
> difficult ?  (I presume there is a reason or you would have done it
> that way...)

It was done this way previously and caused issues, see this commit:

commit 546678c6a60f64fb186640460dfa69a837c8fba5
Author: Roger Pau Monne <roger.pau@citrix.com>
Date:   Wed Sep 23 12:06:56 2015 +0200

    libxl: fix the cleanup of the backend path when using driver domains
   =20
    With the current libxl implementation the control domain will remove bo=
th
    the frontend and the backend xenstore paths of a device that's handled =
by a
    driver domain. This is incorrect, since the driver domain possibly need=
s to
    access the backend path in order to perform the disconnection and clean=
up of
    the device.
   =20
    Fix this by making sure the control domain only cleans the frontend pat=
h,
    leaving the backend path to be cleaned by the driver domain. Note that =
if
    the device is not handled by a driver domain the control domain will pe=
rform
    the removal of both the frontend and the backend paths.
   =20
    Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
    Reported-by: Alex Velazquez <alex.j.velazquez@gmail.com>
    Cc: Alex Velazquez <alex.j.velazquez@gmail.com>
    Cc: Ian Jackson <ian.jackson@eu.citrix.com>
    Cc: Ian Campbell <ian.campbell@citrix.com>
    Cc: Wei Liu <wei.liu2@citrix.com>
    Acked-by: Ian Campbell <ian.campbell@citrix.com>


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--Hlh2aiwFLCZwGcpw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4TRmwACgkQ24/THMrX
1yyQiwf/dGKfw8YbE0QL6j01co7ve9Vbv/hT6i7QmeBvE81EnEQkxRNjD6Jtyy/b
Inemlg8pF810P3QE0HW+SzZLjXrrjvDepIKhmwYPfMgMRWa2gqmCNHgtwZ/aC6Uj
nOMc3SpDcDyW1k4X8CExdQXFPS4COu5WeYcmX5ln64jTSlku5IeY8bt6APhBKl4D
1sNYDRf/QdTABl2efu9rpNe6quSK4dAFZZRLP+ojoqlOobkrOAa3hqDXjCSg4n9H
nxNPVcrCjLQJRY7Gn4fvOrcN+q4v97FOqBgfEwJ/ouvm3PhS9qJ7nn8UzwNnfEkq
2Mw8prxNsCbjpUWvzHszrw+ArDmpeQ==
=icWG
-----END PGP SIGNATURE-----

--Hlh2aiwFLCZwGcpw--


--===============3761429362414940548==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3761429362414940548==--

