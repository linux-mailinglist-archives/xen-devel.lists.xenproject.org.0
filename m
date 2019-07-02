Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C01465D137
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 16:10:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiJRX-0004je-Ou; Tue, 02 Jul 2019 14:07:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=p1wD=U7=intel.com=chen.zhang@srs-us1.protection.inumbo.net>)
 id 1hiJRW-0004jY-7i
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 14:07:34 +0000
X-Inumbo-ID: bbe80b7b-9cd2-11e9-8980-bc764e045a96
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bbe80b7b-9cd2-11e9-8980-bc764e045a96;
 Tue, 02 Jul 2019 14:07:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jul 2019 07:07:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,443,1557212400"; d="scan'208";a="315251716"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga004.jf.intel.com with ESMTP; 02 Jul 2019 07:07:31 -0700
Received: from fmsmsx114.amr.corp.intel.com (10.18.116.8) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 2 Jul 2019 07:07:31 -0700
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
 FMSMSX114.amr.corp.intel.com (10.18.116.8) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 2 Jul 2019 07:07:30 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.3]) by
 SHSMSX152.ccr.corp.intel.com ([169.254.6.22]) with mapi id 14.03.0439.000;
 Tue, 2 Jul 2019 22:07:28 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Thread-Topic: [Xen-devel] [PATCH] tools/libxl: Add iothread support for COLO
Thread-Index: AQHVH2ftNWbTjPTRrUqcQu5k5egqwqa21EEAgACmMGA=
Date: Tue, 2 Jul 2019 14:07:27 +0000
Message-ID: <9CFF81C0F6B98A43A459C9EDAD400D78061B32DB@shsmsx102.ccr.corp.intel.com>
References: <20190610083336.18235-1-chen.zhang@intel.com>
 <20190702115214.GA22182@perard.uk.xensource.com>
