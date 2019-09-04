Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC563A873C
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 20:18:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5Zp0-0005jG-LO; Wed, 04 Sep 2019 18:15:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DEGF=W7=ainfosec.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1i5Zoz-0005j4-Cb
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 18:15:57 +0000
X-Inumbo-ID: 09806b74-cf40-11e9-b299-bc764e2007e4
Received: from mail.ainfosec.com (unknown [209.217.208.252])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09806b74-cf40-11e9-b299-bc764e2007e4;
 Wed, 04 Sep 2019 18:15:55 +0000 (UTC)
Received: from AIS-Mustang.ainfosec.com (10.201.1.188) by AISEX01.ainfosec.com
 (10.201.1.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1779.2; Wed, 4 Sep
 2019 14:15:55 -0400
Received: from AIS-Mustang.ainfosec.com (10.201.1.188) by
 AIS-Mustang.ainfosec.com (10.201.1.188) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1779.2; Wed, 4 Sep 2019 14:15:54 -0400
Received: from AIS-Mustang.ainfosec.com ([fe80::dd05:4fde:e2b2:58fb]) by
 AIS-Mustang.ainfosec.com ([fe80::dd05:4fde:e2b2:58fb%3]) with mapi id
 15.01.1779.002; Wed, 4 Sep 2019 14:15:54 -0400
From: Nicholas Rosbrook <rosbrookn@ainfosec.com>
To: George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [RFC] Generating Go bindings for libxl
Thread-Index: AQHVR+YXn0M6Oya6KkWtfmVrm1e586bmgHl3gAHDewCAMlSpuYABnNsA///AfrE=
Date: Wed, 4 Sep 2019 18:15:54 +0000
Message-ID: <78464218107e41989b0e80f0fd4148d3@ainfosec.com>
References: <5c6f3ed7b2f444918feea4f4b7cec107@ainfosec.com>
 <c1c1663b-81ea-4704-e21e-c27a6d5999ba@citrix.com>
 <3da1f8bd6ee94d03b76d9f54e16de8a5@ainfosec.com>
 <da37ddde-0148-7e91-5dba-276df823d895@citrix.com>
 <bb81297d6d7441399425fd6079ac8bb7@ainfosec.com>
 <24acd142b70345038dc0dfdd61bb9520@ainfosec.com>
 <76c02038-fcce-2774-c4f5-73ab9e0fdeef@citrix.com>
 <102c4923aacb48b9b80795e65107451a@ainfosec.com>,
 <871a9191-f32b-383e-4f78-1a0a79737cd8@citrix.com>
In-Reply-To: <871a9191-f32b-383e-4f78-1a0a79737cd8@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.101.172]
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

