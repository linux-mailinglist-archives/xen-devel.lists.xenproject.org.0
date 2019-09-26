Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF36BF562
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 17:00:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDVCR-0003lG-HA; Thu, 26 Sep 2019 14:56:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOM6=XV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDVCP-0003lB-T6
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 14:56:53 +0000
X-Inumbo-ID: e042d8f2-e06d-11e9-9658-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id e042d8f2-e06d-11e9-9658-12813bfff9fa;
 Thu, 26 Sep 2019 14:56:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDEB328;
 Thu, 26 Sep 2019 07:56:52 -0700 (PDT)
Received: from [10.37.8.90] (unknown [10.37.8.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B8CE3F534;
 Thu, 26 Sep 2019 07:56:50 -0700 (PDT)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1569496834-7796-1-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <6c7d9f90-227a-c20a-090a-560a0805eb6b@arm.com>
Date: Thu, 26 Sep 2019 15:56:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1569496834-7796-1-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V6 0/8] iommu/arm: Add Renesas IPMMU-VMSA
 support + Linux's iommu_fwspec
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
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, sstabellini@kernel.org,
 volodymyr_babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA5LzI2LzE5IDEyOjIwIFBNLCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3cm90ZToKPiBP
bGVrc2FuZHIgVHlzaGNoZW5rbyAoOCk6Cj4gICAgaW9tbXUvYXJtOiBBZGQgaW9tbXVfaGVscGVy
cy5jIGZpbGUgdG8ga2VlcCBjb21tb24gZm9yIElPTU1VcyBzdHVmZgo+ICAgIGlvbW11L2FybTog
QWRkIGFiaWxpdHkgdG8gaGFuZGxlIGRlZmVycmVkIHByb2JpbmcgcmVxdWVzdAo+ICAgIHhlbi9j
b21tb246IEludHJvZHVjZSBfeHJlYWxsb2MgZnVuY3Rpb24KPiAgICB4ZW4vY29tbW9uOiBJbnRy
b2R1Y2UgeHJlYWxsb2NfZmxleF9zdHJ1Y3QoKSBoZWxwZXIgbWFjcm9zCj4gICAgaW9tbXUvYXJt
OiBBZGQgbGlnaHR3ZWlnaHQgaW9tbXVfZndzcGVjIHN1cHBvcnQKPiAgICBpb21tdTogT3JkZXIg
dGhlIGhlYWRlcnMgYWxwaGFiZXRpY2FsbHkgaW4gZGV2aWNlX3RyZWUuYwo+ICAgIGlvbW11L2Fy
bTogSW50cm9kdWNlIGlvbW11X2FkZF9kdF9kZXZpY2UgQVBJCj4gICAgaW9tbXUvYXJtOiBBZGQg
UmVuZXNhcyBJUE1NVS1WTVNBIHN1cHBvcnQKClRoaXMgc2VyaWVzIGlzIG5vdyBtZXJnZWQuCgpD
aGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
