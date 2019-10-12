Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A72E3D5076
	for <lists+xen-devel@lfdr.de>; Sat, 12 Oct 2019 16:40:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iJIVT-0000Xa-6n; Sat, 12 Oct 2019 14:36:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QqvL=YF=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iJIVR-0000XV-Fw
 for xen-devel@lists.xenproject.org; Sat, 12 Oct 2019 14:36:29 +0000
X-Inumbo-ID: ad1dfc1c-ecfd-11e9-beca-bc764e2007e4
Received: from new1-smtp.messagingengine.com (unknown [66.111.4.221])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad1dfc1c-ecfd-11e9-beca-bc764e2007e4;
 Sat, 12 Oct 2019 14:36:28 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 68E423FB6;
 Sat, 12 Oct 2019 10:36:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Sat, 12 Oct 2019 10:36:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ppxNNE
 GgwsM7Pwhg0lijPhQNrvYvzN6ANI55hWP5aeE=; b=LNrU3iTVCnTgjOZxmSZZH0
 mgbmlpCLFRjjZ6aoRbv0n+cN9m+BHOzdBqu4KnLhOA7FBxkXoF0yLdqIMt2vpEla
 kRryvWqr+a8p60WO2uYGti8jfmCyRMApy+71rXMoTmMDGwGCJcVHzt98WZNc85I6
 rbSIfq7Of7pPBVyHhJF48bUkJydl5XkzMqZawNvmP0XYKAisI/x2sOe0aFOfMpHU
 L9r0WWFPLuK7Cnte0/6T7oWklfThDY808oTH+uEoJj79ae+hjLvfxolHpDnoEa24
 jtYeOmjOsPuuCezUzOm/qrCt4dBUPqwlm4AxeKUWQiUiDDJhbBFv7OrHWrsrTuLQ
 ==
X-ME-Sender: <xms:6-ShXbfVF1c3UrfP4QPhR4zha24tT0WZCfYv9t0QWkiOonER08MOeg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrieejgdejlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucfo
 rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
 hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucffohhmrghinhepgigvnhhprhhojhgv
 tghtrdhorhhgnecukfhppeeluddrieehrdefgedrfeefnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
 necuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:6-ShXY3EtqlwN3wiTqAmN9T0WvTf6wl1E2zqHn1h49vcm8WUXWxu6g>
 <xmx:6-ShXSJZzX0Jxf_uzdbYXjUbSnAjh0X5cIUb3GFbxgvudKOlAxM7DA>
 <xmx:6-ShXXE9aEkBkbWHI7kI195Z-BOHYciQPPoXo78AxN5DolyzOZZzPg>
 <xmx:7OShXUNbfUuOvpF929Lrw48LgW09VZFOzL6s-1qb7ZeNT6W_twIP0g>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 98EF6D6005F;
 Sat, 12 Oct 2019 10:36:25 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Sat, 12 Oct 2019 16:36:07 +0200
