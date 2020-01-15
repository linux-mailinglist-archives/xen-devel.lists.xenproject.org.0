Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF0113B7E7
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 03:43:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irYbl-0004y7-4L; Wed, 15 Jan 2020 02:40:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8TLv=3E=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1irYbj-0004xF-Ev
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 02:40:35 +0000
X-Inumbo-ID: 5cb9fbc6-3740-11ea-b89f-bc764e2007e4
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5cb9fbc6-3740-11ea-b89f-bc764e2007e4;
 Wed, 15 Jan 2020 02:40:16 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 18C60221E9;
 Tue, 14 Jan 2020 21:40:16 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 14 Jan 2020 21:40:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=k5156GFHea9+goilYWv4iUhQJRTG8MkgyD01JF2Wy
 uo=; b=pgBV9h75MV/bPkFLO3Z61Am3W+fCwP+rdgH5tIUqEcLc1htC1nmKZd+Q+
 qit3nS+qd6lLvGt1p1eq2d4ygvOmUwm30nBBmLCB/fTIcoMTJJidVTDge26vVj3a
 dy6XlvIqPcu2EJw8yjCjrJr7l1SrGP9LMLx+L7mkwON5lSubDHyACXxjGRnOL4FW
 p6NriVaR4ngQcfTC2+GMv7dgz83/7wU0qmsEScQfmSkwoSGUb96q5T/G5TpABy6k
 Tzd6rVJubNj2k6r5yDGsodbZYn7SLkB1lecbpixMaDVoLEugm1w3PNs3up++qlxD
 A5sC9cRZ7oVMtvELa+L5Vx0tT9Kqw==
X-ME-Sender: <xms:j3seXkgbBNxYY-F39S2sydKfV46F0AeVzjlgtBhLWdMZtbjlJIOAcg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrtddvgdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:j3seXriLKNQ_IdLcOyaK3Ctv-n_Gnj5d9nlEysO16fQSiUjDdjJhyQ>
 <xmx:j3seXi7pZpbY4ZY_8jLvlQzjmaco9wIPevR1D3YGgRx4-FYsP-_W2Q>
 <xmx:j3seXlToHivCvrZFCFwLyjwsZz_JZOc8N_uEEZUOzSZK0bTNNRtjyg>
 <xmx:kHseXmtYvFXYfBttfMnHEtA0DJNJXCFb8rtDKpL9z3WSHtUYUWL9aQ>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3217530607B0;
 Tue, 14 Jan 2020 21:40:15 -0500 (EST)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 15 Jan 2020 03:39:43 +0100
Message-Id: <ef0bef56e682bff2aaa04250212bc2c3fd9ed8ce.1579055705.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 04/16] libxl: Allow running qemu-xen in
 stubdomain
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

