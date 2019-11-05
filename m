Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DD8F046A
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 18:53:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS2yT-0004CK-LL; Tue, 05 Nov 2019 17:50:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FZ3L=Y5=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1iS2yS-0004CA-LA
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 17:50:36 +0000
X-Inumbo-ID: c4e04c38-fff4-11e9-9631-bc764e2007e4
Received: from mout.kundenserver.de (unknown [217.72.192.75])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c4e04c38-fff4-11e9-9631-bc764e2007e4;
 Tue, 05 Nov 2019 17:50:35 +0000 (UTC)
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M42Ss-1iS2yG0Su0-0007FQ; Tue, 05 Nov 2019 18:50:24 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Tue,  5 Nov 2019 18:50:09 +0100
Message-Id: <20191105175010.2591-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191105175010.2591-1-laurent@vivier.eu>
References: <20191105175010.2591-1-laurent@vivier.eu>
MIME-Version: 1.0
X-Provags-ID: V03:K1:lZFxrSfyzft189ztgtj2zhDPSI/v8wne3TXsIYykJJGOhUsiUZI
 WUL5cdIywdu0OUa3r4YX6cB3Tht5LIMC0ClU0II1uDHDHXG37ReL8vF62QOrl1xOxWDZxAa
 yCqIAJHzVW28Cq2J7jJQs6dd+fOzaDuzfjzVCqTQsbJVnvlh+AledLIOc1Vel5LH8FUBnnh
 o47BZat4luIwytgGxrHcg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:av6w0M/wZvM=:rDhXnAD9A6cpkNh2e0TgfK
 J5zOnZTmo/W2/DrEV1TxsmjMZKnl4JwjBQ2mVcpEMorM95RpraeHljKk6t3tDPN9htva00ZS+
 n0IKmM/g54Fxgbudpy2rNfAWupAwq8AOCr38O1wobl8Bp/lRRRUuj1DZn0hrORfW1BiiE1gRu
 GthE7ZJHo2MLLrMrhXBnGO7DPuPRa+1vEbtQk9FBU6jVR3g1Bmt3QddQzGLkiUOsMnAKkXybK
 iv9ZHOq6yKrXbOPUdJNLZqKmNu5QB8SvFBiRLk53kKWXg5DL8P3PSyFE44kUyIDBbCa2s3Ohc
 f94YctBbcL9YU5QBlW6Nwu4fdldc8HR0zwl23GHM8taAuVWhUUst0bAcbky1izqYVhnwHJn1R
 eQrdjr9KZX5ac4OXFu1KZrTwkQpp0tfr/HI2TkwfmnngyN4UksepaIhwp2Yjb0O7A88PqEUco
 4gDwDOA4U9bZNwEmwCgRAEhma1/YgZjpzKq8KwOH2+r85K5x7yNvLw9sSqzWLFA22rjhvchsv
 kDgAfgPtmB73k4lCOcLXEJpK0Wqgr/5KGZTohZmKSsuInPT/SYbnutSzOYKmnGtZQL5DBYf3a
 Ffz0lRXXmB1JvCyKrdlixwyOy5ZMKgh26Ca8J9olDZLuqEXYVP665ZS3UZpQ7giQkdwruVD1z
 VjZqrV5/+n8dISFBbupy5B/MNVImCkyCk1EuopkA7tj/QGjFM02nT+QEu1hmyrSQMJYIcyC1h
 v6AOWFzBqbucg6B8a7O4b488V2tPkikK+6Xj0FxRIchrNIh1TO3HeYrR72TWCmYvoiJsE3oVw
 MSVb44EyLNzkUgBzQ0nagEe+iBk+aTQLdvfM0Glo9oYSOyWcn6XykZEbWXbsOFtHKhG2fXxdO
 yV0/pVe89F9Tov60kVhYGU5ic5vtb/L80oLvPPMJo=
Subject: [Xen-devel] [PULL v2 2/3] hw/misc/grlib_ahb_apb_pnp: Fix 8-bit
 accesses
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 qemu-trivial@nongnu.org, Claudio Fontana <claudio.fontana@huawei.com>,
 Cleber Rosa <crosa@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Jiri Gaisler <jiri@gaisler.se>, David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgoKVGhlIFBs
