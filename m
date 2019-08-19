Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E673E94D2A
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 20:40:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzmYV-0005VW-11; Mon, 19 Aug 2019 18:38:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UkZp=WP=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hzmYS-0005VN-VA
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 18:38:56 +0000
X-Inumbo-ID: 99912344-c2b0-11e9-8bf0-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 99912344-c2b0-11e9-8bf0-12813bfff9fa;
 Mon, 19 Aug 2019 18:38:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97FA1360;
 Mon, 19 Aug 2019 11:38:55 -0700 (PDT)
Received: from [10.37.12.162] (unknown [10.37.12.162])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C202A3F246;
 Mon, 19 Aug 2019 11:38:54 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1908191011060.20094@sstabellini-ThinkPad-T480s>
 <20190819174338.10466-7-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <f9fb42c3-29fc-27b3-26ea-43ac38939278@arm.com>
Date: Mon, 19 Aug 2019 19:38:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190819174338.10466-7-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 7/8] xen/arm: don't iomem_permit_access
 for reserved-memory regions
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDgvMTkvMTkgNjo0MyBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IERvbid0IGFsbG93IHJlc2VydmVkLW1lbW9yeSByZWdpb25zIHRvIGJlIHJlbWFwcGVkIGlu
dG8gYW55IHVucHJpdmlsZWdlZAo+IGd1ZXN0cywgdW50aWwgcmVzZXJ2ZWQtbWVtb3J5IHJlZ2lv
bnMgYXJlIHByb3Blcmx5IHN1cHBvcnRlZCBpbiBYZW4uIEZvcgo+IG5vdywgZG8gbm90IGNhbGwg
aW9tZW1fcGVybWl0X2FjY2VzcyBvbiB0aGVtLCBiZWNhdXNlIGdpdmluZwo+IGlvbWVtX3Blcm1p
dF9hY2Nlc3MgdG8gZG9tMCBtZWFucyB0aGF0IHRoZSB0b29sc3RhY2sgd2lsbCBiZSBhYmxlIHRv
Cj4gYXNzaWduIHRoZSByZWdpb24gdG8gYSBkb21VLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZh
bm8gU3RhYmVsbGluaSA8c3RlZmFub3NAeGlsaW54LmNvbT4KCkFja2VkLWJ5OiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
