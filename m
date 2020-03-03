Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1451774F2
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 12:03:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j95HQ-0004zA-5b; Tue, 03 Mar 2020 11:00:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TLdZ=4U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j95HO-0004q2-Mv
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 11:00:02 +0000
X-Inumbo-ID: 213620ec-5d3e-11ea-82f6-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 213620ec-5d3e-11ea-82f6-bc764e2007e4;
 Tue, 03 Mar 2020 11:00:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 157EFB236;
 Tue,  3 Mar 2020 11:00:01 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200302155509.44753-1-roger.pau@citrix.com>
 <766fea94-422e-7f52-96e1-9f5e4cacbbec@suse.com>
 <20200303102909.GN24458@Air-de-Roger.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <db850653-21e4-c94b-7484-caf69ca7a734@suse.com>
Date: Tue, 3 Mar 2020 12:00:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200303102909.GN24458@Air-de-Roger.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/dom0: improve PVH initrd and metadata
 placement
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDMuMjAyMCAxMToyOSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUdWUsIE1h
ciAwMywgMjAyMCBhdCAxMDoxNDo1MEFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MDIuMDMuMjAyMCAxNjo1NSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4gKyAgICAgICAgc3Rh
cnQgPSBNQVgoUk9VTkRVUChkLT5hcmNoLmU4MjBbaV0uYWRkciwgUEFHRV9TSVpFKSwgTUIoMSkp
Owo+Pj4gKyAgICAgICAgZW5kID0gZC0+YXJjaC5lODIwW2ldLmFkZHIgKyBkLT5hcmNoLmU4MjBb
aV0uc2l6ZTsKPj4KPj4gLi4uIGNhbGN1bGF0ZSAiZW5kIiBlYXJsaWVyIGFuZCB1c2UgaXQgaW4g
dGhlIGlmKCkgYWJvdmU/Cj4gCj4gUmlnaHQuCj4gCj4+Cj4+IEFzIHRvIHRoZSBhbGlnbmluZyB0
byBhIDFNYiBib3VuZGFyeSAtIHdoeSBhcmUgeW91IGRvaW5nIHRoaXM/Cj4gCj4gSSdtIG5vdCBz
dXJlIHBsYWNpbmcgdGhlIGluaXRyZCBhbmQgbWV0YWRhdGEgYmVsb3cgMU1CIGlzIHNlbnNpYmxl
LAo+IGV2ZW4gaWYgYSByZWdpb24gYmlnIGVub3VnaCB3YXMgZm91bmQuIEluIHB2aF9wb3B1bGF0
ZV9wMm0gd2UgY29weSB0aGUKPiBkYXRhIG9uIHRoZSBtZW1vcnkgcmVnaW9ucyA8IDFNQiwgSSdt
IG5vdCBzdXJlIEJEQS9FQkRBIGlzIG1hcmtlZCBhcwo+IHJlc2VydmVkIGluIHRoZSBtZW1vcnkg
bWFwIGFsd2F5cy4KCkkgcmVhbGl6ZSBub3cgdGhhdCBJIG1pc3JlYWQgdGhlIGNvZGUgLSB5b3Ug
ZG9uJ3QgYWxpZ24gdG8gYSAxTWIKYm91bmRhcnksIGJ1dCB5b3UgY2FwIHRoZSByYW5nZSBhdCB0
aGUgbG93ZXIgZW5kLiBUaGF0J3MgZmluZSBvZgpjb3Vyc2UuCgo+PiBJIGd1ZXNzIHdoYXRldmVy
IHRoZSByZWFzb24gd2FycmFudHMgYSBjb21tZW50LCB0aGUgbW9yZSB0aGF0Cj4+IGZ1cnRoZXIg
ZG93biB5b3Ugb25seSBhbGlnbiB0byBwYWdlIGJvdW5kYXJpZXMuCj4+Cj4+PiArICAgICAgICAv
KiBEZWFsIHdpdGggdGhlIGtlcm5lbCBiZWluZyBsb2FkZWQgaW4gdGhlIHJlZ2lvbi4gKi8KPj4+
ICsgICAgICAgIGlmICgga2VybmVsX3N0YXJ0IDw9IHN0YXJ0ICYmIGtlcm5lbF9lbmQgPj0gc3Rh
cnQgKQo+Pgo+PiBXaGlsZSBpdCBkb2Vzbid0IG1hdHRlciBtdWNoLCBJIHRoaW5rIGl0IHdvdWxk
IGxvb2sgYmV0dGVyIHRvCj4+IHVzZSA+IG9uIHRoZSByaWdodCBzaWRlIG9mIHRoZSAmJiBoZXJl
IC4uLgo+Pgo+Pj4gKyAgICAgICAgICAgIC8qIFRydW5jYXRlIHRoZSBzdGFydCBvZiB0aGUgcmVn
aW9uICovCj4+PiArICAgICAgICAgICAgc3RhcnQgPSBST1VORFVQKGtlcm5lbF9lbmQsIFBBR0Vf
U0laRSk7Cj4+PiArICAgICAgICBlbHNlIGlmICgga2VybmVsX3N0YXJ0IDw9IGVuZCAmJiBrZXJu
ZWxfZW5kID49IGVuZCApCj4+Cj4+IGFuZCA8IG9uIHRoZSBsZWZ0IHNpZGUgb2YgdGhlICYmIGhl
cmUuIEZ1cnRoZXJtb3JlIC0gY2FuIHRoaXMKPj4gcmVhbGx5IGJlICJlbHNlIGlmKCkiIGhlcmUs
IGkuZS4gZG9lc24ndCBpdCBuZWVkIHRvIGJlIHBsYWluCj4+ICJpZigpIj8KPiAKPiBJIGRvbid0
IHRoaW5rIHNvLCBhcyB0aGUgcmVnaW9uIHdoZXJlIHRoZSBrZXJuZWwgaGFzIGJlZW4gbG9hZGVk
IG11c3QKPiBhbHdheXMgYmUgYSBzaW5nbGUgUkFNIHJlZ2lvbi4gSWU6IFtrZXJuZWxfc3RhcnQs
IGtlcm5lbF9lbmQpIGlzCj4gYWx3YXlzIGdvaW5nIHRvIGJlIGEgc3Vic2V0IG9mIGEgUkFNIHJl
Z2lvbi4KCkkgdGhpcyB0cnVlIGV2ZW4gd2l0aCB0aGUgcGFnZSBzaXplIGFsaWdubWVudCBnZXR0
aW5nIGRvbmU/CklPVyBhcmUgYWxsIEU4MjAgcmFuZ2VzIHdlIHByb2R1Y2UgZXhhY3QgbXVsdGlw
bGVzIG9mIDRrIGluCnNpemUgYW5kIGFsaWduZWQgdG8gNGsgYm91bmRhcmllcz8KCj4+IEFsc28s
IGRvIGJvdGggcmVnaW9ucyBuZWVkIHRvIGJlIGFkamFjZW50PyBJZiBub3QsIHdvdWxkbid0IGl0
IGJlCj4+IGJldHRlciB0byBmaW5kIHNsb3RzIGZvciB0aGVtIG9uZSBieSBvbmU/Cj4gCj4gVGhh
dCdzIGdvaW5nIHRvIGJlIG11Y2ggbW9yZSBjb21wbGljYXRlZCwgYXMgeW91IHdvdWxkIGhhdmUg
dG8gYWNjb3VudAo+IGZvciBwcmV2aW91cyByZWdpb25zIHdoaWxlIHNlYXJjaGluZyBmb3IgZW1w
dHkgc3BhY2VzLiBJZiB3ZSB3YW50IHRvCj4gZ28gdGhhdCByb3V0ZSB3ZSB3b3VsZCBoYXZlIHRv
IHVzZSBhIHJhbmdlc2V0IG9yIHNvbWUgc3VjaCBpbiBvcmRlciB0bwo+IGtlZXAgdHJhY2sgb2Yg
dXNlZCBhcmVhcy4KCkkgYWNjZXB0IHRoaXMgYmVpbmcgbW9yZSBjb21wbGljYXRlZCwgYW5kIGhl
bmNlIG5vdCByZWFsbHkKd2FudGluZyBkb2luZyBub3cgYW5kIGhlcmUuIEJ1dCBwZXJoYXBzIHlv
dSBjb3VsZCBsZWF2ZSBhCmNvbW1lbnQgdG8gdGhlIGVmZmVjdCB0aGF0IHRoZSBjaG9pY2Ugb2Yg
dXNpbmcgYSBzaW5nbGUKcmVnaW9uIGlzIGZvciBzaW1wbGljaXR5IHJlYXNvbnM/CgpKYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
