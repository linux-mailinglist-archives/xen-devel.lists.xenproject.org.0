Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E73FBC650
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 13:12:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCig2-0003IF-PO; Tue, 24 Sep 2019 11:08:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IFsf=XT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iCig1-0003I9-Bm
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 11:08:13 +0000
X-Inumbo-ID: 85b6668c-deb1-11e9-994c-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 85b6668c-deb1-11e9-994c-bc764e2007e4;
 Tue, 24 Sep 2019 09:56:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17558142F;
 Tue, 24 Sep 2019 02:56:04 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 63B0E3F67D;
 Tue, 24 Sep 2019 02:56:03 -0700 (PDT)
To: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1568224770-25402-1-git-send-email-olekstysh@gmail.com>
 <f328bc9a-8466-c87e-a00c-223172823ac3@arm.com>
 <b901ff2d-0697-ee83-b929-da1832d365b4@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <943049d6-e4e3-c725-6197-977c9cfcaa7b@arm.com>
Date: Tue, 24 Sep 2019 10:56:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b901ff2d-0697-ee83-b929-da1832d365b4@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH V3] xen/arm: Restrict "p2m_ipa_bits"
 according to the IOMMU requirements
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
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyNC8wOS8yMDE5IDEwOjU1LCBPbGVrc2FuZHIgd3JvdGU6Cj4gT24gMjQuMDkuMTkg
MTI6MzYsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gVGhlIHJlc3Qgb2YgdGhlIGNvZGUgbG9va3Mg
Z29vZCB0byBtZS4KPiAKPiAKPiBTaGFsbCB0aGUgbm9uLVJGQyBwYXRjaCBiZSBzcGxpdCBpbnRv
ICJhZGRpbmcgcG9zc2liaWxpdHkgdG8gcmVzdHJpY3QiIGFuZCAKPiAicmVzdHJpY3QgYnkgdGhl
IElPTU1VIGRyaXZlcnMiPwoKVGhlIHBhdGNoIGlzIGZpbmUgYXMgaXQgaXMuIE5vIG5lZWQgdG8g
c3BsaXQgZnVydGhlciA6KS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
