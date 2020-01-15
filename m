Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7271E13B7DF
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 03:42:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irYbq-00051k-Go; Wed, 15 Jan 2020 02:40:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8TLv=3E=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1irYbo-00050V-7c
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 02:40:40 +0000
X-Inumbo-ID: 60128c98-3740-11ea-84bb-12813bfff9fa
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 60128c98-3740-11ea-84bb-12813bfff9fa;
 Wed, 15 Jan 2020 02:40:21 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id A512D221E5;
 Tue, 14 Jan 2020 21:40:21 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 14 Jan 2020 21:40:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=cMLuMoiO2GgiF+2yG6HCDZ12fKzKr3YMfoA82ikN+
 Bk=; b=h0RxDCEzVpRE0IqNfukwU2YBKLLKVt/pCvis0Ns6uG9Tcv2F1Sqg7S5XN
 DyZASX0/WiSz6m5My0AdDaSdcP/zwlOxpFQX7CglQs7+/Ty02Z88MTxeLHufD3IL
 YA8rTDjuFZIc4Pwf8PSza0GP53zFD7wZxfWV3hFylUaAnCVTsmZIcLOm3E8TNHJ0
 GuX23s5D2W3KfXxRWE6/+5fOF49wbjGjXKheV/cy/gZB5aJ9EseTnBVV4Ss8e5DK
 3xP+qQ8/o4Yj9pRriAZ49wEIuWjFJF4YKoCUyv1A+d0TBXfqEXFwmRO2zqAWkgzT
 CeR0p2Ug67kbwb0/lJsY6ScurB/mw==
X-ME-Sender: <xms:lXseXpyLvwC3EFKycLxZQTaXQLt-NpkXzVzUD9b3aYzRE7u1BMlKyw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrtddvgdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpeeh
X-ME-Proxy: <xmx:lXseXnGn7D33n0DANJ5JJy3DI2B88XPuAiEKpYJXgeNP-l4zOyE2cw>
 <xmx:lXseXtwGoAOKSnyA1dD2RiG0jihd0V0JvwYow1NuflgtitHOdBnFsQ>
 <xmx:lXseXovhsrok8ZcFKhZ7vZEOQ5yRuvRnpWkbIxfyRRSWK0T4jvfK2A>
 <xmx:lXseXvjE27XbLT6M901TYsvUReUslgwX-7JusHfcbofFimCXHa80Yg>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id D64DA3060840;
 Tue, 14 Jan 2020 21:40:20 -0500 (EST)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 15 Jan 2020 03:39:49 +0100
Message-Id: <11435f88fd5802b4c7c0197794d9832bd87093d7.1579055705.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 10/16] tools: add missing libxenvchan cflags
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

bGlieGVudmNoYW4uaCBpbmNsdWRlIHhlbmV2dGNobi5oIGFuZCB4ZW5nbnR0YWIuaCwgc28gYXBw
bGljYXRpb25zIGJ1aWx0CndpdGggaXQgbmVlZHMgYXBwbGljYWJsZSAtSSBpbiBDRkxBR1MgdG9v
LgoKU2lnbmVkLW9mZi1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0Bp
bnZpc2libGV0aGluZ3NsYWIuY29tPgotLS0KIHRvb2xzL1J1bGVzLm1rIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdG9v
bHMvUnVsZXMubWsgYi90b29scy9SdWxlcy5tawppbmRleCAzMWNmNDE5Li45YzU1MGMxIDEwMDY0
NAotLS0gYS90b29scy9SdWxlcy5taworKysgYi90b29scy9SdWxlcy5tawpAQCAtMTU5LDcgKzE1
OSw3IEBAIFNIREVQU19saWJ4ZW5zdGF0ICA9ICQoU0hMSUJfbGlieGVuY3RybCkgJChTSExJQl9s
aWJ4ZW5zdG9yZSkKIExETElCU19saWJ4ZW5zdGF0ICA9ICQoU0hERVBTX2xpYnhlbnN0YXQpICQo
WEVOX0xJQlhFTlNUQVQpL2xpYnhlbnN0YXQkKGxpYmV4dGVuc2lvbikKIFNITElCX2xpYnhlbnN0
YXQgICA9ICQoU0hERVBTX2xpYnhlbnN0YXQpIC1XbCwtcnBhdGgtbGluaz0kKFhFTl9MSUJYRU5T
VEFUKQogCi1DRkxBR1NfbGlieGVudmNoYW4gPSAtSSQoWEVOX0xJQlZDSEFOKQorQ0ZMQUdTX2xp
YnhlbnZjaGFuID0gLUkkKFhFTl9MSUJWQ0hBTikgJChDRkxBR1NfbGlieGVuZ250dGFiKSAkKENG
TEFHU19saWJ4ZW5ldnRjaG4pCiBTSERFUFNfbGlieGVudmNoYW4gPSAkKFNITElCX2xpYnhlbnRv
b2xsb2cpICQoU0hMSUJfbGlieGVuc3RvcmUpICQoU0hMSUJfbGlieGVuZXZ0Y2huKSAkKFNITElC
X2xpYnhlbmdudHRhYikKIExETElCU19saWJ4ZW52Y2hhbiA9ICQoU0hERVBTX2xpYnhlbnZjaGFu
KSAkKFhFTl9MSUJWQ0hBTikvbGlieGVudmNoYW4kKGxpYmV4dGVuc2lvbikKIFNITElCX2xpYnhl
bnZjaGFuICA9ICQoU0hERVBTX2xpYnhlbnZjaGFuKSAtV2wsLXJwYXRoLWxpbms9JChYRU5fTElC
VkNIQU4pCi0tIApnaXQtc2VyaWVzIDAuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
