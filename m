Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0771EC945
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 08:11:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgMcC-000288-3E; Wed, 03 Jun 2020 06:11:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ICuR=7Q=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1jgMc9-000283-Dr
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 06:11:02 +0000
X-Inumbo-ID: fe1b139a-a560-11ea-9947-bc764e2007e4
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.165])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe1b139a-a560-11ea-9947-bc764e2007e4;
 Wed, 03 Jun 2020 06:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1591164658;
 s=strato-dkim-0002; d=aepfle.de;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=rl+vparLycNdfteqAgJA+SUTyfN1PPe3UardQIEADzU=;
 b=YMud8+ojFndirgjcaw4Hu7K5knUED87IbyLmobLq3xpDVAduU3Bg5vOgIWLmrzdS+z
 iDnwGYCGHmXWzQbbd8kEDcC92wfuEMxvlLemxVB3sY8ny+jsWI0teqTy+082ecGdvDvF
 V2sAa66GG1czsToRtvS9bNsFP9fT5ABqsTYFp6c7w3G5yLDodUMNtwMlpJU2+Dvpgv9P
 XiYkicNIr0nk9/11RTRhAKR7TpANsfB1P8I9cgy0a4Fpy6QdRpXyoRfT3IPbP2bvzUxd
 HQYniAPtTjAJF4VdUwROCGSOdSsv1zb5MUiWHLqhT419B8T1aFVVJidTfrkSUvzNUK8E
 20HA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS325Ojw=="
X-RZG-CLASS-ID: mo00
Received: from aepfle.de by smtp.strato.de (RZmta 46.9.1 SBL|AUTH)
 with ESMTPSA id 205482w536Av04J
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 3 Jun 2020 08:10:57 +0200 (CEST)
Date: Wed, 3 Jun 2020 08:10:53 +0200
From: Olaf Hering <olaf@aepfle.de>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [Xen-devel] [PATCH v3 5/9] libs: add libxenhypfs
Message-ID: <20200603061053.GA19484@aepfle.de>
References: <20200121084330.18309-1-jgross@suse.com>
 <20200121084330.18309-6-jgross@suse.com>
 <20200131155753.gyv4n67oz3znsxt5@debian>
 <f26c60d0-d056-2841-1b94-ef6dc397d995@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline
In-Reply-To: <f26c60d0-d056-2841-1b94-ef6dc397d995@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, J=C3=BCrgen Gro=C3=9F wrote:

> On 31.01.20 16:57, Wei Liu wrote:
> > On Tue, Jan 21, 2020 at 09:43:26AM +0100, Juergen Gross wrote:
> > > +Requires.private: xentoolcore,xentoollog,xencall
> > Need to list libz here?
> Probably, yes.

See "rpm -qf --provides /usr/include/zlib.h" for the proper value within th=
e "pkgconfig" namespace.
It is 'zlib' instead of 'z'.

Olaf

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl7XPucACgkQ86SN7mm1
DoAA/Q//XnekQcHQ7IfLcQDfvQrVoG+JEKrdpEB1OUAElnYSSj8Z8+uhwYeC4pnY
KPgCD8tgatMGW6UVsPyLTHnTObX3MqOIRR/50nO/PXrhTGIuBfAxymebBtA3ooQW
3oxEsNibcv19bXTWFqYGQQexXPcQWZ4l8szh49iWB0S+FbAKH1c8B/F52D3ZeKTT
gAvQc5M7ceJ/vl1r2lkkAaa6qPmIiVPKdqxfwHfJkPAN9cVtz5ZGN85foPQu1iep
WrXDqbRxZ5uZwMRf++tqYJTlx4uKdt6s7BHxCN/oKF5QsqL/oDvVjsKae5Lq5pKG
ht3FQfsPQ8ebzjhQhGW5X9K82BVF+ctYnKFREEen3O7YeWBzn4wTyD+jxx0uSzrk
ecstwu9NQZuLXtWwR4ohKkTmVTpDyHywqzBYnz5azOTHJjsVW21UMBa/TH/25QsJ
sthgUBI0pHWmlfRVghhGESwDqMKD/iHQte3B/EDpVvG1DILRqWpHw7HG7Xa44Vbm
8Xs6RzLWw/9loHy2YB88vNQC1OOpfpkllSP3VuyL5fTgDrS55WdBBpuTxEqSBkrm
1gheDq11ApWqEF+8O3xKOqP4v0nJbqnvRphVoNxfTCMlFKXqxrbCJNXDRRLbVCRk
YRUj3q+HKpdgv+0bKC8e9jOGxpN0u2g5AL3+RpOF99KyVBq2PLY=
=ES5v
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--