RG8gbm90IHByb2hpYml0IGFueW1vcmUgdXNpbmcgc3R1YmRvbWFpbiB3aXRoIHFlbXUteGVuLgpU
byBoZWxwIGRpc3Rpbmd1c2hpbmcgTWluaU9TIGFuZCBMaW51eCBzdHViZG9tYWluLCBhZGQgaGVs
cGVyIGlubGluZQpmdW5jdGlvbnMgbGlieGxfX3N0dWJkb21haW5faXNfbGludXgoKSBhbmQKbGli
eGxfX3N0dWJkb21haW5faXNfbGludXhfcnVubmluZygpLiBUaG9zZSBzaG91bGQgYmUgdXNlZCB3
aGVyZSByZWFsbHkKdGhlIGRpZmZlcmVuY2UgaXMgYWJvdXQgTWluaU9TL0xpbnV4LCBub3QgcWVt
dS14ZW4vcWVtdS14ZW4tdHJhZGl0aW9uYWwuCgpTaWduZWQtb2ZmLWJ5OiBNYXJlayBNYXJjenlr
b3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+CgotLS0KQ2hh
bmdlcyBpbiB2MzoKIC0gbmV3IHBhdGNoLCBpbnN0ZWFkIG9mICJsaWJ4bDogQWRkICJzdHViZG9t
YWluX3ZlcnNpb24iIHRvCiBkb21haW5fYnVpbGRfaW5mbyIKIC0gaGVscGVyIGZ1bmN0aW9ucyBh
cyBzdWdnZXN0ZWQgYnkgSWFuIEphY2tzb24KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9jcmVhdGUu
YyAgIHwgIDkgLS0tLS0tLS0tCiB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIHwgMTcgKysr
KysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgOSBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYyBiL3Rvb2xz
L2xpYnhsL2xpYnhsX2NyZWF0ZS5jCmluZGV4IDMyZDQ1ZGMuLjE0MmI5NjAgMTAwNjQ0Ci0tLSBh
L3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0
ZS5jCkBAIC0xNjksMTUgKzE2OSw2IEBAIGludCBsaWJ4bF9fZG9tYWluX2J1aWxkX2luZm9fc2V0
ZGVmYXVsdChsaWJ4bF9fZ2MgKmdjLAogICAgICAgICB9CiAgICAgfQogCi0gICAgaWYgKGJfaW5m
by0+dHlwZSA9PSBMSUJYTF9ET01BSU5fVFlQRV9IVk0gJiYKLSAgICAgICAgYl9pbmZvLT5kZXZp
Y2VfbW9kZWxfdmVyc2lvbiAhPQotICAgICAgICAgICAgTElCWExfREVWSUNFX01PREVMX1ZFUlNJ
T05fUUVNVV9YRU5fVFJBRElUSU9OQUwgJiYKLSAgICAgICAgbGlieGxfZGVmYm9vbF92YWwoYl9p
bmZvLT5kZXZpY2VfbW9kZWxfc3R1YmRvbWFpbikpIHsKLSAgICAgICAgTE9HKEVSUk9SLAotICAg
ICAgICAgICAgImRldmljZSBtb2RlbCBzdHViZG9tYWlucyByZXF1aXJlIFwicWVtdS14ZW4tdHJh
ZGl0aW9uYWxcIiIpOwotICAgICAgICByZXR1cm4gRVJST1JfSU5WQUw7Ci0gICAgfQotCiAgICAg
aWYgKCFiX2luZm8tPm1heF92Y3B1cykKICAgICAgICAgYl9pbmZvLT5tYXhfdmNwdXMgPSAxOwog
ICAgIGlmICghYl9pbmZvLT5hdmFpbF92Y3B1cy5zaXplKSB7CmRpZmYgLS1naXQgYS90b29scy9s
aWJ4bC9saWJ4bF9pbnRlcm5hbC5oIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAppbmRl
eCBiYThjOWI0Li5jYzNjZjI2IDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5h
bC5oCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKQEAgLTIyOTksNiArMjI5OSwy
MyBAQCBfaGlkZGVuIGludCBsaWJ4bF9fZGV2aWNlX21vZGVsX3ZlcnNpb25fcnVubmluZyhsaWJ4
bF9fZ2MgKmdjLCB1aW50MzJfdCBkb21pZCk7CiAgIC8qIFJldHVybiB0aGUgc3lzdGVtLXdpZGUg
ZGVmYXVsdCBkZXZpY2UgbW9kZWwgKi8KIF9oaWRkZW4gbGlieGxfZGV2aWNlX21vZGVsX3ZlcnNp
b24gbGlieGxfX2RlZmF1bHRfZGV2aWNlX21vZGVsKGxpYnhsX19nYyAqZ2MpOwogCitzdGF0aWMg
aW5saW5lCitib29sIGxpYnhsX19zdHViZG9tYWluX2lzX2xpbnV4X3J1bm5pbmcobGlieGxfX2dj
ICpnYywgdWludDMyX3QgZG9taWQpCit7CisgICAgLyogc2FtZSBsb2dpYyBhcyBpbiBsaWJ4bF9f
c3R1YmRvbWFpbl9pc19saW51eCAqLworICAgIHJldHVybiBsaWJ4bF9fZGV2aWNlX21vZGVsX3Zl
cnNpb25fcnVubmluZyhnYywgZG9taWQpCisgICAgICAgID09IExJQlhMX0RFVklDRV9NT0RFTF9W
RVJTSU9OX1FFTVVfWEVOOworfQorCitzdGF0aWMgaW5saW5lCitib29sIGxpYnhsX19zdHViZG9t
YWluX2lzX2xpbnV4KGxpYnhsX2RvbWFpbl9idWlsZF9pbmZvICpiX2luZm8pCit7CisgICAgLyog
cmlnaHQgbm93IHFlbXUtdHJhbmRpdGlvbmFsIGltcGxpZXMgTWluaU9TIHN0dWJkb21haW4gYW5k
IHFlbXUteGVuCisgICAgICogaW1wbGllcyBMaW51eCBzdHViZG9tYWluICovCisgICAgcmV0dXJu
IGxpYnhsX2RlZmJvb2xfdmFsKGJfaW5mby0+ZGV2aWNlX21vZGVsX3N0dWJkb21haW4pICYmCisg
ICAgICAgIGJfaW5mby0+ZGV2aWNlX21vZGVsX3ZlcnNpb24gPT0gTElCWExfREVWSUNFX01PREVM
X1ZFUlNJT05fUUVNVV9YRU47Cit9CisKICNkZWZpbmUgREVWSUNFX01PREVMX1hTX1BBVEgoZ2Ms
IGRtX2RvbWlkLCBkb21pZCwgZm10LCBfYS4uLikgICAgICAgICAgICAgIFwKICAgICBsaWJ4bF9f
c3ByaW50ZihnYywgIi9sb2NhbC9kb21haW4vJXUvZGV2aWNlLW1vZGVsLyV1IiBmbXQsIGRtX2Rv
bWlkLCAgIFwKICAgICAgICAgICAgICAgICAgICBkb21pZCwgIyNfYSkKLS0gCmdpdC1zZXJpZXMg
MC45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
