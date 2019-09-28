Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEC9C1107
	for <lists+xen-devel@lfdr.de>; Sat, 28 Sep 2019 16:23:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEDb0-0003iO-3V; Sat, 28 Sep 2019 14:21:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9Ov/=XX=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iEDay-0003iD-Ef
 for xen-devel@lists.xenproject.org; Sat, 28 Sep 2019 14:21:12 +0000
X-Inumbo-ID: 38e1563a-e1fb-11e9-bf31-bc764e2007e4
Received: from new4-smtp.messagingengine.com (unknown [66.111.4.230])
 by localhost (Halon) with ESMTPS
 id 38e1563a-e1fb-11e9-bf31-bc764e2007e4;
 Sat, 28 Sep 2019 14:21:11 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id B5602107D;
 Sat, 28 Sep 2019 10:21:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Sat, 28 Sep 2019 10:21:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Wny+VU
 o+NYM3xZGAC0fNp7A3zu1SUAuz1b8egBpZFxQ=; b=BHKcbLP7S1CPB7gwY0OrDB
 RiiCNfHGdLIzALUFUHqgNJauKN0J4pa5R1Km0qoLn1sm+KPUMycakSLtmi7bWLTG
 ETNc72+pibmmlC2hz6yHdccHcs4jpM6Z/xaBVdsSAxmLvYs+1qC8A7IsImPAYZe3
 Zh6nlgiNzfbQTvkStItEb7EsSrtHNIRCM/c0d3Uq62FqLnUBVRTR5BxCzq/iFAmR
 RxT3cgz7WEBIpCSyms4DkiFaXIxKrA+OyFZ/PYK4mVOIHd0dHLoTPwTms+iWy0Uu
 fj+WL5wwDMshDuRUspP+76Wu73sPc3gr9uywFJPuvK2IcEhTOp0qhrrUoS1wlQsA
 ==
X-ME-Sender: <xms:V2yPXTChqa408VTmCVlqNXYOh5Sk7-fYQSR_CCV6jTPVnGa1AD6vxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeekgdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddqiedmnecujfgurhephffvufffkffogggtgfesthekredtredtjeen
 ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
 grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhp
 peeluddrieehrdefgedrfeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrh
 gvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfu
 ihiivgeptd
X-ME-Proxy: <xmx:V2yPXZpC3AfQe8Y4wUOk-ysJE2xkQ9W1yw3OZ75GNsXgHH1EsDqB4g>
 <xmx:V2yPXWjBaZzifiUkL-K5qwnaDvd460E5HSCuvxLEMbrDayifmqWTAQ>
 <xmx:V2yPXeCJ2Xv0bdQzoTZ8fW6h81m8YXs9uiUpUK8fGoiPqXo6PWYcAA>
 <xmx:V2yPXa15chLJvhEXU3vUQExVrG1zIs4kCgtM5wdtha_kCCKP1ueMig>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 78E45D60057;
 Sat, 28 Sep 2019 10:21:09 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Sat, 28 Sep 2019 16:20:33 +0200
Message-Id: <cover.ab9be47e05c2dc2aa047d0a810c29ecd14bfe463.1569680095.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v8 0/4] Fix PCI passthrough for HVM with
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

