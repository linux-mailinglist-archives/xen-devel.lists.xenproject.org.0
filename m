Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F021F1A9B
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 16:11:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiIUj-00013e-8Y; Mon, 08 Jun 2020 14:11:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iYtX=7V=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1jiIUg-00013N-Hv
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 14:11:19 +0000
X-Inumbo-ID: eac43954-a991-11ea-b27d-12813bfff9fa
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.217])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eac43954-a991-11ea-b27d-12813bfff9fa;
 Mon, 08 Jun 2020 14:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1591625476;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=CVDd4uHHAw9fgz0xLmk75Ws90S2daYPWZzP5U81wMt4=;
 b=hxKUaGqlVVCgAgnTelfS1ynhQmwLZ12KT4/dNS16gZV0zFQCwoyUx56re2DTneeNpH
 DQMs4V47U91ZW+ZBVlEHggOHgGIRMJB+jHJrbKJU0ZFiScehRaxKiVZOSNtLyE/t2hgw
 cDZn2FREHaX02xFCZ1b0QmFqQ9lUMrxDI7fcy+RTjOkpcTYLno5YJ1dYrfBkVVCGoQSY
 jLEmTLQlmyCpuuElygXePMW6um4zauSil0h2zw+Dm5VyYjYiP5dEt8kFaIxI2CMBgCEp
 hV1R5gw4BC3+xXWXjBl+Z7AdHC75wiuWEbawCejYLGFFRtkmtiKo6Ho4J1c/TUnnj+3a
 hlRg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4AUztn93FPS2dyuYMxg4g=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.9.2 DYNA|AUTH)
 with ESMTPSA id I09bd2w58EBDH0E
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 8 Jun 2020 16:11:13 +0200 (CEST)
Date: Mon, 8 Jun 2020 16:11:11 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v1] tools: fix usage of strncpy
Message-ID: <20200608161111.26c2cdd4.olaf@aepfle.de>
In-Reply-To: <CAKf6xpusrQaMb3ET_HJyrreSPvvogEQORSWUG1X2H5oa-HUZiA@mail.gmail.com>
References: <20200608072855.26589-1-olaf@aepfle.de>
 <20200608100051.16be834e.olaf@aepfle.de>
 <24286.6790.983312.672969@mariner.uk.xensource.com>
 <CAKf6xpusrQaMb3ET_HJyrreSPvvogEQORSWUG1X2H5oa-HUZiA@mail.gmail.com>
X-Mailer: Claws Mail 2020.06.03 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/tHnWh5rOkRJp/RG5rGICI/S"; protocol="application/pgp-signature"
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--Sig_/tHnWh5rOkRJp/RG5rGICI/S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 8 Jun 2020 08:43:50 -0400
schrieb Jason Andryuk <jandryuk@gmail.com>:

> I added a length check in this patch:

gcc will not recognize such runtime checks and will (most likely) complain =
about the strncpy usage anyway, just as it does now in libxl__prepare_socka=
ddr_un. While the usage in libxl__prepare_sockaddr_un is fatal due to -Werr=
or, libvchan is apparently built without -Werror.

Olaf

--Sig_/tHnWh5rOkRJp/RG5rGICI/S
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl7eRv8ACgkQ86SN7mm1
DoDYKQ//aDUkyNOaXvmB6HqJfnD3qnWNyYFjXjvWcwyLLlk+KbqF3YrAKC7web4D
yuoYnZysjoZUCi7dscvfbu3Gbk3FLe2/B0junH4jspf4CY32oD9dZlw5nGXGdTjX
N2hzUCyaIZlVcO/3ryJe1/LywXMclW5aKowziHcMO1NhyhE8NwS1jLST+UjrV9/E
4L485sx2OXi6RWalA4l5luGQVp4mi/cSNdUgQb3/yQ2FgUE/2NNBxPQvE0uP3YKw
EbFSy0H6iiGNjRL9dCZgJnkI8AK19WMLEsBAEvNyQdJpdeQyG6rKWT8W7LdCeU4l
KzSZdgoJneJFJ4Tq5RzTP3P8Z0v3PCXZXCYcyjDjfK9eo4a7TR4QFEyKnlZ9Zuuh
Mx2tM1iLWgVUOvRfd9GE3SNEFSlpvEC22ehwTiGwQfEZACWMXeZYse5N0v/btNiy
ab+1NpWU0I8n9coo20iM+XK7G5C1b42UvbtQc9XGuuOFRibKMvzW3k7rd+Ydaprg
X8PG7hizAFf1gfkHcOIA2Lp7j8K9qvX0a0o2IDqiDCG9sonaNVf1EFua0HCOjQ/c
wZTy47FaUd3KAkmeOD/ojMWEd4Krg4Fz7t5gYuUbPqSjFwxJoZXZ1COzX4rp4eHV
we7z7m+rFubDYwuC70owZPwI0bnxn4VtXPxOLhOnpqWTif1cyZw=
=FK7T
-----END PGP SIGNATURE-----

--Sig_/tHnWh5rOkRJp/RG5rGICI/S--

