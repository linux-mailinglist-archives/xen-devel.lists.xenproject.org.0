Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E7E20B03E
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 13:12:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jomHB-0007Ak-MO; Fri, 26 Jun 2020 11:12:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E2rI=AH=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1jomHA-0007Ae-2Y
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 11:12:08 +0000
X-Inumbo-ID: df72e8a6-b79d-11ea-b7bb-bc764e2007e4
Received: from out5-smtp.messagingengine.com (unknown [66.111.4.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df72e8a6-b79d-11ea-b7bb-bc764e2007e4;
 Fri, 26 Jun 2020 11:12:07 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 645205C00AC;
 Fri, 26 Jun 2020 07:12:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 26 Jun 2020 07:12:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=o93Cjd
 24FOiNLrFwfmBe4LZpL/SrHS+PzUttJQ7s0Lw=; b=GpkJ16hNdCcRf50jEbczC1
 PU3RTWEMXSzJk3CGloipMve1OwNWvGEHeOOG0Cc8cNhbn4pY8t2Of6KBt51PQnCW
 Q9ANI4B/TdNCH9XmPbApLG78yNKlyYXJjJvBEI/6GIQucNCL0bbeLE1n+FF7S3nD
 jt/6KSwHBWPLxuuqkFmKVB58q1FSGehJ1CSA92ZwbArph87DNfgwa/esRCF0zwYP
 BhKqefg/ahedGOgRRRGgZCNhz6K5CKnl2xGPHbcfs+wBfLwZr0uRExo112EbVvO0
 wh4Kr/FoGg3guUh6XMUDDlg9KOD2rsK7I8MDRZzLwdoWNYONUT5Ml0kBizIHezLw
 ==
X-ME-Sender: <xms:B9j1XtfkXtO0GiPNUI_N9u7f0ygCaF0In_w_7hMrcEtOGm_p5fBRIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudeluddgfeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
 iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucfkpheple
 durdeihedrfeegrdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
 gtohhm
X-ME-Proxy: <xmx:B9j1XrO1KvFdlR38tK1HbrfLEJZNjN26aYXqJSVt8rvFG_xeW80icQ>
 <xmx:B9j1XmiH0sBufOAGixvyMwiOoGOWv_PKbxROK4ng5H_gjXdFknGlqw>
 <xmx:B9j1Xm-DDoi_rcEhA_jqM0O3M_6JKQ2Sfp1YvmodYOeXF8AoVNdPUw>
 <xmx:B9j1Xn0pku-VL6nnGjifA_0HgKN8cERxavlPDNhh9pc-V5-VmMsNUQ>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 65CB33067902;
 Fri, 26 Jun 2020 07:12:06 -0400 (EDT)
Date: Fri, 26 Jun 2020 13:12:01 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 00/10]  Coverity fixes for vchan-socket-proxy
Message-ID: <20200626111201.GS1197@mail-itl>
References: <20200611032936.350657-1-jandryuk@gmail.com>
 <20200626101807.za6arkdlah7zsjzc@liuwe-devbox-debian-v2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Zs/RYxT/hKAHzkfQ"
Content-Disposition: inline
In-Reply-To: <20200626101807.za6arkdlah7zsjzc@liuwe-devbox-debian-v2>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--Zs/RYxT/hKAHzkfQ
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 00/10]  Coverity fixes for vchan-socket-proxy

On Fri, Jun 26, 2020 at 10:18:07AM +0000, Wei Liu wrote:
> On Wed, Jun 10, 2020 at 11:29:26PM -0400, Jason Andryuk wrote:
> > This series addresses some Coverity reports.  To handle closing FDs, a
> > state struct is introduced to track FDs closed in both main() and
> > data_loop().
> >=20
> > v2 changes "Ensure UNIX path NUL terminated" to avoid a warning with
> > gcc-10.  Also, "Move perror() into listen_socket" and "Move perror()
> > into connect_socket" are new.
> >=20
> > Jason Andryuk (10):
> >   vchan-socket-proxy: Ensure UNIX path NUL terminated
> >   vchan-socket-proxy: Move perror() into listen_socket
> >   vchan-socket-proxy: Move perror() into connect_socket
> >   vchan-socket-proxy: Check xs_watch return value
> >   vchan-socket-proxy: Unify main return value
> >   vchan-socket-proxy: Use a struct to store state
> >   vchan-socket-proxy: Switch data_loop() to take state
> >   vchan-socket-proxy: Set closed FDs to -1
> >   vchan-socket-proxy: Cleanup resources on exit
> >   vchan-socket-proxy: Handle closing shared input/output_fd
>=20
> Acked-by: Wei Liu <wl@xen.org>
>=20
> Cc Paul. V1 of this series was posted back in May. I consider this
> series bug fixes, so they should be applied for 4.14. The risk is low
> because vchan-socket-proxy is a small utility used by a small number of
> users.
>=20
> Marek, you gave Review tags in v1. Do they still apply here?

Yes. And also for the new patches 2-3. I thought I've posted it here,
but must have missed clicking "send"...

> >=20
> >  tools/libvchan/vchan-socket-proxy.c | 183 ++++++++++++++++++----------
> >  1 file changed, 119 insertions(+), 64 deletions(-)
> >=20
> > --=20
> > 2.25.1
> >=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--Zs/RYxT/hKAHzkfQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl712AAACgkQ24/THMrX
1yyhigf+NrwGQmd536KPduBKmiC1fSlzBl2dSFnPRaaN6lHsszY4+OC+lcqyoJpo
+A9q+YLfY0vZg3VFusksP24bkW0xp/Fn7yOyvTGOnGiYWFZHZa6b5K3NKGaL+7hv
dqCChkzzpLSeX+LvBg4vypAiYuILGotqDFyQThuv4/mMrHU2HQfFAwthzlC6bOVR
8fF2tDH3Y/dhjTWTmM2wCLWs9Jin4luwwnEiFvEtowWLNIbjc6x5I0H0MajI7uN0
hDn2wVkIrMDJGDVLww+JS95RjSwPyPfEIQ52VuTQnrDa+25+fIYdDgoqrOVd0X0j
4+X+rrhOPFCNnDnpDiCXmSyKPGuMXA==
=k63E
-----END PGP SIGNATURE-----

--Zs/RYxT/hKAHzkfQ--

