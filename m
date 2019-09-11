Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C57F9AFA9F
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 12:40:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i800s-0001Cs-Ax; Wed, 11 Sep 2019 10:38:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VrDL=XG=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i800q-0001Cn-Ri
 for xen-devel@lists.xen.org; Wed, 11 Sep 2019 10:38:12 +0000
X-Inumbo-ID: 40753b06-d480-11e9-b299-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 40753b06-d480-11e9-b299-bc764e2007e4;
 Wed, 11 Sep 2019 10:38:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2355528;
 Wed, 11 Sep 2019 03:38:11 -0700 (PDT)
Received: from [10.37.12.223] (unknown [10.37.12.223])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 891B93F59C;
 Wed, 11 Sep 2019 03:38:08 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1908201838370.20094@sstabellini-ThinkPad-T480s>
 <20190821035315.12812-7-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <8e13c7ad-c3cb-aa46-744b-8dc01fe70718@arm.com>
Date: Wed, 11 Sep 2019 11:38:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821035315.12812-7-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 7/8] xen/arm: introduce nr_spis
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

SGkgU3RlZmFubywKCk9uIDgvMjEvMTkgNDo1MyBBTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IFdlIGRvbid0IGhhdmUgYSBjbGVhciB3YXkgdG8ga25vdyBob3cgbWFueSB2aXJ0dWFsIFNQ
SXMgd2UgbmVlZCBmb3IgdGhlCj4gZG9tMC1sZXNzIGRvbWFpbnMuIEludHJvZHVjZSBhIG5ldyBv
cHRpb24gdW5kZXIgeGVuLGRvbWFpbiB0byBzcGVjaWZ5Cj4gdGhlIG51bWJlciBvZiBTUElzIHRv
IGFsbG9jYXRlIGZvciBhIGRvbWFpbi4KPiAKPiBUaGUgcHJvcGVydHkgaXMgb3B0aW9uYWwuIFdo
ZW4gYWJzZW50LCB3ZSdsbCB1c2UgdGhlIHBoeXNpY2FsIG51bWJlciBvZgo+IEdJQyBsaW5lcyBm
b3IgZG9tMC1sZXNzIGRvbWFpbnMsIGp1c3QgbGlrZSBmb3IgZG9tMC4gR2l2ZW4gdGhhdAo+IGRv
bTAtbGVzcyBWTXMgYXJlIG1lYW50IGZvciBzdGF0aWMgcGFydGl0aW9uaW5nIHNjZW5hcmlvcyB3
aGVyZSB0aGUKPiBudW1iZXIgb2YgVk1zIGlzIHZlcnkgbG93LCBpbmNyZWFzZWQgbWVtb3J5IG92
ZXJoZWFkIHNob3VsZCBub3QgYmUgYQo+IHByb2JsZW0sIGFuZCBpdCBpcyBwb3NzaWJsZSB0byBt
aW5pbWl6ZSBpdCB1c2luZyAibnJfc3BpcyIuCj4gCj4gUmVtb3ZlIHRoZSBvbGQgc2V0dGluZyBv
ZiBucl9zcGlzIGJhc2VkIG9uIHRoZSBwcmVzZW5jZSBvZiB0aGUgdnBsMDExLgoKSSBhbSBhZnJh
aWQgdGhpcyBzdGlsbCBkb2VzIG5vdCBleHBsYWluIHRoZSBpbXBsaWNhdGlvbnMgb2YgdGhpcyBw
YXRjaCAKdG8gY3VycmVudCBzZXR1cCAod2l0aCBhbmQgd2l0aG91dCBWUEwwMTEpLgoKRm9yIGlu
c3RhbmNlLCB3aXRoIHlvdXIgY2hhbmdlLCBWUEwwMTEgbWF5IG5vdCB3b3JrIGFueW1vcmUuIElt
YWdpbmUgd2UgCmRlY2lkZSB0byBwdXNoIHRoZSB2cGwwMTEgaW50ZXJydXB0IHRvd2FyZHMgdGhl
IGVuZCBvZiB0aGUgSW50ZXJydXB0IElEIApzcGFjZSAoaS5lLiAxMDE5KS4KCkkgZG9uJ3QgdGhp
bmsgd2Ugd2FudCB0aGUgdXNlciB0byBoYXZlIHRvIHNlbGVjdCBucl9zcGlzIGJ5IGhpbXNlbGYg
Zm9yIAp0aGlzIGNhc2UuCgpSZWdhcmRpbmcgdGhlIGNoYW5nZSB3aXRob3V0IHZwbDAxMSwgdGhp
cyBpcyBub3QgZXhwbGFpbmVkIHdoeSBhbGwgdGhlIApkb21haW5zIChldmVuIHRoZSBvbmUgd2l0
aG91dCBTUElzIHJvdXRlZCkgd2lsbCBoYXZlIFNQSXMgZXhwb3NlZC4gRm9yIAppbnN0YW5jZSwg
aWYgeW91IHdlcmUgdG8gZXhwb3NlIDI1NiBpbnRlcnJ1cHRzIGZvciA0IGRvbWFpbnMsIHRoaXMg
d2lsbCAKcm91Z2hseSB1c2UgODBLQiBvZiBtZW1vcnkuIEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyB3
aGF0IHlvdSBoYWQgaW4gbWluZCAKYXMgImxvdyBmb290cHJpbnQiLgoKQ2hlZXJzLAoKLS0gCkp1
bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
