Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8727862222
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 17:23:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkVPk-0006g6-4E; Mon, 08 Jul 2019 15:18:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=arZn=VF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hkVPj-0006g1-Ap
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 15:18:47 +0000
X-Inumbo-ID: ad9d7b80-a193-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id ad9d7b80-a193-11e9-8980-bc764e045a96;
 Mon, 08 Jul 2019 15:18:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C038360;
 Mon,  8 Jul 2019 08:18:45 -0700 (PDT)
Received: from [10.119.48.199] (unknown [10.119.48.199])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A1923F59C;
 Mon,  8 Jul 2019 08:18:45 -0700 (PDT)
To: Will Abele <will.abele@starlab.io>
References: <cover.1562435004.git.will.abele@starlab.io>
 <41ff241e-aa17-6033-25b0-80da519cd444@arm.com>
 <c3dd311a-732a-68e8-5b3d-0aa7dd8773c7@arm.com>
 <20190706211048.uvilbrefroxroli3@starlab.io>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <fa5c047d-af73-3599-3881-e5b8b5a693aa@arm.com>
Date: Mon, 8 Jul 2019 16:18:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190706211048.uvilbrefroxroli3@starlab.io>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 0/1] Dom0less guest device tree format
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
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgV2lsbCwKCkFueXRoaW5nIHdyaXR0ZW4gYWZ0ZXIgLS0gaXMgdXN1YWxseSBzZWVuIGFzIGEg
c2lnbmF0dXJlLiBUaGlzIGNvbmZ1c2VkIApteSBlLW1haWwgY2xpZW50IGFzIGl0IHdpbGwgc3Ry
aXAgdGhlIHNpZ25hdHVyZSBvbiByZXBseS4KCk9uIDcvNi8xOSAxMDoxMCBQTSwgV2lsbCBBYmVs
ZSB3cm90ZToKPiBJIHNhaWQgaW4gbXkgbWVzc2FnZSB0aGF0IExpbnV4IHdhcyBpbnRlcnByZXRp
bmcgdGhlIGRldmljZSB0cmVlIGFzIHZlcnNpb24gMTYuCj4gTG9va2luZyB0aHJvdWdoIHRoZSBj
b2RlIGFnYWluLCBJIHJlYWxpemUgaXQgd2FzIGJlaW5nIGludGVycHJldGVkIGFzIGVhcmxpZXIK
PiB0aGFuIDE2LiBBcyBtZW50aW9uZWQgaW4gTGludXggY29tbWl0IGE3ZTRjZmIwYTdjYTQ3NzNl
N2QwZGQxZDljMDE4YWIyN2ExNTM2MGUsCj4gTGludXggaGFkIGFscmVhZHkgYnJva2VuIHN1cHBv
cnQgZm9yIEZEVCB2ZXJzaW9ucyBlYXJsaWVyIHRoYW4gMTYuCj4gcG9wdWxhdGVfbm9kZSgpIGlu
IGRyaXZlcnMvb2YvZmR0LmMgd291bGQgc3RvcCBwYXJzaW5nIHRoZSBmZHQgYXQgdGhlIHJvb3Qg
bm9kZQo+IGlmIGl0IHRob3VnaHQgdGhlIGZkdCB2ZXJzaW9uIHdhcyBlYXJsaWVyIHRoYW4gMTYu
Cj4gCj4gWGVuIHNldHMgdGhlIEZEVCB2ZXJzaW9uIHRvIDE3IGluIGZkdF9jcmVhdGUoKS4KClRo
YW5rIHlvdSBmb3IgeW91ciBleHBsYW5hdGlvbi4gSG93ZXZlciwgSSBzdGlsbCBjYW4ndCBtYXRj
aCB3aGF0IHlvdSAKc2F5IHdpdGggYSBzcGVjaWZpY2F0aW9uLiBQbGVhc2UgcHJvdmlkZSBhIGxp
bmsgdG8gdGhlIHNwZWNpZmljYXRpb24gYW5kIAp0aGUgZXhhY3QgcGFyYWdyYXBoLgoKQ2hlZXJz
LAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
