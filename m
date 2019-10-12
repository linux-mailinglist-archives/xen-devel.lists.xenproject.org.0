Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEE4D52FE
	for <lists+xen-devel@lfdr.de>; Sun, 13 Oct 2019 00:15:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iJPc6-0004gn-Af; Sat, 12 Oct 2019 22:11:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QqvL=YF=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iJPc5-0004gi-G1
 for xen-devel@lists.xenproject.org; Sat, 12 Oct 2019 22:11:49 +0000
X-Inumbo-ID: 4906cbe2-ed3d-11e9-bbab-bc764e2007e4
Received: from new4-smtp.messagingengine.com (unknown [66.111.4.230])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4906cbe2-ed3d-11e9-bbab-bc764e2007e4;
 Sat, 12 Oct 2019 22:11:48 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4CF1D48DB;
 Sat, 12 Oct 2019 18:11:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Sat, 12 Oct 2019 18:11:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=MsDRlL
 YP9wj3ZZoPvChl1copIaD66k1xqFH16E06zJ4=; b=rjPlriL8FUrOlynZruSpgZ
 AAtVX3jr0bDt+O5qbe8k5WZsQ4ZcNwcSELNDSZTCUtn3ID/BvSl37S3ToQq3v/sl
 BDp2gSdJpjwt0UyVH0+19nAmo9/fclepub3nHGw2NCXyUn1fmYzAiIuz9W0z/n5q
 yaMTesV3Regen7uBcjOktMJ8B2zRu8+F5LOEGaeVq+HDyPB5WMPcFRslYk+vZw8H
 7WTQq14PVJvxAEidqB5AY4oLCbGxxfFg6bs70Tj9PaODmg0tirDqKNajZ2PsOQBv
 TkXpcMkodrV2xCdvXUACSIoa0rShDwVl6e/LaUlY2B3gmaBD3LlbG28/GHDZUoXw
 ==
X-ME-Sender: <xms:ok-iXcougdB9JxUgTKzUxeqXDpNArWHC3qnztf2eQyvGMMZFtIBbUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrieekgddtjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucfo
 rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
 hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucffohhmrghinhepgigvnhhprhhojhgv
 tghtrdhorhhgnecukfhppeeluddrieehrdefgedrfeefnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
 necuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:o0-iXXxcoT938CVgy__LGLuusfDRrdYq-pKbnplzRSOKWTgBJo6ZMg>
 <xmx:o0-iXUKg7VesLKPPdAf1mQlZWIKRDWVI_udTuGxPXODUYz-WaHtORA>
 <xmx:o0-iXZ7QTBqha-vey1EL6YuR362Z_RoPrcwgXRchPmDV2DRYqq-Vmg>
 <xmx:pE-iXVUEsgXDjgg3O8h5GoZ2qncMc0RIVW5z3IPN58Q4-s0JVT03mA>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4CA978005A;
 Sat, 12 Oct 2019 18:11:45 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Sun, 13 Oct 2019 00:11:37 +0200
Message-Id: <cover.b80738fa53144bc6e5e32c048ccf4e4b95355844.1570918263.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 0/2] Optionally call EFI
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>,
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
aCB0aGUgcGF0Y2g6IHdvcmtzCiAtIHRlc3RlZCB3aXRoIHhlbi5lZmkgYW5kIE1CMgoKQ2hhbmdl
cyBpbiB2MjoKIC0gZml4IGJvb3Qgd2l0aCB4ZW4uZWZpIChlZmlfbWVtbWFwIGF0IHRoaXMgcG9p
bnQgc3RpbGwgbmVlZHMgdG8gYmUgYWNjZXNzZWQKICAgdmlhIHBoeXNpY2FsIGFkZHJlc3MpLiBU
QkgsIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgcHJldmlvdXMgdmVyc2lvbiB3b3JrZWQKICAgd2l0
aCBNQjIgLSBpcyBkaXJlY3RtYXAgbWFwcGVkIGF0IHRoaXMgcG9pbnQ/CgpDYzogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPgpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KQ2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNv
bT4KQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDYzogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxA
YXJtLmNvbT4KQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNv
bT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6IFRp
bSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgpDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ2M6IEphc29u
IEFuZHJ5dWsgPGphbmRyeXVrQGdtYWlsLmNvbT4KCk1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNr
aSAoMik6CiAgZWZpOiByZW1vdmUgb2xkIFNldFZpcnR1YWxBZGRyZXNzTWFwKCkgYXJyYW5nZW1l
bnQKICB4ZW4vZWZpOiBvcHRpb25hbGx5IGNhbGwgU2V0VmlydHVhbEFkZHJlc3NNYXAoKQoKIHhl
bi9jb21tb24vS2NvbmZpZyAgICB8IDEzICsrKysrKysrKysrKy0KIHhlbi9jb21tb24vZWZpL2Jv
b3QuYyB8IDQ4ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAy
IGZpbGVzIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQoKYmFzZS1j
b21taXQ6IDdhNGU2NzExMTE0OTA1YjNjYmJlNDhlODFjMzIyMjM2MWE3ZjM1NzkKLS0gCmdpdC1z
ZXJpZXMgMC45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
