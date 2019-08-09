Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF51D877A3
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 12:39:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw2H4-0001bb-8B; Fri, 09 Aug 2019 10:37:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hw2H2-0001bQ-4j
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 10:37:28 +0000
X-Inumbo-ID: adc42c32-ba91-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id adc42c32-ba91-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 10:37:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A513AAEE0;
 Fri,  9 Aug 2019 10:37:25 +0000 (UTC)
To: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1908061708420.2451@sstabellini-ThinkPad-T480s>
 <20190807002311.9906-2-sstabellini@kernel.org>
 <6f326378-dfdd-8570-fa10-b32c6dc93c3c@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cdc05fd0-080f-3a1f-e08a-a767f9b54f20@suse.com>
Date: Fri, 9 Aug 2019 12:37:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6f326378-dfdd-8570-fa10-b32c6dc93c3c@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 2/6] xen: add a p2mt parameter to
 map_mmio_regions
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <stefanos@xilinx.com>,
 andrew.cooper3@citrix.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDguMjAxOSAxMjoyMywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDA3LzA4LzIwMTkg
MDE6MjMsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4gQWRkIGEgcDJtdCBwYXJhbWV0ZXIg
dG8gbWFwX21taW9fcmVnaW9ucywgcGFzcyBwMm1fbW1pb19kaXJlY3RfZGV2IG9uCj4+IEFSTSBh
bmQgcDJtX21taW9fZGlyZWN0IG9uIHg4NiAtLSBubyBjaGFuZ2VzIGluIGJlaGF2aW9yLgo+Pgo+
PiBPbiB4ODYsIGludHJvZHVjZSBhIG1hY3JvIHRvIHN0cmlwIGF3YXkgdGhlIGxhc3QgcGFyYW1l
dGVyIGFuZCByZW5hbWUKPj4gdGhlIGV4aXN0aW5nIGltcGxlbWVudGF0aW9uIG9mIG1hcF9tbWlv
X3JlZ2lvbnMgdG8gbWFwX21taW9fcmVnaW9uLgo+PiBVc2UgbWFwX21taW9fcmVnaW9uIGluIHZw
Y2kgYXMgaXQgaXMgeDg2LW9ubHkgdG9kYXkuCj4gCj4gVGhpcyBmZWVscyBxdWl0ZSB3cm9uZy4g
WW91IGhhdmUgYSAicGx1cmFsIiBmdW5jdGlvbiBjYWxsaW5nIGEgInNpbmd1bGFyIiBmdW5jdGlv
bi4gVGhpcyBpcyB1c3VhbGx5IHRoZSBvdGhlciB3YXkgYXJvdW5kLiBUaGlzIGlzIGFsc28gcXVp
dGUgZGlmZmljdWx0IGZvciBhIHVzZXIgdG8gdW5kZXJzdGFuZCB3aHkgdGhlICdzJyBpcyBiZWVu
IGRyb3BwZWQvYWRkZWQgKGRlcGVuZGluZyBob3cgeW91IHZpZXcgaXQpIGJlY2F1c2UgaW4gYm90
aCBjYXNlIHlvdSBvbmx5IGRlYWwgd2l0aCBhIHNpbmdsZSByZWdpb24uCgoiSGFwcHkiIGlzIHRo
ZSB3cm9uZyB0ZXJtLiBJJ2Qgd2VsY29tZSBhbnkgYmV0dGVyIHN1Z2dlc3Rpb24uIEkKc2ltcGx5
IGNvdWxkbid0IHRoaW5rIG9mIGEgc2Vuc2libGUgYWx0ZXJuYXRpdmUsIGJ1dCBJIGRvIHdhbnQK
dG8gc2VlIHRoZSBsZWFkaW5nIHVuZGVyc2NvcmVzIGdvbmUgdGhhdCB3ZXJlIHRoZXJlIG9yaWdp
bmFsbHkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
