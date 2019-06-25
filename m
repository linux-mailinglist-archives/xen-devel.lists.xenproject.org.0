Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 451BD523C4
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 08:52:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hffG1-0005HQ-BH; Tue, 25 Jun 2019 06:48:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xfxB=UY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hffG0-0005HL-Dp
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 06:48:44 +0000
X-Inumbo-ID: 44879505-9715-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 44879505-9715-11e9-8980-bc764e045a96;
 Tue, 25 Jun 2019 06:48:41 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 25 Jun 2019 00:48:40 -0600
Message-Id: <5D11C3C2020000780023AD1A@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 25 Jun 2019 00:48:34 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B8733020000780021F323@prv1-mh.provo.novell.com>
 <27e0b6ee-5987-cc13-72e9-03a4f860ea6c@citrix.com>
 <5D0CE2F0020000780023A265@prv1-mh.provo.novell.com>
 <cac8a69a-6105-c5d8-779c-9524c2a58820@citrix.com>
In-Reply-To: <cac8a69a-6105-c5d8-779c-9524c2a58820@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v8 46/50] x86emul: support GFNI insns
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
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIxLjA2LjE5IGF0IDE2OjIwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjEvMDYvMjAxOSAxNTowMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBPbiAxNS8w
My8yMDE5IDExOjA2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBAQCAtMTM4LDYgKzE0MSwyNiBA
QCBzdGF0aWMgYm9vbCBzaW1kX2NoZWNrX2F2eDUxMnZibWlfdmwodm9pCj4+Pj4gICAgICByZXR1
cm4gY3B1X2hhc19hdng1MTJfdmJtaSAmJiBjcHVfaGFzX2F2eDUxMnZsOwo+Pj4+ICB9Cj4+Pj4g
IAo+Pj4+ICtzdGF0aWMgYm9vbCBzaW1kX2NoZWNrX3NzZTJfZ2Yodm9pZCkKPj4+PiArewo+Pj4+
ICsgICAgcmV0dXJuIGNwdV9oYXNfZ2ZuaSAmJiBjcHVfaGFzX3NzZTI7Cj4+PiBUaGlzIGRlcGVu
ZGVuY3kgZG9lc24ndCBtYXRjaCB0aGUgbWFudWFsLiAgVGhlIGxlZ2FjeSBlbmNvZGluZyBuZWVk
cwo+Pj4gR0ZOSSBhbG9uZS4KPj4+Cj4+PiBnZW4tY3B1aWQucHkgaXMgdHJ5aW5nIHRvIHJlZHVj
ZSB0aGUgYWJpbGl0eSB0byBjcmVhdGUgdG90YWxseQo+Pj4gaW1wbGF1c2libGUgY29uZmlndXJh
dGlvbnMgdmlhIGxldmVsbGluZywgYnV0IGZvciBzb2Z0d2FyZSBjaGVja3MsIHdlCj4+PiBzaG91
bGQgZm9sbG93IHRoZSBtYW51YWwgdG8gdGhlIGxldHRlci4KPj4gVGhpcyBpcyB0ZXN0IGhhcm5l
c3MgY29kZSAtIEknZCByYXRoZXIgYmUgYSBsaXR0bGUgbW9yZSBzdHJpY3QgaGVyZSB0aGFuCj4+
IGhhdmluZyB0byBuZWVkbGVzc2x5IHNwZW5kIHRpbWUgZml4aW5nIGFuIGlzc3VlIGluIHRoZXJl
LiBGdXJ0aGVybW9yZQo+PiB0aGlzIG1hdGNoZXMgaG93IGdjYyBlbmZvcmNlcyBkZXBlbmRlbmNp
ZXMuCj4+Pj4gK30KPj4+PiArCj4+Pj4gK3N0YXRpYyBib29sIHNpbWRfY2hlY2tfYXZ4Ml9nZih2
b2lkKQo+Pj4+ICt7Cj4+Pj4gKyAgICByZXR1cm4gY3B1X2hhc19nZm5pICYmIGNwdV9oYXNfYXZ4
MjsKPj4+IEhlcmUsIHRoZSBkZXBlbmRlbmN5IGlzIG9ubHkgb24gQVZYLCB3aGljaCBJIHRoaW5r
IGlzIHByb2JhYmx5IHRyeWluZyB0bwo+Pj4gZXhwcmVzcyBhIGRlcGVuZGVuY3kgb24geGNyMC55
bW0KPj4gTW9zdGx5IGFzIHBlciBhYm92ZSwgZXhjZXB0IHRoYXQgaGVyZSBnY2MgKGltbyB3cm9u
Z2x5KSBlbmFibGVzIGp1c3QKPj4gQVZYLgo+Pgo+Pj4+ICt9Cj4+Pj4gKwo+Pj4+ICtzdGF0aWMg
Ym9vbCBzaW1kX2NoZWNrX2F2eDUxMmJ3X2dmKHZvaWQpCj4+Pj4gK3sKPj4+PiArICAgIHJldHVy
biBjcHVfaGFzX2dmbmkgJiYgY3B1X2hhc19hdng1MTJidzsKPj4+IEkgZG9uJ3Qgc2VlIGFueSBC
VyBpbnRlcmFjdGlvbiBhbnl3aGVyZSAoaW4gdGhlIG1hbnVhbCksIGRlc3BpdGUgdGhlCj4+PiBm
YWN0IGl0IG9wZXJhdGVzIG9uIGEgZGF0YXR5cGUgb2YgaW50OC4KPj4gQnV0IGJ5IG9wZXJhdGlu
ZyBvbiB2ZWN0b3JzIG9mIGJ5dGVzLCBpdCByZXF1aXJlcyA2NCBiaXRzIHdpZGUgbWFzawo+PiBy
ZWdpc3RlcnMsIHdoaWNoIGlzIHRoZSBjb25uZWN0aW9uIHRvIEJXLiBBZ2FpbiBnY2MgYWxzbyBk
b2VzIHNvLgo+IAo+IFRvIGJlIGhvbmVzdCwgaXQgZG9lc24ndCBtYXR0ZXIgd2hhdCBHQ0MgZG9l
cy4KCkNvbWluZyBiYWNrIHRvIHRoaXMgLSBpdCB2ZXJ5IG11Y2ggbWF0dGVycyBfaGVyZV8gKGku
ZS4gaW4gdGVzdCBoYXJuZXNzCmNvZGUpOiBGb3Igb25lLCB0aGUgY2hlY2tzIGFib3ZlIG5lZWQg
dG8gYmUgaW4gbGluZSB3aXRoIHRoZSAtbTxpc2E+Cm9wdGlvbnMgd2UgcGFzcyB0byB0aGUgY29t
cGlsZXIuIEkuZS4gaWYgYW55dGhpbmcgdGhlIHF1ZXN0aW9uIG1pZ2h0CmJlIG9uIHRoZSBNYWtl
ZmlsZSBhZGRpdGlvbnMgd2h5IEkgZW5hYmxlIFNTRTIsIEFWWDIsIGFuZCBBVlg1MTJCVwpyZXNw
ZWN0aXZlbHkuCgpXaGlsZSBJIGNvdWxkIHNpbXBseSBjbGFpbSB0aGF0IHRoaXMgaXMgbXkgY2hv
aWNlIGFzIHRvIHByb2R1Y2luZwpzZW5zaWJsZSB0ZXN0IGNhc2UgYmluYXJ5IGJsb2JzLCB0aGVy
ZSdzIGEgY29tcGlsZXIgYXNwZWN0IF90aGVyZV86CmdjYydzIGludHJpbnNpY3MgaGVhZGVyIGVu
YWJsZXMgU1NFMiwgQVZYLCBhbmQgQVZYNTEyRiAvIEFWWDUxMkJXCmFyb3VuZCB0aGUgZGVmaW5p
dGlvbnMgb24gdGhlIGlubGluZSB3cmFwcGVycyBhcm91bmQgdGhlIGJ1aWx0aW5zLgpUaGlzIGlu
IHR1cm4gaXMgYmVjYXVzZSB0aGUgYXZhaWxhYmlsaXR5IG9mIHRoZSByZXNwZWN0aXZlIGJ1aWx0
aW5zCmRlcGVuZHMgb24gdGhlc2UgSVNBcyB0byBiZSBlbmFibGVkIGFsb25nc2lkZSBHRk5JIGl0
c2VsZi4gV2UKdGhlcmVmb3JlIG1heSBub3QgdXNlIGFueSBJU0EgbGV2ZWwgX2xvd2VyXyB0aGFu
IHdoYXQgdGhlCmJ1aWx0aW5zIHJlcXVpcmUuIEFzIG1lbnRpb25lZCBiZWZvcmUsIHNlZWluZyB0
aGVtIHVzZSBTU0UyIGFzCnByZXJlcSBmb3IgdGhlIGxlZ2FjeSBlbmNvZGVkIGluc25zLCBJIHF1
ZXN0aW9uIHRoZWlyIHVzZSBvZiBBVlgKaW5zdGVhZCBvZiBBVlgyLCBhbmQgaGVuY2UgSSdkIHBy
ZWZlciB0byBzdGljayB3aXRoIEFWWDI7IGlmIG5vdGhpbmcKZWxzZSB0aGVuIHNpbXBseSBiZWNh
dXNlIG9mIHdoYXQgSSd2ZSBzYWlkIGluIHRoZSBmaXJzdCBoYWxmIHNlbnRlbmNlCm9mIHRoaXMg
cGFyYWdyYXBoLiAoTXkgZ3Vlc3MgaXMgdGhhdCBpdCdzIHRoZSBhdmFpbGFiaWxpdHkgb2YKeyws
Vn1NT1ZEUXtBLFV9KiB0aGF0IGRpZCBkZXRlcm1pbmUgdGhlaXIgY2hvaWNlLCByYXRoZXIgdGhh
biB0aGUKZ2VuZXJhbCBhdmFpbGFiaWxpdHkgb2YgdmVjdG9yIG9wZXJhdGlvbnMgb24gdGhlIGdp
dmVuIHZlY3RvciBhbmQKZWxlbWVudCB0eXBlcyBhbmQgc2l6ZXMuIEknbSBzdXJlIHRoaXMgd291
bGQgbGVhZCB0byBzb21lIHJhdGhlcgoiZnVubnkiIGdlbmVyYXRlZCBjb2RlIHdoZW4gaW5wdXRz
IGNvbWUgZnJvbSBvdGhlcgp0cmFuc2Zvcm1hdGlvbnMgcmF0aGVyIHRoYW4gc3RyYWlnaHQgZnJv
bSBtZW1vcnkuKQoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
