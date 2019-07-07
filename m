Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 750FF61E39
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 14:15:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkSWf-0001JU-VO; Mon, 08 Jul 2019 12:13:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=arZn=VF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hkSWe-0001J6-PO
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 12:13:44 +0000
X-Inumbo-ID: d3a7e0c0-a179-11e9-bdb8-2365988b5376
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id d3a7e0c0-a179-11e9-bdb8-2365988b5376;
 Mon, 08 Jul 2019 12:13:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F1DA360;
 Mon,  8 Jul 2019 05:13:42 -0700 (PDT)
Received: from [10.37.9.206] (unknown [10.37.9.206])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15D753F738;
 Mon,  8 Jul 2019 05:13:39 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <1561109798-8744-1-git-send-email-andrew.cooper3@citrix.com>
 <1561109798-8744-4-git-send-email-andrew.cooper3@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <1f793fd1-c73a-cf09-b9ac-d4abf2f497ec@arm.com>
Date: Sun, 7 Jul 2019 19:38:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1561109798-8744-4-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/5] arm/gnttab: Implement stub helpers as
 static inlines
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
Cc: Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LAoKT24gNi8yMS8xOSAxMDozNiBBTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBJ
dCBpcyBpbmVmZmljaWVudCB0byBjYWxsIGludG8gYSBkaWZmZXJlbnQgdHJhbnNsYXRpb24gdW5p
dCBmb3IgYSBzdHViCj4gZnVuY3Rpb24sIHdoZW4gYSBzdGF0aWMgaW5saW5lIHdpbGwgd29yayBm
aW5lLiAgUmVwbGFjZSBhbiBvcGVuLWNvZGVkCj4gcHJpbnRrX29uY2UoKSB3aGlsZSBtb3Zpbmcg
aXQuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKQ2hlZXJzLAoKPiAtLS0KPiBDQzogU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IENDOiBKdWxpZW4gR3JhbGwgPGp1
bGllbi5ncmFsbEBhcm0uY29tPgo+IC0tLQo+ICAgeGVuL2FyY2gvYXJtL21tLmMgICAgICAgICAg
ICAgICAgIHwgMTYgLS0tLS0tLS0tLS0tLS0tLQo+ICAgeGVuL2luY2x1ZGUvYXNtLWFybS9ncmFu
dF90YWJsZS5oIHwgMTcgKysrKysrKysrKysrKysrLS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTUg
aW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L2FybS9tbS5jIGIveGVuL2FyY2gvYXJtL21tLmMKPiBpbmRleCAzNWRjMWY3Li40NDI1OGFkIDEw
MDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9tbS5jCj4gKysrIGIveGVuL2FyY2gvYXJtL21tLmMK
PiBAQCAtNDEsNyArNDEsNiBAQAo+ICAgI2luY2x1ZGUgPHhlbi9zaXplcy5oPgo+ICAgI2luY2x1
ZGUgPHhlbi9saWJmZHQvbGliZmR0Lmg+Cj4gICAKPiAtI2luY2x1ZGUgPGFzbS9ndWVzdF9hdG9t
aWNzLmg+Cj4gICAjaW5jbHVkZSA8YXNtL3NldHVwLmg+Cj4gICAKPiAgIC8qIE92ZXJyaWRlIG1h
Y3JvcyBmcm9tIGFzbS9wYWdlLmggdG8gbWFrZSB0aGVtIHdvcmsgd2l0aCBtZm5fdCAqLwo+IEBA
IC0xNTMyLDIxICsxNTMxLDYgQEAgdm9pZCBwdXRfcGFnZV90eXBlKHN0cnVjdCBwYWdlX2luZm8g
KnBhZ2UpCj4gICAgICAgcmV0dXJuOwo+ICAgfQo+ICAgCj4gLXZvaWQgZ250dGFiX2NsZWFyX2Zs
YWcoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgbG9uZyBuciwgdWludDE2X3QgKmFkZHIpCj4g
LXsKPiAtICAgIGd1ZXN0X2NsZWFyX21hc2sxNihkLCBCSVQobnIsIFVMKSwgYWRkcik7Cj4gLX0K
PiAtCj4gLXZvaWQgZ250dGFiX21hcmtfZGlydHkoc3RydWN0IGRvbWFpbiAqZCwgbWZuX3QgbWZu
KQo+IC17Cj4gLSAgICAvKiBYWFg6IG1hcmsgZGlydHkgKi8KPiAtICAgIHN0YXRpYyBpbnQgd2Fy
bmluZzsKPiAtICAgIGlmICghd2FybmluZykgewo+IC0gICAgICAgIGdkcHJpbnRrKFhFTkxPR19X
QVJOSU5HLCAiZ250dGFiX21hcmtfZGlydHkgbm90IGltcGxlbWVudGVkIHlldFxuIik7Cj4gLSAg
ICAgICAgd2FybmluZyA9IDE7Cj4gLSAgICB9Cj4gLX0KPiAtCj4gICBpbnQgY3JlYXRlX2dyYW50
X2hvc3RfbWFwcGluZyh1bnNpZ25lZCBsb25nIGFkZHIsIG1mbl90IGZyYW1lLAo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGZsYWdzLCB1bnNpZ25lZCBpbnQg
Y2FjaGVfZmxhZ3MpCj4gICB7Cj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vZ3Jh
bnRfdGFibGUuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vZ3JhbnRfdGFibGUuaAo+IGluZGV4IDFl
ZDBhZWYuLmIwZDY3M2IgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9ncmFudF90
YWJsZS5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9ncmFudF90YWJsZS5oCj4gQEAgLTYs
NiArNiw4IEBACj4gICAjaW5jbHVkZSA8eGVuL3Bmbi5oPgo+ICAgI2luY2x1ZGUgPHhlbi9zY2hl
ZC5oPgo+ICAgCj4gKyNpbmNsdWRlIDxhc20vZ3Vlc3RfYXRvbWljcy5oPgo+ICsKPiAgICNkZWZp
bmUgSU5JVElBTF9OUl9HUkFOVF9GUkFNRVMgMVUKPiAgICNkZWZpbmUgR05UVEFCX01BWF9WRVJT
SU9OIDEKPiAgIAo+IEBAIC0xNCwxMyArMTYsMjQgQEAgc3RydWN0IGdyYW50X3RhYmxlX2FyY2gg
ewo+ICAgICAgIGdmbl90ICpzdGF0dXNfZ2ZuOwo+ICAgfTsKPiAgIAo+IC12b2lkIGdudHRhYl9j
bGVhcl9mbGFnKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGxvbmcgbnIsIHVpbnQxNl90ICph
ZGRyKTsKPiArc3RhdGljIGlubGluZSB2b2lkIGdudHRhYl9jbGVhcl9mbGFnKHN0cnVjdCBkb21h
aW4gKmQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBs
b25nIG5yLCB1aW50MTZfdCAqYWRkcikKPiArewo+ICsgICAgZ3Vlc3RfY2xlYXJfbWFzazE2KGQs
IEJJVChuciwgVUwpLCBhZGRyKTsKPiArfQo+ICsKPiArc3RhdGljIGlubGluZSB2b2lkIGdudHRh
Yl9tYXJrX2RpcnR5KHN0cnVjdCBkb21haW4gKmQsIG1mbl90IG1mbikKPiArewo+ICsjaWZuZGVm
IE5ERUJVRwo+ICsgICAgcHJpbnRrX29uY2UoWEVOTE9HX0dfV0FSTklORyAiZ250dGFiX21hcmtf
ZGlydHkgbm90IGltcGxlbWVudGVkIHlldFxuIik7Cj4gKyNlbmRpZgo+ICt9Cj4gKwo+ICAgaW50
IGNyZWF0ZV9ncmFudF9ob3N0X21hcHBpbmcodW5zaWduZWQgbG9uZyBncGFkZHIsIG1mbl90IG1m
biwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBmbGFncywg
dW5zaWduZWQgaW50IGNhY2hlX2ZsYWdzKTsKPiAgICNkZWZpbmUgZ250dGFiX2hvc3RfbWFwcGlu
Z19nZXRfcGFnZV90eXBlKHJvLCBsZCwgcmQpICgwKQo+ICAgaW50IHJlcGxhY2VfZ3JhbnRfaG9z
dF9tYXBwaW5nKHVuc2lnbmVkIGxvbmcgZ3BhZGRyLCBtZm5fdCBtZm4sCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBuZXdfZ3BhZGRyLCB1bnNpZ25lZCBp
bnQgZmxhZ3MpOwo+IC12b2lkIGdudHRhYl9tYXJrX2RpcnR5KHN0cnVjdCBkb21haW4gKmQsIG1m
bl90IG1mbik7Cj4gICAjZGVmaW5lIGdudHRhYl9yZWxlYXNlX2hvc3RfbWFwcGluZ3MoZG9tYWlu
KSAxCj4gICAKPiAgIC8qCj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
