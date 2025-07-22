Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C366B0D2C5
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 09:24:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052000.1420489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue7ML-0003D3-5n; Tue, 22 Jul 2025 07:24:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052000.1420489; Tue, 22 Jul 2025 07:24:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue7ML-0003BF-3H; Tue, 22 Jul 2025 07:24:21 +0000
Received: by outflank-mailman (input) for mailman id 1052000;
 Tue, 22 Jul 2025 07:24:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YR2v=2D=uniontech.com=wangyuli@srs-se1.protection.inumbo.net>)
 id 1ue7MI-0003B9-W0
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 07:24:19 +0000
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db356134-66cc-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 09:24:10 +0200 (CEST)
Received: from [IPV6:240e:668:120a::212:232] ( [localhost])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 22 Jul 2025 15:22:18 +0800 (CST)
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
X-Inumbo-ID: db356134-66cc-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1753168998;
	bh=4HhP2iNixfpmY9GA50RldzfymFrP5PRb/ex2XnKjRrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=mLe5XmGUOArSYdy/2/xBjJ8ilefcPJfI7C2P1v5h7B6E8O0V9PMg+NtyBhaDSkeR5
	 AdzNmtpcZtE+7m1/mxUJSQ0fPLb13pFQBo2xwPv4R9v4GVq8YxQC5Ym2YssnmgJYtA
	 XQ2tuch7o1eHx/9SfyMctramX02mE4k8SKTPjs9A=
X-QQ-mid: zesmtpip4t1753168943tb2aa8fc1
X-QQ-Originating-IP: jlkPh//3cQuVzne1YV9Hj8c3k19VYTQ4PPPWu+FTW/A=
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 3880468087656715595
EX-QQ-RecipientCnt: 62
Message-ID: <634BA467821D37FE+0b2ace38-07d9-4500-8bb7-5a4fa65c4b9f@uniontech.com>
Date: Tue, 22 Jul 2025 15:22:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] serial: 8250_dw: Fix typo "notifer"
To: Greg KH <gregkh@linuxfoundation.org>
Cc: airlied@gmail.com, akpm@linux-foundation.org, alison.schofield@intel.com,
 andrew+netdev@lunn.ch, andriy.shevchenko@linux.intel.com,
 arend.vanspriel@broadcom.com, bp@alien8.de,
 brcm80211-dev-list.pdl@broadcom.com, brcm80211@lists.linux.dev,
 colin.i.king@gmail.com, cvam0000@gmail.com, dan.j.williams@intel.com,
 dave.hansen@linux.intel.com, dave.jiang@intel.com, dave@stgolabs.net,
 davem@davemloft.net, dri-devel@lists.freedesktop.org, edumazet@google.com,
 guanwentao@uniontech.com, hpa@zytor.com, ilpo.jarvinen@linux.intel.com,
 intel-xe@lists.freedesktop.org, ira.weiny@intel.com, j@jannau.net,
 jeff.johnson@oss.qualcomm.com, jgross@suse.com, jirislaby@kernel.org,
 johannes.berg@intel.com, jonathan.cameron@huawei.com, kuba@kernel.org,
 kvalo@kernel.org, kvm@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux@treblig.org, lucas.demarchi@intel.com,
 marcin.s.wojtas@gmail.com, ming.li@zohomail.com, mingo@kernel.org,
 mingo@redhat.com, netdev@vger.kernel.org, niecheng1@uniontech.com,
 oleksandr_tyshchenko@epam.com, pabeni@redhat.com, pbonzini@redhat.com,
 quic_ramess@quicinc.com, ragazenta@gmail.com, rodrigo.vivi@intel.com,
 seanjc@google.com, shenlichuan@vivo.com, simona@ffwll.ch,
 sstabellini@kernel.org, tglx@linutronix.de,
 thomas.hellstrom@linux.intel.com, vishal.l.verma@intel.com, x86@kernel.org,
 xen-devel@lists.xenproject.org, yujiaoliang@vivo.com, zhanjun@uniontech.com
References: <BD5C52D2838AEA48+20250715134050.539234-1-wangyuli@uniontech.com>
 <2BF1749F02ADE664+20250715134407.540483-6-wangyuli@uniontech.com>
 <2025071607-outbid-heat-b0ba@gregkh>
Content-Language: en-US
From: WangYuli <wangyuli@uniontech.com>
Autocrypt: addr=wangyuli@uniontech.com; keydata=
 xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSKP+nX39DN
 IVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAxFiEEa1GMzYeuKPkg
 qDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMBAAAKCRDF2h8wRvQL7g0UAQCH
 3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfPbwD/SrncJwwPAL4GiLPEC4XssV6FPUAY
 0rA68eNNI9cJLArOOARmgSyJEgorBgEEAZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7
 VTL0dvPDofBTjFYDAQgHwngEGBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIb
 DAAKCRDF2h8wRvQL7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkU
 o9ERi7qS/hbUdUgtitI89efbY0TVetgDsyeQiwU=
