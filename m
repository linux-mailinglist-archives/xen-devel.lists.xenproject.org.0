Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D87181EE8BE
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 18:41:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgsv8-0004o3-B2; Thu, 04 Jun 2020 16:40:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VA4X=7R=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jgsv7-0004ny-1w
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 16:40:45 +0000
X-Inumbo-ID: 224119b4-a682-11ea-aec5-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 224119b4-a682-11ea-aec5-12813bfff9fa;
 Thu, 04 Jun 2020 16:40:44 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: RaUK3moPoeydGah68lZURMNhv2cBJk0MzoqWx6HAWOF1NxjHAgyjvO2s9vS5nbyIkRwu5HnLun
 9TLfH3/yWl5s3iGXl12qEYXDzmcOD524fsIsoMiI6dKXjpVpNA+8W/q3hGQkVvCDe9gB+r6Tgg
 aCy5lhPbs6OzM/xdgsnG8eiThEnki8HV7IVOxbUSE/oAA+O0AaxqrRy9RmO8y4khbvNaBXL7wZ
 0h/9qthVh244kJlYJmEXDXFeQyamkebGS87WMNGPN8lMmGNUsmlc09kUXef28tDMvAWvUbYj4Z
 AoY=
X-SBRS: 2.7
X-MesageID: 19600144
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,472,1583211600"; d="scan'208";a="19600144"
From: George Dunlap <George.Dunlap@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/5] libxl: Generate golang bindings in libxl Makefile
Thread-Topic: [PATCH v2 1/5] libxl: Generate golang bindings in libxl Makefile
Thread-Index: AQHWM6tS08XNp9FsPk2dfrAVrD4GiajIlOUA
Date: Thu, 4 Jun 2020 16:40:40 +0000
Message-ID: <5CF4AE1D-C80C-4E4C-B4AA-0779E7DC53E7@citrix.com>
References: <20200526221612.900922-1-george.dunlap@citrix.com>
 <20200526221612.900922-2-george.dunlap@citrix.com>
In-Reply-To: <20200526221612.900922-2-george.dunlap@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <A6F612B9B0D70B45BAA3931D64495EFE@citrix.com>
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
 Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gTWF5IDI2LCAyMDIwLCBhdCAxMToxNiBQTSwgR2VvcmdlIER1bmxhcCA8Z2Vvcmdl
