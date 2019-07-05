Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E1760476
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 12:29:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjLOD-0004wO-Kt; Fri, 05 Jul 2019 10:24:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vD9p=VC=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hjLOC-0004wJ-OU
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 10:24:24 +0000
X-Inumbo-ID: 0d512196-9f0f-11e9-8a35-97aaff34103d
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0d512196-9f0f-11e9-8a35-97aaff34103d;
 Fri, 05 Jul 2019 10:24:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5C35EB062;
 Fri,  5 Jul 2019 10:24:20 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>, Paul Durrant <Paul.Durrant@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>
References: <20190704151522.32639-1-anthony.perard@citrix.com>
 <11258d51-03b7-05ad-e94c-e7dde56d39ee@suse.com>
 <c2a91602902b4c9294a12c4994a3663a@AMSPEX02CL03.citrite.net>
 <5c3268fd-bd69-f490-ef12-01a8c9cd4369@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <75a7ebcf-5265-5ad5-b8c3-107caf4a1f91@suse.com>
Date: Fri, 5 Jul 2019 12:24:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <5c3268fd-bd69-f490-ef12-01a8c9cd4369@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH] include/public/io/ring.h: Remove xen_mb,
 xen_rmb, xen_wmb macros
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDcuMTkgMDk6NTksIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA0LjA3LjIwMTkgMTg6
MTEsIFBhdWwgRHVycmFudCB3cm90ZToKPj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+
PiBGcm9tOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+Cj4+PiBTZW50OiAwNCBKdWx5
IDIwMTkgMTY6NDkKPj4+IFRvOiBBbnRob255IFBlcmFyZCA8YW50aG9ueS5wZXJhcmRAY2l0cml4
LmNvbT4KPj4+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IFBhdWwgRHVycmFu
dCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+OyBLb25yYWQgUnplc3p1dGVrIFdpbGsKPj4+IDxr
b25yYWQud2lsa0BvcmFjbGUuY29tPjsgSnVlcmdlbiBHcm9zcyA8Skdyb3NzQHN1c2UuY29tPgo+
Pj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSF0gaW5jbHVkZS9wdWJsaWMvaW8vcmlu
Zy5oOiBSZW1vdmUgeGVuX21iLCB4ZW5fcm1iLCB4ZW5fd21iIG1hY3Jvcwo+Pj4KPj4+IE9uIDA0
LjA3LjIwMTkgMTc6MTUsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+Pj4+IFRob3NlIG1hY3JvcyB3
aGVyZSBpbnRyb2R1Y2VkIHdoZW4gYSBwcmVmaXggInhlbl8iIHdhcyBhZGRlZCB0bwo+Pj4+IG1i
LHJtYix3bWIuIFRoZXJlIGFyZSBnYXRlZCBvbiBfX1hFTl9JTlRFUkZBQ0VfVkVSU0lPTl9fLCBi
dXQgdGhlcmUKPj4+PiBhcmUgbm90IHBhcnQgb2YgdGhlIFhlbiBpbnRlcmZhY2UuIFVzZXJzIG9m
IHJpbmcuaCBuZWVkcyB0byBwcm92aWRlCj4+Pj4geGVuX1tyd10/bWIoKSBhbnl3YWkgYmVjYXVz
ZSBbcnddP21iKCkgaXNuJ3QgbGlrZWx5IHRvIGV4aXN0Lgo+Pj4KPj4+IEl0J3Mgbm90IGNsZWFy
IHRvIG1lIHdoYXQgeW91IHdhbnQgdG8gYWNoaWV2ZToKPj4+Cj4+Cj4+IFRoZSBpc3N1ZSBpcyB0
aGF0IGFueSBwcm9qZWN0IGltcG9ydGluZyB0aGlzIGhlYWRlciAoaW4gdGhpcyBjYXNlIFFFTVUs
Cj4+IGJ1dCBJIGhhdmUgdGhlIHNhbWUgaXNzdWUgaW4gdGhlIFdpbmRvd3MgUFYgZHJpdmVycykg
bmVlZHMgdG8gaW1wb3J0Cj4+IHhlbi1jb21wYXQuaCAob3IgZHJlYW0gdXAgYSBoZWFkZXIgb2Yg
dGhlIHNhbWUgbmFtZSksIGV2ZW4gdGhvdWdoIHRoaXMKPj4gaGVhZGVyIGlzIG9ubHkgY29uY2Vy
bmVkIHdpdGggdGhlIHVuZGVycGlubmluZ3Mgb2YgUFYgcHJvdG9jb2xzIGFuZCBoYXMKPj4gbm90
aGluZywgYXMgc3VjaCwgdG8gZG8gd2l0aCBYZW4uCj4gCj4gV2hpbGUgSSBhZ3JlZSB0aGlzIHNo
b3VsZG4ndCBoYXZlIGJlZW4gcGFydCBvZiB0aGUgcHVibGljIGhlYWRlcnMsCj4gdGhhdCBzaGlw
IGhhcyBzYWlsZWQgbG9uZywgbG9uZyBhZ28uIElmIGEgY29tcG9uZW50IGRvZXNuJ3QgdXNlIHRo
ZQo+IGhlYWRlcnMgdmVyYmF0aW0sIEkgZG9uJ3Qgc2VlIHdoeSB0aGV5IGNvdWxkbid0IHJlbW92
ZSB0aGF0IHNlY3Rpb24KPiBpbiB0aGVpciBjb3B5LiBJZiBvdG9oIHRoZXkgdXNlIHRoZSBoZWFk
ZXJzIHZlcmJhdGltLCB0aGVuIEknZAo+IGV4cGVjdCB0aGVtIHRvIGFsc28gdXNlIHhlbi1jb21w
YXQuaAoKUmlnaHQuCgo+IAo+PiBUbyBrZWVwIG9sZCB2ZXJiYXRpbSB1c2VycyAoYXJlIHRoZXJl
IHJlYWxseSBhbnkgYXQgYWxsPykgaGFwcHksIGhvdyBhYm91dCBzaW1wbGUuLi4KPj4KPj4gI2lm
bmRlZiB4ZW5fbWIoKQo+PiAjZGVmaW5lIHhlbl9tYigpIG1iKCkKPj4gI2VuZGlmCj4+Cj4+IGNv
bnN0cnVjdHM/Cj4gCj4gVGhpcyB3b3VsZCBzdGlsbCBjYXVzZSBjb25mbGljdHMgaWYgYSBjb21w
b25lbnQgZW5kcyB1cCBkZWZpbmluZwo+IHhlbl9tYigpIG9ubHkgYWZ0ZXIgdGhlIGluY2x1c2lv
biBvZiB0aGlzIGhlYWRlci4gQXMgdG8gdGhlcmUKPiBhY3R1YWxseSBiZWluZyBhbnkgLSB0aGUg
b2xkIExpbnV4IDIuNi4xOCB0cmVlIGRpZCBwdWxsIGluIGNvcGllcwo+IG9mIHRoZSBoZWFkZXJz
IHdpdGhvdXQgZnVydGhlciBlZGl0aW5nLiBCZXlvbmQgdGhhdCB3aGlsZSBJJ20KPiB1bmF3YXJl
IG9mIGFueSwgd2Ugc2ltcGx5IGNhbid0IGtub3cuIFVudGlsIG5vdyB0aGVyZSBzaW1wbHkgd2Fz
Cj4gYW4gaW1wbGllZCBwcm9taXNlIHRoYXQgd2Ugd291bGQgdHJ5IG91ciBiZXN0IHRvIGF2b2lk
IGJyZWFraW5nCj4gZXhpc3RpbmcgdXNlcnMuCgpJJ20gY29tcGxldGVseSBvbiBKYW4ncyBzaWRl
IGhlcmUuCgpXaGF0IHdvdWxkIGJlIHBvc3NpYmxlIHBlcmhhcHMgaXMgdG8gc3BsaXQgcmluZy5o
IGludG8gdHdvIGhlYWRlcnM6IGEKbmV3IG9uZSB3aXRoIHRoZSBwdXJlIHJpbmcgZGVmaW5pdGlv
bnMgYW5kIHJpbmcuaCAjaW5jbHVkZS1pbmcKeGVuLWNvbXBhdC5oIGFuZCB0aGUgbmV3IGhlYWRl
ciBhbmQgI2RlZmluZS1pbmcgdGhlIHhlbiptYigpIG1hY3Jvcy4KCk5vdCBzdXJlIHRoaXMgd291
bGQgYmUgd29ydGggaXQsIHRob3VnaC4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
