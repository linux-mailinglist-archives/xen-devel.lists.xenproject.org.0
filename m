Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6362E4CB25
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2019 11:42:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdtWF-0002FH-0M; Thu, 20 Jun 2019 09:38:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ePJG=UT=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1hdtWD-0002FC-Ak
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2019 09:38:09 +0000
X-Inumbo-ID: 1a4ad648-933f-11e9-811d-37d16ccf195f
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a4ad648-933f-11e9-811d-37d16ccf195f;
 Thu, 20 Jun 2019 09:38:05 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 28E5E305D489; Thu, 20 Jun 2019 12:38:04 +0300 (EEST)
Received: from bitdefender.com (unknown [195.189.155.70])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 0C513306E4AC;
 Thu, 20 Jun 2019 12:38:04 +0300 (EEST)
From: Petre Pircalabu <ppircalabu@bitdefender.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 20 Jun 2019 12:38:02 +0300
Message-Id: <12cad7df6e35f4cd53c48083ba9d6d7dd6169a38.1561023118.git.ppircalabu@bitdefender.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [PATCH v2] MAINTAINERS: Add myself as reviewer for
 vm_event
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, tamas@tklengyel.com,
 Wei Liu <wl@xen.org>, rcojocaru@bitdefender.com,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogUGV0cmUgUGlyY2FsYWJ1IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNv
bT4KLS0tCkNoYW5nZXMgaW4gdjI6Ci0gQWRkZWQgZGVzaWduYXRlZCByZXZpZXdlciBhZnRlciBt
YWludGFpbmVyIGxpc3QKLS0tCiBNQUlOVEFJTkVSUyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRl
eCBhYjMyZTdmLi4wNjU4YmNjIDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJ
TkVSUwpAQCAtNDEzLDYgKzQxMyw3IEBAIEY6CXVubW9kaWZpZWRfZHJpdmVycy9saW51eC0yLjYv
CiBWTSBFVkVOVCwgTUVNIEFDQ0VTUyBhbmQgTU9OSVRPUgogTToJUmF6dmFuIENvam9jYXJ1IDxy
Y29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgogTToJVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xl
bmd5ZWwuY29tPgorUjoJUGV0cmUgUGlyY2FsYWJ1IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNv
bT4KIFM6CVN1cHBvcnRlZAogRjoJdG9vbHMvdGVzdHMveGVuLWFjY2VzcwogRjoJeGVuL2FyY2gv
Ki9tb25pdG9yLmMKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
