Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE22BB199
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 11:45:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCKrk-0004Ei-RM; Mon, 23 Sep 2019 09:42:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XQlp=XS=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iCKri-0004EW-V0
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 09:42:42 +0000
X-Inumbo-ID: 7d01adce-dde6-11e9-b76c-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 7d01adce-dde6-11e9-b76c-bc764e2007e4;
 Mon, 23 Sep 2019 09:42:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF5951000;
 Mon, 23 Sep 2019 02:42:41 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4393A3F59C;
 Mon, 23 Sep 2019 02:42:41 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190918185041.22738-1-volodymyr_babchuk@epam.com>
 <20190918185041.22738-5-volodymyr_babchuk@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <b6ddb159-463f-2e30-35b8-5aefae38b94f@arm.com>
Date: Mon, 23 Sep 2019 10:42:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190918185041.22738-5-volodymyr_babchuk@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 4/6] xen/arm: optee: handle shared buffer
 translation error
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
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxOC8wOS8yMDE5IDE5OjUxLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPiArLyog
SGFuZGxlcyByZXR1cm4gZnJvbSBYZW4taXNzdWVkIFJQQyAqLwo+ICtzdGF0aWMgdm9pZCBoYW5k
bGVfeGVuX3JwY19yZXR1cm4oc3RydWN0IG9wdGVlX2RvbWFpbiAqY3R4LAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgb3B0ZWVfc3RkX2NhbGwgKmNh
bGwsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgc2htX3JwYyAq
c2htX3JwYykKPiArewo+ICsgICAgY2FsbC0+c3RhdGUgPSBPUFRFRV9DQUxMX05PUk1BTDsKPiAr
Cj4gKyAgICAvKgo+ICsgICAgICogUmlnaHQgbm93IHdlIGhhdmUgb25seSBvbmUgcmVhc29uIHRv
IGJlIHRoZXJlIC0gd2UgYXNrZWQgZ3Vlc3QKPiArICAgICAqIHRvIGZyZWUgc2hhcmVkIGJ1ZmZl
ciBhbmQgaXQgZGlkIGl0LiBOb3cgd2UgY2FuIHRlbGwgT1AtVEVFCj4gKyAgICAgKiB0aGF0IGJ1
ZmZlciBhbGxvY2F0aW9uIGZhaWxlZC4gV2UgYXJlIG5vdCBzdG9yaW5nIGV4YWN0IGNvbW1hbmQK
PiArICAgICAqIHR5cGUsIG9ubHkgdHlwZSBvZiBSUEMgcmV0dXJuLiBTbywgdGhpcyBpcyB0aGUg
b25seSBjaGVjayB3ZQo+ICsgICAgICogY2FuIHBlcmZvcm0gdGhlcmUuCj4gKyAgICAgKi8KPiAr
ICAgIEFTU0VSVChjYWxsLT5ycGNfb3AgPT0gT1BURUVfU01DX1JQQ19GVU5DX0NNRCk7CgpBcyBJ
IHBvaW50ZWQgb3V0IGluIHYxLCBBU1NFUlQoKSBpcyBwcm9iYWJseSB0aGUgbGVzcyBkZXNpcmFi
bGUgc29sdXRpb24gaGVyZSBhcyAKdGhpcyBpcyBhbiBlcnJvciBwYXRoLgoKQ2FuIHlvdSBleHBs
YWluIHdoeSB5b3UgY2hvc2UgdGhhdCBvdmVyIHRoZSAzIHNvbHV0aW9ucyBJIHN1Z2dlc3RlZD8K
CkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
