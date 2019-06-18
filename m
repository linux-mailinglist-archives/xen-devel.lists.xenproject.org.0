Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8634A137
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 14:56:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdDd4-0002ff-Hd; Tue, 18 Jun 2019 12:54:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NhYq=UR=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hdDd2-0002fa-Pv
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 12:54:24 +0000
X-Inumbo-ID: 320b65d8-91c8-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 320b65d8-91c8-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 12:54:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C12FD2B;
 Tue, 18 Jun 2019 05:54:22 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC4463F246;
 Tue, 18 Jun 2019 05:54:21 -0700 (PDT)
To: Andrii Anisov <Andrii_Anisov@epam.com>
References: <287117b9-952c-1a92-26e0-9597df936c27@gmail.com>
 <cd936ab7-df65-1615-a03a-bea30b5814f9@arm.com>
 <f3596bd5-ede3-7299-e28f-033ad32e6c99@gmail.com>
 <62194faf-0bf8-61b8-a69f-e41934fb5a43@arm.com>
 <0c900a15-14ab-9947-bffe-2fbeed176486@gmail.com>
 <CALC81-vaVKgZoi27MauGTxjda8mchy5GRLipu5z=v1vh9fyvAg@mail.gmail.com>
 <747dd124-3511-f010-dac7-b9b23d7b44ad@gmail.com>
 <CALC81-tewzAtaaH94U1nVc-UiacR_YvqhaYcPXtXcviTFHAG8A@mail.gmail.com>
 <ecb2cf41-51e5-2ff2-5e61-72be64399e40@arm.com>
 <AM6PR0302MB32215CD7FAED139C682D92A386EA0@AM6PR0302MB3221.eurprd03.prod.outlook.com>
 <ef82a028-9e4e-9976-d205-42cbc4bfc8ac@arm.com>
 <AM6PR0302MB3221D649900B54C2FFA7003A86EA0@AM6PR0302MB3221.eurprd03.prod.outlook.com>
 <AM6PR03MB49190A0828A49569B64611B4E6EA0@AM6PR03MB4919.eurprd03.prod.outlook.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <07a7084a-b798-0cc7-cca4-3fe58ea95835@arm.com>
Date: Tue, 18 Jun 2019 13:54:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <AM6PR03MB49190A0828A49569B64611B4E6EA0@AM6PR03MB4919.eurprd03.prod.outlook.com>
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
 Denis Obrezkov <denisobrezkov@gmail.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxOC8wNi8yMDE5IDEzOjI4LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+ICt4ZW4tZGV2ZWwK
