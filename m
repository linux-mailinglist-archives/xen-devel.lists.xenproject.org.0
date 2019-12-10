Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ACA118473
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 11:09:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iecQm-0005qd-8G; Tue, 10 Dec 2019 10:07:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5HtB=2A=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1iecQl-0005qW-Hn
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 10:07:47 +0000
X-Inumbo-ID: e9ac3ad0-1b34-11ea-8913-12813bfff9fa
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9ac3ad0-1b34-11ea-8913-12813bfff9fa;
 Tue, 10 Dec 2019 10:07:46 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 98FC1307489F; Tue, 10 Dec 2019 12:07:45 +0200 (EET)
Received: from rcojocaru.npunix.bitdefender.biz (unknown [10.17.12.174])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id E26AE3038A9C;
 Tue, 10 Dec 2019 12:07:44 +0200 (EET)
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 10 Dec 2019 12:07:33 +0200
Message-Id: <20191210100733.9073-1-rcojocaru@bitdefender.com>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH V2] Remove myself as vm_event maintainer
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
Cc: sstabellini@kernel.org, julien@xen.org,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, wl@xen.org,
 konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com,
 mdontu@bitdefender.com, ian.jackson@eu.citrix.com, tamas@tklengyel.com,
 jbeulich@suse.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29t
PgotLS0KIE1BSU5UQUlORVJTIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggOWM4MjdhZDc1OS4u
MDEyYzg0N2ViZCAxMDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAg
LTQyOCw3ICs0MjgsNiBAQCBMOgl4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKIEY6CXVu
bW9kaWZpZWRfZHJpdmVycy9saW51eC0yLjYvCiAKIFZNIEVWRU5ULCBNRU0gQUNDRVNTIGFuZCBN
T05JVE9SCi1NOglSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+CiBN
OglUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CiBSOglBbGV4YW5kcnUgSXNh
aWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4KIFI6CVBldHJlIFBpcmNhbGFidSA8cHBpcmNh
bGFidUBiaXRkZWZlbmRlci5jb20+Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
