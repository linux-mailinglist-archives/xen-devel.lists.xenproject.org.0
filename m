Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FAA1803ED
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 17:49:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBi1e-000204-NI; Tue, 10 Mar 2020 16:46:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EhAh=43=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBi1c-0001zz-QG
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 16:46:36 +0000
X-Inumbo-ID: b4364b82-62ee-11ea-adea-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b4364b82-62ee-11ea-adea-12813bfff9fa;
 Tue, 10 Mar 2020 16:46:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 90372AC3A;
 Tue, 10 Mar 2020 16:46:34 +0000 (UTC)
To: paul@xen.org
References: <83253657-b3b4-a045-b829-f8f4c4aeae28@suse.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7C5CDC@SHSMSX104.ccr.corp.intel.com>
 <2999c86a-328f-927e-6b53-895d2fd788f6@suse.com>
 <000f01d5f6d7$a89fe3b0$f9dfab10$@xen.org>
 <7f34d08e-7876-5eae-d561-c20db2fd5d99@suse.com>
 <002e01d5f6ee$75e09700$61a1c500$@xen.org>
 <0c311606-5c96-9171-f106-23e1e0c13bbb@suse.com>
 <003401d5f6f5$b119b4d0$134d1e70$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ce883498-498e-f8a1-b2c0-8c1061d87a56@suse.com>
