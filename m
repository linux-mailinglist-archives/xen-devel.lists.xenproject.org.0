Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E02141716F9
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 13:20:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7I6A-00062r-9B; Thu, 27 Feb 2020 12:17:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SGbP=4P=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1j7I68-00062h-Hh
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 12:17:00 +0000
X-Inumbo-ID: 0daf7032-595b-11ea-9c17-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0daf7032-595b-11ea-9c17-bc764e2007e4;
 Thu, 27 Feb 2020 12:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582805820;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DoHYWIF/aM2J/lXeslpKwVf4KNhLXaBsJHgw0AfGDDU=;
 b=N7RWKn9FlzjIeHsqDGAToIAIwuNrV+VyacS4S0NTfG0mSkED3id2rYE4
 /aT962JBMl7uLxWnYpOjc2WxWlwutkMaDJfsvssxU4HEuCLZWchTORYqS
 bnSjDLA2PRYGFrOFO28dEg/TGDC4hefcXmo9k+6+Z5ltVL9o+Bwgq1dg4 k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: sRQEoyydPWijGWuMmiJiXvK3c+mqU8iMp3dGC0Sz3+oNkb4GRpy4DZ1FUwYnbBdI+/dGy8B+bf
 if799pTHGmQEn3uOf3dExChhvnKLYAg7XFMwFVFr9FcVPt5kIkxy9XteeEl0sKbZViSKaDh9E0
 Q/UEy5cIH/Y6XD+OkzPAwl6k+Teic0wJtpGlPlbVzkndbtnmDGfdeppG1KW/Xmk5SuuczprPjX
 60GJODWNne0dgW3cQkVRRa/jHFu1NsEn8785s4fhnsppbppfBydKvtO7I2w0XmcmrRxsb330U+
 wS0=
X-SBRS: 2.7
X-MesageID: 13103979
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,492,1574139600"; d="scan'208";a="13103979"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 27 Feb 2020 12:16:42 +0000
Message-ID: <20200227121645.2601280-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Xen-devel] [PULL 0/3] Xen queue 2020-02-27
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
Cc: Peter Maydell <peter.maydell@linaro.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBkYjczNmUwNDM3YWE2ZmQ3YzFiN2U0
NTk5YzE3Zjk2MTlhYjZiODM3OgoKICBNZXJnZSByZW1vdGUtdHJhY2tpbmcgYnJhbmNoICdyZW1v
dGVzL2JvbnppbmkvdGFncy9mb3ItdXBzdHJlYW0nIGludG8gc3RhZ2luZyAoMjAyMC0wMi0yNSAx
MzozMToxNiArMDAwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoK
ICBodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXQtaHR0cC9wZW9wbGUvYXBlcmFyZC9xZW11LWRt
LmdpdCB0YWdzL3B1bGwteGVuLTIwMjAwMjI3Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAg
dG8gNWQ0Yzk1NDkzMWJhNjI2NjFjNmExYmMxNmNlNjA0YTAxMmExMDAwNzoKCiAgTWVtb3J5OiBP
bmx5IGNhbGwgcmFtYmxvY2tfcHRyIHdoZW4gbmVlZGVkIGluIHFlbXVfcmFtX3dyaXRlYmFjayAo
MjAyMC0wMi0yNyAxMTo1MDozMCArMDAwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KWGVuIHF1ZXVlIDIwMjAtMDItMjcK
CiogZml4IGZvciB4ZW4tYmxvY2sKKiBmaXggaW4gZXhlYy5jIGZvciBtaWdyYXRpb24gb2YgeGVu
IGd1ZXN0Ciogb25lIGNsZWFudXAgcGF0Y2gKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KQW50aG9ueSBQRVJBUkQgKDEpOgog
ICAgICBNZW1vcnk6IE9ubHkgY2FsbCByYW1ibG9ja19wdHIgd2hlbiBuZWVkZWQgaW4gcWVtdV9y
YW1fd3JpdGViYWNrCgpQYXVsIER1cnJhbnQgKDEpOgogICAgICB4ZW4tYnVzL2Jsb2NrOiBleHBs
aWNpdGx5IGFzc2lnbiBldmVudCBjaGFubmVscyB0byBhbiBBaW9Db250ZXh0CgpQaGlsaXBwZSBN
YXRoaWV1LURhdWTDqSAoMSk6CiAgICAgIGh3L3hlbi94ZW5fcHRfbG9hZF9yb206IFJlbW92ZSB1
bnVzZWQgaW5jbHVkZXMKCiBleGVjLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArKy0t
CiBody9ibG9jay9kYXRhcGxhbmUveGVuLWJsb2NrLmMgfCAyMCArKysrKysrKysrKysrKysrKyst
LQogaHcveGVuL3hlbi1idXMuYyAgICAgICAgICAgICAgIHwgMjcgKysrKysrKysrKysrKysrKysr
KysrKystLS0tCiBody94ZW4veGVuX3B0X2xvYWRfcm9tLmMgICAgICAgfCAgNCAtLS0tCiBpbmNs
dWRlL2h3L3hlbi94ZW4tYnVzLmggICAgICAgfCAgNSArKysrLQogNSBmaWxlcyBjaGFuZ2VkLCA0
NyBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
