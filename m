Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF669B7699
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 11:47:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAszk-000440-Ma; Thu, 19 Sep 2019 09:45:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ts4K=XO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iAszi-00043l-MK
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 09:44:58 +0000
X-Inumbo-ID: 220483a0-dac2-11e9-9651-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 220483a0-dac2-11e9-9651-12813bfff9fa;
 Thu, 19 Sep 2019 09:44:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2216337;
 Thu, 19 Sep 2019 02:44:53 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1AD1C3F575;
 Thu, 19 Sep 2019 02:44:52 -0700 (PDT)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
 <1568388917-7287-3-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <4fa60fde-b4c2-9653-57fa-beb846373a77@arm.com>
Date: Thu, 19 Sep 2019 10:44:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1568388917-7287-3-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 2/8] iommu/arm: Add ability to handle
 deferred probing request
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

SGkgT2xla3NhbmRyLAoKT24gMTMvMDkvMjAxOSAxNjozNSwgT2xla3NhbmRyIFR5c2hjaGVua28g
d3JvdGU6Cj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9pb21tdS5j
IGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lvbW11LmMKPiBpbmRleCBmMjE5ZGU5Li41
NTVhY2ZjIDEwMDY0NAo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9pb21tdS5j
Cj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lvbW11LmMKPiBAQCAtMjAsNiAr
MjAsMTIgQEAKPiAgICNpbmNsdWRlIDx4ZW4vZGV2aWNlX3RyZWUuaD4KPiAgICNpbmNsdWRlIDxh
c20vZGV2aWNlLmg+Cj4gICAKPiArLyoKPiArICogRGVmZXJyZWQgcHJvYmUgbGlzdCBpcyB1c2Vk
IHRvIGtlZXAgdHJhY2sgb2YgZGV2aWNlcyBmb3Igd2hpY2ggZHJpdmVyCj4gKyAqIHJlcXVlc3Rl
ZCBkZWZlcnJlZCBwcm9iaW5nIChyZXR1cm5lZCAtRUFHQUlOKS4KPiArICovCj4gK3N0YXRpYyBf
X2luaXRkYXRhIExJU1RfSEVBRChkZWZlcnJlZF9wcm9iZV9saXN0KTsKPiArCj4gICBzdGF0aWMg
Y29uc3Qgc3RydWN0IGlvbW11X29wcyAqaW9tbXVfb3BzOwo+ICAgCj4gICBjb25zdCBzdHJ1Y3Qg
aW9tbXVfb3BzICppb21tdV9nZXRfb3BzKHZvaWQpCj4gQEAgLTQyLDcgKzQ4LDcgQEAgdm9pZCBf
X2luaXQgaW9tbXVfc2V0X29wcyhjb25zdCBzdHJ1Y3QgaW9tbXVfb3BzICpvcHMpCj4gICAKPiAg
IGludCBfX2luaXQgaW9tbXVfaGFyZHdhcmVfc2V0dXAodm9pZCkKPiAgIHsKPiAtICAgIHN0cnVj
dCBkdF9kZXZpY2Vfbm9kZSAqbnA7Cj4gKyAgICBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKm5wLCAq
dG1wOwo+ICAgICAgIGludCByYzsKPiAgICAgICB1bnNpZ25lZCBpbnQgbnVtX2lvbW11cyA9IDA7
Cj4gICAKPiBAQCAtNTEsNiArNTcsMjEgQEAgaW50IF9faW5pdCBpb21tdV9oYXJkd2FyZV9zZXR1
cCh2b2lkKQo+ICAgICAgICAgICByYyA9IGRldmljZV9pbml0KG5wLCBERVZJQ0VfSU9NTVUsIE5V
TEwpOwo+ICAgICAgICAgICBpZiAoICFyYyApCj4gICAgICAgICAgICAgICBudW1faW9tbXVzKys7
Cj4gKyAgICAgICAgZWxzZSBpZiAoIHJjID09IC1FQUdBSU4gKQo+ICsgICAgICAgIHsKPiArICAg
ICAgICAgICAgLyoKPiArICAgICAgICAgICAgICogV2UgZXhwZWN0IG5vYm9keSB1c2VzIGRldmlj
ZSdzIGRvbWFpbl9saXN0IGF0IHN1Y2ggZWFybHkgc3RhZ2UsCgpOSVQ6IHMvV2UgZXhwZWN0IG5v
Ym9keSB1c2VzL05vYm9keSBzaG91bGQgdXNlLwoKPiArICAgICAgICAgICAgICogc28gd2UgY2Fu
IHJlLXVzZSBpdCB0byBsaW5rIHRoZSBkZXZpY2UgaW4gdGhlIGRlZmVycmVkIGxpc3QgdG8KPiAr
ICAgICAgICAgICAgICogYXZvaWQgaW50cm9kdWNpbmcgZXh0cmEgbGlzdF9oZWFkIGZpZWxkIGlu
IHN0cnVjdCBkdF9kZXZpY2Vfbm9kZS4KPiArICAgICAgICAgICAgICovCj4gKyAgICAgICAgICAg
IEFTU0VSVChsaXN0X2VtcHR5KCZucC0+ZG9tYWluX2xpc3QpKTsKClsuLi5dCgo+ICAgdm9pZCBf
X2h3ZG9tX2luaXQgYXJjaF9pb21tdV9jaGVja19hdXRvdHJhbnNsYXRlZF9od2RvbShzdHJ1Y3Qg
ZG9tYWluICpkKQo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2RldmljZS5oIGIv
eGVuL2luY2x1ZGUvYXNtLWFybS9kZXZpY2UuaAo+IGluZGV4IDYzYTBmMzYuLmVlMWMzYmMgMTAw
NjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9kZXZpY2UuaAo+ICsrKyBiL3hlbi9pbmNs
dWRlL2FzbS1hcm0vZGV2aWNlLmgKPiBAQCAtNDQsNyArNDQsMTEgQEAgc3RydWN0IGRldmljZV9k
ZXNjIHsKPiAgICAgICBlbnVtIGRldmljZV9jbGFzcyBjbGFzczsKPiAgICAgICAvKiBMaXN0IG9m
IGRldmljZXMgc3VwcG9ydGVkIGJ5IHRoaXMgZHJpdmVyICovCj4gICAgICAgY29uc3Qgc3RydWN0
IGR0X2RldmljZV9tYXRjaCAqZHRfbWF0Y2g7Cj4gLSAgICAvKiBEZXZpY2UgaW5pdGlhbGl6YXRp
b24gKi8KPiArICAgIC8qCj4gKyAgICAgKiBEZXZpY2UgaW5pdGlhbGl6YXRpb24uCj4gKyAgICAg
Kgo+ICsgICAgICogLUVBR0FJTiBpcyB1c2VkIHRvIGluZGljYXRlIHRoYXQgZGV2aWNlIHByb2Jp
bmcgaXMgZGVmZXJyZWQuCj4gKyAgICAgKi8KPiAgICAgICBpbnQgKCppbml0KShzdHJ1Y3QgZHRf
ZGV2aWNlX25vZGUgKmRldiwgY29uc3Qgdm9pZCAqZGF0YSk7Cj4gICB9Owo+ICAgCj4gZGlmZiAt
LWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9kZXZpY2VfdHJlZS5oIGIveGVuL2luY2x1ZGUveGVuL2Rl
dmljZV90cmVlLmgKPiBpbmRleCA5YTdhOGYyLi4zNzAyZTliIDEwMDY0NAo+IC0tLSBhL3hlbi9p
bmNsdWRlL3hlbi9kZXZpY2VfdHJlZS5oCj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2RldmljZV90
cmVlLmgKPiBAQCAtOTIsNiArOTIsMTMgQEAgc3RydWN0IGR0X2RldmljZV9ub2RlIHsKPiAgIAo+
ICAgICAgIC8qIElPTU1VIHNwZWNpZmljIGZpZWxkcyAqLwo+ICAgICAgIGJvb2wgaXNfcHJvdGVj
dGVkOwo+ICsgICAgLyoKPiArICAgICAqIFRoZSBtYWluIHB1cnBvc2Ugb2YgdGhpcyBsaXN0IG5v
ZGUgaXMgdG8gbGluayB0aGUgc3RydWN0dXJlIGluIHRoZSBsaXN0CgpzL25vZGUvLz8KCj4gKyAg
ICAgKiBvZiBkZXZpY2VzIGFzc2lnbmVkIHRvIGRvbWFpbi4KPiArICAgICAqCj4gKyAgICAgKiBC
b290IGNvZGUgKGlvbW11X2hhcmR3YXJlX3NldHVwKSByZS11c2VzIHRoaXMgbGlzdCB0byBsaW5r
IHRoZSBzdHJ1Y3R1cmUKPiArICAgICAqIGluIHRoZSBsaXN0IG9mIGRldmljZXMgZm9yIHdoaWNo
IGRyaXZlciByZXF1ZXN0ZWQgZGVmZXJyZWQgcHJvYmluZy4KPiArICAgICAqLwo+ICAgICAgIHN0
cnVjdCBsaXN0X2hlYWQgZG9tYWluX2xpc3Q7Cj4gICAKPiAgICAgICBzdHJ1Y3QgZGV2aWNlIGRl
djsKPiAKCldpdGggdGhlIHR3byBhYm92ZSBhZGRyZXNzZWQgYW5kIHBlbmRpbmcgdGhlIHBhdGNo
IGl0IGRlcGVuZHMgb24gWzFdIGlzIGFja2VkOgoKUmV2aWV3ZWQtYnk6IEp1bGllbiBHcmFsbCA8
anVsaWVuLmdyYWxsQGFybS5jb20+CgpDaGVlcnMsCgpbMV0gaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA4L21zZzAxOTI0Lmh0bWwKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
