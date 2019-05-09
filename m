Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C19219317
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 21:52:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOp2R-00066O-Ci; Thu, 09 May 2019 19:49:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q/9x=TJ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hOp2P-00066J-95
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 19:49:05 +0000
X-Inumbo-ID: 7fd73835-7293-11e9-8980-bc764e045a96
Received: from new1-smtp.messagingengine.com (unknown [66.111.4.221])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7fd73835-7293-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 19:49:04 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id E69BD261F7;
 Thu,  9 May 2019 15:49:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 09 May 2019 15:49:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=CNOvSC
 PGItUBx32HcIurjNNsmbleuWtxsmwZqLdUVjA=; b=AQiAkmAxFKVtKhwsTbxw9D
 +rO8p9WnBhmNXZK3GcO24tBsp8Eb2l5k50O4VXiOA6A2oE7PM34M2iNw0vLGJRez
 gSZqJm2QXBs8LES0VFKFIeQ7xTKsottuGItvX1mTjoeg9U7PYfi5nB/bGSvbCKLD
 OjxV76veX3g/uMkFpYL5VPiaOvGI0ejmB+asg+TEghydZBVKFdu84fIWb66wQOEK
 RWZ4MTuaNAcAHm+qNyOEgZcTeUxjNgbFU1o6P1zIUBoLIAaHgg6lQxhOfzc1RGuy
 iIoJepu0XgfoUbm2cucceftD5jIts6oA0whLy/TQYN/ZgGHdKliqlHUKQg0TpuLg
 ==
X-ME-Sender: <xms:LYTUXPJ4HbbJfNdys8F_JD36pl8kPt9V6_j6Vdo39TzHtkCeGX2N6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrkeeigdekudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucfo
 rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
 hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdeffeen
 ucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvth
 hhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:LoTUXO-KFA0zYUmpRe96mh0bNrbdhyIDelNskm-1y4Q4a9wGph1dww>
 <xmx:LoTUXOIFTXjECxdzrGdeCWS4LX0QK0WRAfjKCIQKguKIi7XQw_lrWQ>
 <xmx:LoTUXFGSl2h9zLclF7eychxBaysefFslyo0wqEya5_75dUvAt6T_Mw>
 <xmx:L4TUXHN5vKyLljiAL5qPjKzPQv_uDXCKMuBbUSlk55LdMfPye2-Qdw>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3A84B103D1;
 Thu,  9 May 2019 15:49:00 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  9 May 2019 21:48:51 +0200
Message-Id: <cover.1ff4fbcf3cedbe34db420b46be69328b299f325e.1557431250.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/5] Fixes for large framebuffer,
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
cGVuZGVudGx5LgoKLS0tCmNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgpjYzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgpjYzog
SWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CmNjOiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+CmNjOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29t
PgpjYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpjYzog
U3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpjYzogVGltIERlZWdh
biA8dGltQHhlbi5vcmc+CmNjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgpjYzogT2xh
ZiBIZXJpbmcgPG9sYWZAYWVwZmxlLmRlPgoKTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICg1
KToKICB4ZW4vYml0bWFwOiBmaXggYml0bWFwX2ZpbGwgd2l0aCB6ZXJvLXNpemVkIGJpdG1hcAog
IGRyaXZlcnMvdmlkZW86IGRyb3AgdW51c2VkIGxpbWl0cwogIGRyaXZlcnMvdmlkZW86IERyb3Ag
ZnJhbWVidWZmZXIgc2l6ZSBjb25zdHJhaW50cwogIHhlbjogZml4IGhhbmRsaW5nIGZyYW1lYnVm
ZmVyIGxvY2F0ZWQgYWJvdmUgNEdCCiAgZHJpdmVycy92aWRlbzogdXNlIHZsZmJfaW5mbyBjb25z
aXN0ZW50bHkKCiB4ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290LmggfCAgMSArCiB4ZW4vZHJpdmVy
cy92aWRlby9sZmIuYyAgICAgfCAxMyAtLS0tLS0tLS0tLS0tCiB4ZW4vZHJpdmVycy92aWRlby92
ZXNhLmMgICAgfCAxNSArKysrKysrKysrLS0tLS0KIHhlbi9pbmNsdWRlL3B1YmxpYy94ZW4uaCAg
ICB8ICA0ICsrKysKIHhlbi9pbmNsdWRlL3hlbi9iaXRtYXAuaCAgICB8ICAyICsrCiA1IGZpbGVz
IGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQoKYmFzZS1jb21taXQ6
IGRjNDk3NjM1ZDkzZjY2NzJmODI3MjdhZDk3YTU1MjA1MTc3YmUyYWEKLS0gCmdpdC1zZXJpZXMg
MC45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
