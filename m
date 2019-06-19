Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BA24B6C7
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 13:11:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdYSU-0002xs-LJ; Wed, 19 Jun 2019 11:08:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hb7b=US=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hdYST-0002xn-CI
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 11:08:53 +0000
X-Inumbo-ID: 9e84689a-9282-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 9e84689a-9282-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 11:08:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54495360;
 Wed, 19 Jun 2019 04:08:51 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 627753F738;
 Wed, 19 Jun 2019 04:10:36 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190611184541.7281-1-volodymyr_babchuk@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e6340e20-f2f3-7604-e2be-2b2dac2d30a4@arm.com>
Date: Wed, 19 Jun 2019 12:08:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190611184541.7281-1-volodymyr_babchuk@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 00/10] TEE mediator (and OP-TEE) support
 in XEN
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gVm9sb2R5bXlyLAoKT24gMTEvMDYvMjAxOSAxOTo0NiwgVm9sb2R5bXlyIEJhYmNodWsg
d3JvdGU6Cj4gVm9sb2R5bXlyIEJhYmNodWsgKDEwKToKPiAgICB4ZW4vYXJtOiBhZGQgZ2VuZXJp
YyBURUUgbWVkaWF0b3IgZnJhbWV3b3JrCj4gICAgeGVuL2FybTogb3B0ZWU6IGFkZCBPUC1URUUg
aGVhZGVyIGZpbGVzCj4gICAgeGVuL2FybTogb3B0ZWU6IGFkZCBPUC1URUUgbWVkaWF0b3Igc2tl
bGV0b24KPiAgICB4ZW4vYXJtOiBvcHRlZTogYWRkIGZhc3QgY2FsbHMgaGFuZGxpbmcKPiAgICB4
ZW4vYXJtOiBvcHRlZTogYWRkIHN0ZCBjYWxsIGhhbmRsaW5nCj4gICAgeGVuL2FybTogb3B0ZWU6
IGFkZCBzdXBwb3J0IGZvciBSUEMgU0hNIGJ1ZmZlcnMKPiAgICB4ZW4vYXJtOiBvcHRlZTogYWRk
IHN1cHBvcnQgZm9yIGFyYml0cmFyeSBzaGFyZWQgbWVtb3J5Cj4gICAgeGVuL2FybTogb3B0ZWU6
IGFkZCBzdXBwb3J0IGZvciBSUEMgY29tbWFuZHMKCkkgaGF2ZSBjb21taXR0ZWQgdGhlIGZpcnN0
IDggcGF0Y2hlcy4KCj4gICAgdG9vbHMvYXJtOiB0ZWU6IGFkZCAidGVlIiBvcHRpb24gZm9yIHhs
LmNmZwo+ICAgIHRvb2xzL2FybTogb3B0ZWU6IGNyZWF0ZSBvcHRlZSBmaXJtd2FyZSBub2RlIGlu
IERUIGlmIHRlZT1vcHRlZQoKUGxlYXNlIHJlc2VuZCB0aGUgbGFzdCB0d28gcGF0Y2hlcyB3aXRo
IHRoZSBjb21tZW50cyBhZGRyZXNzZWQgYW5kIGZvbGxvdy11cCBvbiAKdGhlIG90aGVycyBjb3Vw
bGUgb2YgaW1wcm92ZW1lbnRzIChkb2NzIGFuZCBjb2RlKSBJIHN1Z2dlc3RlZC4KCkNoZWVycywK
Cj4gCj4gICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICA2ICsK
PiAgIGRvY3MvbWFuL3hsLmNmZy41LnBvZC5pbiAgICAgICAgICAgICAgICB8ICAgMjEgKwo+ICAg
dG9vbHMvbGlieGwvbGlieGwuaCAgICAgICAgICAgICAgICAgICAgIHwgICAgNSArCj4gICB0b29s
cy9saWJ4bC9saWJ4bF9hcm0uYyAgICAgICAgICAgICAgICAgfCAgIDQyICsKPiAgIHRvb2xzL2xp
YnhsL2xpYnhsX3R5cGVzLmlkbCAgICAgICAgICAgICB8ICAgIDYgKwo+ICAgdG9vbHMveGwveGxf
cGFyc2UuYyAgICAgICAgICAgICAgICAgICAgIHwgICAgOSArCj4gICB4ZW4vYXJjaC9hcm0vS2Nv
bmZpZyAgICAgICAgICAgICAgICAgICAgfCAgICA5ICsKPiAgIHhlbi9hcmNoL2FybS9NYWtlZmls
ZSAgICAgICAgICAgICAgICAgICB8ICAgIDEgKwo+ICAgeGVuL2FyY2gvYXJtL2RvbWFpbi5jICAg
ICAgICAgICAgICAgICAgIHwgICAxOSArCj4gICB4ZW4vYXJjaC9hcm0vc2V0dXAuYyAgICAgICAg
ICAgICAgICAgICAgfCAgICAyICsKPiAgIHhlbi9hcmNoL2FybS90ZWUvS2NvbmZpZyAgICAgICAg
ICAgICAgICB8ICAgIDQgKwo+ICAgeGVuL2FyY2gvYXJtL3RlZS9NYWtlZmlsZSAgICAgICAgICAg
ICAgIHwgICAgMiArCj4gICB4ZW4vYXJjaC9hcm0vdGVlL29wdGVlLmMgICAgICAgICAgICAgICAg
fCAxNTQwICsrKysrKysrKysrKysrKysrKysrKysrCj4gICB4ZW4vYXJjaC9hcm0vdGVlL3RlZS5j
ICAgICAgICAgICAgICAgICAgfCAgIDk4ICsrCj4gICB4ZW4vYXJjaC9hcm0vdnNtYy5jICAgICAg
ICAgICAgICAgICAgICAgfCAgICA1ICsKPiAgIHhlbi9hcmNoL2FybS94ZW4ubGRzLlMgICAgICAg
ICAgICAgICAgICB8ICAgIDcgKwo+ICAgeGVuL2luY2x1ZGUvYXNtLWFybS9kb21haW4uaCAgICAg
ICAgICAgIHwgICAgNCArCj4gICB4ZW4vaW5jbHVkZS9hc20tYXJtL3RlZS9vcHRlZV9tc2cuaCAg
ICAgfCAgMzEwICsrKysrCj4gICB4ZW4vaW5jbHVkZS9hc20tYXJtL3RlZS9vcHRlZV9ycGNfY21k
LmggfCAgMzE4ICsrKysrCj4gICB4ZW4vaW5jbHVkZS9hc20tYXJtL3RlZS9vcHRlZV9zbWMuaCAg
ICAgfCAgNTY0ICsrKysrKysrKwo+ICAgeGVuL2luY2x1ZGUvYXNtLWFybS90ZWUvdGVlLmggICAg
ICAgICAgIHwgIDExMiArKwo+ICAgeGVuL2luY2x1ZGUvcHVibGljL2FyY2gtYXJtLmggICAgICAg
ICAgIHwgICAgNiArCj4gICAyMiBmaWxlcyBjaGFuZ2VkLCAzMDkwIGluc2VydGlvbnMoKykKPiAg
IGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC9hcm0vdGVlL0tjb25maWcKPiAgIGNyZWF0ZSBt
b2RlIDEwMDY0NCB4ZW4vYXJjaC9hcm0vdGVlL01ha2VmaWxlCj4gICBjcmVhdGUgbW9kZSAxMDA2
NDQgeGVuL2FyY2gvYXJtL3RlZS9vcHRlZS5jCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2Fy
Y2gvYXJtL3RlZS90ZWUuYwo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9pbmNsdWRlL2FzbS1h
cm0vdGVlL29wdGVlX21zZy5oCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2luY2x1ZGUvYXNt
LWFybS90ZWUvb3B0ZWVfcnBjX2NtZC5oCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2luY2x1
ZGUvYXNtLWFybS90ZWUvb3B0ZWVfc21jLmgKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vaW5j
bHVkZS9hc20tYXJtL3RlZS90ZWUuaAo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
