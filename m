Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E5F12F82D
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 13:26:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inLzm-0000I4-03; Fri, 03 Jan 2020 12:24:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1inLzk-0000Hz-Cv
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 12:24:00 +0000
X-Inumbo-ID: e64419a6-2e23-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e64419a6-2e23-11ea-88e7-bc764e2007e4;
 Fri, 03 Jan 2020 12:23:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A2815B191;
 Fri,  3 Jan 2020 12:23:50 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <20191223164329.3113378-1-george.dunlap@citrix.com>
 <20191223164329.3113378-3-george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3bbc0cf9-fd46-23f0-6420-47952a3add52@suse.com>
Date: Fri, 3 Jan 2020 13:24:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191223164329.3113378-3-george.dunlap@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/4] xen: Add 'synthetic' preemption check
 parameter
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTIuMjAxOSAxNzo0MywgR2VvcmdlIER1bmxhcCB3cm90ZToKPiAtLS0gYS9kb2NzL21p
c2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MKPiArKysgYi9kb2NzL21pc2MveGVuLWNvbW1hbmQt
bGluZS5wYW5kb2MKPiBAQCAtNjM2LDEzICs2MzYsMjkgQEAgQXZhaWxhYmxlIGFsdGVybmF0aXZl
cywgd2l0aCB0aGVpciBtZWFuaW5nLCBhcmU6Cj4gIFNwZWNpZnkgdGhlIFVTQiBjb250cm9sbGVy
IHRvIHVzZSwgZWl0aGVyIGJ5IGluc3RhbmNlIG51bWJlciAod2hlbiBnb2luZwo+ICBvdmVyIHRo
ZSBQQ0kgYnVzc2VzIHNlcXVlbnRpYWxseSkgb3IgYnkgUENJIGRldmljZSAobXVzdCBiZSBvbiBz
ZWdtZW50IDApLgo+ICAKPiAtIyMjIGRlYnVnX3N0YWNrX2xpbmVzCj4gKyMjIyBkZWJ1Z1xfc3Rh
Y2tcX2xpbmVzCj4gID4gYD0gPGludGVnZXI+YAo+ICAKPiAgPiBEZWZhdWx0OiBgMjBgCj4gIAo+
ICBMaW1pdHMgdGhlIG51bWJlciBsaW5lcyBwcmludGVkIGluIFhlbiBzdGFjayB0cmFjZXMuCj4g
IAo+ICsjIyMgZGVidWctc3ludGhldGljLXByZWVtcHRpb24KPiArPiBgPSA8aW50ZWdlcj5gCj4g
Kwo+ICs+IERlZmF1bHQ6IGAwYAo+ICsKPiArQXJ0aWZpY2lhbGx5IGluY3JlYXNlcyByYXRlIGF0
IHdoaWNoIGBoeXBlcmNhbGxfcHJlZW1wdF9jaGVjaygpYAo+ICtyZXR1cm5zIGB0cnVlYCwgZm9y
IGRlYnVnZ2luZyBwdXJwb3NlcywgdG8gYSByYXRlIG9mIG9uZSBpbiBgTmAuIChUaGUKPiArZGVm
YXVsdCwgYDBgLCBkaXNhYmxlcyB0aGUgZmVhdHVyZS4pCj4gKwo+ICtXaGVuIHByb21vdGluZyBw
YWdldGFibGVzLCBmb3IgaW5zdGFuY2UsIGBoeXBlcmNhbGxfcHJlZW1wdF9jaGVjaygpYAo+ICtp
cyBjYWxsZWQgYmVmb3JlIHByb2Nlc3NpbmcgZWFjaCBQVEUuICBTaW5jZSB0aGVyZSBhcmUgNTEy
IFBURXMgcGVyCj4gK3BhZ2UsIGEgdmFsdWUgb2YgYDEwMjRgIHNob3VsZCByZXN1bHQgaW4gcGFn
ZXRhYmxlIHByb21vdGlvbiBiZWluZwo+ICtpbnRlcnJ1cHRlZCBldmVyeSBvdGhlciBwYWdlIG9u
IGF2ZXJhZ2UuCgpJZiB0aGlzIGlzIG1lYW50IHRvIGJlIHg4NiBvbmx5LCB0aGVuIHRleHQgaGVy
ZSBzaG91bGQgc3RhdGUgdGhpcy4KT3RoZXJ3aXNlIEkgdGhpbmsgaXQgd291bGQgaGVscCBpZiB0
aGUgZXhhbXBsZSBkZXNjcmliZWQgaW4gdGhlCmxhc3Qgc2VudGVuY2Ugd291bGQgbWVudGlvbiBp
dHMgeDg2IHJlbGF0aW9uc2hpcC4KCj4gLS0tIGEveGVuL2FyY2gveDg2L3RpbWUuYwo+ICsrKyBi
L3hlbi9hcmNoL3g4Ni90aW1lLmMKPiBAQCAtNDMsNiArNDMsMTcgQEAKPiAgc3RhdGljIGNoYXIg
X19pbml0ZGF0YSBvcHRfY2xvY2tzb3VyY2VbMTBdOwo+ICBzdHJpbmdfcGFyYW0oImNsb2Nrc291
cmNlIiwgb3B0X2Nsb2Nrc291cmNlKTsKPiAgCj4gKyNpZm5kZWYgTkRFQlVHCj4gK2ludCBkZWJ1
Z19zeW50aGV0aWNfcHJlZW1wdGlvbiA9IDA7CgpzdGF0aWMgdW5zaWduZWQgaW50IF9fcmVhZF9t
b3N0bHk/Cgo+ICtpbnRlZ2VyX3BhcmFtKCJkZWJ1Zy1zeW50aGV0aWMtcHJlZW1wdGlvbiIsIGRl
YnVnX3N5bnRoZXRpY19wcmVlbXB0aW9uKTsKClBlcmhhcHMgYWxsb3cgY2hhbmdpbmcgYXQgcnVu
dGltZT8KCj4gK2Jvb2wgc3ludGhldGljX3ByZWVtcHRpb25fY2hlY2sodm9pZCkgewoKQnJhY2Ug
cGxhY2VtZW50LgoKPiArICAgIGlmICggZGVidWdfc3ludGhldGljX3ByZWVtcHRpb24gPT0gMCAp
Cj4gKyAgICAgICAgcmV0dXJuIGZhbHNlOwo+ICsgICAgcmV0dXJuICEocmR0c2MoKSAlIGRlYnVn
X3N5bnRoZXRpY19wcmVlbXB0aW9uKTsKClBsZWFzZSBjb25zaXN0ZW50bHkgdXNlIGVpdGhlciAh
IG9yICI9PSAwIi4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
