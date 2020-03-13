Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E6F1845EE
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 12:27:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCiRP-00081s-0g; Fri, 13 Mar 2020 11:25:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ohDd=46=invisiblethingslab.com=pawel@srs-us1.protection.inumbo.net>)
 id 1jCiRN-00081g-GN
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 11:25:21 +0000
X-Inumbo-ID: 528e95fc-651d-11ea-b2c4-12813bfff9fa
Received: from out4-smtp.messagingengine.com (unknown [66.111.4.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 528e95fc-651d-11ea-b2c4-12813bfff9fa;
 Fri, 13 Mar 2020 11:25:20 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 06CA8226B4;
 Fri, 13 Mar 2020 07:25:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 13 Mar 2020 07:25:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=zzhOeL
 cLCNfp5McXrz+vySJLo0DljT5Z4GNhQjlwPyQ=; b=sEyqs9jKPrtGb/sfsqIEve
 BoqFFhCaqtjrPrE+gzTQZRNyHkypgRA/unAeL1v1kgggo4M6m1/aeDSsFmq6RtZu
 wSU6Uy0jNGSPvnbhaRJuip1DRaKEHq2iuWAFVQL9wwsraN/6I5jNQzxYO1QMEqDR
 SFixzX8SwnSkw+rDJWmq3XakVtaDwlTH/x5UxiuAi3D8zgFVMOtilVLrMxLmW7mq
 xY+Yy7ZtvAgd1A/2buqGCQjp6hiAGGMucUJ6540oDc7qoMnT45suoBcg7k6J18m1
 Hcc6u17x8Vc41ra7hFiwYMa+tf1MVWt12By4VMfbcNCyg4y9MY0+2jE1oZv7fNeg
 ==
X-ME-Sender: <xms:n21rXuU-KCJHt9o-lz6UcbN9VjGfni4V-R1JdDRfWzj9akPaUtCjvQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedruddvjedgvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomheprfgrfigvlhcu
 ofgrrhgtiigvfihskhhiuceophgrfigvlhesihhnvhhishhisghlvghthhhinhhgshhlrg
 gsrdgtohhmqeenucffohhmrghinhepthhrohhusghlvgdrthhoohhlshenucfkphepkeel
 rdeigedrjeekrdduleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepphgrfigvlhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:n21rXhbr4Oj8jAXI7n9eyGAFJUQIhiWBwLk7Exs9ALkvxZTBX42rbw>
 <xmx:n21rXrVyz-TS0cC9g9hiRpwGiPMdY31UjznCzEYG75aQETope6nN-w>
 <xmx:n21rXoJAQJpsLGXtC2Tr7jUW9jNAQv7dkWGc6wZ3_-igySxIOj40qQ>
 <xmx:oG1rXn0ut1SnfoiqwIK5MH-E4-23pZ-x65k1ldE-nudA24og6X65zQ>
Received: from localhost.localdomain (89-64-78-197.dynamic.chello.pl
 [89.64.78.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id 873263280059;
 Fri, 13 Mar 2020 07:25:18 -0400 (EDT)
From: =?UTF-8?q?Pawe=C5=82=20Marczewski?= <pawel@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 13 Mar 2020 12:25:10 +0100
Message-Id: <f6691746dcbdc30a14dbe36d219697187afe502b.1584098295.git.pawel@invisiblethingslab.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH] libxl: fix cleanup bug in
 initiate_domain_create()
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
 =?UTF-8?q?Pawe=C5=82=20Marczewski?= <pawel@invisiblethingslab.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gY2FzZSBvZiBlcnJvcnMsIHdlIGltbWVkaWF0ZWx5IGNhbGwgZG9tY3JlYXRlX2NvbXBsZXRl
KCkKd2hpY2ggY2xlYW5zIHVwIHRoZSBjb25zb2xlX3hzd2FpdCBvYmplY3QuIE1ha2Ugc3VyZSBp
dCBpcyBpbml0aWFsaXplZApiZWZvcmUgd2Ugc3RhcnQgY2xlYW51cC4KClNpZ25lZC1vZmYtYnk6
IFBhd2XFgiBNYXJjemV3c2tpIDxwYXdlbEBpbnZpc2libGV0aGluZ3NsYWIuY29tPgotLS0KVGhp
cyBpcyBhIGZvbGxvdyB1cCB0byBteSBwcmV2aW91cyBwYXRjaCwgJ2xpYnhsOiB3YWl0IGZvciBj
b25zb2xlIHBhdGggYmVmb3JlCmZpcmluZyBjb25zb2xlX2F2YWlsYWJsZScuIFdlIGRpc2NvdmVy
ZWQgdGhlIGJ1ZyB3aGVuIHJ1bm5pbmcgaW50ZWdyYXRpb24gdGVzdHMKZm9yIFF1YmVzIE9TIChh
bmQgdmVyaWZpZWQgdGhhdCB0aGlzIHBhdGNoIGhlbHBzKS4gU29ycnkgZm9yIHRoZSB0cm91Ymxl
LgoKIHRvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhs
L2xpYnhsX2NyZWF0ZS5jIGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKaW5kZXggYWRhOTQy
YmM4ZC4uZmMzNmM0MjYzZCAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMK
KysrIGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKQEAgLTExMDIsNiArMTEwMiw4IEBAIHN0
YXRpYyB2b2lkIGluaXRpYXRlX2RvbWFpbl9jcmVhdGUobGlieGxfX2VnYyAqZWdjLAogICAgIGxp
YnhsX2RvbWFpbl9jb25maWcgKmNvbnN0IGRfY29uZmlnID0gZGNzLT5ndWVzdF9jb25maWc7CiAg
ICAgY29uc3QgaW50IHJlc3RvcmVfZmQgPSBkY3MtPnJlc3RvcmVfZmQ7CiAKKyAgICBsaWJ4bF9f
eHN3YWl0X2luaXQoJmRjcy0+Y29uc29sZV94c3dhaXQpOworCiAgICAgZG9taWQgPSBkY3MtPmRv
bWlkOwogICAgIGxpYnhsX19kb21haW5fYnVpbGRfc3RhdGVfaW5pdCgmZGNzLT5idWlsZF9zdGF0
ZSk7CiAKQEAgLTExNTMsOCArMTE1NSw2IEBAIHN0YXRpYyB2b2lkIGluaXRpYXRlX2RvbWFpbl9j
cmVhdGUobGlieGxfX2VnYyAqZWdjLAogICAgIGlmIChyZXQpCiAgICAgICAgIGdvdG8gZXJyb3Jf
b3V0OwogCi0gICAgbGlieGxfX3hzd2FpdF9pbml0KCZkY3MtPmNvbnNvbGVfeHN3YWl0KTsKLQog
ICAgIGlmIChyZXN0b3JlX2ZkID49IDAgfHwgZGNzLT5zb2Z0X3Jlc2V0KSB7CiAgICAgICAgIExP
R0QoREVCVUcsIGRvbWlkLCAicmVzdG9yaW5nLCBub3QgcnVubmluZyBib290bG9hZGVyIik7CiAg
ICAgICAgIGRvbWNyZWF0ZV9ib290bG9hZGVyX2RvbmUoZWdjLCAmZGNzLT5ibCwgMCk7Ci0tIAoy
LjI0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
