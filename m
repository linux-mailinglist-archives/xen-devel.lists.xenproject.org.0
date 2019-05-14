Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5341C71A
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 12:38:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQUmg-00059F-40; Tue, 14 May 2019 10:35:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O8Y9=TO=citrix.com=prvs=0309661e3=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hQUme-000598-N7
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 10:35:44 +0000
X-Inumbo-ID: 040de014-7634-11e9-8319-3ff66805631c
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 040de014-7634-11e9-8319-3ff66805631c;
 Tue, 14 May 2019 10:35:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,468,1549929600"; d="scan'208";a="89714804"
Date: Tue, 14 May 2019 12:35:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190514103531.bk3zlivk6yjixn2q@Air-de-Roger>
References: <20190513165321.464fdeaf.olaf@aepfle.de>
 <20190513152005.jojtolhh5wdguvg6@Air-de-Roger>
 <20190513152812.GC3977@zion.uk.xensource.com>
 <20190514085518.g3wdf7h3tka25cb6@Air-de-Roger>
 <20190514092321.GW2798@zion.uk.xensource.com>
 <5CDA8FE7020000780022E759@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CDA8FE7020000780022E759@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] how to disable build of pv-shim?
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Olaf Hering <olaf@aepfle.de>,
 Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMDM6NTI6MzlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE0LjA1LjE5IGF0IDExOjIzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBUdWUsIE1heSAxNCwgMjAxOSBhdCAxMDo1NToxOEFNICswMjAwLCBSb2dlciBQ
