Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F6C5672D
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 12:51:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg5UY-0000ww-4B; Wed, 26 Jun 2019 10:49:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cvzu=UZ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hg5UW-0000wr-Ah
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 10:49:28 +0000
X-Inumbo-ID: 11273673-9800-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 11273673-9800-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 10:49:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C299360;
 Wed, 26 Jun 2019 03:49:26 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C2AD93F718;
 Wed, 26 Jun 2019 03:49:25 -0700 (PDT)
To: xen-devel@lists.xenproject.org
References: <20190603160829.31912-1-julien.grall@arm.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <684b33dc-26e6-3da0-a3f3-843fa3630385@arm.com>
Date: Wed, 26 Jun 2019 11:49:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190603160829.31912-1-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/public: arch-arm: Use xen_mk_ullong
 instead of suffixing value with ULL
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
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org,
 Andrii_Anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpHZW50bGUgcGluZy4KCkNoZWVycywKCk9uIDAzLzA2LzIwMTkgMTc6MDgsIEp1bGllbiBH
cmFsbCB3cm90ZToKPiBUaGVyZSBhcmUgYSBmZXcgcGxhY2VzIGluIGluY2x1ZGUvcHVibGljL2Fy
Y2gtYXJtLmggdGhhdCBhcmUgc3RpbGwKPiBzdWZmaXhpbmcgaW1tZWRpYXRlIHdpdGggVUxMIGlu
c3RlYWQgb2YgdXNpbmcgeGVuX21rX3VsbG9uZy4KPiAKPiBUaGUgbGF0dGVyIGFsbG93cyBhIGNv
bnN1bWVyIHRvIGVhc2lseSB0d2VhayB0aGUgaGVhZGVyIGlmIFVMTCBpcyBub3QKPiBzdXBwb3J0
ZWQuCj4gCj4gU28gc3dpdGNoIHRoZSByZW1haW5pbmcgdXNlcnMgb2YgVUxMIHRvIHhlbl9ta191
bGxvbmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJt
LmNvbT4KPiAtLS0KPiAgIHhlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oIHwgOCArKysrLS0t
LQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL2FyY2gtYXJtLmggYi94ZW4vaW5jbHVk
ZS9wdWJsaWMvYXJjaC1hcm0uaAo+IGluZGV4IGViNDI0ZTgyODYuLmY1NTAxMzcwODkgMTAwNjQ0
Cj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2FyY2gtYXJtLmgKPiArKysgYi94ZW4vaW5jbHVk
ZS9wdWJsaWMvYXJjaC1hcm0uaAo+IEBAIC00MDcsMTIgKzQwNywxMiBAQCB0eXBlZGVmIHVpbnQ2
NF90IHhlbl9jYWxsYmFja190Owo+ICAgI2RlZmluZSBHVUVTVF9HSUNWM19HSUNSMF9TSVpFICAg
ICB4ZW5fbWtfdWxsb25nKDB4MDEwMDAwMDApCj4gICAKPiAgIC8qIEFDUEkgdGFibGVzIHBoeXNp
Y2FsIGFkZHJlc3MgKi8KPiAtI2RlZmluZSBHVUVTVF9BQ1BJX0JBU0UgMHgyMDAwMDAwMFVMTAo+
IC0jZGVmaW5lIEdVRVNUX0FDUElfU0laRSAweDAyMDAwMDAwVUxMCj4gKyNkZWZpbmUgR1VFU1Rf
QUNQSV9CQVNFIHhlbl9ta191bGxvbmcoMHgyMDAwMDAwMCkKPiArI2RlZmluZSBHVUVTVF9BQ1BJ
X1NJWkUgeGVuX21rX3VsbG9uZygweDAyMDAwMDAwKQo+ICAgCj4gICAvKiBQTDAxMSBtYXBwaW5n
cyAqLwo+IC0jZGVmaW5lIEdVRVNUX1BMMDExX0JBU0UgICAgMHgyMjAwMDAwMFVMTAo+IC0jZGVm
aW5lIEdVRVNUX1BMMDExX1NJWkUgICAgMHgwMDAwMTAwMFVMTAo+ICsjZGVmaW5lIEdVRVNUX1BM
MDExX0JBU0UgICAgeGVuX21rX3VsbG9uZygweDIyMDAwMDAwKQo+ICsjZGVmaW5lIEdVRVNUX1BM
MDExX1NJWkUgICAgeGVuX21rX3VsbG9uZygweDAwMDAxMDAwKQo+ICAgCj4gICAvKgo+ICAgICog
MTZNQiA9PSA0MDk2IHBhZ2VzIHJlc2VydmVkIGZvciBndWVzdCB0byB1c2UgYXMgYSByZWdpb24g
dG8gbWFwIGl0cwo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
