Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE50332EFC
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 13:51:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXlRy-000781-8j; Mon, 03 Jun 2019 11:48:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fnY6=UC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hXlRx-00077w-01
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 11:48:25 +0000
X-Inumbo-ID: 7e3dec14-85f5-11e9-bd9e-efb072fa8023
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 7e3dec14-85f5-11e9-bd9e-efb072fa8023;
 Mon, 03 Jun 2019 11:48:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0858415A2;
 Mon,  3 Jun 2019 04:48:24 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 38C3C3F5AF;
 Mon,  3 Jun 2019 04:48:22 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190521212530.12706-1-volodymyr_babchuk@epam.com>
 <20190521212530.12706-2-volodymyr_babchuk@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <8eb2955b-c7df-d949-c507-520f9aa152b3@arm.com>
Date: Mon, 3 Jun 2019 12:48:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190521212530.12706-2-volodymyr_babchuk@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 01/10] xen/arm: add generic TEE mediator
 framework
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyMS8wNS8yMDE5IDIyOjI1LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPiBkaWZmIC0t
Z2l0IGEveGVuL2luY2x1ZGUvcHVibGljL2FyY2gtYXJtLmggYi94ZW4vaW5jbHVkZS9wdWJsaWMv
YXJjaC1hcm0uaAo+IGluZGV4IGViNDI0ZTgyODYuLjVlOTM4YTkxY2MgMTAwNjQ0Cj4gLS0tIGEv
eGVuL2luY2x1ZGUvcHVibGljL2FyY2gtYXJtLmgKPiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMv
YXJjaC1hcm0uaAo+IEBAIC0zMDQsMTAgKzMwNCwxMyBAQCBERUZJTkVfWEVOX0dVRVNUX0hBTkRM
RSh2Y3B1X2d1ZXN0X2NvbnRleHRfdCk7Cj4gICAjZGVmaW5lIFhFTl9ET01DVExfQ09ORklHX0dJ
Q19OQVRJVkUgICAgMAo+ICAgI2RlZmluZSBYRU5fRE9NQ1RMX0NPTkZJR19HSUNfVjIgICAgICAg
IDEKPiAgICNkZWZpbmUgWEVOX0RPTUNUTF9DT05GSUdfR0lDX1YzICAgICAgICAyCgpJIGZvcmdv
dCB0byBtZW50aW9uIHRoZSBuZXdsaW5lIGhlcmUuIFRoaXMgd291bGQgaGVscCB0byBkaWZmZXJl
bnRpYXRlIHRoZSB0d28gCnNldCBvZiBkZWZpbmUuCgpJIGNhbiBhZGQgdGhpcyBvbmUgb24gY29t
bWl0LgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
