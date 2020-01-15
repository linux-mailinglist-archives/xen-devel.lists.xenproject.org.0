Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AE313B7E1
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 03:42:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irYbf-0004uM-Nh; Wed, 15 Jan 2020 02:40:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8TLv=3E=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1irYbe-0004ty-7I
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 02:40:30 +0000
X-Inumbo-ID: 5e788a72-3740-11ea-84bb-12813bfff9fa
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5e788a72-3740-11ea-84bb-12813bfff9fa;
 Wed, 15 Jan 2020 02:40:19 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 0656321FE6;
 Tue, 14 Jan 2020 21:40:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 14 Jan 2020 21:40:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=o9Zspwb8YcuEiaebf0Bp3ThGx1iC9Pe72x0VcPzTW
 xU=; b=c8BPP3upxaOV7KbRWs3NbYQ8H2bO63COOpHz173oWUJum96CrL66BjpY1
 WOIoT1VoPnk/+T5D0/eeJDWXkUqkmtx+WPL9jqPALnC1N3Y9EZEKsHWTaR8G8zdQ
 Zk8cdHhmMEagzfJOicFBHHj7kneJ5VlD8EBvbvPRqc09+evJV2PXMF2rrxfDxTeN
 usJl3XYhHzsBfxR5ZtqN3WB4z5j4c5xY07x+DiJhtXlXqZUbvIwErHsXTqDN5l0O
 Q/gn+gOuW2DYQ5KUB8++nkESZ5N1cSZGPO+rgKswvtkyv0/4egohM6/vrqq8oUKK
 To2bIogYCvyxueASnnwFLgpNDv+Tw==
X-ME-Sender: <xms:knseXoDMo9z-Jt20zYFLWzEme_aBiBaiiaRTKqcj5wYd5kNpyURRHw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrtddvgdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucffohhmrghinhepphhougdrihhn
 necukfhppeeluddrieehrdefgedrfeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmnecuvehluhhs
 thgvrhfuihiivgeptd
X-ME-Proxy: <xmx:knseXlcxqTDb-FBhW5sfPDfFcHSuG-8T-0ED0k4lghTONWawfMJ09w>
 <xmx:knseXqmimra2_w-R68Jc7DrxeuBT-faC75O_Lak-XNmIodrygOb5ow>
 <xmx:knseXkEclS6e9ZmXIx-4B6oPUgxnrD-tXXi9u77-zA2ZqjlAb6QtwQ>
 <xmx:k3seXkXod1kF5YdmHxK7PygozT7GZTWdUiKb4finlr4uOVvJ-UunCw>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1D05330607D0;
 Tue, 14 Jan 2020 21:40:18 -0500 (EST)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 15 Jan 2020 03:39:46 +0100
