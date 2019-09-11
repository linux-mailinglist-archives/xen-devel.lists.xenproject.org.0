Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B2DAFD02
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 14:43:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i81vo-0004Xf-N8; Wed, 11 Sep 2019 12:41:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=s4Ct=XG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i81vn-0004Xa-9q
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 12:41:07 +0000
X-Inumbo-ID: 6b2db27c-d491-11e9-b76c-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b2db27c-d491-11e9-b76c-bc764e2007e4;
 Wed, 11 Sep 2019 12:41:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 05FD6B78C;
 Wed, 11 Sep 2019 12:41:03 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190911062001.25931-1-jgross@suse.com>
 <20190911062001.25931-5-jgross@suse.com>
 <97a771af-32a3-596d-30e2-7042374d14e3@suse.com>
 <4ffa80f0-5d63-9d84-9030-9c5eaecc1541@suse.com>
 <a00f9b2a-1a2d-145f-daaf-6cd8cc4d3f25@suse.com>
 <21bad2b6-8487-a59c-71b3-aedf475e5170@suse.com>
 <8f7b8a19-3723-fd03-c612-856486eb96b5@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <da7a9ba2-7627-b2b8-56de-6abe0ceb561f@suse.com>
Date: Wed, 11 Sep 2019 14:41:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8f7b8a19-3723-fd03-c612-856486eb96b5@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [RFC PATCH 4/5] tools: add xenfs tool
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDkuMTkgMTM6NTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDExLjA5LjIwMTkgMTM6
MzQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDExLjA5LjE5IDEyOjA3LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDExLjA5LjIwMTkgMTE6NTcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gT24gMTEuMDkuMTkgMTE6MzAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxMS4wOS4y
MDE5IDA4OjIwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+Pj4gLS0tIGEvdG9vbHMvbWlzYy9N
YWtlZmlsZQo+Pj4+Pj4gKysrIGIvdG9vbHMvbWlzYy9NYWtlZmlsZQo+Pj4+Pj4gQEAgLTI0LDYg
KzI0LDcgQEAgSU5TVEFMTF9TQklOLSQoQ09ORklHX1g4NikgICAgICs9IHhlbi1sb3dtZW1kCj4+
Pj4+PiAgICAgSU5TVEFMTF9TQklOLSQoQ09ORklHX1g4NikgICAgICs9IHhlbi1tZm5kdW1wCj4+
Pj4+PiAgICAgSU5TVEFMTF9TQklOLSQoQ09ORklHX1g4NikgICAgICs9IHhlbi11Y29kZQo+Pj4+
Pj4gICAgIElOU1RBTExfU0JJTiAgICAgICAgICAgICAgICAgICArPSB4ZW5jb3YKPj4+Pj4+ICtJ
TlNUQUxMX1NCSU4gICAgICAgICAgICAgICAgICAgKz0geGVuZnMKPj4+Pj4KPj4+Pj4gV2h5IFNC
SU4/IElzIHRoZXJlIGFueXRoaW5nIHdyb25nIHdpdGggYWxsb3dpbmcgdW5wcml2aWxlZ2VkCj4+
Pj4+IHVzZXJzIHIvbyBhY2Nlc3M/IE9yIGlzIHRoaXMgYmVjYXVzZSBpbiBvcmRlciB0byBhY2Nl
c3MgdGhlCj4+Pj4+IGh5cGVyY2FsbCBpbnRlcmZhY2Ugb25lIG5lZWRzIHRvIGJlIHJvb3Q/IElm
IHNvLCB3ZSBtYXkgd2FudAo+Pj4+PiB0byBjb25zaWRlciByZWxheGluZy9hdm9pZGluZy9ieXBh
c3NpbmcgdGhpcyBpbiBzb21lIHNlbnNpYmxlCj4+Pj4+IHdheS4KPj4+Pgo+Pj4+IEluc3RhbGxp
bmcgdG8gYmluIGlzIGZpbmUgd2l0aCBtZSwgYnV0IHJlbGF4aW5nIHRoZSByb290IHJlc3RyaWN0
aW9uCj4+Pj4gbWlnaHQgYmUgbW9yZSBkaWZmaWN1bHQgYW5kL29yIHF1ZXN0aW9uYWJsZS4KPj4+
Pgo+Pj4+IEkgd2FzIHRoaW5raW5nIG9mICJtb3VudGluZyIgdGhlIHhlbi1zeXNmcyB0byBlaXRo
ZXIgWGVuc3RvcmUgb3IKPj4+PiB0aGUga2VybmVsJ3Mgc3lzZnMgKHByb2JhYmx5IHRoZSBsYXR0
ZXIsIGFzIFhlbnN0b3JlIGluIGEgc3R1YmRvbQo+Pj4+IHdvdWxkIG5lZWQgdG8gZW5hYmxlIGFj
Y2VzcyB0byB4ZW4tc3lzZnMgZm9yIHRoYXQgc3R1YmRvbSAsdG9vKS4KPj4+Pgo+Pj4+IFRoaXMg
d291bGQgdGhlbiBlbmFibGUgYWNjZXNzaW5nIHNvbWUgb3IgYWxsIGVudHJpZXMgZnJvbSBub24t
cm9vdC4KPj4+Cj4+PiBSaWdodCwgZ29pbmcgdGhyb3VnaCB0aGUga2VybmVsJ3Mgc3lzZnMgaXMg
d2hhdCBJIHRvbyB3YXMKPj4+IGNvbnNpZGVyaW5nIChJIGRvbid0IHRoaW5rIHhlbnN0b3JlIGlz
IGFwcHJvcHJpYXRlIGZvciB0aGlzKS4KPj4+IFRoZSBtYWluIGlzc3VlIEknZCBzZWUgd2l0aCB0
aGlzIGlzIHRoZSBzcGxpdCBicmFpbiBwZXJtaXNzaW9ucwo+Pj4gaGFuZGxpbmcuIEknZCBwcmVm
ZXIgZm9yIHRoZXJlIHRvIGJlIGp1c3Qgb25lIHBhcnR5IGRldGVybWluaW5nCj4+PiB3aG8gaXMg
YWxsb3dlZCB0byBzZWUgd2hhdCwgYnV0IGV2ZW4gaWYgdGhlIGh5cGVydmlzb3IgdG9sZCB0aGUK
Pj4+IGtlcm5lbCwgdGhlcmUgd291bGQgc3RpbGwgYmUgYSBkZXBlbmRlbmN5IHVwb24gdGhlIGtl
cm5lbCBhbHNvCj4+PiByZXNwZWN0aW5nIHRoZSByZXF1ZXN0LiBXaGlsZSBub3QgbXVjaCBvZiBh
IHByb2JsZW0gYXMgbG9uZyBhcwo+Pj4gYWxsIG9mIHRoaXMgaXMgRG9tMC1vbmx5LCB3aXRoIERv
bVUtcyBpbiBtaW5kIHRoaXMgd291bGQgbmVlZAo+Pj4gdGFraW5nIGNhcmUgb2YuCj4+Cj4+IEht
bSwgd2h5PyBJIHRoaW5rIHdlIGFncmVlIHRoYXQgRG9tVXMgc2hvdWxkIGdldCBhY2Nlc3Mgb25s
eSB0byBlaXRoZXIKPj4gZ2xvYmFsIGRhdGEgKHJlYWQtb25seSkgd2hpY2ggZG9lc24ndCBkbyBh
bnkgaGFybSwKPiAKPiBJIGd1ZXNzIG9waW5pb25zIHRlbmQgdG8gZGlmZmVyIGhlcmU6IFRoZXJl
IG1heSB3ZWxsIGJlIHBlb3BsZQo+IHRoaW5raW5nIHRoYXQgY2VydGFpbiB0aGluZ3Mgc2hvdWxk
bid0IGJlIHNlZW4gYnkgZXZlcnlvbmUuCgpJIGRpZG4ndCBtZWFuIHRvIGdpdmUgdGhlbSBhY2Nl
c3MgdG8gYWxsIGdsb2JhbCBkYXRhLCBidXQgdG8gc2VsZWN0ZWQKaXRlbXMgb25seS4gVGhpcyB3
b3VsZCBiZSBjb250cm9sbGVkIGJ5IHRoZSBoeXBlcnZpc29yLgoKPiAKPj4gb3IgdG8gZGF0YSBy
ZWxhdGVkCj4+IG9ubHkgdG8gdGhlbSAoc28gcGVyLWRvbWFpbiBkYXRhKS4gTWF5YmUgZHJpdmVy
LWRvbWFpbnMgb3IgZGV2aWNlIG1vZGVsCj4+IHN0dWJkb21zIHdvdWxkIG5lZWQgYWNjZXNzIHRv
IGRhdGEgcmVsYXRlZCB0byB0aGUgZG9tYWlucyB0aGV5IGFyZQo+PiBzZXJ2aW5nLgo+Pgo+PiBX
aGV0aGVyIGEgZG9tVSBsZXRzIGEgdXNlciBhY2Nlc3MgdGhhdCBkYXRhIG9yIG5vdCBzaG91bGQg
b25seSBiZQo+PiBkZWNpZGVkIGJ5IHRoZSBkb21VIChhcHBsaWVzIHRvIGRvbTAsIHRvbykuCj4g
Cj4gTGlrZSBhYm92ZSwgdGhlcmUgbWF5IGJlIGRpZmZlcmVudCB2aWV3cyBoZXJlIGFzIHdlbGwu
CgpCdXQgaG93IHNob3VsZCBYZW4gbWFrZSBhIGNob2ljZSBmb3IgdGhlIGd1ZXN0IGhlcmU/IFRo
ZSBndWVzdCBpcwpmcmVlIHRvIG5vdCBnaXZlIGl0cyB1c2VycyBhY2Nlc3MgdG8gdGhlIGRhdGEs
IGJ1dCBsaWtlIGRhdGEgcmV0dXJuZWQKdmlhIGEgaHlwZXJjYWxsIFhlbiBoYXMgYWJzb2x1dGVs
eSBubyB3YXkgdG8gY29udHJvbCB3aGV0aGVyIHRoZSBkYXRhCmlzIGFjY2Vzc2libGUgYnkgYSBn
dWVzdCdzIHVzZXIgcHJvY2VzcyBvciBub3QuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
