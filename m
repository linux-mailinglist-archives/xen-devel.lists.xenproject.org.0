Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE9D4E08A
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 08:37:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heD7s-0000FM-TQ; Fri, 21 Jun 2019 06:34:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1heD7r-0000FH-GK
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 06:34:19 +0000
X-Inumbo-ID: 98581af4-93ee-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 98581af4-93ee-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 06:34:18 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 21 Jun 2019 00:34:17 -0600
Message-Id: <5D0C7A650200007800239F04@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 21 Jun 2019 00:34:13 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <20190619110250.18881-1-roger.pau@citrix.com>
 <20190619110250.18881-4-roger.pau@citrix.com>
 <5D0A31210200007800239AC0@prv1-mh.provo.novell.com>
 <20190619150631.5dhiozx4bybqjbrl@MacBook-Air-de-Roger.local>
In-Reply-To: <20190619150631.5dhiozx4bybqjbrl@MacBook-Air-de-Roger.local>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 3/4] x86/linker: add a reloc section to ELF
 binary
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
 Daniel Kiper <daniel.kiper@oracle.com>, WeiLiu <wl@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE5LjA2LjE5IGF0IDE3OjA2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgSnVuIDE5LCAyMDE5IGF0IDA2OjU3OjA1QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTkuMDYuMTkgYXQgMTM6MDIsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gSWYgdGhlIGh5cGVydmlzb3IgaGFzIGJlZW4gYnVpbHQgd2l0aCBFRkkgc3Vw
cG9ydCAoaWU6IG11bHRpYm9vdDIpLgo+PiA+IFRoaXMgYWxsb3dzIHRvIHBvc2l0aW9uIHRoZSAu
cmVsb2Mgc2VjdGlvbiBjb3JyZWN0bHkgaW4gdGhlIG91dHB1dAo+PiA+IGJpbmFyeSwgb3IgZWxz
ZSB0aGUgbGlua2VyIG1pZ2h0IHBsYWNlIC5yZWxvYyBiZWZvcmUgdGhlIC50ZXh0Cj4+ID4gc2Vj
dGlvbi4KPj4gPiAKPj4gPiBOb3RlIHRoYXQgdGhlIC5yZWxvYyBzZWN0aW9uIGlzIG1vdmVkIGJl
Zm9yZSAuYnNzIGZvciB0d28gcmVhc29uczogaW4KPj4gPiBvcmRlciBmb3IgdGhlIHJlc3VsdGlu
ZyBiaW5hcnkgdG8gbm90IGNvbnRhaW4gYW55IHNlY3Rpb24gd2l0aCBkYXRhCj4+ID4gYWZ0ZXIg
LmJzcywgc28gdGhhdCB0aGUgZmlsZSBzaXplIGNhbiBiZSBzbWFsbGVyIHRoYW4gdGhlIGxvYWRl
ZAo+PiA+IG1lbW9yeSBzaXplLCBhbmQgYmVjYXVzZSB0aGUgZGF0YSBpdCBjb250YWlucyBpcyBy
ZWFkLW9ubHksIHNvIGl0Cj4+ID4gYmVsb25ncyB3aXRoIHRoZSBvdGhlciBzZWN0aW9ucyBjb250
YWluaW5nIHJlYWQtb25seSBkYXRhLgo+PiAKPj4gV2hpbGUgdGhpcyBtYXkgYmUgZmluZSBmb3Ig
RUxGLCBJJ20gYWZyYWlkIGl0IHdvdWxkIGJlIGNhbGxpbmcgZm9yCj4+IHN1YnRsZSBpc3N1ZXMg
d2l0aCB4ZW4uZWZpIChpLmUuIHRoZSBQRSBiaW5hcnkpOiBUaGVyZSBhIC5yZWxvYwo+PiBzZWN0
aW9uIGlzIGdlbmVyYWxseSBleHBlY3RlZCB0byBjb21lIGFmdGVyICJub3JtYWwiIGRhdGEKPj4g
c2VjdGlvbnMuCj4gCj4gT0ssIHdvdWxkIHlvdSBsaWtlIG1lIHRvIGxlYXZlIHRoZSAucmVsb2Mg
c2VjdGlvbiBhdCB0aGUgcHJldmlvdXMKPiBwb3NpdGlvbiBmb3IgRUZJIGJ1aWxkcyB0aGVuPwoK
V2VsbCwgdGhpcyBwYXJ0IGlzIGEgcmVxdWlyZW1lbnQsIG5vdCBhIHF1ZXN0aW9uIG9mIG1lIGxp
a2luZyB5b3UKdG8gZG8gc28uCgo+IE9yIGRvIHdlIHByZWZlciB0byBsZWF2ZSAucmVsb2Mgb3Jw
aGFuZWQgaW4gdGhlIEVMRiBidWlsZD8KCkRhbmllbCBtaWdodCBoYXZlIGFuIG9waW5pb24gaGVy
ZSB3aXRoIGhpcyBwbGFucyB0byBhY3R1YWxseQphZGQgcmVsb2NhdGlvbnMgdGhlcmUgaW4gdGhl
IG5vbi1saW5rZXItZ2VuZXJhdGVkLVBFIGJ1aWxkLiBJCmRvbid0IGhhdmUgYSBzdHJvbmcgb3Bp
bmlvbiBlaXRoZXIgd2F5LCBhcyBsb25nIGFzIHRoZQpjdXJyZW50IG1ldGhvZCBvZiBidWlsZGlu
ZyBnZXRzIGxlZnQgYXMgaXMgKG9yIGV2ZW4gc2ltcGxpZmllZCkuCgpBbHNvIGEgcmVtYXJrIHJl
Z2FyZGluZyB0aGUgdGl0bGUgLSBpbiBteSBidWlsZHMgdGhlcmUgYWxyZWFkeSBpcwphIC5yZWxv
YyBzZWN0aW9uIGluIHRoZSBFTEYgaW1hZ2VzLCBzbyAiYWRkIiBkb2Vzbid0IHJlYWxseSBzZWVt
CmNvcnJlY3QgdG8gbWUuIEl0IHNpdHMgcmlnaHQgYWZ0ZXIgLnJvZGF0YSwgYW5kIEkgd291bGQg
aXQgZG9lc24ndApnZXQgZm9sZGVkIGludG8gdGhlcmUgYmVjYXVzZSAtIGZvciBzb21lIHJlYXNv
biAtIC5yb2RhdGEgaXMKYWN0dWFsbHkgbWFya2VkIHdyaXRhYmxlLgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