dWcgJiBQbGF5IHJlZ2lvbiBvZiB0aGUgQUhCL0FQQiBicmlkZ2UgY2FuIGJlIGFjY2Vzc2VkCmJ5
IHZhcmlvdXMgd29yZCBzaXplLCBob3dldmVyIHRoZSBpbXBsZW1lbnRhdGlvbiBpcyBjbGVhcmx5
CnJlc3RyaWN0ZWQgdG8gMzItYml0OgoKICBzdGF0aWMgdWludDY0X3QgZ3JsaWJfYXBiX3BucF9y
ZWFkKHZvaWQgKm9wYXF1ZSwgaHdhZGRyIG9mZnNldCwgdW5zaWduZWQgc2l6ZSkKICB7CiAgICAg
IEFQQlBucCAqYXBiX3BucCA9IEdSTElCX0FQQl9QTlAob3BhcXVlKTsKCiAgICAgIHJldHVybiBh
cGJfcG5wLT5yZWdzW29mZnNldCA+PiAyXTsKICB9CgpTZXQgdGhlIE1lbW9yeVJlZ2lvbk9wczo6
aW1wbCBtaW4vbWF4IGZpZWxkcyB0byAzMi1iaXQsIHNvCm1lbW9yeS5jOjphY2Nlc3Nfd2l0aF9h
ZGp1c3RlZF9zaXplKCkgY2FuIGFkanVzdCB3aGVuIHRoZQphY2Nlc3MgaXMgbm90IDMyLWJpdC4K
ClRoaXMgaXMgcmVxdWlyZWQgdG8gcnVuIFJURU1TIG9uIGxlb24zLCB0aGUgZ3JsaWIgc2Nhbm5p
bmcKZnVuY3Rpb25zIGRvIGJ5dGUgYWNjZXNzZXMuCgpSZXBvcnRlZC1ieTogSmlyaSBHYWlzbGVy
IDxqaXJpQGdhaXNsZXIuc2U+ClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOp
IDxwaGlsbWRAcmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6IEtPTlJBRCBGcmVkZXJpYyA8ZnJlZGVy
aWMua29ucmFkQGFkYWNvcmUuY29tPgpNZXNzYWdlLUlkOiA8MjAxOTEwMjUxMTAxMTQuMjcwOTEt
My1waGlsbWRAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogTGF1cmVudCBWaXZpZXIgPGxhdXJl
bnRAdml2aWVyLmV1PgotLS0KIGh3L21pc2MvZ3JsaWJfYWhiX2FwYl9wbnAuYyB8IDQgKysrKwog
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2h3L21pc2MvZ3Js
aWJfYWhiX2FwYl9wbnAuYyBiL2h3L21pc2MvZ3JsaWJfYWhiX2FwYl9wbnAuYwppbmRleCBmM2Mw
MTVkMmMzNWYuLmUyMzBlMjUzNjM2MSAxMDA2NDQKLS0tIGEvaHcvbWlzYy9ncmxpYl9haGJfYXBi
X3BucC5jCisrKyBiL2h3L21pc2MvZ3JsaWJfYWhiX2FwYl9wbnAuYwpAQCAtMjQyLDYgKzI0Miwx
MCBAQCBzdGF0aWMgY29uc3QgTWVtb3J5UmVnaW9uT3BzIGdybGliX2FwYl9wbnBfb3BzID0gewog
ICAgIC5yZWFkICAgICAgID0gZ3JsaWJfYXBiX3BucF9yZWFkLAogICAgIC53cml0ZSAgICAgID0g
Z3JsaWJfYXBiX3BucF93cml0ZSwKICAgICAuZW5kaWFubmVzcyA9IERFVklDRV9CSUdfRU5ESUFO
LAorICAgIC5pbXBsID0geworICAgICAgICAubWluX2FjY2Vzc19zaXplID0gNCwKKyAgICAgICAg
Lm1heF9hY2Nlc3Nfc2l6ZSA9IDQsCisgICAgfSwKIH07CiAKIHN0YXRpYyB2b2lkIGdybGliX2Fw
Yl9wbnBfcmVhbGl6ZShEZXZpY2VTdGF0ZSAqZGV2LCBFcnJvciAqKmVycnApCi0tIAoyLjIxLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
