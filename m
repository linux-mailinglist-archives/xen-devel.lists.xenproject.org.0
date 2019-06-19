Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF254BE52
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 18:34:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hddUl-00011T-8d; Wed, 19 Jun 2019 16:31:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hb7b=US=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hddUk-00011O-83
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 16:31:34 +0000
X-Inumbo-ID: b20c9a56-92af-11e9-81fe-0f11da2b70d6
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id b20c9a56-92af-11e9-81fe-0f11da2b70d6;
 Wed, 19 Jun 2019 16:31:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D031344;
 Wed, 19 Jun 2019 09:31:31 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 432FD3F246;
 Wed, 19 Jun 2019 09:31:30 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>,
 Denis Obrezkov <denisobrezkov@gmail.com>
References: <287117b9-952c-1a92-26e0-9597df936c27@gmail.com>
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
 <04e2ff99-1276-a99b-b86c-825cf8cea858@arm.com>
 <f19a481d-88ba-7880-2baa-20b2b98027aa@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <65f5fe30-dd1d-1c83-5a5f-82b19bec7ac8@arm.com>
Date: Wed, 19 Jun 2019 17:31:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <f19a481d-88ba-7880-2baa-20b2b98027aa@gmail.com>
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

CgpPbiAxOS8wNi8yMDE5IDE3OjEwLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IAo+IAo+IE9uIDE5
LjA2LjE5IDE4OjMyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IFJlZ2FyZGluZyB0aGUgcGxhY2Vt
ZW50IG9mIHRoZSBjb2RlLCBJIGFtIHN0aWxsIHNwbGl0IGJldHdlZW4gdHdvIG1pbmRzIAo+PiAo
ZWl0aGVyIGhlYWQuUyBvciBhIG5ldyBzcGVjaWZpYyAuUyBmb3Igb21hcCkuIEhvd2V2ZXIsIHRo
aXMgY291bGQgYmUgCj4+IGRpc2N1c3NlZCBvbmNlIHRoZSBwYXRjaCBpcyBzdWJtaXR0ZWQuCj4g
Cj4gSU1ITywgdGhhdCBpcyBhIHB1cmUgcGxhdGZvcm0gc3BlY2lmaWMgY29kZS4gRk1QT1YgaXQg
c2hvdWxkIGJlIGFuIGlubGluZSAKPiBhc3NlbWJseSBpbiBvbWFwNS5jLCBvciBvbWFwNS5TIHVu
ZGVyIHBsYXRmb3JtLgoKSSB3b3VsZCBiZSBoYXBweSB0byBjb25zaWRlciBvbWFwNS5jIGlmIHRo
ZXJlIGFyZSBhIG5pY2Ugd2F5IHRvIGRvIGl0LiBJIGNhbid0IApmaW5kIG9uZSBzbyBmYXIuIFBs
ZWFzZSBzdWdnZXN0Li4uCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
