Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D5E17F514
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 11:31:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBc6F-0002Tj-Bl; Tue, 10 Mar 2020 10:26:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EhAh=43=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBc6D-0002Te-OL
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 10:26:57 +0000
X-Inumbo-ID: aae69094-62b9-11ea-ad53-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aae69094-62b9-11ea-ad53-12813bfff9fa;
 Tue, 10 Mar 2020 10:26:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AA4FCB117;
 Tue, 10 Mar 2020 10:26:55 +0000 (UTC)
To: "Tian, Kevin" <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
References: <83253657-b3b4-a045-b829-f8f4c4aeae28@suse.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7C5CDC@SHSMSX104.ccr.corp.intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2999c86a-328f-927e-6b53-895d2fd788f6@suse.com>
Date: Tue, 10 Mar 2020 11:26:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D7C5CDC@SHSMSX104.ccr.corp.intel.com>
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
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDMuMjAyMCAwNDo0MywgVGlhbiwgS2V2aW4gd3JvdGU6Cj4+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4gU2VudDogTW9uZGF5LCBNYXJjaCA5LCAyMDIwIDc6
MDkgUE0KPj4KPj4gSSdtIGhhcHB5IHRvIHRha2UgYmV0dGVyIHN1Z2dlc3Rpb25zIHRvIHJlcGxh
Y2UgdGhlICJmdWxsIiBjb21tYW5kIGxpbmUKPj4gb3B0aW9uIGFuZCBLY29uZmlnIHByb21wdCB0
b2tlbnMuIEkgZG9uJ3QgdGhpbmsgdGhvdWdoIHRoYXQgImZhdWx0IiBhbmQKPj4gIndyaXRlLWZh
dWx0IiBhcmUgcmVhbGx5IHN1aXRhYmxlIHRoZXJlLgo+IAo+IEkgdGhpbmsgd2UgbWF5IGp1c3Qg
YWxsb3cgYm90aCByL3cgYWNjZXNzIHRvIHNjcmF0Y2ggcGFnZSBmb3Igc3VjaCBib2d1cwo+IGRl
dmljZSwgd2hpY2ggbWF5IG1ha2UgJ2Z1bGwnIG1vcmUgcmVhc29uYWJsZSBzaW5jZSB3ZSBub3cg
ZnVsbHkKPiBjb250YWluIGluLWZseSBETUFzLiBJJ20gbm90IHN1cmUgYWJvdXQgdGhlIHZhbHVl
IG9mIGtlZXBpbmcgd3JpdGUtZmF1bHQKPiBhbG9uZSBmb3Igc3VjaCBkZXZpY2VzIChqdXN0IGJl
Y2F1c2Ugb25lIG9ic2VydmVkIGhpcyBzcGVjaWZpYyBkZXZpY2Ugb25seSAKPiBoYXMgcHJvYmxl
bSB3aXRoIHJlYWQtZmF1bHQpLgoKV2VsbCwgYSBmdW5kYW1lbnRhbCBwcm9ibGVtIEkgaGF2ZSBo
ZXJlIGlzIHRoYXQgSSBzdGlsbCBkb24ndCBrbm93CnRoZSBfZXhhY3RfIGNvbmRpdGlvbnMgZm9y
IHRoZSBvYnNlcnZlZCBoYW5ncy4gSSBjb25zaWRlciBpdCB1bmxpa2VseQpmb3IgSU9NTVUgcmVh
ZCBmYXVsdHMgdG8gY2F1c2UgaGFuZ3MsIGJ1dCBmb3Igd3JpdGUgZmF1bHRzIHRvIGJlCiJmaW5l
Ii4gSXQgd291bGQgc2VlbSBtb3JlIGxpa2VseSB0byBtZSB0aGF0IGUuZy4gYSBub24tcHJlc2Vu
dApjb250ZXh0IGVudHJ5IG1pZ2h0IGNhdXNlIGlzc3Vlcy4gSWYgdGhhdCB3YXMgdGhlIGNhc2Us
IHdlIHdvdWxkbid0Cm5lZWQgdG8gaGFuZGxlIHJlYWRzIGFuZCB3cml0ZXMgZGlmZmVyZW50bHk7
IHdlIGNvdWxkIGluc3RlYWQgaW5zdGFsbAphbiBhbGwgemVybyB0b3AgbGV2ZWwgcGFnZSB0YWJs
ZS4gQW5kIHdlJ2Qgc3RpbGwgZ2V0IGFsbCBmYXVsdHMgdGhhdAphcmUgc3VwcG9zZWQgdG8gc3Vy
ZmFjZS4gQnV0IHBlcmhhcHMgUGF1bCBkaWQgdHJ5IHRoaXMgYmFjayB0aGVuLCBhbmQKaXQgdHVy
bmVkIG91dCB0byBub3QgYmUgYW4gb3B0aW9uLgoKVGhlIGNob2ljZSBvZiBsZXR0aW5nIHdyaXRl
cyBjb250aW51ZSB0byBmYXVsdCB3YXMgYmFzZWQgb24gKGEpIHRoaXMKaGF2aW5nIGJlZW4gdGVz
dGVkIHRvIHdvcmsgb24gdGhlIGFmZmVjdGVkIHN5c3RlbShzKSBhbmQgKGIpIGFsc28KbGV0dGlu
ZyB3cml0ZXMgZ28gdG8gYSBzY3JhdGNoIHBhZ2UgcmVxdWlyaW5nIGEgcGVyLWRldmljZSBzY3Jh
dGNoCnBhZ2UgKGFuZCBhc3NvY2lhdGVkIHBhZ2UgdGFibGVzKSByYXRoZXIgdGhhbiBhIHN5c3Rl
bS13aWRlIG9uZSwgYXMKZGV2aWNlcyBjb21pbmcgZnJvbSBkaWZmZXJlbnQgZG9tYWlucyB3b3Vs
ZCBvdGhlcndpc2UgYmUgYWJsZSB0bwpvYnNlcnZlIGRhdGEgd3JpdHRlbiB0byBtZW1vcnkgYnkg
cmVzcGVjdGl2ZWx5ICJmb3JlaWduIiBkZXZpY2VzCihhbmQgaGVuY2UgZG9tYWlucykuCgpCdXQg
dGhpcyBpcyBhbGwgZ3Vlc3N3b3JrIHdpdGhvdXQgdGhlIGZpcm13YXJlIHdyaXRlcnMgb2YgYWZm
ZWN0ZWQKc3lzdGVtcyBnaXZpbmcgdXMgYXQgbGVhc3Qgc29tZSBoaW50cy4KCj4gYWx0ZXJuYXRp
dmVseSBJIGFsc28gdGhvdWdodCBhYm91dCB3aGV0aGVyIHdoaXRlbGlzdGluZyB0aGUgcHJvYmxl
bWF0aWMgCj4gZGV2aWNlcyB0aHJvdWdoIGFub3RoZXIgb3B0aW9uIChlLmcuIG5vZmF1bHQ9Yjpk
OmYpIGNvdWxkIHByb3ZpZGUgbW9yZQo+IHZhbHVlLiBJbiBjb25jZXB0IGFueSBJT01NVSBwYWdl
IHRhYmxlIChkb20wLCBkb21faW8gb3IgZG9tVSkgCj4gZm9yIHN1Y2ggYm9ndXMgZGV2aWNlIHNo
b3VsZCBub3QgaW5jbHVkZSBpbnZhbGlkIGVudHJ5LCBldmVuIHdoZW4gCj4gcXVhcmFudGluZSBp
cyBub3Qgc3BlY2lmaWVkLiBIb3dldmVyIEknbSBub3Qgc3VyZSB3aGV0aGVyIGl0J3Mgd29ydGh5
IG9mIAo+IGdvaW5nIHNvIGZhci4uLgoKSW5kZWVkLiBRdWVzdGlvbiB0aG91Z2ggaXMgd2hldGhl
ciB0aGlzIGJhZCBiZWhhdmlvciBpcyBkZXZpY2Ugc3BlY2lmaWMKKHJhdGhlciB0aGFuIGUuZy4g
c3lzdGVtIGRlcGVuZGVudCkuIFBsdXMgLSBhcyBwZXIgYWJvdmUgLSBxdWVzdGlvbgphbHNvIGlz
IHdoZXRoZXIgaXQncyByZWFsbHkgbGVhZiAob3IgaW50ZXJtZWRpYXRlKSBwYWdlIHRhYmxlIGVu
dHJ5CnByZXNlbmNlIHdoaWNoIGFjdHVhbGx5IG1hdHRlcnMgaGVyZS4gSWYgaXQgd2FzLCBJIGFn
cmVlIHdlIHNob3VsZG4ndApoYXZlIGFueSBub24tcHJlc2VudCBlbnRyaWVzIGFueXdoZXJlIGlu
IHRoZSBwYWdlIHRhYmxlIHRyZWVzLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
