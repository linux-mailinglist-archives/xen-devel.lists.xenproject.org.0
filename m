Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08215C2CA5
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 06:27:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iF9iA-0003rb-82; Tue, 01 Oct 2019 04:24:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NowY=X2=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iF9i8-0003rW-AQ
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 04:24:28 +0000
X-Inumbo-ID: 5a2d1e50-e403-11e9-96ee-12813bfff9fa
Received: from out5-smtp.messagingengine.com (unknown [66.111.4.29])
 by localhost (Halon) with ESMTPS
 id 5a2d1e50-e403-11e9-96ee-12813bfff9fa;
 Tue, 01 Oct 2019 04:24:26 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id C17E9223B4;
 Tue,  1 Oct 2019 00:24:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 01 Oct 2019 00:24:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=33Y4VCU3xgJjZ1/oKf3A5muqK8MiriGb/AMIZa65g
 DQ=; b=u5mOwflC3W+xCbWKGqIsEZ8a9Zvicf8qAfaeCMuEYPCmQGX3qW/zw0lBK
 FjSI/w4GybiW/5HOfVnkU4KXTEqJifHz77jeze/LtJnjndRFxYxfPEnJ0d0aB+qg
 GyUg+5ql8O590wqLJjQIVW0c2GrQ5PS/hcyalsRHZJJaCNVV+d0RLqiiDvCgudaA
 3bGN6bBtzLNNC1hMwCPzVuIshzKleFvjKl31YnIZL6X4+DxWzXOzbs/6EYAUKCWR
 nOZeCTQmm89/WsdHWprR9hCehW/VvZp9UXYLuz1wBUQeIK6C788fGd/j88MpIIpW
 jzYWyuStZqedxB0PhO2Fnc9px9SDA==
X-ME-Sender: <xms:-dSSXSVdVRMdD49pdTsntOTw8nMzsLE54nSXm95yXyP44klK9tybWA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrgeefgdekudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggugfgjfgesthekredttderjeenucfhrhhomhepofgrrhgv
 khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
 hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppedukeehrddvudefrddu
 heehrddujedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:-dSSXV00m6iomFimr2oQ2yy-qGWNb9B5cdt_3ZDI-XqQ39EzEcrB_g>
 <xmx:-dSSXRQhXVeaRfA3uJ6dFdF2ckotkHAUE0OWPTxL64-La17qwVo94w>
 <xmx:-dSSXZSVOdS4u8fb3ZI3Ih5I0S9DH7TTrqP3bky5-iayADc3dPVQlA>
 <xmx:-dSSXW32FFV7LbWeiOBXA2j7iZuqyvNxANRkKAKyx9BBwGaVs454DQ>
Received: from mail-itl (unknown [185.213.155.170])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6C747D60057;
 Tue,  1 Oct 2019 00:24:23 -0400 (EDT)
