Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE9D13B7DD
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 03:42:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irYba-0004rz-VW; Wed, 15 Jan 2020 02:40:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8TLv=3E=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1irYbZ-0004rM-6o
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 02:40:25 +0000
X-Inumbo-ID: 5d6c7672-3740-11ea-84ba-12813bfff9fa
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5d6c7672-3740-11ea-84ba-12813bfff9fa;
 Wed, 15 Jan 2020 02:40:18 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 2612821FE5;
 Tue, 14 Jan 2020 21:40:18 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 14 Jan 2020 21:40:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=skDz0rnSNSBUBZiTqXtGnAuRJBovVCqbot5fp/R4L
 5s=; b=sjfS03ycn4OsBreudydMSI8CBYt4GWOwDOjIG9LhwLieZOzMFjVAylY5Q
 gT8BkCnh9PjahdCQrsM57PJPzd0nEMr5trDf3NX++zbKrg96xlO7WfHXiSP56Cve
 yoiyuDG+FQc1N8x4QgDt8dYO60ZefIFJW6Hd0aEZszyR3v22hz2oEH2IUaTQI9x5
 k/EXvOuXyVvMNlfclgwxJ1H/T/g6UXXff4jtjvyEZ6tTtleTmty3c7DmkwDnZhKF
 eZWKJ4f6hDJwetlbcDy4sYaLZvOq495WSzzjSS19f2DB+QDJg3+WakghXb9ffRfr
 3OVvPSLarMaY78HFtC/h9QXSQ6qGw==
X-ME-Sender: <xms:kXseXrC-KTC4H0r8soWOYcH64Es7AGbgnm2xQCal6XSclzURvMYI0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrtddvgdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:knseXr9e8TabqnfB4KjdLusNOiJ0UDWlnVGq6IcqqYHSkwML-4maYQ>
 <xmx:knseXuFvY4yx38aAYnX7krA1cNiUVOVWsKta1wi7kfnzkFFtd-ikHQ>
 <xmx:knseXlTqNtvX9n8_x-_U8VqFeGRU07Hg4ojNBHZXPrSEC-dndpSAdw>
 <xmx:knseXj5ICDQbtEo23u6vnKcxQLpX7XJkGtrr-sRXo7vTD5dVwedG6Q>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3506A30607CD;
 Tue, 14 Jan 2020 21:40:17 -0500 (EST)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 15 Jan 2020 03:39:45 +0100
Message-Id: <cd76e3559f841d3072558d9c603dc686f67d54c1.1579055705.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 06/16] libxl: write qemu arguments into
 separate xenstore keys
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

