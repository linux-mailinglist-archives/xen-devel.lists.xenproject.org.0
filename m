Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FF6423F5
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 13:28:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hb1ON-0007Lc-72; Wed, 12 Jun 2019 11:26:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uepN=UL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hb1OM-0007LV-E0
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 11:26:10 +0000
X-Inumbo-ID: de25d810-8d04-11e9-9d7e-03160a273763
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id de25d810-8d04-11e9-9d7e-03160a273763;
 Wed, 12 Jun 2019 11:26:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A021E28;
 Wed, 12 Jun 2019 04:26:05 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C72143F246;
 Wed, 12 Jun 2019 04:27:47 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>,
 Denis Obrezkov <denisobrezkov@gmail.com>
References: <59199da7-40ad-6513-2000-7e10fdbb564b@gmail.com>
 <28b298ba-9acb-5d3b-b4ba-4ef72f4db4be@gmail.com>
 <65e7d353-b587-516e-d167-aa59a1e94f73@gmail.com>
 <alpine.DEB.2.21.1906101329140.8691@sstabellini-ThinkPad-T480s>
 <ba65a0e3-d7c4-f007-1a34-be28561804e5@gmail.com>
 <22ab207e-ae22-2002-35e0-f28177e29c30@arm.com>
 <f3034c36-cb04-b698-5a0e-1d4af3ac8f84@gmail.com>
 <alpine.DEB.2.21.1906110907220.13737@sstabellini-ThinkPad-T480s>
 <4db25be4-195e-6187-e9b8-c1a212429659@gmail.com>
 <987d8bb6-31a1-6d5e-2514-7498423c8c53@gmail.com>
 <alpine.DEB.2.21.1906111515000.13737@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <dca4af7b-6591-cb01-8e75-32438097f65a@arm.com>