YXUgTW9ubsOpIHdyb3RlOgo+ID4+IE9uIE1vbiwgTWF5IDEzLCAyMDE5IGF0IDA0OjI4OjEyUE0g
KzAxMDAsIFdlaSBMaXUgd3JvdGU6Cj4gPj4gPiBPbiBNb24sIE1heSAxMywgMjAxOSBhdCAwNToy
MDowNVBNICswMjAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4+ID4gPiBPbiBNb24sIE1h
eSAxMywgMjAxOSBhdCAwNDo1MzoyMVBNICswMjAwLCBPbGFmIEhlcmluZyB3cm90ZToKPiA+PiA+
ID4gPiBXaGF0IGlzIHRoZSByZWNvbW1lbmRlZCB3YXkgdG8gZGlzYWJsZSBDT05GSUdfUFZfU0hJ
TSwgd2hpY2ggaXMgc2V0IGluCj4gPj4gPiA+ID4gdG9vbHMvZmlybXdhcmUvTWFrZWZpbGU/IEZy
b20gbXkgdW5kZXJzdGFuZGluZyB0aGVyZSBpcyBubyB3YXkgdG8gCj4gPiBpbmZsdWVuY2UKPiA+
PiA+ID4gPiBpdHMgdmFsdWUgZnJvbSBvdXRzaWRlLCB3aGljaCBtZWFucyB0aGUgYnVpbGQgYWx3
YXlzIGVudGVycyB4ZW4tZGlyLy4KPiA+PiA+ID4gCj4gPj4gPiA+IEkgdGhpbmsgdGhlIGZvbGxv
d2luZyBzaG91bGQgZG8gdGhlIHRyaWNrLgo+ID4+ID4gPiAKPiA+PiA+ID4gTGV0IG1lIGtub3cg
aWYgdGhhdCB3b3JrcyBmb3IgeW91IGFuZCBJIHdpbGwgc3VibWl0IGl0IGZvcm1hbGx5Lgo+ID4+
ID4gPiAKPiA+PiA+ID4gVGhhbmtzIQo+ID4+ID4gPiAKPiA+PiA+ID4gLS0tODwtLS0KPiA+PiA+
ID4gZGlmZiAtLWdpdCBhL2NvbmZpZy9Ub29scy5tay5pbiBiL2NvbmZpZy9Ub29scy5tay5pbgo+
ID4+ID4gPiBpbmRleCA5ODI0NWY2M2M5Li44NGRkYjFhNTQyIDEwMDY0NAo+ID4+ID4gPiAtLS0g
YS9jb25maWcvVG9vbHMubWsuaW4KPiA+PiA+ID4gKysrIGIvY29uZmlnL1Rvb2xzLm1rLmluCj4g
Pj4gPiA+IEBAIC03NSwzICs3NSw1IEBAIFRJTkZPX0xJQlMgICAgICAgICAgOj0gQFRJTkZPX0xJ
QlNACj4gPj4gPiA+ICBBUkdQX0xERkxBR1MgICAgICAgIDo9IEBhcmdwX2xkZmxhZ3NACj4gPj4g
PiA+ICAKPiA+PiA+ID4gIEZJTEVfT0ZGU0VUX0JJVFMgICAgOj0gQEZJTEVfT0ZGU0VUX0JJVFNA
Cj4gPj4gPiA+ICsKPiA+PiA+ID4gK0NPTkZJR19QVl9TSElNICAgICAgOj0gQHB2c2hpbUAKPiA+
PiA+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL2NvbmZpZ3VyZS5hYyBiL3Rvb2xzL2NvbmZpZ3VyZS5h
Ywo+ID4+ID4gPiBpbmRleCBjOWZkNjlkZGZhLi44ZGYyZmQ2MDRiIDEwMDY0NAo+ID4+ID4gPiAt
LS0gYS90b29scy9jb25maWd1cmUuYWMKPiA+PiA+ID4gKysrIGIvdG9vbHMvY29uZmlndXJlLmFj
Cj4gPj4gPiA+IEBAIC00OTIsNCArNDkyLDE1IEBAIEFDX0FSR19FTkFCTEUoWzlwZnNdLAo+ID4+
ID4gPiAgCj4gPj4gPiA+ICBBQ19TVUJTVChuaW5lcGZzKQo+ID4+ID4gPiAgCj4gPj4gPiA+ICtB
Q19BUkdfRU5BQkxFKFtwdnNoaW1dLAo+ID4+ID4gPiArICAgIEFTX0hFTFBfU1RSSU5HKFstLWRp
c2FibGUtcHZzaGltXSwgW0Rpc2FibGUgcHZzaGltIGJ1aWxkICh4ODYgb25seSwgZW5hYmxlZCBi
eSBkZWZhdWx0KV0pLAo+ID4+ID4gPiArICAgIFtBU19JRihbdGVzdCAieCRlbmFibGVfcHZzaGlt
IiA9ICJ4bm8iXSwgW3B2c2hpbT1uXSwgW3B2c2hpbT15XSldLCBbCj4gPj4gPiA+ICsgICAgY2Fz
ZSAiJGhvc3RfY3B1IiBpbgo+ID4+ID4gPiArICAgICAgICBpW1szNDU2XV04Nnx4ODZfNjQpCj4g
Pj4gPiA+ICsgICAgICAgICAgIHB2c2hpbT0ieSI7Owo+ID4+ID4gCj4gPj4gPiBTaW5jZSB4ZW4g
ZG9lc24ndCBidWlsZCBvbiAzMmJpdCBhbnltb3JlIHlvdSBtYXkgd2FudCB0byBleGNsdWRlCj4g
Pj4gPiBpWzM0NTZdODYgaGVyZT8KPiA+PiAKPiA+PiBPaCwgSSBkaWRuJ3QgcmVhbGl6ZSB0aGlz
LiBJcyBpdCB0cnVlIGZvciBhbGwgZGlzdHJvcz8KPiA+IAo+ID4gRkFPRCBJIHdhcyB0aGlua2lu
ZyBhYm91dCAzMmJpdCB4ZW4gc3VwcG9ydC4gQnV0IEkganVzdCByZWFsaXNlIHNpbmNlCj4gPiB5
b3UgdGVzdGVkIGhvc3RfY3B1IGhlcmUsIG1heWJlIHlvdSBpbnRlbmRlZCB0byBkbyBhIGNyb3Nz
LWJ1aWxkPwo+IAo+IElmIHRoZSBpbnRlbnRpb24gaXMgYSBjcm9zcyBidWlsZCwgdGhlbiBob3N0
IENQVSBzaG91bGRuJ3QgbWF0dGVyIGF0Cj4gYWxsLCBpLmUuIGJ1aWxkaW5nIGUuZy4gb24gQXJt
IHNob3VsZCB3b3JrIGFzIHdlbGwuCj4gCj4gV2hlbiBjb25zaWRlcmluZyB0aGUgdGFyZ2V0IENQ
VSwgaW1wbHlpbmcgYSA2NC1iaXQgaHlwZXJ2aXNvciBmcm9tCj4gYSAzMi1iaXQgZ2VuZXJhbCAo
aS5lLiB0b29sIHN0YWNrKSB0YXJnZXQgd291bGQgb2YgY291cnNlIGJlIGFuIG9wdGlvbi4KPiBR
dWVzdGlvbiBqdXN0IGlzIGhvdyB5b3Ugd291bGQgZGV0ZXJtaW5lIHdoZXRoZXIgYSBzdWl0YWJs
ZSBjcm9zcwo+IHRvb2wgY2hhaW4gaXMgYXZhaWxhYmxlLgoKSSB0aGluayBpdCB3b3VsZCBiZXR0
ZXIgdG8gdXNlIHRhcmdldF9jcHUgaGVyZSwgYnV0IGxpbWl0aW5nIHRvIHg4Nl82NApvbmx5IHNl
ZW1zIHdyb25nLCBzaW5jZSBhIHVzZXIgY291bGQgYnVpbGQgYSAzMmJpdCB0b29sc3RhY2sgYW5k
IGhhdmUKYSA2NGJpdCBwdnNoaW0uIEknbSBub3Qgc3VyZSBob3dldmVyIGlmIHRoZXJlIGFyZSBv
dGhlciBpc3N1ZXMgdGhhdAp3b3VsZCBwcmV2ZW50IHRoaXMgZnJvbSB3b3JraW5nIG91dCBvZiB0
aGUgYm94LgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
