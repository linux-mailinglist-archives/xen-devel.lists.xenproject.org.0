Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1696AD04ED
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 02:51:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iI09Y-0008JA-9S; Wed, 09 Oct 2019 00:48:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RT5Q=YC=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iI09X-0008Iw-4V
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 00:48:31 +0000
X-Inumbo-ID: 812749e6-ea2e-11e9-9bee-bc764e2007e4
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 812749e6-ea2e-11e9-9bee-bc764e2007e4;
 Wed, 09 Oct 2019 00:48:27 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 0934A6C2;
 Tue,  8 Oct 2019 20:48:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 08 Oct 2019 20:48:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=8Ruyq0Rj+dxTgFQqWjzHFuXOl5sCUsMV8H9KlttxG
 g0=; b=e8lOjnjAzm1LaQ+pgtQ+grKsL4LV75ptJob/eFdXfy2iKYcYkAB28gAtZ
 cdl5Envi6Gj8q1cimeoCvzKPxL+3acsDhHvDxBUxAWXYKlgmzGyZIzKjrwXgzn6n
 W6gJWf2wX4zcnSAqoc08VOlS0QznYWW6BkryWKsc2SQIKpG4uj7yCItO23CNoOXt
 TMGm8OlGkm4lG4K1rQ1kOXTViQ7FecM2Pqj5ExlCJd2EN+/o0ZtVFGgpefMfYxu+
 tk7K9CK29lzlcPlnk/jyDMXAbXDbikD+IxNcjkg1URkn5MoWpbruHLCWkt8/rtlw
 y4+DzufyJOwD6ZCHD9jW+/owpxfaQ==
X-ME-Sender: <xms:WS6dXXUusIiLsjxoMSYTVYcir-1fbvl87swDkvrXJqBpXf6PgAmQ1Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedriedtgdefjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:WS6dXb6vHnR8QsogggTlxxy2zlK3d0PkCa2yU9K2YJo8pi769F_C4w>
 <xmx:WS6dXVAqE4Q-kmO4Doc6egEAiLoFIUhmoF9psLVXETnj3gWMAhorZA>
 <xmx:WS6dXfeiMR9OU7zLwjeo61turqdPuHn1NUfcQffksfdZ7e3s6LKLcg>
 <xmx:WS6dXRp_ntPau321q6cX63vMfDTk5iiuMAS7UcLbL8KkIAibzY-H4w>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id E7E0380061;
 Tue,  8 Oct 2019 20:48:24 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  9 Oct 2019 02:48:18 +0200
