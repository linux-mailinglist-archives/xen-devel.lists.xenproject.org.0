Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E10188BD2B
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 17:30:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxYid-00086E-MB; Tue, 13 Aug 2019 15:28:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WWvF=WJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxYib-000869-TW
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 15:28:13 +0000
X-Inumbo-ID: f691cb4c-bdde-11e9-b98e-57eec12c0e11
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f691cb4c-bdde-11e9-b98e-57eec12c0e11;
 Tue, 13 Aug 2019 15:28:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7ED728;
 Tue, 13 Aug 2019 08:28:12 -0700 (PDT)
Received: from [10.37.8.112] (unknown [10.37.8.112])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E51CB3F706;
 Tue, 13 Aug 2019 08:28:11 -0700 (PDT)
To: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <1564763985-20312-5-git-send-email-olekstysh@gmail.com>
 <33ac8ed2-572f-a7d8-ddfa-17f6dd50f0f8@arm.com>
 <72b1672a-8774-add8-a9f9-216fbd872b83@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c67d5da9-2d76-1730-5948-a9bfbfabe5eb@arm.com>
Date: Tue, 13 Aug 2019 16:28:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <72b1672a-8774-add8-a9f9-216fbd872b83@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2 4/6] iommu/arm: Add lightweight
 iommu_fwspec support
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
 sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA4LzEzLzE5IDQ6MTcgUE0sIE9sZWtzYW5kciB3cm90ZToKPiAKPiBPbiAxMy4wOC4x
OSAxNTozOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pgo+PiB4ZnJlZSBpcyBhYmxlIHRvIGRlYWwg
d2l0aCBOVUxMIHBvaW50ZXIsIHNvIHRoZSBjaGVjayBpcyBub3QgbmVjZXNzYXJ5Lgo+IAo+IFll
cywgdGhlIHJlYXNvbiBJIGxlZnQgdGhpcyBjaGVjayBpcyB0byBub3QgcGVyZm9ybSBhbiBleHRy
YSBvcGVyYXRpb24gCj4gKGRldl9pb21tdV9md3NwZWNfc2V0KS4gU2hhbGwgSSBkcm9wIHRoaXMg
Y2hlY2sgYW55d2F5PwoKSSBjYW4ndCBzZWUgYW55IGlzc3VlIHRvIGRvIHRoZSBleHRyYSBvcGVy
YXRpb24uIFRoaXMgaXMgbm90IGhvdHBhdGggYW5kIAppdCBpcyBoYXJtbGVzcy4KCgo+Pj4gZGlm
ZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vaW9tbXUuaCBiL3hlbi9pbmNsdWRlL2FzbS1h
cm0vaW9tbXUuaAo+Pj4gaW5kZXggMjBkODY1ZS4uMTg1M2JkOSAxMDA2NDQKPj4+IC0tLSBhL3hl
bi9pbmNsdWRlL2FzbS1hcm0vaW9tbXUuaAo+Pj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9p
b21tdS5oCj4+PiBAQCAtMTQsNiArMTQsOCBAQAo+Pj4gwqAgI2lmbmRlZiBfX0FSQ0hfQVJNX0lP
TU1VX0hfXwo+Pj4gwqAgI2RlZmluZSBfX0FSQ0hfQVJNX0lPTU1VX0hfXwo+Pj4gwqAgKyNpbmNs
dWRlIDxhc20vaW9tbXVfZndzcGVjLmg+Cj4+Cj4+IGlvbW11LmggZG9lcyBub3Qgc2VlbSB0byB1
c2UgYW55dGhpbmcgZGVmaW5lZCBpbiBpb21tdV9md3NwZWMuaC4gU28gCj4+IHdoeSBkbyB5b3Ug
aW5jbHVkZSBpdCBoZXJlPwo+IAo+IEkgd2FzIHRoaW5raW5nIHRoYXQgZXZlcnkgc291cmNlIHdo
aWNoIGluY2x1ZGVzIGlvbW11Lmggd2lsbCBnZXQgCj4gaW9tbXVfZndzcGVjLmggaW5jbHVkZWQg
aW5kaXJlY3RseS4gTm8gbmVlZCB0byBpbmNsdWRlIGlvbW11X2Z3c3BlYy5oIGluIAo+IG1hbnkg
c291cmNlcy4KPiAKPiBUaGlzIHdhcyBhIHJlYXNvbi4gU2hhbGwgSSBpbmNsdWRlZCBpdCBkaXJl
Y3RseSB3aGVyZSBuZWVkZWQ/CgpUaGVyZSBhcmUgYSBmZXcgY2FzZXMgd2hlcmUgaW9tbXUuaCBp
cyByZXF1aXJlZCBidXQgbm90IGlvbW11X2Z3c3BlYy5oLiAKSW4gZ2VuZXJhbCwgSSB3b3VsZCBw
cmVmZXIgaWYgaGVhZGVycyBhcmUgb25seSBpbmNsdWRlZCB3aGVuIHN0cmljdGx5IApuZWNlc3Nh
cnkuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
