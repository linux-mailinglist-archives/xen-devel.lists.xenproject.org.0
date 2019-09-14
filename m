Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EE4B2BF2
	for <lists+xen-devel@lfdr.de>; Sat, 14 Sep 2019 17:42:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9A7Q-0001Fr-Am; Sat, 14 Sep 2019 15:37:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mwje=XJ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1i9A7P-0001Fj-2j
 for xen-devel@lists.xenproject.org; Sat, 14 Sep 2019 15:37:47 +0000
X-Inumbo-ID: 96bf367e-d705-11e9-b299-bc764e2007e4
Received: from wout1-smtp.messagingengine.com (unknown [64.147.123.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96bf367e-d705-11e9-b299-bc764e2007e4;
 Sat, 14 Sep 2019 15:37:42 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 7F9705D3;
 Sat, 14 Sep 2019 11:37:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Sat, 14 Sep 2019 11:37:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=jYpAjnlE+xFbalsg2q3WrQQg+q42vr+5BpmVq4v5g
 5Q=; b=iJbpQFy+kQf2EARkP+gee7sserblK+6MZjj/LIcFaXi0EG7PTd3aZfCuy
 nrQlqarcCRMal/Qat6V5HM1me40Gkv7nP8fkv4r2LiMcI7cu2ejxpLVZSoYyy3pt
 lR9EgofvzZn3e8z7bXfrIpTl1FyPSgE0TtT+cw2plFZKpCtoEivRdoYIX+jz3ZMr
 Jf+FA2w8Z0FCWPUVrrCC7oXu0L1+tCz/IqfLFgTcQ2cTRRZlqqB9A0JcXWkXVmmS
 eEZNb/4IqGJLIvDZ0mIkEikyJfaUukqsFvDzJT6o71s2/FprEl8lbaANQr9llOYp
 PA64jlyzdDeoCCsW1b6o7ipmTDj/Q==
X-ME-Sender: <xms:Qwl9XYklc7kJOT8an-93Xc9qfSPNOEo7uw-WA5vSiKE-1piw3OSuPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrtdelgdeludcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:Qwl9XU_OIQegvdMwnnZg2grex6LGAdPJv44BGqZsd5ZYUA3bGRC1lg>
 <xmx:Qwl9XVorkB-5payGRGTTwViezhmY6Z8PsQ7FFugHdKftMu8IRcH15g>
 <xmx:Qwl9XVmZhlBWNu9uwYAN4zKCBz-qYY0-Ny22Yje0ofCMCU2B1PkP_Q>
 <xmx:RAl9XUokLtyFpg7MEJk4-KAOmK4IeLyVZIndlcbEFJwVeZW9s4sPGQ>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 12AA2D6005B;
 Sat, 14 Sep 2019 11:37:38 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Sat, 14 Sep 2019 17:37:16 +0200
Message-Id: <0d3f56a22a7f01024d0d83ed83028b37648f6a30.1568475323.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.4c97023e719e059ea99137f2cadea319eb87495d.1568475323.git-series.marmarek@invisiblethingslab.com>
References: <cover.4c97023e719e059ea99137f2cadea319eb87495d.1568475323.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v6 1/6] libxl: do not attach xen-pciback to HVM
 domain, if stubdomain is in use
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SFZNIGRvbWFpbnMgdXNlIElPTU1VIGFuZCBkZXZpY2UgbW9kZWwgYXNzaXN0YW5jZSBmb3IgY29t
bXVuaWNhdGluZyB3aXRoClBDSSBkZXZpY2VzLCB4ZW4tcGNpZnJvbnQvcGNpYmFjayBpc24ndCBk
aXJlY3RseSBuZWVkZWQgYnkgSFZNIGRvbWFpbi4KQnV0IHBjaWJhY2sgc2VydmUgYWxzbyBzZWNv
bmQgZnVuY3Rpb24gLSBpdCByZXNldCB0aGUgZGV2aWNlIHdoZW4gaXQgaXMKZGVhc3NpZ25lZCBm
cm9tIHRoZSBndWVzdCBhbmQgZm9yIHRoaXMgcmVhc29uIHBjaWJhY2sgbmVlZHMgdG8gYmUgdXNl
ZAp3aXRoIEhWTSBkb21haW4gdG9vLgpXaGVuIEhWTSBkb21haW4gaGFzIGRldmljZSBtb2RlbCBp
biBzdHViZG9tYWluLCBhdHRhY2hpbmcgeGVuLXBjaWJhY2sgdG8KdGhlIHRhcmdldCBkb21haW4g
aXRzZWxmIG1heSBwcmV2ZW50IGF0dGFjaGluZyB4ZW4tcGNpYmFjayB0byB0aGUKKFBWKSBzdHVi
ZG9tYWluLCBlZmZlY3RpdmVseSBicmVha2luZyBQQ0kgcGFzc3Rocm91Z2guCgpGaXggdGhpcyBi
eSBhdHRhY2hpbmcgcGNpYmFjayBvbmx5IHRvIG9uZSBkb21haW46IGlmIFBWIHN0dWJkb21haW4g
aXMgaW4KdXNlLCBsZXQgaXQgYmUgc3R1YmRvbWFpbiAodGhlIGNvbW1pdCBwcmV2ZW50cyBhdHRh
Y2hpbmcgZGV2aWNlIHRvIHRhcmdldApIVk0gaW4gdGhpcyBjYXNlKTsgb3RoZXJ3aXNlLCBhdHRh
Y2ggaXQgdG8gdGhlIHRhcmdldCBkb21haW4uCgpTaWduZWQtb2ZmLWJ5OiBNYXJlayBNYXJjenlr
b3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+CkFja2VkLWJ5
OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KQ2hhbmdlcyBpbiB2MjoKIC0gcHJl
dmlvdXNseSBjYWxsZWQgImxpYnhsOiBhdHRhY2ggeGVuLXBjaWJhY2sgb25seSB0byBQViBkb21h
aW5zIgogLSBpbnN0ZWFkIG9mIGV4Y2x1ZGluZyBhbGwgSFZNcywgY2hhbmdlIHRoZSBjb25kaXRp
b24gdG8gd2hhdCBhY3R1YWxseQogICBtYXR0ZXJzIGhlcmUgLSBjaGVjayBpZiBzdHViZG9tYWlu
IGlzIGluIHVzZTsgdGhpcyB3YXkgeGVuLXBjaWJhY2sgaXMKICAgYWx3YXlzIGluIHVzZSAoZWl0
aGVyIGZvciB0aGUgdGFyZ2V0IGRvbWFpbiwgb3IgaXQncyBzdHViZG9tYWluKSwKICAgZml4aW5n
IFBDSSByZXNldCBieSB4ZW4tcGNpYmFjayBjb25jZXJucwpDaGFuZ2VzIGluIHYzOgogLSBhZGp1
c3QgY29tbWl0IG1lc3NhZ2UKLS0tCiB0b29scy9saWJ4bC9saWJ4bF9wY2kuYyB8IDQgKystLQog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS90b29scy9saWJ4bC9saWJ4bF9wY2kuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3BjaS5jCmlu
ZGV4IDAzYmViODYuLjJlMDZhNDUgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX3BjaS5j
CisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3BjaS5jCkBAIC0xMTA2LDcgKzExMDYsNyBAQCBvdXQ6
CiAgICAgICAgIH0KICAgICB9CiAKLSAgICBpZiAoIXN0YXJ0aW5nKQorICAgIGlmICghc3RhcnRp
bmcgJiYgIWxpYnhsX2dldF9zdHViZG9tX2lkKENUWCwgZG9taWQpKQogICAgICAgICByYyA9IGxp
YnhsX19kZXZpY2VfcGNpX2FkZF94ZW5zdG9yZShnYywgZG9taWQsIHBjaWRldiwgc3RhcnRpbmcp
OwogICAgIGVsc2UKICAgICAgICAgcmMgPSAwOwpAQCAtMTMwMiw3ICsxMzAyLDcgQEAgc3RhdGlj
IHZvaWQgbGlieGxfX2FkZF9wY2lkZXZzKGxpYnhsX19lZ2MgKmVnYywgbGlieGxfX2FvICphbywg
dWludDMyX3QgZG9taWQsCiAgICAgICAgIH0KICAgICB9CiAKLSAgICBpZiAoZF9jb25maWctPm51
bV9wY2lkZXZzID4gMCkgeworICAgIGlmIChkX2NvbmZpZy0+bnVtX3BjaWRldnMgPiAwICYmICFs
aWJ4bF9nZXRfc3R1YmRvbV9pZChDVFgsIGRvbWlkKSkgewogICAgICAgICByYyA9IGxpYnhsX19j
cmVhdGVfcGNpX2JhY2tlbmQoZ2MsIGRvbWlkLCBkX2NvbmZpZy0+cGNpZGV2cywKICAgICAgICAg
ICAgIGRfY29uZmlnLT5udW1fcGNpZGV2cyk7CiAgICAgICAgIGlmIChyYyA8IDApIHsKLS0gCmdp
dC1zZXJpZXMgMC45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
