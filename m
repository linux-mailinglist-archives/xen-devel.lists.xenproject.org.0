Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 334AE8B044
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 08:56:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxQgr-0002IT-09; Tue, 13 Aug 2019 06:53:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZmNG=WJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hxQgo-0002FE-CO
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 06:53:50 +0000
X-Inumbo-ID: c16b1b8c-bd37-11e9-abc1-4701bde6c8ea
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c16b1b8c-bd37-11e9-abc1-4701bde6c8ea;
 Mon, 12 Aug 2019 19:31:18 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2548C206C1;
 Mon, 12 Aug 2019 19:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565638277;
 bh=qSHYufRkiuT7ufZLQx+7Vtaap2zUyB/zjFcyIt5Z30A=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=GIKFca+erp8XvwR1VphTQramaenhcHaJI5SEbzcTYEsHA95Zm02qSHwYLLPvNcXI8
 ozbhILBF/34wOiewLdl/cyQa/w9oIUyG+Qn/LPLqYuIXswYzmo0tp2NxYLS6uXb1Oj
 4rl0bXt5zcGh5BrcZ5kwlF9JtPsFa7xELthgBpCM=
Date: Mon, 12 Aug 2019 12:31:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190812112343.26858-1-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1908121230570.7788@sstabellini-ThinkPad-T480s>
References: <20190812112343.26858-1-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/arm: setup: Add Xen as boot module
 before printing all boot modules
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxMiBBdWcgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFNpbmNlIGNvbW1pdCBm
NjA2NThjNmFlICJ4ZW4vYXJtOiBTdG9wIHJlbG9jYXRpbmcgWGVuIiwgdGhlIHBvc2l0aW9uIG9m
Cj4gWGVuIGluIG1lbW9yeSBpcyBub3QgcHJpbnRlZCBhbnltb3JlLiBUaGlzIGNhbiBtYWtlIGRp
ZmZpY3VsdCB0byBkZWJ1Zwo+IGVhcmx5IGNvZGUuCj4gCj4gQXMgWGVuIGlzIG5vdCByZWxvY2F0
ZWQgYW55bW9yZSwgd2UgY2FuIGFkZCBYZW4gYXMgYm9vdCBtb2R1bGUgYmVmb3JlCj4gY2FsbGlu
ZyBib290X2ZkdF9pbmZvKCkuIFdpdGggdGhhdCwgdGhlIGZ1bmN0aW9uIHdpbGwgcHJpbnQgWGVu
IG1vZHVsZQo+IGluZm9ybWF0aW9uIGFsb25nIHdpdGggYWxsIHRoZSBvdGhlciBtb2R1bGVzLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpB
Y2tlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKPiAt
LS0KPiAgeGVuL2FyY2gvYXJtL3NldHVwLmMgfCAxMiArKysrKystLS0tLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL3NldHVwLmMgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwo+IGluZGV4IGQwNDdm
ZjhlMzEuLjc1MDlkNzZkZDQgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL3NldHVwLmMKPiAr
KysgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwo+IEBAIC03NzksMTggKzc3OSwxOCBAQCB2b2lkIF9f
aW5pdCBzdGFydF94ZW4odW5zaWduZWQgbG9uZyBib290X3BoeXNfb2Zmc2V0LAo+ICAgICAgICAg
ICAgICAgICJQbGVhc2UgY2hlY2sgeW91ciBib290bG9hZGVyLlxuIiwKPiAgICAgICAgICAgICAg
ICBmZHRfcGFkZHIpOwo+ICAKPiAtICAgIGZkdF9zaXplID0gYm9vdF9mZHRfaW5mbyhkZXZpY2Vf
dHJlZV9mbGF0dGVuZWQsIGZkdF9wYWRkcik7Cj4gLQo+IC0gICAgY21kbGluZSA9IGJvb3RfZmR0
X2NtZGxpbmUoZGV2aWNlX3RyZWVfZmxhdHRlbmVkKTsKPiAtICAgIHByaW50aygiQ29tbWFuZCBs
aW5lOiAlc1xuIiwgY21kbGluZSk7Cj4gLSAgICBjbWRsaW5lX3BhcnNlKGNtZGxpbmUpOwo+IC0K
PiAgICAgIC8qIFJlZ2lzdGVyIFhlbidzIGxvYWQgYWRkcmVzcyBhcyBhIGJvb3QgbW9kdWxlLiAq
Lwo+ICAgICAgeGVuX2Jvb3Rtb2R1bGUgPSBhZGRfYm9vdF9tb2R1bGUoQk9PVE1PRF9YRU4sCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHBhZGRyX3QpKHVpbnRwdHJfdCkoX3N0YXJ0
ICsgYm9vdF9waHlzX29mZnNldCksCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHBh
ZGRyX3QpKHVpbnRwdHJfdCkoX2VuZCAtIF9zdGFydCArIDEpLCBmYWxzZSk7Cj4gICAgICBCVUdf
T04oIXhlbl9ib290bW9kdWxlKTsKPiAgCj4gKyAgICBmZHRfc2l6ZSA9IGJvb3RfZmR0X2luZm8o
ZGV2aWNlX3RyZWVfZmxhdHRlbmVkLCBmZHRfcGFkZHIpOwo+ICsKPiArICAgIGNtZGxpbmUgPSBi
b290X2ZkdF9jbWRsaW5lKGRldmljZV90cmVlX2ZsYXR0ZW5lZCk7Cj4gKyAgICBwcmludGsoIkNv
bW1hbmQgbGluZTogJXNcbiIsIGNtZGxpbmUpOwo+ICsgICAgY21kbGluZV9wYXJzZShjbWRsaW5l
KTsKPiArCj4gICAgICBzZXR1cF9tbShmZHRfcGFkZHIsIGZkdF9zaXplKTsKPiAgCj4gICAgICAv
KiBQYXJzZSB0aGUgQUNQSSB0YWJsZXMgZm9yIHBvc3NpYmxlIGJvb3QtdGltZSBjb25maWd1cmF0
aW9uICovCj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
