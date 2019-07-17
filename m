Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F256B2FE
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 03:05:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnYK1-00054L-Vf; Wed, 17 Jul 2019 01:01:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o+Bt=VO=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hnYK0-000541-8k
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 01:01:28 +0000
X-Inumbo-ID: 65d730e4-a82e-11e9-a195-ef06a8b04646
Received: from wout4-smtp.messagingengine.com (unknown [64.147.123.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 65d730e4-a82e-11e9-a195-ef06a8b04646;
 Wed, 17 Jul 2019 01:01:24 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 4A3863F2;
 Tue, 16 Jul 2019 21:01:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 16 Jul 2019 21:01:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=T433qKPJ5yOL+6nQ2s/YupvBv1Cpvvjysd0Aung09
 q0=; b=oyCGe7RDRE1pj7tvCAihJaqKTHefo2z0WgJzo3vHuI3OXe4zuP1OUJvNF
 7EAs6vuqyxcqEhCDsLdudAssbQ0PKYOMYnxJ4rsWJWhC9rrxo7IWO+AOUxCD+ATu
 EG8NruvdIatlz+KsU+3P6jju4cy20qwG5AEHY3nmFXAkWOXBs8H6Iun+6HpWMs+F
 v52pMmeIUlLZpsQodiCK9s96jBZpaicQpMx/LDwG7Ld91oVUkcAnwZhOiEj3i5EV
 Thdd6sT6oNT1Xk/GoJtKdzp/9JCDgQB7F/XA3LtRKsrcrd+27gVC5PdqNb50sKY2
 t/QTDOyE4GXRPUfB+w/rGHk6X/xqQ==
X-ME-Sender: <xms:YnMuXTx1aPXyH61nrG-lJDspXrx8z5mMiIWJOmTQx2uk43CYSzYpVg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddriedugdegvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:YnMuXf1lmVTopB2JHft4KPan8kdBoKOJ9dem3xJVTsoRK_EJHatkQQ>
 <xmx:YnMuXac6DoN-ADaqI6P8jONXIoaYlBYFL5w2RSAvIVA02xX9F4NnYg>
 <xmx:YnMuXUWUcLzl3xH5jx--gvNzo8MM3CQP-7eAIzaLfyJji84Gkf3mrQ>
 <xmx:YnMuXYL6YDmcAmZtSHIKSdkcHD5VK92hrHCGqIh60t7Bevp2RW3NSg>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 56EC9380084;
 Tue, 16 Jul 2019 21:01:21 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 17 Jul 2019 03:00:39 +0200
Message-Id: <5b6a20c0b33a2b52175174a27ce388208f932992.1563325215.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.537da3804adbe71352bed871578f3e893e2210c5.1563325215.git-series.marmarek@invisiblethingslab.com>
References: <cover.537da3804adbe71352bed871578f3e893e2210c5.1563325215.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 1/6] libxl: do not attach xen-pciback to HVM
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
ZGV4IDRlYzY4NzIuLjdmZmFiODkgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX3BjaS5j
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
