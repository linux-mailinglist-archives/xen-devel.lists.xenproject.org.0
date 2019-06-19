Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A274B6B0
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 13:06:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdYNQ-0002RL-WC; Wed, 19 Jun 2019 11:03:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hb7b=US=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hdYNO-0002Ql-Ng
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 11:03:38 +0000
X-Inumbo-ID: e242ebea-9281-11e9-a5c1-5f393ea57ab5
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e242ebea-9281-11e9-a5c1-5f393ea57ab5;
 Wed, 19 Jun 2019 11:03:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CAF7360;
 Wed, 19 Jun 2019 04:03:35 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 292413F738;
 Wed, 19 Jun 2019 04:05:21 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190611184541.7281-1-volodymyr_babchuk@epam.com>
 <20190611184541.7281-4-volodymyr_babchuk@epam.com>
 <5d151e6b-f640-5b0f-abae-3ff504da0662@arm.com>
Message-ID: <81925453-ff32-7f00-b08f-774066b57c84@arm.com>
Date: Wed, 19 Jun 2019 12:03:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5d151e6b-f640-5b0f-abae-3ff504da0662@arm.com>
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

CgpPbiAxOS8wNi8yMDE5IDEyOjAxLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgVm9sb2R5bXly
LAo+IAo+IE9uIDExLzA2LzIwMTkgMTk6NDYsIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+PiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3RlZS9LY29uZmlnIGIveGVuL2FyY2gvYXJtL3RlZS9L
Y29uZmlnCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAuLjViODI5
ZGIyZTkKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi94ZW4vYXJjaC9hcm0vdGVlL0tjb25maWcK
Pj4gQEAgLTAsMCArMSw0IEBACj4+ICtjb25maWcgT1BURUUKPj4gK8KgwqDCoCBib29sICJFbmFi
bGUgT1AtVEVFIG1lZGlhdG9yIgo+PiArwqDCoMKgIGRlZmF1bHQgbgo+PiArwqDCoMKgIGRlcGVu
ZHMgb24gVEVFCj4gCj4gSSBoYXZlIHBsYXllZCBhIGJpdCB3aXRoIHRoZSBtZW51Y29uZmlnIHRo
YXQgIkVuYWJsZSBPUC1URUUgbWVkaWF0b3IiIHdpbGwgCj4gYXBwZWFyIGF0IHRoZSB0b3AtbGV2
ZWwgd2hpbGUgIkVuYWJsZSBURUUgbWVkaWF0b3JzIHN1cHBvcnQiIGlzIHVuZGVyIAo+ICJBcmNo
aXRlY3R1cmUgZmVhdHVyZXMiLgo+IAo+IEFyZ3VhYmx5LCBib3RoIHNob3VsZCBiZSB1bmRlciAi
RGV2aWNlIERyaXZlcnMiLiBDYW4geW91IHNlbmQgYSBmb2xsb3ctdXAgcGF0Y2ggCj4gdG8gZml4
IHRoYXQgdXA/CgpBbm90aGVyIGFsdGVybmF0aXZlIGlzIG1vdmluZyB0aGUgdHdvIGluICJBcmNo
aXRlY3R1cmUgZmVhdHVyZXMiIHdpdGggIkVuYWJsZSAKT1AtVEVFIG1lZGlhdG9yIiB1bmRlciAi
RW5hYmxlIFRFRSBtZWRpYXRvciBzdXBwb3J0cyIuCgo+IAo+IFdoaWxlIHlvdSBhcmUgZG9pbmcg
dGhhdCwgY2FuIHlvdSBhZGQgYSBkZXNjcmlwdGlvbiBpbiAiRW5hYmxlIE9QLVRFRSBtZWRpYXRv
ciIgCj4gZXhwbGFpbmluZyB0aGlzIHJlcXVpcmUgYSB2aXJ0dWFsaXphdGlvbi1hd2FyZSBPUC1U
RUUgaW4gb3JkZXIgdG8gd29yay4KPiAKPiBDaGVlcnMsCj4gCgotLSAKSnVsaWVuIEdyYWxsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
