Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4AAE5D6
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 17:10:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL7s8-0004gW-Na; Mon, 29 Apr 2019 15:07:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C3NY=S7=citrix.com=prvs=015693d2f=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1hL7s7-0004gR-8I
 for xen-devel@lists.xen.org; Mon, 29 Apr 2019 15:07:11 +0000
X-Inumbo-ID: 7300e8a4-6a90-11e9-a0aa-3b97ef8d6732
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7300e8a4-6a90-11e9-a0aa-3b97ef8d6732;
 Mon, 29 Apr 2019 15:07:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,409,1549929600"; d="scan'208";a="84658573"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>
References: <20190416120716.26269-1-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <3cf04a64-5cc1-6265-48f4-097a23181bf2@citrix.com>
Date: Mon, 29 Apr 2019 16:07:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190416120716.26269-1-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [livepatch-build-tools part2 1/6] common: Add
 is_standard_section() helper function
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
Cc: mpohlack@amazon.de, konrad.wilk@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNC8xNi8xOSAxOjA3IFBNLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToKPiBEZXRlY3Qg
c3RhbmRhcmQgKGFsd2F5cyB0byBiZSBpbmNsdWRlZCkgc2VjdGlvbnMgdmlhIHRoZWlyIHNlY3Rp
b24KPiBoZWFkZXIgdHlwZS4gVGhlIHN0YW5kYXJkIHNlY3Rpb25zOiAiLnNoc3RydGFiIiwgIi5z
eW10YWIiLCAiLnN0cnRhYiIKPiBhcmUgZWl0aGVyIG9mIHR5cGUgU0hUX1NZTVRBQiBvciBTSFRf
U1RSVEFCLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3aXBhd2Vs
QGFtYXpvbi5kZT4KPiBSZXZpZXdlZC1ieTogQW5kcmEtSXJpbmEgUGFyYXNjaGl2IDxhbmRyYXBy
c0BhbWF6b24uY29tPgo+IFJldmlld2VkLWJ5OiBCam9lcm4gRG9lYmVsIDxkb2ViZWxAYW1hem9u
LmRlPgo+IFJldmlld2VkLWJ5OiBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4K
PiAtLS0KPiAgIGNvbW1vbi5jICAgICAgICAgICAgIHwgMTIgKysrKysrKysrKysrCj4gICBjb21t
b24uaCAgICAgICAgICAgICB8ICAxICsKPiAgIGNyZWF0ZS1kaWZmLW9iamVjdC5jIHwgIDUgKy0t
LS0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvY29tbW9uLmMgYi9jb21tb24uYwo+IGluZGV4IGJjNjM5NTUuLjFm
YjA3Y2IgMTAwNjQ0Cj4gLS0tIGEvY29tbW9uLmMKPiArKysgYi9jb21tb24uYwo+IEBAIC01LDYg
KzUsNyBAQAo+ICAgI2luY2x1ZGUgPHN5cy9zdGF0Lmg+Cj4gICAjaW5jbHVkZSA8ZmNudGwuaD4K
PiAgICNpbmNsdWRlIDx1bmlzdGQuaD4KPiArI2luY2x1ZGUgPHN0ZGJvb2wuaD4KPiAgICNpbmNs
dWRlIDxnZWxmLmg+Cj4gICAKPiAgICNpbmNsdWRlICJsaXN0LmgiCj4gQEAgLTI1OCw2ICsyNTks
MTcgQEAgaW50IGlzX2RlYnVnX3NlY3Rpb24oc3RydWN0IHNlY3Rpb24gKnNlYykKPiAgIAlyZXR1
cm4gIXN0cm5jbXAobmFtZSwgIi5kZWJ1Z18iLCA3KTsKPiAgIH0KPiAgIAo+ICtpbnQgaXNfc3Rh
bmRhcmRfc2VjdGlvbihzdHJ1Y3Qgc2VjdGlvbiAqc2VjKQo+ICt7Cj4gKwlzd2l0Y2ggKHNlYy0+
c2guc2hfdHlwZSkgewo+ICsJY2FzZSBTSFRfU1RSVEFCOgo+ICsJY2FzZSBTSFRfU1lNVEFCOgo+
ICsJCXJldHVybiB0cnVlOwo+ICsJZGVmYXVsdDoKPiArCQlyZXR1cm4gZmFsc2U7Cj4gKwl9Cj4g
K30KPiArCj4gICAvKiByZXR1cm5zIHRoZSBvZmZzZXQgb2YgdGhlIHN0cmluZyBpbiB0aGUgc3Ry
aW5nIHRhYmxlICovCj4gICBpbnQgb2Zmc2V0X29mX3N0cmluZyhzdHJ1Y3QgbGlzdF9oZWFkICps
aXN0LCBjaGFyICpuYW1lKQo+ICAgewo+IGRpZmYgLS1naXQgYS9jb21tb24uaCBiL2NvbW1vbi5o
Cj4gaW5kZXggNzU5OWZlNy4uY2RhNjkwZCAxMDA2NDQKPiAtLS0gYS9jb21tb24uaAo+ICsrKyBi
L2NvbW1vbi5oCj4gQEAgLTE1MCw2ICsxNTAsNyBAQCBzdHJ1Y3Qgc3ltYm9sICpmaW5kX3N5bWJv
bF9ieV9uYW1lKHN0cnVjdCBsaXN0X2hlYWQgKmxpc3QsIGNvbnN0IGNoYXIgKm5hbWUpOwo+ICAg
aW50IGlzX3RleHRfc2VjdGlvbihzdHJ1Y3Qgc2VjdGlvbiAqc2VjKTsKPiAgIGludCBpc19kZWJ1
Z19zZWN0aW9uKHN0cnVjdCBzZWN0aW9uICpzZWMpOwo+ICAgaW50IGlzX3JlbGFfc2VjdGlvbihz
dHJ1Y3Qgc2VjdGlvbiAqc2VjKTsKPiAraW50IGlzX3N0YW5kYXJkX3NlY3Rpb24oc3RydWN0IHNl
Y3Rpb24gKnNlYyk7Cj4gICBpbnQgaXNfbG9jYWxfc3ltKHN0cnVjdCBzeW1ib2wgKnN5bSk7Cj4g
ICAKPiAgIHZvaWQgcmVsYV9pbnNuKHN0cnVjdCBzZWN0aW9uICpzZWMsIHN0cnVjdCByZWxhICpy
ZWxhLCBzdHJ1Y3QgaW5zbiAqaW5zbik7Cj4gZGlmZiAtLWdpdCBhL2NyZWF0ZS1kaWZmLW9iamVj
dC5jIGIvY3JlYXRlLWRpZmYtb2JqZWN0LmMKPiBpbmRleCA4MmY3NzdlLi4xZTZlNjE3IDEwMDY0
NAo+IC0tLSBhL2NyZWF0ZS1kaWZmLW9iamVjdC5jCj4gKysrIGIvY3JlYXRlLWRpZmYtb2JqZWN0
LmMKPiBAQCAtMTI3OCwxMCArMTI3OCw3IEBAIHN0YXRpYyB2b2lkIGtwYXRjaF9pbmNsdWRlX3N0
YW5kYXJkX2VsZW1lbnRzKHN0cnVjdCBrcGF0Y2hfZWxmICprZWxmKQo+ICAgCj4gICAJbGlzdF9m
b3JfZWFjaF9lbnRyeShzZWMsICZrZWxmLT5zZWN0aW9ucywgbGlzdCkgewo+ICAgCQkvKiBpbmNs
dWRlIHRoZXNlIHNlY3Rpb25zIGV2ZW4gaWYgdGhleSBoYXZlbid0IGNoYW5nZWQgKi8KPiAtCQlp
ZiAoIXN0cmNtcChzZWMtPm5hbWUsICIuc2hzdHJ0YWIiKSB8fAo+IC0JCSAgICAhc3RyY21wKHNl
Yy0+bmFtZSwgIi5zdHJ0YWIiKSB8fAo+IC0JCSAgICAhc3RyY21wKHNlYy0+bmFtZSwgIi5zeW10
YWIiKSB8fAo+IC0JCSAgICBzaG91bGRfaW5jbHVkZV9zdHJfc2VjdGlvbihzZWMtPm5hbWUpKSB7
Cj4gKwkJaWYgKGlzX3N0YW5kYXJkX3NlY3Rpb24oc2VjKSB8fCBzaG91bGRfaW5jbHVkZV9zdHJf
c2VjdGlvbihzZWMtPm5hbWUpKSB7CgpMZXQncyBrZWVwIGxpbmVzIHRvIDgwIGNoYXJzIHdoZXJl
IGZlYXNpYmxlICgxIHRhYiA9PSA4IHNwYWNlcykuIApPdGhlcndpc2UgTEdUTS4KCi0tIApSb3Nz
IExhZ2Vyd2FsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
