Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D02C883C4
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 22:20:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hwBKG-0004GC-Ea; Fri, 09 Aug 2019 20:17:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5OiB=WF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hwBKF-0004G7-QD
 for xen-devel@lists.xen.org; Fri, 09 Aug 2019 20:17:23 +0000
X-Inumbo-ID: b0407309-bae2-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id b0407309-bae2-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 20:17:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C5D81596;
 Fri,  9 Aug 2019 13:17:19 -0700 (PDT)
Received: from [10.37.8.74] (unknown [10.37.8.74])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 234CD3F706;
 Fri,  9 Aug 2019 13:17:17 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1908081609510.22196@sstabellini-ThinkPad-T480s>
 <20190808231242.26424-5-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <7715e474-0102-d7fe-7cd6-e26404280d57@arm.com>
Date: Fri, 9 Aug 2019 21:17:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808231242.26424-5-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 5/6] xen/arm: introduce nr_spis
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
Cc: Volodymyr_Babchuk@epam.com, Achin.Gupta@arm.com, andrii_anisov@epam.com,
 Stefano Stabellini <stefanos@xilinx.com>, xen-devel@lists.xen.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDgvOS8xOSAxMjoxMiBBTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IFdlIGRvbid0IGhhdmUgYSBjbGVhciB3YXkgdG8ga25vdyBob3cgbWFueSB2aXJ0dWFsIFNQ
