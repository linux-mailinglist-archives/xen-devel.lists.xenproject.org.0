Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 043427C100
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 14:18:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsnVT-0006X9-Kq; Wed, 31 Jul 2019 12:14:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8Zog=V4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hsnVR-0006X3-KW
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 12:14:57 +0000
X-Inumbo-ID: cf04cf94-b38c-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id cf04cf94-b38c-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 12:14:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F000D344;
 Wed, 31 Jul 2019 05:14:55 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B4363F575;
 Wed, 31 Jul 2019 05:14:55 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190723213553.22300-1-julien.grall@arm.com>
 <20190723213553.22300-4-julien.grall@arm.com> <87o91hht9c.fsf@epam.com>
 <89065edf-d75c-81dd-0249-a5554feeab51@arm.com> <87ef2cj3gd.fsf@epam.com>
 <alpine.DEB.2.21.1907291446320.1237@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e2c7609e-5cbe-e5de-ae37-cfb52d9f8194@arm.com>
Date: Wed, 31 Jul 2019 13:14:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1907291446320.1237@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/7] xen/arm: Rework psr_mode_is_32bit()
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDI5LzA3LzIwMTkgMjI6NTIsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBGcmksIDI2IEp1bCAyMDE5LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPj4gSnVs
aWVuIEdyYWxsIHdyaXRlczoKPj4KPj4+IEhpLAo+Pj4KPj4+IE9uIDI2LzA3LzIwMTkgMTM6MzEs
IFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+Pj4+Cj4+Pj4gSnVsaWVuIEdyYWxsIHdyaXRlczoK
Pj4+Pgo+Pj4+PiBwc3JfbW9kZV9pc18zMmJpdCgpIHByb3RvdHlwZSBkb2VzIG5vdCBtYXRjaCB0
aGUgcmVzdCBvZiB0aGUgaGVscGVycyBmb3IKPj4+Pj4gdGhlIHByb2Nlc3Mgc3RhdGUuIExvb2tp
bmcgYXQgdGhlIGNhbGxlcnMsIG1vc3Qgb2YgdGhlbSB3aWxsIGFjY2Vzcwo+Pj4+PiBzdHJ1Y3Qg
Y3B1X3VzZXJfcmVncyBqdXN0IGZvciBjYWxsaW5nIHBzcl9tb2RlX2lzXzMyYml0KCkuCj4+Pj4+
Cj4+Pj4+IFRoZSBtYWNybyBpcyBub3cgcmV3b3JrZWQgdG8gdGFrZSBhIHN0cnVjdCBjcHVfdXNl
cl9yZWdzIGluIHBhcmFtZXRlci4KPj4+Pj4gQXQgdGhlIHNhbWUgdGltZSB0YWtlIHRoZSBvcHBv
cnR1bml0eSB0byBzd2l0Y2ggdG8gYSBzdGF0aWMgaW5saW5lCj4+Pj4+IGhlbHBlci4KPj4+PiBJ
J20gYSBiaXQgY29uY2VybmVkIGFib3V0IG5hbWluZyBub3cuIEFzIHBzcl9tb2RlX2lzXzMyYml0
KCkgaXMgbm93IGhhdmUKPj4+PiBubyBwc3IgcGFyYW1ldGVyLCBhbmQgQVJNIEFSTSB1c2VzIHRl
cm0gInN0YXRlIiBpbnN0ZWFkIG9mICJtb2RlIiwgbWF5YmUKPj4+PiBpdCBpcyB3b3J0aCB0byBy
ZW5hbWUgdGhpcyBoZWxwZXIgdG8gc29tZXRoaW5nIGxpa2UgImlzXzMyYml0X3N0YXRlIj8KPj4+
Cj4+PiBJdCByZWFsbHkgZGVwZW5kcyBob3cgeW91IHNlZSBpdC4gVGhlIGJpdCBpcyBwYXJ0IG9m
IHRoZSAibW9kZSIgZmllbGQsCj4+PiBzbyB0ZWNobmljYWxseSB3ZSBhcmUgY2hlY2tpbmcgd2hl
dGhlciB0aGUgbW9kZSBjb3JyZXNwb25kcyB0byBhCj4+PiAzMi1iaXQgb25lIG9yIG5vdC4gVGhp
cyBpcyBhbHNvIGlubGluZSB3aXRoIHRoZSByZXN0IG9mIHRoZSBoZWxwZXJzCj4+PiB3aXRoaW4g
dGhpcyBoZWFkZXIuCj4+Pgo+Pj4gSSB3b3VsZCBiZSB3aWxsaW5nIHRvIGNvbnNpZGVyIHJlbmFt
aW5nIHRoZSBoZWxwZXIgdG8gcmVnc19tb2RlX2lzXzMyYml0KCkuCj4+IEknbSBmaW5lIHdpdGgg
dGhpcyBuYW1lLgo+IAo+IFRoZSBwYXRjaCBpcyBmaW5lIGJ5IG1lLCBhcyBpcywgb3Igd2l0aCB0
aGUgbmFtZSBjaGFuZ2VkIHRvCj4gcmVnc19tb2RlX2lzXzMyYml0LiAoSSBkaWRuJ3QgY29tbWl0
IGl0LikKCkkgYW0gdGhpbmtpbmcgdG8gZ2V0IHRoZSByZW5hbWluZyBzZXBhcmF0ZWx5LiBTbyBJ
IGNhbiBhbHNvIHJld29yayB0aGUgb3RoZXIgCmhlbHBlcnMuCgo+IAo+IEVpdGhlciB3YXk6Cj4g
Cj4gUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz4KClNvIEkgd2lsbCBjb21taXQgYXMgaXMgYW5kIGFkZCBpbiBteSB0b2RvIGxpc3QgcmVuYW1p
bmcuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
