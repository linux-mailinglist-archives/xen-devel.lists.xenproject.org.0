Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E41D685742
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 02:36:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvWLz-0007gV-MT; Thu, 08 Aug 2019 00:32:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o++3=WE=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hvWLx-0007gQ-UK
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 00:32:26 +0000
X-Inumbo-ID: fc477a7e-b973-11e9-8e0f-6f3baea1f60d
Received: from new3-smtp.messagingengine.com (unknown [66.111.4.229])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fc477a7e-b973-11e9-8e0f-6f3baea1f60d;
 Thu, 08 Aug 2019 00:32:21 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 820E71ADA;
 Wed,  7 Aug 2019 20:32:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 07 Aug 2019 20:32:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=7CAn2w
 zROOlQxCp/x5wA/QaANP3flaRsiZ28v3cUbck=; b=D9Bhv0rhP4vhgRoGaImTQp
 1Tp04Y6McQPFJOLGwSIDhIOwSSfBgZt22Ibbhgh26eonNTVKyFuXnSIZ5DD3ibLE
 JdLTAtKIg2rtqUBe+hQeoWn+c3mYZKecDlikTQCOLKB/lwqx0AZNtDxhRhoO9KE3
 e3HDuvzpblX8BvDLaUjZJxE7zkdQOvDW8p9PTws46KOOI0heKF/Wb4TdlZIH5u0m
 s/dBsi1J2vh59xDEVxJcfYh5JVqat4p2bxi3DR7UlA3f45TKt8SDnBIjLJeJrVZa
 pB6Y5sOUr5nQ2WvWaRYnw/O1YB4BJioMlSLhSzhs3P0VcOhoSckjD4DbNou54z1w
 ==
X-ME-Sender: <xms:k21LXScTdG6d2s-ZDHkBPa0iLJU3DoyMWYfnbKTX-RkW0iyxCTg-Wg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddugedgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffogggtohfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucffohhmrghinhephhgvrggurdhs
 sgenucfkphepledurdeihedrfeegrdeffeenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhenucevlhhu
 shhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:k21LXdvNdo1Z102gVOHXgLreV7Y5IfC_4ZYa7VWUo_KazwaQCoFkAg>
 <xmx:k21LXRJBEssnQ3JCEhjolll7yzjHDfRF3oSLWsHzJT2drbpxOx7Vpg>
 <xmx:k21LXXaTk4LrAxyxen0__7D-dImYK1Pv7TknTU3tXAbpwpZ3W7-vUA>
 <xmx:lW1LXc4j3I54nRD5Q451cir7UX1DbUOQ-xUYNVhc0xM_83Q2PYmw_g>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 586AA380074;
 Wed,  7 Aug 2019 20:32:18 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  8 Aug 2019 02:31:57 +0200
