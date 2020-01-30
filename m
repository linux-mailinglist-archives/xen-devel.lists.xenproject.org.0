Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFF814DA26
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 12:50:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix8Ig-00027i-AR; Thu, 30 Jan 2020 11:47:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ezal=3T=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1ix8If-00027d-C9
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 11:47:57 +0000
X-Inumbo-ID: 5b0c9000-4356-11ea-8a3d-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5b0c9000-4356-11ea-8a3d-12813bfff9fa;
 Thu, 30 Jan 2020 11:47:56 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ix8Id-00032f-7Z; Thu, 30 Jan 2020 11:47:55 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ix8Ic-0006OZ-UU; Thu, 30 Jan 2020 11:47:55 +0000
Date: Thu, 30 Jan 2020 11:47:52 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20200130114752.lmpvpgttcnadymqa@debian>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-8-liuwe@microsoft.com>
 <20200130104143.GH4679@Air-de-Roger>
 <20200130111821.zmzp7ykg4slqpa5y@debian>
 <20200130113947.GI4679@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200130113947.GI4679@Air-de-Roger>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v5 07/12] x86/hyperv: setup hypercall page
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMTI6Mzk6NDdQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUaHUsIEphbiAzMCwgMjAyMCBhdCAxMToxODoyMUFNICswMDAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gT24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMTE6NDE6NDNBTSArMDEwMCwg
Um9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+ID4gT24gV2VkLCBKYW4gMjksIDIwMjAgYXQgMDg6
MjA6MjlQTSArMDAwMCwgV2VpIExpdSB3cm90ZToKPiA+ID4gPiBIeXBlci1WIHVzZXMgYSB0ZWNo
bmlxdWUgY2FsbGVkIG92ZXJsYXkgcGFnZSBmb3IgaXRzIGh5cGVyY2FsbCBwYWdlLiBJdAo+ID4g
PiA+IHdpbGwgaW5zZXJ0IGEgYmFja2luZyBwYWdlIHRvIHRoZSBndWVzdCB3aGVuIHRoZSBoeXBl
cmNhbGwgZnVuY3Rpb25hbGl0eQo+ID4gPiA+IGlzIGVuYWJsZWQuIFRoYXQgbWVhbnMgd2UgY2Fu
IHVzZSBhIHBhZ2UgdGhhdCBpcyBub3QgYmFja2VkIGJ5IHJlYWwKPiA+ID4gPiBtZW1vcnkgZm9y
IGh5cGVyY2FsbCBwYWdlLgo+ID4gPiA+IAo+ID4gPiA+IFVzZSB0aGUgdG9wLW1vc3QgYWRkcmVz
c2FibGUgcGFnZSBmb3IgdGhhdCBwdXJwb3NlLiBBZGp1c3QgZTgyMCBjb2RlCj4gPiA+ID4gYWNj
b3JkaW5nbHkuCj4gPiA+ID4gCj4gPiA+ID4gV2UgYWxzbyBuZWVkIHRvIHJlZ2lzdGVyIFhlbidz
IGd1ZXN0IE9TIElEIHRvIEh5cGVyLVYuIFVzZSAweDMgYXMgdGhlCj4gPiA+ID4gdmVuZG9yIElE
LiBGaXggdGhlIGNvbW1lbnQgaW4gaHlwZXJ2LXRsZnMuaCB3aGlsZSBhdCBpdC4KPiA+ID4gPiAK
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgo+ID4g
PiA+IC0tLQo+ID4gPiA+IHY1Ogo+ID4gPiA+IDEuIHVzZSBoeXBlcnZpc29yX3Jlc2VydmVfdG9w
X3BhZ2VzCj4gPiA+ID4gMi4gYWRkIGEgbWFjcm8gZm9yIGh5cGVyY2FsbCBwYWdlIG1mbgo+ID4g
PiA+IDMuIGFkZHJlc3Mgb3RoZXIgbWlzYyBjb21tZW50cwo+ID4gPiA+IAo+ID4gPiA+IHY0Ogo+
ID4gPiA+IDEuIFVzZSBmaXhtYXAKPiA+ID4gPiAyLiBGb2xsb3cgcm91dGluZXMgbGlzdGVkIGlu
IFRMRlMKPiA+ID4gPiAtLS0KPiA+ID4gPiAgeGVuL2FyY2gveDg2L2U4MjAuYyAgICAgICAgICAg
ICAgICAgICAgIHwgIDUgKysrCj4gPiA+ID4gIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlw
ZXJ2LmMgICAgICB8IDU3ICsrKysrKysrKysrKysrKysrKysrKysrLS0KPiA+ID4gPiAgeGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYtdGxmcy5oIHwgIDUgKystCj4gPiA+ID4gIHhlbi9p
bmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmggICAgICB8ICAzICsrCj4gPiA+ID4gIDQgZmls
ZXMgY2hhbmdlZCwgNjUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+ID4gPiAKPiA+
ID4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2U4MjAuYyBiL3hlbi9hcmNoL3g4Ni9lODIw
LmMKPiA+ID4gPiBpbmRleCAzODkyYzljZmI3Li45OTY0M2YzZWEwIDEwMDY0NAo+ID4gPiA+IC0t
LSBhL3hlbi9hcmNoL3g4Ni9lODIwLmMKPiA+ID4gPiArKysgYi94ZW4vYXJjaC94ODYvZTgyMC5j
Cj4gPiA+ID4gQEAgLTM0Myw2ICszNDMsNyBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBfX2luaXQg
ZmluZF9tYXhfcGZuKHZvaWQpCj4gPiA+ID4gIHsKPiA+ID4gPiAgICAgIHVuc2lnbmVkIGludCBp
Owo+ID4gPiA+ICAgICAgdW5zaWduZWQgbG9uZyBtYXhfcGZuID0gMDsKPiA+ID4gPiArICAgIHVu
c2lnbmVkIGxvbmcgdG9wX3BmbiA9ICgoMXVsbCA8PCBwYWRkcl9iaXRzKSAtIDEpID4+IFBBR0Vf
U0hJRlQ7Cj4gPiA+ID4gIAo+ID4gPiA+ICAgICAgZm9yIChpID0gMDsgaSA8IGU4MjAubnJfbWFw
OyBpKyspIHsKPiA+ID4gPiAgICAgICAgICB1bnNpZ25lZCBsb25nIHN0YXJ0LCBlbmQ7Cj4gPiA+
ID4gQEAgLTM1Nyw2ICszNTgsMTAgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgX19pbml0IGZpbmRf
bWF4X3Bmbih2b2lkKQo+ID4gPiA+ICAgICAgICAgICAgICBtYXhfcGZuID0gZW5kOwo+ID4gPiA+
ICAgICAgfQo+ID4gPiA+ICAKPiA+ID4gPiArICAgIHRvcF9wZm4gLT0gaHlwZXJ2aXNvcl9yZXNl
cnZlX3RvcF9wYWdlcygpOwo+ID4gPiA+ICsgICAgaWYgKCBtYXhfcGZuID49IHRvcF9wZm4gKQo+
ID4gPiA+ICsgICAgICAgIG1heF9wZm4gPSB0b3BfcGZuOwo+ID4gPiAKPiA+ID4gSG0sIEknbSBu
b3Qgc3VyZSBJIHNlZSB0aGUgcG9pbnQgb2YgdGhpcy4gVGhlIHZhbHVlIHJldHVybmVkIGJ5Cj4g
PiA+IGZpbmRfbWF4X3BmbiBpcyB0aGUgbWF4aW11bSBSQU0gYWRkcmVzcyBmb3VuZCBpbiB0aGUg
bWVtb3J5IG1hcCwgYnV0Cj4gPiA+IHRoZSBwaHlzaWNhbCBhZGRyZXNzIHlvdSBhcmUgdXNpbmcg
dG8gbWFwIHRoZSBoeXBlcmNhbGwgcGFnZSBpcyBhbG1vc3QKPiA+ID4gY2VydGFpbmx5IG11Y2gg
aGlnaGVyIHRoYW4gdGhlIG1heGltdW0gYWRkcmVzcyBmb3VuZCBpbiB0aGUgcGh5c21hcAo+ID4g
PiAoYW5kIGNlcnRhaW5seSBub3QgUkFNKSwgYW5kIGhlbmNlIEknbSBub3Qgc3VyZSB3aGF0J3Mg
dGhlIHBvaW50IG9mCj4gPiA+IHRoaXMuCj4gPiAKPiA+IFllcywgdGhlIGtleXdvcmQgaXMgImFs
bW9zdCBjZXJ0YWlubHkiLiA6LSkKPiA+IAo+ID4gVGhpcyBpcyBkb25lIGZvciBjb3JyZWN0bmVz
cydzIHNha2UuIEkgZG9uJ3QgZXhwZWN0IGluIHByYWN0aWNlIHRoZXJlCj4gPiB3b3VsZCBiZSBh
IGNvbmZpZ3VyYXRpb24gdGhhdCBoYXMgdGhhdCBtdWNoIG1lbW9yeSwgYnV0IGNvcnJlY3RuZXNz
IGlzCj4gPiBzdGlsbCBpbXBvcnRhbnQuCj4gPiAKPiA+IEl0IGFsc28gZ3VhcmRzIGFnYWluc3Qg
d2VpcmQgY29uZmlndXJhdGlvbiBpbiB3aGljaCBtZW1vcnkgaXMgcHV0IGludG8KPiA+IHRoYXQg
cGFydCBvZiB0aGUgcGh5c2ljYWwgYWRkcmVzcyBzcGFjZSBmb3Igd2hhdGV2ZXIgcmVhc29uLiBJ
IGRvbid0Cj4gPiBrbm93IHdoeSBhbnlvbmUgd291bGQgZG8gdGhhdCwgYnV0IGFnYWluLCB3ZSBz
aG91bGQgYmUgcHJlcGFyZWQgZm9yCj4gPiB0aGF0Lgo+ID4gCj4gPiAKPiA+ID4gCj4gPiA+IEFs
c28geW91IGhhdmVuJ3QgaW50cm9kdWNlZCBhIEh5cGVyViBpbXBsZW1lbnRhdGlvbiBvZgo+ID4g
PiBoeXBlcnZpc29yX3Jlc2VydmVfdG9wX3BhZ2VzIHNvIGZhciwgc28gaXQncyBoYXJkIHRvIHRl
bGwgdGhlIGludGVuZAo+ID4gPiBvZiB0aGlzLgo+ID4gCj4gPiBEJ29oLiBUaGF0IHdhcyBzdXBw
b3NlZCB0byBiZSBpbiB0aGlzIHBhdGNoLiBJIGd1ZXNzIEkgZm9yZ290IHRvIGNvbW1pdAo+ID4g
dGhhdCBodW5rIQo+ID4gCj4gPiBUaGF0IGZ1bmN0aW9uIGZvciBIeXBlci1WIGlzIGdvaW5nIHRv
IHJldHVybiAxIChwYWdlKS4KPiAKPiBCdXQgdGhhdCB3b3VsZCBsaWtlbHkgYmUgd3JvbmcsIHVu
bGVzcyB0aGUgbWVtb3J5IG1hcCBoYXMgYSBSQU0KPiByZWdpb24gdGhhdCBleHBhbmRzIHVwIHRv
ICgxIDw8IHBhZGRyX2JpdHMpPwo+IAo+IE9yIGVsc2UgeW91IGFyZSBqdXN0IHJlbW92aW5nIGEg
cGFnZSBmcm9tIHRoZSBsYXN0IFJBTSByZWdpb24gaW4KPiB0aGUgbWVtb3J5IG1hcCBmb3Igbm8g
cmVhc29uLiBtYXhfcGZuIGlzIGFsbW9zdCBjZXJ0YWlubHkgd2F5IGJlbG93ICgxCj4gPDwgcGFk
ZHJfYml0cykuCj4gCgpXaHk/IFRoZSBhZGp1c3RtZW50IHdpbGwgbm90IGJlIGFwcGxpZWQgdW5s
ZXNzIFJBTSBvdmVybGFwcyB3aXRoIHRoYXQKcmVzZXJ2ZWQgcmVnaW9uLgoKPiBJIHRoaW5rIHdo
YXQgeW91IG5lZWQgaXMgYSBob29rIHRoYXQgbW9kaWZpZXMgdGhlIG1lbW9yeSBtYXAgYW5kIGFk
ZHMKPiBhIHJlc2VydmVkIHJlZ2lvbiBhdCAoKDEgPDwgcGFkZHJfYml0cykgLSBQQUdFX1NJWkUp
IG9mIHNpemUKPiBQQUdFX1NJWkUuIFNlZSB3aGVyZSBwdl9zaGltX2ZpeHVwX2U4MjAgaXMgdXNl
ZCwgYW5kIEkgdGhpbmsgeW91IHdhbnQKPiB0byBtYWtlIHRoaXMgYSBoeXBlcnZpc29yIGhvb2sg
YW5kIGFkZCB0aGUgSHlwZXJWIGNvZGUgdG8gcmVzZXJ2ZSB0aGUKPiBoeXBlcmNhbGwgcGFnZSBp
biB0aGUgZTgyMCB0aGVyZS4KClRoYXQgd29ya3MgZm9yIG1lIHRvby4gTGV0J3Mgc2VlIHdoYXQg
b3RoZXIgcGVvcGxlIHRoaW5rLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
