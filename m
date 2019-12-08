Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1D5116153
	for <lists+xen-devel@lfdr.de>; Sun,  8 Dec 2019 11:10:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idtTH-0000GT-Ew; Sun, 08 Dec 2019 10:07:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xgih=Z6=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1idtTF-0000GO-Pt
 for xen-devel@lists.xenproject.org; Sun, 08 Dec 2019 10:07:21 +0000
X-Inumbo-ID: 854b466e-19a2-11ea-8695-12813bfff9fa
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 854b466e-19a2-11ea-8695-12813bfff9fa;
 Sun, 08 Dec 2019 10:07:20 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 74CE330747C0; Sun,  8 Dec 2019 12:07:19 +0200 (EET)
Received: from rcojocaru.npunix.bitdefender.biz (unknown [10.17.12.174])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 2BD4430228AB;
 Sun,  8 Dec 2019 12:07:19 +0200 (EET)
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
To: xen-devel@lists.xenproject.org
Date: Sun,  8 Dec 2019 12:07:13 +0200
Message-Id: <20191208100713.19559-1-rcojocaru@bitdefender.com>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH] Remove myself as vm_event maintainer
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

LS0tCiBNQUlOVEFJTkVSUyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IDljODI3YWQ3NTkuLjAx
MmM4NDdlYmQgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC00
MjgsNyArNDI4LDYgQEAgTDoJeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCiBGOgl1bm1v
ZGlmaWVkX2RyaXZlcnMvbGludXgtMi42LwogCiBWTSBFVkVOVCwgTUVNIEFDQ0VTUyBhbmQgTU9O
SVRPUgotTToJUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgogTToJ
VGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgogUjoJQWxleGFuZHJ1IElzYWls
YSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+CiBSOglQZXRyZSBQaXJjYWxhYnUgPHBwaXJjYWxh
YnVAYml0ZGVmZW5kZXIuY29tPgotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
