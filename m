Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E5D17FEDD
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 14:42:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBf6q-0004Lx-Jw; Tue, 10 Mar 2020 13:39:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1SqT=43=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jBf6p-0004Lp-3K
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 13:39:47 +0000
X-Inumbo-ID: 9ae9b8fe-62d4-11ea-bec1-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ae9b8fe-62d4-11ea-bec1-bc764e2007e4;
 Tue, 10 Mar 2020 13:39:46 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jBf6m-00080X-Nm; Tue, 10 Mar 2020 13:39:44 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jBf6m-0004A7-EA; Tue, 10 Mar 2020 13:39:44 +0000
Date: Tue, 10 Mar 2020 13:39:40 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200310133940.vuvnn664ysg6d7gz@debian>
References: <20200219114411.26922-1-liuwe@microsoft.com>
 <20200219114411.26922-2-liuwe@microsoft.com>
 <26c31c83-c2d5-1379-9055-dd802c51d02b@suse.com>
 <20200309172552.i273f2re4y6uuklr@debian>
 <3864acf5-aa3e-7849-56e4-11d7cace70db@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3864acf5-aa3e-7849-56e4-11d7cace70db@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v4 1/3] x86/hypervisor: pass flags to
 hypervisor_flush_tlb
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
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXIgMTAsIDIwMjAgYXQgMTA6NTg6MDlBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDkuMDMuMjAyMCAxODoyNSwgV2VpIExpdSB3cm90ZToKPiA+IE9uIE1vbiwgTWFy
IDA5LCAyMDIwIGF0IDA1OjM4OjEyUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+IE9u
IDE5LjAyLjIwMjAgMTI6NDQsIFdlaSBMaXUgd3JvdGU6Cj4gPj4+IC0tLSBhL3hlbi9pbmNsdWRl
L2FzbS14ODYvZmx1c2h0bGIuaAo+ID4+PiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2ZsdXNo
dGxiLmgKPiA+Pj4gQEAgLTEyMyw2ICsxMjMsOSBAQCB2b2lkIHN3aXRjaF9jcjNfY3I0KHVuc2ln
bmVkIGxvbmcgY3IzLCB1bnNpZ25lZCBsb25nIGNyNCk7Cj4gPj4+ICAgLyogRmx1c2ggYWxsIEhW
TSBndWVzdHMgbGluZWFyIFRMQiAodXNpbmcgQVNJRC9WUElEKSAqLwo+ID4+PiAgI2RlZmluZSBG
TFVTSF9HVUVTVFNfVExCIDB4NDAwMAo+ID4+PiAgCj4gPj4+ICsjZGVmaW5lIEZMVVNIX1RMQl9G
TEFHU19NQVNLIChGTFVTSF9UTEIgfCBGTFVTSF9UTEJfR0xPQkFMIHwgRkxVU0hfVkFfVkFMSUQg
fCBcCj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBGTFVTSF9PUkRFUl9NQVNL
KQo+ID4+Cj4gPj4gSSBkb24ndCB0aGluayBGTFVTSF9PUkRFUl9NQVNLIHNob3VsZCBiZSBwYXJ0
IG9mIHRoaXMsIGFzIGl0J3Mgbm90Cj4gPj4gZXhjbHVzaXZlbHkgVExCLWZsdXNoIHJlbGF0ZWQu
Cj4gPiAKPiA+IE15IGludGVudGlvbiB3YXMgdG8gY2FwdHVyZSBhbGwgZmxhZ3MgcGVydGluZW50
IHRvIFRMQiBmbHVzaGVzLiBJIGRpZG4ndAo+ID4gbWVhbiB0aGV5IHdlcmUgZXhjbHVzaXZlbHkg
VExCIGZsdXNoIHJlbGF0ZWQuCj4gCj4gVGhhdCdzIHdoYXQgSSB1bmRlcnN0b29kLCBidXQgdGhl
IHJlc3VsdCBpcyBsZWFkaW5nIHRvIHBvc3NpYmxlIGFtYmlndWl0eS4KPiBUaGlua2luZyBhYm91
dCBpdCBhZ2FpbiwgLi4uCj4gCj4gPiBJIGNhbiByZW1vdmUgdGhlIG9yZGVyIG1hc2sgZnJvbSB0
aGUgbGlzdCBvZiBmbGFncy4gTm90IGEgYmlnIGRlYWwuCj4gCj4gLi4uIEknbSBhZnJhaWQgSSBh
bHNvIGhhdmUgdG8gYXNrIGZvciBGTFVTSF9WQV9WQUxJRCB0byBiZSBkcm9wcGVkLAo+IGFzIHRo
YXQgb25lJ3Mgbm90IFRMQiBmbHVzaCByZWxhdGVkIGF0IGFsbC4gSW5zdGVhZCBpdCBpZGVudGlm
aWVzCj4gd2hldGhlciB0aGUgbGluZWFyIGFkZHJlc3MgcHJvdmlkZWQgX3N0aWxsIGhhc18gYSB2
YWxpZCBtYXBwaW5nCj4gKHJhdGhlciB0aGFuIHRoZXJlIGJlaW5nIGFuIGFkZHJlc3MgcHJvdmlk
ZWQgYXQgYWxsKSwgc3VjaCB0aGF0Cj4gQ0xGTFVTSCBiYXNlcyBjYWNoZSBmbHVzaGluZyB3b3Vs
ZCBiZSB1c2FibGUuIEF0IHRoYXQgcG9pbnQgSQo+IHdvbmRlciB3aGV0aGVyIHRoZSBzZXBhcmF0
ZSBjb25zdGFudCBpcyBzdGlsbCBvZiBtdWNoIHVzZSBhdCBhbGwuCgpTdXJlLCBJIGRvbid0IG1p
bmQgZHJvcHBpbmcgaXQgYWx0b2dldGhlci4KCldlaS4KCj4gCj4gSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
