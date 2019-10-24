Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81026E291E
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 05:49:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNU3y-0003g6-WB; Thu, 24 Oct 2019 03:45:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zRGa=YR=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iNU3x-0003fz-AT
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 03:45:25 +0000
X-Inumbo-ID: b0f7560a-f610-11e9-beca-bc764e2007e4
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0f7560a-f610-11e9-beca-bc764e2007e4;
 Thu, 24 Oct 2019 03:45:16 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 03D6221A4B;
 Wed, 23 Oct 2019 23:45:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 23 Oct 2019 23:45:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=AXNTUt0DwKKYunJg2u3lsSTDFRY/EEBhJ/qzUbLuo
 MA=; b=mBixlKnCFn8M12zmsrSYF4szjClVWh4uEMu7hzBd9EEx861oMV9oPceoW
 Z7HySF/TTe8HJsNA33L3g72idvL1WSbmT1Qyft2fz2jkgdeV3Ui/RZAK7cDD3iLU
 YnwPC9/UQAc+UtsU8sY/hMRIfJjcwoR4t78slvKMs+S02RZdf2b+5MxRZpS+MhfQ
 jmaAEPCTUgVPcdBzYTGltVC2iuI1FER3yyJCBcOuYsv1NKNHUiEecyqM/L45VVek
 TQbkUnSXX345Adtb9EoqON56BOMDWr8cxeMQx9oW/puDVDJwRryNigJ8D3hoHmd/
 fgHmossEMJpGWy3dtlHVSiSDTo+gA==
X-ME-Sender: <xms:Sx6xXSOkSw7PbossXr1kTbTGffrWLnGWjcKR8vDECbWrSJnzCausXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrledtgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:Sx6xXW_0g45_g_EsED-70bQEB9-P-bwmBsziGDrYpGJuKR569szLPA>
 <xmx:Sx6xXW7DZwiLeLJD-feTa7hSnkan7bUPpQ1LNt2Lay2kZD3_o19Kog>
 <xmx:Sx6xXd1SBYMJRA425r2k5V9lH9yaFk8ntIss0DzTWb-5vsx7CdaTgQ>
 <xmx:Sx6xXf55yQ9lofrSKpqysipdl9cmXshK8Lzfh9mAf99zRx3vy4t20w>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 21C9280064;
 Wed, 23 Oct 2019 23:45:15 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 24 Oct 2019 05:45:05 +0200
