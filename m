Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1CE3B9218
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 15:16:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148673.274741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lywXb-00058H-G5; Thu, 01 Jul 2021 13:15:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148673.274741; Thu, 01 Jul 2021 13:15:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lywXb-000563-Bd; Thu, 01 Jul 2021 13:15:39 +0000
Received: by outflank-mailman (input) for mailman id 148673;
 Thu, 01 Jul 2021 13:15:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lywXa-00055x-6d
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 13:15:38 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 173f5661-7eed-4ab8-9411-85344c6e75a6;
 Thu, 01 Jul 2021 13:15:36 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx61DFY6p7
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 15:15:34 +0200 (CEST)
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
X-Inumbo-ID: 173f5661-7eed-4ab8-9411-85344c6e75a6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625145335;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=VUOe4fD/9EB6E2UIF6q276ktoXEd68aVUwnt106S2n8=;
    b=XGTlNS8dM8WpPYBxTisbx9wciJxLSBTlGvfdM4LURUjZTVgF2hOIAg6uzp41BnXT+x
    jTP7yXgnRDycuyLeq4f97oYW7UC2kz1ez+rYRkvug7o7aTH5b9D9vDIMtXdXYpf5yhM8
    KynSLBEID477Hp/9c+or/78v6r9QxdNHclWws+vTInVlvrjPK0dK3accYHD1ZmgP8OPA
    Ny9wZ5Q0pwjQhzeOmtfu175e912BFUPrBY711AHUmX2KPNIpTs5DYBTHPw/aJ2laJvAM
    POMAI+9CjQpJHPSAqj9yyUuofBvSUIa3CYJssWtL1exxTTS2vQdCirPcGrOZEiJ69cnG
    bf/Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisQsBBSIa03sY9BUY2ao0oygRsMfcqA6zjDLeeWXNg=="
X-RZG-CLASS-ID: mo00
Date: Thu, 1 Jul 2021 15:15:28 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>
Subject: Re: XEN_SYSCTL_cpu_policy_hvm_default truncates leaf count
Message-ID: <20210701151528.08d1f503.olaf@aepfle.de>
In-Reply-To: <67f50c0d-753c-936e-bf1e-11a708150851@citrix.com>
References: <20210701125623.593fe3ae.olaf@aepfle.de>
	<20e828c9-e7dc-4401-9307-a6d72eb618d8@citrix.com>
	<20210701133628.1667a344.olaf@aepfle.de>
	<67f50c0d-753c-936e-bf1e-11a708150851@citrix.com>
X-Mailer: Claws Mail 2021.05.27 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dPfTf=+Bc/xAS28jgJQu.9b";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/dPfTf=+Bc/xAS28jgJQu.9b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 1 Jul 2021 13:35:20 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> Can you grab xen-cpuid -p from this system please?

Two PowerEdge T320 with E5-2430L.

