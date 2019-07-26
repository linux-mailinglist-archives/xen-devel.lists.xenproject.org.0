Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 325277740F
	for <lists+xen-devel@lfdr.de>; Sat, 27 Jul 2019 00:37:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr8lt-0007uC-GF; Fri, 26 Jul 2019 22:33:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ymAH=VX=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hr8ls-0007u5-2i
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 22:33:04 +0000
X-Inumbo-ID: 52b6809a-aff5-11e9-bb90-fb0ec22a45c9
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 52b6809a-aff5-11e9-bb90-fb0ec22a45c9;
 Fri, 26 Jul 2019 22:33:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC3B2337;
 Fri, 26 Jul 2019 15:32:59 -0700 (PDT)
Received: from [10.37.8.53] (unknown [10.37.8.53])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D5DC3F71F;
 Fri, 26 Jul 2019 15:32:58 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20190726210854.6408-1-andrew.cooper3@citrix.com>
 <20190726210854.6408-4-andrew.cooper3@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <1b871981-3738-59f4-54a9-ae1a6a842f2c@arm.com>
Date: Fri, 26 Jul 2019 23:32:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190726210854.6408-4-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/4] xen/percpu: Drop unused asm/percpu.h
 includes
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LAoKT24gNy8yNi8xOSAxMDowOCBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBU
aGVzZSBmaWxlcyBlaXRoZXIgZG9uJ3QgdXNlIGFueSBQRVJfQ1BVKCkgaW5mcmFzdHJ1Y3R1cmUg
YXQgYWxsLCBvciB1c2UKPiBERUZJTkVfUEVSX0NQVV8qKCkuICBUaGlzIGlzIGRlY2xhcmVkIGlu
IHhlbi9wZXJjcHUuaCwgbm90IGFzbS9wZXJjcHUuaCwgd2hpY2gKPiBtZWFucyB0aGF0IHhlbi9w
ZXJjcHUuaCBpcyBpbmNsdWRlZCB2aWEgYSBkaWZmZXJlbnQgcGF0aC4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKQWNrZWQtYnk6
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpDaGVlcnMsCgotLSAKSnVsaWVu
IEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
