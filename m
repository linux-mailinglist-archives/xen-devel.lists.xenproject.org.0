Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8368145CB9
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 20:54:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuM14-0003Wz-A8; Wed, 22 Jan 2020 19:50:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zGkp=3L=yahoo.com=akm2tosher@srs-us1.protection.inumbo.net>)
 id 1iuM13-0003Wu-H4
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 19:50:17 +0000
X-Inumbo-ID: 694d5661-3d50-11ea-bd39-12813bfff9fa
Received: from sonic311-24.consmr.mail.ne1.yahoo.com (unknown [66.163.188.205])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 694d5661-3d50-11ea-bd39-12813bfff9fa;
 Wed, 22 Jan 2020 19:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1579722615; bh=Z/gqmvUTsmH0+d9SDs8BAkSXWav3H84t/AsBnHZNQss=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject;
 b=P8XYH0mn3Oj1yyXr+AE4lyCtqMNiXfLPsW/IimbSqEcz3r2yZgYGSdhB1aXLmTO5sA6ZuTk5AoJ/kt9WXNeHfqmxhWGi09JoX5ZqsfqTj+EZyZO0ivEtjoX1acd6H/jye/F8FpZ7X1iCmC42QeWf90/bdW1QMnBsJCHi+aCqOCkSs6h9xXu2q4jF+Zzse8YpC5UzOUnvtzadfYZufk90Iv23tboBvkWcnVqdJNZMS+3D29YW3N9mW1nKxBbAaUFPtDH5XHmdZ770isFRnJ2vus+zZ72ec22AOUchvVVgpNQbr5r183BQsQyoLbCMp/INYBOfpcxWsGm2ddIOEprFEw==
X-YMail-OSG: zFEI77kVM1mT9bq0lbNRXH3fgvBmrLzPwE_1ib80mXe1GOf7ZoyTSS6FAHDvNj8
 NeXZWVAv.r7s9OtTMB_c98T4KxFQEdYvJdtZSjtd4_wiweFAQprJyEm.b8806q2W6YbozpAlzPDi
 ydZrMUNjxZK3ZmRg58PCezDMmyXGU9Zykl2c0Ub2Vo_rLkRgwDdS22_QN.42F6BCZhV.QFZ3e7HS
 TsPhE9GoD.gqc209SiM7.CvPP4js0IF5JArflqBgsMtbjJHxW1pjS8PFZiDnsJPYyCJVUpjajzMP
 ohPP0FLGPfJDq8Kn0RUAYYb_i4PTGTiXIII6wotVdZb.tbPZEffIo54gVIJj3pCYpco6bZJ6.TH8
 dunu4vNPVwNFThgyjlmDR4Y87LHgi4pNXw_deNWcVoUItlMoTzGN4en3BhRGletmmxDm4dj8O9lC
 jveaNwJvjV3B_HPqRez_VhNL2xsYJYKN3ttjkN5ZghZH_IcqMkRrbCc07Z57JyLhG6L3f9bAvemQ
 uxDtMU3LbG_d7PyjpwkN3epQlsEPMI6K2Ic0gxEw6fumNXc1E3B1eA7A0v7GRpOCsfhsKmrm9eCr
 fCfbmTN8hDJ6e3iYjkShf4ZMahuipXACBXEuwE14JbZ61Ao3UPZ_.BxV2uEImDHgEUcBZvrPsGz5
 nrQOusykKeVNJOWIr1q4R4MKAhE9hrJI_qlajiiv2o9MABPuCtdk9D7EzG2ecv.ETgQW6XSaiSye
 m7b20btaLnL3TmwkbwGJoAkTtYqd67pZBZO8LDdi0SkEkLC0JAXS2kPududSaDjNjl8ryeofe7h_
 jxAgUzm4Slatm1aXlmkqQ3.WLjS7Rn3_7ZAVgJ5bW.QACBjaV5RTvcdVV7dPIsvmhQ5RiWd.2qRE
 vfgpUdUpG2WucvfU1_iioKB.D8NxdgKZiQ9YSl8zMiinBX6eysCKIKx4_j8QPegraL2igGvoACvp
 YpczsKnbO7sytAzR.yVCITy.mdZUSznCd9mJ41lKkTom.Pcw4R3OKl5L4NzOhiW7TgGzbxx8dwkg
 49FLWchqP23Z_MuVdsgPYSo3X2zY871siv05ztsqoSciF200EevO2vpBWcqfaZ.0mZqj2Xq8YY.C
 Vf6QVJG2xFq.GXWhm2dQimtc6IPjanhiHUxAiV54YFNfywXeHa0YT4NXjXHTK5qE91cncR5oYZZX
 YuA0TBZr55VCE2t3JgSFPL06w12WXS7VBuE5KlwsIHGN4PxMCW1fGvSqPYtFDbJVoTbgTceJQHc5
 EsLCTZo3aYvLMz0A5ndhXHUWlOd6qBE_n0vPuca24vZqV3H.XK6eq5yWOgUU6p3yo5ZbkXsY.GXS
 qR1Cc_y5viWfgIgD1RAPWwJT4ljtIKhlXiJCB3A--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic311.consmr.mail.ne1.yahoo.com with HTTP; Wed, 22 Jan 2020 19:50:15 +0000
Date: Wed, 22 Jan 2020 19:50:13 +0000 (UTC)
From: tosher 1 <akm2tosher@yahoo.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Message-ID: <409698033.2707956.1579722613556@mail.yahoo.com>
In-Reply-To: <20200122190133.GS2507@mail-itl>
References: <1284035258.1445298.1579543677315.ref@mail.yahoo.com>
 <1284035258.1445298.1579543677315@mail.yahoo.com>
 <20200122012713.GB2995@mail-itl>
 <1699773700.2581218.1579712175340@mail.yahoo.com>
 <20200122190133.GS2507@mail-itl>
MIME-Version: 1.0
X-Mailer: WebService/1.1.15077 YMailNorrin Mozilla/5.0 (X11; Ubuntu;
 Linux x86_64; rv:72.0) Gecko/20100101 Firefox/72.0
Subject: Re: [Xen-devel] HVM Driver Domain
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cj4gSSBkb24ndCBzZWUgd2hhdCBpcyB3cm9uZyBoZXJlLiBBcmUgeW91IHN1cmUgdGhlIGJhY2tl
bmQgZG9tYWluIGlzIHJ1bm5pbmc/CklmIHlvdSBtZWFuIHRoZSBIVk0gbmV0d29yayBkcml2ZXIg
ZG9tYWluIHRoZW4sIFllcywgSSBhbSBydW5uaW5nIHRoZSBiYWNrZW5kIGRvbWFpbi4KCj4gUHJv
YmFibHkgaXJyZWxldmFudCBhdCB0aGlzIHN0YWdlLCBidXQgZG8geW91IGhhdmUgInhlbmRyaXZl
cmRvbWFpbiIgc2VydmljZSBydW5uaW5nIGluIHRoZSBiYWNrZW5kPwpJIGRvIG5vdCBoYXZlIHRo
aXMgc2VydmljZSBydW5uaW5nLiBIb3dldmVyLCBteSBQViBuZXR3b3JrIGRyaXZlciBkb21haW4g
d29ya3MgZmluZSwgdGhvdWdoIHRoaXMgc2VydmljZSBpcyBub3QgcnVubmluZy4KCldoYXQgdmVy
c2lvbiBvZiBYZW4gYXJlIHlvdSB1c2luZyB0aGF0IGhhdmUgeGVuZHJpdmVyZG9tYWluIHNlcnZp
Y2U/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