In-Reply-To: <2025071607-outbid-heat-b0ba@gregkh>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1TBt0IFfjz321DLdIVEctMps"
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NWMjIPXM0fdCeM5XjcymleHW4s/DHpFX2HkZvUBVTCl3zqT0FD4dah6H
	pQ/g1hoWBm4enLxEENm9Y2keeUYl8X45TgZySZnH2nb0ZcA9PbHpLZHH+iGJfG3QdKdg5jk
	OZwh4s1pbZWIHlZ3SF0FM6SQsbU936vMsabF7bGwbwH6blFyhhptoK4I4TheYGrXkPSnsGt
	7Ftz0e275OcCvrJ5QOipLiV/k3T6ctG4nJlVPqq8KOwtNW2KJGVe1VAq8R3i293a5vPhq8F
	oY6tiIRKgxomY5mNQkjuXlgaFTSXsnRNYUNmKJwK+FZ6M/0G2KuUh0+GXLtreReMY03eIHI
	dhbyhC2c50Xn9Mwq5oHiY9AUXru5Rvspn8UAAUUo7zbTuENV2GCd3q1o5FvSjDmKbnY+GOT
	zptM7e3poPxAvpdzrXv6wk9iSaUmzSmTzWnvXvy9FZodwt7XjsIg33uHMp+pSbt3GQFiQ05
	70O89tl4cpVD/3aQIh6I2UjOe5D9aOeGEFZ7uDXvkMvluc8pY8rhk7iDHG55wAHZb5Lf05H
	+y+dOvailfaCvsMi9Qnf4SrQd0qvVkhnhRcJjRy7H/L+DK837JSvubQtm9saBfct4jh4pTw
	UcvObr5tmd7IQCp7oh0TKaCCbC3fl3qEdN8ncM2gyyXclPDttqGq3+24nS6Bswvx0lmNfdJ
	wAy04abaLg8osOCiT+idv71dTRCGHAqZ9PTAB45F2ynvwc3NnwTrAUjBGD+eTj+KGDlc22N
	6p4XyIq+aMUK6loLe2LCiPq+Qt6rjaBiGXFHEMem/reWqE7OwMvJHLtEWGc3G4E7QGgacKY
	sVRe+oXlMEOcavgQhgA1u45ADef/fIwqkBhmvXDUgYwCJBny0Ca/E2j2Rt13Hu8W4dyR4kM
	RveRTn22UkW/SW6O9z825WnpQVb3gvPM1pU9PAk6tspgkEkeb0ad3cnoophaMTsjKc+RM/V
	5F9WW/tEmA2uJreejqLNUpD0kyT3pR0RE5ULmK2kokuymJMs4QhUhHCPuwjacld+ukV7bP/
	CnzAAKjiiKBD65Dn/EBOipBU+a/+xUBL6SDNP2VtrDjTEpT7J5lw8rjZIHJ0ZsMpWNXUO7J
	0CpcGgmZA67GxpPBoxN40/64nPsb6yDBXfCHCem6d9/
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1TBt0IFfjz321DLdIVEctMps
Content-Type: multipart/mixed; boundary="------------7NzxUd2CIcc1X22DyUWciByd";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: airlied@gmail.com, akpm@linux-foundation.org, alison.schofield@intel.com,
 andrew+netdev@lunn.ch, andriy.shevchenko@linux.intel.com,
 arend.vanspriel@broadcom.com, bp@alien8.de,
 brcm80211-dev-list.pdl@broadcom.com, brcm80211@lists.linux.dev,
 colin.i.king@gmail.com, cvam0000@gmail.com, dan.j.williams@intel.com,
 dave.hansen@linux.intel.com, dave.jiang@intel.com, dave@stgolabs.net,
 davem@davemloft.net, dri-devel@lists.freedesktop.org, edumazet@google.com,
 guanwentao@uniontech.com, hpa@zytor.com, ilpo.jarvinen@linux.intel.com,
 intel-xe@lists.freedesktop.org, ira.weiny@intel.com, j@jannau.net,
 jeff.johnson@oss.qualcomm.com, jgross@suse.com, jirislaby@kernel.org,
 johannes.berg@intel.com, jonathan.cameron@huawei.com, kuba@kernel.org,
 kvalo@kernel.org, kvm@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux@treblig.org, lucas.demarchi@intel.com,
 marcin.s.wojtas@gmail.com, ming.li@zohomail.com, mingo@kernel.org,
 mingo@redhat.com, netdev@vger.kernel.org, niecheng1@uniontech.com,
 oleksandr_tyshchenko@epam.com, pabeni@redhat.com, pbonzini@redhat.com,
 quic_ramess@quicinc.com, ragazenta@gmail.com, rodrigo.vivi@intel.com,
 seanjc@google.com, shenlichuan@vivo.com, simona@ffwll.ch,
 sstabellini@kernel.org, tglx@linutronix.de,
 thomas.hellstrom@linux.intel.com, vishal.l.verma@intel.com, x86@kernel.org,
 xen-devel@lists.xenproject.org, yujiaoliang@vivo.com, zhanjun@uniontech.com
