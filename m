Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2C26B2FC
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 03:04:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnYK2-00054R-8o; Wed, 17 Jul 2019 01:01:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o+Bt=VO=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hnYK0-000542-9A
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 01:01:28 +0000
X-Inumbo-ID: 65db98f0-a82e-11e9-9acd-679cd0efb6fa
Received: from new3-smtp.messagingengine.com (unknown [66.111.4.229])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 65db98f0-a82e-11e9-9acd-679cd0efb6fa;
 Wed, 17 Jul 2019 01:01:24 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6586C22C5;
 Tue, 16 Jul 2019 21:01:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 16 Jul 2019 21:01:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=KfbX31
 HzPuJRwZjCOc99cvHJdumaNPTN5XOi8sXY5wU=; b=nBiYT0aofiE8DBZZDz0sYg
 MrcFXraVfL0GPH9d/9VbncsRB7m+f5tKyE9KMF6CnwLkv02u6JAp2mDleAf1jX3f
 wTdZ5uA6/O1Nqi4YuWmI/x12UlfS8OC2b1iOT+e1Rx6aSTHtWmOvH0XBbrNftxYV
 fMs9kuuRTmFv2ELUelO6wz/RjplAgS/di2L0PAL1mCR0JANusjbdeBotWl48FbSH
 nwCjkh0+QVY/TQW2zWd2NuRszo4FkrxINjRBnFAulvvpaq0eJNcVXjdoaHrlR63E
 GLaZ7gn5XVEi+UsIh8JXw71RaQlW8PnOelZJM+rxiqKf7+RiFTACcyqu+5Qzl2NQ
 ==
X-ME-Sender: <xms:YXMuXR3MH8Ki5_H7gb_NIcowgg09KS3jia_cv56208sc74pTl4EVkg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddriedugdegvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddqiedmnecujfgurhephffvufffkffogggtgfesthekredtredtjeen
 ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
 grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuffho
 mhgrihhnpehquhgsvghsqdhoshdrohhrghenucfkphepledurdeihedrfeegrdeffeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhh
 ihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:YXMuXaI5fNmlyyCDgTngS1xlWTQYUSjiMlKiCtypbK-KZy9M1xZ_Kg>
 <xmx:YXMuXQAc2UsVo__DMd_NYo2o-RmaIRRMtXyi9WZd0Ii5sUa74npDOw>
 <xmx:YXMuXTxgbtbvNYxV9tgDTDrnQBeaGSAy8Y-a7Vg1noU8-o2o8R71Lg>
 <xmx:Y3MuXV8r_7YSu1KEPbOXvKcNzk2dCVGh2AN1cAh7Imq7nwrHgP832A>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 344B6380086;
 Tue, 16 Jul 2019 21:01:19 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 17 Jul 2019 03:00:38 +0200
