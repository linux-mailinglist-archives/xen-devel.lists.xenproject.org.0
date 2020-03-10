Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E58DA180131
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 16:07:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBgQu-0005cP-AD; Tue, 10 Mar 2020 15:04:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EhAh=43=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBgQt-0005cK-21
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 15:04:35 +0000
X-Inumbo-ID: 735d321e-62e0-11ea-92cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 735d321e-62e0-11ea-92cf-bc764e2007e4;
 Tue, 10 Mar 2020 15:04:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 07B7EAFF2;
 Tue, 10 Mar 2020 15:04:33 +0000 (UTC)
To: paul@xen.org
References: <83253657-b3b4-a045-b829-f8f4c4aeae28@suse.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7C5CDC@SHSMSX104.ccr.corp.intel.com>
 <2999c86a-328f-927e-6b53-895d2fd788f6@suse.com>
 <000f01d5f6d7$a89fe3b0$f9dfab10$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7f34d08e-7876-5eae-d561-c20db2fd5d99@suse.com>
Date: Tue, 10 Mar 2020 16:04:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <000f01d5f6d7$a89fe3b0$f9dfab10$@xen.org>
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

T24gMTAuMDMuMjAyMCAxMzozMCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+
IFNlbnQ6IDEwIE1hcmNoIDIwMjAgMTA6MjcKPj4gVG86IFRpYW4sIEtldmluIDxrZXZpbi50aWFu
QGludGVsLmNvbT47IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPgo+PiBDYzogeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnOyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgo+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzXSBJT01NVTogbWFrZSBETUEgY29udGFp
bm1lbnQgb2YgcXVhcmFudGluZWQgZGV2aWNlcyBvcHRpb25hbAo+Pgo+PiBPbiAxMC4wMy4yMDIw
IDA0OjQzLCBUaWFuLCBLZXZpbiB3cm90ZToKPj4+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+Cj4+Pj4gU2VudDogTW9uZGF5LCBNYXJjaCA5LCAyMDIwIDc6MDkgUE0KPj4+
Pgo+Pj4+IEknbSBoYXBweSB0byB0YWtlIGJldHRlciBzdWdnZXN0aW9ucyB0byByZXBsYWNlIHRo
ZSAiZnVsbCIgY29tbWFuZCBsaW5lCj4+Pj4gb3B0aW9uIGFuZCBLY29uZmlnIHByb21wdCB0b2tl
bnMuIEkgZG9uJ3QgdGhpbmsgdGhvdWdoIHRoYXQgImZhdWx0IiBhbmQKPj4+PiAid3JpdGUtZmF1
bHQiIGFyZSByZWFsbHkgc3VpdGFibGUgdGhlcmUuCj4+Pgo+Pj4gSSB0aGluayB3ZSBtYXkganVz
dCBhbGxvdyBib3RoIHIvdyBhY2Nlc3MgdG8gc2NyYXRjaCBwYWdlIGZvciBzdWNoIGJvZ3VzCj4+
PiBkZXZpY2UsIHdoaWNoIG1heSBtYWtlICdmdWxsJyBtb3JlIHJlYXNvbmFibGUgc2luY2Ugd2Ug
bm93IGZ1bGx5Cj4+PiBjb250YWluIGluLWZseSBETUFzLiBJJ20gbm90IHN1cmUgYWJvdXQgdGhl
IHZhbHVlIG9mIGtlZXBpbmcgd3JpdGUtZmF1bHQKPj4+IGFsb25lIGZvciBzdWNoIGRldmljZXMg
KGp1c3QgYmVjYXVzZSBvbmUgb2JzZXJ2ZWQgaGlzIHNwZWNpZmljIGRldmljZSBvbmx5Cj4+PiBo
YXMgcHJvYmxlbSB3aXRoIHJlYWQtZmF1bHQpLgo+Pgo+PiBXZWxsLCBhIGZ1bmRhbWVudGFsIHBy
b2JsZW0gSSBoYXZlIGhlcmUgaXMgdGhhdCBJIHN0aWxsIGRvbid0IGtub3cKPj4gdGhlIF9leGFj
dF8gY29uZGl0aW9ucyBmb3IgdGhlIG9ic2VydmVkIGhhbmdzLiBJIGNvbnNpZGVyIGl0IHVubGlr
ZWx5Cj4+IGZvciBJT01NVSByZWFkIGZhdWx0cyB0byBjYXVzZSBoYW5ncywgYnV0IGZvciB3cml0
ZSBmYXVsdHMgdG8gYmUKPj4gImZpbmUiLgo+IAo+IEFGQUlLIGl0J3MgYmVjYXVzZSB0aGUgd3Jp
dGVzIGFyZSBwb3N0ZWQgYW5kIHNvIGFueSBmYXVsdHMgYXJlIGp1c3QgaWdub3JlZCwgd2hlcmVh
cyBhIHJlYWQgZmF1bHQgYmVpbmcgc3luY2hyb25vdXMgY2F1c2VzIHRoZSBkZXZpY2UncyBzdGF0
ZSBtYWNoaW5lIHRvIGxvY2sgdXAuIEl0IHJlYWxseSBpcyBvYnNlcnZlZCBiZWhhdmlvdXIuCj4g
Cj4+IEl0IHdvdWxkIHNlZW0gbW9yZSBsaWtlbHkgdG8gbWUgdGhhdCBlLmcuIGEgbm9uLXByZXNl
bnQKPj4gY29udGV4dCBlbnRyeSBtaWdodCBjYXVzZSBpc3N1ZXMuIElmIHRoYXQgd2FzIHRoZSBj
YXNlLCB3ZSB3b3VsZG4ndAo+PiBuZWVkIHRvIGhhbmRsZSByZWFkcyBhbmQgd3JpdGVzIGRpZmZl
cmVudGx5OyB3ZSBjb3VsZCBpbnN0ZWFkIGluc3RhbGwKPj4gYW4gYWxsIHplcm8gdG9wIGxldmVs
IHBhZ2UgdGFibGUuIEFuZCB3ZSdkIHN0aWxsIGdldCBhbGwgZmF1bHRzIHRoYXQKPj4gYXJlIHN1
cHBvc2VkIHRvIHN1cmZhY2UuIEJ1dCBwZXJoYXBzIFBhdWwgZGlkIHRyeSB0aGlzIGJhY2sgdGhl
biwgYW5kCj4+IGl0IHR1cm5lZCBvdXQgdG8gbm90IGJlIGFuIG9wdGlvbi4KPj4KPiAKPiBUaGUg
b25seSBpbmZvIEkgaGFkIHdhcyB0aGF0IGZhdWx0cyBvbiBETUEgcmVhZHMgaGFkIHRvIGF2b2lk
ZWQKPiBjb21wbGV0ZWx5LiBJIGRpZCBub3QgaGF2ZSBhY2Nlc3MgdG8gdGhlIGgvdyBpbiBxdWVz
dGlvbiBhdCB0aGUKPiB0aW1lLiBJIG1heSBiZSBhYmxlIHRvIGdldCBpdCBub3cuCgpJIHNlZS4g
VGhlIGltcGxpY2F0aW9uIHRoZW4gaXMsIGFzIEtldmluIHNhaWQsIHRoYXQgd2UgbXVzdG4ndCBy
dW4KZ3Vlc3RzIHdpdGggX2FueV8gSU9NTVUgUFRFcyBoYXZpbmcgdGhlaXIgInJlYWQiIGJpdHMg
Y2xlYXIuCkFueXRoaW5nIHRoYXQncyAibm90IHByZXNlbnQiIG5vdyB3b3VsZCBuZWVkIGRpcmVj
dGluZyB0byBhIHNjcmF0Y2gKcGFnZS4gSSB0aGVuIGZ1cnRoZXIgd29uZGVyIHdoYXQgZWZmZWN0
IHJlYWRzIHRvIGFkZHJlc3NlcyBiZXlvbmQKQUdBVyB3b3VsZCBoYXZlLiBJdCBtYXkgYmUgaW1w
b3NzaWJsZSB0byBhcnJhbmdlIGZvciBzdWZmaWNpZW50bHkKc2VjdXJlIHBhc3MtdGhyb3VnaCB3
aXRoIHN1Y2ggYSBkZXZpY2UsIGF0IHdoaWNoIHBvaW50IC0gYWdhaW4gYXMKc2FpZCBieSBLZXZp
biAtIHRoZXJlIG1heSBiZSBsaXR0bGUgcG9pbnQgaW4gdGhlIHNjcmF0Y2ggcGFnZQpiYXNlZCBx
dWFyYW50aW5pbmcuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
