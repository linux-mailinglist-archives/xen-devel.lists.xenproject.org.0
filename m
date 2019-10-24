Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BFCE291D
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 05:48:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNU3q-0003ex-18; Thu, 24 Oct 2019 03:45:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zRGa=YR=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iNU3n-0003es-E8
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 03:45:15 +0000
X-Inumbo-ID: afc1c0c2-f610-11e9-beca-bc764e2007e4
Received: from new2-smtp.messagingengine.com (unknown [66.111.4.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id afc1c0c2-f610-11e9-beca-bc764e2007e4;
 Thu, 24 Oct 2019 03:45:14 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id E2FA76FA5;
 Wed, 23 Oct 2019 23:45:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 23 Oct 2019 23:45:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=/zrI8S
 HfQt9/Kqm8uD+OrMAZIKLwoQZHBlW2dhofSW0=; b=T/vgC/pjPOXtsPwz/DRr2y
 f6IxuCxqr3Dt1EW2R/tmGkA1pYvf0b7ZY8lWr5derOZsjYO1vx4eFObnOKdJXyVT
 v1NL0ccon21xmiqmcRvB6spTNY4EVj9JlVwMTNeTUY0yMpQRkh9gzFaoCx/OT8hA
 POeHWzwEmTl6J8PNp0wk3QBHvCS8x9F2urdo69t60BZF13cY2OBAIjAl5s8nCvZy
 uU4zoe+1H+zzz/0lKdFfuRuuxklg9foI55WMEZ/z7sqW/SDntDZ1SGuPb17v5h++
 DvEGiuf0pJvAJ+3gHoxYCWq3GYB6E86SoVyEeRJRxzAKYtQ7NZVGvTebnutdfY/Q
 ==
X-ME-Sender: <xms:SB6xXW3AFb6jZ3WNQ5OL-PHoQZTqiaMgzdO7o4qvUf-DZcaCEKBEMw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrledtgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucfo
 rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
 hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucffohhmrghinhepgigvnhhprhhojhgv
 tghtrdhorhhgnecukfhppeeluddrieehrdefgedrfeefnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
 necuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:SB6xXdV4mzJ94g4LxcTIiNgwnAYSJAfuG8z1ROiTqK5OICWAytg78Q>
 <xmx:SB6xXSfEblcAum8hY6IM0wFclexoRRDelPqCvDct75_K_P94ggXeZw>
 <xmx:SB6xXW-fhLyHLf5-fnuM89s0JYhu53cZKo3FHZrqtb94GG9nQAHXLg>
 <xmx:SR6xXWWJPa4tez_6_-lJCrSlCc6lMYBeG0VPxRrD2X4wwX9bzel9bg>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0113680064;
 Wed, 23 Oct 2019 23:45:10 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 24 Oct 2019 05:45:02 +0200
Message-Id: <cover.d9b2d7d69cc351a30963d653b1d459c878356e4e.1571888583.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 0/3] Optionally call EFI
 SetVirtualAddressMap()
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V29ya2Fyb3VuZCBidWdneSBVRUZJIGFjY2Vzc2luZyBib290IHNlcnZpY2VzIG1lbW9yeSBhZnRl
ciBFeGl0Qm9vdFNlcnZpY2VzKCkuClBhdGNoZXMgZGlzY3Vzc2VkIGhlcmU6Cmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wOC9tc2cwMDcw
MS5odG1sCgpJbiBhZGRpdGlvbiB0byB0aGUgdGVzdHMgYmVsb3csIEkndmUgdGVzdGVkIGtleGVj
IG9uIHhlbi5lZmkgd2l0aCB0aGlzIG9wdGlvbgplbmFibGVkIGFuZCBpdCAoc3RpbGwpIHdvcmtz
LgoKVGVzdCByZXN1bHRzIG9uIGZldyBsYXB0b3BzOgoKVGhpbmtwYWQgeDIzMCwgZmlybXdhcmUg
dmVyc2lvbiAyLjc3OgogLSB3aXRob3V0IHRoZSBwYXRjaDogY3Jhc2hlcyBvbiBSUyBjYWxsICht
YXBicyBoZWxwcykKIC0gd2l0aCBwYXRjaDogd29ya3MKIC0gc2FtZSB3aXRoIHhlbi5lZmkgYW5k
IE1CMgoKTGlicmVtIDE0IHYxLCBmaXJtd2FyZSB2ZXJzaW9uIChBTUkpIEFSVUQwMjYgKDA2LzE4
LzIwMTUpOgogLSB3aXRob3V0IHRoZSBwYXRjaDogd29ya3MKIC0gd2l0aCB0aGUgcGF0Y2g6IHdv
cmtzCiAtIHNhbWUgd2l0aCB4ZW4uZWZpIGFuZCBNQjIKCkRlbGwgTGF0aXR1ZGUgRTY0MjAsIGZp
cm13YXJlIHZlcnNpb24gQTIxOgogdGhpcyBtYWNoaW5lIHJlcXVpcmVzIGVmaT1hdHRyPXVjIHdv
cmthcm91bmQKIC0gd2l0aG91dCB0aGUgcGF0Y2g6IGRvbTAgaGFuZ3MgYmVmb3JlIHNlbmRpbmcg
YW55IG1lc3NhZ2UgdG8gdGhlIGNvbnNvbGUgKGV2ZW4gd2l0aCBlYXJseXByaW50az14ZW4gZXRj
KQogLSB3aXRoIHRoZSBwYXRjaDogY3Jhc2hlcyBiZWZvcmUgZG9tMCBwcmludHMgYW55dGhpbmc6
IG1tLmM6ODk2OmQwdjAgbm9uLXByaXZpbGVnZWQgYXR0ZW1wdCB0byBtYXAgTU1JTyBzcGFjZSAy
YzJjMmMyYzJjCiAtIHNhbWUgd2l0aCB4ZW4uZWZpIGFuZCBNQjIKClRoaW5rcGFkIFc1NDA6CiAt
IHdpdGhvdXQgdGhlIHBhdGNoOiBjcmFzaGVzIG9uIFJTIGNhbGwgKG9ubHkgZWZpPW5vLXJzIGhl
bHBzKQogLSB3aXRoIHBhdGNoOiB3b3JrcwogLSB0ZXN0ZWQgb25seSB3aXRoIE1CMgoKVGhpbmtw
YWQgWDEgQ2FyYm9uIGdlbjUsIGZpcm13YXJlIHZlcnNpb24gMS4yMiAoMjAxNy0wNy0wNCk6CiAt
IHdpdGhvdXQgdGhlIHBhdGNoOiB3b3JrcwogLSB3aXRoIHBhdGNoOiB3b3JrcwogLSB0ZXN0ZWQg
b25seSB4ZW4uZWZpCgpUaGlua3BhZCBQNTIsIGZpcm13YXJlIHZlcnNpb24gMS4yNSAoMjAxOC0w
NC0xNSk6CiAtIHdpdGhvdXQgdGhlIHBhdGNoIChNQjIpOiBoYW5ncyBvbiBSUyBjYWxsIChtYXBi
cyBoZWxwcykKIC0gd2l0aG91dCB0aGUgcGF0Y2ggKHhlbi5lZmkpOiB3b3Jrcyg/ISkKIC0gd2l0
aCB0aGUgcGF0Y2g6IHdvcmtzCiAtIHRlc3RlZCB3aXRoIHhlbi5lZmkgYW5kIE1CMgoKVGVzdGVk
LWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5n
c2xhYi5jb20+CgpEZWxsIExhdGl0dWRlIDU1ODAsIGZpcm13YXJlIDEuMTYuMAogLSB3aXRob3V0
IHRoZSBwYXRjaDogd29ya3MKIC0gd2l0aCBwYXRjaDogd29ya3MKIC0gdGVzdGVkIG9ubHkgeGVu
LmVmaQoKVGVzdGVkLWJ5OiBKYXNvbiBBbmRyeXVrIDxqYW5kcnl1a0BnbWFpbC5jb20+CgpDaGFu
Z2VzIGluIHYyOgogLSBmaXggYm9vdCB3aXRoIHhlbi5lZmkgKGVmaV9tZW1tYXAgYXQgdGhpcyBw
b2ludCBzdGlsbCBuZWVkcyB0byBiZSBhY2Nlc3NlZAogICB2aWEgcGh5c2ljYWwgYWRkcmVzcyku
IFRCSCwgSSBkb24ndCB1bmRlcnN0YW5kIHdoeSBwcmV2aW91cyB2ZXJzaW9uIHdvcmtlZAogICB3
aXRoIE1CMiAtIGlzIGRpcmVjdG1hcCBtYXBwZWQgYXQgdGhpcyBwb2ludD8KQ2hhbmdlcyBpbiB2
NDoKIC0gcmV3b3JkIGNvbW1pdCBtZXNzYWdlcywgZHJvcCBtZW50aW9ucyBvZiBrZXhlYwogLSBu
ZXcgcGF0Y2ggKDMpCgpDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpDYzogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IEdlb3JnZSBEdW5sYXAg
PEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3Nv
bkBldS5jaXRyaXguY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzog
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ2M6IEtvbnJhZCBSemVzenV0ZWsg
V2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgpDYzogV2Vp
IExpdSA8d2xAeGVuLm9yZz4KQ2M6IEphc29uIEFuZHJ5dWsgPGphbmRyeXVrQGdtYWlsLmNvbT4K
Ck1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSAoMyk6CiAgZWZpOiByZW1vdmUgb2xkIFNldFZp
cnR1YWxBZGRyZXNzTWFwKCkgYXJyYW5nZW1lbnQKICB4ZW4vZWZpOiBvcHRpb25hbGx5IGNhbGwg
U2V0VmlydHVhbEFkZHJlc3NNYXAoKQogIHhlbi9lZmk6IHVzZSBkaXJlY3RtYXAgdG8gYWNjZXNz
IHJ1bnRpbWUgc2VydmljZXMgdGFibGUKCiB4ZW4vY29tbW9uL0tjb25maWcgICAgICAgfCAxMCAr
KysrKysrKy0KIHhlbi9jb21tb24vZWZpL2Jvb3QuYyAgICB8IDUyICsrKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vY29tbW9uL2VmaS9ydW50aW1lLmMgfCAxOSAr
KystLS0tLS0tLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKSwgMzcgZGVs
ZXRpb25zKC0pCgpiYXNlLWNvbW1pdDogN2E0ZTY3MTExMTQ5MDViM2NiYmU0OGU4MWMzMjIyMzYx
YTdmMzU3OQotLSAKZ2l0LXNlcmllcyAwLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
