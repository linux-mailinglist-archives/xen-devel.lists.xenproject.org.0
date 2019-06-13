Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A30043712
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 16:04:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbQHp-0005Ch-Sk; Thu, 13 Jun 2019 14:01:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8Dga=UM=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hbQHn-0005Bu-QA
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 14:01:03 +0000
X-Inumbo-ID: acc21e32-8de3-11e9-8980-bc764e045a96
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id acc21e32-8de3-11e9-8980-bc764e045a96;
 Thu, 13 Jun 2019 14:01:01 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 5AF1B3016E6C; Thu, 13 Jun 2019 17:01:00 +0300 (EEST)
Received: from rcojocaru.npunix.bitdefender.biz (unknown [10.17.12.174])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 384F3306E4AC;
 Thu, 13 Jun 2019 17:01:00 +0300 (EEST)
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
To: xen-devel@lists.xenproject.org,
	tamas@tklengyel.com
Date: Thu, 13 Jun 2019 17:00:47 +0300
Message-Id: <1560434447-14363-1-git-send-email-rcojocaru@bitdefender.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [PATCH RESEND] MAINTAINERS: hand over vm_event
 maintainership
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
Cc: ppircalabu@bitdefender.com, sstabellini@kernel.org,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, wl@xen.org,
 konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, tim@xen.org, julien.grall@arm.com,
 jbeulich@suse.com, aisaila@bitdefender.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmVtb3ZlIG15c2VsZiBhcyB2bV9ldmVudCBtYWludGFuZXIsIGFkZCBBbGV4YW5kcnUgYW5kIFBl
dHJlIGFzCkJpdGRlZmVuZGVyIHZtX2V2ZW50IG1haW50YWluZXJzLgoKU2lnbmVkLW9mZi1ieTog
UmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgoKLS0tClJlLXNlbnQg
dG8gYWRkIFRhbWFzJywgUGV0cmUncyBhbmQgQWxleGFuZHJ1J3MgYWRkcmVzc2VzLgotLS0KIE1B
SU5UQUlORVJTIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IDZm
YmRjMmIuLmQ2MGUzYTUgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJT
CkBAIC00MDUsNyArNDA1LDggQEAgTDoJeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCiBG
Ogl1bm1vZGlmaWVkX2RyaXZlcnMvbGludXgtMi42LwogCiBWTSBFVkVOVCwgTUVNIEFDQ0VTUyBh
bmQgTU9OSVRPUgotTToJUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29t
PgorTToJQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+CitNOglQZXRy
ZSBQaXJjYWxhYnUgPHBwaXJjYWxhYnVAYml0ZGVmZW5kZXIuY29tPgogTToJVGFtYXMgSyBMZW5n
eWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgogUzoJU3VwcG9ydGVkCiBGOgl0b29scy90ZXN0cy94
ZW4tYWNjZXNzCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
