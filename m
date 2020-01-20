Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0821426D7
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 10:14:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itT52-0000eb-DR; Mon, 20 Jan 2020 09:10:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=p+GQ=3J=iki.fi=pasik@srs-us1.protection.inumbo.net>)
 id 1itT50-0000eW-Jz
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 09:10:42 +0000
X-Inumbo-ID: b560679c-3b64-11ea-b833-bc764e2007e4
Received: from fgw21-4.mail.saunalahti.fi (unknown [62.142.5.108])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b560679c-3b64-11ea-b833-bc764e2007e4;
 Mon, 20 Jan 2020 09:10:32 +0000 (UTC)
Received: from ydin.reaktio.net (reaktio.net [85.76.255.15])
 by fgw21.mail.saunalahti.fi (Halon) with ESMTP
 id b50d6366-3b64-11ea-bfc2-005056bdd08f;
 Mon, 20 Jan 2020 11:10:31 +0200 (EET)
Received: by ydin.reaktio.net (Postfix, from userid 1001)
 id 463D736C0F6; Mon, 20 Jan 2020 11:10:30 +0200 (EET)
Date: Mon, 20 Jan 2020 11:10:30 +0200
From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200120091029.GP21578@reaktio.net>
References: <20200104010759.GA2507@mail-itl>
 <ee338bbe-647e-36c9-a22e-8a082f97b08c@suse.com>
 <20200119103945.GN21578@reaktio.net>
 <f4099f0e-2084-1fb3-5038-9e82b6a3e3e1@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f4099f0e-2084-1fb3-5038-9e82b6a3e3e1@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [Xen-devel] Broken PCI device passthrough, after XSA-302 fix?
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
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMjAsIDIwMjAgYXQgMDk6MzY6MjdBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTkuMDEuMjAyMCAxMTozOSwgUGFzaSBLw6Rya2vDpGluZW4gd3JvdGU6Cj4gPiBP
biBNb24sIEphbiAwNiwgMjAyMCBhdCAwMjowNjoxNFBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiBPbiAwNC4wMS4yMDIwIDAyOjA3LCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kg
IHdyb3RlOgo+ID4+PiBJIGhhdmUgYSBtdWx0aS1mdW5jdGlvbiBQQ0kgZGV2aWNlLCBiZWhpbmQg
YSBQQ0kgYnJpZGdlLCB0aGF0IG5vcm1hbGx5Cj4gPj4+IEkgYXNzaWduIHRvIGEgc2luZ2xlIGRv
bWFpbi4gQnV0IG5vdyBpdCBmYWlscyB3aXRoOgo+ID4+Pgo+ID4+PiAoWEVOKSBbVlQtRF1kMTQ6
IDAwMDA6MDQ6MDAuMCBvd25lZCBieSBkMCE8Rz48MD5hc3NpZ24gMDAwMDowNTowMC4wIHRvIGRv
bTE0IGZhaWxlZCAoLTIyKQo+ID4+Cj4gPj4gSSd2ZSB0cmllZCB0aGlzIG91dCBpbiBhcyBjbG9z
ZSBhIHNldHVwIGFzIEkgY291bGQgYXJyYW5nZSBmb3IsIGJ1dAo+ID4+IG5vdCBvbmUgbWF0Y2hp
bmcgeW91ciBzY2VuYXJpby4gSSBkaWRuJ3QgZmluZCBhIHN5c3RlbSB3aXRoIGEKPiA+PiBzdWl0
YWJseSBwbGFjZWQgKGluIHRoZSB0b3BvbG9neSkgbXVsdGktZnVuY3Rpb24gZGV2aWNlIChoYWQg
dG8gdXNlCj4gPj4gYSBzaW5nbGUtZnVuY3Rpb24gb25lKSwgYW5kIG9mIGNvdXJzZSBJIGRpZCB0
aGlzIG9uIChjbG9zZSB0bykKPiA+PiBtYXN0ZXIuIE5vIGFub21hbGllcy4gSGVuY2UgSSB3b25k
ZXIgd2hldGhlciBlaXRoZXIgb2YgdGhlIHR3bwo+ID4+IGRpZmZlcmVuY2VzIG1lbnRpb25lZCBt
YXR0ZXJzLCBhbmQgLSBpZiwgYXMgSSBzdXNwZWN0LCBpdCdzIHRoZQo+ID4+IG11bHRpLWZ1bmN0
aW9uIGFzcGVjdCB0aGF0IGlzIHJlbGV2YW50IGhlcmUgLSBob3cgdGhpbmdzIHdvdWxkIGhhdmUK
PiA+PiB3b3JrZWQgYXQgYWxsIGJlZm9yZSB0aG9zZSByZWNlbnQgY2hhbmdlcy4gVGhpcyBpcyBi
ZWNhdXNlIEkgdGhpbmsKPiA+PiB5b3Ugc2hvdWxkIGhhdmUgaGl0IHRoZSBzYW1lIGVycm9yIHBh
dGggZXZlbiBiZWZvcmUsIGFuZCBpdCB3b3VsZAo+ID4+IHNlZW0gdG8gbWUgdGhhdCB0aGUgcGF0
Y2ggYmVsb3cgbWlnaHQgYmUgKGFuZCBoYXZlIGJlZW4pIG5lZWRlZC4KPiA+Pgo+ID4gCj4gPiBJ
IHRoaW5rIE1hcmVrIGNvbmZpcm1lZCBpbiB0aGUgb3RoZXIgbWFpbCB0aGF0IHRoaXMgcGF0Y2gg
Zml4ZXMgdGhlIGlzc3VlLgo+ID4gCj4gPiBBcmUgeW91IHBsYW5uaW5nIHRvIG1lcmdlIHRoaXMg
cGF0Y2g/Cj4gCj4gV2VsbCwgaXQgaXMgc3RpbGwgcGVuZGluZyBhIG1haW50YWluZXIgYWNrLiBL
ZXZpbiBoYXMgcmVxdWVzdGVkIGEKPiAobWVjaGFuaWNhbCkgY2hhbmdlIGp1c3Qgb3ZlciB0aGUg
d2Vla2VuZC4KPgoKQWgsIHNvcnJ5LCBJIG1pc3NlZCB0aGUgb3RoZXIgdGhyZWFkLiBUaGUgcGF0
Y2ggaW4gcXVlc3Rpb24gc2VlbXMgdG8gYmU6CgoiW1BBVENIIDEvMl0gVlQtZDogZG9uJ3QgcGFz
cyBicmlkZ2UgZGV2aWNlcyB0byBkb21haW5fY29udGV4dF9tYXBwaW5nX29uZSgpIiwKaW4gdGhy
ZWFkOiAiW1BBVENIIDAvMl0gVlQtZDogZG9tYWluX2NvbnRleHRfbWFwcGluZ19vbmUoKSBhZGp1
c3RtZW50cyIuCgoKVGhhbmtzLgoKLS0gUGFzaQoKPiAKPiBKYW4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
