Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F091D04EB
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 02:51:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iI09T-0008IF-LS; Wed, 09 Oct 2019 00:48:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RT5Q=YC=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iI09S-0008IA-58
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 00:48:26 +0000
X-Inumbo-ID: 80715226-ea2e-11e9-8c93-bc764e2007e4
Received: from new4-smtp.messagingengine.com (unknown [66.111.4.230])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80715226-ea2e-11e9-8c93-bc764e2007e4;
 Wed, 09 Oct 2019 00:48:25 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 64CED6CF2;
 Tue,  8 Oct 2019 20:48:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 08 Oct 2019 20:48:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=iv2idP
 rDa4HdyohiZ0iQPSHIxC0V5EabXgyeHriXvw8=; b=WZ0IYceqM/0dbgoR7mxMbz
 TyS/GE8tCx5BKvnPeRXMcYFX7iQ7sTiK1/7DouAtBhkXlIQWAwQ+//FIjVP17Gyz
 w6/rcJEH8Nf7oyAE0c7vhtmXk8+e8vdco4vCYZY//ff/Yt/6Eq+J/J5OC/4MXGXo
 8T1xvMBlVT7L3ik2YJvNBVb3sSpEmktR7nC5tRj2yoC77FvtqSa7xv3B/vAGIDJI
 eXYGw7Y/UIt1cl60+KN71dKE653gF2PHFfgJbhmOmsq3cIcG7b4rIJrNjLOyQFAT
 vfEW7fT50DAFPFZBq+26UQekQhj0+XE+2S6lO0S3TLDUblTjqfs9NfTsPcAfIdPw
 ==
X-ME-Sender: <xms:WC6dXetso995TZwbLtwkn-BwyO4WZ8Fs7zif6VV-iGjKyKUJUPtAgw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedriedtgdefjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucfo
 rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
 hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucffohhmrghinhepgigvnhhprhhojhgv
 tghtrdhorhhgnecukfhppeeluddrieehrdefgedrfeefnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
 necuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:WC6dXQLOvky4TmADWfHmvZGdbpRuyuYnpfVe64gNHifBAXkRuH0MWg>
 <xmx:WC6dXdplGTokugEvvL7DdDolB3_inYkI3gvbqfhCHcPjlWNtr-WB4A>
 <xmx:WC6dXTUtEB2Bahe5LL_o9t3rD3e7bPAaNdqbDAcnmnfIudIUsIK6OQ>
 <xmx:WS6dXQ1bikzvz8nHhwjkCOFcpiacqWBs13M8GRZFyXM2x-H2_VQasg>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 48D468005A;
 Tue,  8 Oct 2019 20:48:23 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  9 Oct 2019 02:48:17 +0200
Message-Id: <cover.a213e52849846a404eb0aac59f38015d7bef4f0f.1570582061.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v1 0/2] Optionally call EFI
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
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
MS5odG1sCgpDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpDYzogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IEdlb3JnZSBEdW5sYXAgPEdlb3Jn
ZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5j
aXRyaXguY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogSnVsaWVu
IEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8
a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxp
bmlAa2VybmVsLm9yZz4KQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgpDYzogV2VpIExpdSA8
d2xAeGVuLm9yZz4KCk1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSAoMik6CiAgZWZpOiByZW1v
dmUgb2xkIFNldFZpcnR1YWxBZGRyZXNzTWFwKCkgYXJyYW5nZW1lbnQKICB4ZW4vZWZpOiBvcHRp
b25hbGx5IGNhbGwgU2V0VmlydHVhbEFkZHJlc3NNYXAoKQoKIHhlbi9jb21tb24vS2NvbmZpZyAg
ICB8IDEzICsrKysrKysrKysrKy0KIHhlbi9jb21tb24vZWZpL2Jvb3QuYyB8IDQ4ICsrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDM5
IGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQoKYmFzZS1jb21taXQ6IDdhNGU2NzExMTE0
OTA1YjNjYmJlNDhlODFjMzIyMjM2MWE3ZjM1NzkKLS0gCmdpdC1zZXJpZXMgMC45LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
