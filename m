Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F11106CF16
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 15:47:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho6i6-0002EF-8D; Thu, 18 Jul 2019 13:44:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b8c6=VP=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ho6i4-0002D7-Js
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 13:44:36 +0000
X-Inumbo-ID: 2db26755-a962-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 2db26755-a962-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 13:44:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CEE501516;
 Thu, 18 Jul 2019 06:44:34 -0700 (PDT)
Received: from [10.37.10.69] (unknown [10.37.10.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D1C33F71F;
 Thu, 18 Jul 2019 06:44:33 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Andrii Anisov <andrii.anisov@gmail.com>
References: <1563456140-12180-1-git-send-email-andrii.anisov@gmail.com>
 <c6f154b8-34a5-9b23-6761-1a10680dc486@citrix.com>
 <401358d0-38d3-a881-e020-01934f18b193@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e61ddba2-f6b9-b452-c22e-361bc3b8afed@arm.com>
Date: Thu, 18 Jul 2019 14:44:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <401358d0-38d3-a881-e020-01934f18b193@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] arm:cpuerrata: Align a virtual address
 before unmap
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA3LzE4LzE5IDI6NDMgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMTgvMDcv
MjAxOSAxNDozOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTgvMDcvMjAxOSAxNDoyMiwg
QW5kcmlpIEFuaXNvdiB3cm90ZToKPj4+IEZyb206IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlz
b3ZAZXBhbS5jb20+Cj4+Pgo+Pj4gQWZ0ZXIgY2hhbmdlcyBpbnRyb2R1Y2VkIGJ5IDljYzA2MTgg
d2UgYXJlIGFibGUgdG8gdm1hcC92dW5tYXAKPj4+IHBhZ2UgYWxpZ25lZCBhZGRyZXNzZXMgb25s
eS4KPj4+IFNvIGlmIHdlIGFkZCBhIHBhZ2UgYWRkcmVzcyByZW1haW5kZXIgdG8gdGhlIG1hcHBl
ZCB2aXJ0dWFsIGFkZHJlc3MsCj4+PiB3ZSBoYXZlIHRvIG1hc2sgaXQgb3V0IGJlZm9yZSB1bm1h
cHBpbmcuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNv
dkBlcGFtLmNvbT4KPj4+IC0tLQo+Pj4gICB4ZW4vYXJjaC9hcm0vY3B1ZXJyYXRhLmMgfCAyICst
Cj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pj4K
Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vY3B1ZXJyYXRhLmMgYi94ZW4vYXJjaC9hcm0v
Y3B1ZXJyYXRhLmMKPj4+IGluZGV4IDg5MDQ5MzkuLjZmNDgzYjIgMTAwNjQ0Cj4+PiAtLS0gYS94
ZW4vYXJjaC9hcm0vY3B1ZXJyYXRhLmMKPj4+ICsrKyBiL3hlbi9hcmNoL2FybS9jcHVlcnJhdGEu
Ywo+Pj4gQEAgLTc1LDcgKzc1LDcgQEAgc3RhdGljIGJvb2wgY29weV9oeXBfdmVjdF9icGkodW5z
aWduZWQgaW50IHNsb3QsIGNvbnN0IGNoYXIgKmh5cF92ZWNfc3RhcnQsCj4+PiAgICAgICBjbGVh
bl9kY2FjaGVfdmFfcmFuZ2UoZHN0X3JlbWFwcGVkLCBWRUNUT1JfVEFCTEVfU0laRSk7Cj4+PiAg
ICAgICBpbnZhbGlkYXRlX2ljYWNoZSgpOwo+Pj4gICAKPj4+IC0gICAgdnVubWFwKGRzdF9yZW1h
cHBlZCk7Cj4+PiArICAgIHZ1bm1hcCgodm9pZCAqKSgodmFkZHJfdClkc3RfcmVtYXBwZWQgJiBQ
QUdFX01BU0spKTsKPj4gVGhpcyByZWFsbHkgb3VnaHQgdG8gYmUgdnVubWFwKCkgcGVyZm9ybWlu
ZyB0aGUgcm91bmRpbmcsIHdoaWNoIG1ha2VzIGl0Cj4+IGNvbnNpc3RlbnQgd2l0aCBob3cgeyx1
bn1tYXBfZG9tYWluX3BhZ2UoKSBjdXJyZW50bHkgd29ya3MuCj4+Cj4+IEhvd2V2ZXIgKGZyb20g
aW5zcGVjdGlvbiksIHRoZXJlIGlzIGEgcmVhbCBidWcgaW4gdGhpcyBjb2RlCj4gCj4gQWN0dWFs
bHkgaWdub3JlIG1lLsKgIEknbSB3cm9uZywgYW5kIGNsZWFybHkgY2FuJ3QgcmVhZCBjb2RlLgo+
IAo+IE15IHN1Z2dlc3Rpb24gYWJvdXQgdnVubWFwKCkgc3RpbGwgc3RhbmRzIHRob3VnaC4KCisx
IGZvciB0aGUgdnVubWFwIHNvbHV0aW9uLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