PiBZZXMsIEkgdGhpbmsgdGhhdCdzIHJlYWxseSB0aGUgb25seSBvcHRpb24uwqAgUG9raW5nIGFy
b3VuZCwgaXQgbG9va3MKPiBsaWtlIGEgbG90IG9mIGRpZmZlcmVudCBwZW9wbGUgaGF2ZSByZWNv
bW1lbmRlZCBpdDsgYW5kIHRoZSBmYWN0IHRoYXQKPiBpdCdzIGluIHVzZSBieSBnUlBDIG1lYW5z
IGl0IGNhbid0IGJlIHRvbyB0ZXJyaWJsZSBhIHNvbHV0aW9uLgoKWWVhaCwgaGF2aW5nIHdvcmtl
ZCB3aXRoIGdlbmVyYXRlZCBnUlBDIGNvZGUgSSBkb24ndCB0aGluayBpdCdzIHRvbyBiYWQuCgo+
IFRoZSBpbnRlcmZhY2UgdHlwZSBpdHNlbGYgd2lsbCBuZWVkIHRvIGJlIGV4cG9ydGVkLCByaWdo
dD/CoCAoT2J2aW91c2x5Cj4gd2UgZG9uJ3Qgd2FudCB0byBleHBvcnQgdGhlIGRlZmluaW5nIG1l
dGhvZC4pCgpObyBhY3R1YWxseSwgYSBzdHJ1Y3QgZmllbGQgY2FuIGJlIGV4cG9ydGVkIHdpdGhv
dXQgaXRzIHR5cGUgYmVpbmcgZXhwb3J0ZWQuClRoZSBjb2RlIGdlbmVyYXRlZCBmb3IgZ1JQQyBk
b2VzIGV4YWN0bHkgdGhhdC4gSXQgbG9va3MgYSBsaXR0bGUgYml0IHdlaXJkLApidXQgaXQgbWFr
ZXMgc2Vuc2UgdG8gZG8gdGhhdCBpbiB0aGlzIHNjZW5hcmlvLgoKPiBTbyB5b3UndmUgbmFtZWQg
dGhlIHN0cnVjdCBhZnRlciB0aGUgbmFtZSBvZiB0aGUga2V5IChsaWJ4bF9kb21haW5fdHlwZSkK
PiBhbmQgdGhlIGtleSB2YWx1ZSAoaHZtKTsgYnV0IEkgZG9uJ3QgdGhpbmsgdGhhdCdzIHN1ZmZp
Y2llbnQuwqAgQWxyZWFkeQo+IHRoZXJlIGFyZSB0d28gZGlmZmVyZW50IHN0cnVjdHVyZXMgaW5k
ZXhlZCBieSBsaWJ4bF9jaGFubmVsX2Nvbm5lY3Rpb246CgpOb3RlZC4gSSBoYWRuJ3QgYWN0dWFs
bHkgdGhvdWdodCB0aHJvdWdoIHRoZSBzcGVjaWZpY3Mgb2YgbmFtaW5nIHlldC4KCj4gLi4uYW5k
IHRoZW4gSSdtIGFmcmFpZCB5b3UnZCBuZWVkIHRvIGhhdmUgJ0R0cycgKHNob3VsZCBiZSBleHBv
cnRlZCwKPiByaWdodD8pIGluc3RlYWQgYnkgdGhlIGVsZW1lbnQgc3BlY2lmaWVkIGJ5IHRoZSBJ
REw7IHNvICdVJyBpbiBhbGwgdGhlCj4gY3VycmVudCBjYXNlcy4KClllcywgdGhlIGZpZWxkIG5h
bWUgbmVlZHMgdG8gYmUgZXhwb3J0ZWQgdW5sZXNzIHdlIHdhbnRlZCB0byBwcm92aWRlCmdldHRl
cnMvc2V0dGVycy4KCj4gSSB0aGluayB0aGUgc2Vjb25kIG9uZSBsb29rcyBwcmV0dGllci7CoCAo
QWN0dWFsbHkgSSB0aGluayB1c2luZyAndScgYXMKPiB0aGUgZWxlbWVudCBuYW1lIGZvciB0aGUg
dW5pb24gd2FzIGtpbmQgb2YgYSBiYWQgaWRlYSBpbiB0aGUgZmlyc3QKPiBwbGFjZS4pwqAgQnV0
IHRoYXQgZG9lcyBtZWFuIHdlJ3JlICdvdmVycmlkaW5nJyB0aGUgaW5zdHJ1Y3Rpb25zIG9mIHRo
ZQo+IElETCAod2hpY2ggcHJlc2NyaWJlIGJvdGggdGhlIGtleSBlbGVtZW50IG5hbWUgYW5kIHRo
ZSB1bmlvbiBlbGVtZW50IG5hbWUpLgo+IAo+IFdoYXQgZG8geW91IHRoaW5rP8KgIElmIGxpa2Ug
bWUsIHlvdSBwcmVmZXIgdGhlIHNlY29uZCBvbmUsIEknbGwgdHJ5IHRvCj4gcGluZyBJYW4gSmFj
a3NvbiB0byBtYWtlIHN1cmUgaGUgZG9lc24ndCBoYXZlIGFueSBvYmplY3Rpb25zIHRvIGl0LgoK
SSBhZ3JlZSwgdGhlIHNlY29uZCBvbmUgbG9va3MgYmV0dGVyLCBleGNlcHQgd2Ugd29uJ3QgZXhw
b3J0IHRoZSBpbnRlcmZhY2UgdHlwZS4KCi1OUgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
