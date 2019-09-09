Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9AFAD834
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 13:48:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7I6j-0002VC-KR; Mon, 09 Sep 2019 11:45:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fSZh=XE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i7I6i-0002V2-Ja
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 11:45:20 +0000
X-Inumbo-ID: 4c4530f6-d2f7-11e9-b299-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 4c4530f6-d2f7-11e9-b299-bc764e2007e4;
 Mon, 09 Sep 2019 11:45:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B881128;
 Mon,  9 Sep 2019 04:45:18 -0700 (PDT)
Received: from [10.37.12.117] (unknown [10.37.12.117])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3EC853F71F;
 Mon,  9 Sep 2019 04:45:15 -0700 (PDT)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1566324587-3442-1-git-send-email-olekstysh@gmail.com>
 <1566324587-3442-2-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <899e4076-d47e-a7e6-14e5-dba21124a330@arm.com>
Date: Mon, 9 Sep 2019 12:45:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566324587-3442-2-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V3 1/8] iommu/arm: Add iommu_helpers.c file
 to keep common for IOMMUs stuff
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

SGkgT2xla3NhbmRyLAoKT24gOC8yMC8xOSA3OjA5IFBNLCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3
cm90ZToKPiBGcm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29A
ZXBhbS5jb20+Cj4gCj4gSW50cm9kdWNlIGEgc2VwYXJhdGUgZmlsZSB0byBrZWVwIHZhcmlvdXMg
aGVscGVycyB3aGljaCBjb3VsZCBiZSB1c2VkCj4gYnkgbW9yZSB0aGFuIG9uZSBJT01NVSBkcml2
ZXIgaW4gb3JkZXIgbm90IHRvIGR1cGxpY2F0ZSBjb2RlLgo+IAo+IFRoZSBmaXJzdCBjYW5kaWRh
dGVzIHRvIGJlIG1vdmVkIHRvIHRoZSBuZXcgZmlsZSBhcmUgU01NVSBkcml2ZXIncwo+ICJtYXBf
cGFnZS91bm1hcF9wYWdlIiBjYWxsYmFja3MuIFRoZXJlIGNhbGxiYWNrcyBuZWl0aGVyIGNvbnRh
aW4gYW55CgpzL1RoZXJlL1RoZXNlLyBJIHRoaW5rLgoKPiBTTU1VIHNwZWNpZmljIGluZm8gbm9y
IHBlcmZvcm0gYW55IFNNTVUgc3BlY2lmaWMgYWN0aW9ucyBhbmQgYXJlIGdvaW5nCj4gdG8gYmUg
dGhlIHNhbWUgYWNyb3NzIGFsbCBJT01NVSBkcml2ZXJzIHdoaWNoIEgvVyBJUCBzaGFyZXMgUDJN
Cj4gd2l0aCB0aGUgQ1BVIGxpa2UgU01NVSBkb2VzLgo+IAo+IFNvLCBtb3ZlIGNhbGxiYWNrcyB0
byBpb21tdV9oZWxwZXJzLmMgZm9yIHRoZSB1cGNvbWluZyBJUE1NVSBkcml2ZXIKPiB0byBiZSBh
YmxlIHRvIHJlLXVzZSB0aGVtLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBUeXNoY2hl
bmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4KPiBDQzogSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT4KClsuLi5dCgo+ICAgc3RhdGljIF9faW5pdCBjb25zdCBzdHJ1
Y3QgYXJtX3NtbXVfZGV2aWNlICpmaW5kX3NtbXUoY29uc3Qgc3RydWN0IGRldmljZSAqZGV2KQo+
IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2lvbW11LmggYi94ZW4vaW5jbHVkZS9h
c20tYXJtL2lvbW11LmgKPiBpbmRleCA5MDRjOWFlLi4yMGQ4NjVlIDEwMDY0NAo+IC0tLSBhL3hl
bi9pbmNsdWRlL2FzbS1hcm0vaW9tbXUuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vaW9t
bXUuaAo+IEBAIC0yNiw2ICsyNiwxMyBAQCBzdHJ1Y3QgYXJjaF9pb21tdQo+ICAgY29uc3Qgc3Ry
dWN0IGlvbW11X29wcyAqaW9tbXVfZ2V0X29wcyh2b2lkKTsKPiAgIHZvaWQgaW9tbXVfc2V0X29w
cyhjb25zdCBzdHJ1Y3QgaW9tbXVfb3BzICpvcHMpOwo+ICAgCj4gKy8qIG1hcHBpbmcgaGVscGVy
cyAqLwoKSSB3b3VsZCBzcGVjaWZ5IHRoaXMgb25seSB3b3JrcyB3aGVuIHRoZSBQVCBpcyBzaGFy
ZWQgYmV0d2VlbiB0aGUgSU9NTVUgCmFuZCBDUFUuCgpXaXRoIHRoZSB0d28gcmVxdWVzdHMgYWRk
cmVzc2VkOgoKQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cgo+
ICtpbnQgX19tdXN0X2NoZWNrIGFybV9pb21tdV9tYXBfcGFnZShzdHJ1Y3QgZG9tYWluICpkLCBk
Zm5fdCBkZm4sIG1mbl90IG1mbiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdW5zaWduZWQgaW50IGZsYWdzLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1bnNpZ25lZCBpbnQgKmZsdXNoX2ZsYWdzKTsKPiAraW50IF9fbXVzdF9jaGVjayBhcm1f
aW9tbXVfdW5tYXBfcGFnZShzdHJ1Y3QgZG9tYWluICpkLCBkZm5fdCBkZm4sCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50ICpmbHVzaF9mbGFncyk7
Cj4gKwo+ICAgI2VuZGlmIC8qIF9fQVJDSF9BUk1fSU9NTVVfSF9fICovCj4gICAKPiAgIC8qCj4g
CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
