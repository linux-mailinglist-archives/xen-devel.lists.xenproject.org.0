Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E29578BAA2
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 15:43:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxX2Y-0005HI-Pd; Tue, 13 Aug 2019 13:40:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WWvF=WJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxX2X-0005HD-B2
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 13:40:41 +0000
X-Inumbo-ID: efbc2182-bdcf-11e9-859a-07b531c0d0c5
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id efbc2182-bdcf-11e9-859a-07b531c0d0c5;
 Tue, 13 Aug 2019 13:40:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96019344;
 Tue, 13 Aug 2019 06:40:38 -0700 (PDT)
Received: from [10.37.8.112] (unknown [10.37.8.112])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98CB13F694;
 Tue, 13 Aug 2019 06:40:37 -0700 (PDT)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <1564763985-20312-5-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <dd8d6ac0-b5d3-bc1c-1a94-73660a60cabd@arm.com>
Date: Tue, 13 Aug 2019 14:40:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564763985-20312-5-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2 4/6] iommu/arm: Add lightweight
 iommu_fwspec support
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
 sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgT2xla3NhbmRyLAoKT25lIG1vcmUgY29tbWVudCA6KS4KCk9uIDgvMi8xOSA1OjM5IFBNLCBP
bGVrc2FuZHIgVHlzaGNoZW5rbyB3cm90ZToKPiAraW50IGlvbW11X2Z3c3BlY19pbml0KHN0cnVj
dCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqaW9tbXVfZGV2KQo+ICt7Cj4gKyAgICBzdHJ1
Y3QgaW9tbXVfZndzcGVjICpmd3NwZWMgPSBkZXZfaW9tbXVfZndzcGVjX2dldChkZXYpOwo+ICsK
PiArICAgIGlmICggZndzcGVjICkKCkkgd291bGQgYWN0dWFsbHkgY2hlY2sgdGhlIGlvbW11X2Rl
diBwYXNzZWQgaW4gcGFyYW1ldGVyIGlzIHRoZSBzYW1lIGFzIApzdG9yZWQuIFdlIGV4cGVjdCBh
bGwgZGV2aWNlIHRvIGJlIHByb3RlY3RlZCBieSBvbmx5IG9uZSBJT01NVS4gU28gCmJldHRlciB0
byBiZSBzYWZlIHRoYW4gYWxsb3cgb3ZlcnJpZGluZyA7KS4KCkNoZWVycywKCi0tIApKdWxpZW4g
R3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
