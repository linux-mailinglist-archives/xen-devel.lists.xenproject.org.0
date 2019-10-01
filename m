Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7217CC4244
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 23:02:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFPFg-0004Mj-VT; Tue, 01 Oct 2019 21:00:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JHuc=X2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iFPFf-0004IX-Mo
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 21:00:07 +0000
X-Inumbo-ID: 7284290e-e48e-11e9-bf31-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 7284290e-e48e-11e9-bf31-bc764e2007e4;
 Tue, 01 Oct 2019 21:00:07 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A1E6A215EA;
 Tue,  1 Oct 2019 21:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569963606;
 bh=FQTZEfofLciIugh+rSCbXefacxs1scNTwAUvK3jekgs=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=2oQ/C9H5/FPpZveruNBYuJxgwsOXr/AXFizp9EtrGv89tsYqVVZVJciHb4KRxywWY
 IbKjoZJRHxFcc/cuzqFtltaC6iM/82SVwUueRIFznyC8jDt+ZKJ/MJny765BxAZmF6
 NtTdjKnK/wkFFo2/uhW3FZVgBF9eNTWweqlOiEN8=
Date: Tue, 1 Oct 2019 14:00:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190926183808.11630-8-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1910011358180.20899@sstabellini-ThinkPad-T480s>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-8-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 07/10] xen/arm: Allow insn.h to
 be called from assembly
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, andrii.anisov@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyNiBTZXAgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEEgZm9sbG93LXVwIHBh
dGNoIHdpbGwgcmVxdWlyZSB0byBpbmNsdWRlIGluc24uaCBmcm9tIGFzc2VtYmx5IGNvZGUuIFNv
Cj4gd2VlIG5lZWQgdG8gcHJvdGVjdCBhbnkgQy1zcGVjaWZpYyBkZWZpbml0aW9uIHRvIGF2b2lk
IGNvbXBpbGF0aW9uCiAgXiB3ZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeIGRlZmlu
aXRpb25zCgo+IGVycm9yIHdoZW4gdXNlZCBpbiBhc3NlbWJseSBjb2RlLgogIF4gZXJyb3JzCgoK
PiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+
IC0tLQo+ICB4ZW4vaW5jbHVkZS9hc20tYXJtL2luc24uaCB8IDggKysrKysrKysKPiAgMSBmaWxl
IGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9h
c20tYXJtL2luc24uaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vaW5zbi5oCj4gaW5kZXggMTkyNzcy
MTJlMS4uMDAzOTFmODNmOSAxMDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL2luc24u
aAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vaW5zbi5oCj4gQEAgLTEsOCArMSwxNCBAQAo+
ICAjaWZuZGVmIF9fQVJDSF9BUk1fSU5TTgo+ICAjZGVmaW5lIF9fQVJDSF9BUk1fSU5TTgo+ICAK
PiArI2lmbmRlZiBfX0FTU0VNQkxZX18KPiArCj4gICNpbmNsdWRlIDx4ZW4vdHlwZXMuaD4KPiAg
Cj4gKy8qCj4gKyAqIEF0IHRoZSBtb21lbnQsIGFyY2gtc3BlY2lmaWMgaGVhZGVycyBjb250YWlu
IG9ubHkgZGVmaW5pdGlvbiBmb3IgQwo+ICsgKiBjb2RlLgo+ICsgKi8KClBsZWFzZSByZW1vdmUg
IkF0IHRoZSBtb21lbnQsICIgYmVjYXVzZSBpbi1jb2RlIGNvbW1lbnQgc2hvdWxkIGFsd2F5cwpy
ZWZsZWN0IHRoZSBsYXRlc3Qgc3RhdGUgb2YgdGhlIGNvZGViYXNlLgoKCj4gICNpZiBkZWZpbmVk
KENPTkZJR19BUk1fNjQpCj4gICMgaW5jbHVkZSA8YXNtL2FybTY0L2luc24uaD4KPiAgI2VsaWYg
ZGVmaW5lZChDT05GSUdfQVJNXzMyKQo+IEBAIC0xMSw2ICsxNyw4IEBACj4gICMgZXJyb3IgInVu
a25vd24gQVJNIHZhcmlhbnQiCj4gICNlbmRpZgo+ICAKPiArI2VuZGlmIC8qIF9fQVNTRU1CTFlf
XyAqLwo+ICsKPiAgLyogT24gQVJNMzIsNjQgaW5zdHJ1Y3Rpb25zIGFyZSBhbHdheXMgNCBieXRl
cyBsb25nLiAqLwo+ICAjZGVmaW5lIEFSQ0hfUEFUQ0hfSU5TTl9TSVpFIDQKPiAgCj4gLS0gCj4g
Mi4xMS4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