Message-Id: <fdffd0a015106ef3f79c46a46a48ee1b1e3b7aa4.1570582061.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.a213e52849846a404eb0aac59f38015d7bef4f0f.1570582061.git-series.marmarek@invisiblethingslab.com>
References: <cover.a213e52849846a404eb0aac59f38015d7bef4f0f.1570582061.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v1 1/2] efi: remove old SetVirtualAddressMap()
 arrangement
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
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmVtb3ZlIHVudXNlZCAoI2lmZGVmLWVkIG91dCkgY29kZS4gUmV2aXZpbmcgaXQgaW4gaXRzIGN1
cnJlbnQgc2hhcGUKd29uJ3QgZmx5IGJlY2F1c2U6CiAtIFNldFZpcnR1YWxBZGRyZXNzTWFwKCkg
bmVlZHMgdG8gYmUgbWFwcGVkIHdpdGggMToxIG1hcHBpbmcsIHdoaWNoCiAgIGlzbid0IHRoZSBj
YXNlIGF0IHRoaXMgdGltZQogLSBpdCB1c2VzIGRpcmVjdG1hcCwgd2hpY2ggaXMgZ29pbmcgYXdh
eSBzb29uCiAtIGl0IHVzZXMgZGlyZWN0bWFwLCB3aGljaCBpcyBtYXBwZWQgd2l0aCBOWCwgYnJl
YWtpbmcgRWZpUnVudGltZVNlcnZpY2VzQ29kZQoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWdu
ZWQtb2ZmLWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJs
ZXRoaW5nc2xhYi5jb20+Ci0tLQogeGVuL2NvbW1vbi9lZmkvYm9vdC5jIHwgMjAgLS0tLS0tLS0t
LS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS94ZW4vY29tbW9uL2VmaS9ib290LmMgYi94ZW4vY29tbW9uL2VmaS9ib290LmMKaW5kZXggNzkx
OTM3OC4uY2RkZjNkZSAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9lZmkvYm9vdC5jCisrKyBiL3hl
bi9jb21tb24vZWZpL2Jvb3QuYwpAQCAtMjksOSArMjksNiBAQAogI3VuZGVmIF9fQVNTRU1CTFlf
XwogI2VuZGlmCiAKLS8qIFVzaW5nIFNldFZpcnR1YWxBZGRyZXNzTWFwKCkgaXMgaW5jb21wYXRp
YmxlIHdpdGgga2V4ZWM6ICovCi0jdW5kZWYgVVNFX1NFVF9WSVJUVUFMX0FERFJFU1NfTUFQCi0K
ICNkZWZpbmUgRUZJX1JFVklTSU9OKG1ham9yLCBtaW5vcikgKCgobWFqb3IpIDw8IDE2KSB8ICht
aW5vcikpCiAKICNkZWZpbmUgU01CSU9TM19UQUJMRV9HVUlEIFwKQEAgLTEwOTksOSArMTA5Niw2
IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBlZmlfZXhpdF9ib290KEVGSV9IQU5ETEUgSW1hZ2VIYW5k
bGUsIEVGSV9TWVNURU1fVEFCTEUgKlN5c3RlCiAKICAgICAvKiBBZGp1c3QgcG9pbnRlcnMgaW50
byBFRkkuICovCiAgICAgZWZpX2N0ID0gKHZvaWQgKillZmlfY3QgKyBESVJFQ1RNQVBfVklSVF9T
VEFSVDsKLSNpZmRlZiBVU0VfU0VUX1ZJUlRVQUxfQUREUkVTU19NQVAKLSAgICBlZmlfcnMgPSAo
dm9pZCAqKWVmaV9ycyArIERJUkVDVE1BUF9WSVJUX1NUQVJUOwotI2VuZGlmCiAgICAgZWZpX21l
bW1hcCA9ICh2b2lkICopZWZpX21lbW1hcCArIERJUkVDVE1BUF9WSVJUX1NUQVJUOwogICAgIGVm
aV9md192ZW5kb3IgPSAodm9pZCAqKWVmaV9md192ZW5kb3IgKyBESVJFQ1RNQVBfVklSVF9TVEFS
VDsKIH0KQEAgLTE0MjIsNyArMTQxNiw2IEBAIHN0YXRpYyBpbnQgX19pbml0IHBhcnNlX2VmaV9w
YXJhbShjb25zdCBjaGFyICpzKQogfQogY3VzdG9tX3BhcmFtKCJlZmkiLCBwYXJzZV9lZmlfcGFy
YW0pOwogCi0jaWZuZGVmIFVTRV9TRVRfVklSVFVBTF9BRERSRVNTX01BUAogc3RhdGljIF9faW5p
dCB2b2lkIGNvcHlfbWFwcGluZyh1bnNpZ25lZCBsb25nIG1mbiwgdW5zaWduZWQgbG9uZyBlbmQs
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgKCppc192YWxpZCkodW5zaWdu
ZWQgbG9uZyBzbWZuLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGxvbmcgZW1mbikpCkBAIC0xNDY2LDcgKzE0NTksNiBAQCBzdGF0aWMg
Ym9vbCBfX2luaXQgcnRfcmFuZ2VfdmFsaWQodW5zaWduZWQgbG9uZyBzbWZuLCB1bnNpZ25lZCBs
b25nIGVtZm4pCiB7CiAgICAgcmV0dXJuIHRydWU7CiB9Ci0jZW5kaWYKIAogI2RlZmluZSBJTlZB
TElEX1ZJUlRVQUxfQUREUkVTUyAoMHhCQUFBRFVMIDw8IFwKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIChFRklfUEFHRV9TSElGVCArIEJJVFNfUEVSX0xPTkcgLSAzMikpCkBAIC0x
NDc0LDEzICsxNDY2LDExIEBAIHN0YXRpYyBib29sIF9faW5pdCBydF9yYW5nZV92YWxpZCh1bnNp
Z25lZCBsb25nIHNtZm4sIHVuc2lnbmVkIGxvbmcgZW1mbikKIHZvaWQgX19pbml0IGVmaV9pbml0
X21lbW9yeSh2b2lkKQogewogICAgIHVuc2lnbmVkIGludCBpOwotI2lmbmRlZiBVU0VfU0VUX1ZJ
UlRVQUxfQUREUkVTU19NQVAKICAgICBzdHJ1Y3QgcnRfZXh0cmEgewogICAgICAgICBzdHJ1Y3Qg
cnRfZXh0cmEgKm5leHQ7CiAgICAgICAgIHVuc2lnbmVkIGxvbmcgc21mbiwgZW1mbjsKICAgICAg
ICAgdW5zaWduZWQgaW50IHByb3Q7CiAgICAgfSAqZXh0cmEsICpleHRyYV9oZWFkID0gTlVMTDsK
LSNlbmRpZgogCiAgICAgZnJlZV9lYm1hbGxvY191bnVzZWRfbWVtKCk7CiAKQEAgLTE1NjMsNyAr
MTU1Myw2IEBAIHZvaWQgX19pbml0IGVmaV9pbml0X21lbW9yeSh2b2lkKQogICAgICAgICAgICAg
ICAgIHByaW50ayhYRU5MT0dfRVJSICJDb3VsZCBub3QgbWFwIE1GTnMgJSNseC0lI2x4XG4iLAog
ICAgICAgICAgICAgICAgICAgICAgICBzbWZuLCBlbWZuIC0gMSk7CiAgICAgICAgIH0KLSNpZm5k
ZWYgVVNFX1NFVF9WSVJUVUFMX0FERFJFU1NfTUFQCiAgICAgICAgIGVsc2UgaWYgKCAhKChkZXNj
LT5QaHlzaWNhbFN0YXJ0ICsgbGVuIC0gMSkgPj4gKFZBRERSX0JJVFMgLSAxKSkgJiYKICAgICAg
ICAgICAgICAgICAgIChleHRyYSA9IHhtYWxsb2Moc3RydWN0IHJ0X2V4dHJhKSkgIT0gTlVMTCAp
CiAgICAgICAgIHsKQEAgLTE1NzQsMTIgKzE1NjMsOCBAQCB2b2lkIF9faW5pdCBlZmlfaW5pdF9t
ZW1vcnkodm9pZCkKICAgICAgICAgICAgIGV4dHJhX2hlYWQgPSBleHRyYTsKICAgICAgICAgICAg
IGRlc2MtPlZpcnR1YWxTdGFydCA9IGRlc2MtPlBoeXNpY2FsU3RhcnQ7CiAgICAgICAgIH0KLSNl
bmRpZgogICAgICAgICBlbHNlCiAgICAgICAgIHsKLSNpZmRlZiBVU0VfU0VUX1ZJUlRVQUxfQURE
UkVTU19NQVAKLSAgICAgICAgICAgIC8qIFhYWCBhbGxvY2F0ZSBlLmcuIGRvd24gZnJvbSBGSVhB
RERSX1NUQVJUICovCi0jZW5kaWYKICAgICAgICAgICAgIHByaW50ayhYRU5MT0dfRVJSICJObyBt
YXBwaW5nIGZvciBNRk5zICUjbHgtJSNseFxuIiwKICAgICAgICAgICAgICAgICAgICBzbWZuLCBl
bWZuIC0gMSk7CiAgICAgICAgIH0KQEAgLTE1OTEsMTAgKzE1NzYsNiBAQCB2b2lkIF9faW5pdCBl
ZmlfaW5pdF9tZW1vcnkodm9pZCkKICAgICAgICAgcmV0dXJuOwogICAgIH0KIAotI2lmZGVmIFVT
RV9TRVRfVklSVFVBTF9BRERSRVNTX01BUAotICAgIGVmaV9ycy0+U2V0VmlydHVhbEFkZHJlc3NN
YXAoZWZpX21lbW1hcF9zaXplLCBlZmlfbWRlc2Nfc2l6ZSwKLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG1kZXNjX3ZlciwgZWZpX21lbW1hcCk7Ci0jZWxzZQogICAgIC8qIFNldCB1
cCAxOjEgcGFnZSB0YWJsZXMgdG8gZG8gcnVudGltZSBjYWxscyBpbiAicGh5c2ljYWwiIG1vZGUu
ICovCiAgICAgZWZpX2w0X3BndGFibGUgPSBhbGxvY194ZW5fcGFnZXRhYmxlKCk7CiAgICAgQlVH
X09OKCFlZmlfbDRfcGd0YWJsZSk7CkBAIC0xNjgwLDYgKzE2NjEsNSBAQCB2b2lkIF9faW5pdCBl
ZmlfaW5pdF9tZW1vcnkodm9pZCkKICAgICBmb3IgKCBpID0gbDRfdGFibGVfb2Zmc2V0KEhZUEVS
VklTT1JfVklSVF9TVEFSVCk7CiAgICAgICAgICAgaSA8IGw0X3RhYmxlX29mZnNldChESVJFQ1RN
QVBfVklSVF9FTkQpOyArK2kgKQogICAgICAgICBlZmlfbDRfcGd0YWJsZVtpXSA9IGlkbGVfcGdf
dGFibGVbaV07Ci0jZW5kaWYKIH0KICNlbmRpZgotLSAKZ2l0LXNlcmllcyAwLjkuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
