Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B11F2F0A
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 14:19:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iShem-0003y0-GP; Thu, 07 Nov 2019 13:17:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iShek-0003xv-Uz
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 13:16:58 +0000
X-Inumbo-ID: dfb87e46-0160-11ea-a1c6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dfb87e46-0160-11ea-a1c6-12813bfff9fa;
 Thu, 07 Nov 2019 13:16:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 926F8B329;
 Thu,  7 Nov 2019 13:16:56 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <db66edf2-ca66-4127-8920-ba55f4aee14e@suse.com>
 <65dd1d8b-fc41-78f6-f988-d354c5ada99c@citrix.com>
 <f2aacaf9-0ad9-4920-82e6-b0abfc22bc5d@suse.com>
 <6b571fcc-4e8d-30ee-9c2d-faed1bd1cfbf@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2d929d85-c164-4f3f-54d1-24c5844eb7ea@suse.com>
Date: Thu, 7 Nov 2019 14:17:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6b571fcc-4e8d-30ee-9c2d-faed1bd1cfbf@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 0/3] AMD/IOMMU: re-work mode updating
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
Cc: Juergen Gross <jgross@suse.com>, SanderEikelenboom <linux@eikelenboom.it>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMTEuMjAxOSAxMzo0OSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNy8xMS8yMDE5
IDA3OjM2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDYuMTEuMjAxOSAxODozMSwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDA2LzExLzIwMTkgMTU6MTYsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IHVwZGF0ZV9wYWdpbmdfbW9kZSgpIGluIHRoZSBBTUQgSU9NTVUgY29kZSBleHBlY3Rz
IHRvIGJlIGludm9rZWQgd2l0aAo+Pj4+IHRoZSBQQ0kgZGV2aWNlcyBsb2NrIGhlbGQuIFRoZSBj
aGVjayBvY2N1cnJpbmcgb25seSB3aGVuIHRoZSBtb2RlCj4+Pj4gYWN0dWFsbHkgbmVlZHMgdXBk
YXRpbmcsIHRoZSB2aW9sYXRpb24gb2YgdGhpcyBydWxlIGJ5IHRoZSBtYWpvcml0eQo+Pj4+IG9m
IGNhbGxlcnMgZGlkIGdvIHVubm90aWNlZCB1bnRpbCBwZXItZG9tYWluIElPTU1VIHNldHVwIHdh
cyBjaGFuZ2VkCj4+Pj4gdG8gZG8gYXdheSB3aXRoIG9uLWRlbWFuZCBjcmVhdGlvbiBvZiBJT01N
VSBwYWdlIHRhYmxlcy4KPj4+Pgo+Pj4+IFVuZm9ydHVuYXRlbHkgdGhlIG9ubHkgaGFsZiB3YXkg
cmVhc29uYWJsZSBmaXggdG8gdGhpcyB0aGF0IEkgY291bGQKPj4+PiBjb21lIHVwIHdpdGggcmVx
dWlyZXMgbW9yZSByZS13b3JrIHRoYW4gd291bGQgc2VlbSBkZXNpcmFibGUgYXQgdGhpcwo+Pj4+
IHRpbWUgb2YgdGhlIHJlbGVhc2UgcHJvY2VzcywgYnV0IGFkZHJlc3NpbmcgdGhlIGlzc3VlIHNl
ZW1zCj4+Pj4gdW5hdm9pZGFibGUgdG8gbWUgYXMgaXRzIG1hbmlmZXN0YXRpb24gaXMgYSByZWdy
ZXNzaW9uIGZyb20gdGhlCj4+Pj4gSU9NTVUgcGFnZSB0YWJsZSBzZXR1cCByZS13b3JrLiBUaGUg
Y2hhbmdlIGFsc28gaXNuJ3Qgd2l0aG91dCByaXNrCj4+Pj4gb2YgZnVydGhlciByZWdyZXNzaW9u
cyAtIGlmIGluIHBhdGNoIDIgSSd2ZSBtaXNzZWQgYSBjb2RlIHBhdGggdGhhdAo+Pj4+IHdvdWxk
IGFsc28gbmVlZCB0byBpbnZva2UgdGhlIG5ldyBob29rLCB0aGVuIHRoaXMgbWlnaHQgbWVhbiBu
b24tCj4+Pj4gd29ya2luZyBndWVzdHMgKHdpdGggcGFzc2VkLXRocm91Z2ggZGV2aWNlcyBvbiBB
TUQgaGFyZHdhcmUpLgo+Pj4+Cj4+Pj4gMTogQU1EL0lPTU1VOiBkb24ndCBuZWVkbGVzc2x5IHRy
aWdnZXIgZXJyb3JzL2NyYXNoZXMgd2hlbiB1bm1hcHBpbmcgYSBwYWdlCj4+Pj4gMjogaW50cm9k
dWNlIEdGTiBub3RpZmljYXRpb24gZm9yIHRyYW5zbGF0ZWQgZG9tYWlucwo+Pj4+IDM6IEFNRC9J
T01NVTogdXNlIG5vdGlmeV9kZm4oKSBob29rIHRvIHVwZGF0ZSBwYWdpbmcgbW9kZQo+Pj4gSGF2
aW5nIG5vdyBsb29rZWQgYXQgYWxsIHRocmVlLCB3aHkgZG9uJ3Qgd2UganVzdCBkZWxldGUgdGhl
IGR5bmFtaWMKPj4+IGhlaWdodCBvZiBBTUQgSU9NTVUgcGFnZXRhYmxlcz8KPj4+Cj4+PiBUaGlz
IHNlcmllcyBsb29rcyBzdXNwaWNpb3VzbHkgbGlrZSBpdCBpcyBhZGRpbmcgbmV3IGNvbW1vbgo+
Pj4gaW5mcmFzdHJ1Y3R1cmUgdG8gd29yayBhcm91bmQgdGhlIGZhY3Qgd2UncmUgZG9pbmcgc29t
ZXRoaW5nIGZhaXJseSBkdW1iCj4+PiB0byBiZWluZyB3aXRoLgo+Pj4KPj4+IEhhcmRjb2Rpbmcg
YXQgNCBsZXZlbHMgaXMsIGF0IHRoZSB2ZXJ5IHdvcnN0LCAyIGV4dHJhIHBhZ2VzIHBlciBkb21h
aW4sCj4+PiBhbmQgYSBzdWJzdGFudGlhbCByZWR1Y3Rpb24gaW4gdGhlIGNvbXBsZXhpdHkgb2Yg
dGhlIElPTU1VIGNvZGUuCj4+IFlldCBhbiBhZGRpdGlvbmFsIGxldmVsIG9mIHBhZ2Ugd2Fsa3Mg
aGFyZHdhcmUgaGFzIHRvIHBlcmZvcm0uIEFsc28KPj4gNCBsZXZlbHMgd29uJ3QgY292ZXIgYWxs
IHBvc3NpYmxlIDUyIGFkZHJlc3MgYml0cy4gQW5kIGZpbmFsbHksIHRoZQo+PiBtb3JlIGFwcGxp
Y2FibGUgeW91ciAic3Vic3RhbnRpYWwgcmVkdWN0aW9uIiwgdGhlIGxlc3Mgc3VpdGFibGUgc3Vj
aAo+PiBhIGNoYW5nZSBtYXkgYmUgYXQgdGhpcyBwb2ludCBvZiB0aGUgcmVsZWFzZSAoYnV0IEkg
ZGlkbid0IGxvb2sgYXQKPj4gdGhpcyBzaWRlIG9mIHRoaW5ncyBpbiBhbnkgZGV0YWlsLCBzbyBp
dCBtYXkgd2VsbCBub3QgYmUgYW4gaXNzdWUpLgo+IAo+IFRoZXJlIGlzLCBpbiBwcmFjdGljZSwg
bm8gc3VjaCB0aGluZyBhcyBhbiBIVk0gZ3Vlc3QgdXNpbmcgMiBsZXZlbHMuwqAKPiBUaGUgVlJB
TSBqdXN0IGJlbG93IHRoZSA0RyBib3VuZGFyeSB3aWxsIGZvcmNlIGEgcmVzaXplIHRvIDMgbGV2
ZWxzCj4gZHVyaW5nIGRvbWFpbiBjb25zdHJ1Y3Rpb24sIGFuZCBhcyBhIDEtbGluZSBmaXggZm9y
IDQuMTMsIHRoaXMgcHJvYmFibHkKPiBpc24ndCB0aGUgd29yc3QgaWRlYSBnb2luZy4KClNvIGhl
cmUgKHdpdGggdGhlIDEtbGluZSBmaXggcmVtYXJrKSB5b3UgdGFsayBhYm91dCAzIGxldmVscy4g
WWV0CnN3aXRjaGluZyB0aGUgMiB0aGF0IHdlIHN0YXJ0IGZyb20gdG8gMyB3b24ndCBmaXggYW55
dGhpbmcsIGFzIHdlCnN0aWxsIG1heSBuZWVkIHRvIGdvIHRvIDQgZm9yIGh1Z2UgZ3Vlc3RzLiBT
dWNoIGEgY2hhbmdlIHdvdWxkCm1lcmVseSBlbGltaW5hdGUgdGhlIGluZGVlZCBwcmV0dHkgcG9p
bnRsZXNzIG1vdmUgZnJvbSAyIHRvIDMgd2hpY2gKbm93IGhhcHBlbnMgZm9yIGFsbCBkb21haW5z
IGFzIHRoZWlyIG1lbW9yeSBnZXRzIHBvcHVsYXRlZC4KCj4gVGhlcmUgYXJlIG5vIEFNRCBzeXN0
ZW1zIHdoaWNoIHN1cHBvcnQgPjQ4IGJpdCBQQSBzcGFjZSwgc28gNCBsZXZlbHMgaXMKPiBzdWZm
aWNpZW50IGZvciBub3csIGJ1dCBmdW5kYW1lbnRhbGx5IGRldGFpbHMgc3VjaCBhcyB0aGUgc2l6
ZSBvZiBHUEEKPiBzcGFjZSBzaG91bGQgYmUgc3BlY2lmaWVkIGluIGRvbWFpbl9jcmVhdGUoKSBh
bmQgcmVtYWluIHN0YXRpYyBmb3IgdGhlCj4gbGlmZXRpbWUgb2YgdGhlIGRvbWFpbi4KCkkgYWdy
ZWUgR1BBIGRpbWVuc2lvbnMgb3VnaHQgdG8gYmUgc3RhdGljLiBCdXQgdGhlIG51bWJlci1vZi1s
ZXZlbHMKYWRqdXN0bWVudCB0aGUgY29kZSBkb2VzIGhhcyBub3RoaW5nIHRvIGRvIHdpdGggdmFy
aWFibGUgR1BBCmJvdW5kYXJpZXMuIEV2ZW4gZm9yIGEgZG9tYWluIHdpdGggYSwgc2F5LCAzNi1i
aXQgR0ZOIHNwYWNlIGl0Cm1heSBiZSBiZW5lZmljaWFsIHRvIHJ1biB3aXRoIG9ubHkgMyBsZXZl
bHMsIGFzIGxvbmcgYXMgaXQgaGFzCiJsaXR0bGUiIGVub3VnaCBtZW1vcnkgYXNzaWduZWQuIElu
IGZhY3QgdGhlIG51bWJlciBvZiBsZXZlbHMgdGhlCmhhcmR3YXJlIGhhcyB0byB3YWxrIGlzIHRo
ZSBvbmUgYXNwZWN0IHlvdSBkb24ndCBldmVuIHRvdWNoIGluIHlvdXIKcmVwbHkuCgpKYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
