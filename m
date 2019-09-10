Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49367AED01
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 16:32:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7h9y-0006qC-9F; Tue, 10 Sep 2019 14:30:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IMu8=XF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i7h9w-0006q4-Ci
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 14:30:20 +0000
X-Inumbo-ID: 81d0b8e0-d3d7-11e9-b299-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 81d0b8e0-d3d7-11e9-b299-bc764e2007e4;
 Tue, 10 Sep 2019 14:30:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4B8F28;
 Tue, 10 Sep 2019 07:30:15 -0700 (PDT)
Received: from [10.37.12.155] (unknown [10.37.12.155])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C1DE3F71F;
 Tue, 10 Sep 2019 07:30:13 -0700 (PDT)
To: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1566324587-3442-1-git-send-email-olekstysh@gmail.com>
 <1566324587-3442-8-git-send-email-olekstysh@gmail.com>
 <17ed5e35-94e5-69a7-67f1-6978c50fea09@arm.com>
 <e2e67d7a-788d-9ae7-3f5f-274ce7bb2ab1@gmail.com>
 <7f7e08f1-d61d-d3ff-e71a-ca85de92b289@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <73320288-f70b-7c96-ea00-95d6a6f182ae@arm.com>
Date: Tue, 10 Sep 2019 15:30:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7f7e08f1-d61d-d3ff-e71a-ca85de92b289@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V3 7/8] iommu/arm: Introduce
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
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8xMC8xOSAyOjM0IFBNLCBPbGVrc2FuZHIgd3JvdGU6Cj4gCj4gSGksIEp1bGllbgoKSGks
Cgo+Pgo+Pj4+IMKgIGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaW9t
bXUuYyAKPj4+PiBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9pb21tdS5jCj4+Pj4gaW5k
ZXggNzJhMzBlMC4uNDdlNGJjNiAxMDA2NDQKPj4+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9hcm0vaW9tbXUuYwo+Pj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9p
b21tdS5jCj4+Pj4gQEAgLTIwLDYgKzIwLDcgQEAKPj4+PiDCoCAjaW5jbHVkZSA8eGVuL2xpYi5o
Pgo+Pj4+IMKgIMKgICNpbmNsdWRlIDxhc20vZGV2aWNlLmg+Cj4+Pj4gKyNpbmNsdWRlIDxhc20v
aW9tbXVfZndzcGVjLmg+Cj4+Pj4gwqAgwqAgLyoKPj4+PiDCoMKgICogRGVmZXJyZWQgcHJvYmUg
bGlzdCBpcyB1c2VkIHRvIGtlZXAgdHJhY2sgb2YgZGV2aWNlcyBmb3Igd2hpY2ggCj4+Pj4gZHJp
dmVyCj4+Pj4gQEAgLTEzOSwzICsxNDAsNTcgQEAgaW50IGFyY2hfaW9tbXVfcG9wdWxhdGVfcGFn
ZV90YWJsZShzdHJ1Y3QgCj4+Pj4gZG9tYWluICpkKQo+Pj4+IMKgIHZvaWQgX19od2RvbV9pbml0
IGFyY2hfaW9tbXVfaHdkb21faW5pdChzdHJ1Y3QgZG9tYWluICpkKQo+Pj4+IMKgIHsKPj4+PiDC
oCB9Cj4+Pj4gKwo+Pj4+ICtpbnQgX19pbml0IGlvbW11X2FkZF9kdF9kZXZpY2Uoc3RydWN0IGR0
X2RldmljZV9ub2RlICpucCkKPj4+PiArewo+Pj4+ICvCoMKgwqAgY29uc3Qgc3RydWN0IGlvbW11
X29wcyAqb3BzID0gaW9tbXVfZ2V0X29wcygpOwo+Pj4+ICvCoMKgwqAgc3RydWN0IGR0X3BoYW5k
bGVfYXJncyBpb21tdV9zcGVjOwo+Pj4+ICvCoMKgwqAgc3RydWN0IGRldmljZSAqZGV2ID0gZHRf
dG9fZGV2KG5wKTsKPj4+PiArwqDCoMKgIGludCByYyA9IDEsIGluZGV4ID0gMDsKPj4+PiArCj4+
Pj4gK8KgwqDCoCBpZiAoICFpb21tdV9lbmFibGVkICkKPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIDE7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgaWYgKCAhb3BzIHx8ICFvcHMtPmFkZF9kZXZpY2Ug
fHwgIW9wcy0+b2ZfeGxhdGUgKQo+Pj4KPj4+IFRoZSBTTU1VIGRvZXMgbm90IGltcGxlbWVudCBv
Zl94bGF0ZSgpLiBJdCBpcyBhY3R1YWxseSBvbmx5IG1hbmRhdG9yeSAKPj4+IGlmIHlvdSBhcmUg
dXNpbmcgdGhlIGdlbmVyaWMgYmluZGluZ3MuIFNvIEkgd291bGQgb25seSBjaGVjayAKPj4+IG9w
cy0+b2ZfeGxhdGUgaWYgImlvbW11cyIgZXhpc3RzLgo+Pgo+PiBBZ3JlZS4gV2lsbCBkby4KPiAK
PiAKPiBKdXN0IHRvIGNsYXJpZnkuCj4gCj4gV2hhdCBhYm91dCAib3BzLT5hZGRfZGV2aWNlIiwg
c2hhbGwgSSBjaGVjayBpdCBpZiAiaW9tbXVzIiBleGlzdHMgYXMgd2VsbD8KClllcy4gU29tZWhv
dyBJIHRob3VnaHQgYWRkX2RldmljZSB3YXMgaW1wbGVtZW50ZWQgZm9yIHRoZSBTTU1VIGRyaXZl
ciwgCmJ1dCBJIGdvdCBjb25mdXNlZCB3aXRoIHRoZSBMaW51eCBJT01NVSBvcHMuCgpDaGVlcnMs
CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
