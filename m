Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D883C14BE1E
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 17:55:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwU6k-0001Ty-RJ; Tue, 28 Jan 2020 16:52:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=pdAI=3R=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iwU6i-0001Tq-G3
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 16:52:56 +0000
X-Inumbo-ID: a19d9d16-41ee-11ea-8739-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a19d9d16-41ee-11ea-8739-12813bfff9fa;
 Tue, 28 Jan 2020 16:52:55 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwU6g-00056x-I8; Tue, 28 Jan 2020 16:52:54 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwU6g-0001lp-7Y; Tue, 28 Jan 2020 16:52:54 +0000
Date: Tue, 28 Jan 2020 16:52:51 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200128165251.cvhvqad2oyep4kdl@debian>
References: <20200122202343.5703-1-liuwe@microsoft.com>
 <20200122202343.5703-6-liuwe@microsoft.com>
 <e72f37cf-63cb-9c10-00e2-96f946208265@suse.com>
 <20200128155011.xblutfe4titdo5ax@debian>
 <53b5eccd-b192-1684-0a5e-f2635fdc9d64@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <53b5eccd-b192-1684-0a5e-f2635fdc9d64@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v4 5/7] x86/hyperv: provide percpu hypercall
 input page
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
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMjgsIDIwMjAgYXQgMDU6MTU6MzlQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjguMDEuMjAyMCAxNjo1MCwgV2VpIExpdSB3cm90ZToKPiA+IE9uIFRodSwgSmFu
IDIzLCAyMDIwIGF0IDA0OjQ1OjM4UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+IE9u
IDIyLjAxLjIwMjAgMjE6MjMsIFdlaSBMaXUgd3JvdGU6Cj4gPj4+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiA+Pj4gKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5
cGVydi9oeXBlcnYuYwo+ID4+PiBAQCAtMjcsNyArMjcsMTAgQEAKPiA+Pj4gICNpbmNsdWRlIDxh
c20vZ3Vlc3QvaHlwZXJ2LXRsZnMuaD4KPiA+Pj4gICNpbmNsdWRlIDxhc20vcHJvY2Vzc29yLmg+
Cj4gPj4+ICAKPiA+Pj4gKyNpbmNsdWRlICJwcml2YXRlLmgiCj4gPj4+ICsKPiA+Pj4gIHN0cnVj
dCBtc19oeXBlcnZfaW5mbyBfX3JlYWRfbW9zdGx5IG1zX2h5cGVydjsKPiA+Pj4gK0RFRklORV9Q
RVJfQ1BVX1JFQURfTU9TVExZKHZvaWQgKiwgaHZfcGNwdV9pbnB1dF9hcmcpOwo+ID4+Cj4gPj4g
V291bGQgaXQgcGVyaGFwcyBiZSBoZWxwZnVsIHRvIG1ha2UgcmVjb2duaXphYmxlIHRoYXQgdGhp
cyBjYW4gaG9sZAo+ID4+IHVwIHRvIGEgcGFnZSdzIHdvcnRoIG9mIGRhdGEsIGVpdGhlciBieSBp
dHMgdHlwZSBvciBieSBhIHNsaWdodGx5Cj4gPj4gZGlmZmVyZW50IG5hbWU/Cj4gPiAKPiA+IEkg
d2lsbCBjaGFuZ2UgdGhpcyB0byBodl9wY3B1X2lucHV0X2FyZ19wYWdlIGluc3RlYWQuCj4gCj4g
T3IgbWF5YmUgaHZfcGNwdV9pbnB1dF9wYWdlPwoKRmluZSBieSBtZS4KCj4gCj4gPj4+IEBAIC0x
MTksMTQgKzEyMiwzNiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfaHlwZXJjYWxsX3BhZ2Uo
dm9pZCkKPiA+Pj4gICAgICB9Cj4gPj4+ICB9Cj4gPj4+ICAKPiA+Pj4gK3N0YXRpYyB2b2lkIHNl
dHVwX2h5cGVyY2FsbF9wY3B1X2FyZyh2b2lkKQo+ID4+PiArewo+ID4+PiArICAgIHZvaWQgKm1h
cHBpbmc7Cj4gPj4+ICsKPiA+Pj4gKyAgICBpZiAoIHRoaXNfY3B1KGh2X3BjcHVfaW5wdXRfYXJn
KSApCj4gPj4+ICsgICAgICAgIHJldHVybjsKPiA+Pj4gKwo+ID4+PiArICAgIG1hcHBpbmcgPSBh
bGxvY194ZW5oZWFwX3BhZ2UoKTsKPiA+Pj4gKyAgICBpZiAoICFtYXBwaW5nICkKPiA+Pj4gKyAg
ICAgICAgcGFuaWMoIkZhaWxlZCB0byBhbGxvY2F0ZSBoeXBlcmNhbGwgaW5wdXQgcGFnZSBmb3Ig
Q1BVJXVcbiIsCj4gPj4+ICsgICAgICAgICAgICAgIHNtcF9wcm9jZXNzb3JfaWQoKSk7Cj4gPj4K
PiA+PiBwYW5pYygpIGlzIGxpa2VseSBmaW5lIGZvciB0aGUgQlNQLCBidXQgSSBkb24ndCB0aGlu
ayBhbnkgQVAgc2hvdWxkCj4gPj4gYmUgYWJsZSB0byBicmluZyBkb3duIHRoZSBzeXN0ZW0gYmVj
YXVzZSBvZiBtZW1vcnkgc2hvcnRhZ2UuIFN1Y2gKPiA+PiBhbiBBUCBzaG91bGQgc2ltcGx5IG5v
dCBjb21lIG9ubGluZS4gKEV2ZW4gZm9yIHRoZSBCU1AgdGhlIHF1ZXN0aW9uCj4gPj4gaXMgd2hl
dGhlciBYZW4gd291bGQgYmUgYWJsZSB0byBydW4gZGVzcGl0ZSBmYWlsdXJlIGhlcmUuKQo+ID4g
Cj4gPiBUaGlzIGlzIG5vIGRpZmZlcmVudCB0aGFuIHdoYXQgaXMgYWxyZWFkeSBkb25lIGZvciBY
ZW4gb24gWGVuLCBpLmUuCj4gPiBmYWlsdXJlIGluIHNldHRpbmcgdXAgQVAgZm9yIGFueSByZWFz
b24gaXMgZmF0YWwuCj4gPiAKPiA+IHN0YXJ0X3NlY29uZGFyeSBkb2Vzbid0IGV2ZW4gaGFuZGxp
bmcgYW55IGZhaWx1cmUgYnkgaXRzZWxmIG9yCj4gPiBwcm9wYWdhdGUgZmFpbHVyZSBiYWNrIHRv
IGNhbGxlci4KPiA+IAo+ID4gUmV3aW5kaW5nIGlzIGEgYml0IGNvbXBsZXgsIGdpdmVuIHRoYXQg
d2Ugd291bGQgZW5hYmxlIGh5cGVydmlzb3IKPiA+IGZlYXR1cmVzIHZlcnkgZWFybHkuCj4gPiAK
PiA+IFRvIGFjaGlldmUgd2hhdCB5b3Ugd2FudCBpdCB3b3VsZCByZXF1aXJlIHJld3JpdGluZyBv
ZiBvdGhlciBwYXJ0cyB0aGF0Cj4gPiBhcmUgb3V0c2lkZSBvZiBoeXBlcnZpc29yIGZyYW1ld29y
ay4KPiAKPiBOb3Qgc3VyZS4gQ29tcGFyaW5nIHdpdGggc3RhcnRfc2Vjb25kYXJ5KCkgaXMgcGVy
aGFwcyBzdWItb3B0aW1hbC4KPiBUaGUgZnVuY3Rpb24gY2FsbHMgc21wX2NhbGxpbigpLCBhbmQg
dGhlcmUgeW91J2xsIGZpbmQgc29tZSBlcnJvcgo+IGhhbmRsaW5nLiBJIHdvdWxkIHN1cHBvc2Ug
dGhpcyBjb3VsZCBiZSBleHRlbmRlZCAodGhlcmUgb3IgaW4KPiBzdGFydF9zZWNvbmRhcnkoKSBp
dHNlbGYsIGlmIG5lZWQgYmUpIHRvIGRlYWwgd2l0aCBjYXNlcyBsaWtlIHRoaXMKPiBvbmUuIEFz
IHRvIFhlbi1vbi1YZW4gLSBpaXJjIHRoYXQgY29kZSB3YXMgcHJldHR5IG11Y2ggcnVzaGVkIGlu
Cj4gZm9yIHRoZSBzaGltIHRvIGJlY29tZSB1c2FibGUsIHNvIEkgd291bGRuJ3QgdGFrZSBpdHMg
ZXJyb3IKPiBoYW5kbGluZyBtb2RlbCBhcyB0aGUgY2Fub25pY2FsIHJlZmVyZW5jZS4KCk9LLiBX
aGF0IEkgY2FuIGRvIGhlcmUgaXMgdG8gd3JpdGUgc29tZSBwYXRjaGVzIHRvIDEpIG1ha2UgdGhl
IGhvb2sKcmV0dXJuIHNlbnNpYmxlIGVycm9yIGNvZGUgYW5kIGIpIHB1c2ggaHlwZXJ2aXNvcl9h
cF9zZXR1cCBkb3duIHRvCnNtcF9jYWxsaW4uCgpXZWkuCgo+IAo+IEphbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
