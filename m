Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D8F8602E
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 12:41:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvfp7-0002Au-5w; Thu, 08 Aug 2019 10:39:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tgVu=WE=suse.cz=jslaby@srs-us1.protection.inumbo.net>)
 id 1hvfp4-0002AR-SJ
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 10:39:06 +0000
X-Inumbo-ID: bd3aa87d-b9c8-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bd3aa87d-b9c8-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 10:39:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C167AAFBD;
 Thu,  8 Aug 2019 10:39:02 +0000 (UTC)
From: Jiri Slaby <jslaby@suse.cz>
To: bp@alien8.de
Date: Thu,  8 Aug 2019 12:38:35 +0200
Message-Id: <20190808103854.6192-10-jslaby@suse.cz>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190808103854.6192-1-jslaby@suse.cz>
References: <20190808103854.6192-1-jslaby@suse.cz>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v8 09/28] x86/asm: annotate aliases
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
Cc: linux-arch@vger.kernel.org, Juergen Gross <jgross@suse.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, mingo@redhat.com, linux-crypto@vger.kernel.org,
 hpa@zytor.com, xen-devel@lists.xenproject.org, tglx@linutronix.de,
 Jiri Slaby <jslaby@suse.cz>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

X2tleV9leHBhbnNpb25fMTI4IGlzIGFuIGFsaWFzIHRvIF9rZXlfZXhwYW5zaW9uXzI1NmEsIF9f
bWVtY3B5IHRvCm1lbWNweSwgeGVuX3N5c2NhbGwzMl90YXJnZXQgdG8geGVuX3N5c2VudGVyX3Rh
cmdldCwgYW5kIHNvIG9uLiBBbm5vdGF0ZQp0aGVtIGFsbCB1c2luZyB0aGUgbmV3IFNZTV9GVU5D
X1NUQVJUX0FMSUFTLCBTWU1fRlVOQ19TVEFSVF9MT0NBTF9BTElBUywKYW5kIFNZTV9GVU5DX0VO
RF9BTElBUy4gVGhpcyB3aWxsIG1ha2UgdGhlIHRvb2xzIGdlbmVyYXRpbmcgdGhlCmRlYnVnaW5m
byBoYXBweS4KClNpZ25lZC1vZmYtYnk6IEppcmkgU2xhYnkgPGpzbGFieUBzdXNlLmN6PgpDYzog
SGVyYmVydCBYdSA8aGVyYmVydEBnb25kb3IuYXBhbmEub3JnLmF1PgpDYzogIkRhdmlkIFMuIE1p
bGxlciIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+CkNjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGlu
dXRyb25peC5kZT4KQ2M6IEluZ28gTW9sbmFyIDxtaW5nb0ByZWRoYXQuY29tPgpDYzogIkguIFBl
dGVyIEFudmluIiA8aHBhQHp5dG9yLmNvbT4KQ2M6IDx4ODZAa2VybmVsLm9yZz4KQ2M6IEJvcmlz
IE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CkNjOiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+ClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+IFt4ZW4gcGFydHNdCkNjOiA8bGludXgtY3J5cHRvQHZnZXIua2VybmVsLm9yZz4KQ2M6
IDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+Ci0tLQogYXJjaC94ODYvY3J5cHRvL2Fl
c25pLWludGVsX2FzbS5TIHwgNSArKy0tLQogYXJjaC94ODYvbGliL21lbWNweV82NC5TICAgICAg
ICAgIHwgNCArKy0tCiBhcmNoL3g4Ni9saWIvbWVtbW92ZV82NC5TICAgICAgICAgfCA0ICsrLS0K
IGFyY2gveDg2L2xpYi9tZW1zZXRfNjQuUyAgICAgICAgICB8IDQgKystLQogYXJjaC94ODYveGVu
L3hlbi1hc21fNjQuUyAgICAgICAgIHwgNCArKy0tCiA1IGZpbGVzIGNoYW5nZWQsIDEwIGluc2Vy
dGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2NyeXB0by9h
ZXNuaS1pbnRlbF9hc20uUyBiL2FyY2gveDg2L2NyeXB0by9hZXNuaS1pbnRlbF9hc20uUwppbmRl
eCBlMGE1ZmI0NjJhMGEuLjlkOGQ1ZjIyOTZlMSAxMDA2NDQKLS0tIGEvYXJjaC94ODYvY3J5cHRv
L2Flc25pLWludGVsX2FzbS5TCisrKyBiL2FyY2gveDg2L2NyeXB0by9hZXNuaS1pbnRlbF9hc20u
UwpAQCAtMTc1Nyw4ICsxNzU3LDcgQEAgRU5EUFJPQyhhZXNuaV9nY21fZmluYWxpemUpCiAjZW5k
aWYKIAogCi0uYWxpZ24gNAotX2tleV9leHBhbnNpb25fMTI4OgorU1lNX0ZVTkNfU1RBUlRfTE9D
QUxfQUxJQVMoX2tleV9leHBhbnNpb25fMTI4KQogU1lNX0ZVTkNfU1RBUlRfTE9DQUwoX2tleV9l
eHBhbnNpb25fMjU2YSkKIAlwc2h1ZmQgJDBiMTExMTExMTEsICV4bW0xLCAleG1tMQogCXNodWZw
cyAkMGIwMDAxMDAwMCwgJXhtbTAsICV4bW00CkBAIC0xNzY5LDggKzE3NjgsOCBAQCBTWU1fRlVO
Q19TVEFSVF9MT0NBTChfa2V5X2V4cGFuc2lvbl8yNTZhKQogCW1vdmFwcyAleG1tMCwgKFRLRVlQ
KQogCWFkZCAkMHgxMCwgVEtFWVAKIAlyZXQKLUVORFBST0MoX2tleV9leHBhbnNpb25fMTI4KQog
U1lNX0ZVTkNfRU5EKF9rZXlfZXhwYW5zaW9uXzI1NmEpCitTWU1fRlVOQ19FTkRfQUxJQVMoX2tl
eV9leHBhbnNpb25fMTI4KQogCiBTWU1fRlVOQ19TVEFSVF9MT0NBTChfa2V5X2V4cGFuc2lvbl8x
OTJhKQogCXBzaHVmZCAkMGIwMTAxMDEwMSwgJXhtbTEsICV4bW0xCmRpZmYgLS1naXQgYS9hcmNo
L3g4Ni9saWIvbWVtY3B5XzY0LlMgYi9hcmNoL3g4Ni9saWIvbWVtY3B5XzY0LlMKaW5kZXggOTI3
NDg2NjBiYTUxLi41N2E2NDI2NmJhNjkgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2xpYi9tZW1jcHlf
NjQuUworKysgYi9hcmNoL3g4Ni9saWIvbWVtY3B5XzY0LlMKQEAgLTI4LDcgKzI4LDcgQEAKICAq
IE91dHB1dDoKICAqIHJheCBvcmlnaW5hbCBkZXN0aW5hdGlvbgogICovCi1FTlRSWShfX21lbWNw
eSkKK1NZTV9GVU5DX1NUQVJUX0FMSUFTKF9fbWVtY3B5KQogRU5UUlkobWVtY3B5KQogCUFMVEVS
TkFUSVZFXzIgImptcCBtZW1jcHlfb3JpZyIsICIiLCBYODZfRkVBVFVSRV9SRVBfR09PRCwgXAog
CQkgICAgICAiam1wIG1lbWNweV9lcm1zIiwgWDg2X0ZFQVRVUkVfRVJNUwpAQCAtNDIsNyArNDIs
NyBAQCBFTlRSWShtZW1jcHkpCiAJcmVwIG1vdnNiCiAJcmV0CiBFTkRQUk9DKG1lbWNweSkKLUVO
RFBST0MoX19tZW1jcHkpCitTWU1fRlVOQ19FTkRfQUxJQVMoX19tZW1jcHkpCiBFWFBPUlRfU1lN
Qk9MKG1lbWNweSkKIEVYUE9SVF9TWU1CT0woX19tZW1jcHkpCiAKZGlmZiAtLWdpdCBhL2FyY2gv
eDg2L2xpYi9tZW1tb3ZlXzY0LlMgYi9hcmNoL3g4Ni9saWIvbWVtbW92ZV82NC5TCmluZGV4IGJi
ZWM2OWQ4MjIzYi4uNTBjMTY0ODMxMWIzIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9saWIvbWVtbW92
ZV82NC5TCisrKyBiL2FyY2gveDg2L2xpYi9tZW1tb3ZlXzY0LlMKQEAgLTI2LDcgKzI2LDcgQEAK
ICAqLwogLndlYWsgbWVtbW92ZQogCi1FTlRSWShtZW1tb3ZlKQorU1lNX0ZVTkNfU1RBUlRfQUxJ
QVMobWVtbW92ZSkKIEVOVFJZKF9fbWVtbW92ZSkKIAogCS8qIEhhbmRsZSBtb3JlIDMyIGJ5dGVz
IGluIGxvb3AgKi8KQEAgLTIwOCw2ICsyMDgsNiBAQCBFTlRSWShfX21lbW1vdmUpCiAxMzoKIAly
ZXRxCiBFTkRQUk9DKF9fbWVtbW92ZSkKLUVORFBST0MobWVtbW92ZSkKK1NZTV9GVU5DX0VORF9B
TElBUyhtZW1tb3ZlKQogRVhQT1JUX1NZTUJPTChfX21lbW1vdmUpCiBFWFBPUlRfU1lNQk9MKG1l
bW1vdmUpCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9saWIvbWVtc2V0XzY0LlMgYi9hcmNoL3g4Ni9s
aWIvbWVtc2V0XzY0LlMKaW5kZXggOWJjODYxYzcxZTc1Li45MjdhYzQ0ZDM0YWEgMTAwNjQ0Ci0t
LSBhL2FyY2gveDg2L2xpYi9tZW1zZXRfNjQuUworKysgYi9hcmNoL3g4Ni9saWIvbWVtc2V0XzY0
LlMKQEAgLTE5LDcgKzE5LDcgQEAKICAqCiAgKiByYXggICBvcmlnaW5hbCBkZXN0aW5hdGlvbgog
ICovCi1FTlRSWShtZW1zZXQpCitTWU1fRlVOQ19TVEFSVF9BTElBUyhtZW1zZXQpCiBFTlRSWShf
X21lbXNldCkKIAkvKgogCSAqIFNvbWUgQ1BVcyBzdXBwb3J0IGVuaGFuY2VkIFJFUCBNT1ZTQi9T
VE9TQiBmZWF0dXJlLiBJdCBpcyByZWNvbW1lbmRlZApAQCAtNDMsOCArNDMsOCBAQCBFTlRSWShf
X21lbXNldCkKIAlyZXAgc3Rvc2IKIAltb3ZxICVyOSwlcmF4CiAJcmV0Ci1FTkRQUk9DKG1lbXNl
dCkKIEVORFBST0MoX19tZW1zZXQpCitTWU1fRlVOQ19FTkRfQUxJQVMobWVtc2V0KQogRVhQT1JU
X1NZTUJPTChtZW1zZXQpCiBFWFBPUlRfU1lNQk9MKF9fbWVtc2V0KQogCmRpZmYgLS1naXQgYS9h
cmNoL3g4Ni94ZW4veGVuLWFzbV82NC5TIGIvYXJjaC94ODYveGVuL3hlbi1hc21fNjQuUwppbmRl
eCBlYmY2MTBiNDljMDYuLjQ1YzEyNDlmMzcwZCAxMDA2NDQKLS0tIGEvYXJjaC94ODYveGVuL3hl
bi1hc21fNjQuUworKysgYi9hcmNoL3g4Ni94ZW4veGVuLWFzbV82NC5TCkBAIC0xNjcsMTMgKzE2
NywxMyBAQCBFTkRQUk9DKHhlbl9zeXNlbnRlcl90YXJnZXQpCiAKICNlbHNlIC8qICFDT05GSUdf
SUEzMl9FTVVMQVRJT04gKi8KIAotRU5UUlkoeGVuX3N5c2NhbGwzMl90YXJnZXQpCitTWU1fRlVO
Q19TVEFSVF9BTElBUyh4ZW5fc3lzY2FsbDMyX3RhcmdldCkKIEVOVFJZKHhlbl9zeXNlbnRlcl90
YXJnZXQpCiAJbGVhIDE2KCVyc3ApLCAlcnNwCS8qIHN0cmlwICVyY3gsICVyMTEgKi8KIAltb3Yg
JC1FTk9TWVMsICVyYXgKIAlwdXNocSAkMAogCWptcCBoeXBlcmNhbGxfaXJldAotRU5EUFJPQyh4
ZW5fc3lzY2FsbDMyX3RhcmdldCkKIEVORFBST0MoeGVuX3N5c2VudGVyX3RhcmdldCkKK1NZTV9G
VU5DX0VORF9BTElBUyh4ZW5fc3lzY2FsbDMyX3RhcmdldCkKIAogI2VuZGlmCS8qIENPTkZJR19J
QTMyX0VNVUxBVElPTiAqLwotLSAKMi4yMi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
