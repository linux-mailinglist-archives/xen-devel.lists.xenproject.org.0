Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0724C61E3B
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 14:16:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkSWP-0001Ai-1N; Mon, 08 Jul 2019 12:13:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=arZn=VF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hkSWN-0001AK-BX
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 12:13:27 +0000
X-Inumbo-ID: c9bce35d-a179-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id c9bce35d-a179-11e9-8980-bc764e045a96;
 Mon, 08 Jul 2019 12:13:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDCB5360;
 Mon,  8 Jul 2019 05:13:25 -0700 (PDT)
Received: from [10.37.9.206] (unknown [10.37.9.206])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C58B3F738;
 Mon,  8 Jul 2019 05:13:24 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190619175333.29938-1-volodymyr_babchuk@epam.com>
 <20190619175333.29938-4-volodymyr_babchuk@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <94cd73c6-795d-1678-f7d6-9bc9073151e5@arm.com>
Date: Sun, 7 Jul 2019 19:30:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190619175333.29938-4-volodymyr_babchuk@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 3/5] xen/arm: tee: place OP-TEE Kconfig
 option right after TEE
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

SGkgVm9sb2R5bXlyLAoKT24gNi8xOS8xOSA2OjU0IFBNLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90
ZToKPiBJdCBpcyBuaWNlciwgd2hlbiBvcHRpb25zIGZvciBwYXJ0aWN1bGFyIFRFRSBtZWRpYXRv
cnMgKGN1cnJlbnRseSwKPiBPUC1URUUgb25seSkgYXJlIGZvbGxvd2luZyBnZW5lcmljICJFbmFi
bGUgVEVFIG1lZGlhdG9ycyBzdXBwb3J0Igo+IG9wdGlvbiBpbiB0aGUgbWVudWNvbmZpZzoKPiAK
PiAgIFsqXSBFbmFibGUgVEVFIG1lZGlhdG9ycyBzdXBwb3J0Cj4gICBbIF0gICBFbmFibGUgT1At
VEVFIG1lZGlhdG9yCj4gCj4gU2lnbmVkLW9mZi1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9k
eW15cl9iYWJjaHVrQGVwYW0uY29tPgoKUmV2aWV3ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVu
LmdyYWxsQGFybS5jb20+CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