In-Reply-To: <20190702115214.GA22182@perard.uk.xensource.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMzVjNTk3OTQtMDc5Yy00ZTBhLWE0ZTMtMzQzN2Y1MzlhMDhjIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiZXVOUm5vZUo3ODVWaHRuQ2hNbEJrYjlURTV2YXAwZW5ENkNwUHoxQTJ2VU9YZHRYY2pwQjFoZTE5WVJWUGhyNCJ9
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] tools/libxl: Add iothread support for COLO
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Zhang Chen <zhangckid@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogQW50aG9ueSBQRVJBUkQgW21h
aWx0bzphbnRob255LnBlcmFyZEBjaXRyaXguY29tXQo+IFNlbnQ6IFR1ZXNkYXksIEp1bHkgMiwg
MjAxOSA3OjUyIFBNCj4gVG86IFpoYW5nLCBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4KPiBD
YzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4
ZW4ub3JnPjsgeGVuLQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBaaGFuZyBDaGVuIDx6
aGFuZ2NraWRAZ21haWwuY29tPgo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0hdIHRv
b2xzL2xpYnhsOiBBZGQgaW90aHJlYWQgc3VwcG9ydCBmb3IgQ09MTwo+IAo+IEhpLAo+IAo+IFRo
YW5rcyBmb3IgdGhlIHBhdGNoLCBJJ3ZlIGdvdCBwbGVudHkgb2YgcXVlc3Rpb24uCgpPS34gVmVy
eSBoYXBweSB0byBkaXNjdXNzIGFib3V0IHRoYXQuCgo+IAo+IE9uIE1vbiwgSnVuIDEwLCAyMDE5
IGF0IDA0OjMzOjM2UE0gKzA4MDAsIFpoYW5nIENoZW4gd3JvdGU6Cj4gPiBGcm9tOiBaaGFuZyBD
aGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4KPiA+Cj4gPiBYZW4gQ09MTyBhbmQgS1ZNIENPTE8g
c2hhcmVkIGxvdHMgb2YgY29kZSBpbiBRZW11Lgo+ID4gS1ZNIENPTE8gaGFzIGFkZGVkIHRoZSBp
b3RocmVhZCBzdXBwb3J0LCBzbyB3ZSBhZGQgaXQgb24gWGVuLgo+ID4KPiA+IERldGFpbDoKPiA+
IGh0dHBzOi8vd2lraS5xZW11Lm9yZy9GZWF0dXJlcy9DT0xPCj4gPgo+ID4gU2lnbmVkLW9mZi1i
eTogWmhhbmcgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+Cj4gPiAtLS0KPiA+ICB0b29scy9s
aWJ4bC9saWJ4bF9kbS5jICAgICAgfCAxNCArKysrKysrKysrKy0tLQo+ID4gIHRvb2xzL2xpYnhs
L2xpYnhsX3R5cGVzLmlkbCB8ICAyICsrCj4gPiAgdG9vbHMveGwveGxfcGFyc2UuYyAgICAgICAg
IHwgIDQgKysrKwo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfZG0uYyBiL3Rv
b2xzL2xpYnhsL2xpYnhsX2RtLmMgaW5kZXgKPiA+IGY0ZmM5NjQxNWQuLjZiYjQwMGVmZGYgMTAw
NjQ0Cj4gPiAtLS0gYS90b29scy9saWJ4bC9saWJ4bF9kbS5jCj4gPiArKysgYi90b29scy9saWJ4
bC9saWJ4bF9kbS5jCj4gPiBAQCAtMTYyOSwxNyArMTYyOSwyNSBAQCBzdGF0aWMgaW50Cj4gbGli
eGxfX2J1aWxkX2RldmljZV9tb2RlbF9hcmdzX25ldyhsaWJ4bF9fZ2MgKmdjLAo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBuaWNzW2ldLmNvbG9fZmlsdGVyX3JlZGly
ZWN0b3IxX3F1ZXVlLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBu
aWNzW2ldLmNvbG9fZmlsdGVyX3JlZGlyZWN0b3IxX291dGRldikpOwo+ID4gICAgICAgICAgICAg
ICAgICAgICAgfQo+ID4gKyAgICAgICAgICAgICAgICAgICAgaWYgKG5pY3NbaV0uY29sb19pb3Ro
cmVhZCkgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIGZsZXhhcnJheV9hcHBlbmQoZG1f
YXJncywgIi1vYmplY3QiKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICBmbGV4YXJyYXlf
YXBwZW5kKGRtX2FyZ3MsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgR0NTUFJJTlRG
KCJpb3RocmVhZCxpZD0lcyIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIG5pY3NbaV0uY29sb19pb3RocmVhZCkpOwo+IAo+IFRoaXMgY3JlYXRlcyBhbiBpb3RocmVh
ZCBvYmplY3QsIGJ1dCBpdCBpc24ndCB1c2VkIGFueXdoZXJlLiBXaGF0IHRoZSBwdXJwb3NlIG9m
Cj4gaXQ/CgpObywgY29sbyBjb21wYXJlIHVzZSB0aGUgaW90aHJlYWQgYnkgdGhlICJjb2xvX2Nv
bXBhcmVfaW90aHJlYWQiLgoKPiBBbHNvLCBpb3RocmVhZHMgaGF2ZSBvcHRpb25zIGxpa2UgInBv
bGwtZ3JvdyIsIEkgZG9uJ3Qga25vdyBpZiB5b3Ugd2FudCB0byBoYXZlCj4gdGhhdCBjb25maWd1
cmFibGUgb3IganVzdCBrZWVwIHRoZSBkZWZhdWx0IHZhbHVlcywganVzdCBzb21ldGhpbmcgdG8g
a2VlcCBpbgo+IG1pbmQuCgpLZWVwIGRlZmF1bHQuCgo+IAo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgfQo+ID4gICAgICAgICAgICAgICAgICAgICAgaWYgKG5pY3NbaV0uY29sb19jb21wYXJlX3By
aV9pbiAmJgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgIG5pY3NbaV0uY29sb19jb21wYXJl
X3NlY19pbiAmJgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgIG5pY3NbaV0uY29sb19jb21w
YXJlX291dCAmJgo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgIG5pY3NbaV0uY29sb19jb21w
YXJlX25vdGlmeV9kZXYpIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICBuaWNzW2ldLmNv
bG9fY29tcGFyZV9ub3RpZnlfZGV2ICYmCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgbmlj
c1tpXS5jb2xvX2NvbXBhcmVfaW90aHJlYWQpIHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICBmbGV4YXJyYXlfYXBwZW5kKGRtX2FyZ3MsICItb2JqZWN0Iik7Cj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgZmxleGFycmF5X2FwcGVuZChkbV9hcmdzLAo+ID4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgIEdDU1BSSU5URigiY29sby0KPiBjb21wYXJlLGlkPWMxLHByaW1hcnlfaW49
JXMsc2Vjb25kYXJ5X2luPSVzLG91dGRldj0lcyxub3RpZnlfZGV2PSVzIiwKPiA+ICsKPiA+ICsg
R0NTUFJJTlRGKCJjb2xvLWNvbXBhcmUsaWQ9YzEscHJpbWFyeV9pbj0lcyxzZWNvbmRhcnlfaW49
JXMsb3V0ZGV2PSUKPiA+ICsgcyxub3RpZnlfZGV2PSVzLGlvdGhyZWFkPSVzIiwKPiAKPiBTbywg
bm93IGlvdGhyZWFkIGFyZSBtYW5kYXRvcnk/IEl0IHdvdWxkIGFsc28gbWVhbiB0aGF0IGxpYnhs
IGNhbm4ndCB1c2UKPiBRRU1VIG9sZGVyIHRoYXQgMi4xMSwgSSB0aGluay4KPiBDYW4ndCBRRU1V
IGNyZWF0ZXMgYW4gaW90aHJlYWQgYXV0b21hdGljYWxseSBpZiBub25lIGFyZSBwcm92aWRlZD8K
CkluIGN1cnJlbnQgQ09MTyBkZXNpZ24sIGlvdGhyZWFkIGFyZSBtYW5kYXRvcnksIGl0J3MgZnJv
bSBRZW11IG1haW50YWluZXIncyBjb21tZW50cyB0byBtYWtlCkNvbG8tY29tcGFyZSB0aHJlYWQg
aW5kZXBlbmRlbnQgd2l0aCBRZW11IG1haW4gbG9vcCBmb3IgYmV0dGVyIHBlcmZvcm1hbmNlLgpJ
IHRoaW5rIGxpYnhsIGNhbiB1c2UgdXBzdHJlYW0gUWVtdSB0byBydW4gQ09MTy4KUWVtdSBjYW4n
dCBjcmVhdGVzIGlvdGhyZWFkIGF1dG9tYXRpY2FsbHksIGJlY2F1c2UgaXQgbmVlZHMgdXNlciBp
bnB1dCBJRCBmb3IgaW90aHJlYWQsIHRoZW4gaXQgd2lsbCBiZSB1c2VkIHRvIG90aGVyIHFlbXUg
bW9kdWxlKG5lZWQgdGhlIElEKS4KCj4gCj4gQWxzbywgaXQgbG9va3MgbGlrZSB0aGF0IGlmIG9u
ZSBvZiB0aGUgY29sby1jb21wYXJlIG9wdGlvbiBpcyBtaXNzaW5nLCB0aGUgY29sby0KPiBjb21w
YXJlIG9iamVjdCBpc24ndCBjcmVhdGVkIGF0IGFsbCB3aXRoIG5vIHdhcm5pbmcgZm9yIHRoZSB1
c2VycyBvZiBsaWJ4bC4KPiAKPiBXaGF0J3MgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiBgY29sb19p
b3RocmVhZCcgYW5kIGBjb2xvX2NvbXBhcmVfaW90aHJlYWQnID8KPiAKCiJDb2xvX2lvdGhyZWFk
IiBpcyBpb3RocmVhZCBJRCwgImNvbG9fY29tcGFyZV9pb3RocmVhZCIgaXMgY29sbyBjb21wYXJl
IHVzZWQgaW90aHJlYWQncyBJRC4KSW4gY3VycmVudCBDT0xPIGNhc2UsIHR3byBJRCBtdXN0IHNh
bWUuCkJ1dCBmb3IgZnV0dXJlIG9yIG90aGVyIGNhc2UsIGl0IGNhbiBkaWZmZXJlbnQobWF5YmUg
UlgvVFggdXNlIHR3byBpb3RocmVhZCBpbiBmdXR1cmUpLiAKCj4gSWYgYSB1c2VyIG9ubHkgYXMg
dGhlIGNob2ljZSBvZiBhIGlvdGhyZWFkIGlkLCB3aHkgbm90IGhhdmUgbGlieGwgY3JlYXRlIG9u
ZSBvbiBpdHMKPiBvd24gaW5zdGVhZD8KCkJlY2F1c2UgdXNlciBhbHNvIG5lZWQgaW5wdXQgdGhl
IGlvdGhyZWFkIElEIHRvIGNvbG8tY29tcGFyZSBtb2R1bGUuClNvIHdlIGludGVncmF0ZWQgdGhl
IGpvYiBoZXJlLgoKVGhhbmtzClpoYW5nIENoZW4KCj4gCj4gVGhhbmtzLAo+IAo+IC0tCj4gQW50
aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
