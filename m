Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F99614EE3
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 17:06:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNf9d-0004P7-EL; Mon, 06 May 2019 15:03:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SrHI=TG=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hNf9c-0004OY-Fc
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 15:03:44 +0000
X-Inumbo-ID: 1e4c2b40-7010-11e9-a3f2-8ba326a66064
Received: from new1-smtp.messagingengine.com (unknown [66.111.4.221])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e4c2b40-7010-11e9-a3f2-8ba326a66064;
 Mon, 06 May 2019 15:03:38 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id CE176137F9;
 Mon,  6 May 2019 11:03:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 06 May 2019 11:03:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=sepRne
 Jt2WFjyykYEGq6qWo/yunJWLzp4sDqVnNlNYI=; b=cSKbDtpEFR75wDpHUvMiiZ
 Qrjb+L5A0S5BPhZ2dZf4rXUWjQe3EU4WPQ9GaC/heElU2ONOkQ2rc2OBJiJmPyBs
 W0cHK2lX8KFHyOGpJqtKFjwb2YHJXpdLSPUP9mvXW3lU8YhVUJvwvbZ42pD0V+Wd
 UuypM7izK7Ayfgthje155Vws32U3UGRcqKrUfUoR33Iys9jShBz7WvvvfG0vf+5x
 ttCguY0dzY91XtZDD8xhMEK9NguNG7b99QzSv0kALFGm6YsKtwdl5HtoIG1GJW0b
 HQLYFw6Tpkx0tTAmClS0fJ3fl8mj9dxRkth2DjOAZgwp8am976+vcCxqSrwEhUpA
 ==
X-ME-Sender: <xms:w0zQXDvAhzl5LAMqHHs4R7vCk4pD2DlgLorPF53EtVceEEU0Rb-1UA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrjeejgdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucfo
 rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
 hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdeffeen
 ucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvth
 hhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:w0zQXFOqWzwt1VoI0HcI8JJOmc9Sqi7I51mdnljvY7QUYO0qNNdK1w>
 <xmx:w0zQXC42wpuAsiiMEjIzMqP04V52Dpqdw2QPo0YwhicFH-KYFKFuXg>
 <xmx:w0zQXDTczrIIB8Q7ZTjKpGK_BeNJoy80jbFbOOuwmUpn0xLIYfVC9Q>
 <xmx:xUzQXLIxpgRGzyFYoPDE9Mur7QTvNJWXdW-aly0ael_eXBhmjDgrrw>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0E2EB10369;
 Mon,  6 May 2019 11:03:29 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  6 May 2019 16:50:16 +0200
Message-Id: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/5] Fixes for large framebuffer,
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
ZXNhLmMgICAgfCAxNyArKysrKysrKysrKystLS0tLQogeGVuL2luY2x1ZGUvcHVibGljL3hlbi5o
ICAgIHwgIDIgKysKIHhlbi9pbmNsdWRlL3hlbi9iaXRtYXAuaCAgICB8ICAyICsrCiA1IGZpbGVz
IGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQoKYmFzZS1jb21taXQ6
IGRjNDk3NjM1ZDkzZjY2NzJmODI3MjdhZDk3YTU1MjA1MTc3YmUyYWEKLS0gCmdpdC1zZXJpZXMg
MC45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
