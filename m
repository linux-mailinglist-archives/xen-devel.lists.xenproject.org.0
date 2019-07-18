Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 683A26CC29
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 11:46:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho2wQ-0007m1-FU; Thu, 18 Jul 2019 09:43:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6kuv=VP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ho2wP-0007lv-7i
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 09:43:09 +0000
X-Inumbo-ID: 71037bc2-a940-11e9-b14e-3331392fa889
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 71037bc2-a940-11e9-b14e-3331392fa889;
 Thu, 18 Jul 2019 09:43:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AD22AAF77;
 Thu, 18 Jul 2019 09:43:04 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1563217075.6815.14.camel@amazon.com>
 <86e560c4-5a14-75fd-8b06-a77e66a8f0a5@prgmr.com>
 <35baad47-f22c-2378-a7a5-f0c48c3eafb8@suse.com>
 <aca2e606-17fa-6266-1e9c-1989d4da6217@prgmr.com>
 <9d6fc9d6-f63a-ae65-bbfa-5e489fda9acf@citrix.com>
 <5274084e-ea01-8c61-5ca5-75bbe7ea987a@suse.com>
 <20190718094027.tlqycz7vsxx4exxf@Air-de-Roger.citrite.net>
From: Juergen Gross <jgross@suse.com>
Message-ID: <ed83af2b-f504-9f15-ffcb-cf08d095444a@suse.com>
Date: Thu, 18 Jul 2019 11:43:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190718094027.tlqycz7vsxx4exxf@Air-de-Roger.citrite.net>
Content-Language: de-DE
Subject: Re: [Xen-devel] Design session report: Live-Updating Xen
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Sarah Newman <srn@prgmr.com>,
 Leonard Foerster <foersleo@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDcuMTkgMTE6NDAsIFJvZ2VyIFBhdSBNb25uw6kgIHdyb3RlOgo+IE9uIFRodSwgSnVs
