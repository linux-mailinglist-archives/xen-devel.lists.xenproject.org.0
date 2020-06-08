Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B3B1F1828
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 13:49:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiGH1-0003mu-00; Mon, 08 Jun 2020 11:49:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=11Lh=7V=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jiGH0-0003mo-Cy
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 11:49:02 +0000
X-Inumbo-ID: 0b59c526-a97e-11ea-b267-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b59c526-a97e-11ea-b267-12813bfff9fa;
 Mon, 08 Jun 2020 11:49:01 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: jx8S19pF7gU8RSm153OO0r/y3tfvB6qlydoqpiSNfHBxxKkgIH5Ff1alKlnvKqAYj4JASJUqI8
 095jNkh/T8xk5FGgwhRy8Xbag6lx3moPBQO9twauYo1Vcd9Ti6ZH3zWv+sQ6TyA5ck1w4C6hgk
 W03OesQT+CBzdBCjhYWTracFMP0EIbncUzVm6YAg2pBHfAhMKVaj1eW1wPdWFfkTU8jPSADfS1
 1IhI9CbB80lL2cTn9O29Hlu7U90kqgNz59Du4Nt+MQHtkGRHNUDPj4hLKjbxKAMfCFbIuVcAiZ
 y5g=
X-SBRS: 2.7
X-MesageID: 19464245
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,487,1583211600"; d="scan'208";a="19464245"
From: George Dunlap <George.Dunlap@citrix.com>
To: Ian Jackson <Ian.Jackson@citrix.com>
Subject: Re: [PATCH v2 1/5] libxl: Generate golang bindings in libxl Makefile
Thread-Topic: [PATCH v2 1/5] libxl: Generate golang bindings in libxl Makefile
Thread-Index: AQHWM6tS08XNp9FsPk2dfrAVrD4GiajIlOUAgAXuyACAAAkKgA==
Date: Mon, 8 Jun 2020 11:48:57 +0000
Message-ID: <498E613F-D801-497B-BA2C-2F9E52515D02@citrix.com>
References: <20200526221612.900922-1-george.dunlap@citrix.com>
 <20200526221612.900922-2-george.dunlap@citrix.com>
 <5CF4AE1D-C80C-4E4C-B4AA-0779E7DC53E7@citrix.com>
 <24286.7700.36742.982395@mariner.uk.xensource.com>
