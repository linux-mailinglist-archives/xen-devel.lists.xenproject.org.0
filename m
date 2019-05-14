Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA111C671
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 11:55:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQU78-0000k6-VT; Tue, 14 May 2019 09:52:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQU76-0000jy-Op
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 09:52:48 +0000
X-Inumbo-ID: 04445e9c-762e-11e9-9cec-9363f1b2200f
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 04445e9c-762e-11e9-9cec-9363f1b2200f;
 Tue, 14 May 2019 09:52:43 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 14 May 2019 03:52:42 -0600
Message-Id: <5CDA8FE7020000780022E759@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 14 May 2019 03:52:39 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>, "Wei Liu" <wei.liu2@citrix.com>
References: <20190513165321.464fdeaf.olaf@aepfle.de>
 <20190513152005.jojtolhh5wdguvg6@Air-de-Roger>
 <20190513152812.GC3977@zion.uk.xensource.com>
 <20190514085518.g3wdf7h3tka25cb6@Air-de-Roger>
 <20190514092321.GW2798@zion.uk.xensource.com>
In-Reply-To: <20190514092321.GW2798@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Disposition: inline
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Olaf Hering <olaf@aepfle.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE0LjA1LjE5IGF0IDExOjIzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMTA6NTU6MThBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPj4gT24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDQ6Mjg6MTJQTSArMDEwMCwgV2Vp
IExpdSB3cm90ZToKPj4gPiBPbiBNb24sIE1heSAxMywgMjAxOSBhdCAwNToyMDowNVBNICswMjAw
LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+PiA+ID4gT24gTW9uLCBNYXkgMTMsIDIwMTkgYXQg
MDQ6NTM6MjFQTSArMDIwMCwgT2xhZiBIZXJpbmcgd3JvdGU6Cj4+ID4gPiA+IFdoYXQgaXMgdGhl
IHJlY29tbWVuZGVkIHdheSB0byBkaXNhYmxlIENPTkZJR19QVl9TSElNLCB3aGljaCBpcyBzZXQg
aW4KPj4gPiA+ID4gdG9vbHMvZmlybXdhcmUvTWFrZWZpbGU/IEZyb20gbXkgdW5kZXJzdGFuZGlu
ZyB0aGVyZSBpcyBubyB3YXkgdG8gCj4gaW5mbHVlbmNlCj4+ID4gPiA+IGl0cyB2YWx1ZSBmcm9t
IG91dHNpZGUsIHdoaWNoIG1lYW5zIHRoZSBidWlsZCBhbHdheXMgZW50ZXJzIHhlbi1kaXIvLgo+
PiA+ID4gCj4+ID4gPiBJIHRoaW5rIHRoZSBmb2xsb3dpbmcgc2hvdWxkIGRvIHRoZSB0cmljay4K
Pj4gPiA+IAo+PiA+ID4gTGV0IG1lIGtub3cgaWYgdGhhdCB3b3JrcyBmb3IgeW91IGFuZCBJIHdp
bGwgc3VibWl0IGl0IGZvcm1hbGx5Lgo+PiA+ID4gCj4+ID4gPiBUaGFua3MhCj4+ID4gPiAKPj4g
PiA+IC0tLTg8LS0tCj4+ID4gPiBkaWZmIC0tZ2l0IGEvY29uZmlnL1Rvb2xzLm1rLmluIGIvY29u
ZmlnL1Rvb2xzLm1rLmluCj4+ID4gPiBpbmRleCA5ODI0NWY2M2M5Li44NGRkYjFhNTQyIDEwMDY0
NAo+PiA+ID4gLS0tIGEvY29uZmlnL1Rvb2xzLm1rLmluCj4+ID4gPiArKysgYi9jb25maWcvVG9v
bHMubWsuaW4KPj4gPiA+IEBAIC03NSwzICs3NSw1IEBAIFRJTkZPX0xJQlMgICAgICAgICAgOj0g
QFRJTkZPX0xJQlNACj4+ID4gPiAgQVJHUF9MREZMQUdTICAgICAgICA6PSBAYXJncF9sZGZsYWdz
QAo+PiA+ID4gIAo+PiA+ID4gIEZJTEVfT0ZGU0VUX0JJVFMgICAgOj0gQEZJTEVfT0ZGU0VUX0JJ
VFNACj4+ID4gPiArCj4+ID4gPiArQ09ORklHX1BWX1NISU0gICAgICA6PSBAcHZzaGltQAo+PiA+
ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL2NvbmZpZ3VyZS5hYyBiL3Rvb2xzL2NvbmZpZ3VyZS5hYwo+
PiA+ID4gaW5kZXggYzlmZDY5ZGRmYS4uOGRmMmZkNjA0YiAxMDA2NDQKPj4gPiA+IC0tLSBhL3Rv
b2xzL2NvbmZpZ3VyZS5hYwo+PiA+ID4gKysrIGIvdG9vbHMvY29uZmlndXJlLmFjCj4+ID4gPiBA
QCAtNDkyLDQgKzQ5MiwxNSBAQCBBQ19BUkdfRU5BQkxFKFs5cGZzXSwKPj4gPiA+ICAKPj4gPiA+
ICBBQ19TVUJTVChuaW5lcGZzKQo+PiA+ID4gIAo+PiA+ID4gK0FDX0FSR19FTkFCTEUoW3B2c2hp
bV0sCj4+ID4gPiArICAgIEFTX0hFTFBfU1RSSU5HKFstLWRpc2FibGUtcHZzaGltXSwgW0Rpc2Fi
bGUgcHZzaGltIGJ1aWxkICh4ODYgb25seSwgZW5hYmxlZCBieSBkZWZhdWx0KV0pLAo+PiA+ID4g
KyAgICBbQVNfSUYoW3Rlc3QgIngkZW5hYmxlX3B2c2hpbSIgPSAieG5vIl0sIFtwdnNoaW09bl0s
IFtwdnNoaW09eV0pXSwgWwo+PiA+ID4gKyAgICBjYXNlICIkaG9zdF9jcHUiIGluCj4+ID4gPiAr
ICAgICAgICBpW1szNDU2XV04Nnx4ODZfNjQpCj4+ID4gPiArICAgICAgICAgICBwdnNoaW09Inki
OzsKPj4gPiAKPj4gPiBTaW5jZSB4ZW4gZG9lc24ndCBidWlsZCBvbiAzMmJpdCBhbnltb3JlIHlv
dSBtYXkgd2FudCB0byBleGNsdWRlCj4+ID4gaVszNDU2XTg2IGhlcmU/Cj4+IAo+PiBPaCwgSSBk
aWRuJ3QgcmVhbGl6ZSB0aGlzLiBJcyBpdCB0cnVlIGZvciBhbGwgZGlzdHJvcz8KPiAKPiBGQU9E
IEkgd2FzIHRoaW5raW5nIGFib3V0IDMyYml0IHhlbiBzdXBwb3J0LiBCdXQgSSBqdXN0IHJlYWxp
c2Ugc2luY2UKPiB5b3UgdGVzdGVkIGhvc3RfY3B1IGhlcmUsIG1heWJlIHlvdSBpbnRlbmRlZCB0
byBkbyBhIGNyb3NzLWJ1aWxkPwoKSWYgdGhlIGludGVudGlvbiBpcyBhIGNyb3NzIGJ1aWxkLCB0
aGVuIGhvc3QgQ1BVIHNob3VsZG4ndCBtYXR0ZXIgYXQKYWxsLCBpLmUuIGJ1aWxkaW5nIGUuZy4g
b24gQXJtIHNob3VsZCB3b3JrIGFzIHdlbGwuCgpXaGVuIGNvbnNpZGVyaW5nIHRoZSB0YXJnZXQg
Q1BVLCBpbXBseWluZyBhIDY0LWJpdCBoeXBlcnZpc29yIGZyb20KYSAzMi1iaXQgZ2VuZXJhbCAo
aS5lLiB0b29sIHN0YWNrKSB0YXJnZXQgd291bGQgb2YgY291cnNlIGJlIGFuIG9wdGlvbi4KUXVl
c3Rpb24ganVzdCBpcyBob3cgeW91IHdvdWxkIGRldGVybWluZSB3aGV0aGVyIGEgc3VpdGFibGUg
Y3Jvc3MKdG9vbCBjaGFpbiBpcyBhdmFpbGFibGUuCgo+IEkgaGF2ZSBuZXZlciB0ZXN0ZWQgY3Jv
c3MtYnVpbGRpbmcgNjRiaXQgeGVuIG9uIGEgMzJiaXQgcGxhdGZvcm0uLi4KCkFzIEFuZHJldyBz
YXlzIC0gdGhpcyB3b3JrcyBwZXJmZWN0bHkgZmluZS4KCkphbgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