Message-Id: <25fe2a1f9840ac0e6ca962b218013da0d1a46982.1579055705.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 07/16] xl: add stubdomain related options to
 xl config parser
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZp
c2libGV0aGluZ3NsYWIuY29tPgpSZXZpZXdlZC1ieTogSmFzb24gQW5kcnl1ayA8amFuZHJ5dWtA
Z21haWwuY29tPgotLS0KIGRvY3MvbWFuL3hsLmNmZy41LnBvZC5pbiB8IDIzICsrKysrKysrKysr
KysrKysrKystLS0tCiB0b29scy94bC94bF9wYXJzZS5jICAgICAgfCAgNyArKysrKysrCiAyIGZp
bGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZG9jcy9tYW4veGwuY2ZnLjUucG9kLmluIGIvZG9jcy9tYW4veGwuY2ZnLjUucG9kLmluCmlu
ZGV4IDI0NWQzZjkuLjZhZTBiZDAgMTAwNjQ0Ci0tLSBhL2RvY3MvbWFuL3hsLmNmZy41LnBvZC5p
bgorKysgYi9kb2NzL21hbi94bC5jZmcuNS5wb2QuaW4KQEAgLTI3MjAsMTAgKzI3MjAsMjUgQEAg
bW9kZWwgd2hpY2ggdGhleSB3ZXJlIGluc3RhbGxlZCB3aXRoLgogCiA9aXRlbSBCPGRldmljZV9t
b2RlbF9vdmVycmlkZT0iUEFUSCI+CiAKLU92ZXJyaWRlIHRoZSBwYXRoIHRvIHRoZSBiaW5hcnkg
dG8gYmUgdXNlZCBhcyB0aGUgZGV2aWNlLW1vZGVsLiBUaGUKLWJpbmFyeSBwcm92aWRlZCBoZXJl
IE1VU1QgYmUgY29uc2lzdGVudCB3aXRoIHRoZQotQjxkZXZpY2VfbW9kZWxfdmVyc2lvbj4gd2hp
Y2ggeW91IGhhdmUgc3BlY2lmaWVkLiBZb3Ugc2hvdWxkIG5vdAotbm9ybWFsbHkgbmVlZCB0byBz
cGVjaWZ5IHRoaXMgb3B0aW9uLgorT3ZlcnJpZGUgdGhlIHBhdGggdG8gdGhlIGJpbmFyeSB0byBi
ZSB1c2VkIGFzIHRoZSBkZXZpY2UtbW9kZWwgcnVubmluZyBpbgordG9vbHN0YWNrIGRvbWFpbi4g
VGhlIGJpbmFyeSBwcm92aWRlZCBoZXJlIE1VU1QgYmUgY29uc2lzdGVudCB3aXRoIHRoZQorQjxk
ZXZpY2VfbW9kZWxfdmVyc2lvbj4gd2hpY2ggeW91IGhhdmUgc3BlY2lmaWVkLiBZb3Ugc2hvdWxk
IG5vdCBub3JtYWxseSBuZWVkCit0byBzcGVjaWZ5IHRoaXMgb3B0aW9uLgorCis9aXRlbSBCPHN0
dWJkb21haW5fa2VybmVsPSJQQVRIIj4KKworT3ZlcnJpZGUgdGhlIHBhdGggdG8gdGhlIGtlcm5l
bCBpbWFnZSB1c2VkIGFzIGRldmljZS1tb2RlbCBzdHViZG9tYWluLgorVGhlIGJpbmFyeSBwcm92
aWRlZCBoZXJlIE1VU1QgYmUgY29uc2lzdGVudCB3aXRoIHRoZQorQjxkZXZpY2VfbW9kZWxfdmVy
c2lvbj4gd2hpY2ggeW91IGhhdmUgc3BlY2lmaWVkLgorSW4gY2FzZSBvZiBCPHFlbXUteGVuLXRy
YWRpdGlvbmFsPiBpdCBpcyBleHBlY3RlZCB0byBiZSBNaW5pT1MtYmFzZWQgc3R1YmRvbWFpbgor
aW1hZ2UsIGluIGNhc2Ugb2YgQjxxZW11LXhlbj4gaXQgaXMgZXhwZWN0ZWQgdG8gYmUgTGludXgt
YmFzZWQgc3R1YmRvbWFpbgora2VybmVsLgorCis9aXRlbSBCPHN0dWJkb21haW5fcmFtZGlzaz0i
UEFUSCI+CisKK092ZXJyaWRlIHRoZSBwYXRoIHRvIHRoZSByYW1kaXNrIGltYWdlIHVzZWQgYXMg
ZGV2aWNlLW1vZGVsIHN0dWJkb21haW4uCitUaGUgYmluYXJ5IHByb3ZpZGVkIGhlcmUgaXMgdG8g
YmUgdXNlZCBieSBhIGtlcm5lbCBwb2ludGVkIGJ5IEI8c3R1YmRvbWFpbl9rZXJuZWw+LgorSXQg
aXMga25vd24gdG8gYmUgdXNlZCBvbmx5IGJ5IExpbnV4LWJhc2VkIHN0dWJkb21haW4ga2VybmVs
LgogCiA9aXRlbSBCPGRldmljZV9tb2RlbF9zdHViZG9tYWluX292ZXJyaWRlPUJPT0xFQU4+CiAK
ZGlmZiAtLWdpdCBhL3Rvb2xzL3hsL3hsX3BhcnNlLmMgYi90b29scy94bC94bF9wYXJzZS5jCmlu
ZGV4IGI4ODExODQuLmZjNWRkNjUgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3hsL3hsX3BhcnNlLmMKKysr
IGIvdG9vbHMveGwveGxfcGFyc2UuYwpAQCAtMjUyNSw2ICsyNTI1LDEzIEBAIHNraXBfdXNiZGV2
OgogICAgIHhsdV9jZmdfcmVwbGFjZV9zdHJpbmcoY29uZmlnLCAiZGV2aWNlX21vZGVsX3VzZXIi
LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgJmJfaW5mby0+ZGV2aWNlX21vZGVsX3VzZXIs
IDApOwogCisgICAgeGx1X2NmZ19yZXBsYWNlX3N0cmluZyAoY29uZmlnLCAic3R1YmRvbWFpbl9r
ZXJuZWwiLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICZiX2luZm8tPnN0dWJkb21haW5f
a2VybmVsLCAwKTsKKyAgICB4bHVfY2ZnX3JlcGxhY2Vfc3RyaW5nIChjb25maWcsICJzdHViZG9t
YWluX3JhbWRpc2siLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICZiX2luZm8tPnN0dWJk
b21haW5fcmFtZGlzaywgMCk7CisgICAgaWYgKCF4bHVfY2ZnX2dldF9sb25nIChjb25maWcsICJz
dHViZG9tYWluX21lbW9yeSIsICZsLCAwKSkKKyAgICAgICAgYl9pbmZvLT5zdHViZG9tYWluX21l
bWtiID0gbCAqIDEwMjQ7CisKICNkZWZpbmUgcGFyc2VfZXh0cmFfYXJncyh0eXBlKSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgIGUgPSB4bHVfY2ZnX2dl
dF9saXN0X2FzX3N0cmluZ19saXN0KGNvbmZpZywgImRldmljZV9tb2RlbF9hcmdzIiN0eXBlLCBc
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmYl9pbmZvLT5leHRyYSMjdHlw
ZSwgMCk7ICAgICAgICAgICAgXAotLSAKZ2l0LXNlcmllcyAwLjkuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