Message-ID: <0b2ace38-07d9-4500-8bb7-5a4fa65c4b9f@uniontech.com>
Subject: Re: [PATCH v2 6/8] serial: 8250_dw: Fix typo "notifer"
References: <BD5C52D2838AEA48+20250715134050.539234-1-wangyuli@uniontech.com>
 <2BF1749F02ADE664+20250715134407.540483-6-wangyuli@uniontech.com>
 <2025071607-outbid-heat-b0ba@gregkh>
In-Reply-To: <2025071607-outbid-heat-b0ba@gregkh>

--------------7NzxUd2CIcc1X22DyUWciByd
Content-Type: multipart/mixed; boundary="------------3ELnNhbpHyc90r6KiSkcbbdY"

--------------3ELnNhbpHyc90r6KiSkcbbdY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgZ3JlZyBrLWgsDQoNCk9uIDIwMjUvNy8xNiAxNjowOCwgR3JlZyBLSCB3cm90ZToNCj4+
IFNpZ25lZC1vZmYtYnk6IFdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPg0KPiBJ
cyB5b3VyIG5hbWUgYWxsIG9uZSB3b3JkIGxpa2UgdGhhdCwgb3Igc2hvdWxkIHRoZXJlIGJl
IGEgIiAiIGJldHdlZW4NCj4gdGhlbT8NCg0KSWYgSSB3ZXJlIHRvIGZvbGxvdyBXZXN0ZXJu
IG5hbWluZyBjb252ZW50aW9ucywgbXkgbmFtZSB3b3VsZCBiZSB3cml0dGVuIA0KYXMgJ1l1
bGkgV2FuZycuDQoNCkhvd2V2ZXIsIGZyYW5rbHksIEkgZmluZCBpdCB1bm5lY2Vzc2FyeSBh
bmQgY2FuJ3QgYmUgYm90aGVyZWQgdG8gZm9sbG93IA0KdGhlaXIgY3VzdG9tcywgdW5sZXNz
IGEgbWFpbnRhaW5lciBzdHJvbmdseSBpbnNpc3RzLiAoRm9yIGV4YW1wbGUsIHlvdSANCmNh
biBzZWUgdGhhdCBteSBzaWduYXR1cmUgb24gY29tbWl0cyBmb3IgdGhlIExvb25nQXJjaCBz
dWJzeXN0ZW0gaXMgDQpkaWZmZXJlbnQgZnJvbSBteSBvdGhlciBjb250cmlidXRpb25zKS4N
Cg0KU2luY2UgQ2hpbmVzZSBuYW1lcyBhcmUgd3JpdHRlbiB3aXRob3V0IGFueSBzcGFjZXMg
aW4gQ2hpbmVzZSANCmNoYXJhY3RlcnMsIEkgZG9uJ3QgdGhpbmsgaXQgbWF0dGVycy4NCg0K
PiBBbHNvLCBhcyBvdGhlcnMgc2FpZCwgZG9uJ3QgbGluayB0byB5b3VyIG93biBwYXRjaC4N
Ck9LLCBJJ2xsIHNlbmQgdGhlIHBhdGNoc2V0IHYzLg0KDQoNClRoYW5rcywNCg0KLS0gDQrn
jovmmLHlipsNCg==
--------------3ELnNhbpHyc90r6KiSkcbbdY
Content-Type: application/pgp-keys; name="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Disposition: attachment; filename="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSK
P+nX39DNIVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAx
FiEEa1GMzYeuKPkgqDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMB
AAAKCRDF2h8wRvQL7g0UAQCH3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfP
bwD/SrncJwwPAL4GiLPEC4XssV6FPUAY0rA68eNNI9cJLArOOARmgSyJEgorBgEE
AZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7VTL0dvPDofBTjFYDAQgHwngE
GBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIbDAAKCRDF2h8wRvQL
7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkUo9ERi7qS
/hbUdUgtitI89efbY0TVetgDsyeQiwU=3D
=3DBlkq
-----END PGP PUBLIC KEY BLOCK-----

--------------3ELnNhbpHyc90r6KiSkcbbdY--

--------------7NzxUd2CIcc1X22DyUWciByd--

--------------1TBt0IFfjz321DLdIVEctMps
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCaH88KgUDAAAAAAAKCRDF2h8wRvQL7pms
AP9jnuV1Ar3880YbizkuBFljgc3bOdOu/RxLmWu2LJmNBAD/S6F38qLfKIrdjJNkNGO7V3LvW7p0
ssmAK5aDMMRZzAI=
=fJ9f
-----END PGP SIGNATURE-----

--------------1TBt0IFfjz321DLdIVEctMps--

