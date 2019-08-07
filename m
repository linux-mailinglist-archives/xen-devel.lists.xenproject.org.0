Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB5A84EDD
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 16:37:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvN2E-0001X1-Ac; Wed, 07 Aug 2019 14:35:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvN2C-0001Ww-O9
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 14:35:24 +0000
X-Inumbo-ID: 969beb86-b920-11e9-aa98-eb79cf336d7d
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 969beb86-b920-11e9-aa98-eb79cf336d7d;
 Wed, 07 Aug 2019 14:35:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6580CB048;
 Wed,  7 Aug 2019 14:35:22 +0000 (UTC)
To: Eslam Elnikety <elnikety@amazon.com>
References: <20190807112024.19480-1-elnikety@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <36fedb78-e68a-60f8-f14c-387e720c4975@suse.com>
Date: Wed, 7 Aug 2019 16:35:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807112024.19480-1-elnikety@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] evtchn: make support for different ABIs
 tunable
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw@amazon.co.uk>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDguMjAxOSAxMzoyMCwgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4gQWRkaW5nIHN1cHBv
cnQgZm9yIEZJRk8gZXZlbnQgY2hhbm5lbCBBQkkgd2FzIGZpcnN0IGludHJvZHVjZWQgaW4gWGVu
IDQuNAo+IChzZWUgODg5MTAwNjFlYzYpLiBNYWtlIHRoaXMgc3VwcG9ydCB0dW5hYmxlLCBzaW5j
ZSB0aGUgY2hvaWNlIG9mIHdoaWNoCj4gZXZlbnQgY2hhbm5lbCBBQkkgaGFzIGltcGxpY2F0aW9u
cyBmb3IgaGliZXJuYXRpb24uIENvbnNpZGVyIHJlc3VtaW5nIGEKPiBwcmUgWGVuIDQuNCBoaWJl
cm5hdGVkIExpbnV4IGd1ZXN0LiBUaGUgZ3Vlc3QgYm9vdCBrZXJuZWwgZGVmYXVsdHMgdG8gRklG
Two+IEFCSSwgd2hlcmVhcyB0aGUgcmVzdW1lIGtlcm5lbCBhc3N1bWVzIDJMLiBUaGlzLCBpbiB0
dXJuLCByZXN1bHRzIGluIFhlbgo+IGFuZCB0aGUgcmVzdW1lZCBrZXJuZWwgdGFsa2luZyBwYXN0
IGVhY2ggb3RoZXIgKGR1ZSB0byBkaWZmZXJlbnQgcHJvdG9jb2xzCj4gRklGTyB2cyAyTCkuCj4g
Cj4gSW4gb3JkZXIgdG8gYW5ub3VuY2UgdG8gZ3Vlc3RzIHRoYXQgdGhlIGV2ZW50IGNoYW5uZWwg
QUJJIGRvZXMgbm90IHN1cHBvcnQKPiBGSUZPLCB0aGUgaHlwZXJ2aXNvciByZXR1cm5zIEVOT1NZ
UyBvbiBpbml0X2NvbnRyb2wgb3BlcmF0aW9uLiBXaGVuIHRoaXMKPiBvcGVyYXRpb24gZmFpbHMs
IHRoZSBndWVzdCBzaG91bGQgY29udGludWUgdG8gdXNlIHRoZSAyTCBldmVudCBjaGFubmVsIEFC
SS4KPiBGb3IgZXhhbXBsZSwgaW4gTGludXggZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNl
LmM6Cj4gCj4gICAgICBpZiAoZmlmb19ldmVudHMpCj4gICAgICAgICAgcmV0ID0geGVuX2V2dGNo
bl9maWZvX2luaXQoKTsKPiAgICAgIGlmIChyZXQgPCAwKQo+ICAgICAgICAgIHhlbl9ldnRjaG5f
MmxfaW5pdCgpOwo+IAo+IGFuZCB4ZW5fZXZ0Y2huX2ZpZm9faW5pdCBmYWlscyB3aGVuIEVWVENI
Tk9QX2luaXRfY29udHJvbCBmYWlscy4gVGhpcyBjb21taXQKPiBkb2VzIG5vdCBjaGFuZ2UgdGhl
IGN1cnJlbnQgZGVmYXVsdCBiZWhhdmlvdXI6IGFubm91bmNlIEZJRk8gZXZlbnQgY2hhbm5lbHMK
PiBBQkkgc3VwcG9ydCBmb3IgZ3Vlc3RzIHVubGVzcyBleHBsaWNpdGx5IHN0YXRlZCBvdGhlcndp
c2UgYXQgZG9tYWluY3JlYXRlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEVzbGFtIEVsbmlrZXR5IDxl
bG5pa2V0eUBhbWF6b24uY29tPgoKU2VlaW5nIHRoYXQgdGhlcmUgbG9va3MgdG8gZm9ybSBhZ3Jl
ZW1lbnQgdGhhdCByZXN0cmljdGluZyBldnRjaG4KdmFyaWFudHMganVzdCBsaWtlIGdudHRhYiBv
bmVzIGlzIHdhbnRlZCAoSSdtIHN0aWxsIG5vdCByZWFsbHkKY29udmluY2VkIGl0IGlzIHRoZSBy
aWdodCBhcHByb2FjaCBmb3IgdGhlIHByb2JsZW0gYXQgaGFuZCwgYnV0IEkKZG8gYWdyZWUgaGF2
aW5nIHN1Y2ggY29udHJvbCBtYXkgYmUgaGVscGZ1bCBpbiBnZW5lcmFsKSwgYSBmZXcKcmVtYXJr
cyBvbiB0aGUgcGF0Y2ggaXRzZWxmOgoKPiAtLS0gYS94ZW4vY29tbW9uL2RvbWFpbi5jCj4gKysr
IGIveGVuL2NvbW1vbi9kb21haW4uYwo+IEBAIC00NDQsNiArNDQ0LDkgQEAgc3RydWN0IGRvbWFp
biAqZG9tYWluX2NyZWF0ZShkb21pZF90IGRvbWlkLAo+ICAgICAgICAgICBkLT5jb250cm9sbGVy
X3BhdXNlX2NvdW50ID0gMTsKPiAgICAgICAgICAgYXRvbWljX2luYygmZC0+cGF1c2VfY291bnQp
Owo+ICAgCj4gKyAgICAgICAgaWYgKCBkLT5vcHRpb25zICYgWEVOX0RPTUNUTF9DREZfZGlzYWJs
ZV9maWZvICkKPiArICAgICAgICAgICAgZC0+ZGlzYWJsZV9ldnRjaG5fZmlmbyA9IDE7CgpUaGlz
IHdhbnRzIHRvIGJlICJ0cnVlIi4KCj4gLS0tIGEveGVuL2NvbW1vbi9ldmVudF9jaGFubmVsLmMK
PiArKysgYi94ZW4vY29tbW9uL2V2ZW50X2NoYW5uZWwuYwo+IEBAIC0xMTcwLDYgKzExNzAsMTEg
QEAgbG9uZyBkb19ldmVudF9jaGFubmVsX29wKGludCBjbWQsIFhFTl9HVUVTVF9IQU5ETEVfUEFS
QU0odm9pZCkgYXJnKQo+ICAgCj4gICAgICAgY2FzZSBFVlRDSE5PUF9pbml0X2NvbnRyb2w6IHsK
PiAgICAgICAgICAgc3RydWN0IGV2dGNobl9pbml0X2NvbnRyb2wgaW5pdF9jb250cm9sOwo+ICsK
PiArICAgICAgICAvKiBGYWlsIGluaXRfY29udHJvbCBmb3IgZG9tYWlucyB0aGF0IG11c3QgdXNl
IDJsIEFCSSAqLwo+ICsgICAgICAgIGlmICggY3VycmVudC0+ZG9tYWluLT5kaXNhYmxlX2V2dGNo
bl9maWZvICkKPiArICAgICAgICAgICAgcmV0dXJuIC1FTk9TWVM7CgpFTk9TWVMgaXMgbm90IGFu
IGFwcHJvcHJpYXRlIGVycm9yIGNvZGUgaGVyZS4gRU9QTk9UU1VQUCBtaWdodApiZSwgYW5kIEkg
Z3Vlc3MgdGhlcmUgYXJlIG1vcmUgb3B0aW9ucyAobGlrZSBFUEVSTSBvciBFQUNDRVMpLgoKPiAt
LS0gYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hl
ZC5oCj4gQEAgLTMzOCw2ICszMzgsNyBAQCBzdHJ1Y3QgZG9tYWluCj4gICAgICBzdHJ1Y3QgZXZ0
Y2huICAqKmV2dGNobl9ncm91cFtOUl9FVlRDSE5fR1JPVVBTXTsgLyogYWxsIG90aGVyIGJ1Y2tl
dHMgKi8KPiAgICAgIHVuc2lnbmVkIGludCAgICAgbWF4X2V2dGNobnM7ICAgICAvKiBudW1iZXIg
c3VwcG9ydGVkIGJ5IEFCSSAqLwo+ICAgICAgdW5zaWduZWQgaW50ICAgICBtYXhfZXZ0Y2huX3Bv
cnQ7IC8qIG1heCBwZXJtaXR0ZWQgcG9ydCBudW1iZXIgKi8KPiArICAgIGJvb2wgICAgICAgICAg
ICAgZGlzYWJsZV9ldnRjaG5fZmlmbzsgICAgICAgICAgICAvKiBmb3JjZSAybCBBQkkgKi8KPiAg
ICAgIHVuc2lnbmVkIGludCAgICAgdmFsaWRfZXZ0Y2huczsgICAvKiBudW1iZXIgb2YgYWxsb2Nh
dGVkIGV2ZW50IGNoYW5uZWxzICovCj4gICAgICBzcGlubG9ja190ICAgICAgIGV2ZW50X2xvY2s7
Cj4gICAgICBjb25zdCBzdHJ1Y3QgZXZ0Y2huX3BvcnRfb3BzICpldnRjaG5fcG9ydF9vcHM7CgpJ
IHN1cHBvc2UgeW91IGNhbiBmaW5kIGEgYmV0dGVyIHBsYWNlIHRvIHB1dCB0aGlzIDEtYnl0ZSBm
aWVsZAp0aGFuIGJldHdlZW4gdHdvIDMyLWJpdCBvbmVzLCBsZWF2aW5nIGEgMy1ieXRlIGhvbGUu
CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
