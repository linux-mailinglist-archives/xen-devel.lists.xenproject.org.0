Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9EEE1F5
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 14:07:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL51B-0004Cs-Ag; Mon, 29 Apr 2019 12:04:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ztS9=S7=citrix.com=prvs=015484912=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hL51A-0004Cm-DZ
 for xen-devel@lists.xen.org; Mon, 29 Apr 2019 12:04:20 +0000
X-Inumbo-ID: e98bebab-6a76-11e9-843c-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e98bebab-6a76-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 12:04:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,409,1549929600"; d="scan'208";a="89406686"
Date: Mon, 29 Apr 2019 14:02:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "John L. Poole" <jlpoole56@gmail.com>
Message-ID: <20190429120238.b4kjlmkpk5l2t6yb@Air-de-Roger>
References: <20190322075941.bdf6i3veheiblwzs@MacBook-Air-de-Roger.local>
 <9f9c4a21-b426-f0fc-7c09-2f5d392b488c@gmail.com>
 <5C98F95C0200007800221B56@prv1-mh.provo.novell.com>
 <9288a3b8-8c59-c80f-68f3-14aaca9272d4@gmail.com>
 <5C99DD160200007800221D00@prv1-mh.provo.novell.com>
 <25b66cdf-94ad-6af1-de5f-e0f5369ae000@gmail.com>
 <5C9B30D002000078002220F5@prv1-mh.provo.novell.com>
 <1fccf915-9d0b-52ac-4d6d-df16194dabb0@gmail.com>
 <5C9B86FA0200007800222232@prv1-mh.provo.novell.com>
 <daff9af3-5008-42ac-1355-ca8ef94fadb5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <daff9af3-5008-42ac-1355-ca8ef94fadb5@gmail.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Xen 4.12.0-rc Hangs Around masked ExtINT on CPU#
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
Cc: Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBBcHIgMTYsIDIwMTkgYXQgMDk6MjM6MTFBTSAtMDcwMCwgSm9obiBMLiBQb29sZSB3
cm90ZToKPiAKPiBPbiAzLzI3LzIwMTkgNzoyMSBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiA+
ID4gPiBPbiAyNy4wMy4xOSBhdCAxNDoyNSwgPGpscG9vbGU1NkBnbWFpbC5jb20+IHdyb3RlOgo+
ID4gPiBPbiAzLzI3LzIwMTkgMToxNCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiA+ID4gPiA+
ID4gT24gMjYuMDMuMTkgYXQgMTg6MjEsIDxqbHBvb2xlNTZAZ21haWwuY29tPiB3cm90ZToKPiA+
ID4gPiA+IHpldGEgL3Vzci9sb2NhbC9zcmMveGVuICMgY2F0IHhlbi8uY29uZmlnIHxncmVwIENP
TkZJR19IVk0KPiA+ID4gPiA+ICMgQ09ORklHX0hWTSBpcyBub3Qgc2V0Cj4gPiA+ID4gPiB6ZXRh
IC91c3IvbG9jYWwvc3JjL3hlbiAjCj4gPiA+ID4gPiAKPiA+ID4gPiA+ICMgdHJpZWQgMiBib290
IGF0dGVtcHRzCj4gPiA+ID4gPiBsb2cgYXQ6IGh0dHBzOi8vcGFzdGViaW4uY29tL25MNEJXSjZZ
Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IEhhbmcgcG9pbnRzIGF0IGxpbmVzOgo+ID4gPiA+IFRoYW5r
cyBmb3IgdHJ5aW5nIGFueXdheTsgb25lIGZ1cnRoZXIgcG9zc2liaWxpdHkgZWxpbWluYXRlZC4g
TG9va2luZwo+ID4gPiA+IGF0IHRoZSBsb2dzIEkndmUgaGFkIGFub3RoZXIgdGhvdWdodCAod2ls
ZCBndWVzcyBhZ2Fpbiwgc28gbm90IHJlYWxseQo+ID4gPiA+IG11Y2ggaG9wZSk6IENvdWxkIHlv
dSB0cnkgIm13YWl0LWlkbGU9bm8iPwo+ID4gPiA+IAo+ID4gPiBJIG1vZGlmaWVkIG1hbl94ZW4u
Y2ZnIGJ5IGFkZGluZyBhdCB0aGUgZW5kIHRoZSBrZXJuZWwgcGFyYW1ldGVyOgo+ID4gPiAKPiA+
ID4gbXdhaXQtaWRsZT1ubwo+ID4gPiAKPiA+ID4gUmVib290ZWQuCj4gPiA+IFJlc3VsdDogaHVu
ZzoKPiA+IFRoYW5rcy4gSSdtIGFmcmFpZCBJJ20gb3V0IG9mIGlkZWFzIGZvciB0aGUgbW9tZW50
Lgo+ID4gCj4gPiBKYW4KPiA+IAo+ID4gCj4gSmFuLAo+IAo+IFJlY2FsbCwgdGhlIFhlbiBrZXJu
ZWwgc3VjY2Vzc2Z1bGx5IGxhdW5jaGVkIGluIDIwMTcgd2hlbiBJIGZpcnN0IGJ1aWx0Cj4gWGVu
IGluIEdlbnRvbywgdGhhdCB3YXMgYWJvdXQgdmVyc2lvbiA0LjcuMS7CoCBJIGhhZCB0byBsYXVu
Y2ggaXQKPiBmcm9tIGFuIEVGSSBjb25zb2xlLsKgIEkndmUgdHJpZWQgdG8gcmV2ZXJ0IGJhY2sg
dG8gNC43LjEgYW5kCj4gYnVpbGQgYSBrZXJuZWwgYW5kIEkgaGF2ZSBmb3VuZCBpdCB0b28gZGlm
ZmljdWx0IGFzIGNlcnRhaW4KPiBkZXBlbmRlbmNpZXMgaGF2ZSBzaW5jZSBiZWVuIHJlbW92ZWQg
ZnJvbSBHZW50b28uCgpVbmxlc3Mgc29tZSBvZiB1cyBjYW4gZ2V0IG91ciBoYW5kcyBvbiBvbmUg
b2Ygc3VjaCBzeXN0ZW1zIEkgdGhpbmsKeW91ciBiZXN0IGJldCB3b3VsZCBiZSB0byB0cnkgdG8g
YmlzZWN0IHRoZSBjaGFuZ2VzIGJldHdlZW4gNC43IGFuZAo0LjggaWYgNC43IHdhcyBpbmRlZWQg
d29ya2luZyBvbiB5b3VyIHN5c3RlbS4KCk5vdGUgdGhhdCB5b3Ugb25seSBuZWVkIHRvIGJ1aWxk
IHRoZSBYZW4gaHlwZXJ2aXNvciAobWFrZSB4ZW4pIGluCm9yZGVyIHRvIGJpc2VjdCB0aGlzIGlz
c3VlLCB0aGVyZSdzIG5vIG5lZWQgdG8gYnVpbGQgdGhlIHRvb2xzIGF0CmFsbCwgd2hpY2ggaXMg
d2hlcmUgYWxtb3N0IGFsbCBvZiB0aGUgZGVwZW5kZW5jaWVzIGNvbWUgZnJvbS4gVGhlCmh5cGVy
dmlzb3IgaXMgbW9zdGx5IHN0YW5kYWxvbmUgYW5kIG9ubHkgaGF2ZSBkZXBlbmRlbmNpZXMgb24g
YQpjb3VwbGUgb2YgdG9vbHMuCgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
