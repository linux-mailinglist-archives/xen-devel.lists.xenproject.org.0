Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B556AF270
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 22:56:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7n8r-0005uN-JK; Tue, 10 Sep 2019 20:53:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IMu8=XF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i7n8q-0005uI-0m
 for xen-devel@lists.xen.org; Tue, 10 Sep 2019 20:53:36 +0000
X-Inumbo-ID: 0d76fdc0-d40d-11e9-978d-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 0d76fdc0-d40d-11e9-978d-bc764e2007e4;
 Tue, 10 Sep 2019 20:53:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 824AA337;
 Tue, 10 Sep 2019 13:53:33 -0700 (PDT)
Received: from [10.37.12.155] (unknown [10.37.12.155])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E6603F59C;
 Tue, 10 Sep 2019 13:53:31 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1908201838370.20094@sstabellini-ThinkPad-T480s>
 <20190821035315.12812-2-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <8dc9b6b1-7aa1-491e-9026-28a3a33eb8f1@arm.com>
Date: Tue, 10 Sep 2019 21:53:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821035315.12812-2-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 2/8] xen/arm: export device_tree_get_reg
 and device_tree_get_u32
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

SGksCgpPbiA4LzIxLzE5IDQ6NTMgQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBUaGV5
J2xsIGJlIHVzZWQgaW4gbGF0ZXIgcGF0Y2hlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+Cj4gCj4gLS0tCj4gQ2hhbmdlcyBpbiB2
NDoKPiAtIG5ldyBwYXRjaAo+IC0tLQo+ICAgeGVuL2FyY2gvYXJtL2Jvb3RmZHQuYyAgICAgICAg
fCA4ICsrKystLS0tCj4gICB4ZW4vaW5jbHVkZS94ZW4vZGV2aWNlX3RyZWUuaCB8IDYgKysrKysr
CgpkZXZpY2VfdHJlZS5oIGlzIGEgY29tbW9uIGhlYWRlciB0aGF0IGRlc2NyaWJlIGFsbCB0aGUg
ZnVuY3Rpb24gCmltcGxlbWVudGVkIGJ5IGNvbW1vbi9kZXZpY2VfdHJlZS5jLgoKTW9zdCBsaWtl
bHkgeW91IHdhbnQgdG8gZGVjbGFyZSB0aGUgcHJvdG90eXBlIGluIGFzbS1hcm0vc2V0dXAuaCBh
cyB0aGlzIAppcyBkb25lIGZvciBhbGwgdGhlIG90aGVycyBmdW5jdGlvbiBleHBvcnRlZCBpbiBi
b290ZmR0LmMuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
