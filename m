Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DAE23BDE
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 17:19:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSk2a-0003wX-8n; Mon, 20 May 2019 15:17:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gSYI=TU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hSk2Y-0003wR-RE
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 15:17:26 +0000
X-Inumbo-ID: 5e4d863c-7b12-11e9-9733-1bc591c265eb
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5e4d863c-7b12-11e9-9733-1bc591c265eb;
 Mon, 20 May 2019 15:17:24 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 20 May 2019 09:17:22 -0600
Message-Id: <5CE2C4FF0200007800230ABF@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 20 May 2019 09:17:19 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
 <5CDE917502000078002300A8@prv1-mh.provo.novell.com>
 <20190520114006.jh3l4kg4abdaekb5@Air-de-Roger>
In-Reply-To: <20190520114006.jh3l4kg4abdaekb5@Air-de-Roger>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3 07/15] x86/IRQ: target online CPUs when
 binding guest IRQ
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIwLjA1LjE5IGF0IDEzOjQwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIEZyaSwgTWF5IDE3LCAyMDE5IGF0IDA0OjQ4OjIxQU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiBmaXh1cF9pcnFzKCkgc2tpcHMgaW50ZXJydXB0cyB3aXRob3V0IGFjdGlvbi4gSGVu
Y2Ugc3VjaCBpbnRlcnJ1cHRzIGNhbgo+PiByZXRhaW4gYWZmaW5pdHkgdG8ganVzdCBvZmZsaW5l
IENQVXMuIFdpdGggIm5vaXJxYmFsYW5jZSIgaW4gZWZmZWN0LAo+PiBwaXJxX2d1ZXN0X2JpbmQo
KSBzbyBmYXIgd291bGQgaGF2ZSBsZWZ0IHRoZW0gYWxvbmUsIHJlc3VsdGluZyBpbiBhIG5vbi0K
Pj4gd29ya2luZyBpbnRlcnJ1cHQuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Cj4+IC0tLQo+PiB2MzogTmV3Lgo+PiAtLS0KPj4gSSd2ZSBub3Qg
b2JzZXJ2ZWQgdGhpcyBwcm9ibGVtIGluIHByYWN0aWNlIC0gdGhlIGNoYW5nZSBpcyBqdXN0IHRo
ZQo+PiByZXN1bHQgb2YgY29kZSBpbnNwZWN0aW9uIGFmdGVyIGhhdmluZyBub3RpY2VkIGFjdGlv
bi1sZXNzIElSUXMgaW4gJ2knCj4+IGRlYnVnIGtleSBvdXRwdXQgcG9pbnRpbmcgYXQgYWxsIHBh
cmtlZC9vZmZsaW5lIENQVXMuCj4+IAo+PiAtLS0gYS94ZW4vYXJjaC94ODYvaXJxLmMKPj4gKysr
IGIveGVuL2FyY2gveDg2L2lycS5jCj4+IEBAIC0xNjgzLDkgKzE2ODMsMjcgQEAgaW50IHBpcnFf
Z3Vlc3RfYmluZChzdHJ1Y3QgdmNwdSAqdiwgc3RydQo+PiAgCj4+ICAgICAgICAgIGRlc2MtPnN0
YXR1cyB8PSBJUlFfR1VFU1Q7Cj4+ICAKPj4gLSAgICAgICAgLyogQXR0ZW1wdCB0byBiaW5kIHRo
ZSBpbnRlcnJ1cHQgdGFyZ2V0IHRvIHRoZSBjb3JyZWN0IENQVS4gKi8KPj4gLSAgICAgICAgaWYg
KCAhb3B0X25vaXJxYmFsYW5jZSAmJiAoZGVzYy0+aGFuZGxlci0+c2V0X2FmZmluaXR5ICE9IE5V
TEwpICkKPj4gLSAgICAgICAgICAgIGRlc2MtPmhhbmRsZXItPnNldF9hZmZpbml0eShkZXNjLCBj
cHVtYXNrX29mKHYtPnByb2Nlc3NvcikpOwo+PiArICAgICAgICAvKgo+PiArICAgICAgICAgKiBB
dHRlbXB0IHRvIGJpbmQgdGhlIGludGVycnVwdCB0YXJnZXQgdG8gdGhlIGNvcnJlY3QgKG9yIGF0
IGxlYXN0Cj4+ICsgICAgICAgICAqIHNvbWUgb25saW5lKSBDUFUuCj4+ICsgICAgICAgICAqLwo+
PiArICAgICAgICBpZiAoIGRlc2MtPmhhbmRsZXItPnNldF9hZmZpbml0eSApCj4+ICsgICAgICAg
IHsKPj4gKyAgICAgICAgICAgIGNvbnN0IGNwdW1hc2tfdCAqYWZmaW5pdHkgPSBOVUxMOwo+PiAr
Cj4+ICsgICAgICAgICAgICBpZiAoICFvcHRfbm9pcnFiYWxhbmNlICkKPj4gKyAgICAgICAgICAg
ICAgICBhZmZpbml0eSA9IGNwdW1hc2tfb2Yodi0+cHJvY2Vzc29yKTsKPj4gKyAgICAgICAgICAg
IGVsc2UgaWYgKCAhY3B1bWFza19pbnRlcnNlY3RzKGRlc2MtPmFmZmluaXR5LCAmY3B1X29ubGlu
ZV9tYXApICkKPj4gKyAgICAgICAgICAgIHsKPj4gKyAgICAgICAgICAgICAgICBjcHVtYXNrX3Nl
dGFsbChkZXNjLT5hZmZpbml0eSk7Cj4+ICsgICAgICAgICAgICAgICAgYWZmaW5pdHkgPSAmY3B1
bWFza19hbGw7Cj4+ICsgICAgICAgICAgICB9Cj4+ICsgICAgICAgICAgICBlbHNlIGlmICggIWNw
dW1hc2tfaW50ZXJzZWN0cyhkZXNjLT5hcmNoLmNwdV9tYXNrLAo+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgJmNwdV9vbmxpbmVfbWFwKSApCj4gCj4gSSdtIG5v
dCBzdXJlIEkgc2VlIHRoZSBwdXJwb3NlIG9mIHRoZSBkZXNjLT5hcmNoLmNwdV9tYXNrIGNoZWNr
LAo+IHdvdWxkbid0IGl0IGJlIGJldHRlciB0byBqdXN0IHVzZSBlbHNlIGFuZCBzZXQgdGhlIGFm
ZmluaXR5IHRvCj4gZGVzYy0+YWZmaW5pdHk/CgpXZSBzaG91bGQgYXZvaWQgY2xvYmJlcmluZyBk
ZXNjLT5hZmZpbml0eSB3aGVuZXZlciBwb3NzaWJsZTogSXQKcmVmbGVjdHMgKHNlZSB0aGUgcmVz
cGVjdGl2ZSBwYXRjaCBpbiB0aGlzIHNlcmllcykgd2hhdCB3YXMKcmVxdWVzdGVkIGJ5IHdoYXRl
dmVyICJvdXRzaWRlIiBwYXJ0eS4KCj4gT3IgaXQncyBqdXN0IGFuIG9wdGltaXphdGlvbiB0byBh
dm9pZCBkb2luZyB0aGUgc2V0X2FmZmluaXR5IGNhbGwgaWYKPiB0aGUgaW50ZXJydXB0IGl0IGFs
cmVhZHkgYm91bmQgdG8gYW4gb25saW5lIENQVT8KClRoaXMgaXMgYSBzZWNvbmQgYXNwZWN0IGhl
cmUgaW5kZWVkIC0gd2h5IHBsYXkgd2l0aCB0aGUgSVJRIGlmCml0IGhhcyBhIHZhbGlkIGRlc3Rp
bmF0aW9uPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
