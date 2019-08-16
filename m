Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E1790B28
	for <lists+xen-devel@lfdr.de>; Sat, 17 Aug 2019 00:43:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hykts-0005aK-8S; Fri, 16 Aug 2019 22:40:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=n1LD=WM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hyktr-0005aF-D4
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 22:40:47 +0000
X-Inumbo-ID: e3323b32-c076-11e9-8bbb-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e3323b32-c076-11e9-8bbb-12813bfff9fa;
 Fri, 16 Aug 2019 22:40:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 028F6344;
 Fri, 16 Aug 2019 15:40:46 -0700 (PDT)
Received: from [10.37.12.84] (unknown [10.37.12.84])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A8B533F718;
 Fri, 16 Aug 2019 15:40:44 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
References: <20190816130013.31154-1-hch@lst.de>
 <20190816130013.31154-8-hch@lst.de>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <9a3261c6-5d92-cf6b-1ae8-3a8e8b5ef0d4@arm.com>
Date: Fri, 16 Aug 2019 23:40:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190816130013.31154-8-hch@lst.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 07/11] swiotlb-xen: provide a single
 page-coherent.h header
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
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA4LzE2LzE5IDI6MDAgUE0sIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+IE1lcmdl
IHRoZSB2YXJpb3VzIHBhZ2UtY29oZXJlbnQuaCBmaWxlcyBpbnRvIGEgc2luZ2xlIG9uZSB0aGF0
IGVpdGhlcgo+IHByb3ZpZGVzIHByb3RvdHlwZXMgb3Igc3R1YnMgZGVwZW5kaW5nIG9uIHRoZSBu
ZWVkIGZvciBjYWNoZQo+IG1haW50YWluYW5jZS4KPiAKPiBGb3IgZXh0cmEgYmVuZWZpdHMgYWxv
IGluY2x1ZGUgPHhlbi9wYWdlLWNvaGVyZW50Lmg+IGluIHRoZSBmaWxlCj4gYWN0dWFsbHkgaW1w
bGVtZW50aW5nIHRoZSBpbnRlcmZhY2VzIHByb3ZpZGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENo
cmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IC0tLQo+ICAgYXJjaC9hcm0vaW5jbHVkZS9h
c20veGVuL3BhZ2UtY29oZXJlbnQuaCAgIHwgIDIgLS0KPiAgIGFyY2gvYXJtL3hlbi9tbS5jICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20v
eGVuL3BhZ2UtY29oZXJlbnQuaCB8ICAyIC0tCj4gICBhcmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4v
cGFnZS1jb2hlcmVudC5oICAgfCAyMiAtLS0tLS0tLS0tLS0tLS0tLS0KPiAgIGRyaXZlcnMveGVu
L3N3aW90bGIteGVuLmMgICAgICAgICAgICAgICAgICB8ICA0ICstLS0KPiAgIGluY2x1ZGUvS2J1
aWxkICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gICBpbmNsdWRlL3hlbi97
YXJtID0+IH0vcGFnZS1jb2hlcmVudC5oICAgICAgfCAyNyArKysrKysrKysrKysrKysrKysrLS0t
CgpJIGFtIG5vdCBzdXJlIEkgYWdyZWUgd2l0aCB0aGlzIHJlbmFtZS4gVGhlIGltcGxlbWVudGF0
aW9uIG9mIHRoZSAKaGVscGVycyBhcmUgdmVyeSBBcm0gc3BlY2lmaWMgYXMgdGhpcyBpcyBhc3N1
bWluZyBEb20wIGlzIDE6MSBtYXBwZWQuCgpUaGlzIHdhcyBuZWNlc3NhcnkgZHVlIHRvIHRoZSBs
YWNrIG9mIElPTU1VIG9uIEFybSBwbGF0Zm9ybXMgYmFjayB0aGVuLgpCdXQgdGhpcyBpcyBub3cg
YSBwYWluIHRvIGdldCByaWQgb2YgaXQgb24gbmV3ZXIgcGxhdGZvcm0uLi4KCkNoZWVycywKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