VGhpcyB2ZXJzaW9uIGlzIHJlYmFzZSBsaWJ4bCBwYXRjaGVzIG9uIHN0YWdpbmcuIENoYW5nZXMg
dG8gImxpYnhsOiBhdHRhY2ggUENJCmRldmljZSB0byBxZW11IG9ubHkgYWZ0ZXIgc2V0dGluZyBw
Y2liYWNrL3BjaWZyb250IiBhcmUgc2lnbmlmaWNhbnQgZW5vdWdoIHRoYXQKSSd2ZSBkcm9wcGVk
IFdlaSdzIGFjay4KQWxzbywgdGhlcmUgaXMgYSBuZXcgcGF0Y2ggdG8gZml4IHJlZ3Jlc3Npb24g
aW50cm9kdWNlZCBkdXJpbmcgYXN5bmMgY29udmVyc2lvbi4KCkNoYW5nZXMgaW4gdjI6CiAtIG5l
dyAieGVuL3g4NjogQWxsb3cgc3R1YmRvbSBhY2Nlc3MgdG8gaXJxIGNyZWF0ZWQgZm9yIG1zaSIg
cGF0Y2gKIC0gYXBwbGllZCByZXZpZXcgY29tbWVudHMgZnJvbSB2MQpDaGFuZ2VzIGlzIHYzOgog
LSBhcHBseSBzdWdnZXN0aW9ucyBieSBSb2dlcgogLSBhZGQgUEhZU0RFVk9QX21zaV9tc2l4X3Nl
dF9lbmFibGUKQ2hhbmdlcyBpbiB2NDoKIC0gaW1wbGVtZW50IHN1Z2dlc3Rpb25zIGJ5IFdlaSwg
Um9nZXIsIEphbgogLSBwbHVnIG5ldyBwaHlzZGV2b3AgaW50byBYU00KQ2hhbmdlcyBpbiB2NToK
IC0gcmViYXNlIG9uIG1hc3RlcgogLSByZW5hbWUgdG8gUEhZU0RFVk9QX21zaV9jb250cm9sCiAt
IG1vdmUgZ3JhbnRpbmcgYWNjZXNzIHRvIElSUSBpbnRvIGNyZWF0ZV9pcnEKQ2hhbmdlcyBpbiB2
NjoKIC0gc2ltcGxpZnkgZ3JhbnRpbmcgSVJRIGFjY2VzcywgcmVjb3JkIGRtIGRvbWlkIGZvciBj
bGVhbnVwCiAtIHJlbmFtZSB0byBQSFlTREVWT1BfaW50ZXJydXB0X2NvbnRyb2wKIC0gaW5jbHVk
ZSBJTlR4IGNvbnRyb2wgaW4gdGhlIGh5cGVyY2FsbApDaGFuZ2VzIGluIHY3OgogLSB1cGRhdGUg
Inhlbi94ODY6IEFsbG93IHN0dWJkb20gYWNjZXNzIHRvIGlycSBjcmVhdGVkIGZvciBtc2kiCiAt
IGRyb3AgInhlbi94ODY6IGFkZCBQSFlTREVWT1BfaW50ZXJydXB0X2NvbnRyb2wiCiAtIGRyb3Ag
InRvb2xzL2xpYnhjOiBhZGQgd3JhcHBlciBmb3IgUEhZU0RFVk9QX2ludGVycnVwdF9jb250cm9s
IgpDaGFnZXMgaW4gdjg6CiAtIGRyb3AgYXBwbGllZCAieGVuL3g4NjogQWxsb3cgc3R1YmRvbSBh
Y2Nlc3MgdG8gaXJxIGNyZWF0ZWQgZm9yIG1zaSIKIC0gbmV3IHBhdGNoICJsaWJ4bDogZml4IGNv
bGQgcGx1Z2dlZCBQQ0kgZGV2aWNlIHdpdGggc3R1YmRvbWFpbiIKIC0gcmViYXNlIGxpYnhsIHBh
dGNoZXMgb24gc3RhZ2luZwoKLS0tCkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0
cml4LmNvbT4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBl
dS5jaXRyaXguY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogSnVs
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2ls
ayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4KQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgpDYzogQW50aG9u
eSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CkNjOiAiUm9nZXIgUGF1IE1vbm7D
qSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpDYzogU3VyYXZlZSBTdXRoaWt1bHBhbml0IDxzdXJh
dmVlLnN1dGhpa3VscGFuaXRAYW1kLmNvbT4KQ2M6IEJyaWFuIFdvb2RzIDxicmlhbi53b29kc0Bh
bWQuY29tPgpDYzogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+CkNjOiBEYW5pZWwg
RGUgR3JhYWYgPGRnZGVncmFAdHljaG8ubnNhLmdvdj4KCk1hcmVrIE1hcmN6eWtvd3NraS1Hw7Ny
ZWNraSAoNCk6CiAgbGlieGw6IGZpeCBjb2xkIHBsdWdnZWQgUENJIGRldmljZSB3aXRoIHN0dWJk
b21haW4KICBsaWJ4bDogZG8gbm90IGF0dGFjaCB4ZW4tcGNpYmFjayB0byBIVk0gZG9tYWluLCBp
ZiBzdHViZG9tYWluIGlzIGluIHVzZQogIGxpYnhsOiBhdHRhY2ggUENJIGRldmljZSB0byBxZW11
IG9ubHkgYWZ0ZXIgc2V0dGluZyBwY2liYWNrL3BjaWZyb250CiAgbGlieGw6IGRvbid0IHRyeSB0
byBtYW5pcHVsYXRlIGpzb24gY29uZmlnIGZvciBzdHViZG9tYWluCgogdG9vbHMvbGlieGwvbGli
eGxfcGNpLmMgfCA5NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA3NyBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKCmJhc2Ut
Y29tbWl0OiA3YTRlNjcxMTExNDkwNWIzY2JiZTQ4ZTgxYzMyMjIzNjFhN2YzNTc5Ci0tIApnaXQt
c2VyaWVzIDAuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