LmR1bmxhcEBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IFRoZSBnZW5lcmF0ZWQgZ29sYW5nIGJp
bmRpbmdzICh0eXBlcy5nZW4uZ28gYW5kIGhlbHBlcnMuZ2VuLmdvKSBhcmUNCj4gbGVmdCBjaGVj
a2VkIGluIHNvIHRoYXQgdGhleSBjYW4gYmUgZmV0Y2hlZCBmcm9tIHhlbmJpdHMgdXNpbmcgdGhl
DQo+IGdvbGFuZyB0b29saW5nLiAgVGhpcyBtZWFucyB0aGF0IHRoZXkgbXVzdCBiZSB1cGRhdGVk
IHdoZW5ldmVyDQo+IGxpYnhsX3R5cGVzLmlkbCAob3Igb3RoZXIgZGVwZW5kZW5jaWVzKSBhcmUg
dXBkYXRlZC4gIEhvd2V2ZXIsIHRoZQ0KPiBnb2xhbmcgYmluZGluZ3MgYXJlIG9ubHkgYnVpbHQg
b3B0aW9uYWxseTsgd2UgY2FuJ3QgYXNzdW1lIHRoYXQgYW55b25lDQo+IHVwZGF0aW5nIGxpYnhs
X3R5cGVzLmlkbCB3aWxsIGFsc28gZGVzY2VuZCBpbnRvIHRoZSB0b29scy9nb2xhbmcgdHJlZQ0K
PiB0byByZS1nZW5lcmF0ZSB0aGUgYmluZGluZ3MuDQo+IA0KPiBGaXggdGhpcyBieSByZS1nZW5l
cmF0aW5nIHRoZSBnb2xhbmcgYmluZGluZ3MgZnJvbSB0aGUgbGlieGwgTWFrZWZpbGUNCj4gd2hl
biB0aGUgSURMIGRlcGVuZGVuY2llcyBhcmUgdXBkYXRlZCwgc28gdGhhdCBhbnlvbmUgd2hvIHVw
ZGF0ZXMNCj4gbGlieGxfdHlwZXMuaWRsIHdpbGwgYWxzbyBlbmQgdXAgdXBkYXRpbmcgdGhlIGdv
bGFuZyBnZW5lcmF0ZWQgZmlsZXMNCj4gYXMgd2VsbC4NCj4gDQo+IC0gTWFrZSBhIHZhcmlhYmxl
IGZvciB0aGUgZ2VuZXJhdGVkIGZpbGVzLCBhbmQgYSB0YXJnZXQgaW4NCj4gICB4ZW5saWdodC9N
YWtlZmlsZSB3aGljaCB3aWxsIG9ubHkgcmUtZ2VuZXJhdGUgdGhlIGZpbGVzLg0KPiANCj4gLSBB
ZGQgYSB0YXJnZXQgaW4gbGlieGwvTWFrZWZpbGUgdG8gY2FsbCBleHRlcm5hbCBpZGwgZ2VuZXJh
dGlvbg0KPiAgIHRhcmdldHMgKGN1cnJlbnRseSBvbmx5IGdvbGFuZykuDQoNChBTbyBhcyB3cml0
dGVuIHRoaXMgdHVybnMgb3V0IG5vdCB0byB3b3JrIGNvcnJlY3RseTogIGBnZW5nb3R5cGVzLnB5
YCBzcGl0cyBvdXQgc3ludGFjdGljYWxseSB2YWxpZCBidXQgdW5mb3JtYXR0ZWQgR28gY29kZSwg
YW5kIHRoZW4gcnVucyBgZ28gZm10YCBvbiBpdCB0byBnZXQgdGhlIHJpZ2h0IHN0eWxlIChpbmNs
dWRpbmcgdGFicywgJmMpLiAgQnV0IHRoZSBlcnJvciBjb2RlIG9mIGBnbyBmbXRgIGlzbuKAmXQg
Y2hlY2tlZDsgc28gb24gYSBzeXN0ZW0gd2l0aG91dCBnbyBpbnN0YWxsZWQsIGlmIHRoZSBidWls
ZCBzeXN0ZW0gZGVjaWRlcyBpdCBuZWVkcyB0byByZS1ydW4gYGdlbmdvdHlwZXMucHlgIGZvciB3
aGF0ZXZlciByZWFzb24sIHRoZSBidWlsZCBzdWNjZWVkcyBidXQgdGhlIHRyZWUgZW5kcyB1cCDi
gJxkaXJ0aWVk4oCdIHdpdGggYW4gdW5mb3JtYXR0ZWQgdmVyc2lvbiBmbyB0aGUgZ2VuZXJhdGVk
IHRleHQuDQoNClRoZSBzaW1wbGVzdCBzaG9ydC10ZXJtIHdheSB0byBmaXggdGhpcyB3b3VsZCBi
ZSB0byByZW1vdmUgdGhlIGBnbyBmbXRgIGNhbGwgZnJvbSBgZ2VuZ290eXBlcy5weWAuICBJdOKA
mXMgYWN0dWFsbHkgcmVsYXRpdmVseSB1bnVzdWFsIGZvciBnZW5lcmF0ZWQgY29kZSB0byBsb29r
IHByZXR0eSAob3IgZXZlbiBiZSBsb29rZWQgYXQpLiAgV2UgY291bGQgYWxzbyBjb25zaWRlciBh
ZGRpbmcgaW4gc29tZSDigJxtYW51YWzigJ0gZm9ybWF0dGluZyBpbiBnZW5nb3R5cGVzLnB5LCBs
aWtlIGluZGVudGF0aW9uLCBzbyB0aGF0IGl0IGRvZXNu4oCZdCBsb29rIHRvbyB0ZXJyaWJsZS4N
Cg0KTmljaywgZG8geW91IGhhdmUgdGltZSB0byB3b3JrIG9uIGEgcGF0Y2ggbGlrZSB0aGF0Pw0K
DQogLUdlb3JnZQ==