Xen reports there are maximum 119 leaves and 2 MSRs
Raw policy: 32 leaves, 2 MSRs
 CPUID:
  leaf     subleaf  -> eax      ebx      ecx      edx    =20
  00000000:ffffffff -> 0000000d:756e6547:6c65746e:49656e69
  00000001:ffffffff -> 000306e4:00200800:7fbee3ff:bfebfbff
  00000002:ffffffff -> 76036301:00f0b2ff:00000000:00ca0000
  00000004:00000000 -> 3c004121:01c0003f:0000003f:00000000
  00000004:00000001 -> 3c004122:01c0003f:0000003f:00000000
  00000004:00000002 -> 3c004143:01c0003f:000001ff:00000000
  00000004:00000003 -> 3c07c163:04c0003f:00002fff:00000006
  00000005:ffffffff -> 00000040:00000040:00000003:00001120
  00000006:ffffffff -> 00000077:00000002:00000001:00000000
  00000007:00000000 -> 00000000:00000281:00000000:9c000400
  0000000a:ffffffff -> 07300403:00000000:00000000:00000603
  0000000b:00000000 -> 00000001:00000002:00000100:00000000
  0000000b:00000001 -> 00000005:0000000c:00000201:00000000
  0000000d:00000000 -> 00000007:00000340:00000340:00000000
  0000000d:00000001 -> 00000001:00000000:00000000:00000000
  0000000d:00000002 -> 00000100:00000240:00000000:00000000
  80000000:ffffffff -> 80000008:00000000:00000000:00000000
  80000001:ffffffff -> 00000000:00000000:00000001:2c100800
  80000002:ffffffff -> 20202020:746e4920:52286c65:65582029
  80000003:ffffffff -> 52286e6f:50432029:35452055:3334322d
  80000004:ffffffff -> 76204c30:20402032:30342e32:007a4847
  80000006:ffffffff -> 00000000:00000000:01006040:00000000
  80000007:ffffffff -> 00000000:00000000:00000000:00000100
  80000008:ffffffff -> 0000302e:00000000:00000000:00000000
 MSRs:
  index    -> value          =20
  000000ce -> 0000000080000000
  0000010a -> 0000000000000000
Host policy: 31 leaves, 2 MSRs
 CPUID:
  leaf     subleaf  -> eax      ebx      ecx      edx    =20
  00000000:ffffffff -> 0000000d:756e6547:6c65746e:49656e69
  00000001:ffffffff -> 000306e4:00200800:77bee3ff:bfebfbff
  00000002:ffffffff -> 76036301:00f0b2ff:00000000:00ca0000
  00000004:00000000 -> 3c004121:01c0003f:0000003f:00000000
  00000004:00000001 -> 3c004122:01c0003f:0000003f:00000000
  00000004:00000002 -> 3c004143:01c0003f:000001ff:00000000
  00000004:00000003 -> 3c07c163:04c0003f:00002fff:00000006
  00000007:00000000 -> 00000000:00000281:00000000:9c000400
  0000000d:00000000 -> 00000007:00000000:00000340:00000000
  0000000d:00000001 -> 00000001:00000000:00000000:00000000
  0000000d:00000002 -> 00000100:00000240:00000000:00000000
  80000000:ffffffff -> 80000008:00000000:00000000:00000000
  80000001:ffffffff -> 00000000:00000000:00000001:2c100800
  80000002:ffffffff -> 20202020:746e4920:52286c65:65582029
  80000003:ffffffff -> 52286e6f:50432029:35452055:3334322d
  80000004:ffffffff -> 76204c30:20402032:30342e32:007a4847
  80000006:ffffffff -> 00000000:00000000:01006040:00000000
  80000007:ffffffff -> 00000000:00000000:00000000:00000100
  80000008:ffffffff -> 0000302e:00000000:00000000:00000000
 MSRs:
  index    -> value          =20
  000000ce -> 0000000080000000
  0000010a -> 0000000000000000
PV Max policy: 31 leaves, 2 MSRs
 CPUID:
  leaf     subleaf  -> eax      ebx      ecx      edx    =20
  00000000:ffffffff -> 0000000d:756e6547:6c65746e:49656e69
  00000001:ffffffff -> 000306e4:00200800:f6b82203:1fc9cbf5
  00000002:ffffffff -> 76036301:00f0b2ff:00000000:00ca0000
  00000004:00000000 -> 3c004121:01c0003f:0000003f:00000000
  00000004:00000001 -> 3c004122:01c0003f:0000003f:00000000
  00000004:00000002 -> 3c004143:01c0003f:000001ff:00000000
  00000004:00000003 -> 3c07c163:04c0003f:00002fff:00000006
  00000007:00000000 -> 00000000:00000201:00000000:8c000400
  0000000d:00000000 -> 00000007:00000000:00000340:00000000
  0000000d:00000001 -> 00000001:00000000:00000000:00000000
  0000000d:00000002 -> 00000100:00000240:00000000:00000000
  80000000:ffffffff -> 80000008:00000000:00000000:00000000
  80000001:ffffffff -> 00000000:00000000:00000001:28100800
  80000002:ffffffff -> 20202020:746e4920:52286c65:65582029
  80000003:ffffffff -> 52286e6f:50432029:35452055:3334322d
  80000004:ffffffff -> 76204c30:20402032:30342e32:007a4847
  80000006:ffffffff -> 00000000:00000000:01006040:00000000
  80000007:ffffffff -> 00000000:00000000:00000000:00000100
  80000008:ffffffff -> 0000302e:00001000:00000000:00000000
 MSRs:
  index    -> value          =20
  000000ce -> 0000000080000000
  0000010a -> 0000000000000000
