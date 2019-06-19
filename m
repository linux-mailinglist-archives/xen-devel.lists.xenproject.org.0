Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFF54BCE5
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 17:35:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdca5-0002vW-FS; Wed, 19 Jun 2019 15:33:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hb7b=US=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hdca3-0002vK-Sj
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 15:32:59 +0000
X-Inumbo-ID: 841213f3-92a7-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 841213f3-92a7-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 15:32:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5781E344;
 Wed, 19 Jun 2019 08:32:58 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 533463F246;
 Wed, 19 Jun 2019 08:32:57 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>,
 Denis Obrezkov <denisobrezkov@gmail.com>
References: <287117b9-952c-1a92-26e0-9597df936c27@gmail.com>
 <0c900a15-14ab-9947-bffe-2fbeed176486@gmail.com>
 <CALC81-vaVKgZoi27MauGTxjda8mchy5GRLipu5z=v1vh9fyvAg@mail.gmail.com>
 <747dd124-3511-f010-dac7-b9b23d7b44ad@gmail.com>
 <CALC81-tewzAtaaH94U1nVc-UiacR_YvqhaYcPXtXcviTFHAG8A@mail.gmail.com>
 <ecb2cf41-51e5-2ff2-5e61-72be64399e40@arm.com>
 <AM6PR0302MB32215CD7FAED139C682D92A386EA0@AM6PR0302MB3221.eurprd03.prod.outlook.com>
 <ef82a028-9e4e-9976-d205-42cbc4bfc8ac@arm.com>
 <AM6PR0302MB3221D649900B54C2FFA7003A86EA0@AM6PR0302MB3221.eurprd03.prod.outlook.com>
 <AM6PR03MB49190A0828A49569B64611B4E6EA0@AM6PR03MB4919.eurprd03.prod.outlook.com>
 <07a7084a-b798-0cc7-cca4-3fe58ea95835@arm.com>
 <666fc807-af6a-231c-9d7e-48ecabb07371@gmail.com>
 <2c0cced8-27ec-a3bb-b2bf-c037176a162a@arm.com>
 <4a2ae4d4-493a-d5f6-64da-1da313db3962@gmail.com>
 <CAGPpAzUpeFEmFX9FMkQDn+2gWnL1GmyEsL49DPLxWKBQ=_W0Eg@mail.gmail.com>
 <8f6fafd5-6cab-b57c-b68b-ceb0ec88cfb2@arm.com>
 <45406dbd-4aa1-8852-475e-1c37c93a7fa3@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <04e2ff99-1276-a99b-b86c-825cf8cea858@arm.com>
Date: Wed, 19 Jun 2019 16:32:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <45406dbd-4aa1-8852-475e-1c37c93a7fa3@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Starting to port xen on beagleboard-x15 (GSoC 2019
 project)
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
Cc: Hunyue Yau <hy-gsoc@hy-research.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Iain Hunter <drhunter95@gmail.com>, Andre Przywara <andre.przywara@arm.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxOS8wNi8yMDE5IDE2OjI3LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IAo+IAo+IE9u
IDE5LjA2LjE5IDE4OjA2LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IExhc3RseSwgcGxlYXNlIGNs
ZWFuLXVwIHRoZSBjb2RlIGFuZCBzZW5kIHRoZSBwYXRjaCBvbiB4ZW4tZGV2ZWwuIEkgd2lsbCBo
YXZlIAo+PiBhIGNsb3NlciBsb29rIGF0IHRoYXQgdGltZS4gRmVlbCBmcmVlIHRvIHBpbmcgbWUg
b24gSVJDIGlmIHlvdSBoYXZlIGFueSBkb3VidCAKPj4gaG93IHRvIHByb2NlZWQuCj4gCj4gQWJv
dXQgdGhlIGNvZGU6IEkgdGhpbmsgb21hcDVfaW5pdF9zZWNvbmRhcnkoKSBtdXN0IGJlIG1vdmVk
IHRvIHRoZSBwbGF0Zm9ybSAKPiBjb2RlIChvbWFwNS5jKS4KCldlbGwgb21hcDUuYyBpcyBDIGNv
ZGUuLi4gWW91IGNhbid0IGNhbGwgQyBpbiB0aGUgYm9vdCBwcm9jZXNzIGF0IGxlYXN0IHVudGls
IAp0aGUgTU1VIGlzIG9uIGFuZCB3ZSBmdWxseSBzZXR1cCB0aGUgcHJvY2Vzc29yLgoKUmVnYXJk
aW5nIHRoZSBwbGFjZW1lbnQgb2YgdGhlIGNvZGUsIEkgYW0gc3RpbGwgc3BsaXQgYmV0d2VlbiB0
d28gbWluZHMgKGVpdGhlciAKaGVhZC5TIG9yIGEgbmV3IHNwZWNpZmljIC5TIGZvciBvbWFwKS4g
SG93ZXZlciwgdGhpcyBjb3VsZCBiZSBkaXNjdXNzZWQgb25jZSB0aGUgCnBhdGNoIGlzIHN1Ym1p
dHRlZC4KCihCZWFyIGluIG1pbmQgdGhpcyBpcyBsaWtlbHkgdGhlIGZpcnN0IHRpbWUgRGVuaXMg
d29ya3Mgd2l0aCB0aGUgWGVuIGNvbW11bml0eSkuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
