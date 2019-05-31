Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7772930E8D
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 15:10:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWhFS-0007Ji-Q1; Fri, 31 May 2019 13:07:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hWhFQ-0007Jb-Ut
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 13:07:04 +0000
X-Inumbo-ID: fb6924b2-83a4-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fb6924b2-83a4-11e9-8980-bc764e045a96;
 Fri, 31 May 2019 13:07:03 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 31 May 2019 07:07:02 -0600
Message-Id: <5CF126F3020000780023403A@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 31 May 2019 07:06:59 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Juergen Gross" <jgross@suse.com>
References: <20190531115303.16459-1-jgross@suse.com>
In-Reply-To: <20190531115303.16459-1-jgross@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2] xen: remove on-stack cpumask from
 stop_machine_run()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDMxLjA1LjE5IGF0IDEzOjUzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBUaGUg
ImFsbGJ1dHNlbGYiIGNwdW1hc2sgaW4gc3RvcF9tYWNoaW5lX3J1bigpIGlzIG5vdCBuZWVkZWQu
IEluc3RlYWQKPiBvZiBhbGxvY2F0aW5nIGl0IG9uIHRoZSBzdGFjayBpdCBjYW4gZWFzaWx5IGJl
IGF2b2lkZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4Kd2l0aCBv
bmUgZnVydGhlciByZW1hcms6Cgo+IC0tLSBhL3hlbi9jb21tb24vc3RvcF9tYWNoaW5lLmMKPiAr
KysgYi94ZW4vY29tbW9uL3N0b3BfbWFjaGluZS5jCj4gQEAgLTY5LDggKzY5LDggQEAgc3RhdGlj
IHZvaWQgc3RvcG1hY2hpbmVfd2FpdF9zdGF0ZSh2b2lkKQo+ICAKPiAgaW50IHN0b3BfbWFjaGlu
ZV9ydW4oaW50ICgqZm4pKHZvaWQgKiksIHZvaWQgKmRhdGEsIHVuc2lnbmVkIGludCBjcHUpCj4g
IHsKPiAtICAgIGNwdW1hc2tfdCBhbGxidXRzZWxmOwo+ICAgICAgdW5zaWduZWQgaW50IGksIG5y
X2NwdXM7Cj4gKyAgICB1bnNpZ25lZCBpbnQgdGhpcyA9IHNtcF9wcm9jZXNzb3JfaWQoKTsKPiAg
ICAgIGludCByZXQ7Cj4gIAo+ICAgICAgQlVHX09OKCFsb2NhbF9pcnFfaXNfZW5hYmxlZCgpKTsK
PiBAQCAtNzksOSArNzksOSBAQCBpbnQgc3RvcF9tYWNoaW5lX3J1bihpbnQgKCpmbikodm9pZCAq
KSwgdm9pZCAqZGF0YSwgdW5zaWduZWQgaW50IGNwdSkKPiAgICAgIGlmICggIWdldF9jcHVfbWFw
cygpICkKPiAgICAgICAgICByZXR1cm4gLUVCVVNZOwo+ICAKPiAtICAgIGNwdW1hc2tfYW5kbm90
KCZhbGxidXRzZWxmLCAmY3B1X29ubGluZV9tYXAsCj4gLSAgICAgICAgICAgICAgICAgICBjcHVt
YXNrX29mKHNtcF9wcm9jZXNzb3JfaWQoKSkpOwo+IC0gICAgbnJfY3B1cyA9IGNwdW1hc2tfd2Vp
Z2h0KCZhbGxidXRzZWxmKTsKPiArICAgIG5yX2NwdXMgPSBudW1fb25saW5lX2NwdXMoKTsKPiAr
ICAgIGlmICggY3B1X29ubGluZSh0aGlzKSApCj4gKyAgICAgICAgbnJfY3B1cy0tOwo+ICAKPiAg
ICAgIC8qIE11c3Qgbm90IHNwaW4gaGVyZSBhcyB0aGUgaG9sZGVyIHdpbGwgZXhwZWN0IHVzIHRv
IGJlIGRlc2NoZWR1bGVkLiAqLwo+ICAgICAgaWYgKCAhc3Bpbl90cnlsb2NrKCZzdG9wbWFjaGlu
ZV9sb2NrKSApCj4gQEAgLTEwMCw4ICsxMDAsOSBAQCBpbnQgc3RvcF9tYWNoaW5lX3J1bihpbnQg
KCpmbikodm9pZCAqKSwgdm9pZCAqZGF0YSwgdW5zaWduZWQgaW50IGNwdSkKPiAgCj4gICAgICBz
bXBfd21iKCk7Cj4gIAo+IC0gICAgZm9yX2VhY2hfY3B1ICggaSwgJmFsbGJ1dHNlbGYgKQo+IC0g
ICAgICAgIHRhc2tsZXRfc2NoZWR1bGVfb25fY3B1KCZwZXJfY3B1KHN0b3BtYWNoaW5lX3Rhc2ts
ZXQsIGkpLCBpKTsKPiArICAgIGZvcl9lYWNoX29ubGluZV9jcHUgKCBpICkKPiArICAgICAgICBp
ZiAoIGkgIT0gdGhpcyApCj4gKyAgICAgICAgICAgIHRhc2tsZXRfc2NoZWR1bGVfb25fY3B1KCZw
ZXJfY3B1KHN0b3BtYWNoaW5lX3Rhc2tsZXQsIGkpLCBpKTsKPiAgCj4gICAgICBzdG9wbWFjaGlu
ZV9zZXRfc3RhdGUoU1RPUE1BQ0hJTkVfUFJFUEFSRSk7Cj4gICAgICBzdG9wbWFjaGluZV93YWl0
X3N0YXRlKCk7CgpBIGZldyBsaW5lcyBkb3duIGZyb20gaGVyZSB0aGVyZSdzIGFub3RoZXIgdXNl
IG9mIHNtcF9wcm9jZXNzb3JfaWQoKS4KSWYgSSBlbmQgdXAgY29tbWl0dGluZyB0aGlzIEkgbWF5
IHRha2UgdGhlIGxpYmVydHkgYW5kIGFsc28gY2hhbmdlIHRoYXQKdG8gInRoaXMiLCB1bmxlc3Mg
eW91IG9iamVjdC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
