Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B5831549F
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 18:06:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83345.154858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9WSu-00022O-45; Tue, 09 Feb 2021 17:06:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83345.154858; Tue, 09 Feb 2021 17:06:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9WSu-00021z-0Z; Tue, 09 Feb 2021 17:06:16 +0000
Received: by outflank-mailman (input) for mailman id 83345;
 Tue, 09 Feb 2021 17:06:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NhOK=HL=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1l9WSt-00021u-0S
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 17:06:15 +0000
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:400:100::c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d0973db-f352-4721-9b09-d7a9388f7f3f;
 Tue, 09 Feb 2021 17:06:14 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.17.1 DYNA|AUTH)
 with ESMTPSA id 604447x19H6721Y
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 9 Feb 2021 18:06:07 +0100 (CET)
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
X-Inumbo-ID: 4d0973db-f352-4721-9b09-d7a9388f7f3f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1612890373;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
	From:Subject:Sender;
	bh=YsCchLV6ss1aMoXsjF9HOSE0UP0I6pyzvep7ylz6Z08=;
	b=p1Y/VP7jXvu3koeb0jCcTCvg8mHKp2OWJDwOxtBlbc/lJCgbayJsduFVu4o1v4Wv3E
	MQkRl58oKVJscAT6RYIV+n74U7p/dk/r+/9ZFadF082dC496cNFzB1WmLy3eJWlqch1f
	d/XmfD0cR3LUJPy/YtBe559TbiK1heQhoJzTSrlFhEpf0VlqMxx38vo/isrp7q8yMKsj
	H+9WnxBv0NqsaTDWvbiJm+AZ3Liy7DI81nPht4xbJCyka0Un1I9TR1zF8gp3nWVWr51L
	9QIG+cA6tbawSoAQcinO4bSfsw4cBxQSwceCfzCgnMHIwbYb4VVREgfhy041O8jwguAy
	TT5Q==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTW+v4/A=="
X-RZG-CLASS-ID: mo00
Date: Tue, 9 Feb 2021 18:06:00 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, Anthony PERARD
 <anthony.perard@citrix.com>
Subject: Re: [PATCH v20210209 3/4] xl: optionally print timestamps when
 running xl commands
Message-ID: <20210209180600.67e3f167.olaf@aepfle.de>
In-Reply-To: <24610.48626.319165.973767@mariner.uk.xensource.com>
References: <20210209154536.10851-1-olaf@aepfle.de>
	<20210209154536.10851-4-olaf@aepfle.de>
	<24610.48626.319165.973767@mariner.uk.xensource.com>
X-Mailer: Claws Mail 2020.08.19 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/j/Ci0QjYvSsJUbeSuGhPz8d"; protocol="application/pgp-signature"

--Sig_/j/Ci0QjYvSsJUbeSuGhPz8d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 9 Feb 2021 16:53:06 +0000
schrieb Ian Jackson <iwj@xenproject.org>:

> This part of the commit message talks about -t rather than -T.  I will
> fix that on commit.

It is really the lowercase t.

01f78a81ae56220dd496a61185ba5dfae30dc2fe did not adjust the output in tools=
/libxl/xl_cmdimpl.c:help().


Olaf

--Sig_/j/Ci0QjYvSsJUbeSuGhPz8d
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmAiwPgACgkQ86SN7mm1
DoAILhAAgubCeEv8v391rlVJFEh4eDzB3DMlUrGnudmn8QvBNS/nr4X/zAlbfggq
jqpO0GgOyaUlQ3JTm3waOAgmUDF2wFDYtEhbIL12XEJJC1gcO3mjMP2RKP5Y84Zo
tFdl9IrwKPlDou5ydiqZ342AcnkEyT/yLDHhRVipQSyQtOPvztCrHMOFmBOflCvy
wlLu/K44JhnELiZf4VJ1tzR9fh07TZ/AU/yRU2J4OencYvXX+XU5NodvROlq29Nv
FOTnOxhyIJxERra6+x0tWFl6jSKHXq2hPgdV/KNivMCuTCyNEQRVUBjFFUEEMx9d
km038yiM2voEG6GmrI3tw7qfonomoiSp6EOnsmhF694stxYFbOUW1kjgZwGKVdo3
2XdrNWzD950JEriYpohq2vi6LOupCbaSCGPS/tQl+iTYTR0bDgiFj+wQMoZcMEwW
wV33qyOoc3LlEiIwh1B6+0eYQ1sRSLq1VVh0JE2Ck7BHddtDAj1tPvDSZ2VqQzBF
QyUF6lY+EGjGo1FC3vCGSO6feLJBXaiPiJYQts6WuXSR6iXvC6kNlBkGZDBIVH8t
pXU2iilA/lPqZImnLIEM8L+yhU+fW6LNu4PwIRtk6kFmudM5gevNaUsfrRBkMB3u
+MgB+8oUOr4oT797HZb2v4AOX+paEVi3wcyd03I8BPjNQ+WiVRo=
=+bYN
-----END PGP SIGNATURE-----

--Sig_/j/Ci0QjYvSsJUbeSuGhPz8d--

