Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7621E3B916B
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 14:01:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148650.274697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyvMy-0004wy-VZ; Thu, 01 Jul 2021 12:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148650.274697; Thu, 01 Jul 2021 12:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyvMy-0004v9-Re; Thu, 01 Jul 2021 12:00:36 +0000
Received: by outflank-mailman (input) for mailman id 148650;
 Thu, 01 Jul 2021 12:00:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lyvMx-0004s1-IP
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 12:00:35 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.52])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9304a282-d197-4ffb-8038-c59ec8c8cf4e;
 Thu, 01 Jul 2021 12:00:27 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx61C0P6Ko
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 14:00:25 +0200 (CEST)
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
X-Inumbo-ID: 9304a282-d197-4ffb-8038-c59ec8c8cf4e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625140825;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=LA6pzunebxl1hoyt8xGJaWSXCjL5ktBek1fDgycFaFw=;
    b=MOOqYp4xHn8EqButhLA9ZbhK4Fxew1EiYl4MxKZh/T8maXTkLEwRx880ndy/n8HHGi
    +9zLexcWfwzsXfFW3J7qeSxOiPlHQN94Xh/ZAJsHAwF/T57MRO2u2xHZu/O202+5NO5Y
    wcL3KtnaHsRUZzXaaPe5JHJxvX4E7v4uK/JgJ1f6Plt/tai4C7PZ+iSS0WysdjhtWzD7
    GbM6IMi75lSIaPXVBrrMW01Xm6MwlD/wDzfpnIJ4s+H9E2scWpsWm52YYD1RbJ6zgp8k
    d7A5PW0wTf2Mu7qouAr4dm2pAk0PDhtKsYCcYMgpMsVOERYbcQY8PZ+rcb7irQDnvAGv
    wFMQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisQsBBSIa03sY9BUY2ao0oygRsMfcqA6zjDLeeWXNg=="
X-RZG-CLASS-ID: mo00
Date: Thu, 1 Jul 2021 14:00:07 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v20210701 08/40] MAINTAINERS: add myself as saverestore
 maintainer
Message-ID: <20210701140007.77132794.olaf@aepfle.de>
In-Reply-To: <07174c4e-cf39-66c2-c3cb-27b728dc5819@xen.org>
References: <20210701095635.15648-1-olaf@aepfle.de>
	<20210701095635.15648-9-olaf@aepfle.de>
	<13a963c1-639f-5135-734b-9cc1c8d9034e@suse.com>
	<20210701130143.2b8cfce3.olaf@aepfle.de>
	<07174c4e-cf39-66c2-c3cb-27b728dc5819@xen.org>
X-Mailer: Claws Mail 2021.05.27 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NoXEhtjrK0YWGGgMN0OHnvu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/NoXEhtjrK0YWGGgMN0OHnvu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 1 Jul 2021 12:40:09 +0100
schrieb Julien Grall <julien@xen.org>:

> You would be the sole maintainer of the directory

Yes that is the point, it changes the count from zero to one.

Olaf

--Sig_/NoXEhtjrK0YWGGgMN0OHnvu
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDdrkcACgkQ86SN7mm1
DoBtPxAAnpoF09PNlYiJu/jqdqRzOs92MOvNjH+VZWZ4gmr46oZ4evOv1OCKIS1y
JVEr4Fb5ARXae+8MRU9yNpLVMRZeIeaEh8So4ZARJ2BQUGg4iRnK3qSaOvAYBeG/
Mz87T9+RJRVFWWtfwLv6sTPZL6VpsdSqyDQchSL2CVb7PlsWUCiesdxCgu32mRQu
cef4lQUk4JN4aGfq61niTR2Kgne1b0H0qY8bWr82HgzPWqp1Wp5S0IVvPZBMjIHU
On6pM6TdiHrooB7LHx+rm0nB3OxGU7o2l5Xo/Xamrxal77RYFNQefMow+2+jl4jR
9DvEH053YX5r6EzgaFI/hnxr3FsLRfQLIOBqAf2iclXI+Ia27uKt5sSyHVDVezGG
Ni51Xdm+jG0ErD4ZQaVzI6CdKSaNoQ0T3cmbNGSwjDG/yk4hFCaZLON1q3agnfw1
QxHwUbVV/BrIOUnAv4RIrSNJ7d2w3UUFy918u9EC1Vzg0NhUAogupD3EvsKL1+ZV
d8l6lwJzZirFLFSUkHXU7EIDtAeOlgzsMzy3TQNLig7KiG6AcIiMkOi/PZ5exQ/v
gfra5XTBg8V2tslvoBAv3/c0c43l61+OJBOnv2P2jbeoCXff7qqx5RP3IUU1Mf5i
pt+Vj4Tc3AqiUGzwWb3Hiuf86744VvlpKUmX0ORwhvZI2xCXCbo=
=BOyd
-----END PGP SIGNATURE-----

--Sig_/NoXEhtjrK0YWGGgMN0OHnvu--

