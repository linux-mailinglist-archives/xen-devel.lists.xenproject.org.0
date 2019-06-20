Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D474C83C
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2019 09:22:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdrKT-0006m3-ME; Thu, 20 Jun 2019 07:17:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ePJG=UT=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1hdrKS-0006ly-8S
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2019 07:17:52 +0000
X-Inumbo-ID: 81bfaa56-932b-11e9-b32e-7ff9deba13b1
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81bfaa56-932b-11e9-b32e-7ff9deba13b1;
 Thu, 20 Jun 2019 07:17:48 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 CDDD83016E66; Thu, 20 Jun 2019 10:17:47 +0300 (EEST)
Received: from bitdefender.com (unknown [195.189.155.70])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id B60B1306E477;
 Thu, 20 Jun 2019 10:17:47 +0300 (EEST)
From: Petre Pircalabu <ppircalabu@bitdefender.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 20 Jun 2019 10:17:46 +0300
Message-Id: <1caa159ffc8abebbc92c56a41db631706212d409.1561014865.git.ppircalabu@bitdefender.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [PATCH] MAINTAINERS: Add myself as reviewer for vm_event
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
bT4KLS0tCiBNQUlOVEFJTkVSUyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
CgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCBhYjMyZTdmLi4w
MTUxNjI1IDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAtNDEy
LDYgKzQxMiw3IEBAIEY6CXVubW9kaWZpZWRfZHJpdmVycy9saW51eC0yLjYvCiAKIFZNIEVWRU5U
LCBNRU0gQUNDRVNTIGFuZCBNT05JVE9SCiBNOglSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBi
aXRkZWZlbmRlci5jb20+CitSOglQZXRyZSBQaXJjYWxhYnUgPHBwaXJjYWxhYnVAYml0ZGVmZW5k
ZXIuY29tPgogTToJVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgogUzoJU3Vw
cG9ydGVkCiBGOgl0b29scy90ZXN0cy94ZW4tYWNjZXNzCi0tIAoyLjcuNAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
