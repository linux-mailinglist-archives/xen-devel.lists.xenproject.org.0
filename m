Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 488AB386CB4
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 23:58:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128511.241255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lilFw-0005IH-Bp; Mon, 17 May 2021 21:58:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128511.241255; Mon, 17 May 2021 21:58:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lilFw-0005FX-7y; Mon, 17 May 2021 21:58:32 +0000
Received: by outflank-mailman (input) for mailman id 128511;
 Mon, 17 May 2021 21:58:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qOHf=KM=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1lilFu-0005FR-K6
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 21:58:30 +0000
Received: from out3-smtp.messagingengine.com (unknown [66.111.4.27])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 565ebd18-4ed8-4355-bf1e-d1e4f4756b67;
 Mon, 17 May 2021 21:58:30 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id DA9D15C0184;
 Mon, 17 May 2021 17:58:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 17 May 2021 17:58:29 -0400
Received: from mail-itl (ip5b434f04.dynamic.kabel-deutschland.de [91.67.79.4])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 17 May 2021 17:58:28 -0400 (EDT)
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
X-Inumbo-ID: 565ebd18-4ed8-4355-bf1e-d1e4f4756b67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=KZ594z
	tIARs/GJxBthPQn+lIZaulwFStf5XQEa/2T6U=; b=Fyf7tYIzS6KwF24g8AV9TN
	eCNgeQVskLGDEn4FUju6k7dyDRg6TsqIiz2iZgA4iDqV2ZXTKMor3g6xF9RfkI4g
	cHj/Po8RzYaWpG+R5jD+uo2tkF0y4g+bul8L+JfVqopv+2gYc3Pk7HEs6HQHxWQB
	RgunkmZhvStSmenx04Ic8ZsQeyps6uOl7cizxSFm0j27KVxuIL4d/bQcmOfSEups
	eFZNnOATWmArwPZef2gEOjWCTVkh0puwlKmFwFVsO/0qIgUuDXMCFY6UkwMHRa0u
	ZkXxEDEN/aoFtdBCDp4bvQp7P9Zfar9KLN+2eQCK3C/QylTCUXBm+a9gC2RHujmQ
	==
X-ME-Sender: <xms:BeeiYJ3mH7xwvkhBiwx7CKeWP3SMgnRdLDwEEEUcynP16OC65u0XfA>
    <xme:BeeiYAFbeMlWdLOz4i_YuR0XRgqYSKMpoM7sVoUm1qIWh27ftdfZ1q3ghrYPQkiUN
    QtkS2drkAiarA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeihedgudeiiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteev
    ffeigffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecukfhppe
    eluddrieejrdejledrgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhm
X-ME-Proxy: <xmx:BeeiYJ79TaRUN2Lxb48BWE01GDLbMzE4V9mxzHzi3QIewbcp1E50nQ>
    <xmx:BeeiYG1cnB2z1bM9OMnLMSaXjlQoWBq1LPy1mAATk9u4bP7K-R_fDw>
    <xmx:BeeiYMEMXQ0aPrBdZBnSHffjWwXlVtDXeNUaP8m9RGOcP6k3XLBKDw>
    <xmx:BeeiYBOydb_MZjU-ndPVesHGLuRXeqIS_8f8r0OFgSdGy-Q5wOioPw>
Date: Mon, 17 May 2021 23:58:25 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Michael Brown <mbrown@fensystems.co.uk>
Cc: "Durrant, Paul" <pdurrant@amazon.co.uk>, "paul@xen.org" <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"wei.liu@kernel.org" <wei.liu@kernel.org>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] xen-netback: Check for hotplug-status existence before
 watching
Message-ID: <YKLnAcaVsMUQUC74@mail-itl>
References: <404130e4-210d-2214-47a8-833c0463d997@fensystems.co.uk>
 <YJmBDpqQ12ZBGf58@mail-itl>
 <21f38a92-c8ae-12a7-f1d8-50810c5eb088@fensystems.co.uk>
 <YJmMvTkp2Y1hlLLm@mail-itl>
 <df9e9a32b0294aee814eeb58d2d71edd@EX13D32EUC003.ant.amazon.com>
 <YJpfORXIgEaWlQ7E@mail-itl>
 <YJpgNvOmDL9SuRye@mail-itl>
 <9edd6873034f474baafd70b1df693001@EX13D32EUC003.ant.amazon.com>
 <YKLjoALdw4oKSZ04@mail-itl>
 <ed4057aa-d69e-e803-752b-c007ab4e707d@fensystems.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v82u8Wko8ZqO+zT5"
Content-Disposition: inline
In-Reply-To: <ed4057aa-d69e-e803-752b-c007ab4e707d@fensystems.co.uk>


--v82u8Wko8ZqO+zT5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 May 2021 23:58:25 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Michael Brown <mbrown@fensystems.co.uk>
Cc: "Durrant, Paul" <pdurrant@amazon.co.uk>, "paul@xen.org" <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"wei.liu@kernel.org" <wei.liu@kernel.org>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] xen-netback: Check for hotplug-status existence before
 watching

On Mon, May 17, 2021 at 10:51:38PM +0100, Michael Brown wrote:
> On 17/05/2021 22:43, Marek Marczykowski-G=C3=B3recki wrote:
> > In any case, the issue is not calling the hotplug script, responsible
> > for configuring newly created vif interface. Not kernel waiting for it.
> > So, I think both commits should still be reverted.
>=20
> Did you also test the ability for a domU to have the netfront driver
> reloaded?  (That should be roughly equivalent to my original test scenario
> comprising the iPXE netfront driver used to boot a kernel that then loads
> the Linux netfront driver.)

Yes, with both commits reverted, it just works. Without the need to do
anything at the backend side.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--v82u8Wko8ZqO+zT5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmCi5wEACgkQ24/THMrX
1yxtFgf+OzfFn2JRwVyKHdBAPwZoJJT+BTQds43iuXSkSLYOR07z8k8q3oTEBfPM
R0B5K9O869Prjinv+14tkO1coZs4vNb/4GTmxd4WEPwbA5AqGiq2Y+5VKbDL6Wwv
FQeHDSgZ3xIgX+mq4gLX2Nccwlc4X8R6Pidq+5TLPGpEkIlutDQpIPfHMncYyrli
Xr9ffRXZvbkck1UTNzx/h1epY3UwIupyhzIhz5ieqhhqRRsZKVKmd/D0Q8zUX9oS
Wa60THmmamKjIPgEvN5LfFe0z6tYohJIWA5AnY6hQCSVbg29t1zXMIVpwYE+WL8n
vPegbPQ2KbLcHd9RZ8igEIL0BlX+eA==
=p4UQ
-----END PGP SIGNATURE-----

--v82u8Wko8ZqO+zT5--

