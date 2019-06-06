Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7680037AC8
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 19:17:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYvyp-0004WR-Jn; Thu, 06 Jun 2019 17:15:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2G1I=UF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hYvyo-0004WM-E1
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 17:15:10 +0000
X-Inumbo-ID: a2c44a02-887e-11e9-84c3-5763a0c57c7d
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a2c44a02-887e-11e9-84c3-5763a0c57c7d;
 Thu, 06 Jun 2019 17:15:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6EF6374;
 Thu,  6 Jun 2019 10:15:08 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C92E83F690;
 Thu,  6 Jun 2019 10:15:07 -0700 (PDT)
To: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-6-julien.grall@arm.com>
 <d728673e-a308-b5ec-ac8c-e60e0cb3001d@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <2a8d5bd4-e15e-a82a-0ffd-9e057d07693d@arm.com>
Date: Thu, 6 Jun 2019 18:15:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d728673e-a308-b5ec-ac8c-e60e0cb3001d@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 05/19] xen/arm: Remove
 parameter cpuid from start_xen
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
Cc: Oleksandr_Tyshchenko@epam.com, Andrii_Anisov@epam.com,
 Andrii Anisov <andrii.anisov@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCkdlbnRsZSBwaW5nLCB5b3UgaGF2ZSBhY2tlZCB0aGUgb3RoZXIgcGF0Y2hl
cyBidXQgbm90IHRoaXMgcGF0Y2guIEkgY2FuJ3QgbWVyZ2UgCnRoZW0gd2l0aG91dCB0aGlzIG9u
ZS4KCkNoZWVycywKCk9uIDIxLzA1LzIwMTkgMTE6MDEsIEFuZHJpaSBBbmlzb3Ygd3JvdGU6Cj4g
Cj4gCj4gT24gMTQuMDUuMTkgMTU6MjQsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gVGhlIHBhcmFt
ZXRlciBjcHVpZCBpcyBub3QgdXNlZCBieSBzdGFydF94ZW4uIFNvIHJlbW92ZSBpdC4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4KPj4g
LS0tCj4+IMKgwqDCoMKgIC0gUmUtb3JkZXIgdGhlIHBhdGNoIHdpdGggInhlbi9hcm06IFJld29y
ayBzZWNvbmRhcnlfc3RhcnQKPj4gwqDCoMKgwqAgcHJvdG90eXBlIgo+PiAtLS0KPiAKPiBSZXZp
ZXdlZC1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KPiAKCi0tIApK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