In-Reply-To: <24286.7700.36742.982395@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <9D09727B326FD44B923C260B1DEC64C1@citrix.com>
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
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gSnVuIDgsIDIwMjAsIGF0IDEyOjE2IFBNLCBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBHZW9yZ2UgRHVubGFwIHdyaXRlcyAoIlJlOiBb
UEFUQ0ggdjIgMS81XSBsaWJ4bDogR2VuZXJhdGUgZ29sYW5nIGJpbmRpbmdzIGluIGxpYnhsIE1h
a2VmaWxlIik6DQo+PiAQU28gYXMgd3JpdHRlbiB0aGlzIHR1cm5zIG91dCBub3QgdG8gd29yayBj
b3JyZWN0bHk6ICBgZ2VuZ290eXBlcy5weWAgc3BpdHMgb3V0IHN5bnRhY3RpY2FsbHkgdmFsaWQg
YnV0IHVuZm9ybWF0dGVkIEdvIGNvZGUsIGFuZCB0aGVuIHJ1bnMgYGdvIGZtdGAgb24gaXQgdG8g
Z2V0IHRoZSByaWdodCBzdHlsZSAoaW5jbHVkaW5nIHRhYnMsICZjKS4gIEJ1dCB0aGUgZXJyb3Ig
Y29kZSBvZiBgZ28gZm10YCBpc27igJl0IGNoZWNrZWQ7IHNvIG9uIGEgc3lzdGVtIHdpdGhvdXQg
Z28gaW5zdGFsbGVkLCBpZiB0aGUgYnVpbGQgc3lzdGVtIGRlY2lkZXMgaXQgbmVlZHMgdG8gcmUt
cnVuIGBnZW5nb3R5cGVzLnB5YCBmb3Igd2hhdGV2ZXIgcmVhc29uLCB0aGUgYnVpbGQgc3VjY2Vl
ZHMgYnV0IHRoZSB0cmVlIGVuZHMgdXAg4oCcZGlydGllZOKAnSB3aXRoIGFuIHVuZm9ybWF0dGVk
IHZlcnNpb24gZm8gdGhlIGdlbmVyYXRlZCB0ZXh0Lg0KPiANCj4gQW5kIGBnbyBmbXQnIG92ZXJ3
cml0ZXMgaXRzIGlucHV0IGZpbGUgPw0KDQpZZXMuDQoNCj4gVGhlIGxvc3QgZXJyb3IgaXMgZHVl
IHRvIHVzaW5nIGBvcy5zeXN0ZW0nIHdoaWNoIGRvZXMgbm90IHJhaXNlIGFuDQo+IGV4Y2VwdGlv
bi4gIFRoZSBweXRob24gMyBkb2NzIGZvciBgb3Muc3lzdGVtJyBzYXkNCj4gIHwgVGhlIHN1YnBy
b2Nlc3MgbW9kdWxlIHByb3ZpZGVzIG1vcmUgcG93ZXJmdWwgZmFjaWxpdGllcyBmb3INCj4gIHwg
c3Bhd25pbmcgbmV3IHByb2Nlc3NlcyBhbmQgcmV0cmlldmluZyB0aGVpciByZXN1bHRzOyB1c2lu
ZyB0aGF0DQo+ICB8IG1vZHVsZSBpcyBwcmVmZXJhYmxlIHRvIHVzaW5nIHRoaXMgZnVuY3Rpb24u
IFNlZSB0aGUgUmVwbGFjaW5nDQo+ICB8IE9sZGVyIEZ1bmN0aW9ucyB3aXRoIHRoZSBzdWJwcm9j
ZXNzIE1vZHVsZSBzZWN0aW9uIGluIHRoZQ0KPiAgfCBzdWJwcm9jZXNzIGRvY3VtZW50YXRpb24g
Zm9yIHNvbWUgaGVscGZ1bCByZWNpcGVzLg0KPiBBbmQgdGhlIHJlY2lwZSBzdWdnZXN0cw0KPiAg
fCBzdHMgPSBvcy5zeXN0ZW0oIm15Y21kIiArICIgbXlhcmciKQ0KPiAgfCAjIGJlY29tZXMNCj4g
IHwgc3RzID0gY2FsbCgibXljbWQiICsgIiBteWFyZyIsIHNoZWxsPVRydWUpDQo+ICB8IE5vdGVz
Og0KPiAgfCAqIENhbGxpbmcgdGhlIHByb2dyYW0gdGhyb3VnaCB0aGUgc2hlbGwgaXMgdXN1YWxs
eSBub3QgcmVxdWlyZWQuDQo+IA0KPiBUaGlzIGlzIG5vdCBwYXJ0aWN1bGFybHkgaGVscGZ1bCBh
ZHZpY2UgYmVjYXVzZSBzdWJwcm9jZXNzLmNhbGwsIGxpa2UNCj4gb3Muc3lzdGVtLCBkb2VzIG5v
dCByYWlzZSBhbiBleGNlcHRpb24gd2hlbiB0aGluZ3MgZ28gd3JvbmcuICBCdXQgaXQNCj4gZG9l
cyBoYXZlIGEgIm1vcmUgcmVhbGlzdGljIGV4YW1wbGUiIGltbWVkaWF0ZWx5IGFmdGVyd2FyZHMg
d2hpY2ggZG9lcw0KPiBhY3R1YWxseSBjaGVjayB0aGUgZXJyb3IgY29kZS4NCj4gDQo+IFlvdSB3
YW50ZWQgc3VicHJvY2Vzcy5jaGVja19jYWxsLiAgSURLIHdoaWNoIFB5dGhvbiB2ZXJzaW9ucyBo
YXZlDQo+IHN1YnByb2Nlc3MuY2hlY2tfY2FsbC4NCg0KU2luY2UgdGhlIGdvbGFuZyBjb2RlIGdl
bmVyYXRpb24gcmVjaXBlIGlzIG5vdyBjYWxsZWQgZnJvbSBsaWJ4bC9NYWtlZmlsZSB1bmNvbmRp
dGlvbmFsbHksIHRoZSBlZmZlY3Qgb2Yg4oCcZml4aW5n4oCdIHRoZSBgZ28gZm10YCBjYWxsIGlu
IGdlbmdvdHlwZXMucHkgdG8gZmFpbCBpZiBgZ28gZm10YCBpcyBub3QgYXZhaWxhYmxlIHdpbGwg
YmUgdG8gbWFrZSBnb2xhbmcgYSByZXF1aXJlZCBkZXBlbmRlbmN5IGZvciBidWlsZGluZyB0aGUg
dG9vbHMuICBJIHRoaW5rIGl04oCZcyByYXRoZXIgbGF0ZSBpbiB0aGUgZGF5IHRvIGJlIGRpc2N1
c3NpbmcgdGhhdCBmb3IgNC4xNC4NCg0KTmljayBoYXMgYWxyZWFkeSBzdWJtaXR0ZWQgYSBwYXRj
aCB3aGljaCBzaW1wbHkgcmVtb3ZlcyB0aGUgYGdvIGZtdGAgY2FsbCwgbGVhdmluZyB0aGUgZ2Vu
ZXJhdGVkIGNvZGUgbG9va2luZyB2ZXJ5IOKAnGdlbmVyYXRlZOKAnS4gIFRoYXQgd2lsbCBkbyBm
b3IgdGhpcyByZWxlYXNlLg0KDQogLUdlb3JnZQ==

