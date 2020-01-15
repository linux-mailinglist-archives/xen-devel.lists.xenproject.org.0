Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B264C13B7E4
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 03:43:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irYbg-0004ug-5A; Wed, 15 Jan 2020 02:40:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8TLv=3E=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1irYbe-0004u5-G4
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 02:40:30 +0000
X-Inumbo-ID: 5c30353a-3740-11ea-b89f-bc764e2007e4
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c30353a-3740-11ea-b89f-bc764e2007e4;
 Wed, 15 Jan 2020 02:40:15 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 2FA1E221FC;
 Tue, 14 Jan 2020 21:40:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 14 Jan 2020 21:40:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=hFatBVEceU0YzlJ8V5KA/QLgh7H6lFP0ti2NWesmG
 X0=; b=gw2ErxTX2wC7Qd44F0v3kByzrr/MP6mymoJOOIof7Vn3oNlWMpMVb2b91
 dtP7VrYn6NQOzpAAQ/d5wKinR/zhOKX0S+/2sbc7jSCzkK3CA0oJdKHLhOwgrMsh
 UzpnZ0WZbyLwUuPMPGoRl3va0U4QGYzK3fgnl3yb3pDo/4RHCFqchFaJ8teGQXKY
 VF6NlB/cDVGI3dqBQ8a1qw9WswCPW50mKnY7hNSHCS6xvHa6aaCb2X1eyjnGeD5o
 GR4nEi6Q3EnfbETelHnQm6gDsaK9KuCiHLmC3BTJYqFUbeKvijPwi914REVPBW4k
 8WyqHoFjrQqegr9Tka5X/S7UFCgug==
X-ME-Sender: <xms:j3seXlNRqqY7I4CSOLhzdmo9cy6-9lfsxWsAWT9YqN-yd3_Zh3qp_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrtddvgdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:j3seXpXJM1DGVBe98TG0C2EcMwHwZL6QZ1gSE1zAaLobrzbCKTaiVQ>
 <xmx:j3seXthxO1STiD6AE-LGLyTowhzqYSzyzUMMO85PsEfzb5G9mwGICw>
 <xmx:j3seXp8_roxGPcyEDALQkJenwL-k6UmcsLp_8SbjZ4lYFYCMvwn9vg>
 <xmx:j3seXkfQTkV_CgmO8JftFRCLkMJpavMD3aSdy_Ejado2LH3DEG7t4A>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 17C7E3060783;
 Tue, 14 Jan 2020 21:40:14 -0500 (EST)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 15 Jan 2020 03:39:42 +0100
