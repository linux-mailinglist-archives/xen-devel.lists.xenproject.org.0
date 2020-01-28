Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A5714BD45
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 16:51:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwT85-0003LG-6L; Tue, 28 Jan 2020 15:50:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=pdAI=3R=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iwT83-0003L4-Kg
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 15:50:15 +0000
X-Inumbo-ID: e013d938-41e5-11ea-b211-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e013d938-41e5-11ea-b211-bc764e2007e4;
 Tue, 28 Jan 2020 15:50:15 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwT82-0003Kw-6s; Tue, 28 Jan 2020 15:50:14 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwT81-00054i-RJ; Tue, 28 Jan 2020 15:50:14 +0000
Date: Tue, 28 Jan 2020 15:50:11 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200128155011.xblutfe4titdo5ax@debian>
References: <20200122202343.5703-1-liuwe@microsoft.com>
 <20200122202343.5703-6-liuwe@microsoft.com>
 <e72f37cf-63cb-9c10-00e2-96f946208265@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e72f37cf-63cb-9c10-00e2-96f946208265@suse.com>
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

T24gVGh1LCBKYW4gMjMsIDIwMjAgYXQgMDQ6NDU6MzhQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjIuMDEuMjAyMCAyMToyMywgV2VpIExpdSB3cm90ZToKPiA+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ndWVz
dC9oeXBlcnYvaHlwZXJ2LmMKPiA+IEBAIC0yNyw3ICsyNywxMCBAQAo+ID4gICNpbmNsdWRlIDxh
c20vZ3Vlc3QvaHlwZXJ2LXRsZnMuaD4KPiA+ICAjaW5jbHVkZSA8YXNtL3Byb2Nlc3Nvci5oPgo+
ID4gIAo+ID4gKyNpbmNsdWRlICJwcml2YXRlLmgiCj4gPiArCj4gPiAgc3RydWN0IG1zX2h5cGVy
dl9pbmZvIF9fcmVhZF9tb3N0bHkgbXNfaHlwZXJ2Owo+ID4gK0RFRklORV9QRVJfQ1BVX1JFQURf
TU9TVExZKHZvaWQgKiwgaHZfcGNwdV9pbnB1dF9hcmcpOwo+IAo+IFdvdWxkIGl0IHBlcmhhcHMg
YmUgaGVscGZ1bCB0byBtYWtlIHJlY29nbml6YWJsZSB0aGF0IHRoaXMgY2FuIGhvbGQKPiB1cCB0
byBhIHBhZ2UncyB3b3J0aCBvZiBkYXRhLCBlaXRoZXIgYnkgaXRzIHR5cGUgb3IgYnkgYSBzbGln
aHRseQo+IGRpZmZlcmVudCBuYW1lPwoKSSB3aWxsIGNoYW5nZSB0aGlzIHRvIGh2X3BjcHVfaW5w
dXRfYXJnX3BhZ2UgaW5zdGVhZC4KCj4gCj4gPiBAQCAtMTE5LDE0ICsxMjIsMzYgQEAgc3RhdGlj
IHZvaWQgX19pbml0IHNldHVwX2h5cGVyY2FsbF9wYWdlKHZvaWQpCj4gPiAgICAgIH0KPiA+ICB9
Cj4gPiAgCj4gPiArc3RhdGljIHZvaWQgc2V0dXBfaHlwZXJjYWxsX3BjcHVfYXJnKHZvaWQpCj4g
PiArewo+ID4gKyAgICB2b2lkICptYXBwaW5nOwo+ID4gKwo+ID4gKyAgICBpZiAoIHRoaXNfY3B1
KGh2X3BjcHVfaW5wdXRfYXJnKSApCj4gPiArICAgICAgICByZXR1cm47Cj4gPiArCj4gPiArICAg
IG1hcHBpbmcgPSBhbGxvY194ZW5oZWFwX3BhZ2UoKTsKPiA+ICsgICAgaWYgKCAhbWFwcGluZyAp
Cj4gPiArICAgICAgICBwYW5pYygiRmFpbGVkIHRvIGFsbG9jYXRlIGh5cGVyY2FsbCBpbnB1dCBw
YWdlIGZvciBDUFUldVxuIiwKPiA+ICsgICAgICAgICAgICAgIHNtcF9wcm9jZXNzb3JfaWQoKSk7
Cj4gCj4gcGFuaWMoKSBpcyBsaWtlbHkgZmluZSBmb3IgdGhlIEJTUCwgYnV0IEkgZG9uJ3QgdGhp
bmsgYW55IEFQIHNob3VsZAo+IGJlIGFibGUgdG8gYnJpbmcgZG93biB0aGUgc3lzdGVtIGJlY2F1
c2Ugb2YgbWVtb3J5IHNob3J0YWdlLiBTdWNoCj4gYW4gQVAgc2hvdWxkIHNpbXBseSBub3QgY29t
ZSBvbmxpbmUuIChFdmVuIGZvciB0aGUgQlNQIHRoZSBxdWVzdGlvbgo+IGlzIHdoZXRoZXIgWGVu
IHdvdWxkIGJlIGFibGUgdG8gcnVuIGRlc3BpdGUgZmFpbHVyZSBoZXJlLikKClRoaXMgaXMgbm8g
ZGlmZmVyZW50IHRoYW4gd2hhdCBpcyBhbHJlYWR5IGRvbmUgZm9yIFhlbiBvbiBYZW4sIGkuZS4K
ZmFpbHVyZSBpbiBzZXR0aW5nIHVwIEFQIGZvciBhbnkgcmVhc29uIGlzIGZhdGFsLgoKc3RhcnRf
c2Vjb25kYXJ5IGRvZXNuJ3QgZXZlbiBoYW5kbGluZyBhbnkgZmFpbHVyZSBieSBpdHNlbGYgb3IK
cHJvcGFnYXRlIGZhaWx1cmUgYmFjayB0byBjYWxsZXIuCgpSZXdpbmRpbmcgaXMgYSBiaXQgY29t
cGxleCwgZ2l2ZW4gdGhhdCB3ZSB3b3VsZCBlbmFibGUgaHlwZXJ2aXNvcgpmZWF0dXJlcyB2ZXJ5
IGVhcmx5LgoKVG8gYWNoaWV2ZSB3aGF0IHlvdSB3YW50IGl0IHdvdWxkIHJlcXVpcmUgcmV3cml0
aW5nIG9mIG90aGVyIHBhcnRzIHRoYXQKYXJlIG91dHNpZGUgb2YgaHlwZXJ2aXNvciBmcmFtZXdv
cmsuCgpXZWkuCgo+IAo+IEphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
