Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 459AF3154C4
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 18:17:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83354.154897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Wcz-0003DA-GI; Tue, 09 Feb 2021 17:16:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83354.154897; Tue, 09 Feb 2021 17:16:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Wcz-0003Co-D8; Tue, 09 Feb 2021 17:16:41 +0000
Received: by outflank-mailman (input) for mailman id 83354;
 Tue, 09 Feb 2021 17:16:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NhOK=HL=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1l9Wcx-0003Ch-9F
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 17:16:39 +0000
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:400:200::c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c87bd2ec-64ca-4c29-afe6-54547d6b4020;
 Tue, 09 Feb 2021 17:16:38 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.17.1 DYNA|AUTH)
 with ESMTPSA id 604447x19HGY23t
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 9 Feb 2021 18:16:34 +0100 (CET)
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
X-Inumbo-ID: c87bd2ec-64ca-4c29-afe6-54547d6b4020
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1612890997;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
	From:Subject:Sender;
	bh=40w3WAsyj1Y6QIRn7DUmyhbPlGiTUGQ7jHaOxhb0TFs=;
	b=cP5xc5c4ZZx8Dv9+z0rjKJ/tMYA91DalzZ69Td8btnqbLU9+rh9jxTOV3x9zcc+SMP
	LIo96D6BpVHoLfbkSAtCGmaAZxdiFmwrHf6GHf+WPO8rSQzEYTg5ALr37kR8i5TYJDAB
	FvRjJJUMQvgf/vsjRy8bG+rXITge+I5AN7FwTdzuTS3sM/QkiQEteDDynVcixwJOI+ZM
	6U5H3on0/4QNfvGmkMiv9rHt18b9GIjbSUvOK390A8LC3S2ErUOpENZ6vZh9L+i82nF2
	vKBezP1TjiTOkyXImFgM1ySutxgwaY5W/LfHXgt0XkMMhd/z67BDYqzdM5W8c1VP5PFu
	3KNg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTW+v4/A=="
X-RZG-CLASS-ID: mo00
Date: Tue, 9 Feb 2021 18:16:21 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Ian Jackson <iwj@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, Anthony PERARD
 <anthony.perard@citrix.com>
Subject: Re: [PATCH v20210209 4/4] xl: disable --debug option for xl migrate
Message-ID: <20210209181621.2b329fd0.olaf@aepfle.de>
In-Reply-To: <24610.49788.493621.307069@mariner.uk.xensource.com>
References: <20210209154536.10851-1-olaf@aepfle.de>
	<20210209154536.10851-5-olaf@aepfle.de>
	<24610.49788.493621.307069@mariner.uk.xensource.com>
X-Mailer: Claws Mail 2020.08.19 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/EVRJ6jljPGl=GoN32bmL8Go"; protocol="application/pgp-signature"

--Sig_/EVRJ6jljPGl=GoN32bmL8Go
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 9 Feb 2021 17:12:28 +0000
schrieb Ian Jackson <iwj@xenproject.org>:

> Also, Olaf, please CC Andy on these migration-related patches.

Can this be automated via MAINTAINERS, so that scripts/get_maintainer.pl ad=
dresses the people who feel responsible for it? Right now it ends up in you=
r queue due to 'tools/*'.


Olaf=20

--Sig_/EVRJ6jljPGl=GoN32bmL8Go
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmAiw2UACgkQ86SN7mm1
DoDWvQ/7Buwm79E/JBRMy+iFEy7KgcqTn0vROT6PrymppyTEPunDDwEOfxlzNmTP
TYg2+FP4OOskMoefBGRvsBh19nfI4VnGXsHRElEhPhe3//qIVPuxpMGTL+tBTkV6
V7BSdLhEfB6jxgEKAmDIzCfymSRxig6iTfSQ1JMWc/QQ6lewbD0WV4qrvnZZMvgE
SmNUcDzu4dFORGcWXEIhUkWqiuQVyE5l4T62mxk8mOvaQXWgUNJED0ZHs8YkDGyB
HBAf69klnDUv03tPS9VejolFiWWR7N9ULQN/clhguwnKWTxcGnF2LhznpPPl+vxP
v76finMKYC5ONZsb7O4sC5qA8LLLlnWXijhjgF85G5+UAG0E7d9qx8MgK6BMkPjF
3Zk3OX1nQreFhWm4q7ZGxFo0Gp6tYAgTkfL4ppxAkHpXdVIrdamyTOhdwVMBIh3A
OR026eDiEn/W20dlI0OdG1jrO5KWvYGtOMuIsB8n9OsyjG5fCb1Tb1QkJXfqftzG
9sONQE8WGZPoB6o9fdrenCbEK65pZbsz0CxNHG3XsJa6Zq1lOCyIFTr1IIpp5tD5
Lm9JbvI1+OwA0lup//7N9AwO7eeKDNLQANmevmc2L9rhG1LmYvM7VDo5bcBWXI56
9RyqfQEW3680kEkpvxv7r7tBQV1GKK665cPKkhWy/2/B3dzFNjQ=
=nCFc
-----END PGP SIGNATURE-----

--Sig_/EVRJ6jljPGl=GoN32bmL8Go--

