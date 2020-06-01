Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF14E1EA839
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 19:12:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfnyP-0005pg-9V; Mon, 01 Jun 2020 17:11:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9/Ow=7O=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jfnyN-0005pb-Ja
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 17:11:39 +0000
X-Inumbo-ID: f453026f-a42a-11ea-ab39-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f453026f-a42a-11ea-ab39-12813bfff9fa;
 Mon, 01 Jun 2020 17:11:38 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: jF0oiAQyTIrybsSM3EBmhIxPt6HS3disKI2bKJcE+rmei7ZmL/NyGWP+KfDwn2Ymnguhg+AFZV
 o9JAp1v7UFkFxmHFqIYhKKAAFMAy86vqi7k+ONt+bK2xc/Wp24KqDKrr0bDPPlE4LWY9nA3MEf
 6C3olsprDhF8oNfbaYvqSl42N8/EdsKh4jOAw9OuPIqiYcg520tSJIHnKpI0m2Lz+a0cfpWcfD
 qqpxrcSCrYqrCGWNqInDlCaYubasjIPZmx2BYLxICTTXhabF0I7cfhx9Aid14SK3yKu0T2hC1b
 bR4=
X-SBRS: 2.7
X-MesageID: 18941205
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,461,1583211600"; d="scan'208";a="18941205"
From: George Dunlap <George.Dunlap@citrix.com>
To: "paul@xen.org" <paul@xen.org>
Subject: Re: [PATCH v19 for-4.14 00/13] VM forking
Thread-Topic: [PATCH v19 for-4.14 00/13] VM forking
Thread-Index: AQHWOBefMhAMazhbj0Srm4nW5RbX56jDuyAAgAAij4A=
Date: Mon, 1 Jun 2020 17:11:33 +0000
Message-ID: <4017F2B3-BB9B-4E9F-813C-6FE68BA0D568@citrix.com>
References: <cover.1591017086.git.tamas.lengyel@intel.com>
 <000c01d63826$6d125900$47370b00$@xen.org>
In-Reply-To: <000c01d63826$6d125900$47370b00$@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <FE29D29E832B1549BD4C2CF919214A80@citrix.com>
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
Cc: Julien Grall <julien@xen.org>, Kevin Tian <kevin.tian@intel.com>, Stefano
 Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gSnVuIDEsIDIwMjAsIGF0IDQ6MDcgUE0sIFBhdWwgRHVycmFudCA8eGFkaW1nbmlr
QGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+
IEZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+
IE9uIEJlaGFsZiBPZiBUYW1hcyBLIExlbmd5ZWwNCj4+IFNlbnQ6IDAxIEp1bmUgMjAyMCAxNDoy
Mg0KPj4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPj4gQ2M6IEtldmluIFRp
YW4gPGtldmluLnRpYW5AaW50ZWwuY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPjsgVGFtYXMgSyBMZW5neWVsDQo+PiA8dGFtYXMubGVuZ3llbEBpbnRlbC5j
b20+OyBKdW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+OyBXZWkgTGl1IDx3bEB4
ZW4ub3JnPjsgQW5kcmV3IENvb3Blcg0KPj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBJ
YW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXANCj4+
IDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVu
Z3llbC5jb20+OyBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ow0KPj4gQW50aG9ueSBQ
RVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPjsgUm9nZXIgUGF1IE1vbm7DqQ0KPj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPj4g
U3ViamVjdDogW1BBVENIIHYxOSBmb3ItNC4xNCAwMC8xM10gVk0gZm9ya2luZw0KPiANCj4gSGks
DQo+IA0KPiAgVGhpcyBzZXJpZXMgbG9va3MgdG8gYmUgbGFyZ2VseSB1bi1hY2tlZCBzbywgc2lu
Y2Ugd2UgYXJlIG5vdyBwYXN0IHRoZSBmcmVlemUgZGF0ZSwgSSBkb24ndCByZWFsbHkgdGhpbmsg
aXQgY2FuIGdvIGludG8gNC4xNC4gSXMgdGhlcmUgYSBwYXJ0aWN1bGFyIHJlYXNvbiB0aGF0IHlv
dSB0aGluayBpdCBzaG91bGQgYmUgY29uc2lkZXJlZD8NCg0KVGFtYXPigJkgcHJvamVjdCBpdHNl
bGYgbWFpbmx5IHVzZXMgbGlieGMgYW5kIGJlbG93LCBhcyBJIHVuZGVyc3RhbmQ7IGFuZCBzbyBn
ZXR0aW5nIHBhdGNoZXMgMSBhbmQgMiBpbiB3b3VsZCBiZSBhbiBpbXBvcnRhbnQgbWlsZXN0b25l
OyBib3RoIGhhdmUgaGFkIFItYuKAmXMgYmVmb3JlIHRoZSBmZWF0dXJlIGZyZWV6ZS4gIEFyZ3Vh
Ymx5IHBhdGNoZXMgMSBhbmQgMiBhcmUgYSBidWcgZml4LiAgUGF0Y2ggMSBpcyBtaXNzaW5nIFZN
WCAob3IgYSBnZW5lcmFsIHg4NikuDQoNClRoZSBsaWJ4bC94bCBzaWRlIGhhc27igJl0LCBhcyBJ
IHVuZGVyc3RhbmQgaXQsIGhhZCBzaWduaWZpY2FudCByZXZpZXc7IEkgdGhpbmsgdGhhdCBzaG91
bGQgcHJvYmFibHkgd2FpdCB1bnRpbCA0LjE1Lg0KDQpXaGF0IGRvIHlvdSB0aGluaywgVGFtYXM/
DQoNCiAtR2Vvcmdl

