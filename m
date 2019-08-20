Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF7395427
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 04:15:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzte2-00035s-Ms; Tue, 20 Aug 2019 02:13:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7DDh=WQ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hzte1-00035n-8D
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2019 02:13:09 +0000
X-Inumbo-ID: 0d2ee2d4-c2f0-11e9-b90c-bc764e2007e4
Received: from wout1-smtp.messagingengine.com (unknown [64.147.123.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d2ee2d4-c2f0-11e9-b90c-bc764e2007e4;
 Tue, 20 Aug 2019 02:13:08 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 4A6583AA;
 Mon, 19 Aug 2019 22:13:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 19 Aug 2019 22:13:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=NtaTNY
 +OLBQUDOeNMN0d8n3GBZuysoQrzdHpDIw4jxY=; b=EII99mP3otqsmDIihif5fp
 QrPWtfBejQzhBRmMiuFn9u38i0Go2IEUX0ZtwxHJAEJUFbpp2CbnHdLa2eDyjIIz
 RlZxFFFFfCLvJaQY/tKJvSCzAjuILvhe5knbHf47q/zqG9nv5IA22ktDKwX+i+Qz
 B6TFilB5RSPT81hfcr6m8OG0QooBomouvyYMNCa89T/ezagIMPec7juL4u6E2OID
 ILkg6viiZ16kS7gsuFPs2w+jvIyP0MKcek1AAspNwDzrobW7sR3r23tur34TMhf2
 059UV8W19XuPi5brekOJknlVJgFxeEslUwT9fV61g/wNwQ5LhI2NRcH1YqrOFR0Q
 ==
X-ME-Sender: <xms:MldbXWPGK-tE6agP5lnE_gfQCY-KRDLdE-76Hxv1-wVY7wfqHYOWrw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudegtddgiedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffogggtohfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucffohhmrghinhephhgrnhgulhgv
 rdhrvggrugenucfkphepledurdeihedrfeegrdeffeenucfrrghrrghmpehmrghilhhfrh
 homhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhen
 ucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:MldbXeW1igT90JPD3YQhFy0jEeV_lA1x_2hBkUrYbJQuV4YX8_jpWw>
 <xmx:MldbXVxulqMPUyr8u82O4_Ppn5qbGJ-AaJocYq5r3bereUOkyblJqQ>
 <xmx:MldbXWMjPI9PgrKT9LKbobFrlUU7pHsu8uMTr0jnO3CzpbbF9WhLHA>
 <xmx:MldbXRMvc-j-QiA9CX8vvePlQiKaMCM-wR-R_-4BeqVkvalb4ch93w>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id BF1A3380075;
 Mon, 19 Aug 2019 22:13:05 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 20 Aug 2019 04:12:41 +0200
Message-Id: <20190820021241.30843-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: Invisible Things Lab
Subject: [Xen-devel] [PATCH] python: do not report handled EAGAIN error
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

bWF0Y2hfd2F0Y2hfYnlfdG9rZW4oKSB3aGVuIHJldHVybnMgYW4gZXJyb3IsIHNldHMgYWxzbyBl
eGNlcHRpb24gd2l0aGluCnB5dGhvbi4gVGhpcyBpcyBnZW5lcmFsbHkgdGhlIHJpZ2h0IHRoaW5n
IHRvIGRvLCBidXQgd2hlbgp4c3B5X3JlYWRfd2F0Y2goKSBoYW5kbGUgRUFHQUlOIGVycm9yIGlu
dGVybmFsbHksIHRoZSBleGNlcHRpb24gbmVlZHMgdG8KYmUgY2xlYXJlZC4gT3RoZXJ3aXNlIGl0
IHdpbGwgZmFpbCBsaWtlIHRoaXM6CgogICAgeGVuLmxvd2xldmVsLnhzLkVycm9yOiAoMTEsICdS
ZXNvdXJjZSB0ZW1wb3JhcmlseSB1bmF2YWlsYWJsZScpCgogICAgVGhlIGFib3ZlIGV4Y2VwdGlv
biB3YXMgdGhlIGRpcmVjdCBjYXVzZSBvZiB0aGUgZm9sbG93aW5nIGV4Y2VwdGlvbjoKCiAgICBU
cmFjZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6CiAgICAgICguLi4pCiAgICAgICAgcmVz
dWx0ID0gc2VsZi5oYW5kbGUucmVhZF93YXRjaCgpCiAgICBTeXN0ZW1FcnJvcjogPG1ldGhvZCAn
cmVhZF93YXRjaCcgb2YgJ3hlbi5sb3dsZXZlbC54cy54cycgb2JqZWN0cz4gcmV0dXJuZWQgYSBy
ZXN1bHQgd2l0aCBhbiBlcnJvciBzZXQKCkZpeGVzIGY2ZTEwMjM0MTIgInB5dGhvbjogRXh0cmFj
dCByZWdpc3RlcmVkIHdhdGNoIHNlYXJjaCBsb2dpYyBmcm9tIHhzcHlfcmVhZF93YXRjaCgpIgpT
aWduZWQtb2ZmLWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlz
aWJsZXRoaW5nc2xhYi5jb20+Ci0tLQogdG9vbHMvcHl0aG9uL3hlbi9sb3dsZXZlbC94cy94cy5j
IHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS90b29s
cy9weXRob24veGVuL2xvd2xldmVsL3hzL3hzLmMgYi90b29scy9weXRob24veGVuL2xvd2xldmVs
L3hzL3hzLmMKaW5kZXggZWE1MGY4NmJjMy4uNjIxMDM5ZDdhNyAxMDA2NDQKLS0tIGEvdG9vbHMv
cHl0aG9uL3hlbi9sb3dsZXZlbC94cy94cy5jCisrKyBiL3Rvb2xzL3B5dGhvbi94ZW4vbG93bGV2
ZWwveHMveHMuYwpAQCAtNTMxLDYgKzUzMSw3IEBAIGFnYWluOgogICAgIGZyZWUoeHN2YWwpOwog
CiAgICAgaWYgKCF2YWwgJiYgZXJybm8gPT0gRUFHQUlOKSB7CisgICAgICAgIFB5RXJyX0NsZWFy
KCk7CiAgICAgICAgIGdvdG8gYWdhaW47CiAgICAgfQogCi0tIAoyLjIwLjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
