Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C5EB6559
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 16:01:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAaU8-0004Z7-D7; Wed, 18 Sep 2019 13:59:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FY6t=XN=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iAaU6-0004Yr-9L
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 13:59:06 +0000
X-Inumbo-ID: 79fb0f6c-da1c-11e9-9636-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 79fb0f6c-da1c-11e9-9636-12813bfff9fa;
 Wed, 18 Sep 2019 13:59:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3B691000;
 Wed, 18 Sep 2019 06:59:04 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F3A123F67D;
 Wed, 18 Sep 2019 06:59:03 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190619175333.29938-1-volodymyr_babchuk@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <4d504e03-52db-f840-1a2b-2a1a1a07fd70@arm.com>
Date: Wed, 18 Sep 2019 14:59:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190619175333.29938-1-volodymyr_babchuk@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 0/5] TEE mediator (and OP-TEE) support in
 XEN
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxOS8wNi8yMDE5IDE4OjUzLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPiBWb2xv
ZHlteXIgQmFiY2h1ayAoNSk6Cj4gICAgdG9vbHMvYXJtOiB0ZWU6IGFkZCAidGVlIiBvcHRpb24g
Zm9yIHhsLmNmZwo+ICAgIHRvb2xzL2FybTogb3B0ZWU6IGNyZWF0ZSBvcHRlZSBmaXJtd2FyZSBu
b2RlIGluIERUIGlmIHRlZT1vcHRlZQo+ICAgIHhlbi9hcm06IHRlZTogcGxhY2UgT1AtVEVFIEtj
b25maWcgb3B0aW9uIHJpZ2h0IGFmdGVyIFRFRQo+ICAgIHhlbi9hcm06IG9wdGVlOiBjaGVjayBp
ZiBPUC1URUUgaXMgdmlydHVhbGl6YXRpb24tYXdhcmUKPiAgICB4ZW4vYXJtOiBvcHRlZTogZG9j
dW1lbnQgT1BURUUgb3B0aW9uIGluIHRlZS9LY29uZmlnCgpUaGlzIHNlcmllcyBpcyBub3cgZnVs
bHkgY29tbWl0dGVkLiBUaGFuayB5b3UgZm9yIHRoZSBjb250cmlidXRpb24hCgpDaGVlcnMsCgo+
IAo+ICAgZG9jcy9tYW4veGwuY2ZnLjUucG9kLmluICAgIHwgMjkgKysrKysrKysrKysrKysrKysr
KysrKysrKwo+ICAgdG9vbHMvbGlieGwvbGlieGwuaCAgICAgICAgIHwgIDUgKysrKysKPiAgIHRv
b2xzL2xpYnhsL2xpYnhsX2FybS5jICAgICB8IDQyICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKPiAgIHRvb2xzL2xpYnhsL2xpYnhsX3R5cGVzLmlkbCB8ICA2ICsrKysrKwo+
ICAgdG9vbHMveGwveGxfcGFyc2UuYyAgICAgICAgIHwgIDkgKysrKysrKysKPiAgIHhlbi9hcmNo
L2FybS9LY29uZmlnICAgICAgICB8ICA0ICsrLS0KPiAgIHhlbi9hcmNoL2FybS90ZWUvS2NvbmZp
ZyAgICB8ICA1ICsrKysrCj4gICB4ZW4vYXJjaC9hcm0vdGVlL29wdGVlLmMgICAgfCAxMCArKysr
KysrKysKPiAgIDggZmlsZXMgY2hhbmdlZCwgMTA4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
