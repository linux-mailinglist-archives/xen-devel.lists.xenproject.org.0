Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4876928E7B
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 03:02:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTyXn-0006NE-06; Fri, 24 May 2019 00:58:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zWpd=TY=wdc.com=prvs=040baf4f1=alistair.francis@srs-us1.protection.inumbo.net>)
 id 1hTyXk-0006N9-QH
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 00:58:45 +0000
X-Inumbo-ID: 12e18587-7dbf-11e9-8980-bc764e045a96
Received: from esa2.hgst.iphmx.com (unknown [68.232.143.124])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 12e18587-7dbf-11e9-8980-bc764e045a96;
 Fri, 24 May 2019 00:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1558659545; x=1590195545;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FAOpqe3oR6bEJF/Qqd55ZEF3n0hVFpEkX+o2RKLKZYk=;
 b=Rmje2/exspPuVpgAnjOOjkuVQjKBcFl0RxY5a+ji0MsSgfO4Ln21U87k
 kmlsA/+FTYS/qWqyCGHNmHtQFH5sA/Ehjr+1VOLQ2I5ImnLM1p+wgTTRi
 NmKjLb365ZMeOlFo+znULgHzBsJQcFFNbHaam/0lqSoezSuU77ctqTGG+
 x9bi/6pnAkL6qyhTqhaLBcoucAgDXQpi493L1cAKoidOUJimrT93QCsjL
 Pamm23Soq2NUwcEx8L+RWSdu1pRnhgInfdZythd3RZAo+CYiWPkmGtwcy
 gxVnTYHXiLDmIaF/QXNOYFKDfDQ9LuBb7ZFelYLGpyCceBpN+fo4lamIi g==;
X-IronPort-AV: E=Sophos;i="5.60,505,1549900800"; d="scan'208";a="208483879"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 24 May 2019 08:59:04 +0800
IronPort-SDR: BvDhJ3d7J/Yypa75VxEDF+rT/ZbHJifJRLURFsSFnU+Jlm60xWcY3Uru18LDfUTEgjMk/ljULZ
 DpZqi+pwd92RQwJn3SsOzn6j7gsE9kp/xmcM3l037dQuwDSY+nCr+VKlfavdazrMPwIqRB0Wm9
 ilPBM0SikMk10erPVnplem7kt9JaDwFJnwivt7WKJ4XUa4eTAmcSSoB8p4zHca9XW8l3+dnm/d
 rwPlANcLyfKvAQtkjqCvZnmmG9EAMl6hmqhjcPYk+Nu3oClurXwnzRtVWcjl+gmBybluxcudJJ
 24GtlTEbSUIx4iPapeTO7Pcm
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP; 23 May 2019 17:36:23 -0700
IronPort-SDR: Yi+wqC3X2/2NCQMpRGBmvhTh7ZDp+4TkDW8sD5n4kDAdt+83xcr3tWkVQy/kaLc6qaxO4FMRKM
 qJWkVlMiuIN6dOxUZSWREwAZDvmzAmK8ae5uwFLtgoYwDWVGxFdmU1jhn5CjO6XnXuvTJ1G4BC
 Zvlsd+5qOP/AK1rP/86GJKKIFJmNsViC1FK8SnFM3/QeH8nziGRbr14POLc/TCKWrMoZ7Wjlc1
 sO226UtGPYUOXgI0SAZR9DN2Igc46msDUlcc7XAbcvPrEXp+oWFdvLbrmYJHyMz0ncwhJnSuzV
 WjU=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.140])
 by uls-op-cesaip01.wdc.com with ESMTP; 23 May 2019 17:58:41 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 23 May 2019 17:56:21 -0700
Message-Id: <20190524005621.12618-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] gitignore: Ignore xen.lds and asm-offsets.s for
 all archs
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
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, konrad.wilk@oracle.com,
 George.Dunlap@eu.citrix.com, ian.jackson@eu.citrix.com, tim@xen.org,
 julien.grall@arm.com, Alistair Francis <alistair.francis@wdc.com>,
 jbeulich@suse.com, andrew.cooper3@citrix.com, alistair23@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW5zdGVhZCBvZiBpZ25vcmluZyB4ZW4ubGRzIGFuZCBhc20tb2Zmc2V0cy5zIGZvciBldmVyeSBz
cGVjaWZpYyBhcmNoLApsZXQncyBpbnN0ZWFkIGp1c3QgdXNlIGdpdGlnbm9yZSdzIHdpbGRjYXJk
IGZlYXR1cmUgdG8gaWdub3JlIHRoZW0gZm9yCmFsbCBhcmNocy4KClNpZ25lZC1vZmYtYnk6IEFs
aXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbT4KLS0tCiAuZ2l0aWdub3Jl
IHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvLmdpdGlnbm9yZSBiLy5naXRpZ25vcmUKaW5kZXggMDQ5Y2NiODdl
MS4uYTc3Y2JmZjAyYyAxMDA2NDQKLS0tIGEvLmdpdGlnbm9yZQorKysgYi8uZ2l0aWdub3JlCkBA
IC0yNzksMTIgKzI3OSw4IEBAIHhlbi8uYmFubmVyCiB4ZW4vLmNvbmZpZwogeGVuLy5jb25maWcu
b2xkCiB4ZW4vU3lzdGVtLm1hcAoteGVuL2FyY2gvYXJtL2FzbS1vZmZzZXRzLnMKLXhlbi9hcmNo
L2FybS94ZW4ubGRzCiB4ZW4vYXJjaC94ODYvYXNtLW1hY3Jvcy5pCi14ZW4vYXJjaC94ODYvYXNt
LW9mZnNldHMucwogeGVuL2FyY2gveDg2L2Jvb3QvbWtlbGYzMgoteGVuL2FyY2gveDg2L3hlbi5s
ZHMKIHhlbi9hcmNoL3g4Ni9ib290L2NtZGxpbmUuUwogeGVuL2FyY2gveDg2L2Jvb3QvcmVsb2Mu
UwogeGVuL2FyY2gveDg2L2Jvb3QvKi5iaW4KQEAgLTI5Miw2ICsyODgsOCBAQCB4ZW4vYXJjaC94
ODYvYm9vdC8qLmxuawogeGVuL2FyY2gveDg2L2VmaS5sZHMKIHhlbi9hcmNoL3g4Ni9lZmkvY2hl
Y2suZWZpCiB4ZW4vYXJjaC94ODYvZWZpL21rcmVsb2MKK3hlbi9hcmNoLyoveGVuLmxkcworeGVu
L2FyY2gvKi9hc20tb2Zmc2V0cy5zCiB4ZW4vYXJjaC8qL2VmaS9ib290LmMKIHhlbi9hcmNoLyov
ZWZpL2NvbXBhdC5jCiB4ZW4vYXJjaC8qL2VmaS9lZmkuaAotLSAKMi4yMS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
