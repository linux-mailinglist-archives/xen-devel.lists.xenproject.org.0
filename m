Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD79BF18D3
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 15:38:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSMPQ-0000Aw-Mz; Wed, 06 Nov 2019 14:35:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cVPj=Y6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iSMPO-0000Ar-VT
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2019 14:35:43 +0000
X-Inumbo-ID: b4d3767c-00a2-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4d3767c-00a2-11ea-9631-bc764e2007e4;
 Wed, 06 Nov 2019 14:35:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 26F5DB167;
 Wed,  6 Nov 2019 14:35:40 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191105194317.16232-1-andrew.cooper3@citrix.com>
 <20191105194317.16232-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f859aaf5-98d2-51ac-79bc-7e33274d865e@suse.com>
Date: Wed, 6 Nov 2019 15:35:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191105194317.16232-2-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] xen/livepatch: Add a return value to
 load hooks
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMTEuMjAxOSAyMDo0MywgQW5kcmV3IENvb3BlciB3cm90ZToKPiAtLS0gYS94ZW4vY29t
bW9uL2xpdmVwYXRjaC5jCj4gKysrIGIveGVuL2NvbW1vbi9saXZlcGF0Y2guYwo+IEBAIC0xMDc2
LDI1ICsxMDc2LDMzIEBAIHN0YXRpYyBpbnQgYXBwbHlfcGF5bG9hZChzdHJ1Y3QgcGF5bG9hZCAq
ZGF0YSkKPiAgICAgICAqIHRlbXBvcmFyaWx5IGRpc2FibGUgdGhlIHNwaW4gbG9ja3MgSVJRIHN0
YXRlIGNoZWNrcy4KPiAgICAgICAqLwo+ICAgICAgc3Bpbl9kZWJ1Z19kaXNhYmxlKCk7Cj4gLSAg
ICBmb3IgKCBpID0gMDsgaSA8IGRhdGEtPm5fbG9hZF9mdW5jczsgaSsrICkKPiAtICAgICAgICBk
YXRhLT5sb2FkX2Z1bmNzW2ldKCk7Cj4gKyAgICBmb3IgKCBpID0gMDsgIXJjICYmIGkgPCBkYXRh
LT5uX2xvYWRfZnVuY3M7IGkrKyApCj4gKyAgICAgICAgcmMgPSBkYXRhLT5sb2FkX2Z1bmNzW2ld
KCk7Cj4gICAgICBzcGluX2RlYnVnX2VuYWJsZSgpOwo+ICAKPiArICAgIGlmICggcmMgKQo+ICsg
ICAgICAgIHByaW50ayhYRU5MT0dfRVJSIExJVkVQQVRDSCAiJXM6IGxvYWRfZnVuY3NbJXVdIGZh
aWxlZDogJWRcbiIsCj4gKyAgICAgICAgICAgICAgIGRhdGEtPm5hbWUsIGksIHJjKTsKCklzIHRo
ZXJlIGEgcG9zc2libGUgcHJvYmxlbSBoZXJlIGlmIHNvbWUgb2YgdGhlIGxvYWRfZnVuY3MoKQpz
dWNjZWVkZWQgYmVmb3JlIG9uZSBmYWlscz8gT3IgYXJlIHRob3NlIHJlcXVpcmVkIHRvIG5vdCBk
bwphbnkgc3RhdGUgY2hhbmdlIHRvIHRoZSBzeXN0ZW0gKHdoaWNoIHdvdWxkIG5lZWQgcm9sbGlu
ZyBiYWNrKT8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
