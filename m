Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1ACBB7979
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 14:32:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAvZI-0004yk-QK; Thu, 19 Sep 2019 12:29:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ts4K=XO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iAvZG-0004yI-Rb
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 12:29:50 +0000
X-Inumbo-ID: 2b2ceaf0-dad9-11e9-978d-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 2b2ceaf0-dad9-11e9-978d-bc764e2007e4;
 Thu, 19 Sep 2019 12:29:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3A3528;
 Thu, 19 Sep 2019 05:29:47 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D40903F67D;
 Thu, 19 Sep 2019 05:29:46 -0700 (PDT)
To: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
 <1568388917-7287-8-git-send-email-olekstysh@gmail.com>
 <631c94fe-d3ac-002b-0e1d-30b9b03158d1@arm.com>
 <aa7eb317-7807-71ba-8fe2-2e944516dcd6@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <538a5486-2702-81f4-f925-c78542ff4118@arm.com>
Date: Thu, 19 Sep 2019 13:29:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <aa7eb317-7807-71ba-8fe2-2e944516dcd6@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 7/8] iommu/arm: Introduce
 iommu_add_dt_device API
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxOS8wOS8yMDE5IDEzOjI1LCBPbGVrc2FuZHIgd3JvdGU6Cj4gCj4gT24gMTkuMDku
MTkgMTQ6MzUsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGkgT2xla3NhbmRyLAo+PiBPbiAxMy8w
OS8yMDE5IDE2OjM1LCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3cm90ZToKPj4+IEZyb206IE9sZWtz
YW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4KPj4+Cj4+PiBU
aGUgbWFpbiBwdXByb3NlIG9mIHRoaXMgcGF0Y2ggaXMgdG8gYWRkIGEgd2F5IHRvIHJlZ2lzdGVy
IERUIGRldmljZQo+Pj4gKHdoaWNoIGlzIGJlaGluZCB0aGUgSU9NTVUpIHVzaW5nIHRoZSBnZW5l
cmljIElPTU1VIERUIGJpbmRpbmdzIFsxXQo+Pj4gYmVmb3JlIGFzc2lnbmluZyB0aGF0IGRldmlj
ZSB0byBhIGRvbWFpbi4KPj4+Cj4+PiBTbywgdGhpcyBwYXRjaCBhZGRzIG5ldyAiaW9tbXVfYWRk
X2R0X2RldmljZSIgQVBJIGZvciBhZGRpbmcgRFQgZGV2aWNlCj4+PiB0byB0aGUgSU9NTVUgdXNp
bmcgZ2VuZXJpYyBJT01NVSBEVCBiaW5kaW5ncyBhbmQgcHJldmlvdXNseSBhZGRlZAo+Pj4gImlv
bW11X2Z3c3BlYyIgc3VwcG9ydC4gSXQgaXMgY2FsbGVkIHdoZW4gY29uc3RydWN0aW5nIERvbTAg
c2luY2UKPj4+ICJpb21tdV9hc3NpZ25fZHRfZGV2aWNlIiBjYW4gYmUgY2FsbGVkIGZvciBEb20w
IGFsc28uCj4+Cj4+IFRoZSBsYXN0IHNlbnRlbmNlIGlzIG1pc2xlYWRpbmcuIFllcyBzb21lIGRl
dmljZXMgbWF5IGJlIGFzc2lnbmVkIHRvIHRoZSAKPj4gaGFyZHdhcmUgZG9tYWluIChha2EgZG9t
MCkgYnV0IG90aGVyIG1heSBiZSBhc3NpZ25lZCB0byBvdGhlciBkb21haW5zLgo+Pgo+PiBIZXJl
IHlvdSBhcmUgKGFiKXVzaW5nIHRoZSBjb25zdHJ1Y3Rpb24gb2YgdGhlIGhhcmR3YXJlIGRvbWFp
biB0byBhZGQgYWxsIHRoZSAKPj4gZGV2aWNlcyB0byB0aGUgSU9NTVUuIFRoaXMgd29ya3MgZmlu
ZSBub3cgYmVjYXVzZSB0aGUgaGFyZHdhcmUgZG9tYWluIHdpbGwgCj4+IGFsd2F5cyBiZSB0aGUg
Zmlyc3QgZG9tYWluIHRvIGJlIGluaXRpYWxpemVkLiBCdXQgSSBhbSBub3Qgc3VyZSB0aGF0IHdo
ZXRoZXIgCj4+IHRoaXMgaXMgY29ycmVjdCB0byBkbyBsb25nIHRlcm0uCj4+Cj4+IEFzIG1lbnRp
b25lZCBlYXJsaWVyLCBteSBwcmVmZXJlbmNlIGlzIHRvIGtlZXAgImFkZCIgYW5kICJhc3NpZ24i
IHNlcGFyYXRlZC4gCj4+IFNvIG1heWJlIHdoYXQgd2Ugd2FudCB0byBkbyBpczoKPj4KPj4gaWYg
KCBuZWVkX21hcHBpbmcgKQo+PiB7Cj4+IMKgwqAgaW9tbXVfYWRkX2R0X2RldmljZShkLCBkZXYp
Owo+PiDCoMKgIGlmICggZHRfZGV2aWNlX2lzX3Byb3RlY3RlZChkKSApCj4+IMKgwqAgewo+PiDC
oMKgwqDCoCByZXMgPSBpb21tdV9hc3NpZ25fZHRfZGV2aWNlKC4uLik7Cj4+IMKgwqDCoMKgIGlm
ICggcmVzICkKPj4gwqDCoMKgwqDCoMKgIC8qIGVycm9yICovCj4+IMKgwqAgfQo+PiB9Cj4+IFdl
IHdvdWxkIG5lZWQgc2ltaWxhciBjb2RlIGluIGlvbW11X2RvX2R0X2RvbWN0bC4gQWx0aG91Z2gs
IGRldmljZSBzaG91bGQgCj4+IGFsd2F5IGJlIHByb3RlY3RlZCBpbiB0aGlzIGNhc2UuCj4gCj4g
Cj4gV2VsbCwgd2lsbCBtb2RpZnkgdGhpcyB3YXkuCj4gCj4gCj4+PiDCoCBkaWZmIC0tZ2l0IGEv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lvbW11LmMgCj4+PiBiL3hlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL2FybS9pb21tdS5jCj4+PiBpbmRleCA1YTNkMWQ1Li5kZWE3OWVkIDEwMDY0NAo+
Pj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lvbW11LmMKPj4+ICsrKyBiL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9pb21tdS5jCj4+PiBAQCAtMjAsNiArMjAsNyBAQAo+
Pj4gwqAgI2luY2x1ZGUgPHhlbi9saWIuaD4KPj4+IMKgIMKgICNpbmNsdWRlIDxhc20vZGV2aWNl
Lmg+Cj4+PiArI2luY2x1ZGUgPGFzbS9pb21tdV9md3NwZWMuaD4KPj4+IMKgIMKgIC8qCj4+PiDC
oMKgICogRGVmZXJyZWQgcHJvYmUgbGlzdCBpcyB1c2VkIHRvIGtlZXAgdHJhY2sgb2YgZGV2aWNl
cyBmb3Igd2hpY2ggZHJpdmVyCj4+PiBAQCAtMTQxLDMgKzE0Miw2NSBAQCBpbnQgYXJjaF9pb21t
dV9wb3B1bGF0ZV9wYWdlX3RhYmxlKHN0cnVjdCBkb21haW4gKmQpCj4+PiDCoCB2b2lkIF9faHdk
b21faW5pdCBhcmNoX2lvbW11X2h3ZG9tX2luaXQoc3RydWN0IGRvbWFpbiAqZCkKPj4+IMKgIHsK
Pj4+IMKgIH0KPj4+ICsKPj4+ICtpbnQgX19pbml0IGlvbW11X2FkZF9kdF9kZXZpY2Uoc3RydWN0
IGR0X2RldmljZV9ub2RlICpucCkKPj4KPj4gU29ycnkgdG8gb25seSByZWFsaXNlIGl0IG5vdy4g
V291bGQgaXQgbWFrZSBzZW5zZSB0byBoYXZlIHRoaXMgZnVuY3Rpb24gCj4+IGltcGxlbWVudGVk
IGluIHhlbi9wYXNzdGhyb3VnaC9kZXZpY2VfdHJlZS5jPyAKPiAKPiBOb3QgZW50aXJlbHkgc3Vy
ZS4gZGV2aWNlX3RyZWUuYyBpcyBhIGNvbW1vbiBjb2RlLiBUaGUgaW9tbXVfZndzcGVjIHN0dWZm
IAo+ICh3aWRlbHkgdXNlZCBpbiB0aGlzIGZ1bmN0aW9uKSBpcyBBUk0gY29kZS4KClNvbWUgb2Yg
dGhlIGRldmljZV90cmVlLmMgYWxyZWFkeSBjb250YWlucyBBcm0gc3BlY2lmaWMgY29kZSAoc3Vj
aCBhcyBkZXZpY2UuaCkuCgpEVCBoYXMgYmVlbiBvbmx5IHVzZWQgYnkgQXJtIHNvIGZhciwgc28g
aXQgaXMgc2FkbHkgZmFpcmx5IHRpZSB0byB0aGUgCmFyY2hpdGVjdHVyZS4gQnV0IGl0IHNob3Vs
ZCBiZSBlYXN5IHRvIG1ha2UgaXQgZ2VuZXJpYyBpZiBuZWVkcyBiZSAoc3VjaCBhcyBmb3IgClJJ
U0N2KS4KCldoaWxlIGlvbW11X2Z3c3BlYyBpcyBiZWVuIGltcGxlbWVudGVkIGluIEFybSBoZWFk
ZXJzLCB0aGlzIGNvdWxkIHBvdGVudGlhbGx5IGJlIAptYWRlIGNvbW1vbi4gU28gSSB3b3VsZCBz
dGlsbCBwcmVmZXIgdGhpcyB0aGF0IGZ1bmN0aW9uIGlzIG1vdmVkIGluIGRldmljZV90cmVlLmMK
CkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
