Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC77ABD677
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 04:44:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCxFK-0000sm-2K; Wed, 25 Sep 2019 02:41:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CquU=XU=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iCxFI-0000sc-5M
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 02:41:36 +0000
X-Inumbo-ID: fdc62ae0-df3d-11e9-bf31-bc764e2007e4
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by localhost (Halon) with ESMTPS
 id fdc62ae0-df3d-11e9-bf31-bc764e2007e4;
 Wed, 25 Sep 2019 02:41:35 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 2FC252222B;
 Tue, 24 Sep 2019 22:41:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 24 Sep 2019 22:41:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=jYpAjnlE+xFbalsg2q3WrQQg+q42vr+5BpmVq4v5g
 5Q=; b=iHRIbzbaXTs40euYMt/wQSEQN4QJW6ZNvRP7c9Q3s+IDlSbB7fHq7gsWL
 MAExL9AenZmX1JB5dx1w5j5jxX3PJh/mJlBCtAEhE49EgPDKR7QwogrzXJEyKFgt
 hOjH9/hhoDvHXnoO1dpeHAxm3KNgj1JXwBq2prbiqv/kLZmy6D+Rk+mGLKyaFAPA
 Kc1tKTKtqHVafN66slkk8Hr0DwxcceCC+xZCjUNYj4ZcCXmkvMzFxVT9i4HqD5oY
 nV+bg2r/j6AFhLoFJU8GWeRrw7Dx7Wgt+UFiqhESP4sNWJzUpqpYeTNvK0At5YT2
 2yZotfYfJgDkDwmdXxi7tmudBexsA==
X-ME-Sender: <xms:3tOKXTbNAHAlT8o22iFrWE9H8TRDB1aIxRbfgQJfhro6M5wLi09g_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfedugdeivdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:3tOKXT4OH_DHh3UttmYSXsYOcYBXQOndT-3T06Mcddw9VXBocWffPA>
 <xmx:3tOKXWCBQj5I5F7rLowCWPnIYHgVBmb1BgeIVQDFbOaOAz8IbaWp6w>
 <xmx:3tOKXZevCculqFex3gegaLNCW7Efc6X4IVorkyQEgyNRfRxLRJOFSg>
 <xmx:39OKXareS0jG9w89FqtdR5rED1-NvkO2kVWLmCoKVDYRz3hR_OhuBw>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id AA369D6005E;
 Tue, 24 Sep 2019 22:41:33 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 25 Sep 2019 04:41:23 +0200
Message-Id: <0d3f56a22a7f01024d0d83ed83028b37648f6a30.1569379186.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.e819a32509fb1a6bdcbdcefb2de053ccf2361d59.1569379186.git-series.marmarek@invisiblethingslab.com>
References: <cover.e819a32509fb1a6bdcbdcefb2de053ccf2361d59.1569379186.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v7 1/4] libxl: do not attach xen-pciback to HVM
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
