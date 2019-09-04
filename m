Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDD4A820C
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 14:22:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5UFt-0003dE-1T; Wed, 04 Sep 2019 12:19:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Tt/v=W7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5UFr-0003d4-Oe
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 12:19:19 +0000
X-Inumbo-ID: 3798d6cc-cf0e-11e9-abb0-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3798d6cc-cf0e-11e9-abb0-12813bfff9fa;
 Wed, 04 Sep 2019 12:19:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AB798AD4B;
 Wed,  4 Sep 2019 12:19:17 +0000 (UTC)
To: Olaf Hering <olaf@aepfle.de>
References: <20190904091423.23963-1-olaf@aepfle.de>
 <75fe87c1-2f21-b1c1-6589-36807e0b4aaa@citrix.com>
 <20190904113735.349609b4.olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cae6ee14-da0f-883c-148a-5556f26f4b12@suse.com>
Date: Wed, 4 Sep 2019 14:19:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904113735.349609b4.olaf@aepfle.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v1] Remove stale crashkernel= example from
 documentation
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDkuMjAxOSAxMTozNywgT2xhZiBIZXJpbmcgd3JvdGU6Cj4gQW0gV2VkLCA0IFNlcCAy
MDE5IDEwOjE4OjQxICswMTAwCj4gc2NocmllYiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPjoKPiAKPj4gVGhhdCBzb3VuZHMgbGlrZSBhbiBhY2NpZGVudGFsIHJlZ3Jl
c3Npb24gaW4gcGFyc2luZyBvZiBjcmFzaGtlcm5lbD0sCj4+IHJhdGhlciB0aGFuIGEgZGVsaWJl
cmF0ZSBhY3Rpb24uCj4gCj4gTWF5YmUganVzdCB0aGUgbGFjayBvZiBiNDkyMjVkYzlkZjMzNjQw
NTI5MmRjMDg4NjJiNGM3YzlkODg3YmQ2IGluIHZlbmRvciBiaW5hcmllcy4uLgoKQnV0IHRoaXMg
Y2hhbmdlIHdhcyBvbmx5IHRvIGRlYWwgd2l0aCB0aGUgYm9ndXMgbG9nIG1lc3NhZ2UuClRoZSBo
YW5kbGluZyB3YXMgc3RpbGwgY29ycmVjdCAoYW5kIHRoZSBvcHRpb24gd2FzIGJlaW5nCmhvbm9y
ZWQpLiBJIGFsc28gY2FuJ3Qgc2VlIGhvdyB0aGlzIHdvdWxkIGJlIGRpZmZlcmVudCBub3cuCklm
IHlvdSd2ZSByZWFsbHkgb2JzZXJ2ZWQgdGhlIG9wdGlvbiBub3Qgd29ya2luZywgcGxlYXNlCnBy
b3ZpZGUgbW9yZSBkZXRhaWwuCgo+IEl0IGlzIGxpa2VseSBicm9rZW4gc2luY2UgNC4xMC4gSSBo
YXZlIG5vdCB0cmllZCBzdGFnaW5nLgoKQmVjYXVzZSBvZiB0aGUgaXNzdWUganVzdCBiZWluZyBj
b3NtZXRpYywgSSBkaWRuJ3QgY29uc2lkZXIKaW4gbmVjZXNzYXJ5IHRvIGJhY2twb3J0IHRoZSBj
aGFuZ2UuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
