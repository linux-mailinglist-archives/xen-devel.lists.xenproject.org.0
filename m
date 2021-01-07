Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8A92ECBAD
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jan 2021 09:22:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62801.111367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxQXV-0000UF-DL; Thu, 07 Jan 2021 08:21:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62801.111367; Thu, 07 Jan 2021 08:21:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxQXV-0000Tq-9i; Thu, 07 Jan 2021 08:21:01 +0000
Received: by outflank-mailman (input) for mailman id 62801;
 Thu, 07 Jan 2021 08:20:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YPTw=GK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kxQXT-0000Tl-8A
 for xen-devel@lists.xenproject.org; Thu, 07 Jan 2021 08:20:59 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.163])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba4e05a3-0346-4d85-b3bc-dc7d2fb6427e;
 Thu, 07 Jan 2021 08:20:58 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
 with ESMTPSA id h0968ex078Ku7A6
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 7 Jan 2021 09:20:56 +0100 (CET)
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
X-Inumbo-ID: ba4e05a3-0346-4d85-b3bc-dc7d2fb6427e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610007657;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:From:
	Subject:Sender;
	bh=RRjL5qg99PwzyxkxOqxKqtHFDP+KosBUIfyYw1lhn0s=;
	b=Pa3rhWhTNKN6M1nisib6jjn88dOVpG5bP9c8qTlh6i0GY5kZol0gcWzudO5Iud0vxF
	G/FZSHGvzMzv+eeFQdToZtYnRAlka8D9AOx+Dkq4eiKT5u49YwuNr2WiTe8XoHE28+fU
	Sh3vbijHNscxooVEdQ8VwLbcHbfxSyK/kTebgmxKqFd46xqVlxFazfa+a4a39wFphZ/K
	VB50tE66tFvKOv3ih3TfMli938yvrUkyjC9UVyyr5ld9vl+uVv8PxgwcGRCf7ikKvTcT
	PDF+7vIPj6T7hkg0d6nHTeJOe6rYh2A2pyQEh35QRaQM/14CsDfmFjv1vreSQlBdpWkC
	YOkw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTW+uX"
X-RZG-CLASS-ID: mo00
Date: Thu, 7 Jan 2021 09:20:25 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1] tools: ipxe: update for fixing build with GCC10 [and
 1 more messages]
Message-ID: <20210107092025.340433e9.olaf@aepfle.de>
In-Reply-To: <24565.40383.481245.649560@mariner.uk.xensource.com>
References: <osstest-158191-mainreport@xen.org>
	<20210104115223.25403-1-olaf@aepfle.de>
	<20210105115708.aq2nfk3x4cnizzws@liuwe-devbox-debian-v2>
	<24565.40383.481245.649560@mariner.uk.xensource.com>
X-Mailer: Claws Mail 2020.08.19 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/csassw09mr4OeJvSHB76VYC"; protocol="application/pgp-signature"

--Sig_/csassw09mr4OeJvSHB76VYC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 6 Jan 2021 11:23:43 +0000
schrieb Ian Jackson <iwj@xenproject.org>:

> We currently insist on having have a tarball.

Maybe add a comment to IPXE_GIT_TAG which lists the required extra steps.

Olaf

--Sig_/csassw09mr4OeJvSHB76VYC
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl/2xEoACgkQ86SN7mm1
DoA8BxAAnbpACXx1g9IaJ2ItoPIDh9oDcZkRpg8geJlL9DIfm+RMSFmCyh4Y0Pzw
/Hoe+UQCCj4cFTUZG1PyL6VdaRmPaTp7xYjqIp22+5dn1+th2Lpa39m0pbUVP+NF
Bz1ETmnNcAHTKmedC6xxIztqh3n0+tO7Z58N34JwtRNuR+BSj7ETXW0x2DDoZB+/
PDjr9QuGHrisIkFxuj92fwzK11orfNCEaGoQ8E/bdXHy2uVQ+oyxiGU3FjZLVPpk
6DyzpvzSl0WLf/C+zTUGvl1XIXZWJW3pPThaF3RoNr+sYf4bY/5VfHZ7q+rDah9s
jzkRE5ZvT+j0n2eohwWKi1B5TLZOAZ3tMk/+PjYmXyALCoYKppaKtXRHiBxDNG/d
Hs9JX+jvZp/4FbA0eIntBTzUMEepB0kVcrFmN1VUyIVSaS8JcTDHsi04ylvzXGay
3P143iZTN4MPGbcmAgmIP/cP6JpMQr5j/9xd6MR1IBtQBVCsJO04KaOGAiCK/irS
qI4c5MUTAZvCaygk5G6Fy09ZcUzFA8s9thKBNSUPCLpLR2ifsVy+iASOOtL9KhHq
ed8ssj6x/bSb517ZW9Fdgdpm3JOV0+fif8ZMmus4rPnQkjGha8g7kEB8JYx4rw+x
IWgVy1zyLWtFpQyHt4kxWqYWNrzX1/Xex8G3AieDRuF0SnhR0iI=
=aW3Z
-----END PGP SIGNATURE-----

--Sig_/csassw09mr4OeJvSHB76VYC--

