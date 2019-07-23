Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1F471C8C
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 18:09:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpxIu-0001Qq-HE; Tue, 23 Jul 2019 16:06:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vTna=VU=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hpxIs-0001QL-Rw
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 16:06:14 +0000
X-Inumbo-ID: cbbf2e0e-ad63-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cbbf2e0e-ad63-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 16:06:14 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: m9mcdEIzOs/L7KB7MAIqxJafHdDEypEOnddpOAH45e4TNz+9Pdj/rmkaVK+gYff3Z2G7EMBHFi
 HrUCtkYMrv2egPeqx+UpjTF0XdIT8sqHJgV82Wktj2NP9bAHsr16I0jqZ+PlyyDd07HS506r+l
 KyIie3jJXT6qWnxUzL21BAdU60utd99aBiBO4J0DLeuW52qZIxmksOfj57rg4rvQ70D5M3wH/H
 PgtVbdapVhVh7Sy7dKVk+ff/Kpq5UmTZ8en/V7HGqyvAyWtSzHMO7qVMOlW8IGTay/S3tV4t0C
 Pxg=
X-SBRS: 2.7
X-MesageID: 3410778
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,299,1559534400"; 
   d="scan'208";a="3410778"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 23 Jul 2019 17:06:09 +0100
Message-ID: <20190723160609.2177-7-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
In-Reply-To: <20190723160609.2177-1-paul.durrant@citrix.com>
References: <20190723160609.2177-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 6/6] x86/domain: remove the 's3_integrity' flag
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Shane Wang <shane.wang@intel.com>, Gang Wei <gang.wei@intel.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGZsYWcgaXMgbm90IG5lZWRlZCBzaW5jZSB0aGUgZG9tYWluICdjcmVhdGVmbGFncycgY2Fu
IG5vdyBiZSB0ZXN0ZWQKZGlyZWN0bHkuCgpTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBh
dWwuZHVycmFudEBjaXRyaXguY29tPgotLS0KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBX
ZWkgTGl1IDx3bEB4ZW4ub3JnPgpDYzogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4KQ2M6IEdhbmcgV2VpIDxnYW5nLndlaUBpbnRlbC5jb20+CkNjOiBTaGFuZSBXYW5n
IDxzaGFuZS53YW5nQGludGVsLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvZG9tYWluLmMgICAgICAg
IHwgMiAtLQogeGVuL2FyY2gveDg2L3Rib290LmMgICAgICAgICB8IDIgKy0KIHhlbi9pbmNsdWRl
L2FzbS14ODYvZG9tYWluLmggfCAyIC0tCiAzIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9kb21haW4uYyBiL3hl
bi9hcmNoL3g4Ni9kb21haW4uYwppbmRleCA2NWY0N2E3NjI3Li4yMjAzODgyNDQ1IDEwMDY0NAot
LS0gYS94ZW4vYXJjaC94ODYvZG9tYWluLmMKKysrIGIveGVuL2FyY2gveDg2L2RvbWFpbi5jCkBA
IC01MzgsOCArNTM4LDYgQEAgaW50IGFyY2hfZG9tYWluX2NyZWF0ZShzdHJ1Y3QgZG9tYWluICpk
LAogICAgICAgICAgICAgICAgZC0+ZG9tYWluX2lkKTsKICAgICB9CiAKLSAgICBkLT5hcmNoLnMz
X2ludGVncml0eSA9IGNvbmZpZy0+ZmxhZ3MgJiBYRU5fRE9NQ1RMX0NERl9zM19pbnRlZ3JpdHk7
Ci0KICAgICBlbWZsYWdzID0gY29uZmlnLT5hcmNoLmVtdWxhdGlvbl9mbGFnczsKIAogICAgIGlm
ICggaXNfaGFyZHdhcmVfZG9tYWluKGQpICYmIGlzX3B2X2RvbWFpbihkKSApCmRpZmYgLS1naXQg
YS94ZW4vYXJjaC94ODYvdGJvb3QuYyBiL3hlbi9hcmNoL3g4Ni90Ym9vdC5jCmluZGV4IGYzZmRl
ZTRkMzkuLjFhN2U0NGE4YTkgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni90Ym9vdC5jCisrKyBi
L3hlbi9hcmNoL3g4Ni90Ym9vdC5jCkBAIC0yMTIsNyArMjEyLDcgQEAgc3RhdGljIHZvaWQgdGJv
b3RfZ2VuX2RvbWFpbl9pbnRlZ3JpdHkoY29uc3QgdWludDhfdCBrZXlbVEJfS0VZX1NJWkVdLAog
ICAgIHZtYWNfc2V0X2tleSgodWludDhfdCAqKWtleSwgJmN0eCk7CiAgICAgZm9yX2VhY2hfZG9t
YWluKCBkICkKICAgICB7Ci0gICAgICAgIGlmICggIWQtPmFyY2guczNfaW50ZWdyaXR5ICkKKyAg
ICAgICAgaWYgKCAhKGQtPmNyZWF0ZWZsYWdzICYgWEVOX0RPTUNUTF9DREZfczNfaW50ZWdyaXR5
KSApCiAgICAgICAgICAgICBjb250aW51ZTsKICAgICAgICAgcHJpbnRrKCJNQUNpbmcgRG9tYWlu
ICV1XG4iLCBkLT5kb21haW5faWQpOwogCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2
L2RvbWFpbi5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9kb21haW4uaAppbmRleCA1Zjk4OTk0Njlj
Li41YzAzOGExMDY1IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2RvbWFpbi5oCisr
KyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZG9tYWluLmgKQEAgLTI5NSw4ICsyOTUsNiBAQCBzdHJ1
Y3QgYXJjaF9kb21haW4KICAgICB1aW50MzJfdCBwY2lfY2Y4OwogICAgIHVpbnQ4X3QgY21vc19p
ZHg7CiAKLSAgICBib29sX3QgczNfaW50ZWdyaXR5OwotCiAgICAgdW5pb24gewogICAgICAgICBz
dHJ1Y3QgcHZfZG9tYWluIHB2OwogICAgICAgICBzdHJ1Y3QgaHZtX2RvbWFpbiBodm07Ci0tIAoy
LjIwLjEuMi5nYjIxZWJiNjcxCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
