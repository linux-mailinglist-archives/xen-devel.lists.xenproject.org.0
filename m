Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E257E043B
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 14:55:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMtdA-00014Q-0O; Tue, 22 Oct 2019 12:51:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BHYU=YP=codethink.co.uk=ben@srs-us1.protection.inumbo.net>)
 id 1iMtc6-000129-9g
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 12:50:14 +0000
X-Inumbo-ID: 7c4b284d-f4ca-11e9-9468-12813bfff9fa
Received: from imap1.codethink.co.uk (unknown [176.9.8.82])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c4b284d-f4ca-11e9-9468-12813bfff9fa;
 Tue, 22 Oct 2019 12:50:12 +0000 (UTC)
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iMtc0-0002GG-5U; Tue, 22 Oct 2019 13:50:08 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.3)
 (envelope-from <ben@rainbowdash.codethink.co.uk>)
 id 1iMtbz-0000zI-En; Tue, 22 Oct 2019 13:50:07 +0100
From: "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
To: linux-kernel@lists.codethink.co.uk
Date: Tue, 22 Oct 2019 13:50:06 +0100
Message-Id: <20191022125006.3746-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 22 Oct 2019 12:51:19 +0000
Subject: [Xen-devel] [PATCH] xen: mm: include <xen/xen-ops.h> for missing
 declarations
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
Cc: xen-devel@lists.xenproject.org,
 "Ben Dooks \(Codethink\)" <ben.dooks@codethink.co.uk>,
 Stefano Stabellini <sstabellini@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW5jbHVkZSA8eGVuL3hlbi1vcHMuaD4gZm9yIHhlbl97Y3JlYXRlLGRlc3Ryb3l9X2NvbnRpZ291
c19yZWdpb24KY2FsbCBkZWNsYXJhdGlvbnMuIEZpeGVzIHRoZSBmb2xsb3dpbmcgc3BhcnNlIHdh
cm5pbmdzOgoKYXJjaC9hcm0veGVuL21tLmM6MTE5OjU6IHdhcm5pbmc6IHN5bWJvbCAneGVuX2Ny
ZWF0ZV9jb250aWd1b3VzX3JlZ2lvbicgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0
YXRpYz8KYXJjaC9hcm0veGVuL21tLmM6MTMxOjY6IHdhcm5pbmc6IHN5bWJvbCAneGVuX2Rlc3Ry
b3lfY29udGlndW91c19yZWdpb24nIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0
aWM/CgpTaWduZWQtb2ZmLWJ5OiBCZW4gRG9va3MgKENvZGV0aGluaykgPGJlbi5kb29rc0Bjb2Rl
dGhpbmsuY28udWs+Ci0tLQpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPgpDYzogUnVzc2VsbCBLaW5nIDxsaW51eEBhcm1saW51eC5vcmcudWs+CkNjOiB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZwotLS0KIGFyY2gvYXJtL3hlbi9tbS5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS94ZW4vbW0uYyBiL2FyY2gvYXJt
L3hlbi9tbS5jCmluZGV4IDM4ZmE5MTdjODU4NS4uNmZlYjZiNzhiMTNjIDEwMDY0NAotLS0gYS9h
cmNoL2FybS94ZW4vbW0uYworKysgYi9hcmNoL2FybS94ZW4vbW0uYwpAQCAtMTUsNiArMTUsNyBA
QAogI2luY2x1ZGUgPHhlbi9pbnRlcmZhY2UvZ3JhbnRfdGFibGUuaD4KICNpbmNsdWRlIDx4ZW4v
aW50ZXJmYWNlL21lbW9yeS5oPgogI2luY2x1ZGUgPHhlbi9wYWdlLmg+CisjaW5jbHVkZSA8eGVu
L3hlbi1vcHMuaD4KICNpbmNsdWRlIDx4ZW4vc3dpb3RsYi14ZW4uaD4KIAogI2luY2x1ZGUgPGFz
bS9jYWNoZWZsdXNoLmg+Ci0tIAoyLjIzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
