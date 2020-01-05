Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE511306D4
	for <lists+xen-devel@lfdr.de>; Sun,  5 Jan 2020 09:44:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1io1U1-0003eY-Vl; Sun, 05 Jan 2020 08:42:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3GeW=22=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1io1U0-0003eT-Oj
 for xen-devel@lists.xenproject.org; Sun, 05 Jan 2020 08:42:01 +0000
X-Inumbo-ID: 3cd5a734-2f97-11ea-a9e8-12813bfff9fa
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3cd5a734-2f97-11ea-a9e8-12813bfff9fa;
 Sun, 05 Jan 2020 08:41:59 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 6417C213F4;
 Sun,  5 Jan 2020 03:41:59 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Sun, 05 Jan 2020 03:41:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=cFKggE
 N7I6PoOpeHPDc+9HU2Tt+TdkmmX1jxkCeENl8=; b=Wqa0f9VcIgJ64PchFOTGeB
 2ItWE4KLM6IXd1L1OTxTyBTomd3JS+LqT4GhlaqRxX5Ur68VfRKjivoL3Vb4Uy1t
 Xecb8QUJ3MaRJZojzt2Ub3GHZSrWsm5gTermL3w3Sm6eWvdhwS32mZScuDE8W2m7
 SBc9dBFPiT5G7jx5PfAFA/3ll94fqZw2/NKr+pRRmkwu4kT2DJTdylsNWWL3nQ2v
 jchKyJyCIrqvnCGs9RvbrdPJ/5nNJwA+W8op382AcLxFqrQ5M6Uw1pGEdbhBeaMh
 /5LC50CSjl3sxPyCDNwPnE+ptGSsmmBkNYzY8ALXdtTD25lmLogxMIy5C78QtJLQ
 ==
X-ME-Sender: <xms:V6ERXjgWdY_sziX70EEoGt9SRfFyZF94sMN6MKYhIiY7ujB9tOAjoQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdegjedgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffogggtohfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:V6ERXpG736trEGFDBG9OEBpAaY2ILKeptyx4ZTfumJdKSjfkszU6gg>
 <xmx:V6ERXsJ_39zfq-QuSoZWyQPBsA9cpXn-jUtaDbxdka9mIsCYkwBWWA>
 <xmx:V6ERXsAwrPv6irY7o1wyUi7NKxPAGcJ8Vs2-nswH336arLgeSKzwlA>
 <xmx:V6ERXtxgbOmKGfPJkd6ZM6uz40zZ8gLhDSRGVxFsCE7luqtYC_hYdw>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4526B8005C;
 Sun,  5 Jan 2020 03:41:58 -0500 (EST)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Sun,  5 Jan 2020 09:41:48 +0100
Message-Id: <20200105084148.18887-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Organization: Invisible Things Lab
Subject: [Xen-devel] [PATCH] libxl: create backend/ xenstore dir for driver
 domains
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2xlYW5pbmcgdXAgYmFja2VuZCB4ZW5zdG9yZSBlbnRyaWVzIGlzIGEgcmVzcG9uc2liaWxpdHkg
b2YgdGhlIGJhY2tlbmQuCldoZW4gYmFja2VuZCBsaXZlcyBvdXRzaWRlIG9mIGRvbTAsIHRoZSBk
b21haW4gbmVlZHMgcHJvcGVyIHBlcm1pc3Npb25zCnRvIGRvIGl0LiBOb3JtYWxseSBpdCBpcyBn
aXZlbiBwZXJtaXNzaW9uIHRvIHJlbW92ZSB0aGUgZGV2aWNlIGRpcgppdHNlbGYsIGJ1dCBub3Qg
dGhlIGRpciBjb250YWluaW5nIGl0IChuYW1lZCBhZnRlciBmcm9udGVuZCBJRCkuIEFmdGVyIGEK
d2hvbGUgdGhvc2UgZW1wdHkgbGVmdG92ZXIgZGlyZWN0b3JpZXMgYWNjdW11bGF0ZSB0byB0aGUg
cG9pbnQgeGVuc3RvcmUKcmV0dXJuaW5nIEUyQklHIG9uIGxpc3RpbmcgdGhlbS4KCkZpeCB0aGlz
IGJ5IGdpdmluZyBiYWNrZW5kIGRvbWFpbiB3cml0ZSBhY2Nlc3MgYWxzbyB0byBiYWNrZW5kLwpk
aXJlY3RvcnkgaXRzZWxmIHdoZW4gY19pbmZvLT5kcml2ZXJfZG9tYWluIG9wdGlvbiBpcyBzZXQu
IFRoZSBjb2RlCnJlbW92aW5nIHJlbGV2YW50IGRpciBpcyBhbHJlYWR5IHRoZXJlIChqdXN0IGxh
Y2tlZCBwZXJtaXNzaW9ucyB0byBkbyBzbykuCgpOb3RlIHRoaXMgYWxzbyBhbGxvd3MgdGhlIGJh
Y2tlbmQgZG9tYWluIHRvIGNyZWF0ZSBuZXcgZW50cmllcywKcHJldGVuZGluZyB0byBob3N0IGJh
Y2tlbmQgZGV2aWNlcyBpdCBkb24ndCBoYXZlLiBCdXQgc2luY2UgbGlieGwgdXNlcwovbGlieGwv
IHhlbnN0b3JlIGRpciBmb3IgdGhpcyBpbmZvcm1hdGlvbiAoc3RpbGwgb3V0c2lkZSBvZiBiYWNr
ZW5kCmRvbWFpbiBjb250cm9sKSwgdGhpcyBzaG91bGRuJ3QgYmUgYW4gaXNzdWUuCgpTaWduZWQt
b2ZmLWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRo
aW5nc2xhYi5jb20+Ci0tLQogdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMgfCA3ICsrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90b29scy9saWJ4
bC9saWJ4bF9jcmVhdGUuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCmluZGV4IGE2ZDQw
Yjc1M2UuLjM4Y2E5Yjg1YTQgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5j
CisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCkBAIC03NjMsNiArNzYzLDEzIEBAIHJl
dHJ5X3RyYW5zYWN0aW9uOgogICAgICAgICAgKi8KICAgICAgICAgbGlieGxfX3hzX21rbm9kKGdj
LCB0LCBHQ1NQUklOVEYoIiVzL2RldmljZS1tb2RlbCIsIGRvbV9wYXRoKSwgcndwZXJtLAogICAg
ICAgICAgICAgICAgICAgICAgICAgQVJSQVlfU0laRShyd3Blcm0pKTsKKworICAgICAgICAvKgor
ICAgICAgICAgKiBDcmVhdGUgYSBsb2NhbCAiYmFja2VuZCIgZGlyZWN0b3J5IGZvciBlYWNoIGd1
ZXN0LCB3cml0YWJsZSBieSB0aGF0CisgICAgICAgICAqIGd1ZXN0LCB0byBhbGxvdyBpdCBwcm9w
ZXJseSBjbGVhbnVwIHJlbW92ZWQgZGV2aWNlcworICAgICAgICAgKi8KKyAgICAgICAgbGlieGxf
X3hzX21rbm9kKGdjLCB0LCBHQ1NQUklOVEYoIiVzL2JhY2tlbmQiLCBkb21fcGF0aCksIHJ3cGVy
bSwKKyAgICAgICAgICAgICAgICAgICAgICAgIEFSUkFZX1NJWkUocndwZXJtKSk7CiAgICAgfQog
CiAgICAgdm1fbGlzdCA9IGxpYnhsX2xpc3Rfdm0oY3R4LCAmbmJfdm0pOwotLSAKMi4yMS4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
