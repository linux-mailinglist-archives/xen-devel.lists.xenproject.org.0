Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2060BAFA3A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 12:20:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7zge-0006sm-W3; Wed, 11 Sep 2019 10:17:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VrDL=XG=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i7zgd-0006se-LC
 for xen-devel@lists.xen.org; Wed, 11 Sep 2019 10:17:19 +0000
X-Inumbo-ID: 549b6540-d47d-11e9-ac27-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 549b6540-d47d-11e9-ac27-12813bfff9fa;
 Wed, 11 Sep 2019 10:17:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BA6A28;
 Wed, 11 Sep 2019 03:17:16 -0700 (PDT)
Received: from [10.37.12.223] (unknown [10.37.12.223])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 105DC3F71F;
 Wed, 11 Sep 2019 03:17:14 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1908201838370.20094@sstabellini-ThinkPad-T480s>
 <20190821035315.12812-6-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <f65182b7-f5a9-e1d9-078e-39f4b32f41c1@arm.com>
Date: Wed, 11 Sep 2019 11:17:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821035315.12812-6-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 6/8] xen/arm: handle "multiboot,
 device-tree" compatible nodes
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
Cc: Volodymyr_Babchuk@epam.com, Achin.Gupta@arm.com, andrii_anisov@epam.com,
 Stefano Stabellini <stefanos@xilinx.com>, xen-devel@lists.xen.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDgvMjEvMTkgNDo1MyBBTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IERldGVjdCAibXVsdGlib290LGRldmljZS10cmVlIiBjb21wYXRpYmxlIG5vZGVzLiBBZGQg
dGhlbSB0byB0aGUgYm9vdG1vZAo+IGFycmF5IGFzIEJPT1RNT0RfR1VFU1RfRFRCLiAgSW4ga2Vy
bmVsX3Byb2JlLCBmaW5kIHRoZSByaWdodAo+IEJPT1RNT0RfR1VFU1RfRFRCIGFuZCBzdG9yZSBh
IHBvaW50ZXIgdG8gaXQgaW4gZHRiX2Jvb3Rtb2R1bGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgoKQWNrZWQtYnk6IEp1bGllbiBH
cmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
