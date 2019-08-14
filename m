Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FBE8DC14
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 19:41:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxxE1-000480-U2; Wed, 14 Aug 2019 17:38:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gPVK=WK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxxE0-00047u-La
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 17:38:16 +0000
X-Inumbo-ID: 4a66879a-beba-11e9-8b94-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 4a66879a-beba-11e9-8b94-12813bfff9fa;
 Wed, 14 Aug 2019 17:38:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3096D344;
 Wed, 14 Aug 2019 10:38:13 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F0EB3F694;
 Wed, 14 Aug 2019 10:38:12 -0700 (PDT)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <1564763985-20312-7-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <42515b0f-f0a2-186c-c5ad-fed02040311d@arm.com>
Date: Wed, 14 Aug 2019 18:38:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564763985-20312-7-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2 6/6] iommu/arm: Add Renesas IPMMU-VMSA
 support
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
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgT2xla3NhbmRyLAoKT24gMDIvMDgvMjAxOSAxNzozOSwgT2xla3NhbmRyIFR5c2hjaGVua28g
d3JvdGU6Cj4gK3N0YXRpYyBpbnQgaXBtbXVfaW9tbXVfZG9tYWluX2luaXQoc3RydWN0IGRvbWFp
biAqZCkKPiArewo+ICsgICAgc3RydWN0IGlwbW11X3Ztc2FfeGVuX2RvbWFpbiAqeGVuX2RvbWFp
bjsKPiArCj4gKyAgICB4ZW5fZG9tYWluID0geHphbGxvYyhzdHJ1Y3QgaXBtbXVfdm1zYV94ZW5f
ZG9tYWluKTsKPiArICAgIGlmICggIXhlbl9kb21haW4gKQo+ICsgICAgICAgIHJldHVybiAtRU5P
TUVNOwo+ICsKPiArICAgIHNwaW5fbG9ja19pbml0KCZ4ZW5fZG9tYWluLT5sb2NrKTsKPiArICAg
IElOSVRfTElTVF9IRUFEKCZ4ZW5fZG9tYWluLT5jYWNoZV9kb21haW5zKTsKPiArICAgIC8qCj4g
KyAgICAgKiBXZSBkb24ndCBjcmVhdGUgUm9vdCBJUE1NVSBkb21haW4gaGVyZSwgaXQgd2lsbCBi
ZSBjcmVhdGVkIG9uIGRlbWFuZAo+ICsgICAgICogb25seSwgd2hlbiBhdHRhY2hpbmcgdGhlIGZp
cnN0IG1hc3RlciBkZXZpY2UgdG8gdGhpcyBYZW4gZG9tYWluIGluCj4gKyAgICAgKiBpcG1tdV9h
c3NpZ25fZGV2aWNlKCkuCj4gKyAgICAgKiB4ZW5fZG9tYWluLT5yb290X2RvbWFpbiA9IE5VTEw7
Cj4gKyAgICAqLwo+ICsKPiArICAgIGRvbV9pb21tdShkKS0+YXJjaC5wcml2ID0geGVuX2RvbWFp
bjsKCldoaWxlIGxvb2tpbmcgYXQgb3RoZXIgcGFydCBvZiBYZW4gSSByZWFsaXplZCB5b3UgZG9u
J3Qgc2V0IApJT01NVV9GRUFUX0NPSEVSRU5UX1dBTEsuIERvZXMgaXQgbWVhbiB0aGUgSU9NTVUg
d2Fsa2VyIGRvZXMgbm90IHN1cHBvcnQgCmNvaGVyZW50IHdhbGsgKGkuZSBzbm9vcGluZyB0aGUg
Y2FjaGUpPwoKTm90ZSB0aGF0IHdoZW4gdGhpcyBmZWF0dXJlIGlzIG5vdCBzZXQsIHRoZSBwMm0g
Y29kZSB3aWxsIHJlcXVpcmUgdG8gY2xlYW4gZWFjaCAKUDJNIGVudHJ5IHdoZW4gdXBkYXRlZC4g
U28gaWYgdGhlIElQTU1VIHN1cHBvcnRzIGNvaGVyZW50IHdhbGssIEkgd291bGQgc3Ryb25nbHkg
CnN1Z2dlc3QgdG8gc2V0IHRoZSBmbGFnIDopLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
