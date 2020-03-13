Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0129D184240
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 09:12:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCfOj-0003go-2P; Fri, 13 Mar 2020 08:10:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9TpK=46=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jCfOh-0003gf-Ai
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 08:10:23 +0000
X-Inumbo-ID: 15f6e466-6502-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15f6e466-6502-11ea-bec1-bc764e2007e4;
 Fri, 13 Mar 2020 08:10:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6EE04ACD0;
 Fri, 13 Mar 2020 08:10:21 +0000 (UTC)
To: "Tian, Kevin" <kevin.tian@intel.com>
References: <83253657-b3b4-a045-b829-f8f4c4aeae28@suse.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7C5DEC@SHSMSX104.ccr.corp.intel.com>
 <12464780-0ce3-0331-9f78-b026025607fb@suse.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7CDA43@SHSMSX104.ccr.corp.intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <56483550-a9a0-a214-14d6-9a43a4eece6c@suse.com>
Date: Fri, 13 Mar 2020 09:10:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D7CDA43@SHSMSX104.ccr.corp.intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] IOMMU: make DMA containment of
 quarantined devices optional
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDMuMjAyMCAwNDowNSwgVGlhbiwgS2V2aW4gd3JvdGU6Cj4+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4gU2VudDogVHVlc2RheSwgTWFyY2ggMTAsIDIwMjAg
NjozMSBQTQo+Pgo+PiBPbiAxMC4wMy4yMDIwIDA2OjMwLCBUaWFuLCBLZXZpbiB3cm90ZToKPj4+
PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+Pj4gU2VudDogTW9uZGF5
LCBNYXJjaCA5LCAyMDIwIDc6MDkgUE0KPj4+Pgo+Pj4+IENvbnRhaW5pbmcgc3RpbGwgaW4gZmxp
Z2h0IERNQSB3YXMgaW50cm9kdWNlZCB0byB3b3JrIGFyb3VuZCBjZXJ0YWluCj4+Pj4gZGV2aWNl
cyAvIHN5c3RlbXMgaGFuZ2luZyBoYXJkIHVwb24gaGl0dGluZyBhICJub3QtcHJlc2VudCIgSU9N
TVUgZmF1bHQuCj4+Pj4gUGFzc2luZyB0aHJvdWdoIChzdWNoKSBkZXZpY2VzIChvbiBzdWNoIHN5
c3RlbXMpIGlzIGluaGVyZW50bHkgaW5zZWN1cmUKPj4+PiAoYXMgZ3Vlc3RzIGNvdWxkIGVhc2ls
eSBhcnJhbmdlIGZvciBJT01NVSBmYXVsdHMgb2YgYW55IGtpbmQgdG8gb2NjdXIpLgo+Pj4+IERl
ZmF1bHRpbmcgdG8gYSBtb2RlIHdoZXJlIGFkbWlucyBtYXkgbm90IGV2ZW4gYmVjb21lIGF3YXJl
IG9mCj4+IGlzc3Vlcwo+Pj4+IHdpdGggZGV2aWNlcyBjYW4gYmUgY29uc2lkZXJlZCB1bmRlc2ly
YWJsZS4gVGhlcmVmb3JlIGNvbnZlcnQgdGhpcyBtb2RlCj4+Pj4gb2Ygb3BlcmF0aW9uIHRvIGFu
IG9wdGlvbmFsIG9uZSwgbm90IG9uZSBlbmFibGVkIGJ5IGRlZmF1bHQuCj4+Pgo+Pj4gSGVyZSBp
cyBhbm90aGVyIHRob3VnaHQuIFRoZSB3aG9sZSBwb2ludCBvZiBxdWFyYW50aW5lIGlzIHRvIGNv
bnRhaW4KPj4+IHRoZSBkZXZpY2UgYWZ0ZXIgaXQgaXMgZGVhc3NpZ25lZCBmcm9tIHVudHJ1c3Rl
ZCBndWVzdC4KPj4KPj4gSSdkIHF1ZXN0aW9uIHRoZSAidW50cnVzdGVkIiBoZXJlLiBBc3NpZ25p
bmcgZGV2aWNlcyB0byB1bnRydXN0ZWQKPj4gZ3Vlc3RzIGlzIHByb2JsZW1hdGljIGFueXdheSwg
dW5sZXNzIHlvdSdyZSB0aGUgZGV2aWNlIG1hbnVmYWN0dXJlcgo+PiBhbmQgZGV2aWNlIGZpcm13
YXJlIHdyaXRlciwgYW5kIGhlbmNlIHlvdSBjYW4gZ3VhcmFudGVlIHRoZSBkZXZpY2UKPj4gdG8g
bm90IG9mZmVyIGFueSBiYWNrZG9vcnMgb3IgYWxpa2UuIFRoZXJlZm9yZSBJIHZpZXcgcXVhcmFu
dGluaW5nCj4gCj4gQXJlbid0IGFsbCBndWVzdHMgdW50cnVzdGVkIGZyb20gaHlwZXJ2aXNvciBw
Lm8udiwgd2hpY2ggaXMgdGhlIHJlYXNvbgo+IHdoeSBJT01NVSB3YXMgaW50cm9kdWNlZCBpbiB0
aGUgZmlyc3QgcGxhY2U/CgoiVW50cnVzdGVkIiBpcyBhbHdheXMgbWVhbnQgZnJvbSB0aGUgcGVy
c3BlY3RpdmUgb2YgdGhlIGhvc3QgYWRtaW4uCgo+IEkgbWF5IG92ZXJsb29rIHRoZSBoaXN0b3J5
IG9mIHF1YXJhbnRpbmUgZmVhdHVyZS4gQmFzZWQgb24gbXkgc3R1ZHkKPiBvZiBxdWFyYW50aW5l
IHJlbGF0ZWQgY2hhbmdlcywgbG9va3MgaW5pdGlhbGx5IFBhdWwgcG9pbnRlZCBvdXQgc3VjaCAK
PiBwcm9ibGVtIHRoYXQgYSBkZXZpY2UgbWF5IGhhdmUgaW4tZmx5IERNQXMgdG8gdG91Y2ggZG9t
MCBtZW1vcnkKPiBhZnRlciBpdCBpcyBkZWFzc2lnbmVkLiBUaGVuIGhlIGludHJvZHVjZWQgdGhl
IHF1YXJhbnRpbmUgY29uY2VwdCBieQo+IHB1dHRpbmcgYSBxdWFyYW50aW5lZCBkZXZpY2UgaW50
byBkb21faW8gdy9vIGFueSB2YWxpZCBtYXBwaW5nLCAKPiB3aXRoIGEgd2hpdGVsaXN0IGFwcHJv
YWNoLiBZb3UgbGF0ZXIgZXh0ZW5kZWQgYXMgYSBkZWZhdWx0IGJlaGF2aW9yCj4gZm9yIGFsbCBQ
Q0kgZGV2aWNlcy4gTm93IFBhdWwgZm91bmQgc29tZSBkZXZpY2Ugd2hpY2ggY2Fubm90IHRvbGVy
YXRlCj4gcmVhZC1mYXVsdCBhbmQgdGhlbiBjYW1lIHVwIHRoaXMgc2NyYXRjaC1wYWdlIGlkZWEu
Cj4gCj4gTm93IEkgd29uZGVyIHdoeSB3ZSBhcmUgZG9pbmcgc3VjaCBleHBsaWNpdCBxdWFyYW50
aW5lIGluIHRoZSBmaXJzdAo+IHBsYWNlLiBTaG91bGRuJ3Qgd2UgYWx3YXlzIHNlZWsgcmVzZXR0
aW5nIHRoZSBkZXZpY2Ugd2hlbiBpdCBpcyBkZWFzc2lnbmVkCj4gZnJvbSBhIGd1ZXN0PyAncmVz
ZXQnIHNob3VsZCBjYW5jZWwvcXVpZXNjZW50IGFsbCBpbi1mbHkgRE1BcyBmb3IgbW9zdAo+IGRl
dmljZXMgaWYgdGhleSBpbXBsZW1lbnQgJ3Jlc2V0JyBjb3JyZWN0bHkuCgpBbmQgdGhlIGltcG9y
dGFudCB3b3JkIGhlcmUgaXMgInNob3VsZCIuIFBhdWwgYW5kIGNvbGxlYWd1ZXMgZm91bmQKaXQg
bWF5IG5vdCBkbyBzbyBpbiByZWFsaXR5LgoKPiBJZiBkb2luZyB0aGF0IHdheSwgd2UgZG9uJ3QK
PiBuZWVkIGEgcXVhcmFudGluZSBvcHRpb24gYXQgYWxsLCBhbmQgdGhlbiB0aGUgYm9ndXMgZGV2
aWNlIGluIFBhdWwncwo+IGxhdGVzdCBmaW5kaW5nIGNvdWxkIGJlIGhhbmRsZWQgYnkgYSBzdGFu
ZGFsb25lIG9wdGlvbiB3L28gc3RydWdnbGluZwo+IHdoZXRoZXIgJ2Z1bGwnIGlzIGEgcmlnaHQg
bmFtZSB2cy4gJ2Jhc2ljJy4gb3Igd2UgbWF5IGludHJvZHVjZSBhIHJlc2V0Cj4gZmxhZyB3aGVu
IGFzc2lnbmluZyBzdWNoIGRldmljZSB0byBpbmRpY2F0ZSBzdWNoIHNwZWNpYWwgcmVxdWlyZW1l
bnQsCj4gc28gYSBzY3JhdGNoIHBhZ2UvZG9tX2lvIGNhbiBiZSBsaW5rZWQgc3BlY2lmaWNhbGx5
IGZvciBzdWNoIGRldmljZSAKPiBwb3N0IHJlc2V0LCBhc3N1bWluZyBpdCBpcyBub3QgYSBwbGF0
Zm9ybS1sZXZlbCBidWcgZnJvbSBQYXVsJ3MgcmVzcG9uc2U/ICAKCldoaWNoIHdvdWxkIGltcGx5
IGhvc3QgYWRtaW5zIHRvIGtub3cgc3VjaCBwcm9wZXJ0aWVzIG9mIHRoZWlyCmRldmljZXMsIGFu
ZCBiZXR0ZXIgX3dpdGhvdXRfIGZpcnN0IGhhdmluZyBydW4gaW50byBwcm9ibGVtcy4KCkphbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
