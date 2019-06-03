Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E76D32EFE
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 13:52:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXlTP-0007Mo-Lp; Mon, 03 Jun 2019 11:49:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fnY6=UC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hXlTO-0007Mg-H4
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 11:49:54 +0000
X-Inumbo-ID: b397f56c-85f5-11e9-8126-e37e90a12579
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id b397f56c-85f5-11e9-8126-e37e90a12579;
 Mon, 03 Jun 2019 11:49:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4D3215A2;
 Mon,  3 Jun 2019 04:49:53 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBBD93F5AF;
 Mon,  3 Jun 2019 04:49:52 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190521212530.12706-1-volodymyr_babchuk@epam.com>
 <20190521212530.12706-3-volodymyr_babchuk@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <1908edda-cdc9-0550-1d56-0332ba91daec@arm.com>
Date: Mon, 3 Jun 2019 12:49:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190521212530.12706-3-volodymyr_babchuk@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 02/10] xen/arm: optee: add OP-TEE header
 files
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

SGksCgpPbiAyMS8wNS8yMDE5IDIyOjI1LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPiBUaGlz
IGhlYWRlciBmaWxlcyBkZXNjcmliZXMgcHJvdG9jb2wgYmV0d2VlbiBPUC1URUUgYW5kIE9QLVRF
RSBjbGllbnQKPiBkcml2ZXIgaW4gTGludXguIFRoZXkgYXJlIG5lZWRlZCBmb3IgdXBjb21pbmcg
T1AtVEVFIG1lZGlhdG9yLCB3aGljaAo+IGlzIGFkZGVkIGluIHRoZSBuZXh0IHBhdGNoLgo+IFJl
YXNvbiB0byBhZGQgdGhvc2UgaGVhZGVycyBpbiBzZXBhcmF0ZSBwYXRjaCBpcyB0byBlYXNlIHVw
IHJldmlldy4KPiBUaG9zZSBmaWxlcyB3ZXJlIHRha2VuIGZyb20gbGludXggdHJlZSAoZHJpdmVy
cy90ZWUvb3B0ZWUvKSBhbmQgbWFuZ2xlZAo+IGEgYml0IHRvIGNvbXBpbGUgd2l0aCBYRU4uCgpD
YW4geW91IG1lbnRpb24gdGhlIHZlcnNpb24gb2YgdGhlIExpbnV4IHRyZWUgeW91IHVzZT8gVGhp
cyB3b3VsZCBoZWxwIHRvIHRyYWNrIApjaGFuZ2UgaW4gdGhlIGZ1dHVyZS4KCldpdGggdGhhdDoK
CkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKQ2hlZXJzLAoK
LS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