Date: Wed, 12 Jun 2019 12:26:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906111515000.13737@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] How to boot domU and dom0 from a device tree
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Hunyue Yau <hy-gsoc@hy-research.com>, Iain Hunter <drhunter95@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KE1vdmluZyBmcm9tIHhlbi11c2VycyB0byB4ZW4tZGV2ZWwpLgoKT24gMTEvMDYvMjAxOSAyMzox
OCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IEkgbWFuYWdlZCB0byByZXByb2R1Y2VkIHRo
ZSBpc3N1ZSwgYW5kIEkga25vdyBob3cgdG8gZ2V0IHBhc3QgaXQuICBUcnkKPiB1c2luZyB0aGUg
cmF3IGtlcm5lbCBJbWFnZSAoYXJjaC9hcm02NC9ib290L0ltYWdlKSBpbnN0ZWFkIG9mIEltYWdl
Lmd6Cj4gZm9yIGRvbTAgYW5kIGRvbVUuIFRoYXQgZml4ZWQgaXQgZm9yIG1lLgo+IAo+IEp1bGll
biwgSSBkaWRuJ3QgbWFuYWdlIHRvIGZpZ3VyZSBvdXQgd2hhdCB0aGUgaXNzdWUgaXMgZXhhY3Rs
eSwgYnV0IGl0Cj4gbG9va3MgbGlrZSBJbWFnZS5neiBsb2FkaW5nIGlzIGJyb2tlbiBhdCB0aGUg
bW9tZW50LgoKRG8geW91IG1lYW4gSW1hZ2UuZ3ogaXMgYnJva2VuIGZyb20gRG9tVT8gQmVjYXVz
ZSBwZXIgdGhlIGxvZyBwcm92aWRlZCBieSBEZW5pcywgCnRoaXMgaXMgd29ya2luZyBwZXJmZWN0
bHkgZm9yIERvbTAgYXMgd2UgZG9uJ3QgY3JlYXRlIGRvbWFpbiBpbiBwYXJhbGxlbC4KCkJ5IHJl
YWRpbmcgdGhlIGNvZGUgSSBjYW4gYWxyZWFkeSBzcG90IHRoZSByZWFzb24gb2YgdGhlIGZpcnN0
IGlzc3VlIHJlcG9ydGVkIGJ5IApEZW5pcy4gRm9yIHJlbWluZGVyLCB0aGlzIGlzIHdoZW4gRG9t
MCBhbmQgRG9tVSBhcmUgdXNpbmcgdGhlIHNhbWUgbW9kdWxlIAphZGRyZXNzIGZvciB0aGUgZ3pp
cCBJbWFnZS4KClRoaXMgaXMgYmVjYXVzZSB3aGVuIHByb2JpbmcgdGhlIGtlcm5lbCBmb3IgRG9t
MCwgdGhlIG1vZHVsZSB3aWxsIGdldCAKdW5jb21wcmVzc2VkIGFuZCB0aGUgbW9kdWxlIHN0YXJ0
L2VuZCB3aWxsIGJlIHVwZGF0ZWQgdG8gcG9pbnQgdG8gdGhlIHVuY29tcHJlc3MgCnZlcnNpb24u
IEJlY2F1c2Ugb2YgdGhhdCwgdGhlIHByb2JlIGZvciBEb21VIGtlcm5lbCB3aWxsIG5vdCBiZSBh
YmxlIHRvIGZpbmQgdGhlIAptb2R1bGUgKHRoZSBzdGFydCBhZGRyZXNzZWQgY2hhbmdlZCkuCgpJ
biB0aGlzIGNhc2UsIEkgdGhpbmsgd2Ugb25seSB3YW50IHRvIHVuY29tcHJlc3MgdGhlIG1vZHVs
ZSBvbmUgdGltZSB0byBhdm9pZCAKd2FzdGluZyBtZW1vcnkuIFRoZSBzb2x1dGlvbiBJIGhhdmUg
aW4gbWluZCByZXF1aXJlcyBzb21lIHJld29yayBpbiBYZW4sIEkgd291bGQgCmFjdHVhbGx5IHN0
YXJ0IGJ5IHByb2JpbmcgdGhlIGluZm9ybWF0aW9uIGZvciBhbGwgdGhlIGRvbWFpbnMsIHRoZW4g
dW5jb21wcmVzcyAKdGhlIGtlcm5lbHMgbW9kdWxlcywgYW5kIHRoZW4gZmluaXNoIHRvIGJ1aWxk
IHRoZSBkb21haW4uCgpGb3IgdGhlIG91dCBvZiBtZW1vcnkgcHJvYmxlbSBkaXNjdXNzZWQgaW4g
dGhpcyBlLW1haWwsIEkgdGhpbmsgdGhlIHByb2JsZW0gaXMgCm5vdCBiZWNhdXNlIG9mIGxhY2sg
b2YgbWVtb3J5IGluIERvbVUuIFRoZSBwcm9ibGVtIGlzIHJlbGF0ZWQgdG8gdGhlIAppbmZsYXRl
L2d1bnppcCB0aGUgY29kZS4gVGhlIGNvZGUgaXMgdXNpbmcgYW4gaGVhcCAoc2VlIHBlcmZvcm1f
Z3VuemlwKSB3aGVyZSBpdCAKYWxsb2NhdGVzIG1lbW9yeSBmcm9tLgoKSSBhbSBhc3N1bWluZyB0
aGUga2VybmVscyBmb3IgRG9tMCBhbmQgRG9tVSBhcmUgZXhhY3RseSB0aGUgc2FtZSBidXQgdGhl
eSBhcmUgCmNvbWluZyBmcm9tIGRpZmZlcmVudCBhZGRyZXNzLiBBbSBJIGNvcnJlY3Q/IElmIHNv
LCBJIGFtIGEgYml0IHVuc3VyZSB0aGlzIAp3b3JrZWQgdGhlIGZpcnN0IHRpbWUgYW5kIG5vdCB0
aGUgc2Vjb25kIHRpbWUuIFRoaXMgcHJvYmFibHkgd2FudCBzb21lIGRlYnVnZ2luZyAKdG8gdW5k
ZXJzdGFuZCB0aGUgcHJvYmxlbS4gRGVuaXMsIFN0ZWZhbm8sIGNhbiBvbmUgb2YgeW91IGxvb2sg
YXQgaXQ/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
