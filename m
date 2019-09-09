Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F491ADB53
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 16:38:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7KmW-0002FQ-EB; Mon, 09 Sep 2019 14:36:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fSZh=XE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i7KmU-0002FC-N4
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 14:36:38 +0000
X-Inumbo-ID: 3aa7704e-d30f-11e9-ac0d-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 3aa7704e-d30f-11e9-ac0d-12813bfff9fa;
 Mon, 09 Sep 2019 14:36:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 194C4169E;
 Mon,  9 Sep 2019 07:36:37 -0700 (PDT)
Received: from [10.37.12.117] (unknown [10.37.12.117])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D47C53F59C;
 Mon,  9 Sep 2019 07:36:35 -0700 (PDT)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1566324587-3442-1-git-send-email-olekstysh@gmail.com>
 <1566324587-3442-6-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <b1c70055-51a1-51fd-9c9f-4e545d1faed2@arm.com>
Date: Mon, 9 Sep 2019 15:36:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566324587-3442-6-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V3 5/8] iommu/arm: Add lightweight
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
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgT2xla3NhbmRyLAoKT24gOC8yMC8xOSA3OjA5IFBNLCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3
cm90ZToKPiBGcm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29A
ZXBhbS5jb20+Cj4gCj4gV2UgbmVlZCB0byBoYXZlIHNvbWUgYWJzdHJhY3Qgd2F5IHRvIGFkZCBu
ZXcgZGV2aWNlIHRvIHRoZSBJT01NVQo+IGJhc2VkIG9uIHRoZSBnZW5lcmljIElPTU1VIERUIGJp
bmRpbmdzIFsxXSB3aGljaCBjYW4gYmUgdXNlZCBmb3IKPiBib3RoIERUIChyaWdodCBub3cpIGFu
ZCBBQ1BJIChpbiBmdXR1cmUpLgo+IAo+IEZvciB0aGF0IHJlYXNvbiB3ZSBjYW4gYm9ycm93IHRo
ZSBpZGVhIHVzZWQgaW4gTGludXggdGhlc2UgZGF5cwo+IGNhbGxlZCAiaW9tbXVfZndzcGVjIi4g
SGF2aW5nIHRoaXMgaW4sIGl0IHdpbGwgYmUgcG9zc2libGUKPiB0byBjb25maWd1cmUgSU9NTVUg
bWFzdGVyIGludGVyZmFjZXMgb2YgdGhlIGRldmljZSAoZGV2aWNlIElEcykKPiBmcm9tIGEgc2lu
Z2xlIGNvbW1vbiBwbGFjZSBhbmQgYXZvaWQga2VlcGluZyBhbG1vc3QgaWRlbnRpY2FsIGxvb2st
dXAKPiBpbXBsZW1lbnRhdGlvbnMgaW4gZWFjaCBJT01NVSBkcml2ZXIuCj4gCj4gVGhlcmUgaXMg
bm8gbmVlZCB0byBwb3J0IHRoZSB3aG9sZSBpbXBsZW1lbnRhdGlvbiBvZiAiaW9tbXVfZndzcGVj
Igo+IHRvIFhlbiwgd2UgY291bGQsIHByb2JhYmx5LCBlbmQgdXAgd2l0aCBhIG11Y2ggc2ltcGxl
ciBzb2x1dGlvbiwKPiBzb21lICJzdHJpcHBlZCBkb3duIiB2ZXJzaW9uIHdoaWNoIGZpdHMgb3Vy
IHJlcXVpcmVtZW50cy4KPiAKPiBTbywgdGhpcyBwYXRjaCBhZGRzIHRoZSBmb2xsb3dpbmc6Cj4g
MS4gQSBjb21tb24gc3RydWN0dXJlICJpb21tdV9md3NwZWMiIHRvIGhvbGQgdGhlIHRoZSBwZXIt
ZGV2aWNlCj4gICAgIGZpcm13YXJlIGRhdGEKPiAyLiBOZXcgbWVtYmVyICJpb21tdV9md3NwZWMi
IG9mIHN0cnVjdCBkZXZpY2UKPiAzLiBGdW5jdGlvbnMvaGVscGVycyB0byBkZWFsIHdpdGggImRl
di0+aW9tbXVfZndzcGVjIgo+IAo+IEl0IHNob3VsZCBiZSBub3RlZCB0aGF0IGluIGNvbXBhcmlu
ZyB3aXRoIG9yaWdpbmFsICJpb21tdV9md3NwZWMiCgpzL2NvbXBhcmluZyB3aXRoL2NvbXBhcmlz
b24gb2YvCnMvb3JpZ2luYWwvdGhlIExpbnV4LyBvciAidGhlIG9yaWdpbmFsIi4KCj4gWGVuJ3Mg
dmFyaWFudCBkb2Vzbid0IGNvbnRhaW4gc29tZSBmaWVsZHMsIHdoaWNoIGFyZSBub3QgcmVhbGx5
Cj4gbmVlZGVkIGF0IHRoZSBtb21lbnQgKG9wcywgZmxhZykgYW5kICJpb21tdV9md25vZGUiIGZp
ZWxkIHdhcyByZXBsYWNlZAo+IGJ5ICJpb21tdV9kZXYiIHRvIGF2b2lkIHBvcnRpbmcgYSBsb3Qg
b2YgY29kZSAodG8gc3VwcG9ydCAiZndub2RlX2hhbmRsZSIpCj4gd2l0aCBsaXR0bGUgYmVuZWZp
dC4KCgpJdCB3b3VsZCBiZSBnb29kIHRvIG1lbnRpb24gd2hpY2ggdmVyc2lvbiBvZiBMaW51eCB0
aGlzIGlzIGJhc2VkIG9uLiBTbyAKaWYgdGhlcmUgaXMgYSBjcml0aWNhbCBidWcgaW4gTGludXgg
d2UgY2FuIHBvcnQgaXQuCgpUaGUgcmVzdCBvZiB0aGUgcGF0Y2ggbG9va3MgZ29vZCB0byBtZS4K
CkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