HVM Max policy: 31 leaves, 2 MSRs
 CPUID:
  leaf     subleaf  -> eax      ebx      ecx      edx    =20
  00000000:ffffffff -> 0000000d:756e6547:6c65746e:49656e69
  00000001:ffffffff -> 000306e4:00200800:f7ba2223:1fcbfbff
  00000002:ffffffff -> 76036301:00f0b2ff:00000000:00ca0000
  00000004:00000000 -> 3c004121:01c0003f:0000003f:00000000
  00000004:00000001 -> 3c004122:01c0003f:0000003f:00000000
  00000004:00000002 -> 3c004143:01c0003f:000001ff:00000000
  00000004:00000003 -> 3c07c163:04c0003f:00002fff:00000006
  00000007:00000000 -> 00000000:00000281:00000000:9c000400
  0000000d:00000000 -> 00000007:00000000:00000340:00000000
  0000000d:00000001 -> 00000001:00000000:00000000:00000000
  0000000d:00000002 -> 00000100:00000240:00000000:00000000
  80000000:ffffffff -> 80000008:00000000:00000000:00000000
  80000001:ffffffff -> 00000000:00000000:00000001:2c100800
  80000002:ffffffff -> 20202020:746e4920:52286c65:65582029
  80000003:ffffffff -> 52286e6f:50432029:35452055:3334322d
  80000004:ffffffff -> 76204c30:20402032:30342e32:007a4847
  80000006:ffffffff -> 00000000:00000000:01006040:00000000
  80000007:ffffffff -> 00000000:00000000:00000000:00000100
  80000008:ffffffff -> 0000302e:00101000:00000000:00000000
 MSRs:
  index    -> value          =20
  000000ce -> 0000000080000000
  0000010a -> 0000000000000000
PV Default policy: 31 leaves, 2 MSRs
 CPUID:
  leaf     subleaf  -> eax      ebx      ecx      edx    =20
  00000000:ffffffff -> 0000000d:756e6547:6c65746e:49656e69
  00000001:ffffffff -> 000306e4:00200800:f6b82203:1fc9cbf5
  00000002:ffffffff -> 76036301:00f0b2ff:00000000:00ca0000
  00000004:00000000 -> 3c004121:01c0003f:0000003f:00000000
  00000004:00000001 -> 3c004122:01c0003f:0000003f:00000000
  00000004:00000002 -> 3c004143:01c0003f:000001ff:00000000
  00000004:00000003 -> 3c07c163:04c0003f:00002fff:00000006
  00000007:00000000 -> 00000000:00000201:00000000:8c000400
  0000000d:00000000 -> 00000007:00000000:00000340:00000000
  0000000d:00000001 -> 00000001:00000000:00000000:00000000
  0000000d:00000002 -> 00000100:00000240:00000000:00000000
  80000000:ffffffff -> 80000008:00000000:00000000:00000000
  80000001:ffffffff -> 00000000:00000000:00000001:28100800
  80000002:ffffffff -> 20202020:746e4920:52286c65:65582029
  80000003:ffffffff -> 52286e6f:50432029:35452055:3334322d
  80000004:ffffffff -> 76204c30:20402032:30342e32:007a4847
  80000006:ffffffff -> 00000000:00000000:01006040:00000000
  80000008:ffffffff -> 0000302e:00001000:00000000:00000000
 MSRs:
  index    -> value          =20
  000000ce -> 0000000080000000
  0000010a -> 0000000000000000
