Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04784147BD
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 11:43:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNa6N-0007O9-K5; Mon, 06 May 2019 09:40:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hNa6M-0007CW-5U
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 09:40:02 +0000
X-Inumbo-ID: e499bcfa-6fe2-11e9-8f62-1750f0f7efe6
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e499bcfa-6fe2-11e9-8f62-1750f0f7efe6;
 Mon, 06 May 2019 09:39:50 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 06 May 2019 03:39:49 -0600
Message-Id: <5CD000DC020000780022C1A7@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 06 May 2019 03:39:40 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Chao Gao" <chao.gao@intel.com>
References: <1556601559-30921-1-git-send-email-chao.gao@intel.com>
 <5CC7FFAF020000780022A42A@prv1-mh.provo.novell.com>
 <20190430090120.GA6748@gao-cwp>
 <20190430093033.ncd2ism7n4mvy733@Air-de-Roger>
 <20190430164113.GB20660@gao-cwp>
 <20190502082009.gromld47umko65ld@Air-de-Roger>
 <20190506044439.GA22540@gao-cwp>
In-Reply-To: <20190506044439.GA22540@gao-cwp>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] x86/pt: skip setup of posted format IRTE
 when gvec is 0
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA2LjA1LjE5IGF0IDA2OjQ0LCA8Y2hhby5nYW9AaW50ZWwuY29tPiB3cm90ZToKPiBP
biBUaHUsIE1heSAwMiwgMjAxOSBhdCAxMDoyMDowOUFNICswMjAwLCBSb2dlciBQYXUgTW9ubsOp
IHdyb3RlOgo+PkNhbiB5b3Ugc2VlIGFib3V0IGF2b2lkaW5nIHRoZSBYRU5fRE9NQ1RMX2JpbmRf
cHRfaXJxIGNhbGwgaW4gUUVNVSBpZgo+PnRoZSBpbnRlcnJ1cHQgaXMgZ29pbmcgdG8gYmUgcm91
dGVkIG92ZXIgYW4gZXZlbnQgY2hhbm5lbD8KPiAKPiBZZXMuIEl0IGlzIGRvYWJsZS4gQnV0IGl0
IG5lZWRzIGNoYW5nZXMgaW4gYm90aCBxZW11IGFuZCBYZW4gYW5kIHNvbWUgdHJpY2tzCj4gdG8g
YmUgY29tcGF0aWJsZSB3aXRoIG9sZCBxZW11LgoKVGhhdCB3b3VsZCBiZSB1Z2x5IGluZGVlZC4K
Cj4gSSBwcmVmZXIgbm90IHRvIHRvdWNoIHFlbXUgYW5kIGtlZXAgcWVtdSB1bndhcmUgb2YgTVNJ
J3MgInJvdXRpbmcgb3ZlciBldnRjaG4iLAo+IGxpa2UgdGhlIHBhdGNoIGJlbG93OgoKSXMgdGhp
cyBtZWFudCBhcyBhIHJlcGxhY2VtZW50IHRvIHlvdXIgb3JpZ2luYWwgcGF0Y2gsIG9yIGFzIGFu
CmFkZC1vbj8gSW4gYW55IGV2ZW50IGl0J3Mgbm90IGltbWVkaWF0ZWx5IGNsZWFyIHRvIG1lIGhv
dwouLi4KCj4gLS0tIGEveGVuL2NvbW1vbi9ldmVudF9jaGFubmVsLmMKPiArKysgYi94ZW4vY29t
bW9uL2V2ZW50X2NoYW5uZWwuYwo+IEBAIC01MDQsMTAgKzUwNCw3IEBAIHN0YXRpYyBsb25nIGV2
dGNobl9iaW5kX3BpcnEoZXZ0Y2huX2JpbmRfcGlycV90ICpiaW5kKQo+ICAgICAgaWYgKCAhaW5m
byApCj4gICAgICAgICAgRVJST1JfRVhJVCgtRU5PTUVNKTsKPiAgICAgIGluZm8tPmV2dGNobiA9
IHBvcnQ7Cj4gLSAgICByYyA9ICghaXNfaHZtX2RvbWFpbihkKQo+IC0gICAgICAgICAgPyBwaXJx
X2d1ZXN0X2JpbmQodiwgaW5mbywKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICEhKGJp
bmQtPmZsYWdzICYgQklORF9QSVJRX19XSUxMX1NIQVJFKSkKPiAtICAgICAgICAgIDogMCk7Cj4g
KyAgICByYyA9IHBpcnFfZ3Vlc3RfYmluZCh2LCBpbmZvLCAhIShiaW5kLT5mbGFncyAmIEJJTkRf
UElSUV9fV0lMTF9TSEFSRSkpOwoKLi4uIHRoaXMgYmVjb21pbmcgdW5jb25kaXRpb25hbCB3b24n
dCBjb25mbGljdCB3aXRoIGl0cyBvdGhlcgppbnZvY2F0aW9uIC4uLgoKPiAtLS0gYS94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9pby5jCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW8u
Ywo+IEBAIC0zNDYsNiArMzQ2LDEyIEBAIGludCBwdF9pcnFfY3JlYXRlX2JpbmQoCj4gICAgICAg
ICAgdWludDMyX3QgZ2ZsYWdzID0gcHRfaXJxX2JpbmQtPnUubXNpLmdmbGFncyAmCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgflhFTl9ET01DVExfVk1TSV9YODZfVU5NQVNLRUQ7Cj4gIAo+
ICsgICAgICAgIGlmICggIXB0X2lycV9iaW5kLT51Lm1zaS5ndmVjICkKPiArICAgICAgICB7Cj4g
KyAgICAgICAgICAgIHNwaW5fdW5sb2NrKCZkLT5ldmVudF9sb2NrKTsKPiArICAgICAgICAgICAg
cmV0dXJuIDA7Cj4gKyAgICAgICAgfQoKLi4uIGZ1cnRoZXIgZG93biBpbiB0aGlzIGZ1bmN0aW9u
LCBmb3IgdGhlIG5vbi1NU0kgY2FzZS4KU2ltaWxhcmx5IEkgd29uZGVyIHdoZXRoZXIgdGhlIHJl
c3BlY3RpdmUgdW5iaW5kIGZ1bmN0aW9uCmludm9jYXRpb25zIHRoZW4gd29uJ3QgZ28gKG9yIGFs
cmVhZHkgYXJlPykgb3V0IG9mIHN5bmMuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
