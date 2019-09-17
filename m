Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDC5B4ACB
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 11:39:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iA9uE-0003OS-RG; Tue, 17 Sep 2019 09:36:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DkBD=XM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iA9uD-0003ON-MW
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 09:36:17 +0000
X-Inumbo-ID: 98e6304e-d92e-11e9-a337-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 98e6304e-d92e-11e9-a337-bc764e2007e4;
 Tue, 17 Sep 2019 09:36:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA3ED28;
 Tue, 17 Sep 2019 02:36:16 -0700 (PDT)
Received: from [10.37.13.58] (unknown [10.37.13.58])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EEAF23F59C;
 Tue, 17 Sep 2019 02:36:13 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul.durrant@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20190913105826.2704-1-paul.durrant@citrix.com>
 <20190913105826.2704-4-paul.durrant@citrix.com>
 <e79beeb5-7288-c8fd-8823-feaf8d4e7e77@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <804817fd-07b7-de89-ff34-524bd9b3a245@arm.com>
Date: Tue, 17 Sep 2019 10:36:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e79beeb5-7288-c8fd-8823-feaf8d4e7e77@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v11.1 3/6] sysctl / libxl: report whether
 IOMMU/HAP page table sharing is supported
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 David Scott <dave@recoil.org>, Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gOS8xMy8xOSAxMjoxMCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhpcyBw
YXRjaCBkZWZpbmVzIGEgbmV3IGJpdCByZXBvcnRlZCBpbiB0aGUgaHdfY2FwIGZpZWxkIG9mIHN0
cnVjdAo+IHhlbl9zeXNjdGxfcGh5c2luZm8gdG8gaW5kaWNhdGUgd2hldGhlciB0aGUgcGxhdGZv
cm0gc3VwcG9ydHMgc2hhcmluZyBvZgo+IEhBUCBwYWdlIHRhYmxlcyAoaS5lLiB0aGUgUDJNKSB3
aXRoIHRoZSBJT01NVS4gVGhpcyBpbmZvcm1zIHRoZSB0b29sc3RhY2sKPiB3aGV0aGVyIHRoZSBk
b21haW4gbmVlZHMgZXh0cmEgbWVtb3J5IHRvIHN0b3JlIGRpc2NyZXRlIElPTU1VIHBhZ2UgdGFi
bGVzCj4gb3Igbm90Lgo+IAo+IE5PVEU6IFRoaXMgcGF0Y2ggbWFrZXMgc3VyZSBpb21tdV9oYXBf
cHRfc2hhcmVkIGlzIGNsZWFyIGlmIEhBUCBpcyBub3QKPiAgICAgICAgc3VwcG9ydGVkIG9yIHRo
ZSBJT01NVSBpcyBkaXNhYmxlZCwgYW5kIGRlZmluZXMgaXQgdG8gZmFsc2UgaWYKPiAgICAgICAg
IUNPTkZJR19IVk0uCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJh
bnRAY2l0cml4LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+Cj4gQWNrZWQtYnk6IENocmlzdGlhbiBMaW5kaWcgPGNocmlzdGlhbi5saW5kaWdAY2l0
cml4LmNvbT4KCkZvciB0aGUgY29tbW9uIGNvZGU6CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
