Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 670AD1057A8
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 17:59:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXpkX-00058g-SZ; Thu, 21 Nov 2019 16:56:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iXpkV-00058b-Up
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 16:56:07 +0000
X-Inumbo-ID: ceac13e0-0c7f-11ea-b678-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ceac13e0-0c7f-11ea-b678-bc764e2007e4;
 Thu, 21 Nov 2019 16:56:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 295EEB155;
 Thu, 21 Nov 2019 16:56:05 +0000 (UTC)
To: George Dunlap <George.Dunlap@citrix.com>
References: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
 <4f0df64e7c21d70d72cee4fff3f3821a@crc.id.au>
 <006fa7b3-ae93-2812-c88a-7bf8e2ac88b0@suse.com>
 <5ba3cff4-d898-b994-6b73-262146c0037e@suse.com>
 <01D97001-4B2B-4AD7-9C0A-8E2EC03BC90D@citrix.com>
 <eab9a5c6-8944-cc5c-f025-84696c91899e@suse.com>
 <8384E7A3-C510-447C-A803-973B8F23B23C@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f8ee4b74-aaf7-7497-b6c9-27b12bbbbc0a@suse.com>
Date: Thu, 21 Nov 2019 17:56:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <8384E7A3-C510-447C-A803-973B8F23B23C@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Status of 4.13
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
Cc: Juergen Gross <jgross@suse.com>, StevenHaigh <netwiz@crc.id.au>,
 Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMTEuMjAxOSAxNzowMywgR2VvcmdlIER1bmxhcCB3cm90ZToKPiAKPiAKPj4gT24gTm92
