Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5ED4E3A7
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 11:35:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heFv7-0007JO-4L; Fri, 21 Jun 2019 09:33:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xCuY=UU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1heFv4-0007J9-PP
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 09:33:18 +0000
X-Inumbo-ID: 98295ecc-9407-11e9-9756-83d26af72e52
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 98295ecc-9407-11e9-9756-83d26af72e52;
 Fri, 21 Jun 2019 09:33:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C331C142F;
 Fri, 21 Jun 2019 02:33:14 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 370303F246;
 Fri, 21 Jun 2019 02:33:14 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190620154952.31286-1-volodymyr_babchuk@epam.com>
 <alpine.DEB.2.21.1906201727410.2677@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <18536549-b7b2-5b41-48de-3b2802b6df76@arm.com>
Date: Fri, 21 Jun 2019 10:33:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906201727410.2677@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: optee: fix compilation with GCC 4.8
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefanos@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyMS8wNi8yMDE5IDAxOjI4LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24gVGh1
LCAyMCBKdW4gMjAxOSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+IEdDQyA0LjggaXMgdW5h
YmxlIHRvIHNlZSB0aGF0IHZhcmlhYmxlcyBndWVzdF9wZywgZ3Vlc3RfZGF0YSBhbmQKPj4geGVu
X2RhdGEgd2lsbCBiZSBhbHdheXMgaW5pdGlhbGl6ZWQgYmVmb3JlIGFjY2Vzcywgc28gd2UgbmVl
ZCB0bwo+PiBpbml0aWFsaXplIHRoZW0gZWFybGllci4KPj4KPj4gU3VnZ2VzdGVkLWJ5OiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IFZv
bG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4KPiAKPiBJIHZlcmlm
aWVkIHRoYXQgaXQgd29ya3MgY29ycmVjdGx5LiBUaGFua3MgZm9yIHRoZSBwYXRjaCEgIChKdWxp
ZW4sIEkKPiBkaWRuJ3QgY29tbWl0IGl0IHlldCB0byBnaXZlIHlvdSBhIGNoYW5jZSB0byBnaXZl
IGl0IGEgbG9vayB0b28uKQo+IAo+IFJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3Jh
bGxAYXJtLmNvbT4KCkkgaGF2ZSBjb21taXR0ZWQgaXQgbm93LgoKQ2hlZXJzLAoKLS0gCkp1bGll
biBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
