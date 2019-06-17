Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 594D04891C
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 18:37:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcuaf-0006Mq-E4; Mon, 17 Jun 2019 16:34:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jUew=UQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hcuae-0006Ml-Cd
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 16:34:40 +0000
X-Inumbo-ID: ccc28947-911d-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id ccc28947-911d-11e9-8980-bc764e045a96;
 Mon, 17 Jun 2019 16:34:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AAB928;
 Mon, 17 Jun 2019 09:34:38 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D77C33F718;
 Mon, 17 Jun 2019 09:34:37 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190611184541.7281-1-volodymyr_babchuk@epam.com>
 <20190611184541.7281-3-volodymyr_babchuk@epam.com>
 <686a7564-5c8b-937f-1e14-671e7b08a18b@arm.com>
 <1a81a53d-91e3-37e0-79df-8f59a0dc6a2a@arm.com>
 <alpine.DEB.2.21.1906170926150.2072@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <3274e117-4e51-5360-8f94-ece7a6981998@arm.com>
Date: Mon, 17 Jun 2019 17:34:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906170926150.2072@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 02/10] xen/arm: optee: add OP-TEE header
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "lars.kurth@citrix.com" <lars.kurth@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxNy8wNi8yMDE5IDE3OjI4LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gTG9va2lu
ZyBhdCBodHRwczovL3d3dy5nbnUub3JnL2xpY2Vuc2VzL2xpY2Vuc2UtbGlzdC5lbi5odG1sIGFu
ZCBhbHNvCj4gbG9va2luZyBhdCB0aGUgdXNhZ2UgaW4gdGhlIExpbnV4IGtlcm5lbCwgSSBhbSBw
cmV0dHkgc3VyZSBpdCBpcwo+IGNvbXBhdGlibGUuIEhvd2V2ZXIsIGdpdmVuIHRoYXQgdGhlIFhl
biBoeXBlcnZpc29yIGFzIGEgd2hvbGUgaXMgR1BMdjIsCj4gSSB0aGluayBpdCB3b3VsZCBiZSBt
b3JlIHByZWNpc2UgdG8gc2F5Ogo+IAo+IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIu
MC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKCldlbGwsIHRoaXMgaXMgaW1wb3J0ZWQgZnJvbSBPUC1U
RUUuIFNvIEkgZG9uJ3QgdGhpbmsgd2UgaGF2ZSB0aGUgZnJlZWRvbSB0byAKY2hhbmdlIHRoaXMg
Y29weXJpZ2h0IGhlYWRlciBoZXJlLi4uCgpXaGF0IEkgd2FzIGFza2luZyBpcyB3aGV0aGVyIHRo
aXMgaXMgT0sgdG8gaW1wb3J0IEJTRC0yLUNsYXVzZSBjb2RlIGluIFhlbi4gWW91IApzZWVtIHRv
IGFncmVlIHRoYXQgaXQgc2hvdWxkIGJlIHBvc3NpYmxlLgoKSSB3aWxsIGdpdmUgYSBjaGFuY2Ug
dG8gTGFycyB0byBhbnN3ZXIuIEkgd2lsbCBjb21taXQgIzEtOCB0b21vcnJvdyBldmVuaW5nLgoK
Q2hlZXJzLAoKPiAKPiAKPiBPbiBNb24sIDE3IEp1biAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6
Cj4+IGhtbSwgSSBmb3Jnb3QgdG8gQ0MgbGFycy4gU29ycnkgZm9yIHRoYXQuCj4+Cj4+IENoZWVy
cywKPj4KPj4gT24gMTUvMDYvMjAxOSAxOTozOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4gKCsg
TGFycykKPj4+Cj4+PiBIaSwKPj4+Cj4+PiBPbiA2LzExLzE5IDc6NDYgUE0sIFZvbG9keW15ciBC
YWJjaHVrIHdyb3RlOgo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL3RlZS9v
cHRlZV9tc2cuaAo+Pj4+IGIveGVuL2luY2x1ZGUvYXNtLWFybS90ZWUvb3B0ZWVfbXNnLmgKPj4+
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+Pj4+IGluZGV4IDAwMDAwMDAwMDAuLmZlNzQzZGJkZTMK
Pj4+PiAtLS0gL2Rldi9udWxsCj4+Pj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS90ZWUvb3B0
ZWVfbXNnLmgKPj4+PiBAQCAtMCwwICsxLDMxMCBAQAo+Pj4+ICsvKiBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogQlNELTItQ2xhdXNlICovCj4+Pgo+Pj4gSG1tbSwgc29ycnkgSSBoYXZlbid0IG5v
dGljZWQgaXQgdW50aWwgbm93IChTRFBYIGlzIG1vcmUgZXhwbGljaXQgdGhhdCB0aGUKPj4+IGZ1
bGwtYmxvd24gbGljZW5zZSkuIEkgc3VzcGVjdCB0aGlzIGlzIGZpbmUgdG8gaGF2ZSBCU0QtMiBD
bGF1c2UgbGljZW5zZSBpbgo+Pj4gWGVuIGJ1dCBJIHdhbnQgdG8gY29uZmlybWF0aW9uIGZyb20g
c29tZW9uZSBrbm93aW5nIG1vcmUgdGhhbiBtZSBhYm91dAo+Pj4gbGljZW5zZSBjb21wYXRpYmls
aXR5LiBMYXJzPwo+Pj4KPj4+IElmIHRoaXMgaXMgZmluZSwgdGhlbiBJIHdvdWxkIGxpa2UgdG8g
YWRkIGEgd29yZCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgKEkgYW0KPj4+IGhhcHB5IHRvIGRvIHRo
YXQgb24gY29tbWl0KS4KPj4+Cj4+PiBDaGVlcnMsCj4+Pgo+Pgo+PiAtLSAKPj4gSnVsaWVuIEdy
YWxsCj4+CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
