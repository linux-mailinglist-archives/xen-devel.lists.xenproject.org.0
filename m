Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EF524BF2
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 11:45:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hT1It-0001NA-SR; Tue, 21 May 2019 09:43:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7C/d=TV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hT1Is-0001N1-3J
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 09:43:26 +0000
X-Inumbo-ID: df8e1582-7bac-11e9-ba86-0f33eaa59d6c
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df8e1582-7bac-11e9-ba86-0f33eaa59d6c;
 Tue, 21 May 2019 09:43:23 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 21 May 2019 03:43:22 -0600
Message-Id: <5CE3C8370200007800230E40@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 21 May 2019 03:43:19 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <20190520181250.17404-1-julien.grall@arm.com>
 <5CE3C45A0200007800230E0E@prv1-mh.provo.novell.com>
 <1c7f43ce-7df2-24c9-ecb2-d8be1afebfa5@arm.com>
In-Reply-To: <1c7f43ce-7df2-24c9-ecb2-d8be1afebfa5@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] xen/public: arch-arm: Restrict the
 visibility of struct vcpu_guest_core_regs
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIxLjA1LjE5IGF0IDExOjM1LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDUvMjEvMTkgMTA6MjYgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyMC4wNS4x
OSBhdCAyMDoxMiwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+ICAgICAgQXMgdGhp
cyBpcyBub3cgWGVuIGFuZCB0b29scyBvbmx5LCBJIGFtIHdvbmRlcmluZyB3aGV0aGVyIHRoZSBj
aGVjayBvbgo+Pj4gICAgICBHTlVfQyBpcyBzdGlsbCBuZWNlc3NhcnkuIEkgYW0gaGFwcHkgdG8g
c2VuZCBhIGZvbGxvdy11cCBwYXRjaCAob3IgZm9sZAo+Pj4gICAgICBpbiB0aGlzIG9uZSkgaWYg
aXQgY2FuIGJlIHJlbW92ZWQuCj4+IAo+PiBJIHRoaW5rIHRoaXMgc2hvdWxkIGJlIGRyb3BwZWQg
aWYgaXQgY2FuIGJlIHdpdGhvdXQgYnJlYWtpbmcgYW55Cj4+IHBhcnQgb2YgdGhlIGJ1aWxkLgo+
IFRoaXMgaXMgYmVjYXVzZSBhbGwgdGhlIHRvb2xzIGFyZSBwYXJ0IG9mIHhlbi5naXQsIHJpZ2h0
PwoKUmlnaHQgLSBuby1vbmUgZWxzZSBpcyBzdXBwb3NlZCB0byBkZWZpbmUgX19YRU5fVE9PTFNf
Xywgb3IKaWYgYW55b25lIGRvZXMsIHRoZXkncmUgb24gdGhlaXIgb3duLgoKPj4+IC0tLSBhL3hl
bi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oCj4+PiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMv
YXJjaC1hcm0uaAo+Pj4gQEAgLTE5Nyw2ICsxOTcsNyBAQAo+Pj4gICAgICAgfSB3aGlsZSAoIDAg
KQo+Pj4gICAjZGVmaW5lIHNldF94ZW5fZ3Vlc3RfaGFuZGxlKGhuZCwgdmFsKSBzZXRfeGVuX2d1
ZXN0X2hhbmRsZV9yYXcoaG5kLCB2YWwpCj4+PiAgIAo+Pj4gKyNpZiBkZWZpbmVkKF9fWEVOX18p
IHx8IGRlZmluZWQoX19YRU5fVE9PTFNfXykKPj4+ICAgI2lmIGRlZmluZWQoX19HTlVDX18pICYm
ICFkZWZpbmVkKF9fU1RSSUNUX0FOU0lfXykKPj4+ICAgLyogQW5vbnltb3VzIHVuaW9uIGluY2x1
ZGVzIGJvdGggMzItIGFuZCA2NC1iaXQgbmFtZXMgKGUuZy4sIHIwL3gwKS4gKi8KPj4+ICAgIyBk
ZWZpbmUgX19ERUNMX1JFRyhuNjQsIG4zMikgdW5pb24geyAgICAgICAgICBcCj4+PiBAQCAtMjcy
LDYgKzI3Myw4IEBAIERFRklORV9YRU5fR1VFU1RfSEFORExFKHZjcHVfZ3Vlc3RfY29yZV9yZWdz
X3QpOwo+Pj4gICAKPj4+ICAgI3VuZGVmIF9fREVDTF9SRUcKPj4+ICAgCj4+PiArI2VuZGlmCj4+
IAo+PiBJZiBJIHdhcyB0aGUgbWFpbnRhaW5lciBvZiB0aGlzIGNvZGUsIEknZCBhc2sgZm9yIHRo
ZSBzdHJ1Y3QgZGVjbGFyYXRpb24KPj4gdG8gYmUgbW92ZWQgKGludG8gdGhlIGV4aXN0aW5nICNp
ZikgcmF0aGVyIHRoYW4gYWRkaW5nIGEgMm5kICNpZi4KPiAKPiBzLzJuZC8zcmQvIDspCj4gCj4g
VGhlIHJlYXNvbiBJIGhhdmVuJ3QgZG9uZSB0aGF0IGlzIGdpdCB3aWxsIGdlbmVyYXRlIGEgY29t
cGxldGVseSAKPiB1bnJlbGF0ZWQgZGlmZi4gU28gaXQgbWFrZXMgcXVpdGUgZGlmZmljdWx0IHRv
IHVuZGVyc3RhbmQgdGhlIHB1cnBvc2Ugb2YgCj4gdGhlIHBhdGNoLgoKV2VsbCwgYXMgc2FpZCAt
IHlvdSdyZSB0aGUgbWFpbnRhaW5lci4gSSB3b3VsZG4ndCBiZSBib3RoZXJlZCBvdmVybHkKbXVj
aCBieSBhIHN0cmFuZ2UgZGlmZiB0aGF0IG1pZ2h0IHJlc3VsdC4KCkphbgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