Message-Id: <cover.537da3804adbe71352bed871578f3e893e2210c5.1563325215.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 0/6] Fix PCI passthrough for HVM with
 stubdomain
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Brian Woods <brian.woods@amd.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gdGhpcyB2ZXJzaW9uLCBJIGFkZCBQSFlTREVWT1BfbXNpX2NvbnRyb2wgdG8gYWxsb3cgc3R1
YmRvbWFpbgplbmFibGluZyBNU0kgYWZ0ZXIgbWFwcGluZyBpdC4KClJlbGF0ZWQgYXJ0aWNsZToK
aHR0cHM6Ly93d3cucXViZXMtb3Mub3JnL25ld3MvMjAxNy8xMC8xOC9tc2ktc3VwcG9ydC8KCkNo
YW5nZXMgaW4gdjI6CiAtIG5ldyAieGVuL3g4NjogQWxsb3cgc3R1YmRvbSBhY2Nlc3MgdG8gaXJx
IGNyZWF0ZWQgZm9yIG1zaSIgcGF0Y2gKIC0gYXBwbGllZCByZXZpZXcgY29tbWVudHMgZnJvbSB2
MQpDaGFuZ2VzIGlzIHYzOgogLSBhcHBseSBzdWdnZXN0aW9ucyBieSBSb2dlcgogLSBhZGQgUEhZ
U0RFVk9QX21zaV9tc2l4X3NldF9lbmFibGUKQ2hhbmdlcyBpbiB2NDoKIC0gaW1wbGVtZW50IHN1
Z2dlc3Rpb25zIGJ5IFdlaSwgUm9nZXIsIEphbgogLSBwbHVnIG5ldyBwaHlzZGV2b3AgaW50byBY
U00KQ2hhbmdlcyBpbiB2NToKIC0gcmViYXNlIG9uIG1hc3RlcgogLSByZW5hbWUgdG8gUEhZU0RF
Vk9QX21zaV9jb250cm9sCiAtIG1vdmUgZ3JhbnRpbmcgYWNjZXNzIHRvIElSUSBpbnRvIGNyZWF0
ZV9pcnEKCi0tLQpDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkNj
OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KQ2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNv
bT4KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEp1bGllbiBHcmFsbCA8
anVsaWVuLmdyYWxsQGFybS5jb20+CkNjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53
aWxrQG9yYWNsZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5l
bC5vcmc+CkNjOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KQ2M6IEFudGhvbnkgUEVSQVJEIDxh
bnRob255LnBlcmFyZEBjaXRyaXguY29tPgpDYzogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KQ2M6IFN1cmF2ZWUgU3V0aGlrdWxwYW5pdCA8c3VyYXZlZS5zdXRoaWt1
bHBhbml0QGFtZC5jb20+CkNjOiBCcmlhbiBXb29kcyA8YnJpYW4ud29vZHNAYW1kLmNvbT4KQ2M6
IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgpDYzogRGFuaWVsIERlIEdyYWFmIDxk
Z2RlZ3JhQHR5Y2hvLm5zYS5nb3Y+CgpNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgKDYpOgog
IGxpYnhsOiBkbyBub3QgYXR0YWNoIHhlbi1wY2liYWNrIHRvIEhWTSBkb21haW4sIGlmIHN0dWJk
b21haW4gaXMgaW4gdXNlCiAgbGlieGw6IGF0dGFjaCBQQ0kgZGV2aWNlIHRvIHFlbXUgb25seSBh
ZnRlciBzZXR0aW5nIHBjaWJhY2svcGNpZnJvbnQKICBsaWJ4bDogZG9uJ3QgdHJ5IHRvIG1hbmlw
dWxhdGUganNvbiBjb25maWcgZm9yIHN0dWJkb21haW4KICB4ZW4veDg2OiBBbGxvdyBzdHViZG9t
IGFjY2VzcyB0byBpcnEgY3JlYXRlZCBmb3IgbXNpLgogIHhlbi94ODY6IGFkZCBQSFlTREVWT1Bf
bXNpX2NvbnRyb2wKICB0b29scy9saWJ4YzogYWRkIHdyYXBwZXIgZm9yIFBIWVNERVZPUF9tc2lf
Y29udHJvbAoKIHRvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3RybC5oICAgICAgICAgICAgfCAgNiAr
Ky0KIHRvb2xzL2xpYnhjL3hjX3BoeXNkZXYuYyAgICAgICAgICAgICAgICAgfCAxOSArKysrKysr
Ky0KIHRvb2xzL2xpYnhsL2xpYnhsX3BjaS5jICAgICAgICAgICAgICAgICAgfCA2MyArKysrKysr
KysrKysrKysrKy0tLS0tLS0tCiB4ZW4vYXJjaC94ODYvaHBldC5jICAgICAgICAgICAgICAgICAg
ICAgIHwgIDMgKy0KIHhlbi9hcmNoL3g4Ni9pcnEuYyAgICAgICAgICAgICAgICAgICAgICAgfCA1
MSArKysrKysrKysrKysrKy0tLS0tLQogeGVuL2FyY2gveDg2L21zaS5jICAgICAgICAgICAgICAg
ICAgICAgICB8IDQyICsrKysrKysrKysrKysrKysrLQogeGVuL2FyY2gveDg2L3BoeXNkZXYuYyAg
ICAgICAgICAgICAgICAgICB8IDI1ICsrKysrKysrKystCiB4ZW4vYXJjaC94ODYveDg2XzY0L3Bo
eXNkZXYuYyAgICAgICAgICAgIHwgIDQgKystCiB4ZW4vY29tbW9uL2lycS5jICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDEgKy0KIHhlbi9kcml2ZXJzL2NoYXIvbnMxNjU1MC5jICAgICAgICAg
ICAgICAgfCAgMiArLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYyB8
ICAyICstCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYyAgICAgICAgICAgIHwgIDMgKy0K
IHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jICAgICAgfCAgMyArLQogeGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9pcnEuaCAgICAgICAgICAgICAgICB8ICAyICstCiB4ZW4vaW5jbHVkZS9h
c20teDg2L21zaS5oICAgICAgICAgICAgICAgIHwgIDEgKy0KIHhlbi9pbmNsdWRlL3B1YmxpYy9w
aHlzZGV2LmggICAgICAgICAgICAgfCAxNiArKysrKystCiB4ZW4vaW5jbHVkZS94ZW4vaXJxLmgg
ICAgICAgICAgICAgICAgICAgIHwgIDEgKy0KIHhlbi9pbmNsdWRlL3hsYXQubHN0ICAgICAgICAg
ICAgICAgICAgICAgfCAgMSArLQogeGVuL2luY2x1ZGUveHNtL2R1bW15LmggICAgICAgICAgICAg
ICAgICB8ICA3ICsrKy0KIHhlbi9pbmNsdWRlL3hzbS94c20uaCAgICAgICAgICAgICAgICAgICAg
fCAgNiArKy0KIHhlbi94c20vZHVtbXkuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSAr
LQogeGVuL3hzbS9mbGFzay9ob29rcy5jICAgICAgICAgICAgICAgICAgICB8IDI0ICsrKysrKysr
KystCiB4ZW4veHNtL2ZsYXNrL3BvbGljeS9hY2Nlc3NfdmVjdG9ycyAgICAgIHwgIDEgKy0KIDIz
IGZpbGVzIGNoYW5nZWQsIDI0NiBpbnNlcnRpb25zKCspLCAzOCBkZWxldGlvbnMoLSkKCmJhc2Ut
Y29tbWl0OiBiNTQxMjg3YzM2MDA3MTNmZWFhYWY3NjA4Y2Q0MDVlN2IyZTRlZmQwCi0tIApnaXQt
c2VyaWVzIDAuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
