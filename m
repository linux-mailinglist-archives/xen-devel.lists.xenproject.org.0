Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FCF1DE2BA
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 11:15:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc3l4-0003d5-Or; Fri, 22 May 2020 09:14:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2cgu=7E=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jc3l3-0003d0-Gx
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 09:14:25 +0000
X-Inumbo-ID: a0e3ffd2-9c0c-11ea-b9cf-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a0e3ffd2-9c0c-11ea-b9cf-bc764e2007e4;
 Fri, 22 May 2020 09:14:24 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: B/GeyZWhaZYHqv9pji0HFtvz7Fy7ScTqYq/dAdNyohsU0mRYTPPaSijBH70+rr9rrMeJkZp1tL
 OAeLOqxIhFQYTwpH8VqgnspeWYO++dXVWEQc3K6LwkRHa1MZfn3zmByFEpqepohs28a+kEpKR9
 MOMYncLz7gWTYfuZeqKmuvNo2rBuWV5NUFtfpT1CRQXriNrztInXtbWC4Mgpxmd6iRXXfSeQ8j
 tRNnKobBlJScs4QfIj06w8zTQNMWHmgtTVxBQ1cKI5uDtt6XXHHSfMJBgoy+AIuMTulLGBk9dc
 tVU=
X-SBRS: 2.7
X-MesageID: 18524478
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,421,1583211600"; d="scan'208";a="18524478"
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH] golang/xenlight: add an empty line after DO NOT EDIT
 comment
Thread-Topic: [PATCH] golang/xenlight: add an empty line after DO NOT EDIT
 comment
Thread-Index: AQHWL3/q51M6HvGdpEqSwwkQaxvEFqiygIWA
Date: Fri, 22 May 2020 09:14:20 +0000
Message-ID: <D90B93AD-977A-468E-840E-2E2354905968@citrix.com>
References: <49cc21c24b65ef5e1ce9810397c0fcd9d43f77f4.1590072675.git.rosbrookn@ainfosec.com>
In-Reply-To: <49cc21c24b65ef5e1ce9810397c0fcd9d43f77f4.1590072675.git.rosbrookn@ainfosec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <A82681681961B74C9EEB81D141E2E1EB@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q0PigJlpbmcgdGhlIHJlbGVhc2UgbWFuYWdlciwgc2luY2Ugd2XigJlyZSBwYXN0IHRoZSBsYXN0
IHBvc3RpbmcgZGF0ZQ0KDQo+IE9uIE1heSAyMSwgMjAyMCwgYXQgMzo1NSBQTSwgTmljayBSb3Ni
cm9vayA8cm9zYnJvb2tuQGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBXaGVuIGdlbmVyYXRpbmcg
ZG9jdW1lbnRhdGlvbiwgcGtnLmdvLmRldiBhbmQgZ29kb2Mub3JnIGFzc3VtZSBhIGNvbW1lbnQN
Cj4gdGhhdCBpbW1lZGlhdGVseSBwcmVjZWRlcyB0aGUgcGFja2FnZSBkZWNsYXJhdGlvbiBpcyBh
ICJwYWNrYWdlDQo+IGNvbW1lbnQiLCBhbmQgc2hvdWxkIGJlIHNob3duIGluIHRoZSBkb2N1bWVu
dGF0aW9uLiBBZGQgYW4gZW1wdHkgbGluZQ0KPiBhZnRlciB0aGUgRE8gTk9UIEVESVQgY29tbWVu
dCBpbiBnZW5lcmF0ZWQgZmlsZXMgdG8gcHJldmVudCB0aGVzZQ0KPiBjb21tZW50cyBmcm9tIGFw
cGVhcmluZyBhcyAicGFja2FnZSBjb21tZW50cy4iDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOaWNr
IFJvc2Jyb29rIDxyb3Nicm9va25AYWluZm9zZWMuY29tPg0KDQpSZXZpZXdlZC1ieTogR2Vvcmdl
IER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPg0KDQpQYXVsLCBJIHdvdWxkIGNsYXNz
aWZ5IHRoaXMgYXMgYSBidWcgZml4OiBJdCB3b27igJl0IGhhdmUgYW55IGZ1bmN0aW9uYWwgZWZm
ZWN0IG9uIHRoZSBjb2RlIGl0c2VsZiwgYnV0IGl0IGZpeGVzIGhvdyBpdOKAmXMgZGlzcGxheWVk
OyBlLmcuOg0KDQpodHRwczovL3BrZy5nby5kZXYveGVuYml0cy54ZW5wcm9qZWN0Lm9yZy9naXQt
aHR0cC94ZW4uZ2l0L3Rvb2xzL2dvbGFuZy94ZW5saWdodD90YWI9ZG9jDQoNCg0K