Message-Id: <20190808003158.5256-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: Invisible Things Lab
Subject: [Xen-devel] [PATCH] EFI: add efi=mapbs option and parse efi= early
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBib290aW5nIFhlbiB2aWEgeGVuLmVmaSwgdGhlcmUgaXMgL21hcGJzIG9wdGlvbiB0byB3
b3JrYXJvdW5kCmNlcnRhaW4gcGxhdGZvcm0gaXNzdWVzIChhZGRlZCBpbiBmMzY4ODZiZGY0ICJF
RkkvZWFybHk6IGFkZCAvbWFwYnMgdG8KbWFwIEVmaUJvb3RTZXJ2aWNlc3tDb2RlLERhdGF9Iiku
IEFkZCBzdXBwb3J0IGZvciBlZmk9bWFwYnMgb24gWGVuCmNtZGxpbmUgZm9yIHRoZSBzYW1lIGVm
ZmVjdCBhbmQgcGFyc2UgaXQgdmVyeSBlYXJseSBpbiB0aGUKbXVsdGlib290MitFRkkgYm9vdCBw
YXRoLgoKTm9ybWFsbHkgY21kbGluZSBpcyBwYXJzZWQgYWZ0ZXIgcmVsb2NhdGluZyBNQjIgc3Ry
dWN0dXJlLCB3aGljaCBoYXBwZW5zCnRvbyBsYXRlLiBUbyBoYXZlIGVmaT0gcGFyc2VkIGVhcmx5
IGVub3VnaCwgc2F2ZSBjbWRsaW5lIHBvaW50ZXIgaW4KaGVhZC5TIGFuZCBwYXNzIGl0IGFzIHll
dCBhbm90aGVyIGFyZ3VtZW50IHRvIGVmaV9tdWx0aWJvb3QyKCkuIFRoaXMKd2F5IHdlIGF2b2lk
IGludHJvZHVjaW5nIHlldCBhbm90aGVyIE1CMiBzdHJ1Y3R1cmUgcGFyc2VyLgoKVG8ga2VlcCBj
b25zaXN0ZW5jeSwgaGFuZGxlIGVmaT0gcGFyYW1ldGVyIGVhcmx5IGluIHhlbi5lZmkgdG9vLCBi
b3RoIGluCnhlbi5lZmkgY29tbWFuZCBsaW5lIGFuZCBjZmcgZmlsZS4KClNpZ25lZC1vZmYtYnk6
IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFi
LmNvbT4KLS0tCiBkb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MgfCAgNiArKysrKy0K
IHhlbi9hcmNoL3g4Ni9ib290L2hlYWQuUyAgICAgICAgICB8IDIxICsrKysrKysrKysrKysrKysr
Ky0tLQogeGVuL2FyY2gveDg2L2VmaS9lZmktYm9vdC5oICAgICAgIHwgMTAgKysrKysrKystLQog
eGVuL2FyY2gveDg2L3g4Nl82NC9hc20tb2Zmc2V0cy5jIHwgIDEgKwogeGVuL2NvbW1vbi9lZmkv
Ym9vdC5jICAgICAgICAgICAgIHwgMjMgKysrKysrKysrKysrKysrKysrKysrKy0KIDUgZmlsZXMg
Y2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
b2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MgYi9kb2NzL21pc2MveGVuLWNvbW1hbmQt
bGluZS5wYW5kb2MKaW5kZXggN2M3MmUzMTAzMi4uYjJkZmQ2NGI0OCAxMDA2NDQKLS0tIGEvZG9j
cy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jCisrKyBiL2RvY3MvbWlzYy94ZW4tY29tbWFu
ZC1saW5lLnBhbmRvYwpAQCAtODg2LDcgKzg4Niw3IEBAIGRpc2FibGUgaXQgKGVkaWQ9bm8pLiBU
aGlzIG9wdGlvbiBzaG91bGQgbm90IG5vcm1hbGx5IGJlIHJlcXVpcmVkCiBleGNlcHQgZm9yIGRl
YnVnZ2luZyBwdXJwb3Nlcy4KIAogIyMjIGVmaQotICAgID0gTGlzdCBvZiBbIHJzPTxib29sPiwg
YXR0cj1ub3x1YyBdCisgICAgPSBMaXN0IG9mIFsgcnM9PGJvb2w+LCBhdHRyPW5vfHVjLCBtYXBi
cz08Ym9vbD4gXQogCiBDb250cm9scyBmb3IgaW50ZXJhY3Rpbmcgd2l0aCB0aGUgc3lzdGVtIEV4
dGVuZGVkIEZpcm13YXJlIEludGVyZmFjZS4KIApAQCAtODk5LDYgKzg5OSwxMCBAQCBDb250cm9s
cyBmb3IgaW50ZXJhY3Rpbmcgd2l0aCB0aGUgc3lzdGVtIEV4dGVuZGVkIEZpcm13YXJlIEludGVy
ZmFjZS4KICAgICBsZWF2ZSB0aGUgbWVtb3J5IHJlZ2lvbnMgdW5tYXBwZWQsIHdoaWxlIGBhdHRy
PXVjYCB3aWxsIG1hcCB0aGVtIGFzIGZ1bGx5CiAgICAgdW5jYWNoZWFibGUuCiAKKyogICBUaGUg
YG1hcGJzPWAgYm9vbGVhbiBjb250cm9scyB3aGV0aGVyIEVmaUJvb3RTZXJ2aWNlc3tDb2RlLERh
dGF9IHNob3VsZAorICAgIHJlbWFpbiBtYXBwZWQgYWZ0ZXIgRXhpdCgpIEJvb3RTZXJ2aWNlcyBj
YWxsLiBCeSBkZWZhdWx0IHRob3NlIG1lbW9yeSByZWdpb25zCisgICAgd2lsbCBub3QgYmUgbWFw
cGVkIGFmdGVyIEV4aXQoKSBCb290U2VydmljZXMgY2FsbC4KKwogIyMjIGVwdAogPiBgPSBMaXN0
IG9mIFsgYWQ9PGJvb2w+LCBwbWw9PGJvb2w+IF1gCiAKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9ib290L2hlYWQuUyBiL3hlbi9hcmNoL3g4Ni9ib290L2hlYWQuUwppbmRleCBkNzhiZWQzOTRh
Li5iMTNmNDZjNzBlIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvYm9vdC9oZWFkLlMKKysrIGIv
eGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TCkBAIC0yMjQsOSArMjI0LDEwIEBAIF9fZWZpNjRfbWIy
X3N0YXJ0OgogICAgICAgICBqbXAgICAgIHg4Nl8zMl9zd2l0Y2gKIAogLkxlZmlfbXVsdGlib290
Ml9wcm90bzoKLSAgICAgICAgLyogWmVybyBFRkkgU3lzdGVtVGFibGUgYW5kIEVGSSBJbWFnZUhh
bmRsZSBhZGRyZXNzZXMuICovCisgICAgICAgIC8qIFplcm8gRUZJIFN5c3RlbVRhYmxlLCBFRkkg
SW1hZ2VIYW5kbGUgYW5kIGNtZGxpbmUgYWRkcmVzc2VzLiAqLwogICAgICAgICB4b3IgICAgICVl
c2ksJWVzaQogICAgICAgICB4b3IgICAgICVlZGksJWVkaQorICAgICAgICB4b3IgICAgICVyZHgs
JXJkeAogCiAgICAgICAgIC8qIFNraXAgTXVsdGlib290MiBpbmZvcm1hdGlvbiBmaXhlZCBwYXJ0
LiAqLwogICAgICAgICBsZWEgICAgIChNQjJfZml4ZWRfc2l6ZW9mK01VTFRJQk9PVDJfVEFHX0FM
SUdOLTEpKCVyYngpLCVlY3gKQEAgLTI0MSw3ICsyNDIsNyBAQCBfX2VmaTY0X21iMl9zdGFydDoK
IAogICAgICAgICAvKiBBcmUgRUZJIGJvb3Qgc2VydmljZXMgYXZhaWxhYmxlPyAqLwogICAgICAg
ICBjbXBsICAgICRNVUxUSUJPT1QyX1RBR19UWVBFX0VGSV9CUyxNQjJfdGFnX3R5cGUoJXJjeCkK
LSAgICAgICAgam5lICAgICAuTGVmaV9tYjJfc3QKKyAgICAgICAgam5lICAgICAuTGVmaV9tYjJf
Y21kbGluZQogCiAgICAgICAgIC8qIFdlIGFyZSBvbiBFRkkgcGxhdGZvcm0gYW5kIEVGSSBib290
IHNlcnZpY2VzIGFyZSBhdmFpbGFibGUuICovCiAgICAgICAgIGluY2IgICAgZWZpX3BsYXRmb3Jt
KCVyaXApCkBAIC0yNTMsNiArMjU0LDE0IEBAIF9fZWZpNjRfbWIyX3N0YXJ0OgogICAgICAgICBp
bmNiICAgIHNraXBfcmVhbG1vZGUoJXJpcCkKICAgICAgICAgam1wICAgICAuTGVmaV9tYjJfbmV4
dF90YWcKIAorLkxlZmlfbWIyX2NtZGxpbmU6CisgICAgICAgIC8qIEdldCBjbWRsaW5lIGFkZHJl
c3MgZnJvbSBNdWx0aWJvb3QyIGluZm9ybWF0aW9uLiAqLworICAgICAgICBjbXBsICAgICRNVUxU
SUJPT1QyX1RBR19UWVBFX0NNRExJTkUsTUIyX3RhZ190eXBlKCVyY3gpCisgICAgICAgIGpuZSAg
ICAgLkxlZmlfbWIyX3N0CisKKyAgICAgICAgbGVhICAgICBNQjJfc3RyaW5nKCVyY3gpLCVyZHgK
KyAgICAgICAgam1wICAgICAuTGVmaV9tYjJfbmV4dF90YWcKKwogLkxlZmlfbWIyX3N0OgogICAg
ICAgICAvKiBHZXQgRUZJIFN5c3RlbVRhYmxlIGFkZHJlc3MgZnJvbSBNdWx0aWJvb3QyIGluZm9y
bWF0aW9uLiAqLwogICAgICAgICBjbXBsICAgICRNVUxUSUJPT1QyX1RBR19UWVBFX0VGSTY0LE1C
Ml90YWdfdHlwZSglcmN4KQpAQCAtMjY0LDYgKzI3MywxMSBAQCBfX2VmaTY0X21iMl9zdGFydDoK
ICAgICAgICAgY21vdmUgICBNQjJfZWZpNjRfaWgoJXJjeCksJXJkaQogICAgICAgICBqZSAgICAg
IC5MZWZpX21iMl9uZXh0X3RhZwogCisgICAgICAgIC8qIEdldCBjbWRsaW5lIGFkZHJlc3MgZnJv
bSBNdWx0aWJvb3QyIGluZm9ybWF0aW9uLiAqLworICAgICAgICBjbXBsICAgICRNVUxUSUJPT1Qy
X1RBR19UWVBFX0NNRExJTkUsTUIyX3RhZ190eXBlKCVyY3gpCisgICAgICAgIGNtb3ZlICAgTUIy
X2VmaTY0X2loKCVyY3gpLCVyZGkKKyAgICAgICAgamUgICAgICAuTGVmaV9tYjJfbmV4dF90YWcK
KwogICAgICAgICAvKiBJcyBpdCB0aGUgZW5kIG9mIE11bHRpYm9vdDIgaW5mb3JtYXRpb24/ICov
CiAgICAgICAgIGNtcGwgICAgJE1VTFRJQk9PVDJfVEFHX1RZUEVfRU5ELE1CMl90YWdfdHlwZSgl
cmN4KQogICAgICAgICBqZSAgICAgIC5McnVuX2JzCkBAIC0zMjcsNyArMzQxLDggQEAgX19lZmk2
NF9tYjJfc3RhcnQ6CiAKICAgICAgICAgLyoKICAgICAgICAgICogZWZpX211bHRpYm9vdDIoKSBp
cyBjYWxsZWQgYWNjb3JkaW5nIHRvIFN5c3RlbSBWIEFNRDY0IEFCSToKLSAgICAgICAgICogICAt
IElOOiAgJXJkaSAtIEVGSSBJbWFnZUhhbmRsZSwgJXJzaSAtIEVGSSBTeXN0ZW1UYWJsZS4KKyAg
ICAgICAgICogICAtIElOOiAgJXJkaSAtIEVGSSBJbWFnZUhhbmRsZSwgJXJzaSAtIEVGSSBTeXN0
ZW1UYWJsZSwKKyAgICAgICAgICogICAgICAgICAgJXJkeCAtIE1CMiBjbWRsaW5lLgogICAgICAg
ICAgKi8KICAgICAgICAgY2FsbCAgICBlZmlfbXVsdGlib290MgogCmRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvZWZpL2VmaS1ib290LmggYi94ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290LmgKaW5k
ZXggN2ExM2EzMGJjMC4uZGY1ZTk4ZTZiYyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2VmaS9l
ZmktYm9vdC5oCisrKyBiL3hlbi9hcmNoL3g4Ni9lZmkvZWZpLWJvb3QuaApAQCAtMzE1LDggKzMx
NSwxMCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgZWZpX2FyY2hfaGFuZGxlX2NtZGxpbmUoQ0hBUjE2
ICppbWFnZV9uYW1lLAogICAgICAgICBuYW1lLnMgPSAieGVuIjsKICAgICBwbGFjZV9zdHJpbmco
Jm1iaS5jbWRsaW5lLCBuYW1lLnMpOwogCi0gICAgaWYgKCBtYmkuY21kbGluZSApCisgICAgaWYg
KCBtYmkuY21kbGluZSApIHsKICAgICAgICAgbWJpLmZsYWdzIHw9IE1CSV9DTURMSU5FOworICAg
ICAgICBlZmlfZWFybHlfcGFyc2VfY21kbGluZShtYmkuY21kbGluZSk7CisgICAgfQogICAgIC8q
CiAgICAgICogVGhlc2UgbXVzdCBub3QgYmUgaW5pdGlhbGl6ZWQgc3RhdGljYWxseSwgc2luY2Ug
dGhlIHZhbHVlIG11c3QKICAgICAgKiBub3QgZ2V0IHJlbG9jYXRlZCB3aGVuIHByb2Nlc3Npbmcg
YmFzZSByZWxvY2F0aW9ucyBsYXRlci4KQEAgLTY3NSw3ICs2NzcsOCBAQCBzdGF0aWMgYm9vbCBf
X2luaXQgZWZpX2FyY2hfdXNlX2NvbmZpZ19maWxlKEVGSV9TWVNURU1fVEFCTEUgKlN5c3RlbVRh
YmxlKQogCiBzdGF0aWMgdm9pZCBfX2luaXQgZWZpX2FyY2hfZmx1c2hfZGNhY2hlX2FyZWEoY29u
c3Qgdm9pZCAqdmFkZHIsIFVJTlROIHNpemUpIHsgfQogCi12b2lkIF9faW5pdCBlZmlfbXVsdGli
b290MihFRklfSEFORExFIEltYWdlSGFuZGxlLCBFRklfU1lTVEVNX1RBQkxFICpTeXN0ZW1UYWJs
ZSkKK3ZvaWQgX19pbml0IGVmaV9tdWx0aWJvb3QyKEVGSV9IQU5ETEUgSW1hZ2VIYW5kbGUsIEVG
SV9TWVNURU1fVEFCTEUgKlN5c3RlbVRhYmxlLAorICAgICAgICAgICAgICAgICAgICAgICAgICAg
Y29uc3QgY2hhciAqY21kbGluZSkKIHsKICAgICBFRklfR1JBUEhJQ1NfT1VUUFVUX1BST1RPQ09M
ICpnb3A7CiAgICAgVUlOVE4gY29scywgZ29wX21vZGUgPSB+MCwgcm93czsKQEAgLTY4NSw2ICs2
ODgsOSBAQCB2b2lkIF9faW5pdCBlZmlfbXVsdGlib290MihFRklfSEFORExFIEltYWdlSGFuZGxl
LCBFRklfU1lTVEVNX1RBQkxFICpTeXN0ZW1UYWJsZQogCiAgICAgZWZpX2luaXQoSW1hZ2VIYW5k
bGUsIFN5c3RlbVRhYmxlKTsKIAorICAgIGlmIChjbWRsaW5lKQorICAgICAgICBlZmlfZWFybHlf
cGFyc2VfY21kbGluZShjbWRsaW5lKTsKKwogICAgIGVmaV9jb25zb2xlX3NldF9tb2RlKCk7CiAK
ICAgICBpZiAoIFN0ZE91dC0+UXVlcnlNb2RlKFN0ZE91dCwgU3RkT3V0LT5Nb2RlLT5Nb2RlLApk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3g4Nl82NC9hc20tb2Zmc2V0cy5jIGIveGVuL2FyY2gv
eDg2L3g4Nl82NC9hc20tb2Zmc2V0cy5jCmluZGV4IDMzOTMwY2U5N2MuLmI1YmU2Y2EzMGYgMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvYXNtLW9mZnNldHMuYworKysgYi94ZW4vYXJj
aC94ODYveDg2XzY0L2FzbS1vZmZzZXRzLmMKQEAgLTE2Myw2ICsxNjMsNyBAQCB2b2lkIF9fZHVt
bXlfXyh2b2lkKQogICAgIE9GRlNFVChNQjJfbWVtX2xvd2VyLCBtdWx0aWJvb3QyX3RhZ19iYXNp
Y19tZW1pbmZvX3QsIG1lbV9sb3dlcik7CiAgICAgT0ZGU0VUKE1CMl9lZmk2NF9zdCwgbXVsdGli
b290Ml90YWdfZWZpNjRfdCwgcG9pbnRlcik7CiAgICAgT0ZGU0VUKE1CMl9lZmk2NF9paCwgbXVs
dGlib290Ml90YWdfZWZpNjRfaWhfdCwgcG9pbnRlcik7CisgICAgT0ZGU0VUKE1CMl9zdHJpbmcs
IG11bHRpYm9vdDJfdGFnX3N0cmluZ190LCBzdHJpbmcpOwogICAgIEJMQU5LKCk7CiAKICAgICBE
RUZJTkUobDJfaWRlbnRtYXBfc2l6ZW9mLCBzaXplb2YobDJfaWRlbnRtYXApKTsKZGlmZiAtLWdp
dCBhL3hlbi9jb21tb24vZWZpL2Jvb3QuYyBiL3hlbi9jb21tb24vZWZpL2Jvb3QuYwppbmRleCA3
OTE5Mzc4NGZmLi5hODUxNGJiYjVmIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2VmaS9ib290LmMK
KysrIGIveGVuL2NvbW1vbi9lZmkvYm9vdC5jCkBAIC0xMjYsNiArMTI2LDcgQEAgc3RhdGljIGJv
b2wgcmVhZF9maWxlKEVGSV9GSUxFX0hBTkRMRSBkaXJfaGFuZGxlLCBDSEFSMTYgKm5hbWUsCiBz
dGF0aWMgc2l6ZV90IHdzdHJsZW4oY29uc3QgQ0hBUjE2ICogcyk7CiBzdGF0aWMgaW50IHNldF9j
b2xvcih1MzIgbWFzaywgaW50IGJwcCwgdTggKnBvcywgdTggKnN6KTsKIHN0YXRpYyBib29sIG1h
dGNoX2d1aWQoY29uc3QgRUZJX0dVSUQgKmd1aWQxLCBjb25zdCBFRklfR1VJRCAqZ3VpZDIpOwor
c3RhdGljIHZvaWQgZWZpX2Vhcmx5X3BhcnNlX2NtZGxpbmUoY29uc3QgY2hhciAqY21kbGluZSk7
CiAKIHN0YXRpYyB2b2lkIGVmaV9pbml0KEVGSV9IQU5ETEUgSW1hZ2VIYW5kbGUsIEVGSV9TWVNU
RU1fVEFCTEUgKlN5c3RlbVRhYmxlKTsKIHN0YXRpYyB2b2lkIGVmaV9jb25zb2xlX3NldF9tb2Rl
KHZvaWQpOwpAQCAtMTM4Niw2ICsxMzg3LDEwIEBAIGVmaV9zdGFydChFRklfSEFORExFIEltYWdl
SGFuZGxlLCBFRklfU1lTVEVNX1RBQkxFICpTeXN0ZW1UYWJsZSkKIAogc3RhdGljIGJvb2wgX19p
bml0ZGF0YSBlZmlfbWFwX3VjOwogCisvKgorICogV2FybmluZzogdGhpcyBmdW5jdGlvbiBtdXN0
IGJlIGlkZW1wb3RlbnQgYXMgaXQgbWF5IGJlIGNhbGxlZCBtdWx0aXBsZQorICogdGltZXMuCisg
Ki8KIHN0YXRpYyBpbnQgX19pbml0IHBhcnNlX2VmaV9wYXJhbShjb25zdCBjaGFyICpzKQogewog
ICAgIGNvbnN0IGNoYXIgKnNzOwpAQCAtMTQxMiwxNiArMTQxNywzMiBAQCBzdGF0aWMgaW50IF9f
aW5pdCBwYXJzZV9lZmlfcGFyYW0oY29uc3QgY2hhciAqcykKICAgICAgICAgICAgIGVsc2UKICAg
ICAgICAgICAgICAgICByYyA9IC1FSU5WQUw7CiAgICAgICAgIH0KKyAgICAgICAgZWxzZSBpZiAo
ICh2YWwgPSBwYXJzZV9ib29sZWFuKCJtYXBicyIsIHMsIHNzKSkgPj0gMCApCisgICAgICAgIHsK
KyAgICAgICAgICAgIG1hcF9icyA9IHZhbDsKKyAgICAgICAgfQogICAgICAgICBlbHNlCiAgICAg
ICAgICAgICByYyA9IC1FSU5WQUw7CiAKICAgICAgICAgcyA9IHNzICsgMTsKLSAgICB9IHdoaWxl
ICggKnNzICk7CisgICAgICAgIC8qCisgICAgICAgICAqIEVuZCBwYXJzaW5nIG9uIGJvdGggJ1ww
JyBhbmQgJyAnLAorICAgICAgICAgKiB0byBtYWtlIGVmaV9lYXJseV9wYXJzZV9jbWRsaW5lIHNp
bXBsZXIuCisgICAgICAgICAqLworICAgIH0gd2hpbGUgKCAqc3MgJiYgKnNzICE9ICcgJyk7CiAK
ICAgICByZXR1cm4gcmM7CiB9CiBjdXN0b21fcGFyYW0oImVmaSIsIHBhcnNlX2VmaV9wYXJhbSk7
CiAKKy8qIEV4dHJhY3QgZWZpPSBwYXJhbSBlYXJseSBpbiB0aGUgYm9vdCAqLworc3RhdGljIHZv
aWQgX19pbml0IGVmaV9lYXJseV9wYXJzZV9jbWRsaW5lKGNvbnN0IGNoYXIgKmNtZGxpbmUpCit7
CisgICAgY29uc3QgY2hhciAqZWZpX29wdCA9IHN0cnN0cihjbWRsaW5lLCAiZWZpPSIpOworICAg
IGlmICggZWZpX29wdCApCisgICAgICAgIHBhcnNlX2VmaV9wYXJhbShlZmlfb3B0ICsgNCk7Cit9
CisKICNpZm5kZWYgVVNFX1NFVF9WSVJUVUFMX0FERFJFU1NfTUFQCiBzdGF0aWMgX19pbml0IHZv
aWQgY29weV9tYXBwaW5nKHVuc2lnbmVkIGxvbmcgbWZuLCB1bnNpZ25lZCBsb25nIGVuZCwKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCAoKmlzX3ZhbGlkKSh1bnNpZ25lZCBs
b25nIHNtZm4sCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
