Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE38F81CC
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2019 21:59:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUGkU-000161-Kb; Mon, 11 Nov 2019 20:57:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M6oq=ZD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iUGkS-00015t-Ut
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2019 20:57:20 +0000
X-Inumbo-ID: da034a22-04c5-11ea-984a-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da034a22-04c5-11ea-984a-bc764e2007e4;
 Mon, 11 Nov 2019 20:57:20 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7A9D72084F;
 Mon, 11 Nov 2019 20:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573505839;
 bh=yftD79Oa2VIB7cVTLzXmlHwlzSRwmejDrZ67skZfwdk=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=z3EfI2WmdZ5vKSdiPR3TBd/CtySt5lD6vgIgECba9C+fW1B58KbuOgg+/PT2orKhn
 z04bM515y3m3ox49LG0tK+igEETsinvkd7Z2NeN12TYfSrOZ+Gv9h4i1LGcr7kUU9a
 LHitNR2vxxoP/KsmyzllZbBkP/E2yP2RVXI2bTVg=
Date: Mon, 11 Nov 2019 12:57:18 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Andrii Anisov <andrii.anisov@gmail.com>
In-Reply-To: <1573031953-12894-7-git-send-email-andrii.anisov@gmail.com>
Message-ID: <alpine.DEB.2.21.1911111254510.2677@sstabellini-ThinkPad-T480s>
References: <1573031953-12894-1-git-send-email-andrii.anisov@gmail.com>
 <1573031953-12894-7-git-send-email-andrii.anisov@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [RFC 6/7] arm: Introduce dummy empty functions for
 data only C files
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Andrii Anisov <andrii_anisov@epam.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCA2IE5vdiAyMDE5LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEZyb206IEFuZHJpaSBB
bmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+Cj4gCj4gQVJNIENvbXBpbGVyIDYgaGFzIGEg
cHJvdmVuIGJ1ZzogaXQgY29tcGlsZXMgZGF0YSBvbmx5IEMgZmlsZXMgd2l0aAo+IFNvZnRWRlAg
YXR0cmlidXRlcy4gVGhpcyBsZWFkcyB0byBhIGZhaWxlZCBsaW5rYWdlIGFmdGVyd2FyZHMgd2l0
aAo+IGFuIGVycm9yOgo+IAo+IEVycm9yOiBMNjI0MkU6IENhbm5vdCBsaW5rIG9iamVjdCBidWls
dF9pbi5vIGFzIGl0cyBhdHRyaWJ1dGVzIGFyZSBpbmNvbXBhdGlibGUgd2l0aCB0aGUgaW1hZ2Ug
YXR0cmlidXRlcy4KPiAuLi4gQTY0IGNsYXNoZXMgd2l0aCBTb2Z0VkZQLgo+IAo+IFRoZSBrbm93
biB3b3JrYXJvdW5kIGlzIGludHJvZHVjaW5nIHNvbWUgY29kZSBpbnRvIHRoZSBhZmZlY3RlZCBm
aWxlLAo+IGUuZy4gYW4gZW1wdHkgKG5vbi1zdGF0aWMpIGZ1bmN0aW9uIGlzIGVub3VnaC4KCk9o
IG1hbiwgdGhpcyBpcyB0cnVseSBob3JyaWJsZS4KCklmIHdlIHJlYWxseSBoYXZlIHRvIGRvIHRo
aXMgcGxlYXNlOgoKLSB1c2UgdGhlIHNhbWUgZHVtbXkgZnVuY3Rpb24gbmFtZSBpbiBhbGwgZmls
ZXMKLSB0aGUgZnVuY3Rpb24gc2hvdWxkIGJlIHN0YXRpYwotIGhpZGluZyB0aGUgZnVuY3Rpb24g
d2l0aGluIGEgI2lmZGVmIEFSTUNDIGJsb2NrCi0gcG90ZW50aWFsbHkgaGlkZSB0aGUgd2hvbGUg
aG9ycmlibGUgaGFjayBiZWhpbmQgYSAjZGVmaW5lIHNvIHRoYXQgaXQKICB3b3VsZCBiZWNvbWUg
YXQgdGhlIGNhbGwgc2l0ZToKCiArQVJNQ0NfRFVNTVlfRlVOQ19IQUNLKCkKCgoKPiBTaWduZWQt
b2ZmLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgo+Cj4gLS0tCj4g
IHhlbi9hcmNoL2FybS9wbGF0Zm9ybXMvYnJjbS1yYXNwYmVycnktcGkuYyB8IDIgKysKPiAgeGVu
L2FyY2gvYXJtL3BsYXRmb3Jtcy90aHVuZGVyeC5jICAgICAgICAgIHwgMiArKwo+ICB4ZW4veHNt
L2ZsYXNrL2dlbi1wb2xpY3kucHkgICAgICAgICAgICAgICAgfCA0ICsrKysKPiAgMyBmaWxlcyBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3Bs
YXRmb3Jtcy9icmNtLXJhc3BiZXJyeS1waS5jIGIveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9icmNt
LXJhc3BiZXJyeS1waS5jCj4gaW5kZXggYjY5N2ZhMi4uN2FiMTgxMCAxMDA2NDQKPiAtLS0gYS94
ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL2JyY20tcmFzcGJlcnJ5LXBpLmMKPiArKysgYi94ZW4vYXJj
aC9hcm0vcGxhdGZvcm1zL2JyY20tcmFzcGJlcnJ5LXBpLmMKPiBAQCAtNDAsNiArNDAsOCBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IGR0X2RldmljZV9tYXRjaCBycGk0X2JsYWNrbGlzdF9kZXZbXSBf
X2luaXRjb25zdCA9Cj4gICAgICB7IC8qIHNlbnRpbmVsICovIH0sCj4gIH07Cj4gIAo+ICt2b2lk
IGJyY21fcmFzcGJlcnJ5X3BpX2R1bW15X2Z1bmModm9pZCkge30KPiArCj4gIFBMQVRGT1JNX1NU
QVJUKHJwaTQsICJSYXNwYmVycnkgUGkgNCIpCj4gICAgICAuY29tcGF0aWJsZSAgICAgPSBycGk0
X2R0X2NvbXBhdCwKPiAgICAgIC5ibGFja2xpc3RfZGV2ICA9IHJwaTRfYmxhY2tsaXN0X2RldiwK
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy90aHVuZGVyeC5jIGIveGVuL2Fy
Y2gvYXJtL3BsYXRmb3Jtcy90aHVuZGVyeC5jCj4gaW5kZXggOWIzMmEyOS4uODAxNTMyMyAxMDA2
NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL3RodW5kZXJ4LmMKPiArKysgYi94ZW4v
YXJjaC9hcm0vcGxhdGZvcm1zL3RodW5kZXJ4LmMKPiBAQCAtMzMsNiArMzMsOCBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IGR0X2RldmljZV9tYXRjaCB0aHVuZGVyeF9ibGFja2xpc3RfZGV2W10gX19p
bml0Y29uc3QgPQo+ICAgICAgeyAvKiBzZW50aW5lbCAqLyB9LAo+ICB9Owo+ICAKPiArdm9pZCB0
aHVuZGVyeF9kdW1teV9mdW5jKHZvaWQpIHt9Cj4gKwo+ICBQTEFURk9STV9TVEFSVCh0aHVuZGVy
eCwgIlRIVU5ERVJYIikKPiAgICAgIC5jb21wYXRpYmxlID0gdGh1bmRlcnhfZHRfY29tcGF0LAo+
ICAgICAgLmJsYWNrbGlzdF9kZXYgPSB0aHVuZGVyeF9ibGFja2xpc3RfZGV2LAo+IGRpZmYgLS1n
aXQgYS94ZW4veHNtL2ZsYXNrL2dlbi1wb2xpY3kucHkgYi94ZW4veHNtL2ZsYXNrL2dlbi1wb2xp
Y3kucHkKPiBpbmRleCBjNzUwMWU0Li43M2JmN2QyIDEwMDY0NAo+IC0tLSBhL3hlbi94c20vZmxh
c2svZ2VuLXBvbGljeS5weQo+ICsrKyBiL3hlbi94c20vZmxhc2svZ2VuLXBvbGljeS5weQo+IEBA
IC0yMSwzICsyMSw3IEBAIHN5cy5zdGRvdXQud3JpdGUoIiIiCj4gIH07Cj4gIGNvbnN0IHVuc2ln
bmVkIGludCBfX2luaXRjb25zdCB4c21fZmxhc2tfaW5pdF9wb2xpY3lfc2l6ZSA9ICVkOwo+ICAi
IiIgJSBwb2xpY3lfc2l6ZSkKPiArCj4gK3N5cy5zdGRvdXQud3JpdGUoIiIiCj4gK3ZvaWQgcG9s
aWN5X2R1bW15X2Z1bmModm9pZCkge30KPiArIiIiKQo+IC0tIAo+IDIuNy40Cj4gCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
