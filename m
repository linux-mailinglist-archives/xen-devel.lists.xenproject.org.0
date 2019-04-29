Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E48E6A1
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 17:36:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL8HM-0007pb-U4; Mon, 29 Apr 2019 15:33:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ztS9=S7=citrix.com=prvs=015484912=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hL8HL-0007oa-30
 for xen-devel@lists.xen.org; Mon, 29 Apr 2019 15:33:15 +0000
X-Inumbo-ID: 194958a9-6a94-11e9-843c-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 194958a9-6a94-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 15:33:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,409,1549929600"; d="scan'208";a="89422089"
Date: Mon, 29 Apr 2019 17:27:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "John L. Poole" <jlpoole56@gmail.com>
Message-ID: <20190429152734.qy34zz56e43pawvf@Air-de-Roger>
References: <5C98F95C0200007800221B56@prv1-mh.provo.novell.com>
 <9288a3b8-8c59-c80f-68f3-14aaca9272d4@gmail.com>
 <5C99DD160200007800221D00@prv1-mh.provo.novell.com>
 <25b66cdf-94ad-6af1-de5f-e0f5369ae000@gmail.com>
 <5C9B30D002000078002220F5@prv1-mh.provo.novell.com>
 <1fccf915-9d0b-52ac-4d6d-df16194dabb0@gmail.com>
 <5C9B86FA0200007800222232@prv1-mh.provo.novell.com>
 <daff9af3-5008-42ac-1355-ca8ef94fadb5@gmail.com>
 <20190429120238.b4kjlmkpk5l2t6yb@Air-de-Roger>
 <f4f4007c-4643-aecf-6ab7-811c00156fca@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f4f4007c-4643-aecf-6ab7-811c00156fca@gmail.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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