Message-Id: <d9e965c0e19759f7be398044945b7be9eff41f3d.1571888583.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.d9b2d7d69cc351a30963d653b1d459c878356e4e.1571888583.git-series.marmarek@invisiblethingslab.com>
References: <cover.d9b2d7d69cc351a30963d653b1d459c878356e4e.1571888583.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 3/3] xen/efi: use directmap to access runtime
 services table
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
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RG8gbm90IHJlcXVpcmUgc3dpdGNoaW5nIHBhZ2UgdGFibGVzIHRvIGFjY2VzcyAoc3RhdGljKSBp
bmZvcm1hdGlvbiBpbgp0aGUgcnVudGltZSBzZXJ2aWNlcyB0YWJsZSBpdHNlbGYsIHVzZSBkaXJl
Y3RtYXAgZm9yIHRoaXMuIFRoaXMgYWxsb3dzCmV4aXRpbmcgZWFybHkgZnJvbSBYRU5fRUZJX3F1
ZXJ5X2NhcHN1bGVfY2FwYWJpbGl0aWVzLApYRU5fRUZJX3VwZGF0ZV9jYXBzdWxlIGFuZCBYRU5f
RUZJX3F1ZXJ5X3ZhcmlhYmxlX2luZm8gKGluIGNhc2Ugb2Ygbm90CnN1cHBvcnRlZCBjYWxsKSB3
aXRob3V0IGFsbCB0aGUgaW1wYWN0IG9mIHBhZ2UgdGFibGUgc3dpdGNoLgoKU2lnbmVkLW9mZi1i
eTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3Ns
YWIuY29tPgotLS0KTmV3IHBhdGNoIGluIHY0LiBDYW4gYmUgYXBwbGllZCBpbmRlcGVuZGVudGx5
IG9mIHRoZSBvdGhlciB0d28uClNwZWNpZmljYWxseSBjYW4gYmUgZGVmZXJlZCBiZXlvbmQgNC4x
My4KSSdtIGFsc28gZmluZSB3aXRoIGRyb3BwaW5nIGl0LCBpZiBhZGRpbmcgZGlyZWN0bWFwIHVz
ZXJzIGlzIHVuZGVzaXJlZC4KCkNjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0t
LQogeGVuL2NvbW1vbi9lZmkvYm9vdC5jICAgIHwgIDEgKwogeGVuL2NvbW1vbi9lZmkvcnVudGlt
ZS5jIHwgMTkgKysrKy0tLS0tLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKyksIDE1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZWZpL2Jvb3Qu
YyBiL3hlbi9jb21tb24vZWZpL2Jvb3QuYwppbmRleCA5ZGViYzViLi44OWIxYzhhIDEwMDY0NAot
LS0gYS94ZW4vY29tbW9uL2VmaS9ib290LmMKKysrIGIveGVuL2NvbW1vbi9lZmkvYm9vdC5jCkBA
IC0xMTIyLDYgKzExMjIsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgZWZpX2V4aXRfYm9vdChFRklf
SEFORExFIEltYWdlSGFuZGxlLCBFRklfU1lTVEVNX1RBQkxFICpTeXN0ZQogCiAgICAgLyogQWRq
dXN0IHBvaW50ZXJzIGludG8gRUZJLiAqLwogICAgIGVmaV9jdCA9ICh2b2lkICopZWZpX2N0ICsg
RElSRUNUTUFQX1ZJUlRfU1RBUlQ7CisgICAgZWZpX3JzID0gKHZvaWQgKillZmlfcnMgKyBESVJF
Q1RNQVBfVklSVF9TVEFSVDsKICAgICBlZmlfbWVtbWFwID0gKHZvaWQgKillZmlfbWVtbWFwICsg
RElSRUNUTUFQX1ZJUlRfU1RBUlQ7CiAgICAgZWZpX2Z3X3ZlbmRvciA9ICh2b2lkICopZWZpX2Z3
X3ZlbmRvciArIERJUkVDVE1BUF9WSVJUX1NUQVJUOwogfQpkaWZmIC0tZ2l0IGEveGVuL2NvbW1v
bi9lZmkvcnVudGltZS5jIGIveGVuL2NvbW1vbi9lZmkvcnVudGltZS5jCmluZGV4IGFiNTNlYmMu
LjIyZmQ2YzkgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vZWZpL3J1bnRpbWUuYworKysgYi94ZW4v
Y29tbW9uL2VmaS9ydW50aW1lLmMKQEAgLTIxMSwxMiArMjExLDcgQEAgaW50IGVmaV9nZXRfaW5m
byh1aW50MzJfdCBpZHgsIHVuaW9uIHhlbnBmX2VmaV9pbmZvICppbmZvKQogICAgICAgICBicmVh
azsKICAgICBjYXNlIFhFTl9GV19FRklfUlRfVkVSU0lPTjoKICAgICB7Ci0gICAgICAgIHN0cnVj
dCBlZmlfcnNfc3RhdGUgc3RhdGUgPSBlZmlfcnNfZW50ZXIoKTsKLQotICAgICAgICBpZiAoICFz
dGF0ZS5jcjMgKQotICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOwogICAgICAgICBpbmZv
LT52ZXJzaW9uID0gZWZpX3JzLT5IZHIuUmV2aXNpb247Ci0gICAgICAgIGVmaV9yc19sZWF2ZSgm
c3RhdGUpOwogICAgICAgICBicmVhazsKICAgICB9CiAgICAgY2FzZSBYRU5fRldfRUZJX0NPTkZJ
R19UQUJMRToKQEAgLTYxOCwxMiArNjEzLDExIEBAIGludCBlZmlfcnVudGltZV9jYWxsKHN0cnVj
dCB4ZW5wZl9lZmlfcnVudGltZV9jYWxsICpvcCkKICAgICAgICAgICAgIGJyZWFrOwogICAgICAg
ICB9CiAKKyAgICAgICAgaWYgKCAoZWZpX3JzLT5IZHIuUmV2aXNpb24gPj4gMTYpIDwgMiApCisg
ICAgICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7CiAgICAgICAgIHN0YXRlID0gZWZpX3JzX2Vu
dGVyKCk7Ci0gICAgICAgIGlmICggIXN0YXRlLmNyMyB8fCAoZWZpX3JzLT5IZHIuUmV2aXNpb24g
Pj4gMTYpIDwgMiApCi0gICAgICAgIHsKLSAgICAgICAgICAgIGVmaV9yc19sZWF2ZSgmc3RhdGUp
OworICAgICAgICBpZiAoICFzdGF0ZS5jcjMgKQogICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RT
VVBQOwotICAgICAgICB9CiAgICAgICAgIHN0YXR1cyA9IGVmaV9ycy0+UXVlcnlWYXJpYWJsZUlu
Zm8oCiAgICAgICAgICAgICBvcC0+dS5xdWVyeV92YXJpYWJsZV9pbmZvLmF0dHIsCiAgICAgICAg
ICAgICAmb3AtPnUucXVlcnlfdmFyaWFibGVfaW5mby5tYXhfc3RvcmVfc2l6ZSwKQEAgLTYzNywx
MyArNjMxLDggQEAgaW50IGVmaV9ydW50aW1lX2NhbGwoc3RydWN0IHhlbnBmX2VmaV9ydW50aW1l
X2NhbGwgKm9wKQogICAgICAgICBpZiAoIG9wLT5taXNjICkKICAgICAgICAgICAgIHJldHVybiAt
RUlOVkFMOwogCi0gICAgICAgIHN0YXRlID0gZWZpX3JzX2VudGVyKCk7Ci0gICAgICAgIGlmICgg
IXN0YXRlLmNyMyB8fCAoZWZpX3JzLT5IZHIuUmV2aXNpb24gPj4gMTYpIDwgMiApCi0gICAgICAg
IHsKLSAgICAgICAgICAgIGVmaV9yc19sZWF2ZSgmc3RhdGUpOworICAgICAgICBpZiAoIChlZmlf
cnMtPkhkci5SZXZpc2lvbiA+PiAxNikgPCAyICkKICAgICAgICAgICAgIHJldHVybiAtRU9QTk9U
U1VQUDsKLSAgICAgICAgfQotICAgICAgICBlZmlfcnNfbGVhdmUoJnN0YXRlKTsKICAgICAgICAg
LyogWFhYIGZhbGwgdGhyb3VnaCBmb3Igbm93ICovCiAgICAgZGVmYXVsdDoKICAgICAgICAgcmV0
dXJuIC1FTk9TWVM7Ci0tIApnaXQtc2VyaWVzIDAuOS4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