Message-Id: <cover.39cf5c05f6ef01e3793327a459cad5d884dc0a9c.1570890895.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/2] Optionally call EFI
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
MS5odG1sCgpUZXN0IHJlc3VsdHMgb24gZmV3IGxhcHRvcHM6CgpUaGlua3BhZCB4MjMwLCBmaXJt
d2FyZSB2ZXJzaW9uIDIuNzc6CiAtIHdpdGhvdXQgdGhlIHBhdGNoOiBjcmFzaGVzIG9uIFJTIGNh
bGwgKG1hcGJzIGhlbHBzKQogLSB3aXRoIHBhdGNoOiB3b3JrcwogLSBzYW1lIHdpdGggeGVuLmVm
aSBhbmQgTUIyCgpMaWJyZW0gMTQgdjEsIGZpcm13YXJlIHZlcnNpb24gKEFNSSkgQVJVRDAyNiAo
MDYvMTgvMjAxNSk6CiAtIHdpdGhvdXQgdGhlIHBhdGNoOiB3b3JrcwogLSB3aXRoIHRoZSBwYXRj
aDogd29ya3MKIC0gc2FtZSB3aXRoIHhlbi5lZmkgYW5kIE1CMgoKRGVsbCBMYXRpdHVkZSBFNjQy
MCwgZmlybXdhcmUgdmVyc2lvbiBBMjE6CiB0aGlzIG1hY2hpbmUgcmVxdWlyZXMgZWZpPWF0dHI9
dWMgd29ya2Fyb3VuZAogLSB3aXRob3V0IHRoZSBwYXRjaDogZG9tMCBoYW5ncyBiZWZvcmUgc2Vu
ZGluZyBhbnkgbWVzc2FnZSB0byB0aGUgY29uc29sZSAoZXZlbiB3aXRoIGVhcmx5cHJpbnRrPXhl
biBldGMpCiAtIHdpdGggdGhlIHBhdGNoOiBjcmFzaGVzIGJlZm9yZSBkb20wIHByaW50cyBhbnl0
aGluZzogbW0uYzo4OTY6ZDB2MCBub24tcHJpdmlsZWdlZCBhdHRlbXB0IHRvIG1hcCBNTUlPIHNw
YWNlIDJjMmMyYzJjMmMKIC0gc2FtZSB3aXRoIHhlbi5lZmkgYW5kIE1CMgoKVGhpbmtwYWQgVzU0
MDoKIC0gd2l0aG91dCB0aGUgcGF0Y2g6IGNyYXNoZXMgb24gUlMgY2FsbCAob25seSBlZmk9bm8t
cnMgaGVscHMpCiAtIHdpdGggcGF0Y2g6IHdvcmtzCiAtIHRlc3RlZCBvbmx5IHdpdGggTUIyCgpU
aGlua3BhZCBYMSBDYXJib24gZ2VuNSwgZmlybXdhcmUgdmVyc2lvbiAxLjIyICgyMDE3LTA3LTA0
KToKIC0gd2l0aG91dCB0aGUgcGF0Y2g6IHdvcmtzCiAtIHdpdGggcGF0Y2g6IHdvcmtzCiAtIHRl
c3RlZCBvbmx5IHhlbi5lZmkKClRoaW5rcGFkIFA1MiwgZmlybXdhcmUgdmVyc2lvbiAxLjI1ICgy
MDE4LTA0LTE1KToKIC0gd2l0aG91dCB0aGUgcGF0Y2ggKE1CMik6IGhhbmdzIG9uIFJTIGNhbGwg
KG1hcGJzIGhlbHBzKQogLSB3aXRob3V0IHRoZSBwYXRjaCAoeGVuLmVmaSk6IHdvcmtzKD8hKQog
LSB3aXRoIHRoZSBwYXRjaDogd29ya3MKIC0gdGVzdGVkIHdpdGggeGVuLmVmaSBhbmQgTUIyCgpD
aGFuZ2VzIGluIHYyOgogLSBmaXggYm9vdCB3aXRoIHhlbi5lZmkgKGVmaV9tZW1tYXAgYXQgdGhp
cyBwb2ludCBzdGlsbCBuZWVkcyB0byBiZSBhY2Nlc3NlZAogICB2aWEgcGh5c2ljYWwgYWRkcmVz
cykuIFRCSCwgSSBkb24ndCB1bmRlcnN0YW5kIHdoeSBwcmV2aW91cyB2ZXJzaW9uIHdvcmtlZAog
ICB3aXRoIE1CMiAtIGlzIGRpcmVjdG1hcCBtYXBwZWQgYXQgdGhpcyBwb2ludD8KCkNjOiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgpDYzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRy
aXguY29tPgpDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkNjOiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5n
cmFsbEBhcm0uY29tPgpDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFj
bGUuY29tPgpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpD
YzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDYzog
SmFzb24gQW5kcnl1ayA8amFuZHJ5dWtAZ21haWwuY29tPgoKTWFyZWsgTWFyY3p5a293c2tpLUfD
s3JlY2tpICgyKToKICBlZmk6IHJlbW92ZSBvbGQgU2V0VmlydHVhbEFkZHJlc3NNYXAoKSBhcnJh
bmdlbWVudAogIHhlbi9lZmk6IG9wdGlvbmFsbHkgY2FsbCBTZXRWaXJ0dWFsQWRkcmVzc01hcCgp
CgogeGVuL2NvbW1vbi9LY29uZmlnICAgIHwgMTMgKysrKysrKysrKysrLQogeGVuL2NvbW1vbi9l
ZmkvYm9vdC5jIHwgNDggKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0t
LS0KIDIgZmlsZXMgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pCgpi
YXNlLWNvbW1pdDogN2E0ZTY3MTExMTQ5MDViM2NiYmU0OGU4MWMzMjIyMzYxYTdmMzU3OQotLSAK
Z2l0LXNlcmllcyAwLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
