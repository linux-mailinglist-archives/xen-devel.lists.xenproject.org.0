Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9074E083
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 08:27:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heCy8-0007rr-RG; Fri, 21 Jun 2019 06:24:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1heCy7-0007rm-Mv
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 06:24:15 +0000
X-Inumbo-ID: 2f0e37ba-93ed-11e9-a6a1-670d4d76f86c
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2f0e37ba-93ed-11e9-a6a1-670d4d76f86c;
 Fri, 21 Jun 2019 06:24:12 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 21 Jun 2019 00:24:11 -0600
Message-Id: <5D0C78070200007800239EF8@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 21 Jun 2019 00:24:07 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <20190619110250.18881-1-roger.pau@citrix.com>
 <20190619110250.18881-5-roger.pau@citrix.com>
 <5D0A33E40200007800239AE3@prv1-mh.provo.novell.com>
 <20190619144020.z6ibrkicmtoo3nl3@MacBook-Air-de-Roger.local>
In-Reply-To: <20190619144020.z6ibrkicmtoo3nl3@MacBook-Air-de-Roger.local>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 4/4] x86: check for multiboot{1,
 2} header presence
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, WeiLiu <wl@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE5LjA2LjE5IGF0IDE2OjQwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgSnVuIDE5LCAyMDE5IGF0IDA3OjA4OjUyQU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTkuMDYuMTkgYXQgMTM6MDIsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gQWZ0ZXIgYnVpbGRpbmcgdGhlIGh5cGVydmlzb3IgYmluYXJ5LiBOb3RlIHRo
YXQgdGhlIGNoZWNrIGlzIHBlcmZvcm1lZAo+PiA+IGJ5IHNlYXJjaGluZyBmb3IgdGhlIG1hZ2lj
IGhlYWRlciB2YWx1ZSBhdCB0aGUgc3RhcnQgb2YgdGhlIGJpbmFyeS4KPj4gPiAKPj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4gPiAt
LS0KPj4gPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiA+IENjOiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+PiA+IENjOiBXZWkgTGl1IDx3
bEB4ZW4ub3JnPgo+PiA+IC0tLQo+PiA+ICB4ZW4vYXJjaC94ODYvTWFrZWZpbGUgfCAzICsrKwo+
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4+ID4gCj4+ID4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZSBiL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQo+PiA+IGlu
ZGV4IDhhOGQ4ZjA2MGYuLjliYjNiZjZlNmMgMTAwNjQ0Cj4+ID4gLS0tIGEveGVuL2FyY2gveDg2
L01ha2VmaWxlCj4+ID4gKysrIGIveGVuL2FyY2gveDg2L01ha2VmaWxlCj4+ID4gQEAgLTEwMiw2
ICsxMDIsOSBAQCAKPj4gPiBzeW1zLXdhcm4tZHVwLSQoQ09ORklHX1NVUFBSRVNTX0RVUExJQ0FU
RV9TWU1CT0xfV0FSTklOR1MpIDo9Cj4+ID4gICQoVEFSR0VUKTogJChUQVJHRVQpLXN5bXMgJChl
ZmkteSkgYm9vdC9ta2VsZjMyCj4+ID4gIAkuL2Jvb3QvbWtlbGYzMiAkKG5vdGVzX3BoZHJzKSAk
KFRBUkdFVCktc3ltcyAkKFRBUkdFVCkgJChYRU5fSU1HX09GRlNFVCkgXAo+PiA+ICAJICAgICAg
ICAgICAgICAgYCQoTk0pICQoVEFSR0VUKS1zeW1zIHwgc2VkIC1uZSAncy9eXChbXiBdKlwpIC4g
Cj4gX18yTV9yd2RhdGFfZW5kJCQvMHhcMS9wJ2AKPj4gPiArCSMgQ2hlY2sgZm9yIG11bHRpYm9v
dHsxLDJ9IGhlYWRlcnMKPj4gPiArCW9kIC10IHg0IC1OIDgxOTIgJChUQVJHRVQpIHwgZ3JlcCAx
YmFkYjAwMiA+IC9kZXYvbnVsbAo+PiA+ICsJb2QgLXQgeDQgLU4gMzI3NjggJChUQVJHRVQpIHwg
Z3JlcCBlODUyNTBkNiA+IC9kZXYvbnVsbAo+PiAKPj4gV2hhdCdzIHRoZSBiZWhhdmlvciB3aGVu
IGEgc2lnbmF0dXJlIGlzIF9ub3QgXyBmb3VuZD8gV2lsbAo+PiAkKFRBUkdFVCkgZ2V0IGRlbGV0
ZWQgKGJ5IG1ha2UpPyBJIGRvbid0IHRoaW5rIGl0IHdvdWxkIChhcyB3ZQo+PiBkb24ndCBzcGVj
aWZpYyAuREVMRVRFX09OX0VSUk9SIGFueXdoZXJlKSwgc28gYSBzdWJzZXF1ZW50Cj4+IHJlYnVp
bGQgbWF5IG5vdCBldmVuIGV4ZWN1dGUgdGhpcyBydWxlLCBhbmQgaGVuY2UgbWF5IGxvb2sgdG8g
YmUKPj4gc3VjY2Vzc2Z1bCBkZXNwaXRlIGl0IG5vdCBhY3R1YWxseSBoYXZpbmcgYmVlbi4KPiAK
PiBPaCwgcmlnaHQuIEl0IHNob3VsZCBiZToKPiAKPiBvZCAtdCB4NCAtTiA4MTkyICQoVEFSR0VU
KSB8IGdyZXAgMWJhZGIwMDIgPiAvZGV2L251bGwgfHwgKHJtIC1yZiAkKFRBUkdFVCk7IGV4aXQg
MSkKPiBvZCAtdCB4NCAtTiAzMjc2OCAkKFRBUkdFVCkgfCBncmVwIGU4NTI1MGQ2ID4gL2Rldi9u
dWxsIHx8IChybSAtcmYgJChUQVJHRVQpOyBleGl0IDEpCj4gCj4gV291bGQgeW91IGJlIE9LIHdp
dGggdGhlIGFib3ZlIHJ1bmVzPwoKTm90IHJlYWxseSwgSSdtIGFmcmFpZC4gVGhpcyBzdGlsbCB3
b3VsZG4ndCBjb3BlIHdpdGggYW4gaW50ZXJydXB0ZWQKYnVpbGQuIEkgdGhpbmsgaXQgbmVlZHMg
dG8gYmUgbWFkZSB3b3JrIHZpYSBhbiBpbnRlcm1lZGlhdGUgdGFyZ2V0LApvciBzb21lIG90aGVy
IG1ha2UgdHJpY2tlcnkuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
