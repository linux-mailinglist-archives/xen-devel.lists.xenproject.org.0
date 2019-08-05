Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3BE81F6E
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 16:49:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hueF0-0002UP-7V; Mon, 05 Aug 2019 14:45:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9Af5=WB=linux.intel.com=lukasz.hawrylko@srs-us1.protection.inumbo.net>)
 id 1hueEy-0002UK-9Q
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 14:45:36 +0000
X-Inumbo-ID: ae34298a-b78f-11e9-8980-bc764e045a96
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ae34298a-b78f-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 14:45:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 07:45:28 -0700
X-IronPort-AV: E=Sophos;i="5.64,350,1559545200"; d="scan'208";a="373100698"
Received: from lhawrylk-desk.igk.intel.com ([10.102.89.27])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 07:45:25 -0700
From: Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  5 Aug 2019 16:45:15 +0200
Message-Id: <20190805144515.17177-1-lukasz.hawrylko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] Intel TXT: add reviewer, move to Odd Fixes state
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3VwcG9ydCBmb3IgSW50ZWwgVFhUIGhhcyBvcnBoYW5lZCBzdGF0dXMgcmlnaHQgbm93IGJlY2F1
c2UKbm8gYWN0aXZlIG1haW50YWludGVyIGlzIGxpc3RlZC4gQWRkaW5nIG15c2VsZiBhcyByZXZp
ZXdlcgphbmQgbW92aW5nIGl0IHRvIE9kZCBGaXhlcyBzdGF0ZS4KClNpZ25lZC1vZmYtYnk6IEx1
a2FzeiBIYXdyeWxrbyA8bHVrYXN6Lmhhd3J5bGtvQGxpbnV4LmludGVsLmNvbT4KLS0tCiBNQUlO
VEFJTkVSUyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCA4OWEw
MWI3MTBiLi43NzQxM2UwZDllIDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJ
TkVSUwpAQCAtMjQwLDcgKzI0MCw4IEBAIFM6CU1haW50YWluZWQKIEY6CXRvb2xzL2dvbGFuZwog
CiBJTlRFTChSKSBUUlVTVEVEIEVYRUNVVElPTiBURUNITk9MT0dZIChUWFQpCi1TOglPcnBoYW5l
ZAorUjoJTHVrYXN6IEhhd3J5bGtvIDxsdWthc3ouaGF3cnlsa29AbGludXguaW50ZWwuY29tPgor
UzoJT2RkIEZpeGVzCiBGOgl4ZW4vYXJjaC94ODYvdGJvb3QuYwogRjoJeGVuL2luY2x1ZGUvYXNt
LXg4Ni90Ym9vdC5oCiAKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
