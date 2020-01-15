Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 705F413B7DE
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 03:42:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irYbz-0005Do-OS; Wed, 15 Jan 2020 02:40:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8TLv=3E=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1irYby-0005CF-7l
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 02:40:50 +0000
X-Inumbo-ID: 62220b1e-3740-11ea-84bb-12813bfff9fa
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 62220b1e-3740-11ea-84bb-12813bfff9fa;
 Wed, 15 Jan 2020 02:40:25 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id D9DDA221FC;
 Tue, 14 Jan 2020 21:40:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 14 Jan 2020 21:40:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=Y8eQEIlpMW2Zye2mjuuWV+w6h3gg33FDMFcw8zObz
 A4=; b=OnCn7makqUvxBd4+TpkBZe3/IrYMdjhA/J/nbWVV+/G9/wm2fBFI1Az1K
 W+wVDVNo8kZCdnZd0kPizmWfL5KYs+SvaQyUCxS8Wm2/MRrAnhMGtWKOx4Fvss4F
 MYFSK4lXe+eJc90xuDcrMU3b9g/QoHEPgW6LMKidFpBN11d5J+5JolnrRSChB8ab
 qf734AIAxJJbKguP+pbR9Fg7mPU/TaxhWqWv+votb/Qal9S5ideS59AcPHZlfA9N
 IiMmkpvQzC+BeB9Iog2TR2zpa5D8HcF7uWKjzwZCgs4ApJU76FL9+mu2y7BT6CLZ
 ndKnCbhGyjyG29KXRwoEM8lY8wfBQ==
X-ME-Sender: <xms:mXseXo1IleeR1641r5__IpFSKtpf73nqkq6l_xlqIZANuPi19wP4Gg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrtddvgdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpeek
X-ME-Proxy: <xmx:mXseXp8NHEyliqs7N6Jsqnbx_nslguFN8H1Xw3EYrBx4D1EdmKJhsg>
 <xmx:mXseXt0nVBdKeOXeG79CGx0GUcKavhz39wqeHQsQw6rLt1SNfV6buQ>
 <xmx:mXseXu-QNF5VNzp7qt73hN3Myykwpf-ch61BXjgzUHlpXhOMsA36VQ>
 <xmx:mXseXmODgwZk1yRfIfQySw2yGyE6FX84iR23k4Xv8sIl1nSLHmSR0A>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id F3E633060783;
 Tue, 14 Jan 2020 21:40:24 -0500 (EST)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 15 Jan 2020 03:39:53 +0100
Message-Id: <6e78421d673d3efc6b0f31b333c40b308632876e.1579055705.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 14/16] libxl: require qemu in dom0 even if
 stubdomain is in use
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

VW50aWwgeGVuY29uc29sZWQgbGVhcm5zIGhvdyB0byBoYW5kbGUgbXVsdGlwbGUgY29uc29sZXMs
IHRoaXMgaXMgbmVlZGVkCmZvciBzYXZlL3Jlc3RvcmUgc3VwcG9ydCAocWVtdSBzdGF0ZSBpcyB0
cmFuc2ZlcnJlZCBvdmVyIHNlY29uZGFyeQpjb25zb2xlcykuCkFkZGl0aW9uYWxseSwgTGludXgt
YmFzZWQgc3R1YmRvbWFpbiB3YWl0cyBmb3IgYWxsIHRoZSBiYWNrZW5kcyB0bwppbml0aWFsaXpl
IGR1cmluZyBib290LiBMYWNrIG9mIHNvbWUgY29uc29sZSBiYWNrZW5kcyByZXN1bHRzIGluCnN0
dWJkb21haW4gc3RhcnR1cCB0aW1lb3V0LgoKVGhpcyBpcyBhIHRlbXBvcmFyeSBwYXRjaCB1bnRp
bCB4ZW5jb25zb2xlZCB3aWxsIGJlIGltcHJvdmVkLgoKU2lnbmVkLW9mZi1ieTogTWFyZWsgTWFy
Y3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPgotLS0K
IHRvb2xzL2xpYnhsL2xpYnhsX2RtLmMgfCAxMiArKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAxMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xp
YnhsL2xpYnhsX2RtLmMgYi90b29scy9saWJ4bC9saWJ4bF9kbS5jCmluZGV4IDIzYWM3ZTQuLjQz
YWYzMWIgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKKysrIGIvdG9vbHMvbGli
eGwvbGlieGxfZG0uYwpAQCAtMjQ2NCw3ICsyNDY0LDExIEBAIHN0YXRpYyB2b2lkIHNwYXduX3N0
dWJfbGF1bmNoX2RtKGxpYnhsX19lZ2MgKmVnYywKICAgICAgICAgfQogICAgIH0KIAotICAgIG5l
ZWRfcWVtdSA9IGxpYnhsX19uZWVkX3hlbnB2X3FlbXUoZ2MsIGRtX2NvbmZpZyk7CisgICAgLyoK
KyAgICAgKiBVbnRpbCB4ZW5jb25zb2xlZCBsZWFybnMgaG93IHRvIGhhbmRsZSBtdWx0aXBsZSBj
b25zb2xlcywgcmVxdWlyZSBxZW11CisgICAgICogaW4gZG9tMCB0byBzZXJ2ZSBjb25zb2xlcyBm
b3IgYSBzdHViZG9tYWluIC0gaXQgcmVxdWlyZSBhdCBsZWFzdCAzIG9mIHRoZW0uCisgICAgICov
CisgICAgbmVlZF9xZW11ID0gMSB8fCBsaWJ4bF9fbmVlZF94ZW5wdl9xZW11KGdjLCAmc2Rzcy0+
ZG1fY29uZmlnKTsKIAogICAgIGZvciAoaSA9IDA7IGkgPCBudW1fY29uc29sZTsgaSsrKSB7CiAg
ICAgICAgIGxpYnhsX19kZXZpY2UgZGV2aWNlOwpAQCAtMjU5Niw3ICsyNjAwLDExIEBAIHN0YXRp
YyB2b2lkIHFtcF9wcm94eV9zcGF3bl9vdXRjb21lKGxpYnhsX19lZ2MgKmVnYywKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCByYykKIHsKICAgICBTVEFURV9BT19HQyhz
ZHNzLT5xbXBfcHJveHlfc3Bhd24uYW8pOwotICAgIGludCBuZWVkX3B2cWVtdSA9IGxpYnhsX19u
ZWVkX3hlbnB2X3FlbXUoZ2MsICZzZHNzLT5kbV9jb25maWcpOworICAgIC8qCisgICAgICogVW50
aWwgeGVuY29uc29sZWQgbGVhcm5zIGhvdyB0byBoYW5kbGUgbXVsdGlwbGUgY29uc29sZXMsIHJl
cXVpcmUgcWVtdQorICAgICAqIGluIGRvbTAgdG8gc2VydmUgY29uc29sZXMgZm9yIGEgc3R1YmRv
bWFpbiAtIGl0IHJlcXVpcmUgYXQgbGVhc3QgMyBvZiB0aGVtLgorICAgICAqLworICAgIGludCBu
ZWVkX3B2cWVtdSA9IDEgfHwgbGlieGxfX25lZWRfeGVucHZfcWVtdShnYywgJnNkc3MtPmRtX2Nv
bmZpZyk7CiAKICAgICBpZiAocmMpIGdvdG8gb3V0OwogCi0tIApnaXQtc2VyaWVzIDAuOS4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
