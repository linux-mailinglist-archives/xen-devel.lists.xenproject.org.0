Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 712B0644A1
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2019 11:48:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hl9Ad-0006Af-E2; Wed, 10 Jul 2019 09:45:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iApL=VH=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hl9Ab-0006Aa-KL
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 09:45:49 +0000
X-Inumbo-ID: 7e833a05-a2f7-11e9-8980-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7e833a05-a2f7-11e9-8980-bc764e045a96;
 Wed, 10 Jul 2019 09:45:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2DC0B7FDF9;
 Wed, 10 Jul 2019 09:45:47 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-117-153.ams2.redhat.com
 [10.36.117.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5A91838E6;
 Wed, 10 Jul 2019 09:45:45 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>, devel@edk2.groups.io
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <20190704144233.27968-29-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <510fba40-da71-e414-bd1a-8c374da8dcc3@redhat.com>
Date: Wed, 10 Jul 2019 11:45:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190704144233.27968-29-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Wed, 10 Jul 2019 09:45:47 +0000 (UTC)
Subject: Re: [Xen-devel] [PATCH v3 28/35] OvmfPkg/PlatformBootManagerLib:
 Use XenDetected from XenPlatformLib
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMDQvMTkgMTY6NDIsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IFJlcGxhY2UgdGhlIFhl
bkRldGVjdGVkKCkgaW1wbGVtZW50YXRpb24gYnkgdGhlIG9uZSBmcm9tCj4gWGVuUGxhdGZvcm1M
aWIuCj4gCj4gUmVmOiBodHRwczovL2J1Z3ppbGxhLnRpYW5vY29yZS5vcmcvc2hvd19idWcuY2dp
P2lkPTE2ODkKPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRA
Y2l0cml4LmNvbT4KPiAtLS0KPiAKPiBOb3RlczoKPiAgICAgdjM6Cj4gICAgIC0gbmV3IHBhdGNo
Cj4gCj4gIC4uLi9QbGF0Zm9ybUJvb3RNYW5hZ2VyTGliLmluZiAgICAgICAgICAgICAgICB8ICAx
ICsKPiAgLi4uL1BsYXRmb3JtQm9vdE1hbmFnZXJMaWIvQmRzUGxhdGZvcm0uYyAgICAgIHwgMzMg
Ky0tLS0tLS0tLS0tLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MzIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL092bWZQa2cvTGlicmFyeS9QbGF0Zm9y
bUJvb3RNYW5hZ2VyTGliL1BsYXRmb3JtQm9vdE1hbmFnZXJMaWIuaW5mIGIvT3ZtZlBrZy9MaWJy
YXJ5L1BsYXRmb3JtQm9vdE1hbmFnZXJMaWIvUGxhdGZvcm1Cb290TWFuYWdlckxpYi5pbmYKPiBp
bmRleCAwNjBhM2FiNGM1Li5iMmQzYjRmYjRkIDEwMDY0NAo+IC0tLSBhL092bWZQa2cvTGlicmFy
eS9QbGF0Zm9ybUJvb3RNYW5hZ2VyTGliL1BsYXRmb3JtQm9vdE1hbmFnZXJMaWIuaW5mCj4gKysr
IGIvT3ZtZlBrZy9MaWJyYXJ5L1BsYXRmb3JtQm9vdE1hbmFnZXJMaWIvUGxhdGZvcm1Cb290TWFu
YWdlckxpYi5pbmYKPiBAQCAtNTQsNiArNTQsNyBAQCBbTGlicmFyeUNsYXNzZXNdCj4gICAgVWVm
aUxpYgo+ICAgIFBsYXRmb3JtQm1QcmludFNjTGliCj4gICAgVGNnMlBoeXNpY2FsUHJlc2VuY2VM
aWIKPiArICBYZW5QbGF0Zm9ybUxpYgo+ICAKPiAgW1BjZF0KPiAgICBnVWVmaU92bWZQa2dUb2tl
blNwYWNlR3VpZC5QY2RFbXVWYXJpYWJsZUV2ZW50Cj4gZGlmZiAtLWdpdCBhL092bWZQa2cvTGli
cmFyeS9QbGF0Zm9ybUJvb3RNYW5hZ2VyTGliL0Jkc1BsYXRmb3JtLmMgYi9Pdm1mUGtnL0xpYnJh
cnkvUGxhdGZvcm1Cb290TWFuYWdlckxpYi9CZHNQbGF0Zm9ybS5jCj4gaW5kZXggNzk3NzMxYTQx
Yy4uZTMyOTY5ZTYzZSAxMDA2NDQKPiAtLS0gYS9Pdm1mUGtnL0xpYnJhcnkvUGxhdGZvcm1Cb290
TWFuYWdlckxpYi9CZHNQbGF0Zm9ybS5jCj4gKysrIGIvT3ZtZlBrZy9MaWJyYXJ5L1BsYXRmb3Jt
Qm9vdE1hbmFnZXJMaWIvQmRzUGxhdGZvcm0uYwo+IEBAIC0xMiw2ICsxMiw3IEBACj4gICNpbmNs
dWRlIDxQcm90b2NvbC9GaXJtd2FyZVZvbHVtZTIuaD4KPiAgI2luY2x1ZGUgPExpYnJhcnkvUGxh
dGZvcm1CbVByaW50U2NMaWIuaD4KPiAgI2luY2x1ZGUgPExpYnJhcnkvVGNnMlBoeXNpY2FsUHJl
c2VuY2VMaWIuaD4KPiArI2luY2x1ZGUgPExpYnJhcnkvWGVuUGxhdGZvcm1MaWIuaD4KPiAgCj4g
IAo+ICAvLwo+IEBAIC0xMjI1LDM4ICsxMjI2LDYgQEAgUGNpQWNwaUluaXRpYWxpemF0aW9uICgK
PiAgICBJb09yMTYgKChQY2lSZWFkMzIgKFBtYmEpICYgfkJJVDApICsgNCwgQklUMCk7Cj4gIH0K
PiAgCj4gLS8qKgo+IC0gIFRoaXMgZnVuY3Rpb24gZGV0ZWN0cyBpZiBPVk1GIGlzIHJ1bm5pbmcg
b24gWGVuLgo+IC0KPiAtKiovCj4gLVNUQVRJQwo+IC1CT09MRUFOCj4gLVhlbkRldGVjdGVkICgK
PiAtICBWT0lECj4gLSAgKQo+IC17Cj4gLSAgRUZJX0hPQl9HVUlEX1RZUEUgICAgICAgICAqR3Vp
ZEhvYjsKPiAtICBTVEFUSUMgSU5UTiAgICAgICAgICAgICAgIEZvdW5kSG9iID0gLTE7Cj4gLQo+
IC0gIGlmIChGb3VuZEhvYiA9PSAwKSB7Cj4gLSAgICByZXR1cm4gRkFMU0U7Cj4gLSAgfSBlbHNl
IGlmIChGb3VuZEhvYiA9PSAxKSB7Cj4gLSAgICByZXR1cm4gVFJVRTsKPiAtICB9Cj4gLQo+IC0g
IC8vCj4gLSAgLy8gU2VlIGlmIGEgWGVuSW5mbyBIT0IgaXMgYXZhaWxhYmxlCj4gLSAgLy8KPiAt
ICBHdWlkSG9iID0gR2V0Rmlyc3RHdWlkSG9iICgmZ0VmaVhlbkluZm9HdWlkKTsKPiAtICBpZiAo
R3VpZEhvYiA9PSBOVUxMKSB7Cj4gLSAgICBGb3VuZEhvYiA9IDA7Cj4gLSAgICByZXR1cm4gRkFM
U0U7Cj4gLSAgfQo+IC0KPiAtICBGb3VuZEhvYiA9IDE7Cj4gLSAgcmV0dXJuIFRSVUU7Cj4gLX0K
PiAtCj4gIEVGSV9TVEFUVVMKPiAgRUZJQVBJCj4gIENvbm5lY3RSZWN1cnNpdmVseUlmUGNpTWFz
c1N0b3JhZ2UgKAo+IAoKSXMgaXQgcG9zc2libGUgdG8gY2xlYW4gdXAgdGhlIHJlbWFpbmluZyBj
b2RlIGEgYml0IG1vcmUsIHN1Y2ggYXM6CgooMSkgcmVtb3ZpbmcKCiNpbmNsdWRlIDxHdWlkL1hl
bkluZm8uaD4KCmZyb20gIkJkc1BsYXRmb3JtLmMiLAoKKDIpIHJlbW92aW5nICJnRWZpWGVuSW5m
b0d1aWQiIGZyb20gW0d1aWRzXSBpbiAiUGxhdGZvcm1Cb290TWFuYWdlckxpYi5pbmYiPwoKV2l0
aCB0aG9zZToKClJldmlld2VkLWJ5OiBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgoK
VGhhbmtzCkxhc3psbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
