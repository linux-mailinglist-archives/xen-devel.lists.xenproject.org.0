Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D27FB4B279
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 08:56:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdUT8-0006qF-FW; Wed, 19 Jun 2019 06:53:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tFry=US=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hdUT6-0006qA-Rw
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 06:53:16 +0000
X-Inumbo-ID: e9424427-925e-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e9424427-925e-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 06:53:15 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 19 Jun 2019 00:53:14 -0600
Message-Id: <5D09DBD9020000780023981A@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 19 Jun 2019 00:53:13 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "Stefano Stabellini" <sstabellini@kernel.org>
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
 <1556658172-8824-3-git-send-email-sstabellini@kernel.org>
 <5CCB08C4020000780022B59A@prv1-mh.provo.novell.com>
 <alpine.DEB.2.21.1906171428080.2072@sstabellini-ThinkPad-T480s>
 <5D08A7E70200007800239282@prv1-mh.provo.novell.com>
 <alpine.DEB.2.21.1906181330330.2072@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1906181612230.2072@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1906181612230.2072@sstabellini-ThinkPad-T480s>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 03/10] xen: extend
 XEN_DOMCTL_memory_mapping to handle memory policy
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
 Julien Grall <julien.grall@arm.com>, Stefano Stabellini <stefanos@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE5LjA2LjE5IGF0IDAxOjE1LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gT24gVHVlLCAxOCBKdW4gMjAxOSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+PiBPbiBU
dWUsIDE4IEp1biAyMDE5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gPiA+Pj4gT24gMTcuMDYuMTkg
YXQgMjM6MjgsIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPj4gPiA+IE9uIFRodSwg
MiBNYXkgMjAxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+ID4gPj4gPj4+IE9uIDMwLjA0LjE5IGF0
IDIzOjAyLCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4+ID4gPj4gPiAtLS0gYS94
ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgKPj4gPiA+PiA+ICsrKyBiL3hlbi9pbmNsdWRlL3B1
YmxpYy9kb21jdGwuaAo+PiA+ID4+ID4gQEAgLTU3MSwxMiArNTcxLDI0IEBAIHN0cnVjdCB4ZW5f
ZG9tY3RsX2JpbmRfcHRfaXJxIHsKPj4gPiA+PiA+ICAqLwo+PiA+ID4+ID4gICNkZWZpbmUgRFBD
SV9BRERfTUFQUElORyAgICAgICAgIDEKPj4gPiA+PiA+ICAjZGVmaW5lIERQQ0lfUkVNT1ZFX01B
UFBJTkcgICAgICAwCj4+ID4gPj4gPiArLyoKPj4gPiA+PiA+ICsgKiBEZWZhdWx0IG1lbW9yeSBw
b2xpY3kuIENvcnJlc3BvbmRzIHRvOgo+PiA+ID4+ID4gKyAqIEFybTogTUVNT1JZX1BPTElDWV9B
Uk1fREVWX25HUkUKPj4gPiA+PiA+ICsgKiB4ODY6IE1FTU9SWV9QT0xJQ1lfWDg2X1VDCj4+ID4g
Pj4gPiArICovCj4+ID4gPj4gPiArI2RlZmluZSBNRU1PUllfUE9MSUNZX0RFRkFVTFQgICAgMAo+
PiA+ID4+ID4gKy8qIHg4NiBvbmx5LiBNZW1vcnkgdHlwZSBVTkNBQ0hBQkxFICovCj4+ID4gPj4g
PiArI2RlZmluZSBNRU1PUllfUE9MSUNZX1g4Nl9VQyAgICAgMAo+PiA+ID4+IAo+PiA+ID4+IEkn
bSBhZnJhaWQgdGhpcyBtYXkgZW5kIHVwIG1pc2xlYWRpbmcsIGFzIG9uIE5QVCBhbmQgaW4KPj4g
PiA+PiBzaGFkb3cgbW9kZSB3ZSB1c2UgVUMtIGluc3RlYWQgb2YgVUMgYWZhaWNzLiBBbmRyZXcs
Cj4+ID4gPj4gZG8geW91IGhhdmUgYW4gb3BpbmlvbiBlaXRoZXIgd2F5IHdoYXQgZXhhY3RseSBz
aG91bGQKPj4gPiA+PiBiZSBzdGF0ZWQgaGVyZT8KPj4gPiA+IAo+PiA+ID4gUGluZz8KPj4gPiAK
Pj4gPiBUbyBtZT8gSSd2ZSBzdGF0ZWQgbXkgb3Bpbmlvbi4KPj4gCj4+IEkgY2Fubm90IG5hbWUg
dGhlIG1hY3JvICJNRU1PUllfUE9MSUNZX1g4Nl9VQy0iIGJlY2F1c2UgaXQgY2Fubm90IGVuZAo+
PiB3aXRoIGEgIi0iLiBJbnN0ZWFkLCBJIGNhbiBuYW1lIGl0IE1FTU9SWV9QT0xJQ1lfWDg2X1VD
X01JTlVTIHRoYXQgc2VlbXMKPj4gdG8gYmUgd2hhdCBMaW51eCBkb2VzLiBJJ2xsIHJlbmFtZSB0
aGUgb3B0aW9uYWwgeGwgcGFyYW1ldGVyIHRvbyBmcm9tCj4+ICJ4ODZfdWMiIHRvICJ4ODZfdWNf
bWludXMiLgo+IAo+IEkgY2hhdHRlZCB3aXRoIEFuZHJldyBvbiBJUkMgYW5kIGhlIHN1Z2dlc3Rl
ZCB0byBnZXQgcmlkIG9mIHRoZSBvcHRpb24KPiBlbnRpcmVseSAtLSB0aGVyZSBpcyBqdXN0IG9u
ZSBvbiB4ODYgYW5kIGRvZXNuJ3QgbmVjZXNzYXJpbHkgbmVlZCB0byBiZQo+IGV4cGxpY2l0bHkg
dmlzaWJsZS4gV2UgY291bGQgb25seSBoYXZlIE1FTU9SWV9QT0xJQ1lfREVGQVVMVCwgYW5kIGFs
c28KPiByZW1vdmUgdGhlIHg4Nl91YyBzZXR0aW5nIGZyb20gbGlieGwveGwuCj4gCj4gSSBhbSBP
SyB3aXRoIHRoaXMuIEhvd2V2ZXIsIGdpdmVuIHRoYXQgSSBoYXZlIGFscmVhZHkgbWFkZSBhbGwg
dGhlCj4gY2hhbmdlcyB0byBoYXZlIE1FTU9SWV9QT0xJQ1lfWDg2X1VDX01JTlVTIGFuZCB4ODZf
dWNfbWludXMgZXZlcnl3aGVyZSwKPiBJJ2xsIHNlbmQgYW4gdXBkYXRlIG9mIHRoZSBzZXJpZXMg
d2l0aCB0aGVtLgoKQXJlbid0IHdlIGJhY2sgdG8gdGhlIHF1ZXN0aW9uIHRoZW0gd2hldGhlciB0
byBtYWtlIHRoaXMgYW4gQXJtLQpvbmx5IGludGVyZmFjZT8gSSdtIGhhdmluZyB0cm91YmxlIHNl
ZWluZyB0aGUgdmFsdWUgb2YgYW4gaW50ZXJmYWNlCndoaWNoIGFsbG93cyBvbmUgdG8gb25seSAi
c3dpdGNoIiBmcm9tIGRlZmF1bHQgdG8gZGVmYXVsdC4KCkphbgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