IDIxLCAyMDE5LCBhdCAzOjM0IFBNLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdy
b3RlOgo+Pgo+PiBPbiAyMS4xMS4yMDE5IDE2OjIwLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+Pj4K
Pj4+Cj4+Pj4gT24gTm92IDIxLCAyMDE5LCBhdCA4OjQxIEFNLCBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4+Cj4+Pj4gT24gMjEuMTEuMjAxOSAwODozNiwgSsO8cmdl
biBHcm/DnyB3cm90ZToKPj4+Pj4gT24gMjEuMTEuMTkgMDg6MzAsIFN0ZXZlbiBIYWlnaCB3cm90
ZToKPj4+Pj4+IE9uIDIwMTktMTEtMjEgMTc6MDUsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+Pj4+
Pj4gV2hlcmUgZG8gd2Ugc3RhbmQgd2l0aCBYZW4gNC4xMyByZWdhcmRpbmcgYmxvY2tlcnMgYW5k
IHJlbGF0ZWQgcGF0Y2hlcz8KPj4+Pj4+Pgo+Pj4+Pj4+IDIuIFJ5emVuL1JvbWUgZmFpbHVyZXMg
d2l0aCBXaW5kb3dzIGd1ZXN0czoKPj4+Pj4+PiAgIFdoYXQgaXMgdGhlIGN1cnJlbnRseSBwbGFu
bmVkIHdheSB0byBhZGRyZXNzIHRoZSBwcm9ibGVtPyBXaG8gaXMKPj4+Pj4+PiAgIHdvcmtpbmcg
b24gdGhhdD8KPj4+Pj4+Cj4+Pj4+PiBBIHdvcmthcm91bmQgd2FzIGZvdW5kIGJ5IHNwZWNpZnlp
bmcgY3B1aWQgdmFsdWVzIGluIHRoZSBXaW5kb3dzIFZNIAo+Pj4+Pj4gY29uZmlnIGZpbGUuCj4+
Pj4+Pgo+Pj4+Pj4gVGhlIHdvcmthcm91bmQgbGluZSBpczoKPj4+Pj4+IGNwdWlkID0gWyAiMHg4
MDAwMDAwODplY3g9eHh4eHh4eHh4eHh4eHh4eDAxMDB4eHh4eHh4eHh4eHgiIF0KPj4+Pj4+Cj4+
Pj4+PiBJdCB3YXMgc3VnZ2VzdGVkIHRoYXQgdGhpcyBiZSBkb2N1bWVudGVkIC0gYnV0IG5vIGlt
bWVkaWF0ZSBhY3Rpb24gCj4+Pj4+PiBzaG91bGQgYmUgdGFrZW4gLSB3aXRoIGEgdmlldyB0byBj
b3JyZWN0IHRoaXMgcHJvcGVybHkgaW4gNC4xNC4KPj4+Pj4KPj4+Pj4gSSdtIGF3YXJlIG9mIHRo
ZSBzdWdnZXN0aW9uLCBidXQgbm90IG9mIGFueSBkZWNpc2lvbi4gOi0pCj4+Pj4KPj4+PiBJdCB3
YXMgbXkgdW5kZXJzdGFuZGluZyB0aGF0IHdlJ2QgY2FwIHRoZSA0LWJpdCB2YWx1ZSB0byA3IGZv
cgo+Pj4+IHRoZSB0aW1lIGJlaW5nLiBJIHRoaW5rIEdlb3JnZSB3YXMgcGxhbm5pbmcgdG8gc2Vu
ZCBhIHBhdGNoLgo+Pj4KPj4+IE9uIHRoYXQgYWxzbywgSeKAmW0gYXdhcmUgb2YgdGhlIHN1Z2dl
c3Rpb24sIGJ1dCBub3Qgb2YgYW55IGRlY2lzaW9uLgo+Pj4gSSBkb27igJl0IHRoaW5rIEkgZ290
IG11Y2ggZmVlZGJhY2ssIHBvc2l0aXZlIG9yIG5lZ2F0aXZlLCBhYm91dCB0aGUgaWRlYS4KPj4+
Cj4+PiBTdXBwb3NlIHdlIGltcGxlbWVudCB0aGUgbGltaXQgZm9yIDQuMTMuIElmIHNvbWVvbmUg
cnVucyBMaW51eCBWTXMKPj4+IG9uIDQuMTIgYSBzeXN0ZW0gd2l0aCBhIGhhcmR3YXJlIHZhbHVl
IG9mIDcgZm9yIGFwaWNfaWRfc2l6ZSwgdGhlCj4+PiBndWVzdHMgd2lsbCBzZWUgOC4gIElmIHRo
ZXkgdGhlbiBtaWdyYXRlIHRvIDQuMTMsIHRoZSB2YWx1ZSB3aWxsCj4+PiBtYWdpY2FsbHkgY2hh
bmdlIHVuZGVyIHRoZWlyIGZlZXQgdG8gNy4gIElzIHRoYXQgT0s/Cj4+Cj4+IExldCdzIGxvb2sg
YXQgdGhlIHByZXJlcXMgZm9yIHJ1bm5pbmcgYSBMaW51eCAob3IgYWN0dWFsbHkgYW55KSBWTQo+
PiBvbiBzdWNoIGhhcmR3YXJlOiBBdCBsZWFzdCBvbiBkdWFsIHNvY2tldCBzeXN0ZW1zIHdpdGgg
c3VjaCBDUFVzCj4+IFhlbiA0LjEyIHdvdWxkbid0IGV2ZW4gYm9vdC4gSSBkb24ndCBrbm93IGhv
dyB3aWRlIGEgcmFuZ2Ugb2YKPj4gc2luZ2xlIHNvY2tldCBzeXN0ZW1zIHdpdGggdGhlc2UgNjQt
Y29kZSBDUFVzIHdvdWxkIGV4aXN0IG9yCj4+IGFwcGVhciBkb3duIHRoZSByb2FkLgo+Pgo+PiBU
aGUgd29ya2Fyb3VuZCBiZWZvcmUgb3VyIGVuYWJsaW5nIG9mIHgyQVBJQyBtb2RlIGZvciB0aGVz
ZSBib3hlcwo+PiB3YXMgdG8gZGlzYWJsZSBTTVQsIHdoaWNoIGhhcyB0aGUgc2lkZSBlZmZlY3Qg
b2YgY2hhbmdpbmcgc2FpZAo+PiB2YWx1ZSB0byA2Lgo+IAo+IENhbiB5b3UgZXhwYW5kIG9uIHRo
aXMgYSBiaXQ/ICBBcmUgeW91IHNheWluZyB0aGF0IFhlbiA0LjEyCj4gY291bGRu4oCZdCBib290
IG9uIHN1Y2ggYSBzeXN0ZW0sIGFuZCBzbyBhcyBsb25nIGFzIHdlIGxpbWl0IHRoaXMKPiBpbiB0
aGUgZmlyc3QgWGVuIHJlbGVhc2Ugd2hpY2ggKmNhbiosIHdlIHdvbuKAmXQgaGF2ZSBhIGJhY2t3
YXJkcwo+IGNvbXBhdGliaWxpdHkgcHJvYmxlbT8KPiAKPiBCdXQgSSB0aG91Z2h0IFN0ZXZlbiBo
YWQgYWxyZWFkeSBlbmNvdW50ZXJlZCBhbmQgZml4ZWQgdGhpcyBpc3N1ZQo+IG9uIHN1Y2ggYSBz
eXN0ZW0gcnVubmluZyA0LjEyIChvciBzb21ldGhpbmcgZWFybGllcikuCgpMb29rcyBsaWtlIEkg
d2FzIG1pcy1yZW1lbWJlcmluZyAtIGluZGVlZCBBbmRyZWFzIHBvc3RlZCBzdWNoCkNQVUlEIG91
dHB1dCAoZGVzcGl0ZSB0aGlzIGFwcGFyZW50bHkgb25seSBoYXZpbmcgYmVlbiBhbiA4LWNvcmUK
Y2hpcCkuCgo+PiBBcyB0byB5b3VyIGFjdHVhbCBxdWVzdGlvbiAtIGFzIGZhciBhcyBMaW51eCBn
b2VzLCBJIGRvbid0IHRoaW5rCj4+IHRoZXkgcmUtZXZhbHVhdGUgdGhpcyBDUFVJRCBsZWFmIHBv
c3QgYm9vdC4gQnV0IEkgY291bGQgYmUgd3JvbmcKPj4gd2l0aCB0aGlzLCBhbmQgb2YgY291cnNl
IG90aGVyIE9TZXMgbWlnaHQgYmVoYXZlIGRpZmZlcmVudGx5Lgo+IAo+IFdoYXQgSeKAmW0gbm90
IGdldHRpbmcgaGVyZSBpcyBhIHJlY29tbWVuZGF0aW9uLiA6LSkgIEkgZG9u4oCZdCByZWFsbHkK
PiBrbm93IHdoYXQgdGhlIGNoYW5jZXMgb2YgYWxsIHRoZXNlIHRoaW5ncyBoYXBwZW5pbmcgYXJl
LgoKTm9yIGRvIEkuIE15IF9ndWVzc18gaXMgaXQgc2hvdWxkbid0IHVwc2V0IGFueSBndWVzdC4K
Cj4gSWYgeW91IHRoaW5rIHRoZXJl4oCZcyBhdCBsZWFzdCBhIDI1JSBjaGFuY2Ugb2YgaXQgYmVp
bmcgYXBwcm92ZWQsCj4gSSBjYW4gc2VuZCBhIHBhdGNoIHRvIGxpbWl0IHRoZSB2YWx1ZSB0byA3
LCBhbmQgd2UgY2FuIGRpc2N1c3MKPiBpdCBtb3JlIHRoZXJlICh3aGVyZSB0aGUgcGF0Y2ggbmFt
ZSB3aWxsIG1ha2UgaXQgbW9yZSBjbGVhcgo+IHdoYXTigJlzIGJlaW5nIGRpc2N1c3NlZCkuCgpT
aW5jZSB3ZSdyZSBsb29raW5nIGZvciBhIHByZWZlcmFibHkgY2hlYXAgYW5kIHNpbXBsZSB3b3Jr
YXJvdW5kCnJhdGhlciBhbiBhY3R1YWwgc29sdXRpb24sIEkgdGhpbmsgc3VjaCBhIHBhdGNoIGhh
cyBoaWdoZXIgdGhhbgoyNSUgcHJvYmFiaWxpdHkgb2YgZ2V0dGluZyBhcHByb3ZlZC4KCkphbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