VGhpcyBhbGxvd3MgdXNpbmcgYXJndW1lbnRzIHdpdGggc3BhY2VzLCBsaWtlIC1hcHBlbmQsIHdp
dGhvdXQKbm9taW5hdGluZyBhbnkgc3BlY2lhbCAic2VwYXJhdG9yIiBjaGFyYWN0ZXIuCgpTaWdu
ZWQtb2ZmLWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJs
ZXRoaW5nc2xhYi5jb20+Ci0tLQpDaGFuZ2VzIGluIHYzOgogLSBwcmV2aW91cyB2ZXJzaW9uIG9m
IHRoaXMgcGF0Y2ggImxpYnhsOiB1c2UgXHgxYiB0byBzZXBhcmF0ZSBxZW11CiAgIGFyZ3VtZW50
cyBmb3IgbGludXggc3R1YmRvbWFpbiIgdXNlZCBzcGVjaWZpYyBub24tcHJpbnRhYmxlCiAgIHNl
cGFyYXRvciwgYnV0IGl0IHdhcyByZWplY3RlZCBhcyB4ZW5zdG9yZSBkb2Vzbid0IGNvcGUgd2Vs
bCB3aXRoCiAgIG5vbi1wcmludGFibGUgY2hhcnMKLS0tCiB0b29scy9saWJ4bC9saWJ4bF9kbS5j
IHwgMzkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hh
bmdlZCwgMzggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xz
L2xpYnhsL2xpYnhsX2RtLmMgYi90b29scy9saWJ4bC9saWJ4bF9kbS5jCmluZGV4IDkyNmQ5NjMu
LmJmNDkyNjIgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKKysrIGIvdG9vbHMv
bGlieGwvbGlieGxfZG0uYwpAQCAtMjA0OSw2ICsyMDQ5LDQwIEBAIHN0YXRpYyBpbnQgbGlieGxf
X3ZmYl9hbmRfdmtiX2Zyb21faHZtX2d1ZXN0X2NvbmZpZyhsaWJ4bF9fZ2MgKmdjLAogICAgIHJl
dHVybiAwOwogfQogCitzdGF0aWMgaW50IGxpYnhsX193cml0ZV9zdHViX2xpbnV4X2RtYXJncyhs
aWJ4bF9fZ2MgKmdjLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IGRt
X2RvbWlkLCBpbnQgZ3Vlc3RfZG9taWQsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjaGFyICoqYXJncykKK3sKKyAgICBsaWJ4bF9jdHggKmN0eCA9IGxpYnhsX19nY19vd25l
cihnYyk7CisgICAgaW50IGk7CisgICAgY2hhciAqdm1fcGF0aDsKKyAgICBjaGFyICpwYXRoOwor
ICAgIHN0cnVjdCB4c19wZXJtaXNzaW9ucyByb3Blcm1bMl07CisgICAgeHNfdHJhbnNhY3Rpb25f
dCB0OworCisgICAgcm9wZXJtWzBdLmlkID0gMDsKKyAgICByb3Blcm1bMF0ucGVybXMgPSBYU19Q
RVJNX05PTkU7CisgICAgcm9wZXJtWzFdLmlkID0gZG1fZG9taWQ7CisgICAgcm9wZXJtWzFdLnBl
cm1zID0gWFNfUEVSTV9SRUFEOworCisgICAgdm1fcGF0aCA9IGxpYnhsX194c19yZWFkKGdjLCBY
QlRfTlVMTCwgR0NTUFJJTlRGKCIvbG9jYWwvZG9tYWluLyVkL3ZtIiwgZ3Vlc3RfZG9taWQpKTsK
KyAgICBwYXRoID0gR0NTUFJJTlRGKCIlcy9pbWFnZS9kbWFyZ3MiLCB2bV9wYXRoKTsKKworcmV0
cnlfdHJhbnNhY3Rpb246CisgICAgdCA9IHhzX3RyYW5zYWN0aW9uX3N0YXJ0KGN0eC0+eHNoKTsK
KyAgICB4c193cml0ZShjdHgtPnhzaCwgdCwgcGF0aCwgIiIsIDApOworICAgIHhzX3NldF9wZXJt
aXNzaW9ucyhjdHgtPnhzaCwgdCwgcGF0aCwgcm9wZXJtLCBBUlJBWV9TSVpFKHJvcGVybSkpOwor
ICAgIGkgPSAxOworICAgIGZvciAoaT0xOyBhcmdzW2ldICE9IE5VTEw7IGkrKykKKyAgICAgICAg
eHNfd3JpdGUoY3R4LT54c2gsIHQsIEdDU1BSSU5URigiJXMvJTAzZCIsIHBhdGgsIGkpLCBhcmdz
W2ldLCBzdHJsZW4oYXJnc1tpXSkpOworCisgICAgeHNfc2V0X3Blcm1pc3Npb25zKGN0eC0+eHNo
LCB0LCBHQ1NQUklOVEYoIiVzL3J0Yy90aW1lb2Zmc2V0Iiwgdm1fcGF0aCksIHJvcGVybSwgQVJS
QVlfU0laRShyb3Blcm0pKTsKKyAgICBpZiAoIXhzX3RyYW5zYWN0aW9uX2VuZChjdHgtPnhzaCwg
dCwgMCkpCisgICAgICAgIGlmIChlcnJubyA9PSBFQUdBSU4pCisgICAgICAgICAgICBnb3RvIHJl
dHJ5X3RyYW5zYWN0aW9uOworICAgIHJldHVybiAwOworfQorCiBzdGF0aWMgaW50IGxpYnhsX193
cml0ZV9zdHViX2RtYXJncyhsaWJ4bF9fZ2MgKmdjLAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgaW50IGRtX2RvbWlkLCBpbnQgZ3Vlc3RfZG9taWQsCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjaGFyICoqYXJncykKQEAgLTIyNTgsNyArMjI5MiwxMCBA
QCB2b2lkIGxpYnhsX19zcGF3bl9zdHViX2RtKGxpYnhsX19lZ2MgKmVnYywgbGlieGxfX3N0dWJf
ZG1fc3Bhd25fc3RhdGUgKnNkc3MpCiAKICAgICBsaWJ4bF9fc3RvcmVfbGlieGxfZW50cnkoZ2Ms
IGd1ZXN0X2RvbWlkLCAiZG0tdmVyc2lvbiIsCiAgICAgICAgIGxpYnhsX2RldmljZV9tb2RlbF92
ZXJzaW9uX3RvX3N0cmluZyhkbV9jb25maWctPmJfaW5mby5kZXZpY2VfbW9kZWxfdmVyc2lvbikp
OwotICAgIGxpYnhsX193cml0ZV9zdHViX2RtYXJncyhnYywgZG1fZG9taWQsIGd1ZXN0X2RvbWlk
LCBhcmdzKTsKKyAgICBpZiAobGlieGxfX3N0dWJkb21haW5faXNfbGludXgoJmd1ZXN0X2NvbmZp
Zy0+Yl9pbmZvKSkKKyAgICAgICAgbGlieGxfX3dyaXRlX3N0dWJfbGludXhfZG1hcmdzKGdjLCBk
bV9kb21pZCwgZ3Vlc3RfZG9taWQsIGFyZ3MpOworICAgIGVsc2UKKyAgICAgICAgbGlieGxfX3dy
aXRlX3N0dWJfZG1hcmdzKGdjLCBkbV9kb21pZCwgZ3Vlc3RfZG9taWQsIGFyZ3MpOwogICAgIGxp
YnhsX194c19wcmludGYoZ2MsIFhCVF9OVUxMLAogICAgICAgICAgICAgICAgICAgICAgR0NTUFJJ
TlRGKCIlcy9pbWFnZS9kZXZpY2UtbW9kZWwtZG9taWQiLAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGxpYnhsX194c19nZXRfZG9tcGF0aChnYywgZ3Vlc3RfZG9taWQpKSwKLS0gCmdp
dC1zZXJpZXMgMC45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
