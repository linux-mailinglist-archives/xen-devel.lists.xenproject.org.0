Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED6EB473B
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 08:15:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iA6ie-0000Vs-Cq; Tue, 17 Sep 2019 06:12:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+VJ/=XM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iA6id-0000Vg-9u
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 06:12:07 +0000
X-Inumbo-ID: 12b8379a-d912-11e9-9601-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 12b8379a-d912-11e9-9601-12813bfff9fa;
 Tue, 17 Sep 2019 06:12:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6A148B61B;
 Tue, 17 Sep 2019 06:12:05 +0000 (UTC)
To: Oleksandr <olekstysh@gmail.com>
References: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
 <1568388917-7287-7-git-send-email-olekstysh@gmail.com>
 <0cdbf4a2-a769-f62c-a547-5c7ad87f0fc3@suse.com>
 <12f7d629-59c9-5922-0217-02c9d610bc28@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f10cc304-96f8-f942-0ef2-0a9d4544f288@suse.com>
Date: Tue, 17 Sep 2019 08:12:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <12f7d629-59c9-5922-0217-02c9d610bc28@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 6/8] iommu/arm: Add lightweight
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDkuMjAxOSAyMDowOCwgT2xla3NhbmRyIHdyb3RlOgo+IE9uIDE2LjA5LjE5IDEzOjQw
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+ICsvKiBwZXItZGV2aWNlIElPTU1VIGluc3RhbmNlIGRh
dGEgKi8KPj4+ICtzdHJ1Y3QgaW9tbXVfZndzcGVjIHsKPj4+ICsgICAgLyogdGhpcyBkZXZpY2Un
cyBJT01NVSAqLwo+Pj4gKyAgICBzdHJ1Y3QgZGV2aWNlICppb21tdV9kZXY7Cj4+PiArICAgIC8q
IElPTU1VIGRyaXZlciBwcml2YXRlIGRhdGEgZm9yIHRoaXMgZGV2aWNlICovCj4+PiArICAgIHZv
aWQgKmlvbW11X3ByaXY7Cj4+PiArICAgIC8qIG51bWJlciBvZiBhc3NvY2lhdGVkIGRldmljZSBJ
RHMgKi8KPj4+ICsgICAgdW5zaWduZWQgaW50IG51bV9pZHM7Cj4+PiArICAgIC8qIElEcyB3aGlj
aCB0aGlzIGRldmljZSBtYXkgcHJlc2VudCB0byB0aGUgSU9NTVUgKi8KPj4+ICsgICAgdWludDMy
X3QgaWRzWzFdOwo+Pj4gK307Cj4+IE5vdGUgdGhhdCB5b3UgYWJ1c2UgeHJlYWxsb2NfZmxleF9z
dHJ1Y3QoKSB3aGVuIHVzaW5nIGl0IHdpdGggc3VjaAo+PiBhIHR5cGU6IFRoZSBsYXN0IGZpZWxk
IGlzIF9ub3RfIGEgZmxleGlibGUgYXJyYXkgbWVtYmVyLiBDb21waWxlcnMKPj4gbWlnaHQgbGVn
aXRpbWF0ZWx5IHdhcm4gaWYgdGhleSBjYW4gcHJvdmUgdGhhdCB5b3UgYWNjZXNzCj4+IHAtPmlk
c1sxXSBhbnl3aGVyZSwgZGVzcGl0ZSB5b3UgKHByZXN1bWFibHkpIGhhdmluZyBhbGxvY2F0ZWQg
ZW5vdWdoCj4+IHNwYWNlLiAoSSBoYXZlbid0IGJlZW4gYWJsZSB0byB0aGluayBvZiBhIHdheSBm
b3IgdGhlIG1hY3JvIHRvCj4+IGFjdHVhbGx5IGRldGVjdCBhbmQgaGVuY2UgcmVmdXNlIHN1Y2gg
d3JvbmcgdXNlcy4pCj4gCj4gSW5kZWVkLCB5b3UgYXJlIHJpZ2h0LiBJIGFtIGluIGRvdWJ0LCB3
aGV0aGVyIHRvIHJldGFpbiBwb3J0ZWQgZnJvbSAKPiBMaW51eCBjb2RlIChpZHNbMV0pCj4gCj4g
YW5kIG1lbnRpb24gYWJvdXQgc3VjaCBhYnVzZSBvciBjaGFuZ2UgaXQgdG8gZGVhbCB3aXRoIHJl
YWwgZmxleGlibGUgCj4gYXJyYXkgbWVtYmVyIChpZHNbXSkuIEFueSB0aG91Z2h0cz8KCkknbSBv
ZiB0aGUgc3Ryb25nIG9waW5pb24gdGhhdCB5b3Ugc2hvdWxkIHN3aXRjaCB0byBbXSAob3IgYXQK
bGVhc3QgWzBdKSBub3RhdGlvbi4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