ClBsZWFzZSBkb24ndCBjcm9zcy1wb3N0IGUtbWFpbC4gSWYgeW91IG1vdmUgdGhlIHRocmVhZCB0
byB4ZW4tZGV2ZWwsIHRoZW4gCnhlbi11c2VycyBzaG91bGQgYmUgZHJvcHBwZWQuCgo+IAo+IEhl
bGxvIEp1bGllbiwKPiAKPj4gSSBhbSBhIGJpdCBjb25mdXNlZC4gTGludXggaXMgYWJsZSB0byBi
cmluZy11cCBDUFUgaW4gaHlwIG1vZGUgd2l0aCB0aGUgY3VycmVudAo+PiBVLWJvb3QuIFdoeSB3
b3VsZCB3ZSBuZWVkIG1vcmUgY2hhbmdlcyBmb3IgWGVuPwo+IAo+IFRJJ3MgUk9NIGNvZGUgc3Rh
cnRzIGFsbCBDUFVzIGluIE5TIFBMMSwgZG9lc24ndCBtYXR0ZXIgaWYgaXQgaXMgYm9vdCBvciBz
ZWNvbmRhcnkgY29yZS4KPiBJZiB5b3UgbG9vayBhdCBMaW51eCBjb2RlIFsxXSwgeW91J2xsIHNl
ZSwgdGhhdCBhZnRlciB0aGUgc2Vjb25kYXJ5IGNvcmUgYnJpbmd1cCBMaW51eCBkb2VzIHN3aXRj
aCB0aGF0IGNvcmUgZnJvbSBOUyBQTDEgdG8gUEwyIChoeXAgbW9kZSkgdXNpbmcgUk9NIGNvZGUg
aW50ZXJmYWNlIChzbWMgMCkuCj4gQXQgc29tZSBtb21lbnQgWEVOIGRyb3BwZWQgYWxsIHRvLWh5
cC1tb2RlIHN3aXRjaGluZyBjb2RlLiBTbyBJIGRpZCBzd2l0Y2ggc2Vjb25kYXJpZXMgdG8gaHlw
IG1vZGUgaW4gdS1ib290IHdpdGggdGhlIGxvb3Agd2hpY2ggcmVwbGljYXRlcyB0aGUgUk9NIENv
ZGUgbG9naWMgaW4gdGVybXMgb2Ygd2FpdGluZyBmb3IgYW4gZXZlbnQgYW5kIGNoZWNraW5nIGF1
eCByZWdpc3RlcnMuCgpTd2l0Y2ggdG8gaHlwLW1vZGUgaXMgZmFpcmx5IGNvbXBsZXggYW5kIGRl
cGVuZHMgb24geW91ciBwcm9jZXNzb3IuIEhlbmNlIHdoeSBpdCAKd2FzIGRyb3BwZWQgaW4gYm90
aCBMaW51eCBhbmQgWGVuLgoKSG93ZXZlciwgY2FsbGluZyBhbiBTTUMgd291bGQgYmUgYWNjZXB0
YWJsZSB0byBtZS4gU3RlZmFubywgYW55IG9waW5pb24/Cgo+IAo+IFsxXSBodHRwczovL2VsaXhp
ci5ib290bGluLmNvbS9saW51eC92NS4xL3NvdXJjZS9hcmNoL2FybS9tYWNoLW9tYXAyL29tYXAt
aGVhZHNtcC5TI0w2MgoKWy4uLl0KCj4gCj4gQ09ORklERU5USUFMSVRZIENBVVRJT04gQU5EIERJ
U0NMQUlNRVIKPiBUaGlzIG1lc3NhZ2UgaXMgaW50ZW5kZWQgb25seSBmb3IgdGhlIHVzZSBvZiB0
aGUgaW5kaXZpZHVhbChzKSBvciBlbnRpdHkoaWVzKSB0byB3aGljaCBpdCBpcyBhZGRyZXNzZWQg
YW5kIGNvbnRhaW5zIGluZm9ybWF0aW9uIHRoYXQgaXMgbGVnYWxseSBwcml2aWxlZ2VkIGFuZCBj
b25maWRlbnRpYWwuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIG9yIHRo
ZSBwZXJzb24gcmVzcG9uc2libGUgZm9yIGRlbGl2ZXJpbmcgdGhlIG1lc3NhZ2UgdG8gdGhlIGlu
dGVuZGVkIHJlY2lwaWVudCwgeW91IGFyZSBoZXJlYnkgbm90aWZpZWQgdGhhdCBhbnkgZGlzc2Vt
aW5hdGlvbiwgZGlzdHJpYnV0aW9uIG9yIGNvcHlpbmcgb2YgdGhpcyBjb21tdW5pY2F0aW9uIGlz
IHN0cmljdGx5IHByb2hpYml0ZWQuIEFsbCB1bmludGVuZGVkIHJlY2lwaWVudHMgYXJlIG9ibGln
ZWQgdG8gZGVsZXRlIHRoaXMgbWVzc2FnZSBhbmQgZGVzdHJveSBhbnkgcHJpbnRlZCBjb3BpZXMu
CgpQbGVhc2UgY29uZmlndXJlIHlvdXIgZS1tYWlsIGNsaWVudCB0byBkcm9wIHRoZSBmb290ZXIu
CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