IDE4LCAyMDE5IGF0IDExOjAwOjIzQU0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9u
IDE3LjA3LjE5IDAwOjI3LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4gT24gMTYvMDcvMjAxOSAw
NToyMCwgU2FyYWggTmV3bWFuIHdyb3RlOgo+Pj4+IE9uIDcvMTUvMTkgODo0OCBQTSwgSnVlcmdl
biBHcm9zcyB3cm90ZToKPj4+Pj4gT24gMTUuMDcuMTkgMjE6MzEsIFNhcmFoIE5ld21hbiB3cm90
ZToKPj4+Pj4+IE9uIDcvMTUvMTkgMTE6NTcgQU0sIEZvZXJzdGVyLCBMZW9uYXJkIHdyb3RlOgo+
Pj4+Pj4gLi4uCj4+Pj4+Pj4gQSBrZXkgY29ybmVyc3RvbmUgZm9yIExpdmUtdXBkYXRlIGlzIGd1
ZXN0IHRyYW5zcGFyZW50IGxpdmUgbWlncmF0aW9uCj4+Pj4+PiAuLi4KPj4+Pj4+PiAgIMKgwqDC
oMKgLT4gZm9yIGxpdmUgbWlncmF0aW9uOiBkb21pZCBpcyBhIHByb2JsZW0gaW4gdGhpcyBjYXNl
Cj4+Pj4+Pj4gICDCoMKgwqDCoMKgwqDCoCAtPiByYW5kb21pemUgYW5kIHByYXkgZG9lcyBub3Qg
d29yayBvbiBzbWFsbGVyIGZsZWV0cwo+Pj4+Pj4+ICAgwqDCoMKgwqDCoMKgwqAgLT4gdGhpcyBp
cyBub3QgYSBwcm9ibGVtIGZvciBsaXZlLXVwZGF0ZQo+Pj4+Pj4+ICAgwqDCoMKgwqDCoMKgwqAg
LT4gQlVUOiBhcyBhIGNvbW11bml0eSB3ZSBzaG91ZGwgbWFrZSB0aGlzIHJlc3RyaWN0aW9uIGdv
IGF3YXkKPj4+Pj4+Cj4+Pj4+PiBBbmRyZXcgQ29vcGVyIHBvaW50ZWQgb3V0IHRvIG1lIHRoYXQg
bWFudWFsbHkgYXNzaWduaW5nIGRvbWFpbiBJRHMKPj4+Pj4+IGlzIHN1cHBvcnRlZCBpbiBtdWNo
IG9mIHRoZSBjb2RlIGFscmVhZHkuIElmIGd1ZXN0IHRyYW5zcGFyZW50IGxpdmUKPj4+Pj4+IG1p
Z3JhdGlvbiBnZXRzIG1lcmdlZCwgd2UnbGwgbG9vayBhdCBwYXNzaW5nIGluIGEgZG9tYWluIElE
IHRvIHhsLAo+Pj4+Pj4gd2hpY2ggd291bGQgYmUgZ29vZCBlbm91Z2ggZm9yIHVzLiBJIGRvbid0
IGtub3cgYWJvdXQgdGhlIG90aGVyCj4+Pj4+PiB0b29sc3RhY2tzLgo+Pj4+Pgo+Pj4+PiBUaGUg
bWFpbiBwcm9ibGVtIGlzIHRoZSBjYXNlIHdoZXJlIG9uIHRoZSB0YXJnZXQgaG9zdCB0aGUgZG9t
aWQgb2YgdGhlCj4+Pj4+IG1pZ3JhdGVkIGRvbWFpbiBpcyBhbHJlYWR5IGluIHVzZSBieSBhbm90
aGVyIGRvbWFpbi4gU28geW91IGVpdGhlciBuZWVkCj4+Pj4+IGEgZG9taWQgYWxsb2NhdG9yIHNw
YW5uaW5nIGFsbCBob3N0cyBvciB0aGUgY2hhbmdlIG9mIGRvbWlkIGR1cmluZwo+Pj4+PiBtaWdy
YXRpb24gbXVzdCBiZSBoaWRkZW4gZnJvbSB0aGUgZ3Vlc3QgZm9yIGd1ZXN0IHRyYW5zcGFyZW50
IG1pZ3JhdGlvbi4KPj4+Pgo+Pj4+IFllcy4gVGhlcmUgYXJlIHNvbWUgY2x1c3RlciBtYW5hZ2Vt
ZW50IHN5c3RlbXMgd2hpY2ggdXNlIHhsIHJhdGhlcgo+Pj4+IHRoYW4geGFwaS4KPj4+PiBUaGV5
IGNvdWxkIGJlIGV4dGVuZGVkIHRvIG1hbmFnZSBkb21haW4gSURzIGlmIGl0J3MgdG9vIGRpZmZp
Y3VsdCB0bwo+Pj4+IGFsbG93Cj4+Pj4gdGhlIGRvbWFpbiBJRCB0byBjaGFuZ2UgZHVyaW5nIG1p
Z3JhdGlvbi4KPj4+Cj4+PiBGb3IgYSB2MSBmZWF0dXJlLCBoYXZpbmcgYSByZXN0cmljdGlvbiBv
ZiAieW91IG11c3QgbWFuYWdlIGRvbWlkcyBhY3Jvc3MKPj4+IHRoZSBjbHVzdGVyIiBpcyBhIGZp
bmUuwqAgR3Vlc3QtdHJhbnNwYXJlbnQgbWlncmF0aW9uIGlzIGEgdmVyeSBpbXBvcnRhbnQKPj4+
IGZlYXR1cmUsIGFuZCBvbmUgd2hlcmUgd2UgYXJlIGxhY2tpbmcgaW4gcmVsYXRpb24gdG8gb3Ro
ZXIgaHlwZXJ2aXNvcnMuCj4+Pgo+Pj4gTG9uZ2VyIHRlcm0sIHdlIGFzIHRoZSBYZW4gY29tbXVu
aXR5IG5lZWQgdG8gZmlndXJlIG91dCBhIHdheSB0byByZW1vdmUKPj4+IHRoZSBkZXBlbmRlbmN5
IG9uIGRvbWlkcywgYXQgd2hpY2ggcG9pbnQgdGhlIGNsdXN0ZXItd2lkZSBtYW5hZ2VtZW50Cj4+
PiByZXN0cmljdGlvbiBjYW4gYmUgZHJvcHBlZC7CoCBUaGlzIGlzbid0IGdvaW5nIHRvIGJlIGEg
dHJpdmlhbCB0YXNrLCBidXQKPj4+IGl0IHdpbGwgYmUgYSB3b3J0aHdoaWxlIG9uZS4KPj4KPj4g
QW5vdGhlciBwcm9ibGVtIGFyZSBYZW5zdG9yZSB3YXRjaGVzLiBXaXRoIGd1ZXN0IHRyYW5zcGFy
ZW50IExNIHRoZXkgYXJlCj4+IGxvc3QgdG9kYXkgYXMgdGhlcmUgaXMgY3VycmVudGx5IG5vIHdh
eSB0byBtaWdyYXRlIHRoZW0gdG8gdGhlIHRhcmdldAo+PiBYZW5zdG9yZS4KPiAKPiBIbSwgSSBn
dWVzcyBJJ20gbWlzc2luZyBzb21ldGhpbmcsIGJ1dCB4ZW5zdG9yZWQgcnVubmluZyBlaXRoZXIg
aW4KPiBkb20wIG9yIGluIGEgc3R1YmRvbWFpbiBzaG91bGQgYmUgY29tcGxldGVseSB1bmF3YXJl
IG9mIHRoZSBoeXBlcnZpc29yCj4gYmVpbmcgdXBkYXRlZCB1bmRlciBpdCdzIGZlZXQuIFRoZSBo
eXBlcnZpc29yIGl0c2VsZiBkb24ndCBoYXZlIGFueQo+IGtub3dsZWRnZSBpdHNlbGYgb2YgeGVu
c3RvcmUgc3RhdGUuCgpPaCwgcmlnaHQsIEkgd2FzIHRoaW5raW5nIGFib3V0IGd1ZXN0IHRyYW5z
cGFyZW50IExNIGZpcnN0IGFuZCB0aGVuCndpZGVuZWQgdGhlIHNjb3BlIHRvIExpdmUgVXBkYXRl
LgoKU28gdGhpcyBpcyBhIHByb2JsZW0gZm9yIGd1ZXN0IHRyYW5zcGFyZW50IExNIG9ubHkuCgoK
SnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
