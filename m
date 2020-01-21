Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 560C3144033
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 16:10:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itv7n-0006G2-8Y; Tue, 21 Jan 2020 15:07:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=li9x=3K=dornerworks.com=jeff.kubascik@srs-us1.protection.inumbo.net>)
 id 1itv7l-0006Fs-EW
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 15:07:25 +0000
X-Inumbo-ID: b81082fb-3c5f-11ea-bacb-12813bfff9fa
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id b81082fb-3c5f-11ea-bacb-12813bfff9fa;
 Tue, 21 Jan 2020 15:07:21 +0000 (UTC)
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 21 Jan 2020 10:07:03 -0500
Message-ID: <20200121150704.126001-2-jeff.kubascik@dornerworks.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200121150704.126001-1-jeff.kubascik@dornerworks.com>
References: <20200121150704.126001-1-jeff.kubascik@dornerworks.com>
MIME-Version: 1.0
X-Originating-IP: [172.27.13.179]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
X-spam-status: No, score=-2.9 required=3.5 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_0_4
X-Spam-Flag: NO
Subject: [Xen-devel] [PATCH v4 1/2] xen/arm: remove physical timer offset
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
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHBoeXNpY2FsIHRpbWVyIHRyYXBzIGFwcGx5IGFuIG9mZnNldCBzbyB0aGF0IHRpbWUgc3Rh
cnRzIGF0IDAgZm9yCnRoZSBndWVzdC4gSG93ZXZlciwgdGhpcyBvZmZzZXQgaXMgbm90IGN1cnJl
bnRseSBhcHBsaWVkIHRvIHRoZSBwaHlzaWNhbApjb3VudGVyLiBQZXIgdGhlIEFSTXY4IFJlZmVy
ZW5jZSBNYW51YWwgKEFSTSBEREkgMDQ4N0UuYSksIHNlY3Rpb24KRDExLjIuNCBUaW1lcnMsIHRo
ZSAiT2Zmc2V0IiBiZXR3ZWVuIHRoZSBjb3VudGVyIGFuZCB0aW1lciBzaG91bGQgYmUKemVybyBm
b3IgYSBwaHlzaWNhbCB0aW1lci4gVGhpcyByZW1vdmVzIHRoZSBvZmZzZXQgdG8gbWFrZSB0aGUg
dGltZXIgYW5kCmNvdW50ZXIgY29uc2lzdGVudC4KClRoaXMgYWxzbyBjbGVhbnMgdXAgdGhlIHBo
eXNpY2FsIHRpbWVyIGltcGxlbWVudGF0aW9uIHRvIGJldHRlciBtYXRjaAp0aGUgdmlydHVhbCB0
aW1lciAtIGJvdGggY3ZhbCdzIG5vdyBob2xkIHRoZSBoYXJkd2FyZSB2YWx1ZS4KClNpZ25lZC1v
ZmYtYnk6IEplZmYgS3ViYXNjaWsgPGplZmYua3ViYXNjaWtAZG9ybmVyd29ya3MuY29tPgotLS0K
IHhlbi9hcmNoL2FybS92dGltZXIuYyAgICAgICAgfCAzNCArKysrKysrKysrKysrKysrKystLS0t
LS0tLS0tLS0tLS0tCiB4ZW4vaW5jbHVkZS9hc20tYXJtL2RvbWFpbi5oIHwgIDMgLS0tCiAyIGZp
bGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS92dGltZXIuYyBiL3hlbi9hcmNoL2FybS92dGltZXIuYwppbmRleCAy
NDBhODUwYjZlLi4wYzc4YTY1ODYzIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vdnRpbWVyLmMK
KysrIGIveGVuL2FyY2gvYXJtL3Z0aW1lci5jCkBAIC02Miw3ICs2Miw2IEBAIHN0YXRpYyB2b2lk
IHZpcnRfdGltZXJfZXhwaXJlZCh2b2lkICpkYXRhKQogCiBpbnQgZG9tYWluX3Z0aW1lcl9pbml0
KHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCB4ZW5fYXJjaF9kb21haW5jb25maWcgKmNvbmZpZykK
IHsKLSAgICBkLT5hcmNoLnBoeXNfdGltZXJfYmFzZS5vZmZzZXQgPSBOT1coKTsKICAgICBkLT5h
cmNoLnZpcnRfdGltZXJfYmFzZS5vZmZzZXQgPSBSRUFEX1NZU1JFRzY0KENOVFBDVF9FTDApOwog
ICAgIGQtPnRpbWVfb2Zmc2V0LnNlY29uZHMgPSB0aWNrc190b19ucyhkLT5hcmNoLnZpcnRfdGlt
ZXJfYmFzZS5vZmZzZXQgLSBib290X2NvdW50KTsKICAgICBkb19kaXYoZC0+dGltZV9vZmZzZXQu
c2Vjb25kcywgMTAwMDAwMDAwMCk7CkBAIC0xMDgsNyArMTA3LDYgQEAgaW50IHZjcHVfdnRpbWVy
X2luaXQoc3RydWN0IHZjcHUgKnYpCiAKICAgICBpbml0X3RpbWVyKCZ0LT50aW1lciwgcGh5c190
aW1lcl9leHBpcmVkLCB0LCB2LT5wcm9jZXNzb3IpOwogICAgIHQtPmN0bCA9IDA7Ci0gICAgdC0+
Y3ZhbCA9IE5PVygpOwogICAgIHQtPmlycSA9IGQwCiAgICAgICAgID8gdGltZXJfZ2V0X2lycShU
SU1FUl9QSFlTX05PTlNFQ1VSRV9QUEkpCiAgICAgICAgIDogR1VFU1RfVElNRVJfUEhZU19OU19Q
UEk7CkBAIC0xNjcsNiArMTY1LDcgQEAgdm9pZCB2aXJ0X3RpbWVyX3Jlc3RvcmUoc3RydWN0IHZj
cHUgKnYpCiBzdGF0aWMgYm9vbCB2dGltZXJfY250cF9jdGwoc3RydWN0IGNwdV91c2VyX3JlZ3Mg
KnJlZ3MsIHVpbnQzMl90ICpyLCBib29sIHJlYWQpCiB7CiAgICAgc3RydWN0IHZjcHUgKnYgPSBj
dXJyZW50OworICAgIHNfdGltZV90IGV4cGlyZXM7CiAKICAgICBpZiAoICFBQ0NFU1NfQUxMT1dF
RChyZWdzLCBFTDBQVEVOKSApCiAgICAgICAgIHJldHVybiBmYWxzZTsKQEAgLTE4NCw4ICsxODMs
OSBAQCBzdGF0aWMgYm9vbCB2dGltZXJfY250cF9jdGwoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJl
Z3MsIHVpbnQzMl90ICpyLCBib29sIHJlYWQpCiAKICAgICAgICAgaWYgKCB2LT5hcmNoLnBoeXNf
dGltZXIuY3RsICYgQ05UeF9DVExfRU5BQkxFICkKICAgICAgICAgewotICAgICAgICAgICAgc2V0
X3RpbWVyKCZ2LT5hcmNoLnBoeXNfdGltZXIudGltZXIsCi0gICAgICAgICAgICAgICAgICAgICAg
di0+YXJjaC5waHlzX3RpbWVyLmN2YWwgKyB2LT5kb21haW4tPmFyY2gucGh5c190aW1lcl9iYXNl
Lm9mZnNldCk7CisgICAgICAgICAgICBleHBpcmVzID0gdi0+YXJjaC5waHlzX3RpbWVyLmN2YWwg
PiBib290X2NvdW50CisgICAgICAgICAgICAgICAgICAgICAgPyB0aWNrc190b19ucyh2LT5hcmNo
LnBoeXNfdGltZXIuY3ZhbCAtIGJvb3RfY291bnQpIDogMDsKKyAgICAgICAgICAgIHNldF90aW1l
cigmdi0+YXJjaC5waHlzX3RpbWVyLnRpbWVyLCBleHBpcmVzKTsKICAgICAgICAgfQogICAgICAg
ICBlbHNlCiAgICAgICAgICAgICBzdG9wX3RpbWVyKCZ2LT5hcmNoLnBoeXNfdGltZXIudGltZXIp
OwpAQCAtMTk3LDI2ICsxOTcsMjcgQEAgc3RhdGljIGJvb2wgdnRpbWVyX2NudHBfdHZhbChzdHJ1
Y3QgY3B1X3VzZXJfcmVncyAqcmVncywgdWludDMyX3QgKnIsCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGJvb2wgcmVhZCkKIHsKICAgICBzdHJ1Y3QgdmNwdSAqdiA9IGN1cnJlbnQ7Ci0g
ICAgc190aW1lX3Qgbm93OworICAgIHVpbnQ2NF90IGNudHBjdDsKKyAgICBzX3RpbWVfdCBleHBp
cmVzOwogCiAgICAgaWYgKCAhQUNDRVNTX0FMTE9XRUQocmVncywgRUwwUFRFTikgKQogICAgICAg
ICByZXR1cm4gZmFsc2U7CiAKLSAgICBub3cgPSBOT1coKSAtIHYtPmRvbWFpbi0+YXJjaC5waHlz
X3RpbWVyX2Jhc2Uub2Zmc2V0OworICAgIGNudHBjdCA9IGdldF9jeWNsZXMoKTsKIAogICAgIGlm
ICggcmVhZCApCiAgICAgewotICAgICAgICAqciA9ICh1aW50MzJfdCkobnNfdG9fdGlja3Modi0+
YXJjaC5waHlzX3RpbWVyLmN2YWwgLSBub3cpICYgMHhmZmZmZmZmZnVsbCk7CisgICAgICAgICpy
ID0gKHVpbnQzMl90KSgodi0+YXJjaC5waHlzX3RpbWVyLmN2YWwgLSBjbnRwY3QpICYgMHhmZmZm
ZmZmZnVsbCk7CiAgICAgfQogICAgIGVsc2UKICAgICB7Ci0gICAgICAgIHYtPmFyY2gucGh5c190
aW1lci5jdmFsID0gbm93ICsgdGlja3NfdG9fbnMoKnIpOworICAgICAgICB2LT5hcmNoLnBoeXNf
dGltZXIuY3ZhbCA9IGNudHBjdCArICpyOwogICAgICAgICBpZiAoIHYtPmFyY2gucGh5c190aW1l
ci5jdGwgJiBDTlR4X0NUTF9FTkFCTEUgKQogICAgICAgICB7CiAgICAgICAgICAgICB2LT5hcmNo
LnBoeXNfdGltZXIuY3RsICY9IH5DTlR4X0NUTF9QRU5ESU5HOwotICAgICAgICAgICAgc2V0X3Rp
bWVyKCZ2LT5hcmNoLnBoeXNfdGltZXIudGltZXIsCi0gICAgICAgICAgICAgICAgICAgICAgdi0+
YXJjaC5waHlzX3RpbWVyLmN2YWwgKwotICAgICAgICAgICAgICAgICAgICAgIHYtPmRvbWFpbi0+
YXJjaC5waHlzX3RpbWVyX2Jhc2Uub2Zmc2V0KTsKKyAgICAgICAgICAgIGV4cGlyZXMgPSB2LT5h
cmNoLnBoeXNfdGltZXIuY3ZhbCA+IGJvb3RfY291bnQKKyAgICAgICAgICAgICAgICAgICAgICA/
IHRpY2tzX3RvX25zKHYtPmFyY2gucGh5c190aW1lci5jdmFsIC0gYm9vdF9jb3VudCkgOiAwOwor
ICAgICAgICAgICAgc2V0X3RpbWVyKCZ2LT5hcmNoLnBoeXNfdGltZXIudGltZXIsIGV4cGlyZXMp
OwogICAgICAgICB9CiAgICAgfQogICAgIHJldHVybiB0cnVlOwpAQCAtMjI2LDIzICsyMjcsMjQg
QEAgc3RhdGljIGJvb2wgdnRpbWVyX2NudHBfY3ZhbChzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVn
cywgdWludDY0X3QgKnIsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgcmVhZCkK
IHsKICAgICBzdHJ1Y3QgdmNwdSAqdiA9IGN1cnJlbnQ7CisgICAgc190aW1lX3QgZXhwaXJlczsK
IAogICAgIGlmICggIUFDQ0VTU19BTExPV0VEKHJlZ3MsIEVMMFBURU4pICkKICAgICAgICAgcmV0
dXJuIGZhbHNlOwogCiAgICAgaWYgKCByZWFkICkKICAgICB7Ci0gICAgICAgICpyID0gbnNfdG9f
dGlja3Modi0+YXJjaC5waHlzX3RpbWVyLmN2YWwpOworICAgICAgICAqciA9IHYtPmFyY2gucGh5
c190aW1lci5jdmFsOwogICAgIH0KICAgICBlbHNlCiAgICAgewotICAgICAgICB2LT5hcmNoLnBo
eXNfdGltZXIuY3ZhbCA9IHRpY2tzX3RvX25zKCpyKTsKKyAgICAgICAgdi0+YXJjaC5waHlzX3Rp
bWVyLmN2YWwgPSAqcjsKICAgICAgICAgaWYgKCB2LT5hcmNoLnBoeXNfdGltZXIuY3RsICYgQ05U
eF9DVExfRU5BQkxFICkKICAgICAgICAgewogICAgICAgICAgICAgdi0+YXJjaC5waHlzX3RpbWVy
LmN0bCAmPSB+Q05UeF9DVExfUEVORElORzsKLSAgICAgICAgICAgIHNldF90aW1lcigmdi0+YXJj
aC5waHlzX3RpbWVyLnRpbWVyLAotICAgICAgICAgICAgICAgICAgICAgIHYtPmFyY2gucGh5c190
aW1lci5jdmFsICsKLSAgICAgICAgICAgICAgICAgICAgICB2LT5kb21haW4tPmFyY2gucGh5c190
aW1lcl9iYXNlLm9mZnNldCk7CisgICAgICAgICAgICBleHBpcmVzID0gdi0+YXJjaC5waHlzX3Rp
bWVyLmN2YWwgPiBib290X2NvdW50CisgICAgICAgICAgICAgICAgICAgICAgPyB0aWNrc190b19u
cyh2LT5hcmNoLnBoeXNfdGltZXIuY3ZhbCAtIGJvb3RfY291bnQpIDogMDsKKyAgICAgICAgICAg
IHNldF90aW1lcigmdi0+YXJjaC5waHlzX3RpbWVyLnRpbWVyLCBleHBpcmVzKTsKICAgICAgICAg
fQogICAgIH0KICAgICByZXR1cm4gdHJ1ZTsKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1h
cm0vZG9tYWluLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL2RvbWFpbi5oCmluZGV4IGYzZjNmYjdk
N2YuLmFkYzdmZTcyMTAgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vZG9tYWluLmgK
KysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9kb21haW4uaApAQCAtNjUsOSArNjUsNiBAQCBzdHJ1
Y3QgYXJjaF9kb21haW4KICAgICAgICAgUkVMTUVNX2RvbmUsCiAgICAgfSByZWxtZW07CiAKLSAg
ICBzdHJ1Y3QgewotICAgICAgICB1aW50NjRfdCBvZmZzZXQ7Ci0gICAgfSBwaHlzX3RpbWVyX2Jh
c2U7CiAgICAgc3RydWN0IHsKICAgICAgICAgdWludDY0X3Qgb2Zmc2V0OwogICAgIH0gdmlydF90
aW1lcl9iYXNlOwotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
