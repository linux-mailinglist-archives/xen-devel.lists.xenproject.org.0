Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6621A4B6A1
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 13:04:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdYL5-00027v-Lv; Wed, 19 Jun 2019 11:01:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hb7b=US=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hdYL4-00027q-8a
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 11:01:14 +0000
X-Inumbo-ID: 8b6700f4-9281-11e9-8fa6-fb795c0a0184
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 8b6700f4-9281-11e9-8fa6-fb795c0a0184;
 Wed, 19 Jun 2019 11:01:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE686360;
 Wed, 19 Jun 2019 04:01:09 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 682FB3F738;
 Wed, 19 Jun 2019 04:02:55 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190611184541.7281-1-volodymyr_babchuk@epam.com>
 <20190611184541.7281-4-volodymyr_babchuk@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <5d151e6b-f640-5b0f-abae-3ff504da0662@arm.com>
Date: Wed, 19 Jun 2019 12:01:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190611184541.7281-4-volodymyr_babchuk@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 03/10] xen/arm: optee: add OP-TEE
 mediator skeleton
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

SGkgVm9sb2R5bXlyLAoKT24gMTEvMDYvMjAxOSAxOTo0NiwgVm9sb2R5bXlyIEJhYmNodWsgd3Jv
dGU6Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90ZWUvS2NvbmZpZyBiL3hlbi9hcmNoL2Fy
bS90ZWUvS2NvbmZpZwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4u
NWI4MjlkYjJlOQo+IC0tLSAvZGV2L251bGwKPiArKysgYi94ZW4vYXJjaC9hcm0vdGVlL0tjb25m
aWcKPiBAQCAtMCwwICsxLDQgQEAKPiArY29uZmlnIE9QVEVFCj4gKwlib29sICJFbmFibGUgT1At
VEVFIG1lZGlhdG9yIgo+ICsJZGVmYXVsdCBuCj4gKwlkZXBlbmRzIG9uIFRFRQoKSSBoYXZlIHBs
YXllZCBhIGJpdCB3aXRoIHRoZSBtZW51Y29uZmlnIHRoYXQgIkVuYWJsZSBPUC1URUUgbWVkaWF0
b3IiIHdpbGwgCmFwcGVhciBhdCB0aGUgdG9wLWxldmVsIHdoaWxlICJFbmFibGUgVEVFIG1lZGlh
dG9ycyBzdXBwb3J0IiBpcyB1bmRlciAKIkFyY2hpdGVjdHVyZSBmZWF0dXJlcyIuCgpBcmd1YWJs
eSwgYm90aCBzaG91bGQgYmUgdW5kZXIgIkRldmljZSBEcml2ZXJzIi4gQ2FuIHlvdSBzZW5kIGEg
Zm9sbG93LXVwIHBhdGNoIAp0byBmaXggdGhhdCB1cD8KCldoaWxlIHlvdSBhcmUgZG9pbmcgdGhh
dCwgY2FuIHlvdSBhZGQgYSBkZXNjcmlwdGlvbiBpbiAiRW5hYmxlIE9QLVRFRSBtZWRpYXRvciIg
CmV4cGxhaW5pbmcgdGhpcyByZXF1aXJlIGEgdmlydHVhbGl6YXRpb24tYXdhcmUgT1AtVEVFIGlu
IG9yZGVyIHRvIHdvcmsuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
