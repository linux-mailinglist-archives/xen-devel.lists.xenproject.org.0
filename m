Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A400445737
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 17:23:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221718.383567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mifWG-000347-H7; Thu, 04 Nov 2021 16:23:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221718.383567; Thu, 04 Nov 2021 16:23:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mifWG-00032L-Dn; Thu, 04 Nov 2021 16:23:16 +0000
Received: by outflank-mailman (input) for mailman id 221718;
 Thu, 04 Nov 2021 16:23:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JfF2=PX=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1mifWE-00031z-Cs
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 16:23:14 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 810c161a-3d8b-11ec-a9d2-d9f7a1cc8784;
 Thu, 04 Nov 2021 17:23:12 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 4A01A5C00EB;
 Thu,  4 Nov 2021 12:23:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 04 Nov 2021 12:23:11 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Nov 2021 12:23:08 -0400 (EDT)
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
X-Inumbo-ID: 810c161a-3d8b-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=F7ThL3
	bEF0AwmWK+5lDaywNOm4dgdIO3a3tYFPwmG3o=; b=NpcSFCK0fMEOT44lm2kABk
	7iIBZ1uXApevFBQirHZtrK+BmmBviHHZrxe73HV5x6R29UM6SCFu1nh6mUNYWGEj
	v8D1Ei95G900i3Ga00+cC1zz7Oy+WdOsor199CfoiDmSN21Ou1cMIkz/l5Rb3Ixd
	+C4ESfHMyYfZBEE3dhkCW2GzEe0XlrR1xkWU3T9LRSMzgjhgpRuVjciVlT8V0pkn
	UoUe1qP38PxukvedPDS1Ja3CO66Vb73QjaG22rfkkmW6t6Zd/rrharXZFMi47tSe
	/LHLZZPKkeXI5divGR5geziI4u0edTHd/N6ZqGVF40NC4a/egzjUWP2LuDZ3IoHw
	==
X-ME-Sender: <xms:7giEYXtTGKBg46bj0NiKjQLb_pTUQD06onODoDchEvEPrh8hAIiLKA>
    <xme:7giEYYcptuxe-WkF6F8FYbqOmdbEtQNLWbvdgAiuYWDqVQYoEvHll7sKxGGNkv8Ui
    s_nncOgmKamrQ>
X-ME-Received: <xmr:7giEYaxQs8ShRJ3wFK71sc000w3z1UkD4cNkI3Qa3WthAN5c6DSHuOFRwSfjj4EDCilcTr3sMFJg4dFkJooujj5BkLgw9tPFOxioLXeOgyI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtdeggdekfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepheevvdeu
    veehkeehhfevgffggfevudegteeugfeliedvhefgueeiuefgteetieffnecuffhomhgrih
    hnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhm
X-ME-Proxy: <xmx:7giEYWNNR6bp5iMup-zWeU3tfEHv0px9rWnJLruuJGRPrfubcInArQ>
    <xmx:7giEYX-pakkpVKZ0ZNINGW-J0vemCjtPNOaC1po2nK9XJYuE5pafWg>
    <xmx:7giEYWXhrPqnb9AZo255Mb7y_EIyEpD5oDCo-9y5_Eocxq9yZz2e_g>
    <xmx:7wiEYSmxxVEEIgGKUDeGGiM2mmHnV1p7zMzYVFKhPSxtQRjK-enDDw>
Date: Thu, 4 Nov 2021 17:23:04 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Stefano Stabellini <sstabellini@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v4] xen/balloon: add late_initcall_sync() for initial
 ballooning done
Message-ID: <YYQI6NQ8eY9XtSI4@mail-itl>
References: <20211102091944.17487-1-jgross@suse.com>
 <f986a7c4-3032-fecd-2e19-4d63a2ee10c7@oracle.com>
 <f8e52acc-2566-1ed0-d2a3-21e2d468fab7@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dtfzIy7fiid+QMXP"
Content-Disposition: inline
In-Reply-To: <f8e52acc-2566-1ed0-d2a3-21e2d468fab7@oracle.com>


--dtfzIy7fiid+QMXP
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 4 Nov 2021 17:23:04 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Stefano Stabellini <sstabellini@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v4] xen/balloon: add late_initcall_sync() for initial
 ballooning done

On Thu, Nov 04, 2021 at 11:55:34AM -0400, Boris Ostrovsky wrote:
> This appears to have noticeable effect on boot time (and boot experience =
in general).

Yes, this is kind of intentional. It avoids killing the domain ("out of
PoD memory") for the price of increased boot time. I still wonder why it
wasn't an issue before, although it could just be a race that was less
likely to loose before.

You can find some analysis of mine here:
https://lore.kernel.org/xen-devel/YXFxKC4shCATB913@mail-itl/

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--dtfzIy7fiid+QMXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmGECOgACgkQ24/THMrX
1yyYIQf+PK+WvewHZdnNVSkmaod5zSxBqVeO47i4A1ZdTACkgC6EgUbGDQtW3KtD
DARSfTbbDwto5VbzM13WfSiY9/0dNCSS79La3iYcIpML6q4jTGDC1/bu0mWlPFSN
GAn+RdG5XUN3c/YYlcqt/T+I/KGlEqazXo9P0q/704xDs6NQ3KFQB8bPq5cs9lp4
kpavY28wk2cSHT7c1LTiMkNQQRDM5VHdrH+NAf6sqZIj8GxJDk7v/FKki4sUxa7R
FdjiI0dgFGISxy48+6HXnw0mZHKNZXdA8pa0P7Lyw71AGq4PRmMzPjc36Zp0x8Om
RAeCy9mXJL2bbd17vEoH11N+53Eh3A==
=Vps0
-----END PGP SIGNATURE-----

--dtfzIy7fiid+QMXP--

