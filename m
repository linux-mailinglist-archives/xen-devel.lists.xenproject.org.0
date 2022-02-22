Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B434BF696
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 11:50:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276637.472860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMSiv-0007Va-3q; Tue, 22 Feb 2022 10:48:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276637.472860; Tue, 22 Feb 2022 10:48:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMSiv-0007TS-0m; Tue, 22 Feb 2022 10:48:49 +0000
Received: by outflank-mailman (input) for mailman id 276637;
 Tue, 22 Feb 2022 10:48:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AYeZ=TF=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nMSis-0007TI-Hl
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 10:48:46 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00d88a5e-93cd-11ec-8eb8-a37418f5ba1a;
 Tue, 22 Feb 2022 11:48:44 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 097C65C0194;
 Tue, 22 Feb 2022 05:48:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 22 Feb 2022 05:48:43 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Feb 2022 05:48:41 -0500 (EST)
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
X-Inumbo-ID: 00d88a5e-93cd-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=DTcsRQMhHEsT227VK
	XKHQyOwB4dIKR9vzR6umqoiTuA=; b=K8S59BhMrGaVw44sfUv7enmQYQ1OVuGmQ
	lpQdCdIjz71gjc8sElBsakHzdjkF/fWn3d2LPUPcfAoivcwe+LV83yvizXy8vaL1
	XfMNOT3uVokxiK0Dva1CKvI7FSrewINC6IUECvQlEIoHu9w78/f2s1fKyDF0INbC
	HsSLcrmRrIJT5/+vRozrUSm9SO5w8lMCyFGd2ChhAXZh3hkFf0pXORVGYOZr7yVd
	GeRS8M7Rk4riPYq9RsXhn/5WS8f2iwWDDgYwCpcC03bJO/hvHEar5Wn/qy+5Rshm
	Z+nH9mO4qHq+ZgELZ0kT+6wttK1YoXw3Oispb/yo3+GGM8PXWifbQ==
X-ME-Sender: <xms:ir8UYjuEXGwrbqKlY20yqYFrw4YF0iLQqOk0_PB3zXdNqaovd-AkCw>
    <xme:ir8UYkdri5qEk2tUvb28L1LpdoqlMw3Iqe9DKG7bBlGIM6lMNdVAiaDTeCQO5UXoQ
    tVSU7hQzf_V2A>
X-ME-Received: <xmr:ir8UYmzPkn5aAbAi0LxhaIFC81fGs94iCGgv4Jo0uTDOx3FWBmZLEPbC2OdDIXU-pg-OrVu8cb-VucyP2GDx_yLlaJrXSNGQ0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeekgddulecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepheevvdeu
    veehkeehhfevgffggfevudegteeugfeliedvhefgueeiuefgteetieffnecuffhomhgrih
    hnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhm
X-ME-Proxy: <xmx:ir8UYiPFUO_QAu-DIAtp-DLZkzErUXDnPkxfPLfVkL7M4yyF2MW6Gg>
    <xmx:ir8UYj8mCcn8tt4pgKNdOjsz4w8sY_tRUU12rDq9Sf9EyA_QQo8JWg>
    <xmx:ir8UYiV_PDaowG3PCoghYbuma6I3uze38hhFB1zjhmt03mAkH0A-xA>
    <xmx:i78UYkNV0oJsrIv2nwuuYBiVrEqvXd97V9QI6DwUM69aJGRhHIPadg>
Date: Tue, 22 Feb 2022 11:48:38 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Michael Brown <mcb30@ipxe.org>, Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	"moderated list:XEN NETWORK BACKEND DRIVER" <xen-devel@lists.xenproject.org>,
	"open list:XEN NETWORK BACKEND DRIVER" <netdev@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] Revert "xen-netback: Check for hotplug-status
 existence before watching"
Message-ID: <YhS/hvHQO335elw7@mail-itl>
References: <20220222001817.2264967-1-marmarek@invisiblethingslab.com>
 <20220222001817.2264967-2-marmarek@invisiblethingslab.com>
 <YhSfYyh3xU4HZKek@Air-de-Roger>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0J0yTdf+LQeqmBEg"
Content-Disposition: inline
In-Reply-To: <YhSfYyh3xU4HZKek@Air-de-Roger>


--0J0yTdf+LQeqmBEg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Feb 2022 11:48:38 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Michael Brown <mcb30@ipxe.org>, Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	"moderated list:XEN NETWORK BACKEND DRIVER" <xen-devel@lists.xenproject.org>,
	"open list:XEN NETWORK BACKEND DRIVER" <netdev@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] Revert "xen-netback: Check for hotplug-status
 existence before watching"

On Tue, Feb 22, 2022 at 09:31:31AM +0100, Roger Pau Monn=C3=A9 wrote:
> On Tue, Feb 22, 2022 at 01:18:17AM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > This reverts commit 2afeec08ab5c86ae21952151f726bfe184f6b23d.
> >=20
> > The reasoning in the commit was wrong - the code expected to setup the
> > watch even if 'hotplug-status' didn't exist. In fact, it relied on the
> > watch being fired the first time - to check if maybe 'hotplug-status' is
> > already set to 'connected'. Not registering a watch for non-existing
> > path (which is the case if hotplug script hasn't been executed yet),
> > made the backend not waiting for the hotplug script to execute. This in
> > turns, made the netfront think the interface is fully operational, while
> > in fact it was not (the vif interface on xen-netback side might not be
> > configured yet).
> >=20
> > This was a workaround for 'hotplug-status' erroneously being removed.
> > But since that is reverted now, the workaround is not necessary either.
> >=20
> > More discussion at
> > https://lore.kernel.org/xen-devel/afedd7cb-a291-e773-8b0d-4db9b291fa98@=
ipxe.org/T/#u
> >=20
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> > I believe this is the same issue as discussed at
> > https://lore.kernel.org/xen-devel/20220113111946.GA4133739@dingwall.me.=
uk/
>=20
> Right - I believe we need to leave that workaround in place in libxl
> in order to deal with bogus Linux netbacks?

I'm afraid so, yes.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--0J0yTdf+LQeqmBEg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmIUv4YACgkQ24/THMrX
1yyKoggAg6fLt83xdWaCGP1TaH51wysnBj1sxuSzFeh7BUVHdyWYYlfTAQ+Ytghr
N4uCqUyXqTpheDM7BE/9pXSiuHH1WqmClAef7SF9MweHT0zvDkL0J7McMSqLBeG4
Qj67yHz4/C1yAhN3dAdP8933l4nmzvzOGNdG77D3P1IvU+41xtyoZPVfH5DDNscG
yfYwoeI/oYRNtvd1H7+UD3ANkwEjnmFIVGRtFcb7G+NH+d9vGQFbODww95oCbWWA
PfKL7gBFGNDuNnIABFCoI/RsF523zRSSeBesdAImUM+531IRapB9J9FYp4E6M3RA
Bt5hPaIrX6OFgur2u9aShGvIdH+FYQ==
=0A40
-----END PGP SIGNATURE-----

--0J0yTdf+LQeqmBEg--

