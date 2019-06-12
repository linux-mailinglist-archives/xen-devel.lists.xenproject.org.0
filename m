Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3521424D2
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 13:55:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hb1n9-0001Ir-OG; Wed, 12 Jun 2019 11:51:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q2gY=UL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hb1n8-0001Im-0U
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 11:51:46 +0000
X-Inumbo-ID: 72fe6bb8-8d08-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 72fe6bb8-8d08-11e9-8980-bc764e045a96;
 Wed, 12 Jun 2019 11:51:44 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 12 Jun 2019 05:51:43 -0600
Message-Id: <5D00E74D02000078002377AA@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 12 Jun 2019 05:51:41 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1560337513-6958-1-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1560337513-6958-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] x86/boot: Drop vestigial support for
 pre-SIPI APICs
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
 David Woodhouse <dwmw2@infradead.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEyLjA2LjE5IGF0IDEzOjA1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhlIGN1cnJlbnQgY29kZSBpbiBkb19ib290X2NwdSgpIG1ha2VzIGEgQ01PUyB3cml0
ZSAoZXZlbiBpbiB0aGUgY2FzZSBvZiBhbgo+IEZBRFQgcmVkdWNlZCBoYXJkd2FyZSBjb25maWd1
cmF0aW9uKSBhbmQgdHdvIHdyaXRlcyBpbnRvIHRoZSBCREEgZm9yIHRoZQo+IHN0YXJ0X2VpcCBz
ZWdtZW50IGFuZCBvZmZzZXQuCj4gCj4gQkRBIDB4NjcgYW5kIDB4NjkgaGFpbCBmcm9tIHRoZSBk
YXlzIG9mIHRoZSBET1MgYW5kIHRoZSAyODYsIHdoZW4gSUJNIHB1dAo+IHRvZ2V0aGVyIHRoZSBm
YXN0IHdheSB0byByZXR1cm4gZnJvbSBQcm90ZWN0ZWQgbW9kZSBiYWNrIHRvIFJlYWwgbW9kZSAo
dmlhIGEKPiBkZWxpYmVyYXRlIHRyaXBsZSBmYXVsdCkuICBUaGlzIHZlY3Rvciwgd2hlbiBzZXQs
IHJlZGlyZWN0cyB0aGUgZWFybHkgYm9vdAo+IGxvZ2ljIGJhY2sgaW50byBPUyBjb250cm9sLgo+
IAo+IEl0IGlzIGFsc28gdXNlZCBieSBlYXJseSBNUCBzeXN0ZW1zLCBiZWZvcmUgdGhlIFN0YXJ0
dXAgSVBJIG1lc3NhZ2UgYmVjYW1lCj4gc3RhbmRhcmQsIHdoaWNoIGluIHByYWN0aWNlIHdhcyBi
ZWZvcmUgTG9jYWwgQVBJQ3MgYmVjYW1lIGludGVncmF0ZWQgaW50byBDUFUKPiBjb3Jlcy4KPiAK
PiBTdXBwb3J0IGZvciBub24taW50ZWdyYXRlZCBBUElDcyB3YXMgZHJvcHBlZCBpbiBjL3MgN2Iw
MDA3YWYgInhlbi94ODY6IFJlbW92ZQo+IEFQSUNfSU5URUdSQVRFRCgpIGNoZWNrcyIgYmVjYXVz
ZSB0aGVyZSBhcmUgbm8gNjQtYml0IGNhcGFibGUgc3lzdGVtcyB3aXRob3V0Cj4gdGhlbS4gIFRo
ZXJlZm9yZSwgZHJvcCBzbXBib290X3tzZXR1cCxyZXN0b3JlfV93YXJtX3Jlc2V0X3ZlY3Rvcigp
Lgo+IAo+IERyb3BwaW5nIHNtcGJvb3Rfc2V0dXBfd2FybV9yZXNldF92ZWN0b3IoKSBhbHNvIGxl
dHMgdXMgZHJvcAo+IFRSQU1QT0xJTkVfe0hJR0gsTE9XfSwgd2hpY2ggbGV0cyB1cyBkcm9wIG1h
Y2hfd2FrZWNwdS5oIGVudGlyZWx5LiAgVGhlIGZpbmFsCj4gZnVuY3Rpb24gaW4gc21wYm9vdF9o
b29rcy5oIGlzIHNtcGJvb3Rfc2V0dXBfaW9fYXBpYygpIGFuZCBoYXMgYSBzaW5nbGUKPiBjYWxs
ZXIsIHNvIGV4cGFuZCBpdCBpbmxpbmUgYW5kIGRlbGV0ZSBzbXBib290X2hvb2tzLmggYXMgd2Vs
bC4KPiAKPiBUaGlzIHJlbW92ZXMgYWxsIHJlbGlhbmNlIG9uIENNT1MgYW5kIHRoZSBCREEgZnJv
bSB0aGUgQVAgYm9vdCBwYXRoLCB3aGljaCBpcwo+IGVzcGVjaWFsbHkgb2YgaW50ZXJlc3Qgb24g
cmVkdWNlZF9oYXJkd2FyZSBib290cyBhbmQgRUZJIHN5c3RlbXMuCj4gCj4gUmVwb3J0ZWQtYnk6
IERhdmlkIFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+CgpEb2VzIHRoaXMgbWVhbiB0aGVy
ZSB3YXMgYW4gYWN0dWFsIHByb2JsZW0gcmVzdWx0aW5nIGZyb20gdGhpcyBjb2RlCmJlaW5nIHRo
ZXJlLCBvciBzaW1wbHkgdGhlIG9ic2VydmF0aW9uIHRoYXQgdGhpcyBjb2RlIGlzIGFsbCBkZWFk
PwpDbGFyaWZ5aW5nIG9uZSB3YXkgb3IgdGhlIG90aGVyIGJ5IGhhbGYgYSBzZW50ZW5jZSB3b3Vs
ZCBiZSBuaWNlLgoKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
