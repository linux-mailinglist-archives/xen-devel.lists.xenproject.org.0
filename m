Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B682092B
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 16:09:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRH2q-0003GT-6k; Thu, 16 May 2019 14:07:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Eh32=TQ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hRH2p-0003GF-0C
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 14:07:39 +0000
X-Inumbo-ID: f56af068-77e3-11e9-adea-6f270f6c5ab7
Received: from new3-smtp.messagingengine.com (unknown [66.111.4.229])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f56af068-77e3-11e9-adea-6f270f6c5ab7;
 Thu, 16 May 2019 14:07:37 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id DB4EC27136;
 Thu, 16 May 2019 10:07:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Thu, 16 May 2019 10:07:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Y1CeLJ
 5On+O/zx4XGBgGp6yUq9ghP8p2TwW1qcaUhU4=; b=gI8jg9G2pa9t1bhVxUyJfE
 zE7FKTvS/UyjSvMXJdKWBCYv3OSdSknxjhKvrE76e7aoTQJojpsZVPoX2iWeay6P
 HTtPTNOe1bTyPgke+r5agwuP9fXY+4WRX/6bObRapya7ySaOeaCUxk4rffhjMQOg
 aAK/bnHt32bmbJ902+T2ktiiQm9MCKdMTbXjo26uXoWsDF14oCUwsnMYfvZhon7J
 ubyqEYJLFtZgkKgmESr2fWf/WSZsU1yyLnfnJlfPbVj3bkv80prBnMGC9j/gTj3z
 48y9OdLmCsd52cT1+FXrLeezKH8qNMY6Md8bxIhKtPbtqxuJ4wl4HpK6mws24Jjw
 ==
X-ME-Sender: <xms:pm7dXMDJpGlsyTuIJqVD_f02lRNuj0WRgJyA-d-GG6jlvHH-VeBT0g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddttddgieelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeeluddrieehrdefgedrfeef
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvg
 hthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:pm7dXELQC7LtcIQtqbg748skfxyk4rbjSFBwPNHyfMwKjnqPA3AXAg>
 <xmx:pm7dXHqt0tqnXhXoL4gTchO7CfqIhh1KTRw7zmB1NYn7z-QnNfUlqQ>
 <xmx:pm7dXLdTV3rPQo_DUkQfU6DZGjwUJlOLhsxwEC0UO0M6vdYt9WUmnA>
 <xmx:qG7dXEHp55XlOC-CfrU0eQd-mHiBXzDY2K8kEtVQFwhsalx5WAS8Qw>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id F0CDF80062;
 Thu, 16 May 2019 10:07:32 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 16 May 2019 16:07:28 +0200
Message-Id: <cover.36e828561477c30a5472a8e9213ab0efc5484de8.1558015595.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 0/1] Fixes for large framebuffer,
 placed above 4GB
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
Cc: Olaf Hering <olaf@aepfle.de>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QSBidW5jaCBvZiBmaXhlcyBmb3IgYm9vdGluZyBYZW4gb24gVGhpbmtwYWQgUDUyLCB0aHJvdWdo
IGdydWIyLWVmaSArCm11bHRpYm9vdDIuIE1vc3Qgb2YgdGhlbSBjYW4gYmUgYXBwbGllZCBpbmRl
cGVuZGVudGx5LgoKQ2hhbmdlcyBpbiB2MzoKIC0gdXBkYXRlZCAieGVuOiBmaXggaGFuZGxpbmcg
ZnJhbWVidWZmZXIgbG9jYXRlZCBhYm92ZSA0R0IiCiAtIGRyb3BwZWQgYWxyZWFkeSBhcHBsaWVk
IHBhdGNoZXMKCi0tLQpjYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KY2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KY2M6IElh
biBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpjYzogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgpjYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4K
Y2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KY2M6IFN0
ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KY2M6IFRpbSBEZWVnYW4g
PHRpbUB4ZW4ub3JnPgpjYzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KY2M6IE9sYWYg
SGVyaW5nIDxvbGFmQGFlcGZsZS5kZT4KCk1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSAoMSk6
CiAgeGVuOiBmaXggaGFuZGxpbmcgZnJhbWVidWZmZXIgbG9jYXRlZCBhYm92ZSA0R0IKCiB4ZW4v
YXJjaC94ODYvZWZpL2VmaS1ib290LmggICAgIHwgIDEgKwogeGVuL2RyaXZlcnMvdmlkZW8vdmVz
YS5jICAgICAgICB8IDE0ICsrKysrKysrKy0tLS0tCiB4ZW4vaW5jbHVkZS9wdWJsaWMveGVuLWNv
bXBhdC5oIHwgIDIgKy0KIHhlbi9pbmNsdWRlL3B1YmxpYy94ZW4uaCAgICAgICAgfCAgNSArKysr
KwogNCBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKYmFz
ZS1jb21taXQ6IDlkYzgwNDNiYTE4NDA5ZTdhMjA1N2Q4Y2NjYmYwZGRhZmY3MWViN2UKLS0gCmdp
dC1zZXJpZXMgMC45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
