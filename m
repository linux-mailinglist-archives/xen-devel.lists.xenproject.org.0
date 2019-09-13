Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0C9B1FBC
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 15:31:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8lci-00068v-6A; Fri, 13 Sep 2019 13:28:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=H6/6=XI=ainfosec.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1i8lcg-00068q-Qf
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 13:28:26 +0000
X-Inumbo-ID: 5d6b745e-d62a-11e9-978d-bc764e2007e4
Received: from mail.ainfosec.com (unknown [209.217.208.252])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d6b745e-d62a-11e9-978d-bc764e2007e4;
 Fri, 13 Sep 2019 13:28:25 +0000 (UTC)
Received: from AIS-Mustang.ainfosec.com (10.201.1.188) by AISEX01.ainfosec.com
 (10.201.1.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1779.2; Fri, 13
 Sep 2019 09:28:25 -0400
Received: from AIS-Mustang.ainfosec.com (10.201.1.188) by
 AIS-Mustang.ainfosec.com (10.201.1.188) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1779.2; Fri, 13 Sep 2019 09:28:25 -0400
Received: from AIS-Mustang.ainfosec.com ([fe80::dd05:4fde:e2b2:58fb]) by
 AIS-Mustang.ainfosec.com ([fe80::dd05:4fde:e2b2:58fb%3]) with mapi id
 15.01.1779.002; Fri, 13 Sep 2019 09:28:24 -0400
From: Nicholas Rosbrook <rosbrookn@ainfosec.com>
To: George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [RFC] Generating Go bindings for libxl
Thread-Index: AQHVajceEnUGGip0+kuHgzUneitwDg==
Date: Fri, 13 Sep 2019 13:28:24 +0000
Message-ID: <c84d252d4085422baa4e01c90f80df53@ainfosec.com>
References: <5c6f3ed7b2f444918feea4f4b7cec107@ainfosec.com>
 <c1c1663b-81ea-4704-e21e-c27a6d5999ba@citrix.com>
 <3da1f8bd6ee94d03b76d9f54e16de8a5@ainfosec.com>
 <da37ddde-0148-7e91-5dba-276df823d895@citrix.com>
 <bb81297d6d7441399425fd6079ac8bb7@ainfosec.com>
 <24acd142b70345038dc0dfdd61bb9520@ainfosec.com>
 <76c02038-fcce-2774-c4f5-73ab9e0fdeef@citrix.com>
 <102c4923aacb48b9b80795e65107451a@ainfosec.com>
 <871a9191-f32b-383e-4f78-1a0a79737cd8@citrix.com>
 <dbeeb071-25ae-9652-4be1-e3067109179f@citrix.com>
 <6e12ee2ca2d846e38450bd40bf73dde4@ainfosec.com>
 <75c37260-3ff9-0731-ec0c-a1cb6a6acfea@citrix.com>
 <1be9800ff98f4cff82a72e747286f5f5@ainfosec.com>,
 <4ebed087-27b6-c473-6bca-487e2bf85381@citrix.com>
In-Reply-To: <4ebed087-27b6-c473-6bca-487e2bf85381@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.101.38]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [RFC] Generating Go bindings for libxl
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
Cc: "anthony.perard@citrix.com" <anthony.perard@citrix.com>,
 Brendan Kerrigan <kerriganb@ainfosec.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 Nicolas Belouin <nicolas.belouin@gandi.net>, "wl@xen.org" <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGV0lXIGNoZWNrZWQgd2l0aCBJYW4gYWZ0ZXIgSSB3cm90ZSB0aGlzIG1haWwsIGFuZCBoZSBj
b25maXJtZWQgdGhhdAo+IHRoYXQgZmllbGQgKGBsaW5rYCBpbiBgbGlieGxfZXZlbnRgKSB3YXMg
b25seSBtZWFudCB0byBiZSB1c2VkCj4gaW50ZXJuYWxseSwgYW5kIGlkZWFsbHkgd2Ugd291bGRu
J3QgZXZlbiBoYXZlIHRoYXQgYXZhaWxhYmxlIGluIHRoZSBHbwo+IHZlcnNpb24gb2YgdGhlIHN0
cnVjdCAoc2luY2UgaXQncyBub3QgYWN0dWFsbHkgcGFydCBvZiB0aGUgcHVibGljCj4gaW50ZXJm
YWNlKS4KPiAKPiBVbmZvcnR1bmF0ZWx5IHdlIGNhbid0IGFjdHVhbGx5IGdldCByaWQgb2YgdGhl
IGVsZW1lbnQgaXQgd2l0aG91dAo+IHNwZWNpYWwtY2FzaW5nIGl0ICh3aGljaCBJIGRvbid0IHRo
aW5rIGlzIGEgZ29vZCBpZGVhKSwgb3IgYWRkaW5nIGEgbmV3Cj4gIlBSSVZBVEUoKSIgYW5ub3Rh
dGlvbiB0byB0aGUgSURMIG9yIHNvbWV0aGluZyAod2hpY2ggd291bGQgYmUgbmljZSB0bwo+IGhh
dmUsIGJ1dCBub3Qgc29tZXRoaW5nIEkgZXhwZWN0IGFueW9uZSB0byBoYXZlIG11Y2ggdGltZSB0
byBkbykuwqAgRm9yCj4gbm93LCBJIHRoaW5rIGRlZmluaW5nIGl0IGFzIGFuIGVtcHR5IHN0cnVj
dCB3aWxsIGJlIGdvb2QgZW5vdWdoLgoKT2theSwgZ29vZCB0byBrbm93LiBJIHdpbGwgZG8gdGhl
IGVtcHR5IHN0cnVjdCBkZWZpbml0aW9uIGZvciBub3cuIEluIHRoZSBsb25nIHJ1biwKdGhlIGFk
ZGl0aW9uIHRvIHRoZSBJREwgd291bGQgcHJvYmFibHkgYmUgbmljZS4gTXkgZ3Vlc3MgaXMgdGhh
dCBvdmVyIHRpbWUgd2Ugd2lsbAppZGVudGlmeSBvdGhlciB0aGluZ3Mgd2UgZG9uJ3Qgd2FudCB0
byBleHBvc2UgdGhyb3VnaCB0aGUgR28gcGFja2FnZSBmb3Igb25lCnJlYXNvbiBvciBhbm90aGVy
LgoKLU5SCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
