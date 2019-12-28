Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 590B712BD10
	for <lists+xen-devel@lfdr.de>; Sat, 28 Dec 2019 10:01:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1il7vQ-0003zz-2J; Sat, 28 Dec 2019 08:58:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/3VV=2S=huawei.com=xuwei5@srs-us1.protection.inumbo.net>)
 id 1il7vO-0003zu-Co
 for xen-devel@lists.xenproject.org; Sat, 28 Dec 2019 08:58:18 +0000
X-Inumbo-ID: 295c0484-2950-11ea-88e7-bc764e2007e4
Received: from huawei.com (unknown [45.249.212.190])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 295c0484-2950-11ea-88e7-bc764e2007e4;
 Sat, 28 Dec 2019 08:58:07 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 95CAC707D865CA1615D5;
 Sat, 28 Dec 2019 16:58:02 +0800 (CST)
Received: from [127.0.0.1] (10.57.101.250) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Sat, 28 Dec 2019
 16:57:52 +0800
To: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 <xen-devel@lists.xenproject.org>
References: <1577498922-192711-1-git-send-email-xuwei5@hisilicon.com>
 <e96ddb84-db96-5316-05a7-632fed7dddb8@xen.org>
From: Wei Xu <xuwei5@hisilicon.com>
Message-ID: <5E071910.2070002@hisilicon.com>
Date: Sat, 28 Dec 2019 16:57:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <e96ddb84-db96-5316-05a7-632fed7dddb8@xen.org>
X-Originating-IP: [10.57.101.250]
X-CFilter-Loop: Reflected
Subject: Re: [Xen-devel] [PATCH] xen/arm: vgic-v3: Fix the typo of GICD IRQ
 active status range
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
Cc: prime.zeng@hisilicon.com, shameerali.kolothum.thodi@huawei.com,
 linuxarm@huawei.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVsaWVuLAoKT24gMjAxOS8xMi8yOCAxNjowOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhp
