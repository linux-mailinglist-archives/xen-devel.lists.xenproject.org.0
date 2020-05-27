Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 396851E4969
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 18:10:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdybw-00040d-In; Wed, 27 May 2020 16:08:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=weHr=7J=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jdybu-00040Y-VL
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 16:08:54 +0000
X-Inumbo-ID: 5c3a9108-a034-11ea-9947-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c3a9108-a034-11ea-9947-bc764e2007e4;
 Wed, 27 May 2020 16:08:53 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ab1vbUrLt58hHPy86AVpIv4KbwTkL82ierfDBVPOjQhlKWj+usgWJnLuzlJimpA3Y7maq0moBI
 w9VozM3hH44pXHO5+Mjcl+C7u5Scn0AnLveJePrGwCgNABonoOzcpDJDq0CE5B9JesppDnoEBi
 dQq9dO2nHJZsAanrtfPy60wSCwOcKtmgnTh+4zWvRk8armB+BNTdF429mDk4g4eqn088tNjOku
 e66WS6Jr3MyWuW7q14pq9N6hQkP6LQa2pAyOI7p7Cx3n2xxAYAIRqUYhYdkhgWFDtIX4dkIU9S
 Gjs=
X-SBRS: 2.7
X-MesageID: 19312688
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,441,1583211600"; d="scan'208";a="19312688"
From: George Dunlap <George.Dunlap@citrix.com>
To: Ian Jackson <Ian.Jackson@citrix.com>
Subject: Re: Xen XSM/FLASK policy, grub defaults, etc.
Thread-Topic: Xen XSM/FLASK policy, grub defaults, etc.
Thread-Index: AQHWND0/xSJFUOR5YU28XikgbPuX46i7+DWA
Date: Wed, 27 May 2020 16:08:49 +0000
Message-ID: <0D83AAA6-A205-4256-8A38-CC8122AC063D@citrix.com>
References: <24270.35349.838484.116865@mariner.uk.xensource.com>
In-Reply-To: <24270.35349.838484.116865@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <13D5DAE7DC7BCB43AD94801A4BC9B354@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 "cjwatson@debian.org" <cjwatson@debian.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gTWF5IDI3LCAyMDIwLCBhdCA0OjQxIFBNLCBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBUaGUgWGVuIHRvb2xzIGJ1aWxkIHN5c3RlbSBi
dWlsZHMgYSBGTEFTSyBwb2xpY3kgYnkgZGVmYXVsdC4gIEl0IGRvZXMNCj4gdGhpcyBldmVuIGlm
IHRoZSBoeXBlcnZpc29yIGJ1aWxkIGZvciBYU00gaXMgZGlzYWJsZWQuDQo+IA0KPiBJIHJlY2Vu
dGx5IHNlbnQgcGF0Y2hlcyB1cHN0cmVhbSB0byBncnViIHRvIHN1cHBvcnQgWFNNIGluDQo+IHVw
ZGF0ZS1ncnViLiAgdXBkYXRlLWdydWIgaXMgdGhlIHByb2dyYW0gd2hpY2ggZXhhbWluZXMgeW91
ciAvYm9vdCBhbmQNCj4gZ2VuZXJhdGVzIGFwcHJvcHJpYXRlIGJvb3Rsb2FkZXIgZW50cmllcy4g
IE15IG1lcmdlIHJlcXVlc3QNCj4gIGh0dHBzOi8vc2Fsc2EuZGViaWFuLm9yZy9ncnViLXRlYW0v
Z3J1Yi8tL21lcmdlX3JlcXVlc3RzLzE4DQo+IGZpbmRzIFhTTSBwb2xpY3kgZmlsZXMsIGFuZCB3
aGVuIHRoZXlhIGFyZSBmb3VuZCwgZ2VuZXJhdGVzICJYU00NCj4gZW5hYmxlZCIgYm9vdGxvYWRl
ciBlbnRyaWVzLiBbMV0NCj4gDQo+IFRoZSByZXN1bHQgb2YgdGhlc2UgdHdvIHRoaW5ncyB0b2dl
dGhlciBpcyB0aGF0IGEgZGVmYXVsdCBidWlsZCBvZg0KPiBncnViIHdpbGwgcmVzdWx0IGluIHRo
ZXNlICJYU00gZW5hYmxlZCIgYm9vdGxvYWRlciBlbnRyaWVzLiAgSW4NCj4gcHJhY3RpY2UgSSB0
aGluayB0aGVzZSBlbnRyaWVzIHdpbGwgYm9vdCBiZWNhdXNlIGV2ZXJ5dGhpbmcgaWdub3Jlcw0K
PiB0aGUgYWRkaXRpb25hbCBYU00gcG9saWN5IGZpbGUgKCEpIGFuZCBYZW4gaWdub3JlcyB0aGUN
Cj4gImZsYXNrPWVuZm9yY2luZyIgb3B0aW9uICghISkNCj4gDQo+IFRoaXMgaXMgbm90IHBhcnRp
Y3VsYXJseSBnb29kLiAgT2ZmZXJpbmcgcGVvcGxlIGFuICJYU00gZW5hYmxlZCINCj4gb3B0aW9u
IHdoaWNoIGRvZXMgbm90aGluZyBpcyBwb29yIGJlY2F1c2UgaXQgbWlnaHQgdGhpbmsgdGhleSBo
YXZlIHRoZQ0KPiBleHRyYSBzZWN1cml0eSBidXQgYWN0dWFsbHkgc2lnbmlmaWNhbnRseSBtb3Jl
IHN0ZXBzIGFyZSBuZWVkZWQuICBCdXQNCj4gdGhlcmUgZG9lc24ndCBhcHBlYXIgdG8gYmUgYW55
IHdheSBmb3IgdXBkYXRlLWdydWIgdG8gdGVsbCB3aGV0aGVyIGENCj4gcGFydGljdWxhciBoeXBl
cnZpc29yIGRvZXMgc3VwcG9ydCBYU00gb3Igbm90Lg0KPiANCj4gSSB0aGluayB0aGUgZm9sbG93
aW5nIGNoYW5nZXMgd291bGQgYmUgZ29vZDoNCj4gDQo+IDEuIFhlbiBzaG91bGQgcmVqZWN0ICJm
bGFzaz1lbmZvcmNpbmciIGlmIGl0IGlzIGJ1aWx0IHdpdGhvdXQgRkxBU0sNCj4gc3VwcG9ydCwg
cmF0aGVyIHRoYW4gaWdub3JpbmcgaXQuICBUaGlzIHdpbGwgZW5zdXJlIHVzZXJzIGFyZSBub3QN
Cj4gbWlzbGVkIGJ5IHRoZXNlIGJvb3Qgb3B0aW9ucyBzaW5jZSB0aGV5IHdpbGwgYmUgYnJva2Vu
Lg0KDQorMQ0KDQo+IDIuIFhlbiBzaG91bGQgZGlzYWJsZSB0aGUgWFNNIHBvbGljeSBidWlsZCB3
aGVuIEZMQVNLIGlzIGRpc2FibGVkLg0KPiBUaGlzIGlzIHVuZm9ydHVuYXRlbHkgbm90IHNvIHNp
bXBsZSBiZWNhdXNlIHRoZSBYU00gcG9saWN5IGJ1aWxkIGlzIGENCj4gdG9vbHMgb3B0aW9uIGFu
ZCBGTEFTSyBpcyBhIFhlbiBvcHRpb24gYW5kIHRoZSBjb25maWd1cmF0aW9uIHN5c3RlbXMNCj4g
YXJlIGRpc2pvaW50LiAgQnV0IGF0IHRoZSB2ZXJ5IGxlYXN0IGEgZGVmYXVsdCBidWlsZCwgd2hp
Y2ggaGFzIG5vIFhTTQ0KPiBzdXBwb3J0LCBzaG91bGQgbm90IGJ1aWxkIGFuIFhTTSBwb2xpY3kg
ZmlsZSBlaXRoZXIuDQoNCkEgc2ltcGxlIHRoaW5nIHRvIGRvIGhlcmUgd291bGQgYmUgdG8gaGF2
ZSB0aGUgZmxhc2sgcG9saWN5IGNvbnRyb2xsZWQgYnkgYSBjb25maWd1cmUgLS1mbGFzayBvcHRp
b24uICBJZiBuZWl0aGVyIC0tZmxhc2sgbm9yIC0tbm8tZmxhc2sgaXMgc3BlY2lmaWVkLCB3ZSBj
b3VsZCBtYXliZSBoYXZlIGNvbmZpZ3VyZSBhbHNvIGNoZWNrIHRoZSBjb250ZW50cyBvZiB4ZW4v
LmNvbmZpZyB0byBzZWUgaWYgQ09ORklHX1hTTV9GTEFTSyBpcyBlbmFibGVkPw0KDQo+IDMuIEZh
aWxpbmcgdGhhdCwgWGVuIHNob3VsZCBwcm92aWRlIHNvbWUgb3RoZXIgbWVjaGFuaXNtIHdoaWNo
IHdvdWxkDQo+IGVuYWJsZSBzb21ldGhpbmcgbGlrZSB1cGRhdGUtZ3J1YiB0byBkZXRlcm1pbmUg
d2hldGhlciBhIHBhcnRpY3VsYXINCj4gaHlwZXJ2aXNvciBjYW4gc2Vuc2libHkgYmUgcnVuIHdp
dGggYSBwb2xpY3kgZmlsZSBhbmQgZmxhc2s9ZW5mb3JjaW5nLg0KDQpTbyB5b3Ugd2FudCB1cGRh
dGUtZ3J1YiB0byBjaGVjayB3aGV0aGVyICp0aGUgWGVuIGJpbmFyeSBpdOKAmXMgY3JlYXRpbmcg
ZW50cmllcyBmb3IqIGhhcyBGTEFTSyBlbmFibGVkLiAgV2UgZ2VuZXJhbGx5IGluY2x1ZGUgdGhl
IFhlbiBjb25maWcgdXNlZCB0byBidWlsZCB0aGUgaHlwZXJ2aXNvciDigJQgY291bGQgd2UgaGF2
ZSBpdCBjaGVjayBmb3IgQ09ORklHX1hTTV9GTEFTSz8NCg0KIC1HZW9yZ2U=

