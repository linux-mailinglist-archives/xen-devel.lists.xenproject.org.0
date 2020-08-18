Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 019852481FB
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 11:35:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7y0k-0000GT-2h; Tue, 18 Aug 2020 09:34:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xK1p=B4=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1k7y0i-0000GO-Bl
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 09:34:28 +0000
X-Inumbo-ID: 918538f1-41c6-44ac-a49a-a9de5bcfc158
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.217])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 918538f1-41c6-44ac-a49a-a9de5bcfc158;
 Tue, 18 Aug 2020 09:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1597743265;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-ID:Subject:Cc:To:From:Date:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=h8L5wMcMk2scPk+ArRe3hpcbu53X3/ary6vs0TtR5gs=;
 b=D/0Gv2OettgKuM1kTfFa+tXf33Yqe+P0odL01GeGyDnoWayXmP2sx0SmgICpnUKZZu
 ssfRpL5wFxZrIiwippXNwzQuRXQJMtJ7UVsZzX3EwV0LGgSNs47eXzrAEkB80Q7FDuuZ
 h+QCAe1j048Ffvtnq39o+WegjmVCTVA7ExAijD9vccyq+uW482glxQJnNbhhe7nZaP2f
 OKIFEcjXlg0WIvSD1r/+KiCYfXxVXJl3EbPf7y0XLjlhV7LXxI11WVv4pkG17gskiB9R
 eh5CTvEHzSJk95oD53dt0NlldxjugZurCmGVYdxz79yU4WkOIeXojnzyhtwW1m/hnKhv
 HQfA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTWe6X"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
 with ESMTPSA id m032cfw7I9YHLJ2
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 18 Aug 2020 11:34:17 +0200 (CEST)
Date: Tue, 18 Aug 2020 11:34:15 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Sergey Dyasli
 <sergey.dyasli@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: xen-cpuid prints only raw hex for policies
Message-ID: <20200818113329.3fc667b9.olaf@aepfle.de>
X-Mailer: Claws Mail 2020.07.13 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/2DhbKxdLhBnr/ts/NvhDe1l"; protocol="application/pgp-signature"
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--Sig_/2DhbKxdLhBnr/ts/NvhDe1l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Since commit 6b85e427098cce1a6d386b3bae2f0c7ce86e47f7 'xen-cpuid -p' shows =
the cpuid policies. I think these policies define what a domU will get to s=
ee when cpuid() is invoked, or when MSRs are accessed.

Unfortunately this commit shows only the raw hex values, which makes it dif=
ficult to compare output from different physical hosts. I think the actual =
policy values could be shown in expanded form, similar to what 'xen-cpuid -=
d' would show.

Did you ever consider to show the expanded form for policies?


Olaf

--Sig_/2DhbKxdLhBnr/ts/NvhDe1l
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl87oJgACgkQ86SN7mm1
DoBWNw/9GYKfHlmSdJctKFqPJXmNMjSNJi24K0xGWYnRjndsdErvjhKByrSzROMl
iWbBUC3oV3KWjuHuSrlKzpJZXvGjx2SyRrBfs7w57I1PIRFOd2ygi8uDVC1xuqDx
1hUh1/6F4ZdwVClqnI8wZZ0mPrKmiPxzeiVMTjLNa8KtX02iaHB1mkpUjwZOl6rm
RMe3W3Vk1492S+O8TYYAz0LmTEcXdDlnoCZP52y7mDlCJK2pPElttdGQ/jwOVpnq
CMvRVVns00j7nn+wyAuH31lXYlX9jwjxtYVpK3NZVE1pNOAk/3LH3sVktCxTxnLr
3a+AZkFm+dMGaXxCLgWOu/Hv7AFuIXWjEhMH06aWinZEUeeRdUTDzwJnP4NiHupr
DzITJQPHGMZQlZh+LmzGDV+NQMGHg0Y/GaPhNKaOHNZZBBgALij5YAy2j/5XVjiM
T8mCwzhv0nJojWS6zqq37b3JjxfYHFfe04Tgbz7qJgMplG3z5tz+TNHwMGh8aW0n
t2qSx69iYtQXQEgS89V8cHJw7x2wc6+kQpDnGTqHGDdf+fZQnyCxrHU+DgQxpHfn
HECSlzZKiGIlKIymwC7zLyeMpnJ/Ivh+Jgm4BL/QttTsBWUxUJZiyztNMXbo9P+a
gWx7O8a77VDEFc+TNjyWXkmhkSq1LYYfTPeVoHDZcoSnCVGyMTo=
=7mWp
-----END PGP SIGNATURE-----

--Sig_/2DhbKxdLhBnr/ts/NvhDe1l--

