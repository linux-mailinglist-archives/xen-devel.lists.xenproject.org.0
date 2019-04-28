Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B587B66D
	for <lists+xen-devel@lfdr.de>; Sun, 28 Apr 2019 21:12:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hKpAB-0004Uy-Ko; Sun, 28 Apr 2019 19:08:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2OR8=S6=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hKpAA-0004Ut-6J
 for xen-devel@lists.xenproject.org; Sun, 28 Apr 2019 19:08:34 +0000
X-Inumbo-ID: 03eb3c0a-69e9-11e9-843c-bc764e045a96
Received: from out5-smtp.messagingengine.com (unknown [66.111.4.29])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 03eb3c0a-69e9-11e9-843c-bc764e045a96;
 Sun, 28 Apr 2019 19:08:32 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 6C17425E4D;
 Sun, 28 Apr 2019 15:08:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Sun, 28 Apr 2019 15:08:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=RYxRba
 9s11plp0fcUcis5yxCZ/bSR4PUIEWli20pcFM=; b=0MNj5qbxAMd7FCvnpU0lUA
 ySGP4xvpI9PJbL1UXNySn+DHX41U2eRSW9gyW66m57G8q6/5k4mImovMKfTup4FC
 S7MEtSGxkCoodkHTMYmKCs3ditDtW6IXF3BhiMXB21LG+i2ajDc/3DMKTCDwU0DS
 xk06+eqki87niELgOagJl36nKDenLdwBKAlhqJF1m67r8F1/TciTOCwc14J6iDUF
 9oLbVourV3ixxAxLfWbi1NFgLKbukx9vcQmxOSjF6JOIQ0qiSr5JRCqNkS2fWo2u
 JF/+PZ9mAGdod6sA5rTmZTeWxC5H5m4fK9CwjeYu6xx+n8FKkzNdyH4QRWO7dvPQ
 ==
X-ME-Sender: <xms:L_rFXCNb0JxkOAJoKVgTFfoNELtK7PUvg0Q_RBQCt-pWqSzrIFOFxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddriedtgddufeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffogggtohfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:L_rFXMJ92yQz_Oo_z9MaJPbvwmAEAB_d24zKSk6ABnqH0H4F27wN1w>
 <xmx:L_rFXNFVgUseENpQAqevpaYkYdarxRrRwjjFIkLPfrs3iF0J3G54Qw>
 <xmx:L_rFXNBVhJKYN947fxBEatMpphPYwvGg187_mJpspGI8mPE96Oehyw>
 <xmx:MPrFXAkmz4M1bUKU_1KJ5movc9-nF3HY61qqPyJahAJ6ZTnps-6yDQ>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id D2196E40E3;
 Sun, 28 Apr 2019 15:08:30 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Sun, 28 Apr 2019 21:08:23 +0200
Message-Id: <20190428190824.28029-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
Organization: Invisible Things Lab
Subject: [Xen-devel] [PATCH] python: Adjust xc_physinfo wrapper for updated
 virt_caps bits
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
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29tbWl0IGYwODlmZGRkOTQgInhlbjogcmVwb3J0IFBWIGNhcGFiaWxpdHkgaW4gc3lzY3RsIGFu
ZCB1c2UgaXQgaW4KdG9vbHN0YWNrIiBjaGFuZ2VkIG1lYW5pbmcgb2YgdmlydF9jYXBzIGJpdCAx
IC0gcHJldmlvdXNseSBpdCB3YXMKImRpcmVjdGlvIiwgYnV0IHdhcyBjaGFuZ2VkIHRvICJwdiIg
YW5kICJkaXJlY3RpbyIgd2FzIG1vdmVkIHRvIGJpdCAyLgpBZGp1c3QgcHl0aG9uIHdyYXBwZXIs
IGFuZCBhZGQgcmVwb3J0aW5nIG9mIGJvdGggInB2X2RpcmVjdGlvIiBhbmQKImh2bV9kaXJlY3Rp
byIuCgpTaWduZWQtb2ZmLWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVr
QGludmlzaWJsZXRoaW5nc2xhYi5jb20+Ci0tLQpUaGlzIHNob3VsZCBiZSBiYWNrcG9ydGVkIHRv
IDQuMTIKQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIHRv
b2xzL3B5dGhvbi94ZW4vbG93bGV2ZWwveGMveGMuYyB8IDcgKysrKysrLQogMSBmaWxlIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3B5
dGhvbi94ZW4vbG93bGV2ZWwveGMveGMuYyBiL3Rvb2xzL3B5dGhvbi94ZW4vbG93bGV2ZWwveGMv
eGMuYwppbmRleCBjYzgxNzVhMTFlLi4wYThkOGY0MDdlIDEwMDY0NAotLS0gYS90b29scy9weXRo
b24veGVuL2xvd2xldmVsL3hjL3hjLmMKKysrIGIvdG9vbHMvcHl0aG9uL3hlbi9sb3dsZXZlbC94
Yy94Yy5jCkBAIC05NzMsNyArOTczLDggQEAgc3RhdGljIFB5T2JqZWN0ICpweXhjX3BoeXNpbmZv
KFhjT2JqZWN0ICpzZWxmKQogICAgIHhjX3BoeXNpbmZvX3QgcGluZm87CiAgICAgY2hhciBjcHVf
Y2FwWzEyOF0sIHZpcnRfY2Fwc1sxMjhdLCAqcDsKICAgICBpbnQgaTsKLSAgICBjb25zdCBjaGFy
ICp2aXJ0Y2FwX25hbWVzW10gPSB7ICJodm0iLCAiaHZtX2RpcmVjdGlvIiB9OworICAgIGNvbnN0
IGNoYXIgKnZpcnRjYXBfbmFtZXNbXSA9IHsgImh2bSIsICJwdiIsCisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAiaHZtX2RpcmVjdGlvIiwgInB2X2RpcmVjdGlvIiB9OwogCiAg
ICAgaWYgKCB4Y19waHlzaW5mbyhzZWxmLT54Y19oYW5kbGUsICZwaW5mbykgIT0gMCApCiAgICAg
ICAgIHJldHVybiBweXhjX2Vycm9yX3RvX2V4Y2VwdGlvbihzZWxmLT54Y19oYW5kbGUpOwpAQCAt
OTg5LDYgKzk5MCwxMCBAQCBzdGF0aWMgUHlPYmplY3QgKnB5eGNfcGh5c2luZm8oWGNPYmplY3Qg
KnNlbGYpCiAgICAgZm9yICggaSA9IDA7IGkgPCAyOyBpKysgKQogICAgICAgICBpZiAoIChwaW5m
by5jYXBhYmlsaXRpZXMgPj4gaSkgJiAxICkKICAgICAgICAgICBwICs9IHNwcmludGYocCwgIiVz
ICIsIHZpcnRjYXBfbmFtZXNbaV0pOworICAgIGlmIChwaW5mby5jYXBhYmlsaXRpZXMgJiBYRU5f
U1lTQ1RMX1BIWVNDQVBfZGlyZWN0aW8pCisgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgMjsgaSsr
ICkKKyAgICAgICAgICAgIGlmICggKHBpbmZvLmNhcGFiaWxpdGllcyA+PiBpKSAmIDEgKQorICAg
ICAgICAgICAgICBwICs9IHNwcmludGYocCwgIiVzICIsIHZpcnRjYXBfbmFtZXNbaSsyXSk7CiAg
ICAgaWYgKCBwICE9IHZpcnRfY2FwcyApCiAgICAgICAqKHAtMSkgPSAnXDAnOwogCi0tIAoyLjE3
LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
