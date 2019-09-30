Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8678C25EE
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 20:11:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iF065-0007N9-N0; Mon, 30 Sep 2019 18:08:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pPIN=XZ=ainfosec.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iF064-0007N4-Hr
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 18:08:32 +0000
X-Inumbo-ID: 4f129ece-e3ad-11e9-96dc-12813bfff9fa
Received: from mail.ainfosec.com (unknown [209.217.208.252])
 by localhost (Halon) with ESMTPS
 id 4f129ece-e3ad-11e9-96dc-12813bfff9fa;
 Mon, 30 Sep 2019 18:08:30 +0000 (UTC)
Received: from AIS-Mustang.ainfosec.com (10.201.1.188) by AISEX01.ainfosec.com
 (10.201.1.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1779.2; Mon, 30
 Sep 2019 14:08:30 -0400
Received: from AIS-Mustang.ainfosec.com (10.201.1.188) by
 AIS-Mustang.ainfosec.com (10.201.1.188) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1779.2; Mon, 30 Sep 2019 14:08:29 -0400
Received: from AIS-Mustang.ainfosec.com ([fe80::dd05:4fde:e2b2:58fb]) by
 AIS-Mustang.ainfosec.com ([fe80::dd05:4fde:e2b2:58fb%3]) with mapi id
 15.01.1779.002; Mon, 30 Sep 2019 14:08:29 -0400
From: Nicholas Rosbrook <rosbrookn@ainfosec.com>
To: George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [RFC] Generating Go bindings for libxl
Thread-Index: AQHVcm+t88w4QsduYkKZ+RxDaG9uGadEm1SA///m8qw=
Date: Mon, 30 Sep 2019 18:08:29 +0000
Message-ID: <9b91e1ebe0f44ae4b76206b8c64efca8@ainfosec.com>
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
 <1be9800ff98f4cff82a72e747286f5f5@ainfosec.com>
 <4ebed087-27b6-c473-6bca-487e2bf85381@citrix.com>
 <6cc0d4210b2e42dabed4e7b8717cfa9e@ainfosec.com>,
 <90daad42-ebd3-94a6-996f-f5619f96deee@citrix.com>
In-Reply-To: <90daad42-ebd3-94a6-996f-f5619f96deee@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.201.1.80]
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

SGkgR2VvcmdlLAoKPiBKdXN0IGdvaW5nIHRocm91Z2ggaW4gZGV0YWlsLCBJIG5vdGljZSBvbmUg
dGhpbmcgYWJvdXQgeW91cgo+IGltcGxlbWVudGF0aW9uIG9mIERlZmJvb2w6IHlvdSBzaW1wbHkg
Y29weSBvdmVyIHRoZSB2YWx1ZSBvZgo+IGxpYnhsX2RlZmJvb2wuwqAgVGhlIGhlYWRlciBzYXlz
IG9mIGxpYnhsX2RlZmJvb2w6Cj4KPsKgICogVXNlcnMgc2hvdWxkIHRyZWF0IHRoaXMgc3RydWN0
IGFzIG9wYXF1ZSBhbmQgdXNlIHRoZSBmb2xsb3dpbmcKPsKgICogZGVmaW5lZCBtYWNyb3MgYW5k
IGFjY2Vzc29yIGZ1bmN0aW9ucy4KPgo+IFRoZSBtZWFuaW5nIG9mICd2YWwnIGlzIHVubGlrZWx5
IHRvIGNoYW5nZSwgYnV0IGluIHRoZW9yeSBpdCBjb3VsZC7CoCBTbwo+IEkgdGhpbmsgdGhlIGZy
b21DIG1ldGhvZCBzaG91bGQgZG8gc29tZXRoaW5nIGxpa2U6Cj4KPiBpZiAoIEMubGlieGxfZGVm
Ym9vbF9pc19kZWZhdWx0KGMpICkgewo+IMKgwqDCoCAvLyBTZXQgZC52YWwgdG8gJ2RlZmF1bHQn
Cj4gfSBlbHNlIGlmICggQy5saWJ4bF9kZWZib29sX3ZhbChjKSApIHsKPiDCoMKgwqAgLy8gU2V0
IGQudmFsIHRvICd0cnVlJwo+IH0gZWxzZSB7Cj4gwqDCoMKgIC8vIFNldCBkLnZhbCB0byAnZmFs
c2UnCj4gfQo+Cj4gQW5kIG9mIGNvdXJzZSwgRGVmYm9vbCB3aWxsIG5lZWQgc2ltaWxhciBtZXRo
b2RzIGZvciBleHRlcm5hbCBjYWxsZXJzLgoKT2theSB0aGF0IG1ha2VzIHNlbnNlLCB0aGFua3Mu
Cgo+IEJ1dCB3ZSdyZSBnb2luZyB0byBoYXZlIHRvIGZpbmQgYSBiZXR0ZXIgd2F5IHRvIHJldmll
dyB0aGUgY2hhbmdlcwo+IHlvdSdyZSBtYWtpbmcuwqAgV291bGQgaXQgYmUgdG9vIG11Y2ggdG8g
YXNrIHlvdSB0byBicmVhayB0aGUgc2VyaWVzIGRvd24KPiBpbnRvIGluZGl2aWR1YWwgY2h1bmtz
IHRoYXQgZWFjaCBtYWRlIG9uZSBsb2dpY2FsIGNoYW5nZSwgYW5kIHNlbmRpbmcKPiB0aGUgcmVz
dWx0cyB0byB0aGUgbGlzdD8KPgo+IFsuLi5dCj4KPiBXaGF0IGRvIHlvdSB0aGluaz8KCk5vIHBy
b2JsZW0sIEkgY2FuIGRvIHRoYXQuIEknbGwgc2VuZCB0aGUgcGF0Y2hlcyBhbG9uZyBzb29uLgoK
LU5SCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