Date: Mon, 30 Sep 2019 23:24:19 -0500
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Message-ID: <20191001042419.GA5213@mail-itl>
References: <20190930151149.GE1163@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190930151149.GE1163@perard.uk.xensource.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: [Xen-devel] [PATCH v8.1 3/4] libxl: attach PCI device to qemu only
 after setting pciback/pcifront
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBxZW11IGlzIHJ1bm5pbmcgaW4gc3R1YmRvbWFpbiwgaGFuZGxpbmcgInBjaS1pbnMiIGNv
bW1hbmQgd2lsbCBmYWlsCmlmIHBjaWZyb250IGlzIG5vdCBpbml0aWFsaXplZCBhbHJlYWR5LiBG
aXggdGhpcyBieSBzZW5kaW5nIHN1Y2ggY29tbWFuZApvbmx5IGFmdGVyIGNvbmZpcm1pbmcgdGhh
dCBwY2liYWNrL2Zyb250IGlzIHJ1bm5pbmcuCgpTaWduZWQtb2ZmLWJ5OiBNYXJlayBNYXJjenlr
b3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+ClJldmlld2Vk
LWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KLS0tCkNoYW5n
ZXMgaW4gdjI6Ci0gRml4ZWQgY29kZSBzdHlsZSBzaW5jZSBwcmV2aW91cyB2ZXJzaW9uLgpDaGFu
Z2VzIGluIHY4OgotIHJlYmFzZSBvbiBzdGFnaW5nCi0gcmV3b3JrIGZvciBhc3luYyBhcGkKQ2hh
bmdlcyBpbiB2OC4xOgotIGNvZGUgc3R5bGUgZml4ZXMKLS0tCiB0b29scy9saWJ4bC9saWJ4bF9w
Y2kuYyB8IDQ1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCiAxIGZp
bGUgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L3Rvb2xzL2xpYnhsL2xpYnhsX3BjaS5jIGIvdG9vbHMvbGlieGwvbGlieGxfcGNpLmMKaW5kZXgg
YWM1OTdhNThmZS4uOGRjMzUyYzk2MSAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfcGNp
LmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfcGNpLmMKQEAgLTEwMTIsNiArMTAxMiw5IEBAIHR5
cGVkZWYgc3RydWN0IHBjaV9hZGRfc3RhdGUgewogICAgIGJvb2wgc3RhcnRpbmc7CiAgICAgdm9p
ZCAoKmNhbGxiYWNrKShsaWJ4bF9fZWdjICosIHN0cnVjdCBwY2lfYWRkX3N0YXRlICosIGludCBy
Yyk7CiAKKyAgICAvKiBwcml2YXRlIHRvIGRldmljZV9wY2lfYWRkX3N0dWJkb21fd2FpdCAqLwor
ICAgIGxpYnhsX19ldl9kZXZzdGF0ZSBwY2liYWNrX2RzOworCiAgICAgLyogcHJpdmF0ZSB0byBk
b19wY2lfYWRkICovCiAgICAgbGlieGxfX3hzd2FpdF9zdGF0ZSB4c3dhaXQ7CiAgICAgbGlieGxf
X2V2X3FtcCBxbXA7CkBAIC0xNDg3LDYgKzE0OTAsMTAgQEAgc3RhdGljIGludCBsaWJ4bF9wY2lk
ZXZfYXNzaWduYWJsZShsaWJ4bF9jdHggKmN0eCwgbGlieGxfZGV2aWNlX3BjaSAqcGNpZGV2KQog
ICAgIHJldHVybiBpICE9IG51bTsKIH0KIAorc3RhdGljIHZvaWQgZGV2aWNlX3BjaV9hZGRfc3R1
YmRvbV93YWl0KGxpYnhsX19lZ2MgKmVnYywKKyAgICBwY2lfYWRkX3N0YXRlICpwYXMsIGludCBy
Yyk7CitzdGF0aWMgdm9pZCBkZXZpY2VfcGNpX2FkZF9zdHViZG9tX3JlYWR5KGxpYnhsX19lZ2Mg
KmVnYywKKyAgICBsaWJ4bF9fZXZfZGV2c3RhdGUgKmRzLCBpbnQgcmMpOwogc3RhdGljIHZvaWQg
ZGV2aWNlX3BjaV9hZGRfc3R1YmRvbV9kb25lKGxpYnhsX19lZ2MgKmVnYywKICAgICBwY2lfYWRk
X3N0YXRlICosIGludCByYyk7CiBzdGF0aWMgdm9pZCBkZXZpY2VfcGNpX2FkZF9kb25lKGxpYnhs
X19lZ2MgKmVnYywKQEAgLTE1NjMsNyArMTU3MCw4IEBAIHZvaWQgbGlieGxfX2RldmljZV9wY2lf
YWRkKGxpYnhsX19lZ2MgKmVnYywgdWludDMyX3QgZG9taWQsCiAgICAgICAgIEdDTkVXKHBjaWRl
dl9zKTsKICAgICAgICAgbGlieGxfZGV2aWNlX3BjaV9pbml0KHBjaWRldl9zKTsKICAgICAgICAg
bGlieGxfZGV2aWNlX3BjaV9jb3B5KENUWCwgcGNpZGV2X3MsIHBjaWRldik7Ci0gICAgICAgIHBh
cy0+Y2FsbGJhY2sgPSBkZXZpY2VfcGNpX2FkZF9zdHViZG9tX2RvbmU7CisgICAgICAgIHBhcy0+
Y2FsbGJhY2sgPSBkZXZpY2VfcGNpX2FkZF9zdHViZG9tX3dhaXQ7CisKICAgICAgICAgZG9fcGNp
X2FkZChlZ2MsIHN0dWJkb21pZCwgcGNpZGV2X3MsIHBhcyk7IC8qIG11c3QgYmUgbGFzdCAqLwog
ICAgICAgICByZXR1cm47CiAgICAgfQpAQCAtMTU3NSw2ICsxNTgzLDQxIEBAIG91dDoKICAgICBk
ZXZpY2VfcGNpX2FkZF9kb25lKGVnYywgcGFzLCByYyk7IC8qIG11c3QgYmUgbGFzdCAqLwogfQog
CitzdGF0aWMgdm9pZCBkZXZpY2VfcGNpX2FkZF9zdHViZG9tX3dhaXQobGlieGxfX2VnYyAqZWdj
LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBjaV9hZGRfc3RhdGUg
KnBhcywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgcmMpCit7
CisgICAgbGlieGxfX2FvX2RldmljZSAqYW9kZXYgPSBwYXMtPmFvZGV2OworICAgIFNUQVRFX0FP
X0dDKGFvZGV2LT5hbyk7CisgICAgaW50IHN0dWJkb21pZCA9IGxpYnhsX2dldF9zdHViZG9tX2lk
KENUWCwgcGFzLT5kb21pZCk7CisgICAgY2hhciAqc3RhdGVfcGF0aDsKKworICAgIGlmIChyYykg
Z290byBvdXQ7CisKKyAgICAvKiBXYWl0IGZvciB0aGUgZGV2aWNlIGFjdHVhbGx5IGJlaW5nIGNv
bm5lY3RlZCwgb3RoZXJ3aXNlIGRldmljZSBtb2RlbAorICAgICAqIHJ1bm5pbmcgdGhlcmUgd2ls
bCBmYWlsIHRvIGZpbmQgdGhlIGRldmljZS4gKi8KKyAgICBzdGF0ZV9wYXRoID0gR0NTUFJJTlRG
KCIlcy9zdGF0ZSIsCisgICAgICAgICAgICBsaWJ4bF9fZG9tYWluX2RldmljZV9iYWNrZW5kX3Bh
dGgoZ2MsIDAsIHN0dWJkb21pZCwgMCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBMSUJYTF9fREVWSUNFX0tJTkRfUENJKSk7CisgICAgcmMgPSBsaWJ4bF9f
ZXZfZGV2c3RhdGVfd2FpdChhbywgJnBhcy0+cGNpYmFja19kcywKKyAgICAgICAgICAgIGRldmlj
ZV9wY2lfYWRkX3N0dWJkb21fcmVhZHksCisgICAgICAgICAgICBzdGF0ZV9wYXRoLCBYZW5idXNT
dGF0ZUNvbm5lY3RlZCwKKyAgICAgICAgICAgIExJQlhMX0RFVklDRV9NT0RFTF9TVEFSVF9USU1F
T1VUICogMTAwMCk7CisgICAgaWYgKHJjKSBnb3RvIG91dDsKKyAgICByZXR1cm47CitvdXQ6Cisg
ICAgZGV2aWNlX3BjaV9hZGRfZG9uZShlZ2MsIHBhcywgcmMpOyAvKiBtdXN0IGJlIGxhc3QgKi8K
K30KKworc3RhdGljIHZvaWQgZGV2aWNlX3BjaV9hZGRfc3R1YmRvbV9yZWFkeShsaWJ4bF9fZWdj
ICplZ2MsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX19l
dl9kZXZzdGF0ZSAqZHMsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGludCByYykKK3sKKyAgICBwY2lfYWRkX3N0YXRlICpwYXMgPSBDT05UQUlORVJfT0YoZHMsICpw
YXMsIHBjaWJhY2tfZHMpOworCisgICAgZGV2aWNlX3BjaV9hZGRfc3R1YmRvbV9kb25lKGVnYywg
cGFzLCByYyk7IC8qIG11c3QgYmUgbGFzdCAqLworfQorCiBzdGF0aWMgdm9pZCBkZXZpY2VfcGNp
X2FkZF9zdHViZG9tX2RvbmUobGlieGxfX2VnYyAqZWdjLAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHBjaV9hZGRfc3RhdGUgKnBhcywKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBpbnQgcmMpCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
