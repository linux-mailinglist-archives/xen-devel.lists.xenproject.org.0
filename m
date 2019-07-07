Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFABD61E3C
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 14:16:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkSWY-0001GM-L8; Mon, 08 Jul 2019 12:13:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=arZn=VF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hkSWX-0001Fs-7e
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 12:13:37 +0000
X-Inumbo-ID: d00b7489-a179-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id d00b7489-a179-11e9-8980-bc764e045a96;
 Mon, 08 Jul 2019 12:13:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51282360;
 Mon,  8 Jul 2019 05:13:36 -0700 (PDT)
Received: from [10.37.9.206] (unknown [10.37.9.206])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 112153F738;
 Mon,  8 Jul 2019 05:13:34 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190619175333.29938-1-volodymyr_babchuk@epam.com>
 <20190619175333.29938-6-volodymyr_babchuk@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e1de3696-cdaa-5e4e-9412-f826697b035d@arm.com>
Date: Sun, 7 Jul 2019 19:33:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190619175333.29938-6-volodymyr_babchuk@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 5/5] xen/arm: optee: document OPTEE
 option in tee/Kconfig
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
ZToKPiBBZGQgYmFzaWMgaW5mb3JtYXRpb24gYWJvdXQgdGhlIE9QLVRFRSBtZWRpYXRvciBhbmQg
bm90ZSBhYm91dAo+IGRlcGVuZGVuY3kgb24gdmlydHVhbGl6YXRpb24tYXdhcmUgT1AtVEVFLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0Bl
cGFtLmNvbT4KCkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoK
Q2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