HVM Default policy: 31 leaves, 2 MSRs
 CPUID:
  leaf     subleaf  -> eax      ebx      ecx      edx    =20
  00000000:ffffffff -> 0000000d:756e6547:6c65746e:49656e69
  00000001:ffffffff -> 000306e4:00200800:f7ba2203:1fcbfbff
  00000002:ffffffff -> 76036301:00f0b2ff:00000000:00ca0000
  00000004:00000000 -> 3c004121:01c0003f:0000003f:00000000
  00000004:00000001 -> 3c004122:01c0003f:0000003f:00000000
  00000004:00000002 -> 3c004143:01c0003f:000001ff:00000000
  00000004:00000003 -> 3c07c163:04c0003f:00002fff:00000006
  00000007:00000000 -> 00000000:00000281:00000000:9c000400
  0000000d:00000000 -> 00000007:00000000:00000340:00000000
  0000000d:00000001 -> 00000001:00000000:00000000:00000000
  0000000d:00000002 -> 00000100:00000240:00000000:00000000
  80000000:ffffffff -> 80000008:00000000:00000000:00000000
  80000001:ffffffff -> 00000000:00000000:00000001:2c100800
  80000002:ffffffff -> 20202020:746e4920:52286c65:65582029
  80000003:ffffffff -> 52286e6f:50432029:35452055:3334322d
  80000004:ffffffff -> 76204c30:20402032:30342e32:007a4847
  80000006:ffffffff -> 00000000:00000000:01006040:00000000
  80000008:ffffffff -> 0000302e:00101000:00000000:00000000
 MSRs:
  index    -> value          =20
  000000ce -> 0000000080000000
  0000010a -> 0000000000000000

--Sig_/dPfTf=+Bc/xAS28jgJQu.9b
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDdv/AACgkQ86SN7mm1
DoAn2Q/9HgV8MwFT1qRJIr38MAahDjeqntfhTfmUjZe39MIfb6NHKY520NQg/BM8
XltxWN0jKP8yKcHBtSXQZIhkndgYWVhbvHjRhHaCUyaHPO9ZwQG5Y9pV6K0CNwoT
mkifrC0WxSHwxuWBSdQU/zyUJVdvMSbwJ5g0uzALP8zRueiz7Gfqj1h+WJ2RWlM4
fLLX+OSAf/Txzyl6C4eZl/nykSLv1iH5FQ3ebO7G2yCfb1nMSd9wPWj2hiQQVj6j
oinGV97fMUtBjDKE/ttyCRgFuW1LGLyvd2wsvTCoD+tX3Jaeoo7VIcwKeSA3um8S
YUIniMd5y3D53FwKtyb7NpC6DeIC2/woetqRZ/qIVNPzdC29qIlTgukEp2ortxrX
vh2fjEg7cAFlLB6Y1nKzxIbIVz1TEhSRSeoyukU+wHX79X/Ww1N02EgFyIavOjiI
kc5v6f0xbcMyCifjk+fwhXXRbc0Ss9MzGf5mY4fH/y6VKKv4BKyonYW9XTRcNxu5
VEdRWhV2cc4sMljFCsr/JCUAE/usb803GIuP3srQY5KZ1lej7LuI+qJFNdsX5lS0
e6zjUEQUj9s0wsjCZCCuBT8EHZ2HjJh4BByoSMd2VNJRaP9+e/JzXlY0kD+ywe83
jGqtJdjtlMzkrSvL1OKKyDUyZTU1ElUshwEl9quzwUhUMldL2/A=
=usa2
-----END PGP SIGNATURE-----

--Sig_/dPfTf=+Bc/xAS28jgJQu.9b--

