Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EC73BC45
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 20:57:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haPQF-0004Rx-PZ; Mon, 10 Jun 2019 18:53:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7+2=UJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1haPQE-0004Rs-P0
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 18:53:34 +0000
X-Inumbo-ID: 0a4fbb0e-8bb1-11e9-9ff4-031e95cd536c
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0a4fbb0e-8bb1-11e9-9ff4-031e95cd536c;
 Mon, 10 Jun 2019 18:53:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF098337;
 Mon, 10 Jun 2019 11:53:30 -0700 (PDT)
Received: from [10.37.10.2] (unknown [10.37.10.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C2F2D3F246;
 Mon, 10 Jun 2019 11:53:29 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190521212530.12706-1-volodymyr_babchuk@epam.com>
 <20190521212530.12706-3-volodymyr_babchuk@epam.com>
 <1908edda-cdc9-0550-1d56-0332ba91daec@arm.com> <87zhmp715i.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <22e0456b-4dd9-5458-57d6-3a9a519629bd@arm.com>
Date: Mon, 10 Jun 2019 19:53:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87zhmp715i.fsf@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 02/10] xen/arm: optee: add OP-TEE header
 files
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
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiA2LzEwLzE5IDc6MjAgUE0sIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+IAo+IEhpIEp1
bGllbiwKCkhpLAoKPiBKdWxpZW4gR3JhbGwgd3JpdGVzOgo+IAo+PiBIaSwKPj4KPj4gT24gMjEv
MDUvMjAxOSAyMjoyNSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+PiBUaGlzIGhlYWRlciBm
aWxlcyBkZXNjcmliZXMgcHJvdG9jb2wgYmV0d2VlbiBPUC1URUUgYW5kIE9QLVRFRSBjbGllbnQK
Pj4+IGRyaXZlciBpbiBMaW51eC4gVGhleSBhcmUgbmVlZGVkIGZvciB1cGNvbWluZyBPUC1URUUg
bWVkaWF0b3IsIHdoaWNoCj4+PiBpcyBhZGRlZCBpbiB0aGUgbmV4dCBwYXRjaC4KPj4+IFJlYXNv
biB0byBhZGQgdGhvc2UgaGVhZGVycyBpbiBzZXBhcmF0ZSBwYXRjaCBpcyB0byBlYXNlIHVwIHJl
dmlldy4KPj4+IFRob3NlIGZpbGVzIHdlcmUgdGFrZW4gZnJvbSBsaW51eCB0cmVlIChkcml2ZXJz
L3RlZS9vcHRlZS8pIGFuZCBtYW5nbGVkCj4+PiBhIGJpdCB0byBjb21waWxlIHdpdGggWEVOLgo+
Pgo+PiBDYW4geW91IG1lbnRpb24gdGhlIHZlcnNpb24gb2YgdGhlIExpbnV4IHRyZWUgeW91IHVz
ZT8gVGhpcyB3b3VsZCBoZWxwCj4+IHRvIHRyYWNrIGNoYW5nZSBpbiB0aGUgZnV0dXJlLgo+IEFj
dHVhbGx5IHRoaXMgY29tbWl0IGRlc2NyaXB0aW9uIGlzIG5vdCB2YWxpZCBhbnltb3JlLiBBZnRl
ciBJIGFkZGVkCj4gY2FsbHMgdG8gaW5mb3JtIE9QLVRFRSBhYm91dCBndWVzdCBjcmVhdGlvbi9k
ZXN0cnVjdGlvbiwgdGhvc2UgZmlsZXMKPiBkb2VzIG5vdCBjb3JyZXNwb25kIHRvIGFueSBMaW51
eCB2ZXJzaW9uIGFueW1vcmUuCj4gCj4gU28sIEknbGwgdGFrZSB0aGlzIGZpbGVzIGZyb20gb3B0
ZWVfb3MgcmVwb3NpdG9yeSBpbnN0ZWFkIGFuZCBJJ2xsCj4gdXBkYXRlIHRoZSBjb21taXQgbWVz
c2FnZSBhY2NvcmRpbmdseS4gQ2FuIEkga2VlcCB5b3VyIGFja2VkLWJ5IHRhZyBpbgo+IHN1Y2gg
Y2FzZT8KCkkgYW0gbm90IGVudGlyZWx5IHN1cmUgdG8gdW5kZXJzdGFuZCBwbGFuLiBJZiB5b3Ug
b25seSBpbnRlbmQgdG8gbW9kaWZ5IAp0aGUgY29tbWl0IG1lc3NhZ2UsIHRoZW4gSSBhbSBoYXBw
eSBpZiBrZWVwIG15IGFja2VkLWJ5LiBIb3dldmVyLCBpZiB5b3UgCnBsYW4gdG8gcmUtc3luYyB0
aGUgaGVhZGVyLCB0aGVuIHBsZWFzZSBkcm9wIG15IGFja2VkLWJ5LgoKQ2hlZXJzLAoKLS0gCkp1
bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