SXMgd2UgbmVlZCBmb3IgdGhlCj4gYm9vdCBkb21haW5zLiBJbnRyb2R1Y2UgYSBuZXcgb3B0aW9u
IHVuZGVyIHhlbixkb21haW4gdG8gc3BlY2lmeSB0aGUKPiBudW1iZXIgb2YgU1BJcyB0byBhbGxv
Y2F0ZSBmb3IgdGhlIGRvbWFpbi4KPiAKPiBUaGUgcHJvcGVydHkgaXMgb3B0aW9uYWwsIHdoZW4g
YWJzZW50LCB3ZSdsbCB1c2UgdGhlIHBoeXNpY2FsIG51bWJlciBvZgo+IGdpYyBsaW5lcyBmb3Ig
ZG9tMGxlc3MgZG9tYWlucywganVzdCBsaWtlIGZvciBkb20wLiBHaXZlbiB0aGF0IGRvbTBsZXNz
Cj4gVk1zIGFyZSBtZWFudCBmb3Igc3RhdGljIHBhcnRpdGlvbmluZyBzY2VuYXJpb3Mgd2hlcmUg
dGhlIG51bWJlciBvZiBWTXMKPiBpcyB2ZXJ5IGxvdywgaW5jcmVhc2VkIG1lbW9yeSBvdmVyaGVh
ZCBzaG91bGQgbm90IGJlIGEgcHJvYmxlbSwgYW5kIGl0Cj4gaXMgcG9zc2libGUgdG8gbWluaW1p
emluZyBpdCBieSB1c2luZyAibnJfc3BpcyIuCj4gCj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBT
dGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgo+IC0tLQo+IENoYW5nZXMgaW4gdjM6Cj4g
LSBpbXByb3ZlIGNvbW1pdCBtZXNzYWdlCj4gLSBpbnRyb2R1Y2UgbnJfc3Bpcwo+IC0tLQo+ICAg
eGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgNyArKystLS0tCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4v
YXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiBp
bmRleCAwMDU3YTUwOWQxLi5mYzRlNWJjNGNhIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9k
b21haW5fYnVpbGQuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+IEBAIC0y
MjcwLDcgKzIyNzAsNiBAQCB2b2lkIF9faW5pdCBjcmVhdGVfZG9tVXModm9pZCkKPiAgICAgICAg
ICAgc3RydWN0IGRvbWFpbiAqZDsKPiAgICAgICAgICAgc3RydWN0IHhlbl9kb21jdGxfY3JlYXRl
ZG9tYWluIGRfY2ZnID0gewo+ICAgICAgICAgICAgICAgLmFyY2guZ2ljX3ZlcnNpb24gPSBYRU5f
RE9NQ1RMX0NPTkZJR19HSUNfTkFUSVZFLAo+IC0gICAgICAgICAgICAuYXJjaC5ucl9zcGlzID0g
MCwKPiAgICAgICAgICAgICAgIC5mbGFncyA9IFhFTl9ET01DVExfQ0RGX2h2bV9ndWVzdCB8IFhF
Tl9ET01DVExfQ0RGX2hhcCwKPiAgICAgICAgICAgICAgIC5tYXhfZXZ0Y2huX3BvcnQgPSAtMSwK
PiAgICAgICAgICAgICAgIC5tYXhfZ3JhbnRfZnJhbWVzID0gNjQsCj4gQEAgLTIyODAsMTMgKzIy
NzksMTMgQEAgdm9pZCBfX2luaXQgY3JlYXRlX2RvbVVzKHZvaWQpCj4gICAgICAgICAgIGlmICgg
IWR0X2RldmljZV9pc19jb21wYXRpYmxlKG5vZGUsICJ4ZW4sZG9tYWluIikgKQo+ICAgICAgICAg
ICAgICAgY29udGludWU7Cj4gICAKPiAtICAgICAgICBpZiAoIGR0X3Byb3BlcnR5X3JlYWRfYm9v
bChub2RlLCAidnBsMDExIikgKQo+IC0gICAgICAgICAgICBkX2NmZy5hcmNoLm5yX3NwaXMgPSBH
VUVTVF9WUEwwMTFfU1BJIC0gMzIgKyAxOwo+IC0KClRoaXMgY2hhbmdlIGlzIG5vdCBzcGVjaWZp
ZWQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIG5vciB0aGUgZG9jdW1lbnRhdGlvbi4KClRoaXMgd2ls
bCBsaWtlbHkgbGVhZCB0byBzb21lIGlzc3VlcyBpZiB0aGUgbnVtYmVyIG9mIFNQSXMgcHJvZ3Jh
bW1lZCAKKGVpdGhlciBmcm9tIHRoZSBEVCBvciB0aGUgSGFyZHdhcmUpIGlzIHNtYWxsZXIgdGhh
biB0aGUgdGhlIFNQSSBoZXJlLgoKRnVydGhlbW9yZSwgaXQgaXMgaW1wb3J0YW50IHRvIHdyaXRl
IGRvd24gaW4gdGhlIGRvY3VtZW50YXRpb24gdGhhdCB0aGUgClNQSSB1c2VkIGJ5IHZwbDAxMSBt
YXkgY2xhc2ggd2l0aCBhIGRldmljZSBpbnRlcnJ1cHQgcm91dGVkIHRvIHRoZSBndWVzdC4KCj4g
ICAgICAgICAgIGlmICggIWR0X3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICJjcHVzIiwgJmRfY2Zn
Lm1heF92Y3B1cykgKQo+ICAgICAgICAgICAgICAgcGFuaWMoIk1pc3NpbmcgcHJvcGVydHkgJ2Nw
dXMnIGZvciBkb21haW4gJXNcbiIsCj4gICAgICAgICAgICAgICAgICAgICBkdF9ub2RlX25hbWUo
bm9kZSkpOwo+ICAgCj4gKyAgICAgICAgaWYgKCAhZHRfcHJvcGVydHlfcmVhZF91MzIobm9kZSwg
Im5yX3NwaXMiLCAmZF9jZmcuYXJjaC5ucl9zcGlzKSApCj4gKyAgICAgICAgICAgIGRfY2ZnLmFy
Y2gubnJfc3BpcyA9IGdpY19udW1iZXJfbGluZXMoKSAtIDMyOwo+ICsKPiAgICAgICAgICAgZCA9
IGRvbWFpbl9jcmVhdGUoKyttYXhfaW5pdF9kb21pZCwgJmRfY2ZnLCBmYWxzZSk7Cj4gICAgICAg
ICAgIGlmICggSVNfRVJSKGQpICkKPiAgICAgICAgICAgICAgIHBhbmljKCJFcnJvciBjcmVhdGlu
ZyBkb21haW4gJXNcbiIsIGR0X25vZGVfbmFtZShub2RlKSk7Cj4gCgpDaGVlcnMsCgotLSAKSnVs
aWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
