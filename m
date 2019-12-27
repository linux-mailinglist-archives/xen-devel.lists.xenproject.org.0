Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 146D112B4F3
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2019 14:48:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ikpuU-0003GQ-Oi; Fri, 27 Dec 2019 13:44:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ikpuT-0003GI-Ky
 for xen-devel@lists.xenproject.org; Fri, 27 Dec 2019 13:44:09 +0000
X-Inumbo-ID: f467fff4-28ae-11ea-9c08-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f467fff4-28ae-11ea-9c08-12813bfff9fa;
 Fri, 27 Dec 2019 13:44:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4CB3AAEB8;
 Fri, 27 Dec 2019 13:44:07 +0000 (UTC)
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <0987641ced136706961cf419eb5ed83d1302357b.1576697796.git.tamas.lengyel@intel.com>
 <ba37b587-6a4a-ecd8-3e2f-400e2755b24d@suse.com>
 <CABfawhmGQz8cAQWv-pkTXTNNXS-ML6wDcCon5ONAUZr_VP8WUA@mail.gmail.com>
 <530c2a0e-c79a-b540-8d6a-9d50e22bff41@citrix.com>
 <dab59394-756a-95de-76ac-c4fb34ee85a2@suse.com>
 <CABfawhmeMQtpwjubk_YLO26Lo+6JvZtVtqKWexgjE3VR8SNZZQ@mail.gmail.com>
 <279e2e11-3928-b7ef-4dda-632ce58c650d@suse.com>
 <CABfawhmzVwedYq-iYTSAYEjXkPR_4PBz+MR=eTJwKfHbux-9gQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <694f476c-cd5d-54c5-7b4a-02bfc7015778@suse.com>
