Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C2D13B7E6
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 03:43:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irYbb-0004sJ-BY; Wed, 15 Jan 2020 02:40:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8TLv=3E=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1irYbZ-0004rT-F1
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 02:40:25 +0000
X-Inumbo-ID: 5abbccaa-3740-11ea-b89f-bc764e2007e4
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5abbccaa-3740-11ea-b89f-bc764e2007e4;
 Wed, 15 Jan 2020 02:40:12 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id B80F3221D8;
 Tue, 14 Jan 2020 21:40:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 14 Jan 2020 21:40:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=4AkMKCE/qXH5e58ZM24BOy6reR36X75ZiqMz4JRPO
 O0=; b=eaRiYlLRPOnTDMT9v3J97l2vXPjUlHAVO9r3naVRZ56TAjvy8MUkuGoiT
 aMJmlUxQzfiu7zHYbGWlw3idzFclR4PKydyGlqX25qRCuIc47Q6TyDn76pa91QKD
 8ngoERNT+ZfZr703iBAzx1BtHzNv4iuvLcsSt2GXiDz7Fr5eDZog6jzINEBfVGpt
 wSU+6KhjUG5a4+Gf28ZhMa/COpObgOdwfAkuoXDH/7b+iVLw8IwD92lptER9V9ie
 YTXs45W6VVHVi0PPEan65M8jY3fbdgYCN7kYeXdDBydaM2UR90sCeeotL9VEaJQE
 h0Zjoog3xG7TAGhlwMFpZ1StW7gNw==
X-ME-Sender: <xms:jHseXkGvsZfU9oNUimuUUYXsGlRkg065GjlMCGHvMRpy6iUt7DzSQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrtddvgdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucffohhmrghinhepgigvnhdrohhr
 ghenucfkphepledurdeihedrfeegrdeffeenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhenucevlhhu
 shhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:jHseXmp09QtNddYn8HlNYzVL56T7WplD--KSEHi2oXCkWBp8b-BCPg>
 <xmx:jHseXlacR0LtHIkuZ2s6QQgOWxFfD-CyhROVFrclfkZXXI6UzXW-_g>
 <xmx:jHseXnXzatFC4z8zi4XkkA8mzrQ5jH29f4GCjj4iMTWT5syMiMis2g>
 <xmx:jHseXtbFNGFQ6eRgmUtotJJlU8ki5_xGZRR6xJyi5yBgdZ96naNCdw>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4A6FA30607B0;
 Tue, 14 Jan 2020 21:40:11 -0500 (EST)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 15 Jan 2020 03:39:40 +0100
