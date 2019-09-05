Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F41AACD2
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 22:11:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5y3U-0007lj-DN; Thu, 05 Sep 2019 20:08:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/daD=XA=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i5y3S-0007ld-Mb
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 20:08:30 +0000
X-Inumbo-ID: ec03452e-d018-11e9-b76c-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id ec03452e-d018-11e9-b76c-bc764e2007e4;
 Thu, 05 Sep 2019 20:08:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F18B1000;
 Thu,  5 Sep 2019 13:08:26 -0700 (PDT)
Received: from [10.37.12.167] (unknown [10.37.12.167])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A64903F67D;
 Thu,  5 Sep 2019 13:08:24 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul.durrant@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20190902145014.36442-1-paul.durrant@citrix.com>
 <20190902145014.36442-2-paul.durrant@citrix.com>
 <b0d39084-457d-1faa-be8c-3995ff5957a7@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <54d6e134-cabc-9505-b49f-e298ced5f5a0@arm.com>
Date: Thu, 5 Sep 2019 21:08:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b0d39084-457d-1faa-be8c-3995ff5957a7@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v8 1/6] x86/domain: remove the 'oos_off' flag
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gOS8yLzE5IDQ6MDggUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDAyLjA5
LjIwMTkgMTY6NTAsIFBhdWwgRHVycmFudCB3cm90ZToKPj4gVGhlIGZsYWcgaXMgbm90IG5lZWRl
ZCBzaW5jZSB0aGUgZG9tYWluICdvcHRpb25zJyBjYW4gbm93IGJlIHRlc3RlZAo+PiBkaXJlY3Rs
eS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4
LmNvbT4KPiAKPiBJbiBwcmluY2lwbGUKPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgo+IGJ1dAo+IAo+IEp1bGllbiwgU3RlZmFubywKPiAKPiBJJ2QgbGlrZSB0
byB0byBhc2sgZm9yIGFuIGV4cGxpY2l0IG9waW5pb24gb2YgYXQgbGVhc3Qgb25lIG9mIHlvdQo+
IHJlZ2FyZGluZyB0aGUgYmVoYXZpb3Igb24gQXJtLiBEdXJpbmcgdjcgcmV2aWV3IEkgZGlkIHN1
Z2dlc3QgdGhhdAo+IHRoZSBmbGFnIGJlaW5nIHNldCBzaG91bGQgZ2V0IHJlamVjdGVkIHRoZXJl
LgoKVGhlIGN1cnJlbnQgY29kZSBpcyBhY3R1YWxseSByZWplY3RpbmcgYW55IGNvbWJpbmF0aW9u
IG9mIGZsYWdzIGJ1dCAKQ0RGX2h2bV9ndWVzdCB8IENERl9oYXAuIFNvIHRoZSBmbGFnIGlzIGVm
ZmVjdGl2ZWx5IHJlamVjdGVkIGZvciBBcm0uCgpIb3dldmVyLCBpdCBvY2N1cnJlZCB0byBtZSB0
aGF0IHBhdGNoICMyIHdpbGwgYnJlYWsgZG9tYWluIGNyZWF0aW9uIG9uIApBcm0gYXMgc2V0dGlu
ZyBDREZfaW9tbXUgd2lsbCBiZSBwcmV2ZW50ZWQuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
