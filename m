Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC92D115837
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2019 21:34:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idKHF-0006lQ-B2; Fri, 06 Dec 2019 20:32:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=70kE=Z4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1idKHE-0006lL-1A
 for xen-devel@lists.xen.org; Fri, 06 Dec 2019 20:32:36 +0000
X-Inumbo-ID: 893277b6-1867-11ea-88e7-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 893277b6-1867-11ea-88e7-bc764e2007e4;
 Fri, 06 Dec 2019 20:32:35 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8495321835;
 Fri,  6 Dec 2019 20:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575664354;
 bh=mYXDevNbiGpiR7KOYoDTQJ9DMS+zN4nU+kJy39u209c=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=j2vYJU8IaEjRaqz4K0VvHn6VanU/iycvGP5tPsAzWRC4IpT+rmSa3eALMll8PbCjb
 b+48YRkIPyVlV8R3vc9d06f7xWROu1f9omzErXW3pQ7seUSMpzB7IuYm9fUGLzR1eM
 UqYFswzSiY8y38kcwLdqG4tatXH8rg8DpZHijDnI=
Date: Fri, 6 Dec 2019 12:32:34 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Ian Jackson <ian.jackson@citrix.com>
In-Reply-To: <24042.39208.563484.2274@mariner.uk.xensource.com>
Message-ID: <alpine.DEB.2.21.1912061220420.12799@sstabellini-ThinkPad-T480s>
References: <24042.34323.159917.173963@mariner.uk.xensource.com>
 <b199414b-dbe6-2d0d-bd97-e5bafb402c47@xen.org>
 <24042.39208.563484.2274@mariner.uk.xensource.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] Problem booting Debian buster on arndale
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
Cc: brian.woods@xilinx.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCA2IERlYyAyMDE5LCBJYW4gSmFja3NvbiB3cm90ZToKPiBKdWxpZW4gR3JhbGwgd3Jp
dGVzICgiUmU6IFByb2JsZW0gYm9vdGluZyBEZWJpYW4gYnVzdGVyIG9uIGFybmRhbGUiKToKPiA+
IE9uIDA2LzEyLzIwMTkgMTY6NDcsIElhbiBKYWNrc29uIHdyb3RlOgo+ID4gPiBJdCBzZWVtcyB0
byBoYXZlIGh1bmcgZHVyaW5nIGJvb3QuICBOQiB0aGF0IEkgZG9uJ3Qga25vdyB3aGV0aGVyIHRo
aXMKPiA+ID4gaXMgYSBvbmUtb2ZmLgo+ID4gCj4gPiBMb29raW5nIGF0IFsxXSwgbW9zdCBvZiB0
aGUgcmVjZW50IGZsaWdodCBoYXZlIG1hbmFnZWQgdG8gYm9vdCBYZW4gb24gCj4gPiB0aGUgYXJu
ZGFsZS4gSG93ZXZlciwgSSBzb21laG93IGNhbid0IGZpbmQgdGhlIGZsaWdodCAxNDQzMTIgaW4g
dGhhdCAKPiA+IGxpc3QuIERvIHlvdSBoYXZlIGFueSBpZGVhIHdoeT8KPiAKPiBUaGUgZmxpZ2h0
IGluIHF1ZXN0aW9uIHdhcyBub3Qgb24gdGhlIHhlbi11bnN0YWJsZSAiYnJhbmNoIiwgYW5kIG5v
dAo+IG9mZmljaWFsbHkgYmxlc3NlZCwgYmVjYXVzZSBpdCdzIHBhcnQgb2YgbXkgYnVzdGVyIHdv
cmsuCj4gCj4gSSBmb3VuZCBhIHNlY29uZCBpbnN0YW5jZSBpbiB0aGUgc2FtZSBmbGlnaHQ6Cj4g
ICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQ0MzEy
L3Rlc3QtYXJtaGYtYXJtaGYtZXhhbWluZS9pbmZvLmh0bWwKPiAKPiBJIHRoaW5rIGl0IG11c3Qg
YmUgc3BlY2lmaWMgdG8gYnVzdGVyLCBidXQgdGhhdCBpcyByYXRoZXIgbXlzdGVyaW91cy4KPiBB
ZnRlciBhbGwgaXQgaXMgc3VwcG9zZWQgdG8gYmUgdGhlIHNhbWUga2VybmVsIGFuZCBYZW4gYXMg
dGhlIGN1cnJlbnQKPiBvc3N0ZXN0IG1haW5saW5lIGlzIHVzaW5nLiAgTWF5YmUgdGhlIG5ldyBj
b21waWxlciBpcyBkb2luZyBzb21ldGhpbmcKPiB1bmV4cGVjdGVkLgoKVGhhdCdzIHZlcnkgaW50
ZXJlc3RpbmcgYW5kIG15c3RlcmlvdXMgaW5kZWVkIQoKTGV0IG1lIHN1bW1hcml6ZSB0aGUgc2l0
dWF0aW9uIGZvciBjbGFyaXR5LiBEZWJpYW4gQnVzdGVyIGNhbiBpbnN0YWxsIG9uCkFybmRhbGUg
Y29ycmVjdGx5LiBJdCBidWlsZHMgb24gdGFyZ2V0IFhlbiBhbmQgTGludXgsIGJhc2VkIG9uIHRo
ZQpwcm92aWRlZCBicmFuY2hlcy4gVGhlIGJpbmFyaWVzIHByb2R1Y2VkIGJ5IHRoZSBidWlsZCBv
ZiBYZW4gYW5kIExpbnV4CmZhaWwgdG8gYm9vdCBjb3JyZWN0bHkgb24gQXJuZGFsZSwgZXZlbiB0
aG91Z2ggdGhlIHNhbWUgdmVyc2lvbiBvZiBMaW51eAphbmQgWGVuIGhhdmUgYmVlbiB0ZXN0ZWQg
c3VjY2Vzc2Z1bGx5IHByZXZpb3VzbHkgb24gQXJuZGFsZSBhcyBwYXJ0IG9mCnJlZ3VsYXIgT1NT
VGVzdCBydW5zLiBZZWFoLCBJIGNhbm5vdCBtYWtlIGFueSBzZW5zZSBvZiB0aGF0IDotLwoKSSBh
c3N1bWUgdGhhdCB0aGUgZGV2aWNlIHRyZWUgdXNlZCBpcyBzdGlsbCBhbHNvIHRoZSBzYW1lPwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
