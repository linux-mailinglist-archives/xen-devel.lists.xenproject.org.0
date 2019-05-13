Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9F21BAD5
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 18:17:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQDaj-0005Mf-4f; Mon, 13 May 2019 16:14:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RcTn=TN=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hQDag-0005MY-Oh
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 16:14:15 +0000
X-Inumbo-ID: 251e063b-759a-11e9-8980-bc764e045a96
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::11])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 251e063b-759a-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 16:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1557764051;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=pCTJy0pH7cmNl+gK6ITgMv/CQfxg9MYlxRJPohg3W4A=;
 b=hYbrx/gagdalxb0tNX2Eh5PSHWf3GV7W6Y7NUhftoz3FBPC04e46EtPZGpOM9uJRCV
 eNmayXeiA6cdeC5lhbjrEuUzm550wJinis8Qz6ZAYQ8Bfw2/fvASUQGchh2kLhyHvTNo
 EsZIndr9LlwWoPZquLHLblRsIKl/pxEKhxLSBqa0kS9W3WjBhw8yaFOkItf0q0OU6L80
 owXnPJ+kFKTApK9dPJaj9t7HL26pdpjOicAkN6AyTAfLgiTUBKygbxEUM6VZZlqiQj/Y
 FGEpKFEPjT5RnGAdSYPlXMb9YNx1+vduUql2IiQOkw8MsvZ8SYioTwGfG9BnlQys5n1e
 BcYA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4kV1cX92EW4mFvNjTRB"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.20 AUTH)
 with ESMTPSA id U080cav4DGE82Hd
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Mon, 13 May 2019 18:14:08 +0200 (CEST)
Date: Mon, 13 May 2019 18:14:03 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Wei Liu <wei.liu2@citrix.com>
Message-ID: <20190513181403.42161773.olaf@aepfle.de>
In-Reply-To: <20190513153414.GU2798@zion.uk.xensource.com>
References: <20190513153414.GU2798@zion.uk.xensource.com>
X-Mailer: Claws Mail 2019.04.26 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] Anyone using blktap2?
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Marek =?UTF-8?B?TWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>,
 Alistair Francis <alistair.francis@xilinx.com>
Content-Type: multipart/mixed; boundary="===============8635347849577265449=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============8635347849577265449==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/b3s.RUJIoyJHSust02V8FtJ"; protocol="application/pgp-signature"

--Sig_/b3s.RUJIoyJHSust02V8FtJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 13 May 2019 16:34:14 +0100
schrieb Wei Liu <wei.liu2@citrix.com>:

> Seeing that you were the last people who changed blktap2 in a meaningful
> way: do you use it at all?

The default for --enable-blktap2 in tools/configure.ac is off, and nothing
seems to pass --enable-blktap2 to configure. So I'm ok to remove the code.

Olaf

--Sig_/b3s.RUJIoyJHSust02V8FtJ
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXNmXzAAKCRBdQqD6ppg2
ftxsAJ9VXVNnUkngnb+lhNGmpPi/TkaIvwCgsm1pCGUWLuPtQIFq3lUfeCYV9yc=
=gT2h
-----END PGP SIGNATURE-----

--Sig_/b3s.RUJIoyJHSust02V8FtJ--


--===============8635347849577265449==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8635347849577265449==--