Date: Tue, 10 Mar 2020 17:46:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <003401d5f6f5$b119b4d0$134d1e70$@xen.org>
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
Cc: xen-devel@lists.xenproject.org, "'Tian, Kevin'" <kevin.tian@intel.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDMuMjAyMCAxNzowNSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+
IFNlbnQ6IDEwIE1hcmNoIDIwMjAgMTU6NDQKPj4gVG86IHBhdWxAeGVuLm9yZwo+PiBDYzogeGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyAnVGlhbiwgS2V2aW4nIDxrZXZpbi50aWFuQGlu
dGVsLmNvbT47ICdBbmRyZXcgQ29vcGVyJwo+PiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
Pj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2M10gSU9NTVU6IG1ha2UgRE1BIGNv
bnRhaW5tZW50IG9mIHF1YXJhbnRpbmVkIGRldmljZXMgb3B0aW9uYWwKPj4KPj4gT24gMTAuMDMu
MjAyMCAxNjoxMywgUGF1bCBEdXJyYW50IHdyb3RlOgo+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tCj4+Pj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pj4+IFNl
bnQ6IDEwIE1hcmNoIDIwMjAgMTU6MDUKPj4+PiBUbzogcGF1bEB4ZW4ub3JnCj4+Pj4gQ2M6ICdU
aWFuLCBLZXZpbicgPGtldmluLnRpYW5AaW50ZWwuY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOyAnQW5kcmV3IENvb3BlcicKPj4+PiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KPj4+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzXSBJT01NVTogbWFrZSBETUEgY29udGFpbm1l
bnQgb2YgcXVhcmFudGluZWQgZGV2aWNlcyBvcHRpb25hbAo+Pj4+Cj4+Pj4gT24gMTAuMDMuMjAy
MCAxMzozMCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+Pj4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0KPj4+Pj4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4+Pj4+
IFNlbnQ6IDEwIE1hcmNoIDIwMjAgMTA6MjcKPj4+Pj4+IFRvOiBUaWFuLCBLZXZpbiA8a2V2aW4u
dGlhbkBpbnRlbC5jb20+OyBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4KPj4+Pj4+IENjOiB4
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+Cj4+Pj4+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzXSBJT01NVTogbWFr
ZSBETUEgY29udGFpbm1lbnQgb2YgcXVhcmFudGluZWQgZGV2aWNlcyBvcHRpb25hbAo+Pj4+Pj4K
Pj4+Pj4+IE9uIDEwLjAzLjIwMjAgMDQ6NDMsIFRpYW4sIEtldmluIHdyb3RlOgo+Pj4+Pj4+PiBG
cm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+Pj4+Pj4+IFNlbnQ6IE1vbmRh
eSwgTWFyY2ggOSwgMjAyMCA3OjA5IFBNCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEknbSBoYXBweSB0byB0
YWtlIGJldHRlciBzdWdnZXN0aW9ucyB0byByZXBsYWNlIHRoZSAiZnVsbCIgY29tbWFuZCBsaW5l
Cj4+Pj4+Pj4+IG9wdGlvbiBhbmQgS2NvbmZpZyBwcm9tcHQgdG9rZW5zLiBJIGRvbid0IHRoaW5r
IHRob3VnaCB0aGF0ICJmYXVsdCIgYW5kCj4+Pj4+Pj4+ICJ3cml0ZS1mYXVsdCIgYXJlIHJlYWxs
eSBzdWl0YWJsZSB0aGVyZS4KPj4+Pj4+Pgo+Pj4+Pj4+IEkgdGhpbmsgd2UgbWF5IGp1c3QgYWxs
b3cgYm90aCByL3cgYWNjZXNzIHRvIHNjcmF0Y2ggcGFnZSBmb3Igc3VjaCBib2d1cwo+Pj4+Pj4+
IGRldmljZSwgd2hpY2ggbWF5IG1ha2UgJ2Z1bGwnIG1vcmUgcmVhc29uYWJsZSBzaW5jZSB3ZSBu
b3cgZnVsbHkKPj4+Pj4+PiBjb250YWluIGluLWZseSBETUFzLiBJJ20gbm90IHN1cmUgYWJvdXQg
dGhlIHZhbHVlIG9mIGtlZXBpbmcgd3JpdGUtZmF1bHQKPj4+Pj4+PiBhbG9uZSBmb3Igc3VjaCBk
ZXZpY2VzIChqdXN0IGJlY2F1c2Ugb25lIG9ic2VydmVkIGhpcyBzcGVjaWZpYyBkZXZpY2Ugb25s
eQo+Pj4+Pj4+IGhhcyBwcm9ibGVtIHdpdGggcmVhZC1mYXVsdCkuCj4+Pj4+Pgo+Pj4+Pj4gV2Vs
bCwgYSBmdW5kYW1lbnRhbCBwcm9ibGVtIEkgaGF2ZSBoZXJlIGlzIHRoYXQgSSBzdGlsbCBkb24n
dCBrbm93Cj4+Pj4+PiB0aGUgX2V4YWN0XyBjb25kaXRpb25zIGZvciB0aGUgb2JzZXJ2ZWQgaGFu
Z3MuIEkgY29uc2lkZXIgaXQgdW5saWtlbHkKPj4+Pj4+IGZvciBJT01NVSByZWFkIGZhdWx0cyB0
byBjYXVzZSBoYW5ncywgYnV0IGZvciB3cml0ZSBmYXVsdHMgdG8gYmUKPj4+Pj4+ICJmaW5lIi4K
Pj4+Pj4KPj4+Pj4gQUZBSUsgaXQncyBiZWNhdXNlIHRoZSB3cml0ZXMgYXJlIHBvc3RlZCBhbmQg
c28gYW55IGZhdWx0cyBhcmUganVzdCBpZ25vcmVkLCB3aGVyZWFzIGEgcmVhZCBmYXVsdAo+Pj4+
IGJlaW5nIHN5bmNocm9ub3VzIGNhdXNlcyB0aGUgZGV2aWNlJ3Mgc3RhdGUgbWFjaGluZSB0byBs
b2NrIHVwLiBJdCByZWFsbHkgaXMgb2JzZXJ2ZWQgYmVoYXZpb3VyLgo+Pj4+Pgo+Pj4+Pj4gSXQg
d291bGQgc2VlbSBtb3JlIGxpa2VseSB0byBtZSB0aGF0IGUuZy4gYSBub24tcHJlc2VudAo+Pj4+
Pj4gY29udGV4dCBlbnRyeSBtaWdodCBjYXVzZSBpc3N1ZXMuIElmIHRoYXQgd2FzIHRoZSBjYXNl
LCB3ZSB3b3VsZG4ndAo+Pj4+Pj4gbmVlZCB0byBoYW5kbGUgcmVhZHMgYW5kIHdyaXRlcyBkaWZm
ZXJlbnRseTsgd2UgY291bGQgaW5zdGVhZCBpbnN0YWxsCj4+Pj4+PiBhbiBhbGwgemVybyB0b3Ag
bGV2ZWwgcGFnZSB0YWJsZS4gQW5kIHdlJ2Qgc3RpbGwgZ2V0IGFsbCBmYXVsdHMgdGhhdAo+Pj4+
Pj4gYXJlIHN1cHBvc2VkIHRvIHN1cmZhY2UuIEJ1dCBwZXJoYXBzIFBhdWwgZGlkIHRyeSB0aGlz
IGJhY2sgdGhlbiwgYW5kCj4+Pj4+PiBpdCB0dXJuZWQgb3V0IHRvIG5vdCBiZSBhbiBvcHRpb24u
Cj4+Pj4+Pgo+Pj4+Pgo+Pj4+PiBUaGUgb25seSBpbmZvIEkgaGFkIHdhcyB0aGF0IGZhdWx0cyBv
biBETUEgcmVhZHMgaGFkIHRvIGF2b2lkZWQKPj4+Pj4gY29tcGxldGVseS4gSSBkaWQgbm90IGhh
dmUgYWNjZXNzIHRvIHRoZSBoL3cgaW4gcXVlc3Rpb24gYXQgdGhlCj4+Pj4+IHRpbWUuIEkgbWF5
IGJlIGFibGUgdG8gZ2V0IGl0IG5vdy4KPj4+Pgo+Pj4+IEkgc2VlLiBUaGUgaW1wbGljYXRpb24g
dGhlbiBpcywgYXMgS2V2aW4gc2FpZCwgdGhhdCB3ZSBtdXN0bid0IHJ1bgo+Pj4+IGd1ZXN0cyB3
aXRoIF9hbnlfIElPTU1VIFBURXMgaGF2aW5nIHRoZWlyICJyZWFkIiBiaXRzIGNsZWFyLgo+Pj4+
IEFueXRoaW5nIHRoYXQncyAibm90IHByZXNlbnQiIG5vdyB3b3VsZCBuZWVkIGRpcmVjdGluZyB0
byBhIHNjcmF0Y2gKPj4+PiBwYWdlLiBJIHRoZW4gZnVydGhlciB3b25kZXIgd2hhdCBlZmZlY3Qg
cmVhZHMgdG8gYWRkcmVzc2VzIGJleW9uZAo+Pj4+IEFHQVcgd291bGQgaGF2ZS4gSXQgbWF5IGJl
IGltcG9zc2libGUgdG8gYXJyYW5nZSBmb3Igc3VmZmljaWVudGx5Cj4+Pj4gc2VjdXJlIHBhc3Mt
dGhyb3VnaCB3aXRoIHN1Y2ggYSBkZXZpY2UsIGF0IHdoaWNoIHBvaW50IC0gYWdhaW4gYXMKPj4+
PiBzYWlkIGJ5IEtldmluIC0gdGhlcmUgbWF5IGJlIGxpdHRsZSBwb2ludCBpbiB0aGUgc2NyYXRj
aCBwYWdlCj4+Pj4gYmFzZWQgcXVhcmFudGluaW5nLgo+Pj4+Cj4+Pgo+Pj4gV2VsbCwgSSBjYW4n
dCBzYXkgdGhlcmUncyBsaXR0bGUgcG9pbnQgaW4gaXQgYXMgaXQgZG9lcyBmaXggYSBob3N0IGxv
Y2stdXAuCj4+Pgo+Pj4gWW91IHNheSAiYXMgS2V2aW4gc2FpZCwgdGhhdCB3ZSBtdXN0bid0IHJ1
biBndWVzdHMgd2l0aCBfYW55XyBJT01NVQo+Pj4gUFRFcyBoYXZpbmcgdGhlaXIgInJlYWQiIGJp
dHMgY2xlYXIiLi4uIEkgY2FuJ3QgZmluZCB0aGF0LiBJIGRpZAo+Pj4gZmluZCB3aGVyZSBoZSBz
YWlkICJJbiBjb25jZXB0IGFueSBJT01NVSBwYWdlIHRhYmxlIChkb20wLCBkb21faW8KPj4+IG9y
IGRvbVUpIGZvciBzdWNoIGJvZ3VzIGRldmljZSBzaG91bGQgbm90IGluY2x1ZGUgaW52YWxpZCBl
bnRyeSIsCj4+PiBidXQgdGhhdCdzIGEgZGlmZmVyZW50IHRoaW5nLgo+Pgo+PiBJbiB3aGljaCB3
YXk/Cj4gCj4gSW4gdGhhdCB0aGUgUFRFIHdvdWxkIHN0aWxsIGJlIGEgdmFsaWQgZW50cnk/IEl0
IHdvdWxkIGhhdmUgcmVhZAo+IHBlcm0gY2xlYXIsIHllcywgYnV0IHRoYXQgZG9lc24ndCBtYWtl
IHRoZSBQVEUgaW52YWxpZC4KCkl0IHdhcyBteSB1bmRlcnN0YW5kaW5nIHRoYXQgS2V2aW4gbWVh
bnQgImludmFsaWQiIHRvIHJlcHJlc2VudApib3RoICJyZWFkIiBhbmQgIndyaXRlIiBjbGVhci4K
Cj4+PiBIb3dldmVyLCBpcyBhIHJlYWxseSBzYXlpbmcgdGhhdCB0aGluZ3Mgd2lsbCBicmVhayBp
ZiBhbnkgb2YgdGhlCj4+PiBQVEVzIGhhcyB0aGVpciBwcmVzZW50IGJpdCBjbGVhcj8KPj4KPj4g
V2VsbCwgeW91IHNhaWQgdGhhdCByZWFkIGZhdWx0cyBhcmUgZmF0YWwgKHRvIHRoZSBob3N0KS4g
UmVhZHMgd2lsbCwKPj4gZm9yIGFueSBhZGRyZXNzIHdpdGggYW4gdW5wb3B1bGF0ZWQgUFRFLCBy
ZXN1bHQgaW4gYSBmYXVsdCBhbmQgaGVuY2UKPj4gYnkgaW1wbGljYXRpb24gYmUgZmF0YWwuCj4g
Cj4gT2ggSSBzZWUuIEkgdGhvdWdodCB0aGVyZSB3YXMgYW4gaW1wbGljYXRpb24gdGhhdCB0aGUg
SU9NTVUgY291bGQKPiBub3QgY29wZSB3aXRoIG5vbi1wcmVzZW50IFBURXMgaW4gc29tZSB3YXku
CgpXZWxsLCB0aGF0J3Mgd2hhdCB5b3Ugd2VyZSB0ZWxsaW5nIG1lLiBPciB3aGF0IEkgdW5kZXJz
dG9vZCBvZiB3aGF0CnlvdSB3ZXJlIHNheWluZy4KCj4gQWdyZWVkIHRoYXQsIHdoZW4gdGhlIGRl
dmljZSBpcyBhc3NpZ25lZCB0byB0aGUgZ3Vlc3QsIHRoZW4gaXQgY2FuCj4gYXJyYW5nZSAodmlh
IGJhbGxvb25pbmcpIGZvciBhIG5vbi1wcmVzZW50IGVudHJ5IHRvIGJlIGhpdCBieSBhCj4gcmVh
ZCB0cmFuc2FjdGlvbiwgcmVzdWx0aW5nIGluIGEgbG9jay11cC4KCk5vdCBqdXN0IGJhbGxvb25p
bmcsIGJ1dCBzaW1wbHkgYnkgcHJvZ3JhbW1pbmcgYSBib2d1cyBhZGRyZXNzIGludG8Kd2hhdGV2
ZXIgY29udHJvbHMgdGhlIGRldmljZSdzIERNQSBvcGVyYXRpb24uCgo+IEJ1dCBkZWFsaW5nIHdp
dGggYQo+IG1hbGljaW91cyBndWVzdCB3YXMgbm90IHRoZSBpc3N1ZSBhdCBoYW5kLi4uIGRlYWxp
bmcgd2l0aCBhIGJ1Z2d5Cj4gZGV2aWNlIHRoYXQgc3RpbGwgdHJpZWQgdG8gRE1BIGFmdGVyIHJl
c2V0IGFuZCB3aGlsc3QgaW4gcXVhcmFudGluZQo+IHdhcyB0aGUgcHJvYmxlbS4KClN1cmUsIGJ1
dCBhc3NpZ25pbmcgc3VjaCBhIGJ1Z2d5IGRldmljZSB0byBhIGd1ZXN0IGlzIHN1c3BpY2lvdXMg
aW4KdGhlIGZpcnN0IHBsYWNlLiBTdXJlLCBpZiB5b3UgdHJ1c3QgeW91ciBndWVzdCAoaW5jbHVk
aW5nIGl0IGJlaW5nCmJ1ZyBmcmVlKSB0aGVuIGFsbCB5b3Ugd2FudCBpcyBmb3IgdGhlIHN5c3Rl
bSB0byByZW1haW4gc3RhYmxlIGFmdGVyCnRoZSBndWVzdCBkaWVkLgoKPj4gKEFzIGFuIGFzaWRl
LCBvdGhlciB0aGFuIGluIHg4NidzIENQVSBwYWdlIHRhYmxlcywgSU9NTVUgcGFnZSB0YWJsZXMK
Pj4gaW4gYm90aCB0aGVpciBBTUQgYW5kIEludGVsIGluY2FybmF0aW9ucyBkb24ndCBoYXZlICJw
cmVzZW50IiBiaXRzIC0KPj4gdGhleSBoYXZlICJyZWFkIiBhbmQgIndyaXRlIiBvbmVzIG9ubHku
KQo+Pgo+IAo+IE9oLCBvay4gSSBtdXN0IGhhdmUgbWlzdW5kZXJzdG9vZCB0aGUgcHVycG9zZSBv
ZiB0aGUgJ3ByJyBiaXQgaW4KPiB0aGUgQU1EIElPTU1VIFBURSB0aGVuLgoKT2gsIG5vIC0gSSBv
dmVybG9va2VkIGl0LCBhcHBseWluZyB0b28gbXVjaCBWVC1kIHRvIHRoYXQgY29kZS4gSSdtCnNv
cnJ5LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
