Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBC2BB17F
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 11:33:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCKhI-00039Z-SZ; Mon, 23 Sep 2019 09:31:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XQlp=XS=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iCKhG-00039R-Jb
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 09:31:54 +0000
X-Inumbo-ID: fa784530-dde4-11e9-95f7-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id fa784530-dde4-11e9-95f7-12813bfff9fa;
 Mon, 23 Sep 2019 09:31:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 616161000;
 Mon, 23 Sep 2019 02:31:53 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B23FC3F59C;
 Mon, 23 Sep 2019 02:31:52 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190918185041.22738-1-volodymyr_babchuk@epam.com>
 <20190918185041.22738-4-volodymyr_babchuk@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <75ae7889-6dca-d6bd-e258-80eb912048cf@arm.com>
Date: Mon, 23 Sep 2019 10:31:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190918185041.22738-4-volodymyr_babchuk@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 3/6] xen/arm: optee: limit number of
 shared buffers
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

SGkgVm9sb2R5bXlyLAoKT24gMTgvMDkvMjAxOSAxOTo1MCwgVm9sb2R5bXlyIEJhYmNodWsgd3Jv
dGU6Cj4gV2Ugd2FudCB0byBsaW1pdCBudW1iZXIgb2Ygc2hhcmVkIGJ1ZmZlcnMgdGhhdCBndWVz
dCBjYW4gcmVnaXN0ZXIgaW4KPiBPUC1URUUuIEV2ZXJ5IHN1Y2ggYnVmZmVyIGNvbnN1bWVzIFhF
TiByZXNvdXJjZXMgYW5kIHdlIGRvbid0IHdhbnQKPiBndWVzdCB0byBleGhhdXN0IFhFTi4gU28g
d2UgY2hvb3NlIGFyYml0cmFyeSBsaW1pdCBmb3Igc2hhcmVkIGJ1ZmZlcnMuCj4gCj4gU2lnbmVk
LW9mZi1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9keW15cl9iYWJjaHVrQGVwYW0uY29tPgoK
QWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpDaGVlcnMsCgot
LSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