Message-Id: <901ff35e0410fe9b871169383984f1e48850a836.1579055705.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 01/16] Document ioemu MiniOS stubdomain
 protocol
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIGRvY3VtZW50YXRpb24gYmFzZWQgb24gcmV2ZXJzZS1lbmdpbmVlcmVkIHRvb2xzdGFjay1p
b2VtdSBzdHViZG9tYWluCnByb3RvY29sLgoKU2lnbmVkLW9mZi1ieTogTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPgotLS0KIGRvY3Mv
bWlzYy9zdHViZG9tLnR4dCB8IDUzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDUzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kb2NzL21pc2Mvc3R1YmRvbS50eHQgYi9kb2NzL21pc2Mvc3R1YmRvbS50eHQKaW5kZXggZGU3
YjZjNy4uNGM1MjRmMiAxMDA2NDQKLS0tIGEvZG9jcy9taXNjL3N0dWJkb20udHh0CisrKyBiL2Rv
Y3MvbWlzYy9zdHViZG9tLnR4dApAQCAtMjMsNiArMjMsNTkgQEAgYW5kIGh0dHA6Ly93aWtpLnhl
bi5vcmcvd2lraS9EZXZpY2VfTW9kZWxfU3R1Yl9Eb21haW5zIGZvciBtb3JlCiBpbmZvcm1hdGlv
biBvbiBkZXZpY2UgbW9kZWwgc3R1YiBkb21haW5zCiAKIAorVG9vbHN0YWNrIHRvIE1pbmlPUyBp
b2VtdSBzdHViZG9tYWluIHByb3RvY29sCistLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KKworVGhpcyBzZWN0aW9uIGRlc2NyaWJlIGNvbW11bmljYXRpb24gcHJv
dG9jb2wgYmV0d2VlbiB0b29sc3RhY2sgYW5kCitxZW11LXRyYWRpdGlvbmFsIHJ1bm5pbmcgaW4g
TWluaU9TIHN0dWJkb21haW4uIFRoZSBwcm90b2NvbCBpbmNsdWRlCitleHBlY3RhdGlvbnMgb2Yg
Ym90aCBxZW11IGFuZCBzdHViZG9tYWluIGl0c2VsZi4KKworU2V0dXAgKGRvbmUgYnkgdG9vbHN0
YWNrLCBleHBlY3RlZCBieSBzdHViZG9tYWluKToKKyAtIEJsb2NrIGRldmljZXMgZm9yIHRhcmdl
dCBkb21haW4gYXJlIGNvbm5lY3RlZCBhcyBQViBkaXNrcyB0byBzdHViZG9tYWluLAorICAgYWNj
b3JkaW5nIHRvIGNvbmZpZ3VyYXRpb24gb3JkZXIsIHN0YXJ0aW5nIHdpdGggeHZkYQorIC0gTmV0
d29yayBkZXZpY2VzIGZvciB0YXJnZXQgZG9tYWluIGFyZSBjb25uZWN0ZWQgYXMgUFYgbmljcyB0
byBzdHViZG9tYWluLAorICAgYWNjb3JkaW5nIHRvIGNvbmZpZ3VyYXRpb24gb3JkZXIsIHN0YXJ0
aW5nIHdpdGggMAorIC0gaWYgZ3JhcGhpY3Mgb3V0cHV0IGlzIGV4cGVjdGVkLCBWRkIgYW5kIFZL
QiBkZXZpY2VzIGFyZSBzZXQgZm9yIHN0dWJkb21haW4KKyAgIChpdHMgYmFja2VuZCBpcyByZXNw
b25zaWJsZSBmb3IgZXhwb3NpbmcgdGhlbSB1c2luZyBhcHByb3ByaWF0ZSBwcm90b2NvbAorICAg
bGlrZSBWTkMgb3IgU3BpY2UpCisgLSBvdGhlciB0YXJnZXQgZG9tYWluJ3MgZGV2aWNlcyBhcmUg
bm90IGNvbm5lY3RlZCBhdCB0aGlzIHBvaW50IHRvIHN0dWJkb21haW4KKyAgIChtYXkgYmUgaG90
LXBsdWdnZWQgbGF0ZXIpCisgLSBRRU1VIGNvbW1hbmQgbGluZSAoc3BhY2Ugc2VwYXJhdGVkIGFy
Z3VtZW50cykgaXMgc3RvcmVkIGluCisgICAvdm0vPHRhcmdldC11dWlkPi9pbWFnZS9kbWFyZ3Mg
eGVuc3RvcmUgcGF0aAorIC0gdGFyZ2V0IGRvbWFpbiBpZCBpcyBzdG9yZWQgaW4gL2xvY2FsL2Rv
bWFpbi88c3R1YmRvbS1pZD4vdGFyZ2V0IHhlbnN0b3JlIHBhdGgKKz8/IC0gYmlvcyB0eXBlIGlz
IHN0b3JlZCBpbiAvbG9jYWwvZG9tYWluLzx0YXJnZXQtaWQ+L2h2bWxvYWRlci9iaW9zCisgLSBz
dHViZG9tYWluJ3MgY29uc29sZSAwIGlzIGNvbm5lY3RlZCB0byBxZW11IGxvZyBmaWxlCisgLSBz
dHViZG9tYWluJ3MgY29uc29sZSAxIGlzIGNvbm5lY3RlZCB0byBxZW11IHNhdmUgZmlsZSAoZm9y
IHNhdmluZyBzdGF0ZSkKKyAtIHN0dWJkb21haW4ncyBjb25zb2xlIDIgaXMgY29ubmVjdGVkIHRv
IHFlbXUgc2F2ZSBmaWxlIChmb3IgcmVzdG9yaW5nIHN0YXRlKQorIC0gbmV4dCBjb25zb2xlcyBh
cmUgY29ubmVjdGVkIGFjY29yZGluZyB0byB0YXJnZXQgZ3Vlc3QncyBzZXJpYWwgY29uc29sZSBj
b25maWd1cmF0aW9uCisKK1N0YXJ0dXA6CisxLiBQViBzdHViZG9tYWluIGlzIHN0YXJ0ZWQgd2l0
aCBpb2VtdS1zdHViZG9tLmd6IGtlcm5lbCBhbmQgbm8gaW5pdHJkCisyLiBzdHViZG9tYWluIGlu
aXRpYWxpemUgcmVsZXZhbnQgZGV2aWNlcworMi4gc3R1YmRvbWEgc2lnbmFsIHJlYWRpbmVzcyBi
eSB3cml0aW5nICJydW5uaW5nIiB0byAvbG9jYWwvZG9tYWluLzxzdHViZG9tLWlkPi9kZXZpY2Ut
bW9kZWwvPHRhcmdldC1pZD4vc3RhdGUgeGVuc3RvcmUgcGF0aAorMy4gbm93IHN0dWJkb21haW4g
aXMgY29uc2lkZXJlZCBydW5uaW5nCisKK1J1bnRpbWUgY29udHJvbCAoaG90cGx1ZyBldGMpOgor
VG9vbHN0YWNrIGNhbiBpc3N1ZSBjb21tYW5kIHRocm91Z2ggeGVuc3RvcmUuIFRoZSBzZXF1ZW5j
ZSBpcyAoZnJvbSB0b29sc3RhY2sgUE9WKToKKzEuIFdyaXRlIHBhcmFtZXRlciB0byAvbG9jYWwv
ZG9tYWluLzxzdHViZG9tLWlkPi9kZXZpY2UtbW9kZWwvPHRhcmdldC1pZD4vcGFyYW1ldGVyLgor
Mi4gV3JpdGUgY29tbWFuZCB0byAvbG9jYWwvZG9tYWluLzxzdHViZG9tLWlkPi9kZXZpY2UtbW9k
ZWwvPHRhcmdldC1pZD4vY29tbWFuZC4KKzMuIFdhaXQgZm9yIGNvbW1hbmQgcmVzdWx0IGluIC9s
b2NhbC9kb21haW4vPHN0dWJkb20taWQ+L2RldmljZS1tb2RlbC88dGFyZ2V0LWlkPi9zdGF0ZSAo
Y29tbWFuZCBzcGVjaWZpYyB2YWx1ZSkuCis0LiBXcml0ZSAicnVubmluZyIgYmFjayB0byAvbG9j
YWwvZG9tYWluLzxzdHViZG9tLWlkPi9kZXZpY2UtbW9kZWwvPHRhcmdldC1pZD4vc3RhdGUuCisK
K0RlZmluZWQgY29tbWFuZHM6CisgLSAicGNpLWlucyIgLSBQQ0kgaG90IHBsdWcsIHJlc3VsdHM6
CisgICAtICJwY2ktaW5zZXJ0ZWQiIC0gc3VjY2VzcworICAgLSAicGNpLWluc2VydC1mYWlsZWQi
IC0gZmFpbHVyZQorIC0gInBjaS1yZW0iIC0gUENJIGhvdCByZW1vdmUsIHJlc3VsdHM6CisgICAt
ICJwY2ktcmVtb3ZlZCIgLSBzdWNjZXNzCisgICAtID8/CisgLSAic2F2ZSIgLSBzYXZlIGRvbWFp
biBzdGF0ZSB0byBjb25zb2xlIDEsIHJlc3VsdHM6CisgICAtICJwYXVzZWQiIC0gc3VjY2Vzcwor
IC0gImNvbnRpbnVlIiAtIHJlc3VtZSBkb21haW4gZXhlY3V0aW9uLCBhZnRlciBsb2FkaW5nIHN0
YXRlIGZyb20gY29uc29sZSAyIChyZXF1aXJlIC1sb2Fkdm0gY29tbWFuZCBhcmd1bWVudCksIHJl
c3VsdHM6CisgICAtICJydW5uaW5nIiAtIHN1Y2Nlc3MKKworCisKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgUFYtR1JVQgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICA9PT09PT09CiAKLS0gCmdpdC1zZXJpZXMgMC45LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
