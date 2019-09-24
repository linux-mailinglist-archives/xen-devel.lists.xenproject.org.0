Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C247BBCBC2
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 17:45:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCmyE-0001ND-Gd; Tue, 24 Sep 2019 15:43:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IFsf=XT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iCmyD-0001N5-NA
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 15:43:17 +0000
X-Inumbo-ID: 06badf62-dee2-11e9-9621-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 06badf62-dee2-11e9-9621-12813bfff9fa;
 Tue, 24 Sep 2019 15:43:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 770A6142F;
 Tue, 24 Sep 2019 08:43:16 -0700 (PDT)
Received: from [10.1.39.57] (unknown [10.1.39.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF62E3F59C;
 Tue, 24 Sep 2019 08:43:15 -0700 (PDT)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1569339027-19484-1-git-send-email-olekstysh@gmail.com>
 <1569339027-19484-7-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <024ab9c0-5612-d634-a168-5d54be99a711@arm.com>
Date: Tue, 24 Sep 2019 16:43:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1569339027-19484-7-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V5 6/8] iommu: Order the headers
 alphabetically in device_tree.c
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org, volodymyr_babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA5LzI0LzE5IDQ6MzAgUE0sIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3RlOgo+IEZy
b206IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4K
PiAKPiBDbGVhbiB1cCB0aGUgY29kZSBhIGJpdCBieSBwdXR0aW5nIHRoZSBoZWFkZXJzIGluIGFs
cGhhYmV0aWNhbCBvcmRlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgVHlzaGNoZW5r
byA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxs
IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVycywKCj4gLS0tCj4gICB4ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9kZXZpY2VfdHJlZS5jIHwgNiArKystLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL2RldmljZV90cmVlLmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9k
ZXZpY2VfdHJlZS5jCj4gaW5kZXggMTJmMmM0Yy4uM2YzMjhmNCAxMDA2NDQKPiAtLS0gYS94ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC9kZXZpY2VfdHJlZS5jCj4gKysrIGIveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvZGV2aWNlX3RyZWUuYwo+IEBAIC0xNSwxMSArMTUsMTEgQEAKPiAgICAqIEdOVSBH
ZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCj4gICAgKi8KPiAgIAo+IC0j
aW5jbHVkZSA8eGVuL2xpYi5oPgo+IC0jaW5jbHVkZSA8eGVuL3NjaGVkLmg+Cj4gKyNpbmNsdWRl
IDx4ZW4vZGV2aWNlX3RyZWUuaD4KPiAgICNpbmNsdWRlIDx4ZW4vZ3Vlc3RfYWNjZXNzLmg+Cj4g
ICAjaW5jbHVkZSA8eGVuL2lvbW11Lmg+Cj4gLSNpbmNsdWRlIDx4ZW4vZGV2aWNlX3RyZWUuaD4K
PiArI2luY2x1ZGUgPHhlbi9saWIuaD4KPiArI2luY2x1ZGUgPHhlbi9zY2hlZC5oPgo+ICAgI2lu
Y2x1ZGUgPHhzbS94c20uaD4KPiAgIAo+ICAgc3RhdGljIHNwaW5sb2NrX3QgZHRkZXZzX2xvY2sg
PSBTUElOX0xPQ0tfVU5MT0NLRUQ7Cj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
