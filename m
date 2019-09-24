Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4657BCBC1
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 17:45:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCmxZ-0001It-RJ; Tue, 24 Sep 2019 15:42:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IFsf=XT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iCmxY-0001Io-DJ
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 15:42:36 +0000
X-Inumbo-ID: ee13d978-dee1-11e9-8628-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id ee13d978-dee1-11e9-8628-bc764e2007e4;
 Tue, 24 Sep 2019 15:42:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54001142F;
 Tue, 24 Sep 2019 08:42:35 -0700 (PDT)
Received: from [10.1.39.57] (unknown [10.1.39.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C3CA3F59C;
 Tue, 24 Sep 2019 08:42:34 -0700 (PDT)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1569339027-19484-1-git-send-email-olekstysh@gmail.com>
 <1569339027-19484-6-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <5d1d56bb-3465-4f25-525d-22d628f823d3@arm.com>
Date: Tue, 24 Sep 2019 16:42:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1569339027-19484-6-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V5 5/8] iommu/arm: Add lightweight
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
 sstabellini@kernel.org, volodymyr_babchuk@epam.com,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgT2xla3NhbmRyLAoKT24gOS8yNC8xOSA0OjMwIFBNLCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3
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
di0+aW9tbXVfZndzcGVjIgo+IAo+IEl0IHNob3VsZCBiZSBub3RlZCB0aGF0IGluIGNvbXBhcmlz
b24gb2YgdGhlIG9yaWdpbmFsICJpb21tdV9md3NwZWMiCj4gWGVuJ3MgdmFyaWFudCBkb2Vzbid0
IGNvbnRhaW4gc29tZSBmaWVsZHMsIHdoaWNoIGFyZSBub3QgcmVhbGx5Cj4gbmVlZGVkIGF0IHRo
ZSBtb21lbnQgKG9wcywgZmxhZykgYW5kICJpb21tdV9md25vZGUiIGZpZWxkIHdhcyByZXBsYWNl
ZAo+IGJ5ICJpb21tdV9kZXYiIHRvIGF2b2lkIHBvcnRpbmcgYSBsb3Qgb2YgY29kZSAodG8gc3Vw
cG9ydCAiZndub2RlX2hhbmRsZSIpCj4gd2l0aCBsaXR0bGUgYmVuZWZpdC4KPiAKPiBUaGUgImlv
bW11X2Z3c3BlYyIgc3VwcG9ydCBpcyBiYXNlZCBvbiB0aGUgTGludXgncyBjb21taXQ6Cj4gZjc0
YzJiYjk4Nzc2ZTJkZTUwOGY0ZDYwN2NkNTE5ODczMDY1MTE4ZSAiTGludXggNS4zLXJjOCIKPiAK
PiBTdWJzZXF1ZW50IHBhdGNoZXMgd2lsbCB1c2Ugb2YgdGhhdCBzdXBwb3J0Lgo+IAo+IFsxXSBo
dHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvaW9tbXUvaW9tbXUudHh0Cj4gCj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIFR5c2hjaGVu
a28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgoKQWNrZWQtYnk6IEp1bGllbiBHcmFs
bCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
