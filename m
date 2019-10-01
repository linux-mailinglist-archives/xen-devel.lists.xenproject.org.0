Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62717C3F37
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 20:00:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFMOx-0004hs-4K; Tue, 01 Oct 2019 17:57:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JHuc=X2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iFMOv-0004hn-C1
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 17:57:29 +0000
X-Inumbo-ID: ee3a18df-e474-11e9-9704-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id ee3a18df-e474-11e9-9704-12813bfff9fa;
 Tue, 01 Oct 2019 17:57:28 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9E73E20B7C;
 Tue,  1 Oct 2019 17:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569952648;
 bh=jqZrJUX/XvHY6Hze9NH6ANRNQKWFpLy6ihQsCU8ZVXU=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=p/ss4BNFk5GNO9LEAdZY55fbLBbq5aU5+/DJtdyKgkR7kC2Adid8j0us+djkbTTnA
 AFbWE2ltcLs82tOW81pHoWX4RYmtGDRuXu5TDUWJ+vdfDsoYuNREDcGOQSpYV5LLAg
 hFElPWAHSpMWKB5Iqdt7ikEUdDnMUB9Cwmg5nDRs=
Date: Tue, 1 Oct 2019 10:57:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <20190927154920.13713-1-ross.lagerwall@citrix.com>
Message-ID: <alpine.DEB.2.21.1910011057170.20899@sstabellini-ThinkPad-T480s>
References: <20190927154920.13713-1-ross.lagerwall@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/efi: Set nonblocking callbacks
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyNyBTZXAgMjAxOSwgUm9zcyBMYWdlcndhbGwgd3JvdGU6Cj4gT3RoZXIgcGFydHMg
b2YgdGhlIGtlcm5lbCBleHBlY3QgdGhlc2Ugbm9uYmxvY2tpbmcgRUZJIGNhbGxiYWNrcyB0bwo+
IGV4aXN0IGFuZCBjcmFzaCB3aGVuIHJ1bm5pbmcgdW5kZXIgWGVuLiBTaW5jZSB0aGUgaW1wbGVt
ZW50YXRpb25zIG9mCj4geGVuX2VmaV9zZXRfdmFyaWFibGUoKSBhbmQgeGVuX2VmaV9xdWVyeV92
YXJpYWJsZV9pbmZvKCkgZG8gbm90IHRha2UgYW55Cj4gbG9ja3MsIHVzZSB0aGVtIGZvciB0aGUg
bm9uYmxvY2tpbmcgY2FsbGJhY2tzIHRvby4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb3NzIExhZ2Vy
d2FsbCA8cm9zcy5sYWdlcndhbGxAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBTdGVmYW5vIFN0YWJl
bGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgoKPiAtLS0KPiAgYXJjaC9hcm0veGVuL2Vm
aS5jIHwgMiArKwo+ICBhcmNoL3g4Ni94ZW4vZWZpLmMgfCAyICsrCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL3hlbi9lZmkuYyBi
L2FyY2gvYXJtL3hlbi9lZmkuYwo+IGluZGV4IGQ2ODdhNzMwNDRiZi4uY2IyYWFmOThlMjQzIDEw
MDY0NAo+IC0tLSBhL2FyY2gvYXJtL3hlbi9lZmkuYwo+ICsrKyBiL2FyY2gvYXJtL3hlbi9lZmku
Ywo+IEBAIC0xOSw3ICsxOSw5IEBAIHZvaWQgX19pbml0IHhlbl9lZmlfcnVudGltZV9zZXR1cCh2
b2lkKQo+ICAJZWZpLmdldF92YXJpYWJsZSAgICAgICAgICAgICA9IHhlbl9lZmlfZ2V0X3Zhcmlh
YmxlOwo+ICAJZWZpLmdldF9uZXh0X3ZhcmlhYmxlICAgICAgICA9IHhlbl9lZmlfZ2V0X25leHRf
dmFyaWFibGU7Cj4gIAllZmkuc2V0X3ZhcmlhYmxlICAgICAgICAgICAgID0geGVuX2VmaV9zZXRf
dmFyaWFibGU7Cj4gKwllZmkuc2V0X3ZhcmlhYmxlX25vbmJsb2NraW5nID0geGVuX2VmaV9zZXRf
dmFyaWFibGU7Cj4gIAllZmkucXVlcnlfdmFyaWFibGVfaW5mbyAgICAgID0geGVuX2VmaV9xdWVy
eV92YXJpYWJsZV9pbmZvOwo+ICsJZWZpLnF1ZXJ5X3ZhcmlhYmxlX2luZm9fbm9uYmxvY2tpbmcg
PSB4ZW5fZWZpX3F1ZXJ5X3ZhcmlhYmxlX2luZm87Cj4gIAllZmkudXBkYXRlX2NhcHN1bGUgICAg
ICAgICAgID0geGVuX2VmaV91cGRhdGVfY2Fwc3VsZTsKPiAgCWVmaS5xdWVyeV9jYXBzdWxlX2Nh
cHMgICAgICAgPSB4ZW5fZWZpX3F1ZXJ5X2NhcHN1bGVfY2FwczsKPiAgCWVmaS5nZXRfbmV4dF9o
aWdoX21vbm9fY291bnQgPSB4ZW5fZWZpX2dldF9uZXh0X2hpZ2hfbW9ub19jb3VudDsKPiBkaWZm
IC0tZ2l0IGEvYXJjaC94ODYveGVuL2VmaS5jIGIvYXJjaC94ODYveGVuL2VmaS5jCj4gaW5kZXgg
MGQzMzY1Y2I2NGRlLi43ZTNlYjcwZjQxMWEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC94ODYveGVuL2Vm
aS5jCj4gKysrIGIvYXJjaC94ODYveGVuL2VmaS5jCj4gQEAgLTY1LDcgKzY1LDkgQEAgc3RhdGlj
IGVmaV9zeXN0ZW1fdGFibGVfdCBfX2luaXQgKnhlbl9lZmlfcHJvYmUodm9pZCkKPiAgCWVmaS5n
ZXRfdmFyaWFibGUgICAgICAgICAgICAgPSB4ZW5fZWZpX2dldF92YXJpYWJsZTsKPiAgCWVmaS5n
ZXRfbmV4dF92YXJpYWJsZSAgICAgICAgPSB4ZW5fZWZpX2dldF9uZXh0X3ZhcmlhYmxlOwo+ICAJ
ZWZpLnNldF92YXJpYWJsZSAgICAgICAgICAgICA9IHhlbl9lZmlfc2V0X3ZhcmlhYmxlOwo+ICsJ
ZWZpLnNldF92YXJpYWJsZV9ub25ibG9ja2luZyA9IHhlbl9lZmlfc2V0X3ZhcmlhYmxlOwo+ICAJ
ZWZpLnF1ZXJ5X3ZhcmlhYmxlX2luZm8gICAgICA9IHhlbl9lZmlfcXVlcnlfdmFyaWFibGVfaW5m
bzsKPiArCWVmaS5xdWVyeV92YXJpYWJsZV9pbmZvX25vbmJsb2NraW5nID0geGVuX2VmaV9xdWVy
eV92YXJpYWJsZV9pbmZvOwo+ICAJZWZpLnVwZGF0ZV9jYXBzdWxlICAgICAgICAgICA9IHhlbl9l
ZmlfdXBkYXRlX2NhcHN1bGU7Cj4gIAllZmkucXVlcnlfY2Fwc3VsZV9jYXBzICAgICAgID0geGVu
X2VmaV9xdWVyeV9jYXBzdWxlX2NhcHM7Cj4gIAllZmkuZ2V0X25leHRfaGlnaF9tb25vX2NvdW50
ID0geGVuX2VmaV9nZXRfbmV4dF9oaWdoX21vbm9fY291bnQ7Cj4gLS0gCj4gMi4yMS4wCj4gCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
