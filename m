Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80513E7415
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 15:55:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP6Nz-00062e-L4; Mon, 28 Oct 2019 14:52:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZLsx=YV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iP6Ny-00062Z-Dw
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 14:52:46 +0000
X-Inumbo-ID: 999dac5e-f992-11e9-beca-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 999dac5e-f992-11e9-beca-bc764e2007e4;
 Mon, 28 Oct 2019 14:52:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 924781F1;
 Mon, 28 Oct 2019 07:52:44 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2181A3F6C4;
 Mon, 28 Oct 2019 07:52:43 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
References: <1568197942-15374-1-git-send-email-andrii.anisov@gmail.com>
 <1568197942-15374-3-git-send-email-andrii.anisov@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <0bd624d0-adbc-c14f-54ad-26dae1f67bf6@arm.com>
Date: Mon, 28 Oct 2019 14:52:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1568197942-15374-3-git-send-email-andrii.anisov@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 2/9] sysctl: extend XEN_SYSCTL_getcpuinfo
 interface
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMS8wOS8yMDE5IDExOjMyLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEZyb206IEFu
ZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+Cj4gCj4gRXh0ZW5kIFhFTl9TWVND
VExfZ2V0Y3B1aW5mbyBpbnRlcmZhY2Ugd2l0aCB0aW1pbmcgaW5mb3JtYXRpb24KPiBwcm92aWRl
ZCBieSBpbnRyb2R1Y2VkIHRpbWUgYWNjb3VudGluZyBpbmZyYXN0cnVjdHVyZS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgo+IC0tLQo+
ICAgeGVuL2NvbW1vbi9zY2hlZHVsZS5jICAgICAgIHwgMzMgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tCj4gICB4ZW4vY29tbW9uL3N5c2N0bC5jICAgICAgICAgfCAgNCArKysrCj4g
ICB4ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmggfCAgNCArKysrCj4gICB4ZW4vaW5jbHVkZS94
ZW4vc2NoZWQuaCAgICAgfCAgNCArKysrCj4gICA0IGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWR1
bGUuYyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwo+IGluZGV4IDZkZDY2MDMuLjIwMDcwMzQgMTAw
NjQ0Cj4gLS0tIGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jCj4gKysrIGIveGVuL2NvbW1vbi9zY2hl
ZHVsZS5jCj4gQEAgLTIwOCwxMyArMjA4LDM2IEBAIHZvaWQgdmNwdV9ydW5zdGF0ZV9nZXQoc3Ry
dWN0IHZjcHUgKnYsIHN0cnVjdCB2Y3B1X3J1bnN0YXRlX2luZm8gKnJ1bnN0YXRlKQo+ICAgCj4g
ICB1aW50NjRfdCBnZXRfY3B1X2lkbGVfdGltZSh1bnNpZ25lZCBpbnQgY3B1KQo+ICAgewo+IC0g
ICAgc3RydWN0IHZjcHVfcnVuc3RhdGVfaW5mbyBzdGF0ZSA9IHsgMCB9Owo+IC0gICAgc3RydWN0
IHZjcHUgKnYgPSBpZGxlX3ZjcHVbY3B1XTsKPiArICAgIHN0cnVjdCB0YWNjICp0YWNjID0gJnBl
cl9jcHUodGFjYywgY3B1KTsKPiAgIAo+IC0gICAgaWYgKCBjcHVfb25saW5lKGNwdSkgJiYgdiAp
Cj4gLSAgICAgICAgdmNwdV9ydW5zdGF0ZV9nZXQodiwgJnN0YXRlKTsKPiArICAgIHJldHVybiB0
YWNjLT5zdGF0ZV90aW1lW1RBQ0NfSURMRV07CgpTbyB3aGF0J3MgdGhlIGRpZmZlcmVuY2UgYmV0
d2VlbiB0aGUgY3VycmVudCBpZGxlIHRpbWUgYW5kIHRoZSBuZXcgdmVyc2lvbj8KCj4gK30KPiAr
Cj4gK3VpbnQ2NF90IGdldF9jcHVfZ3Vlc3RfdGltZSh1bnNpZ25lZCBpbnQgY3B1KQo+ICt7Cj4g
KyAgICBzdHJ1Y3QgdGFjYyAqdGFjYyA9ICZwZXJfY3B1KHRhY2MsIGNwdSk7Cj4gKwo+ICsgICAg
cmV0dXJuIHRhY2MtPnN0YXRlX3RpbWVbVEFDQ19HVUVTVF07Cj4gK30KPiArCj4gK3VpbnQ2NF90
IGdldF9jcHVfaHlwX3RpbWUodW5zaWduZWQgaW50IGNwdSkKPiArewo+ICsgICAgc3RydWN0IHRh
Y2MgKnRhY2MgPSAmcGVyX2NwdSh0YWNjLCBjcHUpOwo+ICsKPiArICAgIHJldHVybiB0YWNjLT5z
dGF0ZV90aW1lW1RBQ0NfSFlQXTsKPiArfQo+ICsKPiArdWludDY0X3QgZ2V0X2NwdV9pcnFfdGlt
ZSh1bnNpZ25lZCBpbnQgY3B1KQo+ICt7Cj4gKyAgICBzdHJ1Y3QgdGFjYyAqdGFjYyA9ICZwZXJf
Y3B1KHRhY2MsIGNwdSk7Cj4gKwo+ICsgICAgcmV0dXJuIHRhY2MtPnN0YXRlX3RpbWVbVEFDQ19J
UlFdOwo+ICt9Cj4gK3VpbnQ2NF90IGdldF9jcHVfZ3N5bmNfdGltZSh1bnNpZ25lZCBpbnQgY3B1
KQo+ICt7Cj4gKyAgICBzdHJ1Y3QgdGFjYyAqdGFjYyA9ICZwZXJfY3B1KHRhY2MsIGNwdSk7Cj4g
ICAKPiAtICAgIHJldHVybiBzdGF0ZS50aW1lW1JVTlNUQVRFX3J1bm5pbmddOwo+ICsgICAgcmV0
dXJuIHRhY2MtPnN0YXRlX3RpbWVbVEFDQ19HU1lOQ107Cj4gICB9CgpZb3UgbWF5IHdhbnQgdG8g
aW50cm9kdWNlIGFuIGhlbHBlciByZXRyaWV2aW5nIHRoZSB0aW1lIGZvciBhIGdpdmVuIHN0YXRl
IHJhdGhlciAKdGhhbiBkdXBsaWNhdGluZyBpdC4KCj4gICAKPiAgIC8qCj4gZGlmZiAtLWdpdCBh
L3hlbi9jb21tb24vc3lzY3RsLmMgYi94ZW4vY29tbW9uL3N5c2N0bC5jCj4gaW5kZXggOTJiNGVh
MC4uYjYzMDgzYyAxMDA2NDQKPiAtLS0gYS94ZW4vY29tbW9uL3N5c2N0bC5jCj4gKysrIGIveGVu
L2NvbW1vbi9zeXNjdGwuYwo+IEBAIC0xNTIsNiArMTUyLDEwIEBAIGxvbmcgZG9fc3lzY3RsKFhF
Tl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX3N5c2N0bF90KSB1X3N5c2N0bCkKPiAgICAgICAgICAg
Zm9yICggaSA9IDA7IGkgPCBucl9jcHVzOyBpKysgKQo+ICAgICAgICAgICB7Cj4gICAgICAgICAg
ICAgICBjcHVpbmZvLmlkbGV0aW1lID0gZ2V0X2NwdV9pZGxlX3RpbWUoaSk7Cj4gKyAgICAgICAg
ICAgIGNwdWluZm8uZ3Vlc3R0aW1lID0gZ2V0X2NwdV9ndWVzdF90aW1lKGkpOwo+ICsgICAgICAg
ICAgICBjcHVpbmZvLmh5cHRpbWUgPSBnZXRfY3B1X2h5cF90aW1lKGkpOwo+ICsgICAgICAgICAg
ICBjcHVpbmZvLmdzeW5jdGltZSA9IGdldF9jcHVfZ3N5bmNfdGltZShpKTsKPiArICAgICAgICAg
ICAgY3B1aW5mby5pcnF0aW1lID0gZ2V0X2NwdV9pcnFfdGltZShpKTsKCkl0IGZlZWxzIHRvIG1l
IHdlIHdhbnQgYSBmdW5jdGlvbiB0aGF0IGZpbGxzIHVwIHRoZSBzdHJ1Y3R1cmUuCgo+ICAgCj4g
ICAgICAgICAgICAgICBpZiAoIGNvcHlfdG9fZ3Vlc3Rfb2Zmc2V0KG9wLT51LmdldGNwdWluZm8u
aW5mbywgaSwgJmNwdWluZm8sIDEpICkKPiAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPiBk
aWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oIGIveGVuL2luY2x1ZGUvcHVi
bGljL3N5c2N0bC5oCj4gaW5kZXggNTQwMWY5Yy4uY2RhZGExZiAxMDA2NDQKPiAtLS0gYS94ZW4v
aW5jbHVkZS9wdWJsaWMvc3lzY3RsLmgKPiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3Rs
LmgKCkFzIGEgc2lkZSBub3RlLCBTWVNDVEwgdmVyc2lvbiB3aWxsIG5lZWQgdG8gYmUgYnVtcGVk
IGlmIHRoaXMgd2Fzbid0IGRvbmUgYmVmb3JlIApkdXJpbmcgdGhlIGN1cnJlbnQgcmVsZWFzZS4K
Cj4gQEAgLTE2OCw2ICsxNjgsMTAgQEAgc3RydWN0IHhlbl9zeXNjdGxfZGVidWdfa2V5cyB7Cj4g
ICAvKiBYRU5fU1lTQ1RMX2dldGNwdWluZm8gKi8KPiAgIHN0cnVjdCB4ZW5fc3lzY3RsX2NwdWlu
Zm8gewo+ICAgICAgIHVpbnQ2NF9hbGlnbmVkX3QgaWRsZXRpbWU7Cj4gKyAgICB1aW50NjRfYWxp
Z25lZF90IGh5cHRpbWU7Cj4gKyAgICB1aW50NjRfYWxpZ25lZF90IGd1ZXN0dGltZTsKPiArICAg
IHVpbnQ2NF9hbGlnbmVkX3QgaXJxdGltZTsKPiArICAgIHVpbnQ2NF9hbGlnbmVkX3QgZ3N5bmN0
aW1lOwo+ICAgfTsKPiAgIHR5cGVkZWYgc3RydWN0IHhlbl9zeXNjdGxfY3B1aW5mbyB4ZW5fc3lz
Y3RsX2NwdWluZm9fdDsKPiAgIERFRklORV9YRU5fR1VFU1RfSEFORExFKHhlbl9zeXNjdGxfY3B1
aW5mb190KTsKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmggYi94ZW4vaW5j
bHVkZS94ZW4vc2NoZWQuaAo+IGluZGV4IDA0YTg3MjQuLjgxNjc2MDggMTAwNjQ0Cj4gLS0tIGEv
eGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAo+
IEBAIC04NzYsNiArODc2LDEwIEBAIHZvaWQgcmVzdG9yZV92Y3B1X2FmZmluaXR5KHN0cnVjdCBk
b21haW4gKmQpOwo+ICAgCj4gICB2b2lkIHZjcHVfcnVuc3RhdGVfZ2V0KHN0cnVjdCB2Y3B1ICp2
LCBzdHJ1Y3QgdmNwdV9ydW5zdGF0ZV9pbmZvICpydW5zdGF0ZSk7Cj4gICB1aW50NjRfdCBnZXRf
Y3B1X2lkbGVfdGltZSh1bnNpZ25lZCBpbnQgY3B1KTsKPiArdWludDY0X3QgZ2V0X2NwdV9oeXBf
dGltZSh1bnNpZ25lZCBpbnQgY3B1KTsKPiArdWludDY0X3QgZ2V0X2NwdV9ndWVzdF90aW1lKHVu
c2lnbmVkIGludCBjcHUpOwo+ICt1aW50NjRfdCBnZXRfY3B1X2dzeW5jX3RpbWUodW5zaWduZWQg
aW50IGNwdSk7Cj4gK3VpbnQ2NF90IGdldF9jcHVfaXJxX3RpbWUodW5zaWduZWQgaW50IGNwdSk7
Cj4gICAKPiAgIC8qCj4gICAgKiBVc2VkIGJ5IGlkbGUgbG9vcCB0byBkZWNpZGUgd2hldGhlciB0
aGVyZSBpcyB3b3JrIHRvIGRvOgo+IAoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