Date: Fri, 27 Dec 2019 14:44:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CABfawhmzVwedYq-iYTSAYEjXkPR_4PBz+MR=eTJwKfHbux-9gQ@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 01/20] x86: make hvm_{get/set}_param
 accessible
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMTIuMjAxOSAxNDoxMCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIEZyaSwgRGVj
IDI3LCAyMDE5IGF0IDE6MDQgQU0gSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90
ZToKPj4KPj4gKHJlLXNlbmRpbmcsIGFzIEkgc3RpbGwgZG9uJ3Qgc2VlIHRoZSBtYWlsIGhhdmlu
ZyBhcHBlYXJlZCBvbiB0aGUgbGlzdCkKPj4KPj4gT24gMjMuMTIuMjAxOSAxNTo1NSwgVGFtYXMg
SyBMZW5neWVsIHdyb3RlOgo+Pj4gT24gTW9uLCBEZWMgMjMsIDIwMTkgYXQgMjozNyBBTSBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4+Cj4+Pj4gT24gMjAuMTIuMjAx
OSAxODozMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+Pj4gT24gMjAvMTIvMjAxOSAxNzoyNywg
VGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+Pj4+Pj4gT24gRnJpLCBEZWMgMjAsIDIwMTkgYXQgOTo0
NyBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4+Pj4+IE9uIDE4
LjEyLjIwMTkgMjA6NDAsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPj4+Pj4+Pj4gQ3VycmVudGx5
IHRoZSBodm0gcGFyYW1ldGVycyBhcmUgb25seSBhY2Nlc3NpYmxlIHZpYSB0aGUgSFZNT1AgaHlw
ZXJjYWxscy4gQnkKPj4+Pj4+Pj4gZXhwb3NpbmcgaHZtX3tnZXQvc2V0fV9wYXJhbSBpdCB3aWxs
IGJlIHBvc3NpYmxlIGZvciBWTSBmb3JraW5nIHRvIGNvcHkgdGhlCj4+Pj4+Pj4+IHBhcmFtZXRl
cnMgZGlyZWN0bHkgaW50byB0aGUgY2xvbmUgZG9tYWluLgo+Pj4+Pj4+IEhhdmluZyBwZWVrZWQg
YWhlYWQgYXQgcGF0Y2ggMTcsIHdoZXJlIHRoaXMgZ2V0cyB1c2VkLCBJIHdvbmRlciB3aHkKPj4+
Pj4+PiB5b3Ugd2FudCBhIHBhaXIgb2Ygb25lLWJ5LW9uZSBmdW5jdGlvbnMsIHJhdGhlciB0aGFu
IGEgY29weS1hbGwgb25lLgo+Pj4+Pj4+IFRoaXMgdGhlbiB3b3VsZG4ndCByZXF1aXJlIGV4cG9z
dXJlIG9mIHRoZSBmdW5jdGlvbnMgeW91IHRvdWNoIGhlcmUuCj4+Pj4+PiBXZWxsLCBwcm92aWRl
ZCB0aGVyZSBpcyBubyBzdWNoIGZ1bmN0aW9uIGluIGV4aXN0ZW5jZSB0b2RheSBpdCB3YXMKPj4+
Pj4+IGp1c3QgZWFzaWVyIHRvIHVzZSB3aGF0J3MgYWxyZWFkeSBhdmFpbGFibGUuIEkgc3RpbGwg
d291bGRuJ3Qgd2FudCB0bwo+Pj4+Pj4gaW1wbGVtZW50IGEgb25lLXNob3QgZnVuY3Rpb24gbGlr
ZSB0aGF0IGJlY2F1c2UgdGhpcyBzYW1lIGNvZGUtcGF0aCBpcwo+Pj4+Pj4gc2hhcmVkIGJ5IHRo
ZSBzYXZlLXJlc3RvcmUgb3BlcmF0aW9ucyBvbiB0aGUgdG9vbHN0YWNrIHNpZGUsIHNvIGF0Cj4+
Pj4+PiBsZWFzdCBJIGhhdmUgYSByZWFzb25hYmxlIGFzc3VtcHRpb24gdGhhdCBpdCB3b24ndCBi
cmVhayBvbiBtZSBpbiB0aGUKPj4+Pj4+IGZ1dHVyZS4KPj4+Pj4KPj4+Pj4gSW4gcGFydGljdWxh
ciwgYSBudW1iZXIgb2YgdGhlIHNldCBvcGVyYXRpb25zIGFyZSBkaXN0aW5jdGx5Cj4+Pj4+IG5v
bi10cml2aWFsLgo+Pj4+Cj4+Pj4gSG93IGlzIHRyaXZpYWwgb3Igbm90IHJlbGF0ZWQgdG8gdGhl
cmUgYmVpbmcgb25lIGZ1bmN0aW9uIGRvaW5nCj4+Pj4gdGhlIGxvb3Bpbmcgd2FudGVkIGhlcmUg
dnMgdGhlIGxvb3BpbmcgYmVpbmcgZG9uZSBieSB0aGUgY2FsbGVyCj4+Pj4gYXJvdW5kIHRoZSB0
d28gcGVyLWVudGl0eSBjYWxscz8KPj4+Cj4+PiBJIGRvbid0IHJlYWxseSBnZXQgd2h5IHdvdWxk
IGl0IG1hdHRlciB3aGVyZSB0aGUgbG9vcGluZyBpcyBiZWluZwo+Pj4gZG9uZT8gRXZlbiBpZiBJ
IHdlcmUgdG8gYWRkIGEgc2luZ2xlIGZ1bmN0aW9uIHRvIGRvIHRoaXMsIGl0IHdvdWxkIGRvCj4+
PiB0aGUgc2FtZSBsb29waW5nIGFuZCBqdXN0IGNhbGwgdGhlIG5vdyBpbnRlcm5hbGx5IGtlcHQg
Z2V0L3NldCBwYXJhbXMKPj4+IGZ1bmN0aW9ucy4KPj4KPj4gVGhlIGRpZmZlcmVuY2UgKHRvIG1l
KSBpcyB3aGF0IGxldmVsIG9mIGNvbnRyb2wgZ2V0cyBleHBvc2VkIG91dHNpZGUKPj4gb2YgdGhl
IGZpbGUuIEZvciBleGFtcGxlIEkgYWxzbyBkaXNsaWtlIGV4dGVybmFsIGNvZGUgZG9pbmcgdGhp
cwo+PiBzb21ld2hhdCBvZGQgKGJ1dCBuZWNlc3NhcnkgYXMgcGVyIHlvdXIgY29tbXVuaWNhdGlv
biB3aXRoIEFuZHJldykKPj4gY2hlY2tpbmcgYWdhaW5zdCB6ZXJvIHZhbHVlcy4gU3VjaCBhcmUg
aW1wbGVtZW50YXRpb24gZGV0YWlscyB3aGljaAo+PiB3b3VsZCBiZXR0ZXIgbm90IGJlIHNjYXR0
ZXIgYXJvdW5kLgo+IAo+IEJ1dCB5b3UgZG8gcmVhbGl6ZSB0aGF0IGJvdGggb2YgdGhlc2UgZnVu
Y3Rpb25zIGFyZSBhbHJlYWR5IGV4cG9zZWQKPiB2aWEgaHlwZXJjYWxscz8gU28gaXQncyBPSyB0
byBjYWxsIHRoZW0gZnJvbSB0aGUgdG9vbHN0YWNrIGJ1dCBub3QKPiBmcm9tIG90aGVyIHBhcnRz
IG9mIFhlbiBpdHNlbGY/IEkgZG9uJ3Qgc2VlIG11Y2ggcmVhc29uIHRoZXJlLgoKUmlnaHQgbm93
IHdlIGhhdmUgZXhhY3RseSBvbmUgcGF0aCBlYWNoIGFsbG93aW5nIHRoaXMgZ2V0L3NldC4gQWRk
aW5nCmEgMm5kIChmcm9tIG91dHNpZGUgb2YgaHZtLmMpIG9wZW5zIHRoZSBkb29yIGZvciBwb3Nz
aWJsZSByYWNlcwpiZXR3ZWVuIHRoZSB2YXJpb3VzIChmb3Igbm93IGp1c3QgdHdvKSBwb3NzaWJs
ZSBjYWxsIHNpdGVzLiBOb3RpY2luZwphIHBvc3NpYmxlIHByb2JsZW0gd2hlbiBhZGRpbmcgbmV3
IGNvZGUgaXMgaW1vIHF1aXRlIGEgYml0IG1vcmUKbGlrZWx5IGlmIGV2ZXJ5dGhpbmcgbGl2ZXMg
Y2VudHJhbGl6ZWQgaW4gb25lIHBsYWNlLiBJT1cgImV4cG9zdXJlIgpoZXJlIGlzbid0IG1lYW50
IHNvIG11Y2ggaW4gdGhlIHNlbnNlIG9mIHdoYXQgZW50aXR5IGluIHRoZSBzeXN0ZW0KZ2V0cyB0
byBkcml2ZSB0aGUgZGF0YSwgYnV0IHdoaWNoIGVudGl0aWVzIHdpdGhpbiBYZW4gbWF5IHBsYXkg
d2l0aAppdC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