LAo+Cj4gT24gMjgvMTIvMjAxOSAwMzowOCwgV2VpIFh1IHdyb3RlOgo+PiBUaGlzIHBhdGNoIGZp
eGVzIHRoZSB0eXBvIGFib3V0IHRoZSBhY3RpdmUgc3RhdHVzIHJhbmdlIG9mIGFuIElSUQo+PiB2
aWEgR0lDRC4gT3RoZXJ3aXNlIGl0IHdpbGwgYmUgZmFpbGVkIHRvIGhhbmRsZSB0aGUgbW1pbyBh
Y2Nlc3MgYW5kCj4+IGluamVjdCBhIGRhdGEgYWJvcnQuCj4gSSBoYXZlIHNlZW4gYSBwYXRjaCBz
aW1pbGFyIGZyb20gTlhQIGEgbW9udGggYWdvIGFuZCBJIGRpc2FncmVlZCBvbiAKPiB0aGUgYXBw
cm9hY2guCj4KPiBJZiB5b3UgbG9vayBhdCB0aGUgY29udGV4dCB5b3UgbW9kaWZlZCwgaXQgc2F5
cyB0aGF0IHJlYWRpbmcgQUNUSVZFUiAKPiBpcyBub3Qgc3VwcG9ydGVkLiBXaGlsZSBJIGFncmVl
IHRoZSBiZWhhdmlvciBpcyBub3QgY29uc2lzdGVudCBhY2Nyb3NzIAo+IEFDVElWRVIsIGluamVj
dGluZyBhIGRhdGEgYWJvcnQgaXMgYSBwZXJmZWN0bHkgZmluZSBiZWhhdmlvciB0byBtZSAKPiAo
dGhvdWdoIG5vdCBzcGVjIGNvbXBsaWFudCkgYXMgd2UgZG9uJ3QgaW1wbGVtZW50IHRoZSByZWdp
c3RlcnMgCj4gY29ycmVjdGx5Lgo+Cj4gSSBndWVzcyB5b3UgYXJlIHNlbmRpbmcgdGhpcyBwYXRj
aCwgYmVjYXVzZSB5b3UgdHJpZWQgTGludXggNS40IChvciAKPiBsYXRlcikgb24gWGVuLCByaWdo
dD8gTGludXggaGFzIHJlY2VudGx5IGJlZ2FuIHRvIHJlYWQgQUNUSVZFUiB0byAKPiBjaGVjayB3
aGV0aGVyIGFuIElSUSBpcyBhY3RpdmUgYXQgdGhlIEhXIGxldmVsIGR1cmluZyB0aGUgCj4gc3lu
Y2hyb25pemluZyBvZiB0aGUgSVJRUy4gRnJvbSBteSB1bmRlcnN0YW5kaW5nLCB0aGlzIGlzIHVz
ZWQgYmVjYXVzZSAKPiB0aGVyZSBpcyBhIHdpbmRvdyB3aGVyZSB0aGUgaW50ZXJydXB0IGlzIGFj
dGl2ZSBhdCB0aGUgSFcgbGV2ZWwgYnV0IAo+IHRoZSBMaW51eCBJUlEgc3Vic3lzdGVtIGlzIG5v
dCBhd2FyZSBvZiBpdC4KPgo+IFdoaWxlIHRoZSBwYXRjaCBiZWxvdyB3aWxsIGFsbG93IExpbnV4
IDUuNCB0byBub3QgY3Jhc2gsIGl0IGlzIG5vdCAKPiBnb2luZyB0byBtYWtlIGl0IGZseSB2ZXJ5
IGZhciBiZWNhdXNlIG9mIHRoZSBhYm92ZS4gU28gSSBhbSByYXRoZXIgbm90IAo+IGhhcHB5IHdp
dGggcGVyc3Vpbmcgd2l0aCByZXR1cm5pbmcgMC4KPgoKWWVzLCBJIGFtIHVzaW5nIExpbnV4IDUu
NS1yYzIgOikKR290IGl0IGFuZCB0aGFua3MgZm9yIHRoZSBleHBsYW5hdGlvbi4KSSBhbSBub3Qg
aW5zaXN0ZW50IG9uIHRoaXMgYW5kIE9LIHRvIHdhaXQgZm9yIHRoZSB1cGRhdGUuClRoYW5rcyBh
bmQgaGF2ZSBhIHZlcnkgaGFwcHkgbmV3IHllYXIhCgpCZXN0IFJlZ2FyZHMsCldlaQoKPiBAU3Rl
ZmFubywgeW91IG1lbnRpb24geW91IHdpbGwgbG9vayBhdCBpbXBsZW1lbnRpbmcgQUNUSVZFUi4g
V2hhdCdzIAo+IHRoZSBzdGF0ZT8KPgo+ID4KPj4gRml4ZXM6IGEyYjgzZjk1YmZhZCAoInhlbi9h
cm06IHZnaWM6IFByb3Blcmx5IGVtdWxhdGUgdGhlIGZ1bGwgCj4+IHJlZ2lzdGVyIikKPj4KPj4g
U2lnbmVkLW9mZi1ieTogV2VpIFh1IDx4dXdlaTVAaGlzaWxpY29uLmNvbT4KPj4gLS0tCj4+ICAg
eGVuL2FyY2gvYXJtL3ZnaWMtdjMuYyB8IDIgKy0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS92
Z2ljLXYzLmMgYi94ZW4vYXJjaC9hcm0vdmdpYy12My5jCj4+IGluZGV4IDQyMmI5NGYuLmU4MDJm
MjAgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9hcmNoL2FybS92Z2ljLXYzLmMKPj4gKysrIGIveGVuL2Fy
Y2gvYXJtL3ZnaWMtdjMuYwo+PiBAQCAtNzA2LDcgKzcwNiw3IEBAIHN0YXRpYyBpbnQgX192Z2lj
X3YzX2Rpc3RyX2NvbW1vbl9tbWlvX3JlYWQoY29uc3QgCj4+IGNoYXIgKm5hbWUsIHN0cnVjdCB2
Y3B1ICp2LAo+PiAgICAgICAgICAgZ290byByZWFkX2FzX3plcm87Cj4+ICAgICAgICAgLyogUmVh
ZCB0aGUgYWN0aXZlIHN0YXR1cyBvZiBhbiBJUlEgdmlhIEdJQ0QvR0lDUiBpcyBub3QgCj4+IHN1
cHBvcnRlZCAqLwo+PiAtICAgIGNhc2UgVlJBTkdFMzIoR0lDRF9JU0FDVElWRVIsIEdJQ0RfSVNB
Q1RJVkVSKToKPj4gKyAgICBjYXNlIFZSQU5HRTMyKEdJQ0RfSVNBQ1RJVkVSLCBHSUNEX0lTQUNU
SVZFUk4pOgo+PiAgICAgICBjYXNlIFZSQU5HRTMyKEdJQ0RfSUNBQ1RJVkVSLCBHSUNEX0lDQUNU
SVZFUk4pOgo+PiAgICAgICAgICAgZ290byByZWFkX2FzX3plcm87Cj4+Cj4KPiBDaGVlcnMsCj4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