Message-Id: <763f8aec657f880b29e495d4158db49c2afddbbe.1579055705.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 03/16] libxl: fix qemu-trad cmdline for no
 sdl/vnc case
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
Cc: Wei Liu <wei.liu2@citrix.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBxZW11IGlzIHJ1bm5pbmcgaW4gc3R1YmRvbWFpbiwgYW55IGF0dGVtcHQgdG8gaW5pdGlh
bGl6ZSB2bmMvc2RsCnRoZXJlIHdpbGwgY3Jhc2ggaXQgKG9uIGZhaWxlZCBhdHRlbXB0IHRvIGxv
YWQgYSBrZXltYXAgZnJvbSBhIGZpbGUpLiBJZgp2ZmIgaXMgcHJlc2VudCwgYWxsIHRob3NlIGNh
c2VzIGFyZSBza2lwcGVkLiBCdXQgc2luY2UKYjA1M2YwYzRjOWU1MzNmM2Q5NzgzN2NmODk3ZWI5
MjBiODM1NWVkMyAibGlieGw6IGRvIG5vdCBzdGFydCBkb20wIHFlbXUKZm9yIHN0dWJkb21haW4g
d2hlbiBub3QgbmVlZGVkIiBpdCBpcyBwb3NzaWJsZSB0byBjcmVhdGUgYSBzdHViZG9tYWluCndp
dGhvdXQgdmZiIGFuZCBjb250cmFyeSB0byB0aGUgY29tbWVudCAtdm5jIG5vbmUgZG8gdHJpZ2dl
ciBWTkMKaW5pdGlhbGl6YXRpb24gY29kZSAoanVzdCBza2lwcyBleHBvc2luZyBpdCBleHRlcm5h
bGx5KS4KQ2hhbmdlIHRoZSBpbXBsaWNpdCBTREwgYXZvaWRpbmcgbWV0aG9kIHRvIC1ub2dyYXBo
aWNzIG9wdGlvbiwgdXNlZCB3aGVuCm5vbmUgb2YgU0RMIG9yIFZOQyBpcyBlbmFibGVkLgoKU2ln
bmVkLW9mZi1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2li
bGV0aGluZ3NsYWIuY29tPgpSZXZpZXdlZC1ieTogSmFzb24gQW5kcnl1ayA8amFuZHJ5dWtAZ21h
aWwuY29tPgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+
CkFja2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KQ2hhbmdlcyBpbiB2
MjoKIC0gdHlwbyBpbiBxZW11IG9wdGlvbgpDaGFuZ2VzIGluIHYzOgogLSBhZGQgbWlzc2luZyB7
IH0KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9kbS5jIHwgMTEgKysrKysrLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9v
bHMvbGlieGwvbGlieGxfZG0uYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKaW5kZXggZTkyZTQx
Mi4uNTU4Y2I0MSAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfZG0uYworKysgYi90b29s
cy9saWJ4bC9saWJ4bF9kbS5jCkBAIC03MTgsMTQgKzcxOCwxNSBAQCBzdGF0aWMgaW50IGxpYnhs
X19idWlsZF9kZXZpY2VfbW9kZWxfYXJnc19vbGQobGlieGxfX2djICpnYywKICAgICAgICAgaWYg
KGxpYnhsX2RlZmJvb2xfdmFsKHZuYy0+ZmluZHVudXNlZCkpIHsKICAgICAgICAgICAgIGZsZXhh
cnJheV9hcHBlbmQoZG1fYXJncywgIi12bmN1bnVzZWQiKTsKICAgICAgICAgfQotICAgIH0gZWxz
ZQorICAgIH0gZWxzZSBpZiAoIXNkbCkgewogICAgICAgICAvKgogICAgICAgICAgKiBWTkMgaXMg
bm90IGVuYWJsZWQgYnkgZGVmYXVsdCBieSBxZW11LXhlbi10cmFkaXRpb25hbCwKLSAgICAgICAg
ICogaG93ZXZlciBwYXNzaW5nIC12bmMgbm9uZSBjYXVzZXMgU0RMIHRvIG5vdCBiZQotICAgICAg
ICAgKiAodW5leHBlY3RlZGx5KSBlbmFibGVkIGJ5IGRlZmF1bHQuIFRoaXMgaXMgb3ZlcnJpZGRl
biBieQotICAgICAgICAgKiBleHBsaWNpdGx5IHBhc3NpbmcgLXNkbCBiZWxvdyBhcyByZXF1aXJl
ZC4KKyAgICAgICAgICogaG93ZXZlciBza2lwcGluZyAtdm5jIGNhdXNlcyBTREwgdG8gYmUKKyAg
ICAgICAgICogKHVuZXhwZWN0ZWRseSkgZW5hYmxlZCBieSBkZWZhdWx0LiBJZiB1bmRlc2lyZWQs
IGRpc2FibGUgZ3JhcGhpY3MgYXQKKyAgICAgICAgICogYWxsLgogICAgICAgICAgKi8KLSAgICAg
ICAgZmxleGFycmF5X2FwcGVuZF9wYWlyKGRtX2FyZ3MsICItdm5jIiwgIm5vbmUiKTsKKyAgICAg
ICAgZmxleGFycmF5X2FwcGVuZChkbV9hcmdzLCAiLW5vZ3JhcGhpYyIpOworICAgIH0KIAogICAg
IGlmIChzZGwpIHsKICAgICAgICAgZmxleGFycmF5X2FwcGVuZChkbV9hcmdzLCAiLXNkbCIpOwot
LSAKZ2l0LXNlcmllcyAwLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
