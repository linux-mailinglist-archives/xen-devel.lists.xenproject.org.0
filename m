Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 432C33CBFE
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 14:45:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hag6r-0007Q6-0j; Tue, 11 Jun 2019 12:42:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TTh1=UK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hag6p-0007Pv-QY
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 12:42:39 +0000
X-Inumbo-ID: 63d73144-8c46-11e9-b54f-931b40d60041
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 63d73144-8c46-11e9-b54f-931b40d60041;
 Tue, 11 Jun 2019 12:42:36 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 11 Jun 2019 06:42:35 -0600
Message-Id: <5CFFA1B9020000780023704E@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 11 Jun 2019 06:42:33 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5CE68CD30200007800231B01@prv1-mh.provo.novell.com>
 <5CE68F830200007800231B3B@prv1-mh.provo.novell.com>
 <483c4bbc-4915-48a3-9295-4d5a2bf6a02e@citrix.com>
In-Reply-To: <483c4bbc-4915-48a3-9295-4d5a2bf6a02e@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 3/5] x86/AMD: make C-state handling
 independent of Dom0
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
Cc: Wei Liu <wei.liu2@citrix.com>, Brian Woods <brian.woods@amd.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEwLjA2LjE5IGF0IDE4OjI4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjMvMDUvMjAxOSAxMzoxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEF0IGxlYXN0
IGZvciBtb3JlIHJlY2VudCBDUFVzLCBmb2xsb3dpbmcgd2hhdCBCS0RHIC8gUFBSIHN1Z2dlc3Qg
Zm9yIHRoZQo+PiBCSU9TIHRvIHN1cmZhY2UgdmlhIEFDUEkgd2UgY2FuIG1ha2Ugb3Vyc2VsdmVz
IGluZGVwZW5kZW50IG9mIERvbTAKPj4gdXBsb2FkaW5nIHJlc3BlY3RpdmUgZGF0YS4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiAtLS0KPj4g
VEJEOiBDYW4gd2Ugc2V0IGxvY2FsX2FwaWNfdGltZXJfYzJfb2sgdG8gdHJ1ZT8gSSBjYW4ndCBz
ZWVtIHRvIGZpbmQgYW55Cj4+ICAgICAgc3RhdGVtZW50IGluIHRoZSBCS0RHIC8gUFBSIGFzIHRv
IHdoZXRoZXIgdGhlIExBUElDIHRpbWVyIGNvbnRpbnVlcwo+PiAgICAgIHJ1bm5pbmcgaW4gQ0M2
Lgo+IAo+IFRoaXMgb3VnaHQgdG8gYmUgZWFzeSB0byBkZXRlcm1pbmUuICBHaXZlbiB0aGUgZGVz
Y3JpcHRpb24gb2YgQ0M2Cj4gZmx1c2hpbmcgdGhlIGNhY2hlIGFuZCBwb3dlciBnYXRpbmcgdGhl
IGNvcmUsIEknZCBzYXkgdGhlcmUgaXMgYQo+IHJlYXNvbmFibGUgY2hhbmNlIHRoYXQgdGhlIExB
UElDIHRpbWVyIHN0b3BzIGluIENDNi4KCkJ1dCAicmVhc29uYWJsZSBjaGFuY2UiIGlzbid0IGVu
b3VnaCBmb3IgbXkgdGFzdGUgaGVyZS4gQW5kIGZyb20Kd2hhdCB5b3UgZGVkdWNlLCB0aGUgYW5z
d2VyIHRvIHRoZSBxdWVzdGlvbiB3b3VsZCBiZSAibm8iLCBhbmQKaGVuY2Ugc2ltcGx5IG5vIGNo
YW5nZSB0byBiZSBtYWRlIGFueXdoZXJlLiAoSSBkbyB0aGluayB0aG91Z2gKdGhhdCBpdCdzIG1v
cmUgY29tcGxpY2F0ZWQgdGhhbiB0aGlzLCBiZWNhdXNlIGlpcmMgbXVjaCBhbHNvIGRlcGVuZHMK
b24gd2hhdCB0aGUgZmlybXdhcmUgYWN0dWFsbHkgZG9lcy4pCgo+PiBUQkQ6IFdlIG1heSB3YW50
IHRvIHZlcmlmeSB0aGF0IEhMVCBpbmRlZWQgaXMgY29uZmlndXJlZCB0byBlbnRlciBDQzYuCj4g
Cj4gSSBjYW4ndCBhY3R1YWxseSBzcG90IGFueXRoaW5nIHdoaWNoIHRhbGtzIGFib3V0IEhMVCBk
aXJlY3RseS4gIFRoZQo+IGNsb3Nlc3QgSSBjYW4gcG9zdCBpcyBDRk9IIChjYWNoZSBmbHVzaCBv
biBoYWx0KSB3aGljaCBpcyBhbgo+IGF1dG8tdHJhbnNpdGlvbiBmcm9tIENDMSB0byBDQzYgYWZ0
ZXIgYSBzcGVjaWZpYyB0aW1lb3V0LCBidXQgdGhlCj4gd29yZGluZyBzdWdnZXN0cyB0aGF0IG13
YWl0IHdvdWxkIGFsc28gdGFrZSB0aGlzIHBhdGguCgpXZWxsLCBJIGhhZCBjb21lIGFjcm9zcyBh
IHNlY3Rpb24gZGVzY3JpYmluZyBob3cgSExUIGNhbiBiZQpjb25maWd1cmVkIHRvIGJlIHRoZSBz
YW1lIGFjdGlvbiBhcyB0aGUgSS9PIHBvcnQgcmVhZCBmcm9tIG9uZQpvZiB0aGUgdGhyZWUgcG9y
dHMgaW52b2x2ZWQgaW4gQy1zdGF0ZSBtYW5hZ2VtZW50CihDU3RhdGVCYXNlQWRkciswLi4uMiku
IEJ1dCBJIGNhbid0IHNlZW0gdG8gZmluZCB0aGlzIGFnYWluLgoKQXMgdG8gTVdBSVQgYmVoYXZp
bmcgdGhlIHNhbWUsIEkgZG9uJ3QgdGhpbmsgSSBjYW4gc3BvdCBwcm9vZgpvZiB5b3VyIGludGVy
cHJldGF0aW9uIG9yIHByb29mIG9mIEJyaWFuJ3MuCgo+PiAtLS0gYS94ZW4vYXJjaC94ODYvYWNw
aS9jcHVfaWRsZS5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9hY3BpL2NwdV9pZGxlLmMKPj4gQEAg
LTEyODMsNiArMTI4OCw5OCBAQCBsb25nIHNldF9jeF9wbWluZm8odWludDMyX3QgYWNwaV9pZCwg
c3RyCj4+ICAgICAgcmV0dXJuIDA7Cj4+ICB9Cj4+ICAKPj4gK3N0YXRpYyB2b2lkIGFtZF9jcHVp
ZGxlX2luaXQoc3RydWN0IGFjcGlfcHJvY2Vzc29yX3Bvd2VyICpwb3dlcikKPj4gK3sKPj4gKyAg
ICB1bnNpZ25lZCBpbnQgaSwgbnIgPSAwOwo+PiArICAgIGNvbnN0IHN0cnVjdCBjcHVpbmZvX3g4
NiAqYyA9ICZjdXJyZW50X2NwdV9kYXRhOwo+PiArICAgIGNvbnN0IHVuc2lnbmVkIGludCBlY3hf
cmVxID0gQ1BVSUQ1X0VDWF9FWFRFTlNJT05TX1NVUFBPUlRFRCB8Cj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBDUFVJRDVfRUNYX0lOVEVSUlVQVF9CUkVBSzsKPj4gKyAgICBj
b25zdCBzdHJ1Y3QgYWNwaV9wcm9jZXNzb3JfY3ggKmN4ID0gTlVMTDsKPj4gKyAgICBzdGF0aWMg
Y29uc3Qgc3RydWN0IGFjcGlfcHJvY2Vzc29yX2N4IGZhbTE3W10gPSB7Cj4+ICsgICAgICAgIHsK
Pj4gKyAgICAgICAgICAgIC50eXBlID0gQUNQSV9TVEFURV9DMSwKPj4gKyAgICAgICAgICAgIC5l
bnRyeV9tZXRob2QgPSBBQ1BJX0NTVEFURV9FTV9GRkgsCj4+ICsgICAgICAgICAgICAuYWRkcmVz
cyA9IDAsCj4+ICsgICAgICAgICAgICAubGF0ZW5jeSA9IDEsCj4+ICsgICAgICAgIH0sCj4+ICsg
ICAgICAgIHsKPj4gKyAgICAgICAgICAgIC50eXBlID0gQUNQSV9TVEFURV9DMiwKPj4gKyAgICAg
ICAgICAgIC5lbnRyeV9tZXRob2QgPSBBQ1BJX0NTVEFURV9FTV9IQUxULAo+PiArICAgICAgICAg
ICAgLmxhdGVuY3kgPSA0MDAsCj4+ICsgICAgICAgIH0sCj4+ICsgICAgfTsKPj4gKwo+PiArICAg
IGlmICggcG1faWRsZV9zYXZlICYmIHBtX2lkbGUgIT0gYWNwaV9wcm9jZXNzb3JfaWRsZSApCj4+
ICsgICAgICAgIHJldHVybjsKPj4gKwo+PiArICAgIGlmICggdmVuZG9yX292ZXJyaWRlIDwgMCAp
Cj4+ICsgICAgICAgIHJldHVybjsKPj4gKwo+PiArICAgIHN3aXRjaCAoIGMtPng4NiApCj4+ICsg
ICAgewo+PiArICAgIGNhc2UgMHgxNzoKPiAKPiBXaXRoIEh5Z29uIGluIHRoZSBtaXgsIHRoaXMg
c2hvdWxkIGJlIGV4cGFuZGVkIHRvIEZhbTE4aC4KCkJ1dCBvbmx5IG9uY2Ugd2UgZ2V0IGEgZ3Vh
cmFudGVlIGZyb20gQU1EIHRoYXQgdGhleSB3b24ndCB1c2UKZmFtaWx5IDE4aC4gT3RoZXJ3aXNl
IHdlJ2QgaGF2ZSB0byB1c2UgdmVuZG9yIGNoZWNrcyBoZXJlLgpBbnl3YXkgdGhpcyBzZXJpZXMg
cHJlZGF0ZXMgdGhlIG1lcmdpbmcgb2YgdGhlIEh5Z29uIG9uZS4gQnV0CnllcywgSSBjYW4gZWFz
aWx5IGRvIHRoaXMgZm9yIHYyLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
