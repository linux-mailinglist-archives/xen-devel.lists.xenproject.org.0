Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA773BF2E0
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 02:32:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152761.282209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1Hxv-00067C-Pk; Thu, 08 Jul 2021 00:32:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152761.282209; Thu, 08 Jul 2021 00:32:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1Hxv-00064u-M2; Thu, 08 Jul 2021 00:32:31 +0000
Received: by outflank-mailman (input) for mailman id 152761;
 Thu, 08 Jul 2021 00:32:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Di/c=MA=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m1Hxt-0005mk-Ti
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 00:32:29 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.167])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8b0f830-df83-11eb-8542-12813bfff9fa;
 Thu, 08 Jul 2021 00:32:27 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx680WQXrq
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 8 Jul 2021 02:32:26 +0200 (CEST)
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
X-Inumbo-ID: f8b0f830-df83-11eb-8542-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625704346;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=CDNWoi0z8UuZxpF5SpC9Hp+geGCwEmKoOjwD2HC8Gak=;
    b=mMAG1SmVzDCZ1KmAUNhIyPR/HFWismT9C+FW9KSQs7LXGkoC/RcK0Lo5ZYqZWElJt3
    lDPTNqfkvdMWV03u0AqoPX6WuAA7KqZx8Nns9Cb5QLiEhRprhec/Sr4wgzU8RQ6TwPEi
    LYq/IHsYvHzzMw39tT3Qc8920pt2zJNZczyVAYnOQW2aiK+JQcnh4Ch9JdPmn79ZokPG
    S9xHE47mM7v0Mh1f0szv8LI5x2MN+V1sTPWEypQTwLMNXve6TLKFVUf1CR+1/wtdyu1o
    dhRAH7y95WLj/gO81Vfftt60NBpC9z+2b2bcV3HPzC7aShG/Cp7K3xlLyuP/aWXoS1/5
    /IAg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Thu, 8 Jul 2021 02:32:24 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 2/2] automation: Check if ninja is available before
 building QEMU
Message-ID: <20210708023224.6c05ff5b.olaf@aepfle.de>
In-Reply-To: <375823a3-8b49-7aab-ca2a-af219234b5e4@citrix.com>
References: <20210707164001.894805-1-anthony.perard@citrix.com>
	<20210707164001.894805-3-anthony.perard@citrix.com>
	<e775d987-939c-e7dc-077c-fc61a2883f6e@citrix.com>
	<20210707223551.5462c74e.olaf@aepfle.de>
	<375823a3-8b49-7aab-ca2a-af219234b5e4@citrix.com>
X-Mailer: Claws Mail 2021.07.03 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/d3oWqw008L4FpQbrK1AY9pu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/d3oWqw008L4FpQbrK1AY9pu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 7 Jul 2021 23:47:02 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> We ought to yes, although I think at the moment we probably don't want
> to realise how stale all the containers are.

At least for Tumbleweed it is useful information.

opensuse-tumbleweed.dockerfile requests zlib-devel already.

tools/config.log is required to see what the failure actually is.
The toplevel config.log is not helpful in this particular case.

Olaf

--Sig_/d3oWqw008L4FpQbrK1AY9pu
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDmR5gACgkQ86SN7mm1
DoCCSw/+Jzps5QJE7TJ4y2hT7z3WbN8Vdxa0g4bxz1s4SAE3tyKy4ZmndAskFsRf
7C4K4kdQCyLNS0F1Nzr/MUEcbTBTmM5itN/7Gj9hjynhUQgXqWGRDAnHvdXHvBJ6
Q7iaHmLn+Afp1etLbk6SBLIA0Q9rYtllRNJ3IXgj3aeIMk8tj0iV/RuNyqPD1E2i
a5jWTcowMDXoxGRQ1FVprjy5ZmjR1k3b/xaolie7RIlqydKUFuVN/mCk+EtK+ZDo
rKnshaShzxN6tklntHwv6LhA5NuxD3cEQM4s5X7CayBZCqXJOzy8XNlP32lW0vSS
5XhjNes16dtMgPv6WPs4Ckl5hbXkqY9rm8xSQgXAus76wD9gTSANfm9YNRVeanOv
GUvdY531wmr5hDbUOx1w5NqPOYX6iinu5AsmswdA7NEiBhpRMC4v65feRQ3LxwrW
blczLeB/qjg+/1jKPNMzd9OU2ibULd/5HKqJQ8jEO5Ml9+ja78UfB/32mdK9BbxT
Ltx3/UfWkWYJ5pkCg19fvPEUvUQPLY1u5OcD/ODzs7bygNS0GjPx/a1KbrSdWEkt
Usa+2acehg0lgNgsHTSbJ50nSkm7eFpkUH51jSe7B3oxtCB3bktQr66Z8n013deA
WUBE71TnayI0NmIOWsUAblNMcQEt4dKfUQogUzxuQTMaaSdbNMQ=
=IUR5
-----END PGP SIGNATURE-----

--Sig_/d3oWqw008L4FpQbrK1AY9pu--

