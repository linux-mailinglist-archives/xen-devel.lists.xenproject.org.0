Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1009113B7E9
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 03:43:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irYc0-0005Ee-9A; Wed, 15 Jan 2020 02:40:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8TLv=3E=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1irYby-0005Cc-Fd
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 02:40:50 +0000
X-Inumbo-ID: 63199198-3740-11ea-a2eb-bc764e2007e4
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63199198-3740-11ea-a2eb-bc764e2007e4;
 Wed, 15 Jan 2020 02:40:26 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id C2D1721FF3;
 Tue, 14 Jan 2020 21:40:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 14 Jan 2020 21:40:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=AcVTNedDF3VXzduCNtouIhXEn8qyT1uEIJjXMdFh6
 hA=; b=ZOVFxWnNMkH8kqmZOlfj9+8IimIQ5GJo8osuXYZtOLgSUVYzaL+pLq9zc
 ioLVjOekfc9AwE9zkiv/JzyHXXHfi5Y5zDYs9p0CZIV6W/OZTCSj4PDG6Amabwjv
 otlb9FhNugSNxhBDaJRQWL3mBBQNIsXThbrADsDcowViZlCSIllRtGfEiPf8bW9+
 cqODg70Gly9s6Yl8l5kBYO6QUjo/tkQnKakd0+L69tqOzuESF13pRqxpLj0txY/n
 1N2nlbKvUH/Q4HisixKdg4NdkG4MMIRxKekyZhEIfEZv7+xhmb+sgKFH669qixgG
 G5DLUzyW73H+N+n2ku6M37x66ZNIA==
X-ME-Sender: <xms:mnseXjlUqj4Mu3bkoe9vDhkOE4wbuqS15VrSUS0M572h5znDjEw2Wg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrtddvgdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpeek
X-ME-Proxy: <xmx:mnseXkPq2iSNZizZzSUH3ilstRXDrr3xsm_Qr3bhlQV78S1kqTOWvQ>
 <xmx:mnseXg9odEgwY7wpDqIfWz44mi1apwIuJDcA7QaEsXygp4DAibDZdA>
 <xmx:mnseXmExovK7AgpNCHxnZvsH55yhF1y50wQO8jDB7BpvnljhfFRoUw>
 <xmx:mnseXu_Kx1JrpgxPqmWYqJTji5axfItPgEjPZsCBGBA7hGWc0A5Gpw>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id DBF8630607B0;
 Tue, 14 Jan 2020 21:40:25 -0500 (EST)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 15 Jan 2020 03:39:54 +0100
Message-Id: <80cc023087afee3c37d68f18af258eba5dc75584.1579055705.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 15/16] libxl: ignore emulated IDE disks
 beyond the first 4
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UWVtdSBzdXBwb3J0cyBvbmx5IDQgZW11bGF0ZWQgSURFIGRpc2tzLCB3aGVuIGdpdmVuIG1vcmUg
KG9yIHdpdGggaGlnaGVyCmluZGV4ZXMpLCBpdCB3aWxsIGZhaWwgdG8gc3RhcnQuIFNpbmNlIHRo
ZSBkaXNrcyBjYW4gc3RpbGwgYmUgYWNjZXNzaWJsZQp1c2luZyBQViBpbnRlcmZhY2UsIGp1c3Qg
aWdub3JlIGVtdWxhdGVkIHBhdGggYW5kIGxvZyBhIHdhcm5pbmcsIGluc3RlYWQKb2YgcmVqZWN0
aW5nIHRoZSBjb25maWd1cmF0aW9uIGFsdG9nZXRoZXIuCgpTaWduZWQtb2ZmLWJ5OiBNYXJlayBN
YXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+Ci0t
LQogdG9vbHMvbGlieGwvbGlieGxfZG0uYyB8IDExICsrKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgMTEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMg
Yi90b29scy9saWJ4bC9saWJ4bF9kbS5jCmluZGV4IDQzYWYzMWIuLjg5ZWNhMWUgMTAwNjQ0Ci0t
LSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfZG0uYwpA
QCAtMTg3MSw2ICsxODcxLDEzIEBAIHN0YXRpYyBpbnQgbGlieGxfX2J1aWxkX2RldmljZV9tb2Rl
bF9hcmdzX25ldyhsaWJ4bF9fZ2MgKmdjLAogICAgICAgICAgICAgfQogCiAgICAgICAgICAgICBp
ZiAoZGlza3NbaV0uaXNfY2Ryb20pIHsKKyAgICAgICAgICAgICAgICBpZiAoZGlzayA+IDQpIHsK
KyAgICAgICAgICAgICAgICAgICAgTE9HRChXQVJOLCBndWVzdF9kb21pZCwgIkVtdWxhdGVkIENE
Uk9NIGNhbiBiZSBvbmx5IG9uZSBvZiB0aGUgZmlyc3QgNCBkaXNrcy5cbiIKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAiRGlzayAlcyB3aWxsIGJlIGF2YWlsYWJsZSB2aWEgUFYgZHJpdmVycyBi
dXQgbm90IGFzIGFuICIKKyAgICAgICAgICAgICAgICAgICAgICAgICAiZW11bGF0ZWQgZGlzay4i
LAorICAgICAgICAgICAgICAgICAgICAgICAgIGRpc2tzW2ldLnZkZXYpOworICAgICAgICAgICAg
ICAgICAgICBjb250aW51ZTsKKyAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgICAgICAgZHJp
dmUgPSBsaWJ4bF9fc3ByaW50ZihnYywKICAgICAgICAgICAgICAgICAgICAgICAgICAiaWY9aWRl
LGluZGV4PSVkLHJlYWRvbmx5PW9uLG1lZGlhPWNkcm9tLGlkPWlkZS0laSIsCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgZGlzaywgZGV2X251bWJlcik7CkBAIC0xOTQ4LDYgKzE5NTUsMTAgQEAg
c3RhdGljIGludCBsaWJ4bF9fYnVpbGRfZGV2aWNlX21vZGVsX2FyZ3NfbmV3KGxpYnhsX19nYyAq
Z2MsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgJmRpc2tzW2ldLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbG9fbW9kZSk7CiAgICAgICAgICAgICAgICAgfSBlbHNlIHsKKyAgICAg
ICAgICAgICAgICAgICAgTE9HRChXQVJOLCBndWVzdF9kb21pZCwgIk9ubHkgNCBlbXVsYXRlZCBJ
REUgZGlza3MgYXJlIHN1cHBvcnRlZC5cbiIKKyAgICAgICAgICAgICAgICAgICAgICAgICAiRGlz
ayAlcyB3aWxsIGJlIGF2YWlsYWJsZSB2aWEgUFYgZHJpdmVycyBidXQgbm90IGFzIGFuICIKKyAg
ICAgICAgICAgICAgICAgICAgICAgICAiZW11bGF0ZWQgZGlzay4iLAorICAgICAgICAgICAgICAg
ICAgICAgICAgIGRpc2tzW2ldLnZkZXYpOwogICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsg
LyogRG8gbm90IGVtdWxhdGUgdGhpcyBkaXNrICovCiAgICAgICAgICAgICAgICAgfQogCi0tIApn
aXQtc2VyaWVzIDAuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
