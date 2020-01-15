Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAF213B7EB
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 03:43:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irYc9-0005SA-JG; Wed, 15 Jan 2020 02:41:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8TLv=3E=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1irYc8-0005RJ-GX
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 02:41:00 +0000
X-Inumbo-ID: 63a465f2-3740-11ea-a2eb-bc764e2007e4
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63a465f2-3740-11ea-a2eb-bc764e2007e4;
 Wed, 15 Jan 2020 02:40:27 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 9DD92221E9;
 Tue, 14 Jan 2020 21:40:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 14 Jan 2020 21:40:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=3HlN1na3MvkQFx0jgbE8tJCxMyOmwWnEHlp+SeBur
 Hw=; b=EIiK5iOf+Mk7mKdjVXy/d4c/hkK3QiY3slziBANqIiaQ9Vf7I+L9yj/9l
 BC/FmKlzElKHbVzoTy+/VXSANnereE37Tm6hHE/ZczKHxIrsQiwD//flxGRj2PSc
 +yjPKQ80W83C1ict7g5FVHSVdmYSizJzknrXPLF+FV7MqVO7jA+uF681RwnApgbl
 q/swEL+j4Rl9S3xCM6LOUxXYtmT0AbVUjIn400Cob1LXL1ggglb2Fy4a/zHvF4vH
 VM2Lwfx7YbeaJo4kcPAvswnikSktc6eJNEdDEaH6lspQFocFMIzBuE/hPpLF2FpS
 0RSOCxXLpUJuXnKUdIT7/SlwkFc7w==
X-ME-Sender: <xms:m3seXnHtTxNwyvrr3mh3kwxL3XIz5LbojhYXifZ7rdnNFSSw0V0-IA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrtddvgdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpeek
X-ME-Proxy: <xmx:m3seXtaU9kNXu2IgQDAHXbGdO-jRPrLLRBHFuEhf2Pi9qKJOov0thg>
 <xmx:m3seXiMAakcQW0AKwgTLU4lkfJljEJh-614H1kprj3v-ae7DRlcgiQ>
 <xmx:m3seXg0AaD9TZWDHPehVw-etA_zSwsYw72jHauwcHZ5Oayinb9hY9w>
 <xmx:m3seXl0sCHii7fDf0TR8QKBSUQMSgfk_ZTvz7UwVrvWifPwIqP0B5g>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id C596C30607B4;
 Tue, 14 Jan 2020 21:40:26 -0500 (EST)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 15 Jan 2020 03:39:55 +0100
Message-Id: <13e463d7e4e797a215e8f2c5437a9499af6fd92c.1579055705.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 16/16] libxl: consider also qemu in
 stubdomain in libxl__dm_active check
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

U2luY2UgcWVtdS14ZW4gY2FuIG5vdyBydW4gaW4gc3R1YmRvbWFpbiB0b28sIGhhbmRsZSB0aGlz
IGNhc2Ugd2hlbgpjaGVja2luZyBpdCdzIHN0YXRlIHRvby4KClNpZ25lZC1vZmYtYnk6IE1hcmVr
IE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4K
LS0tCiB0b29scy9saWJ4bC9saWJ4bF9kbS5jIHwgMTAgKysrKysrKystLQogMSBmaWxlIGNoYW5n
ZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9s
aWJ4bC9saWJ4bF9kbS5jIGIvdG9vbHMvbGlieGwvbGlieGxfZG0uYwppbmRleCA4OWVjYTFlLi43
Njk4ODg3IDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9kbS5jCisrKyBiL3Rvb2xzL2xp
YnhsL2xpYnhsX2RtLmMKQEAgLTM3MjksMTIgKzM3MjksMTggQEAgb3V0OgogCiBpbnQgbGlieGxf
X2RtX2FjdGl2ZShsaWJ4bF9fZ2MgKmdjLCB1aW50MzJfdCBkb21pZCkKIHsKLSAgICBjaGFyICpw
aWQsICpwYXRoOworICAgIGNoYXIgKnBpZCwgKmRtX2RvbWlkLCAqcGF0aDsKIAogICAgIHBhdGgg
PSBHQ1NQUklOVEYoIi9sb2NhbC9kb21haW4vJWQvaW1hZ2UvZGV2aWNlLW1vZGVsLXBpZCIsIGRv
bWlkKTsKICAgICBwaWQgPSBsaWJ4bF9feHNfcmVhZChnYywgWEJUX05VTEwsIHBhdGgpOwogCi0g
ICAgcmV0dXJuIHBpZCAhPSBOVUxMOworICAgIGlmIChwaWQpCisgICAgICAgIHJldHVybiB0cnVl
OworCisgICAgcGF0aCA9IEdDU1BSSU5URigiL2xvY2FsL2RvbWFpbi8lZC9pbWFnZS9kZXZpY2Ut
bW9kZWwtZG9taWQiLCBkb21pZCk7CisgICAgZG1fZG9taWQgPSBsaWJ4bF9feHNfcmVhZChnYywg
WEJUX05VTEwsIHBhdGgpOworCisgICAgcmV0dXJuIGRtX2RvbWlkICE9IE5VTEw7CiB9CiAKIGlu
dCBsaWJ4bF9fZG1fY2hlY2tfc3RhcnQobGlieGxfX2djICpnYywgbGlieGxfZG9tYWluX2NvbmZp
ZyAqZF9jb25maWcsCi0tIApnaXQtc2VyaWVzIDAuOS4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
