Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA81E129EC
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 10:31:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMTY3-0006Pw-BI; Fri, 03 May 2019 08:28:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMTY1-0006Pr-Uy
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 08:28:01 +0000
X-Inumbo-ID: 5744ef58-6d7d-11e9-aee7-5324f3233faa
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5744ef58-6d7d-11e9-aee7-5324f3233faa;
 Fri, 03 May 2019 08:27:52 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 03 May 2019 02:27:50 -0600
Message-Id: <5CCBFB86020000780022B889@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 03 May 2019 02:27:50 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Tamas K Lengyel" <tamas@tklengyel.com>
References: <20190502221345.18459-1-tamas@tklengyel.com>
 <20190502221345.18459-2-tamas@tklengyel.com>
In-Reply-To: <20190502221345.18459-2-tamas@tklengyel.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v4 2/4] x86/mem_sharing: copy a page_lock
 version to be internal to memshr
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAzLjA1LjE5IGF0IDAwOjEzLCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKPiArKysgYi94ZW4vYXJjaC94ODYv
bW0vbWVtX3NoYXJpbmcuYwo+IEBAIC0xMTIsMTMgKzExMiw0OCBAQCBzdGF0aWMgaW5saW5lIHZv
aWQgcGFnZV9zaGFyaW5nX2Rpc3Bvc2Uoc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSkKPiAgCj4gICNl
bmRpZiAvKiBNRU1fU0hBUklOR19BVURJVCAqLwo+ICAKPiAtc3RhdGljIGlubGluZSBpbnQgbWVt
X3NoYXJpbmdfcGFnZV9sb2NrKHN0cnVjdCBwYWdlX2luZm8gKnBnKQo+ICsvKgo+ICsgKiBQcml2
YXRlIGltcGxlbWVudGF0aW9ucyBvZiBwYWdlX2xvY2svdW5sb2NrIHRvIGJ5cGFzcyBQVi1vbmx5
Cj4gKyAqIHNhbml0eSBjaGVja3Mgbm90IGFwcGxpY2FibGUgdG8gbWVtLXNoYXJpbmcuCj4gKyAq
Lwo+ICtzdGF0aWMgaW5saW5lIGJvb2wgX3BhZ2VfbG9jayhzdHJ1Y3QgcGFnZV9pbmZvICpwYWdl
KQo+ICB7Cj4gLSAgICBpbnQgcmM7Cj4gKyAgICB1bnNpZ25lZCBsb25nIHgsIG54Owo+ICsKPiAr
ICAgIGRvIHsKPiArICAgICAgICB3aGlsZSAoICh4ID0gcGFnZS0+dS5pbnVzZS50eXBlX2luZm8p
ICYgUEdUX2xvY2tlZCApCj4gKyAgICAgICAgICAgIGNwdV9yZWxheCgpOwo+ICsgICAgICAgIG54
ID0geCArICgxIHwgUEdUX2xvY2tlZCk7Cj4gKyAgICAgICAgaWYgKCAhKHggJiBQR1RfdmFsaWRh
dGVkKSB8fAo+ICsgICAgICAgICAgICAgISh4ICYgUEdUX2NvdW50X21hc2spIHx8Cj4gKyAgICAg
ICAgICAgICAhKG54ICYgUEdUX2NvdW50X21hc2spICkKPiArICAgICAgICAgICAgcmV0dXJuIGZh
bHNlOwoKSnVzdCBmb3IgbXkgb3duIHVuZGVyc3RhbmRpbmc6IERpZCB5b3UgdmVyaWZ5IHRoYXQg
dGhlIFBHVF92YWxpZGF0ZWQKY2hlY2sgaXMgaW5kZWVkIG5lZWRlZCBoZXJlLCBvciBkaWQgeW91
IGNvcHkgaXQgImp1c3QgaW4gY2FzZSI/IEluIHRoZQpsYXR0ZXIgY2FzZSBhIGNvbW1lbnQgbWF5
IGJlIHdvcnRod2hpbGUuCgpGdXJ0aGVybW9yZSwgYXJlIHRoZXJlIGFueSBtZW0tc2hhcmluZyBz
cGVjaWZpYyBjaGVja3MgcmVhc29uYWJsZQp0byBkbyBoZXJlIGluIHBsYWNlIG9mIHRoZSBQViBv
bmVzIHlvdSB3YW50IHRvIGF2b2lkPyBMaWtlIHBhZ2VzCm1ha2luZyBpdCBoZXJlIG9ubHkgZXZl
ciBiZWluZyBvZiBQR1Rfc2hhcmVkX3BhZ2UgdHlwZT8KCj4gLS0tIGEveGVuL2luY2x1ZGUvYXNt
LXg4Ni9tbS5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oCj4gQEAgLTM1NiwyNCAr
MzU2LDEyIEBAIHN0cnVjdCBwbGF0Zm9ybV9iYWRfcGFnZSB7Cj4gIGNvbnN0IHN0cnVjdCBwbGF0
Zm9ybV9iYWRfcGFnZSAqZ2V0X3BsYXRmb3JtX2JhZHBhZ2VzKHVuc2lnbmVkIGludCAKPiAqYXJy
YXlfc2l6ZSk7Cj4gIAo+ICAvKiBQZXIgcGFnZSBsb2NrczoKPiAtICogcGFnZV9sb2NrKCkgaXMg
dXNlZCBmb3IgdHdvIHB1cnBvc2VzOiBwdGUgc2VyaWFsaXphdGlvbiwgYW5kIG1lbW9yeSBzaGFy
aW5nLgo+ICsgKiBwYWdlX2xvY2soKSBpcyB1c2VkIGZvciBwdGUgc2VyaWFsaXphdGlvbi4KPiAg
ICoKPiAgICogQWxsIHVzZXJzIG9mIHBhZ2UgbG9jayBmb3IgcHRlIHNlcmlhbGl6YXRpb24gbGl2
ZSBpbiBtbS5jLCB1c2UgaXQKPiAgICogdG8gbG9jayBhIHBhZ2UgdGFibGUgcGFnZSBkdXJpbmcg
cHRlIHVwZGF0ZXMsIGRvIG5vdCB0YWtlIG90aGVyIGxvY2tzIGl0aGluCj4gICAqIHRoZSBjcml0
aWNhbCBzZWN0aW9uIGRlbGltaXRlZCBieSBwYWdlX2xvY2svdW5sb2NrLCBhbmQgcGVyZm9ybSBu
bwo+ICAgKiBuZXN0aW5nLgo+IC0gKgo+IC0gKiBBbGwgdXNlcnMgb2YgcGFnZSBsb2NrIGZvciBt
ZW1vcnkgc2hhcmluZyBsaXZlIGluIG1tL21lbV9zaGFyaW5nLmMuIFBhZ2VfbG9jawo+IC0gKiBp
cyB1c2VkIGluIG1lbW9yeSBzaGFyaW5nIHRvIHByb3RlY3QgYWRkaXRpb24gKHNoYXJlKSBhbmQg
cmVtb3ZhbCAodW5zaGFyZSkKPiAtICogb2YgKGdmbixkb21haW4pIHR1cHBsZXMgdG8gYSBsaXN0
IG9mIGdmbidzIHRoYXQgdGhlIHNoYXJlZCBwYWdlIGlzIGN1cnJlbnRseQo+IC0gKiBiYWNraW5n
LiBOZXN0aW5nIG1heSBoYXBwZW4gd2hlbiBzaGFyaW5nIChhbmQgbG9ja2luZykgdHdvIHBhZ2Vz
IC0tIGRlYWRsb2NrCj4gLSAqIGlzIGF2b2lkZWQgYnkgbG9ja2luZyBwYWdlcyBpbiBpbmNyZWFz
aW5nIG9yZGVyLgo+IC0gKiBBbGwgbWVtb3J5IHNoYXJpbmcgY29kZSBwYXRocyB0YWtlIHRoZSBw
Mm0gbG9jayBvZiB0aGUgYWZmZWN0ZWQgZ2ZuIGJlZm9yZQo+IC0gKiB0YWtpbmcgdGhlIGxvY2sg
Zm9yIHRoZSB1bmRlcmx5aW5nIHBhZ2UuIFdlIGVuZm9yY2Ugb3JkZXJpbmcgYmV0d2VlbiBwYWdl
X2xvY2sKPiAtICogYW5kIHAybV9sb2NrIHVzaW5nIGFuIG1tLWxvY2tzLmggY29uc3RydWN0Lgo+
IC0gKgo+IC0gKiBUaGVzZSB0d28gdXNlcnMgKHB0ZSBzZXJpYWxpemF0aW9uIGFuZCBtZW1vcnkg
c2hhcmluZykgZG8gbm90IGNvbGxpZGUsIHNpbmNlCj4gLSAqIHNoYXJpbmcgaXMgb25seSBzdXBw
b3J0ZWQgZm9yIGh2bSBndWVzdHMsIHdoaWNoIGRvIG5vdCBwZXJmb3JtIHB2IHB0ZSB1cGRhdGVz
Lgo+ICAgKi8KPiAgaW50IHBhZ2VfbG9jayhzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlKTsKPiAgdm9p
ZCBwYWdlX3VubG9jayhzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlKTsKCkkgdGhpbmsgaXQgd291bGQg
YmUgaGVscGZ1bCB0byByZXRhaW4gKGluIGEgc2xpZ2h0bHkgYWRqdXN0ZWQgZm9ybSkgdGhlIGxh
c3QKc2VudGVuY2Ugb2YgdGhlIGNvbW1lbnQgYWJvdmUsIHRvIGNsYXJpZnkgdGhhdCB0aGUgUEdU
X2xvY2tlZCB1c2VzCmFyZSBub3cgd2hhdCBkb2VzIG5vdCBlbmQgdXAgY29sbGlkaW5nLiBBdCB0
aGlzIG9jY2FzaW9uICJ3aGljaCBkbyBub3QKcGVyZm9ybSBwdiBwdGUgdXBkYXRlcyIgd291bGQg
YWxzbyBiZXR0ZXIgYmUgcmUtd29yZGVkIHRvIGUuZy4KIndoaWNoIGRvIG5vdCBoYXZlIFBWIFBU
RXMgdXBkYXRlZCIgKGFzIFBWSCBEb20wIGlzIHZlcnkgbXVjaApleHBlY3RlZCB0byBpc3N1ZSBQ
ViBwYWdlIHRhYmxlIG9wZXJhdGlvbnMgZm9yIFBWIERvbVUtcykuCgpKYW4KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
