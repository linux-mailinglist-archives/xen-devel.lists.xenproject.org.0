Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E1525FB5
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2019 10:43:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTMny-0001YK-Jh; Wed, 22 May 2019 08:40:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3DNt=TW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hTMnw-0001YD-Gb
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 08:40:56 +0000
X-Inumbo-ID: 4eafd3fe-7c6d-11e9-ad6e-435a97021f18
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4eafd3fe-7c6d-11e9-ad6e-435a97021f18;
 Wed, 22 May 2019 08:40:53 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 22 May 2019 02:40:51 -0600
Message-Id: <5CE50B130200007800231359@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 22 May 2019 02:40:51 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Olaf Hering" <olaf@aepfle.de>,"Wei Liu" <wei.liu2@citrix.com>
References: <5CE4F63A0200007800231313@prv1-mh.provo.novell.com>
 <20190522092544.2d7d835f.olaf@aepfle.de>
In-Reply-To: <20190522092544.2d7d835f.olaf@aepfle.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] libxl assertion failure when creating any kind of
 guest
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
 Ian Jackson <Ian.Jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIyLjA1LjE5IGF0IDA5OjI1LCA8b2xhZkBhZXBmbGUuZGU+IHdyb3RlOgo+IEFtIFdl
ZCwgMjIgTWF5IDIwMTkgMDE6MTE6NTQgLTA2MDAKPiBzY2hyaWViICJKYW4gQmV1bGljaCIgPEpC
ZXVsaWNoQHN1c2UuY29tPjoKPiAKPj4gbGlieGxfX2RvbWFpbl9idWlsZF9pbmZvX3NldGRlZmF1
bHQgKGdjPTB4N2ZmZmZmZmZkZWUwLCAKPiBiX2luZm89MHg3ZmZmZmZmZmRiODApCj4+ICAgICBh
dCBsaWJ4bF9jcmVhdGUuYzoxNDMKPiAKPiBUaGlzIGlzIGxpYnhsX2RlZmJvb2xfdmFsKGJfaW5m
by0+ZGV2aWNlX21vZGVsX3N0dWJkb21haW4pLgo+IAo+IER1ZSB0byB0aGUgbGFjayBvZiBhIHBy
b3BlciB3YXkgdG8gZGVzY3JpYmUgYWxsIHRoZSBkZXBlbmRlbmNpZXMgd2l0aGluCj4gbGlieGwg
SSBzdWdnZXN0IHRvIHJldmVydCB0aGVzZSBjb21taXRzIGZvciB0aGUgdGltZSBiZWluZzoKPiAK
PiAyNzhjNjQ1MTljIGxpYnhsOiBmaXggbGlieGxfZG9tYWluX25lZWRfbWVtb3J5IGFmdGVyIDg5
OTQzM2YxNDlkCj4gODk5NDMzZjE0OSBsaWJ4bDogZml4IG1pZ3JhdGlvbiBvZiBQViBhbmQgUFZI
IGRvbVVzIHdpdGggYW5kIHdpdGhvdXQgcWVtdQo+IDM4MDJlY2JhYTkgbGlieGw6IGFkZCBoZWxw
ZXIgZnVuY3Rpb24gdG8gc2V0IGRldmljZV9tb2RlbF92ZXJzaW9uCgpXZWxsLCB0aGUgYWx0ZXJu
YXRpdmUgaXMgdGhlIG9uZSBsaW5lIGNoYW5nZSBiZWxvdy4KCkphbgoKbGlieGw6IGZ1cnRoZXIg
Zml4IGxpYnhsX2RvbWFpbl9uZWVkX21lbW9yeSgpIGFmdGVyIDg5OTQzM2YxNDlkCgpCZXNpZGVz
IHByb3ZpZGluZyBhIGRldmljZV9tb2RlbF92ZXJzaW9uIHNldHRpbmcgKGFzIGRvbmUgYnkgMjc4
YzY0NTE5YwpbImxpYnhsOiBmaXggbGlieGxfZG9tYWluX25lZWRfbWVtb3J5IGFmdGVyIDg5OTQz
M2YxNDlkIl0pLCBvbmUgaXMgYWxzbwpuZWVkZWQgZm9yIGRldmljZV9tb2RlbF9zdHViZG9tYWlu
LCBvciBlbHNlIHRoZSByZXNwZWN0aXZlIGFzc2VydCgpIGluCmxpYnhsX2RlZmJvb2xfdmFsKCkg
KGNhbGxlZCBmcm9tIGxpYnhsX19kb21haW5fYnVpbGRfaW5mb19zZXRkZWZhdWx0KCkpCndpbGwg
dHJpZ2dlci4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
Ci0tLSB1bnN0YWJsZS5vcmlnL3Rvb2xzL2xpYnhsL2xpYnhsX21lbS5jCisrKyB1bnN0YWJsZS90
b29scy9saWJ4bC9saWJ4bF9tZW0uYwpAQCAtNDcyLDYgKzQ3Miw3IEBAIGludCBsaWJ4bF9kb21h
aW5fbmVlZF9tZW1vcnkobGlieGxfY3R4ICoKICAgICAgKiBjYWxjdWxhdGlvbiBkb2Vzbid0IHJl
YWxseSBjYXJlIHdoaWNoIFFFTVUgaXMgc2V0IGhlcmUsIHNvIHdlCiAgICAgICogZ28gd2l0aCB0
aGUgdXBzdHJlYW0gZGVmYXVsdC4KICAgICAgKi8KKyAgICBsaWJ4bF9kZWZib29sX3NldGRlZmF1
bHQoJmJfaW5mby0+ZGV2aWNlX21vZGVsX3N0dWJkb21haW4sIGZhbHNlKTsKICAgICBpZiAoIWJf
aW5mby0+ZGV2aWNlX21vZGVsX3ZlcnNpb24pCiAgICAgICAgIGJfaW5mby0+ZGV2aWNlX21vZGVs
X3ZlcnNpb24gPSBMSUJYTF9ERVZJQ0VfTU9ERUxfVkVSU0lPTl9RRU1VX1hFTjsKIAoKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
