Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D581544F6
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 14:34:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izhFs-0003eu-8Y; Thu, 06 Feb 2020 13:31:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=I8Ts=32=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1izhFq-0003eh-Mk
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 13:31:38 +0000
X-Inumbo-ID: ffc0f595-48e4-11ea-af85-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ffc0f595-48e4-11ea-af85-12813bfff9fa;
 Thu, 06 Feb 2020 13:31:38 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1izhFp-0003Xf-Hq; Thu, 06 Feb 2020 13:31:37 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1izhFp-0007j1-8x; Thu, 06 Feb 2020 13:31:37 +0000
Date: Thu, 6 Feb 2020 13:31:34 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Message-ID: <20200206133134.zh3e5wsrskjcksld@debian>
References: <20200127181115.82709-1-roger.pau@citrix.com>
 <20200127181115.82709-7-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200127181115.82709-7-roger.pau@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v3 6/7] x86/tlb: allow disabling the TLB
 clock
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMjcsIDIwMjAgYXQgMDc6MTE6MTRQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFRoZSBUTEIgY2xvY2sgaXMgaGVscGZ1bCB3aGVuIHJ1bm5pbmcgWGVuIG9uIGJh
cmUgbWV0YWwgYmVjYXVzZSB3aGVuCj4gZG9pbmcgYSBUTEIgZmx1c2ggZWFjaCBDUFUgaXMgSVBJ
J2VkIGFuZCBjYW4ga2VlcCBhIHRpbWVzdGFtcCBvZiB0aGUKPiBsYXN0IGZsdXNoLgo+IAo+IFRo
aXMgaXMgbm90IHRoZSBjYXNlIGhvd2V2ZXIgd2hlbiBYZW4gaXMgcnVubmluZyB2aXJ0dWFsaXpl
ZCwgYW5kIHRoZQo+IHVuZGVybHlpbmcgaHlwZXJ2aXNvciBwcm92aWRlcyBtZWNoYW5pc20gdG8g
YXNzaXN0IGluIHBlcmZvcm1pbmcgVExCCj4gZmx1c2hlczogWGVuIGl0c2VsZiBmb3IgZXhhbXBs
ZSBvZmZlcnMgYSBIVk1PUF9mbHVzaF90bGJzIGh5cGVyY2FsbCBpbgo+IG9yZGVyIHRvIHBlcmZv
cm0gYSBUTEIgZmx1c2ggd2l0aG91dCBoYXZpbmcgdG8gSVBJIGVhY2ggQ1BVLiBXaGVuCj4gdXNp
bmcgc3VjaCBtZWNoYW5pc21zIGl0J3Mgbm8gbG9uZ2VyIHBvc3NpYmxlIHRvIGtlZXAgYSB0aW1l
c3RhbXAgb2YKPiB0aGUgZmx1c2hlcyBvbiBlYWNoIENQVSwgYXMgdGhleSBhcmUgcGVyZm9ybWVk
IGJ5IHRoZSB1bmRlcmx5aW5nCj4gaHlwZXJ2aXNvci4KPiAKPiBPZmZlciBhIGJvb2xlYW4gaW4g
b3JkZXIgdG8gc2lnbmFsIFhlbiB0aGF0IHRoZSB0aW1lc3RhbXBlZCBUTEIKPiBzaG91bGRuJ3Qg
YmUgdXNlZC4gVGhpcyBhdm9pZHMga2VlcGluZyB0aGUgdGltZXN0YW1wcyBvZiB0aGUgZmx1c2hl
cywKPiBhbmQgYWxzbyBmb3JjZXMgTkVFRF9GTFVTSCB0byBhbHdheXMgcmV0dXJuIHRydWUuCj4g
Cj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQsIGFzIHRoaXMgY2hhbmdlIGRvZXNuJ3Qg
aW50cm9kdWNlIGFueQo+IHVzZXIgdGhhdCBkaXNhYmxlcyB0aGUgdGltZXN0YW1wZWQgVExCLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
Pgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvZmx1c2h0bGIuYyAgICAgICAgfCAxOSArKysrKysrKysr
KysrLS0tLS0tCj4gIHhlbi9pbmNsdWRlL2FzbS14ODYvZmx1c2h0bGIuaCB8IDE3ICsrKysrKysr
KysrKysrKystCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2ZsdXNodGxiLmMgYi94ZW4vYXJj
aC94ODYvZmx1c2h0bGIuYwo+IGluZGV4IGU3Y2NkNGVjN2IuLjM2NDk5MDA3OTMgMTAwNjQ0Cj4g
LS0tIGEveGVuL2FyY2gveDg2L2ZsdXNodGxiLmMKPiArKysgYi94ZW4vYXJjaC94ODYvZmx1c2h0
bGIuYwo+IEBAIC0zMiw2ICszMiw5IEBACj4gIHUzMiB0bGJmbHVzaF9jbG9jayA9IDFVOwo+ICBE
RUZJTkVfUEVSX0NQVSh1MzIsIHRsYmZsdXNoX3RpbWUpOwo+ICAKPiArLyogU2lnbmFscyB3aGV0
aGVyIHRoZSBUTEIgZmx1c2ggY2xvY2sgaXMgaW4gdXNlLiAqLwo+ICtib29sIF9fcmVhZF9tb3N0
bHkgdGxiX2Nsa19lbmFibGVkID0gdHJ1ZTsKPiArCj4gIC8qCj4gICAqIHByZV9mbHVzaCgpOiBJ
bmNyZW1lbnQgdGhlIHZpcnR1YWwgVExCLWZsdXNoIGNsb2NrLiBSZXR1cm5zIG5ldyBjbG9jayB2
YWx1ZS4KPiAgICogCj4gQEAgLTgyLDEyICs4NSwxMyBAQCBzdGF0aWMgdm9pZCBwb3N0X2ZsdXNo
KHUzMiB0KQo+ICBzdGF0aWMgdm9pZCBkb190bGJfZmx1c2godm9pZCkKPiAgewo+ICAgICAgdW5z
aWduZWQgbG9uZyBmbGFncywgY3I0Owo+IC0gICAgdTMyIHQ7Cj4gKyAgICB1MzIgdCA9IDA7Cj4g
IAo+ICAgICAgLyogVGhpcyBub24tcmVlbnRyYW50IGZ1bmN0aW9uIGlzIHNvbWV0aW1lcyBjYWxs
ZWQgaW4gaW50ZXJydXB0IGNvbnRleHQuICovCj4gICAgICBsb2NhbF9pcnFfc2F2ZShmbGFncyk7
Cj4gIAo+IC0gICAgdCA9IHByZV9mbHVzaCgpOwo+ICsgICAgaWYgKCB0bGJfY2xrX2VuYWJsZWQg
KQo+ICsgICAgICAgIHQgPSBwcmVfZmx1c2goKTsKCkkgdGhpbmsgaXQgbWFrZXMgbW9yZSBzZW5z
ZSB0byBwdXNoIHRoZSBjaGVjayB0byBwcmVfZmx1c2ggYW5kCnBvc3RfZmx1c2ggLS0gdGhleSBh
cmUgdGhlIG9uZXMgdGhhdCBjYXJlIGFib3V0IHRoZSBjbG9jaywgYWZ0ZXIgYWxsLgoKVGhpcyBh
bHNvIGhhcyB0aGUgZWZmZWN0IG9mIG1ha2luZyB0aGlzIHBhdGNoIGEgYml0IHNob3J0ZXIsIEkg
dGhpbmsuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
