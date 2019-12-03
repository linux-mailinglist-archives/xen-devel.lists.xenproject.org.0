Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BF3110082
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 15:42:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ic9Jz-0008QM-J8; Tue, 03 Dec 2019 14:38:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mcKG=ZZ=arm.com=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1ic9Jy-0008QH-SH
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 14:38:34 +0000
X-Inumbo-ID: 955beba6-15da-11ea-a55d-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 955beba6-15da-11ea-a55d-bc764e2007e4;
 Tue, 03 Dec 2019 14:38:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F16731B;
 Tue,  3 Dec 2019 06:38:33 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CEF2E3F52E;
 Tue,  3 Dec 2019 06:38:32 -0800 (PST)
Date: Tue, 3 Dec 2019 14:38:18 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Julien Grall <julien@xen.org>
Message-ID: <20191203143818.09e74f25@donnerap.cambridge.arm.com>
In-Reply-To: <86d52917-1ba3-a660-2502-56b9657086b9@xen.org>
References: <20191202084924.29893-1-tiny.windzz@gmail.com>
 <86d52917-1ba3-a660-2502-56b9657086b9@xen.org>
Organization: ARM
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/arm: Basic support for sunxi/sun50i h6
 platform.
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
Cc: Yangtao Li <tiny.windzz@gmail.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAzIERlYyAyMDE5IDExOjM5OjU4ICswMDAwCkp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+IHdyb3RlOgoKSGksCgo+ICgrQW5kcmUpCj4gCj4gSGksCj4gCj4gQEFuZHJlLCBJSVJD
IHlvdSBvcmlnaW5hbGx5IGFkZGVkIHRoZSBzdXBwb3J0IGZvciBzdW54aSBpbiBYZW4uIENvdWxk
IAo+IHlvdSBoYXZlIGEgbG9vayBhdCB0aGlzIHBhdGNoPwoKTG9va3MgYWxyaWdodCwgYW5kIGlu
ZGVlZCB0aGUgSDYgbmVlZHMgaXQuIEV2ZW4gdGhvdWdoIEFsbHdpbm5lciB0b3RhbGx5IHJlLWFy
cmFuZ2VkIHRoZSBtZW1vcnkgbWFwLCB0aGV5IG1pc3NlZCB0aGUgb3Bwb3J0dW5pdHkgdG8gcHV0
IGVhY2ggZGV2aWNlIGF0IGxlYXN0IGluIHRoZWlyIG93biA0SyBwYWdlLgoKUmV2aWV3ZWQtYnk6
IEFuZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5d2FyYUBhcm0uY29tPgoKCklmIHlvdSBjYW4gd2Fp
dCB0aWxsIHRoaXMgZXZlbmluZywgSSBjYW4gZXZlbiB0ZXN0IGl0LgoKSXQncyBhY3R1YWxseSBh
IHNoYW1lIHRoYXQgd2UgbmVlZCB0aGlzIGVudW1lcmF0aW9uLCB3aGVuIGFsbCB3ZSBhcmUgYWZ0
ZXIgaXMgYW4gYW5zd2VyIHRvIHRoZSBxdWVzdGlvbjogRG9lcyBhIGRldmljZSB1c2VkIGJ5IFhl
biBzaGFyZSBhIDRLIHBhZ2Ugd2l0aCBhIGRldmljZSBoYW5kZWQgb2ZmIHRvIERvbTA/IEl0IHNv
dW5kcyBsaWtlIGEgbmljZSByYWlueSBhZnRlcm5vb24gZXhlcmNpc2UgdG8gc2NhbiB0aGUgRFQg
dG8gZmluZCB0aG9zZSBkZXZpY2VzIGF1dG9tYXRpY2FsbHkgYW5kIG1hc2sgdGhlbSAob24gdGhl
IEE2NCBmb3IgaW5zdGFuY2UgVUFSVDQgaXMgb24gYSBkaWZmZXJlbnQgcGFnZSkuCgpDaGVlcnMs
CkFuZHJlCgo+IE9uIDAyLzEyLzIwMTkgMDg6NDksIFlhbmd0YW8gTGkgd3JvdGU6Cj4gPiBhZGRp
bmcgY29tcGF0aWJsZSBzdHJpbmdzIGZvciBoNiBTb0NzLCBTcGVjaWZpY2FsbHkgb3JhbmdlcGkz
Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBZYW5ndGFvIExpIDx0aW55LndpbmR6ekBnbWFpbC5j
b20+ICAKPiA+IC0tLSA+ICAgeGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9zdW54aS5jIHwgMSArICAK
PiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPiAKPiA+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL3N1bnhpLmMgYi94ZW4vYXJjaC9hcm0vcGxhdGZvcm1z
L3N1bnhpLmMKPiA+IGluZGV4IDU1NzA1YjE1YjIuLmU4ZTRkODhiZWYgMTAwNjQ0Cj4gPiAtLS0g
YS94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL3N1bnhpLmMKPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9w
bGF0Zm9ybXMvc3VueGkuYwo+ID4gQEAgLTExOSw2ICsxMTksNyBAQCBzdGF0aWMgY29uc3QgY2hh
ciAqIGNvbnN0IHN1bnhpX3Y4X2R0X2NvbXBhdFtdIF9faW5pdGNvbnN0ID0KPiA+ICAgewo+ID4g
ICAgICAgImFsbHdpbm5lcixzdW41MGktYTY0IiwKPiA+ICAgICAgICJhbGx3aW5uZXIsc3VuNTBp
LWg1IiwKPiA+ICsgICAgImFsbHdpbm5lcixzdW41MGktaDYiLAo+ID4gICAgICAgTlVMTAo+ID4g
ICB9Owo+ID4gICAKPiA+ICAgCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
