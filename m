Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0C113B7DC
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 03:42:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irYbk-0004xi-OZ; Wed, 15 Jan 2020 02:40:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8TLv=3E=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1irYbj-0004x2-7d
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 02:40:35 +0000
X-Inumbo-ID: 5f084194-3740-11ea-84bb-12813bfff9fa
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5f084194-3740-11ea-84bb-12813bfff9fa;
 Wed, 15 Jan 2020 02:40:20 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id E2DED22206;
 Tue, 14 Jan 2020 21:40:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 14 Jan 2020 21:40:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=zG/nmIauw+uWJfff8qV/HuZnuRzcOW86SqAUgup91
 x4=; b=JFSfGq8e+DPWDbLnzNMAqT0ZTWvEvfhE5Szz80jitjcFi3WhI82IKWyFS
 YtimcI+QJjl5KzV6IEtxGBt9PwcNK6N4l5L3ineq1/c/Z7GZz4dQqbv6iqHswI9c
 qcqQ7PqQdA0GRbsy8EBoTGNSnBhaGigLBuknxhJxgAgKkoiuehb7SeBJhsXZSR/p
 fZ9zLMoZvEhIQGxpiNxKP1gP8m8PC9AfgoLSoCRD4GkBbyt3r/NYtXPmL9KhzhLn
 W5uvCU9nkwe5c9yq6A0Rp1PJ8A+jHR77LouVGFWPitoKOAirsyTq2vl5nZX4dwaA
 lorfpnS/GK828wUWYGMYAi8bQSvuQ==
X-ME-Sender: <xms:k3seXtRD0NIXB-dK3oABEOH6yow24zeSeVc0xfTwIoytwffZIU-EvQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrtddvgdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpeeh
X-ME-Proxy: <xmx:k3seXrBOMuCDDk5g6PrMgQIeAmChPXSY1byhN6UXrwj_GHuEFGeWOg>
 <xmx:k3seXt2NCJSnHcS5vN8Lo-GzzcnQpK74hYrw9LdKPDWarNZmUIkCJQ>
 <xmx:k3seXpX-0zM1OJypu9NLm3GVj1afdiUNDh9ik24qNC9YXvs4ob5KrA>
 <xmx:k3seXl21L07SvsKktGZwQT1uh1uHwuNV8qtVOFZPGeapnuLApvNd6g>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0523230607B0;
 Tue, 14 Jan 2020 21:40:18 -0500 (EST)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 15 Jan 2020 03:39:47 +0100
Message-Id: <047e5ff567ac0c2e0bd92fd8741c03d07b548ab5.1579055705.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 08/16] tools/libvchan: notify server when
 client is connected
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

TGV0IHRoZSBzZXJ2ZXIga25vdyB3aGVuIHRoZSBjbGllbnQgaXMgY29ubmVjdGVkLiBPdGhlcndp
c2Ugc2VydmVyIHdpbGwKbm90aWNlIG9ubHkgd2hlbiBjbGllbnQgc2VuZCBzb21lIGRhdGEuClRo
aXMgY2hhbmdlIGRvZXMgbm90IGJyZWFrIGV4aXN0aW5nIGNsaWVudHMsIGFzIGxpYnZjaGFuIHVz
ZXIgc2hvdWxkCmhhbmRsZSBzcHVyaW91cyBub3RpZmljYXRpb25zIGFueXdheSAoZm9yIGV4YW1w
bGUgYWNrbm93bGVkZ2Ugb2YgcmVtb3RlCnNpZGUgcmVhZGluZyB0aGUgZGF0YSkuCgpTaWduZWQt
b2ZmLWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRo
aW5nc2xhYi5jb20+Ci0tLQpJIGhhZCB0aGlzIHBhdGNoIGluIFF1YmVzIGZvciBhIGxvbmcgdGlt
ZSBhbmQgdG90YWxseSBmb3Jnb3QgaXQgd2Fzbid0CnVwc3RyZWFtIHRoaW5nLi4uCi0tLQogdG9v
bHMvbGlidmNoYW4vaW5pdC5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS90b29scy9saWJ2Y2hhbi9pbml0LmMgYi90b29scy9saWJ2Y2hhbi9p
bml0LmMKaW5kZXggMTgwODMzZC4uNTBhNjRjMSAxMDA2NDQKLS0tIGEvdG9vbHMvbGlidmNoYW4v
aW5pdC5jCisrKyBiL3Rvb2xzL2xpYnZjaGFuL2luaXQuYwpAQCAtNDQ3LDYgKzQ0Nyw5IEBAIHN0
cnVjdCBsaWJ4ZW52Y2hhbiAqbGlieGVudmNoYW5fY2xpZW50X2luaXQoc3RydWN0IHhlbnRvb2xs
b2dfbG9nZ2VyICpsb2dnZXIsCiAJY3RybC0+cmluZy0+Y2xpX2xpdmUgPSAxOwogCWN0cmwtPnJp
bmctPnNydl9ub3RpZnkgPSBWQ0hBTl9OT1RJRllfV1JJVEU7CiAKKyAgICAvKiB3YWtlIHVwIHRo
ZSBzZXJ2ZXIgKi8KKyAgICB4ZW5ldnRjaG5fbm90aWZ5KGN0cmwtPmV2ZW50LCBjdHJsLT5ldmVu
dF9wb3J0KTsKKwogIG91dDoKIAlpZiAoeHMpCiAJCXhzX2RhZW1vbl9jbG9zZSh4cyk7Ci0tIApn
aXQtc2VyaWVzIDAuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
