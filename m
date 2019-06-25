Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 996AD528DB
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 12:00:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfiDG-0004Ku-L7; Tue, 25 Jun 2019 09:58:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HbZU=UY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hfiDF-0004Km-7R
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 09:58:05 +0000
X-Inumbo-ID: b782fbb8-972f-11e9-bf33-7f4d715306f6
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id b782fbb8-972f-11e9-bf33-7f4d715306f6;
 Tue, 25 Jun 2019 09:58:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B338C360;
 Tue, 25 Jun 2019 02:58:00 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8365A3F71E;
 Tue, 25 Jun 2019 02:57:59 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Denis Obrezkov <denisobrezkov@gmail.com>, xen-devel@lists.xenproject.org
References: <ee1f4b9b969e6cf67278905e0405bc4fa5d6080c.1561147189.git.denisobrezkov@gmail.com>
 <ecfa161d-1389-1541-e92c-dfa3b8c7e402@arm.com>
 <670083cc-00d8-ccfd-7abc-e6fd98e7ff2b@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e6f3e92d-6be8-f1c8-e2e3-93ef8f581dda@arm.com>
Date: Tue, 25 Jun 2019 10:57:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <670083cc-00d8-ccfd-7abc-e6fd98e7ff2b@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: Switch OMAP5 secondary cores into
 hyp mode
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
Cc: Hunyue Yau <hy-gsoc@hy-research.com>,
 "julien.grall@foss.arm.com" <julien.grall@foss.arm.com>,
 Andre Przywara <andre.przywara@arm.com>, tim@xen.org,
 Iain Hunter <drhunter95@gmail.com>, baozich@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LAoKT24gMjQvMDYvMjAxOSAxMzowMywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBP
