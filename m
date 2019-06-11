Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0683CF07
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 16:40:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hahta-0000qt-Eo; Tue, 11 Jun 2019 14:37:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SowN=UK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hahtY-0000qo-HM
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 14:37:04 +0000
X-Inumbo-ID: 611444f7-8c56-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 611444f7-8c56-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 14:37:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BB4E337;
 Tue, 11 Jun 2019 07:37:03 -0700 (PDT)
Received: from [10.1.39.71] (unknown [10.1.39.71])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4858C3F557;
 Tue, 11 Jun 2019 07:37:02 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
References: <1559217748-25426-1-git-send-email-andrii.anisov@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <98f2248a-1053-5c41-0242-6707fa2d1a7d@arm.com>
Date: Tue, 11 Jun 2019 15:37:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1559217748-25426-1-git-send-email-andrii.anisov@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] iommu/arm: add missing return
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmlpLAoKU29ycnkgZm9yIHRoZSBsYXRlIGFuc3dlci4KCk9uIDUvMzAvMTkgMTowMiBQ
TSwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBGcm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xl
a3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+Cj4gCj4gSW4gY2FzZSBpb21tdV9vcHMgaGF2ZSBi
ZWVuIGFscmVhZHkgc2V0LCB3ZSBzaG91bGQgbm90IHVwZGF0ZSBpdC4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4K
CkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKQ2hlZXJzLAoK
PiAtLS0KPiAKPiBUaGlzIHBhdGNoIGlzIGV4dHJhY3RlZCBmcm9tIFsxXSwgYXMgYWdyZWVkIGhl
cmUgWzJdLgo+IAo+IFsxXSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0
bWwveGVuLWRldmVsLzIwMTktMDEvbXNnMDE2NTguaHRtbAo+IFsyXSBodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDEvbXNnMDE4NTkuaHRt
bAo+IAo+IC0tLQo+ICAgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lvbW11LmMgfCAzICsr
Kwo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaW9tbXUuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL2FybS9pb21tdS5jCj4gaW5kZXggMzI1OTk3Yi4uMjEzNTIzMyAxMDA2NDQKPiAtLS0gYS94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaW9tbXUuYwo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL2FybS9pb21tdS5jCj4gQEAgLTMyLDcgKzMyLDEwIEBAIHZvaWQgX19pbml0IGlv
bW11X3NldF9vcHMoY29uc3Qgc3RydWN0IGlvbW11X29wcyAqb3BzKQo+ICAgICAgIEJVR19PTihv
cHMgPT0gTlVMTCk7Cj4gICAKPiAgICAgICBpZiAoIGlvbW11X29wcyAmJiBpb21tdV9vcHMgIT0g
b3BzICkKPiArICAgIHsKPiAgICAgICAgICAgcHJpbnRrKCJXQVJOSU5HOiBDYW5ub3Qgc2V0IElP
TU1VIG9wcywgYWxyZWFkeSBzZXQgdG8gYSBkaWZmZXJlbnQgdmFsdWVcbiIpOwo+ICsgICAgICAg
IHJldHVybjsKPiArICAgIH0KPiAgIAo+ICAgICAgIGlvbW11X29wcyA9IG9wczsKPiAgIH0KPiAK
Ci0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