T24gTW9uLCBBcHIgMjksIDIwMTkgYXQgMDg6MDg6MzNBTSAtMDcwMCwgSm9obiBMLiBQb29sZSB3
cm90ZToKPiAKPiBPbiA0LzI5LzIwMTkgNTowMiBBTSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToK
PiA+IE9uIFR1ZSwgQXByIDE2LCAyMDE5IGF0IDA5OjIzOjExQU0gLTA3MDAsIEpvaG4gTC4gUG9v
bGUgd3JvdGU6Cj4gPiA+IE9uIDMvMjcvMjAxOSA3OjIxIEFNLCBKYW4gQmV1bGljaCB3cm90ZToK
PiA+ID4gPiA+ID4gPiBPbiAyNy4wMy4xOSBhdCAxNDoyNSwgPGpscG9vbGU1NkBnbWFpbC5jb20+
IHdyb3RlOgo+ID4gPiA+ID4gT24gMy8yNy8yMDE5IDE6MTQgQU0sIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4gPiA+ID4gPiA+ID4gPiBPbiAyNi4wMy4xOSBhdCAxODoyMSwgPGpscG9vbGU1NkBnbWFp
bC5jb20+IHdyb3RlOgo+ID4gPiA+ID4gPiA+IHpldGEgL3Vzci9sb2NhbC9zcmMveGVuICMgY2F0
IHhlbi8uY29uZmlnIHxncmVwIENPTkZJR19IVk0KPiA+ID4gPiA+ID4gPiAjIENPTkZJR19IVk0g
aXMgbm90IHNldAo+ID4gPiA+ID4gPiA+IHpldGEgL3Vzci9sb2NhbC9zcmMveGVuICMKPiA+ID4g
PiA+ID4gPiAKPiA+ID4gPiA+ID4gPiAjIHRyaWVkIDIgYm9vdCBhdHRlbXB0cwo+ID4gPiA+ID4g
PiA+IGxvZyBhdDogaHR0cHM6Ly9wYXN0ZWJpbi5jb20vbkw0QldKNlkKPiA+ID4gPiA+ID4gPiAK
PiA+ID4gPiA+ID4gPiBIYW5nIHBvaW50cyBhdCBsaW5lczoKPiA+ID4gPiA+ID4gVGhhbmtzIGZv
ciB0cnlpbmcgYW55d2F5OyBvbmUgZnVydGhlciBwb3NzaWJpbGl0eSBlbGltaW5hdGVkLiBMb29r
aW5nCj4gPiA+ID4gPiA+IGF0IHRoZSBsb2dzIEkndmUgaGFkIGFub3RoZXIgdGhvdWdodCAod2ls
ZCBndWVzcyBhZ2Fpbiwgc28gbm90IHJlYWxseQo+ID4gPiA+ID4gPiBtdWNoIGhvcGUpOiBDb3Vs
ZCB5b3UgdHJ5ICJtd2FpdC1pZGxlPW5vIj8KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiBJIG1vZGlm
aWVkIG1hbl94ZW4uY2ZnIGJ5IGFkZGluZyBhdCB0aGUgZW5kIHRoZSBrZXJuZWwgcGFyYW1ldGVy
Ogo+ID4gPiA+ID4gCj4gPiA+ID4gPiBtd2FpdC1pZGxlPW5vCj4gPiA+ID4gPiAKPiA+ID4gPiA+
IFJlYm9vdGVkLgo+ID4gPiA+ID4gUmVzdWx0OiBodW5nOgo+ID4gPiA+IFRoYW5rcy4gSSdtIGFm
cmFpZCBJJ20gb3V0IG9mIGlkZWFzIGZvciB0aGUgbW9tZW50Lgo+ID4gPiA+IAo+ID4gPiA+IEph
bgo+ID4gPiA+IAo+ID4gPiA+IAo+ID4gPiBKYW4sCj4gPiA+IAo+ID4gPiBSZWNhbGwsIHRoZSBY
ZW4ga2VybmVsIHN1Y2Nlc3NmdWxseSBsYXVuY2hlZCBpbiAyMDE3IHdoZW4gSSBmaXJzdCBidWls
dAo+ID4gPiBYZW4gaW4gR2VudG9vLCB0aGF0IHdhcyBhYm91dCB2ZXJzaW9uIDQuNy4xLsKgIEkg
aGFkIHRvIGxhdW5jaCBpdAo+ID4gPiBmcm9tIGFuIEVGSSBjb25zb2xlLsKgIEkndmUgdHJpZWQg
dG8gcmV2ZXJ0IGJhY2sgdG8gNC43LjEgYW5kCj4gPiA+IGJ1aWxkIGEga2VybmVsIGFuZCBJIGhh
dmUgZm91bmQgaXQgdG9vIGRpZmZpY3VsdCBhcyBjZXJ0YWluCj4gPiA+IGRlcGVuZGVuY2llcyBo
YXZlIHNpbmNlIGJlZW4gcmVtb3ZlZCBmcm9tIEdlbnRvby4KPiA+IFVubGVzcyBzb21lIG9mIHVz
IGNhbiBnZXQgb3VyIGhhbmRzIG9uIG9uZSBvZiBzdWNoIHN5c3RlbXMgSSB0aGluawo+ID4geW91
ciBiZXN0IGJldCB3b3VsZCBiZSB0byB0cnkgdG8gYmlzZWN0IHRoZSBjaGFuZ2VzIGJldHdlZW4g
NC43IGFuZAo+ID4gNC44IGlmIDQuNyB3YXMgaW5kZWVkIHdvcmtpbmcgb24geW91ciBzeXN0ZW0u
Cj4gPiAKPiA+IE5vdGUgdGhhdCB5b3Ugb25seSBuZWVkIHRvIGJ1aWxkIHRoZSBYZW4gaHlwZXJ2
aXNvciAobWFrZSB4ZW4pIGluCj4gPiBvcmRlciB0byBiaXNlY3QgdGhpcyBpc3N1ZSwgdGhlcmUn
cyBubyBuZWVkIHRvIGJ1aWxkIHRoZSB0b29scyBhdAo+ID4gYWxsLCB3aGljaCBpcyB3aGVyZSBh
bG1vc3QgYWxsIG9mIHRoZSBkZXBlbmRlbmNpZXMgY29tZSBmcm9tLiBUaGUKPiA+IGh5cGVydmlz
b3IgaXMgbW9zdGx5IHN0YW5kYWxvbmUgYW5kIG9ubHkgaGF2ZSBkZXBlbmRlbmNpZXMgb24gYQo+
ID4gY291cGxlIG9mIHRvb2xzLgo+ID4gCj4gPiBSb2dlci4KPiBUaGFuayB5b3UsIFJvZ2VyLgo+
IAo+IEluIEdlbnRvbywgdGhlcmUgYXJlIHR3byBwYWNrYWdlcyBvZiB4ZW4gYW5kIHhlbi10b29s
cyB3aGljaAo+IHRlbmQgdG8gcHJvZ3Jlc3Mgd2l0aCB0aGUgc2FtZSByZWxlYXNlIG51bWJlci4g
V2hlbgo+IEkgdHJ5IHRvIGdvIGJhY2sgYW4gaW5zdGFsbCBhIDQuNy54IHNldCwgbXkgY29tcGls
ZXIgZXJyb3JzIG91dAo+IGluIHRoZSB4ZW4tdG9vbHPCoCB3aXRoOgo+ICJkaXJlY3RpdmUgd3Jp
dGluZyB1cCB0byAzOSBieXRlcyBpbnRvIGEgcmVnaW9uIG9mIHNpemUgYmV0d2VlbiAxNyBhbmQg
MzcgIgo+IHNvIEkgc3VzcGVjdCB0aGUgYWR2YW5jZW1lbnQgb2YgbXkgY29tcGlsZXIgaXMgZmlu
ZGluZyBwcm9ibGVtcwo+IG15IGNvbXBpbGVyIG9mIDIgeWVhcnMgYWdvIGNvdWxkIG5vdC4KPiAK
PiBJJ2xsIHRyeSB0byBpZiBJIGNhbiBtb2RpZnkgYSB4ZW4gNC43LnggcGFja2FnZSBwb2ludGlu
ZyB0byBhIHJlY2VudAo+IHhlbi10b29scywKPiBlLmcuIDQuMTIuMC7CoCBJZiB0aGF0IGRvZXNu
J3Qgd29yaywgSSdsbCB0cnkgdXNpbmcgYSB4ZW4gc291cmNlIGZyb20geW91cgo+IHJlcG9zaXRv
cnkgYW5kIGhhbmQgY29tcGlsZS4KCklNTyBpdCB3b3VsZCBiZSBiZXR0ZXIgaWYgeW91IGNhbiBi
dWlsZCBkaXJlY3RseSBmcm9tIHRoZSB1cHN0cmVhbSBnaXQKcmVwb3NpdG9yeSBbMF0sIHRoYXQg
d2F5IHlvdSBjb3VsZCB1c2UgZ2l0LWJpc2VjdCgxKSBpbiBvcmRlciB0byBmaWd1cmUKb3V0IHdo
aWNoIGNvbW1pdCBicm9rZSB5b3VyIHN5c3RlbS4gRm9yIGV4YW1wbGU6CgojIGdpdCBjbG9uZSBn
aXQ6Ly94ZW5iaXRzLnhlbi5vcmcveGVuLmdpdAojIGNkIHhlbgojIGdpdCBjaGVja291dCBSRUxF
QVNFLTQuNy4wCiMgbWFrZSB4ZW4gLWo4CgpUaGF0IHNob3VsZCBnaXZlIHlvdSBhIHNldCBvZiBY
ZW4gYmluYXJpZXMgaW4gdGhlIHhlbi8gZGlyZWN0b3J5LCBJSVJDCnlvdSBhcmUgYm9vdGluZyBm
cm9tIEVGSSBzbyB5b3UgbGlrZWx5IG5lZWQgeGVuL3hlbi5lZmkuCgpJZiB0aGF0IHdvcmtzLCB0
aGVuIHlvdSBjYW4gdGVzdCBSRUxFQVNFLTQuOC4wIGFuZCBpZiB0aGF0IGZhaWxzIHRvCmJvb3Qg
eW91IHNob3VsZCBoYXZlIGEgcmFuZ2Ugb2YgY29tbWl0cyB0aGF0IHlvdSBjYW4gYmlzZWN0IGlu
IG9yZGVyCnRvIGZpbmQgdGhlIGN1bHByaXQuCgpUaGFua3MsIFJvZ2VyLgoKWzBdIGh0dHA6Ly94
ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1zdW1tYXJ5CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