biAyNC8wNi8yMDE5IDEyOjA5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+ICgrIEdTT0MgbWVudG9y
cyBhbmQgQW5kcmUpCj4+Cj4+IEhpIERlbmlzLAo+Pgo+PiBUaGFuayB5b3UgZm9yIHRoZSBwYXRj
aC4KPj4KPj4gRmlyc3Qgb2YgYWxsLCBtYXkgSSBhc2sgdG8gQ0MgdGhlIG90aGVyIG1lbnRvcnM/
Cj4+Cj4+IE9uIDYvMjEvMTkgOTowMiBQTSwgRGVuaXMgT2JyZXprb3Ygd3JvdGU6Cj4+PiBUaGlz
IGZ1bmN0aW9uIGFsbG93cyB4ZW4gdG8gYnJpbmcgc2Vjb25kYXJ5IENQVSBjb3JlcyBpbnRvIG5v
bi1zZWN1cmUKPj4+IEhZUCBtb2RlLiBUaGlzIGlzIGRvbmUgYnkgdXNpbmcgYSBTZWN1cmUgTW9u
aXRvciBjYWxsLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IERlbmlzIE9icmV6a292IDxkZW5pc29i
cmV6a292QGdtYWlsLmNvbT4KPj4+IC0tLQo+Pj4gwqAgeGVuL2FyY2gvYXJtL2FybTMyL2hlYWQu
U8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDExICsrKysrKysrKystCj4+PiDCoCB4ZW4vYXJj
aC9hcm0vcGxhdGZvcm1zL29tYXA1LmPCoMKgwqDCoMKgwqDCoCB8wqAgNSArKystLQo+Pj4gwqAg
eGVuL2luY2x1ZGUvYXNtLWFybS9wbGF0Zm9ybXMvb21hcDUuaCB8wqAgMyArKysKPj4+IMKgIDMg
ZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPj4+Cj4+PiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm0z
Mi9oZWFkLlMKPj4+IGluZGV4IDVmODE3ZDQ3M2UuLjEyMGUwMzQ5MzQgMTAwNjQ0Cj4+PiAtLS0g
YS94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCj4+PiArKysgYi94ZW4vYXJjaC9hcm0vYXJtMzIv
aGVhZC5TCj4+PiBAQCAtMzYsNiArMzYsMTAgQEAKPj4+IMKgICNpbmNsdWRlIEVBUkxZX1BSSU5U
S19JTkMKPj4+IMKgICNlbmRpZgo+Pj4gwqAgKwo+Pj4gKyNkZWZpbmUgQVBJX0hZUF9FTlRSWSAw
eDEwMgo+Pj4gKyNkZWZpbmUgQVVYX0NPUkVfQk9PVDBfUEHCoMKgwqDCoMKgwqDCoMKgwqDCoCAw
eDQ4MjgxODAwCj4+PiArCj4+Cj4+IEkgaGF2ZSB0aG91Z2h0IGEgYml0IG1vcmUgYWJvdXQgdGhl
IHBsYWNlbWVudCBvZiB0aGUgY29kZS4gSSB0aGluayBpdCB3b3VsZCBiZSAKPj4gYmVzdCBpZiBp
dCBsaXZlcyBpbiBhIHNlcGFyYXRlIGZpbGUgKG1heWJlIHBsYXRmb3Jtcy9vbWFwNS1oZWFkLlMp
Lgo+IAo+IEZvciBzb21ldGhpbmcgdGhpcyB0cml2aWFsLCBpdCBpcyBlYXN5IHRvIHB1dCBzdHJh
aWdodCBpbnRvIG9tYXA1LmMKPiAKPiBDb21wbGV0ZWx5IHVudGVzdGVkLCBidXQgdGhpcyBvdWdo
dCB0byB3b3JrOgo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL29tYXA1
LmMgYi94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL29tYXA1LmMKPiBpbmRleCA2YjVjYzE1YWYzLi4x
ZGNjOTJkM2E0IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvb21hcDUuYwo+
ICsrKyBiL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvb21hcDUuYwo+IEBAIC0yMyw2ICsyMywxNiBA
QAo+ICAgI2luY2x1ZGUgPHhlbi92bWFwLmg+Cj4gICAjaW5jbHVkZSA8YXNtL2lvLmg+Cj4gICAK
PiArdm9pZCBvbWFwNV9pbml0X3NlY29uZGFyeSh2b2lkKTsKPiArYXNtICgKPiArIi50ZXh0ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFxuXHQiCj4gKyJvbWFwNV9pbml0X3NlY29uZGFyeTog
ICAgICAgICAgICBcblx0Igo+ICsiICAgICAgICBsZHIgICByMTIsID0weDEwMiAgICAgICAgXG5c
dCIgLyogQVBJX0hZUF9FTlRSWSAqLwo+ICsiICAgICAgICBhZHIgICByMCwgaW5pdF9zZWNvbmRh
cnkgXG5cdCIKCllvdSBjYW5ub3QgdXNlIGFkciBvbiBleHRlcm5hbCBhZGRyZXNzIGZvciBBcm0z
Mi4gVGhpcyBpcyBiZWNhdXNlIHRoZSBpbW1lZGlhdGUgCmNvbnN0YW50IG5lZWRzIHRvIGhhdmUg
YSBzcGVjaWZpYyBmb3JtYXQgKHNlZSAiTW9kaWZpZWQgaW1tZWRpYXRlIGNvbnN0YW50cyBpbiAK
QVJNIGluc3RydWN0aW9ucyIgQTUuMi40IGluIEFSTSBEREkgNDA2Qy5jKS4KCkluc3RlYWQgd2Ug
d291bGQgbmVlZCBzb21ldGhpbmcgbGlrZToKCm9tYXA1X2luaXRfc2Vjb25kYXJ5OgogICAgICBs
ZHIgcjEyLCA9MHgxMDIKICAgICAgYWRyIHIwLCBvbWFwNV9oeXAKICAgICAgc21jICMwCm9tYXA1
X2h5cDoKICAgICAgYiAgIGluaXRfc2Vjb25kYXJ5CgpOb3RlIHNpbWlsYXIgY29kZSB3b3VsZCBi
ZSBuZWVkZWQgZm9yIHRoZSBzdHViIGZpbGUuCgo+ICsiICAgICAgICBzbWMgICAjMCAgICAgICAg
ICAgICAgICAgXG5cdCIKPiArIiAgICAgICAgYiAgICAgaW5pdF9zZWNvbmRhcnkgICAgIFxuXHQi
Cj4gKyk7Cj4gKwo+ICAgc3RhdGljIHVpbnQxNl90IG51bV9kZW5bOF1bMl0gPSB7Cj4gICAgICAg
eyAgICAgICAgIDAsICAgICAgICAgIDAgfSwgIC8qIG5vdCB1c2VkICovCj4gICAgICAgeyAgMjYg
KiAgNjQsICAyNiAqICAxMjUgfSwgIC8qIDEyLjAgTWh6ICovCj4gCj4gCj4gSSBwZXJzb25hbGx5
IGZpbmQgdGhpcyBmYXZvdXJhYmxlIHRvIGludHJvZHVjaW5nIG5ldyBzdHViIGZpbGVzLgo+IAo+
IFVsdGltYXRlbHkgaXQgaXMgSnVsaWVuL1N0ZWZhbm8ncyBkZWNpc2lvbiwgYnV0IEknZCBsaWtl
IHRvIHBvaW50IGl0IG91dCBhcyBhbiAKPiBvcHRpb24gZm9yIGFueW9uZSB3aG8gaXMgdW5hd2Fy
ZS4KClRoYW5rIHlvdSBmb3IgdGhlIHN1Z2dlc3Rpb24gOikuIFRoaXMgd2FzIHN1Z2dlc3RlZCBs
YXN0IHdlZWssIGJ1dCBuby1vbmUgY2FtZSAKYmFjayBleHBsYWluaW5nIGhvdyBpdCBjb3VsZCBi
ZSBpbXBsZW1lbnRlZC4KClRoZSB0d28gYXJlIGZpbmUgd2l0aCBtZS4KCkNoZWVycywKCi0tIApK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
