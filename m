Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB6778E48
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 16:44:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs6o2-0002mQ-Tm; Mon, 29 Jul 2019 14:39:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LvHy=V2=intel.com=lukasz.hawrylko@srs-us1.protection.inumbo.net>)
 id 1hs6o2-0002mL-2S
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 14:39:18 +0000
X-Inumbo-ID: a39baad5-b20e-11e9-8980-bc764e045a96
Received: from mga01.intel.com (unknown [192.55.52.88])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a39baad5-b20e-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 14:39:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jul 2019 07:39:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,323,1559545200"; d="scan'208";a="171586227"
Received: from lhawrylk-desk.igk.intel.com ([10.102.89.27])
 by fmsmga008.fm.intel.com with ESMTP; 29 Jul 2019 07:39:12 -0700
From: Lukasz Hawrylko <lukasz.hawrylko@intel.com>
To: lukasz.hawrylko@intel.com,
	xen-devel@lists.xenproject.org
Date: Mon, 29 Jul 2019 16:39:10 +0200
Message-Id: <20190729143910.2389-1-lukasz.hawrylko@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] Adding Intel TXT maintainter
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
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3VwcG9ydCBmb3IgSW50ZWwgVFhUIGhhcyBvcnBoYW5lZCBzdGF0dXMgcmlnaHQgbm93IGJlY2F1
c2UKbm8gYWN0aXZlIG1haW50YWludGVyIGlzIGxpc3RlZC4gQWRkaW5nIG15c2VsZiBhcyBhY3Rp
dmUgbWFpbnRhaW50ZXIsCnNvIGl0IGNvdWxkIGJlIHJldmVydGVkIHRvIHN1cHBvcnRlZCBzdGF0
ZS4KClNpZ25lZC1vZmYtYnk6IEx1a2FzeiBIYXdyeWxrbyA8bHVrYXN6Lmhhd3J5bGtvQGludGVs
LmNvbT4KLS0tCiBNQUlOVEFJTkVSUyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCA4OWEwMWI3
MTBiLi5lMDIyNzlmOTM1IDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJTkVS
UwpAQCAtMjQwLDYgKzI0MCw3IEBAIFM6CU1haW50YWluZWQKIEY6CXRvb2xzL2dvbGFuZwogCiBJ
TlRFTChSKSBUUlVTVEVEIEVYRUNVVElPTiBURUNITk9MT0dZIChUWFQpCitNOglMdWthc3ogSGF3
cnlsa28gPGx1a2Fzei5oYXdyeWxrb0BpbnRlbC5jb20+CiBTOglPcnBoYW5lZAogRjoJeGVuL2Fy
Y2gveDg2L3Rib290LmMKIEY6CXhlbi9pbmNsdWRlL2FzbS14ODYvdGJvb3QuaAotLSAKMi4yMC4x
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQoKSW50ZWwgVGVjaG5vbG9neSBQb2xhbmQgc3AuIHogby5vLgp1bC4gU2xv
d2Fja2llZ28gMTczIHwgODAtMjk4IEdkYW5zayB8IFNhZCBSZWpvbm93eSBHZGFuc2sgUG9sbm9j
IHwgVklJIFd5ZHppYWwgR29zcG9kYXJjenkgS3Jham93ZWdvIFJlamVzdHJ1IFNhZG93ZWdvIC0g
S1JTIDEwMTg4MiB8IE5JUCA5NTctMDctNTItMzE2IHwgS2FwaXRhbCB6YWtsYWRvd3kgMjAwLjAw
MCBQTE4uCgpUYSB3aWFkb21vc2Mgd3JheiB6IHphbGFjem5pa2FtaSBqZXN0IHByemV6bmFjem9u
YSBkbGEgb2tyZXNsb25lZ28gYWRyZXNhdGEgaSBtb3plIHphd2llcmFjIGluZm9ybWFjamUgcG91
Zm5lLiBXIHJhemllIHByenlwYWRrb3dlZ28gb3RyenltYW5pYSB0ZWogd2lhZG9tb3NjaSwgcHJv
c2lteSBvIHBvd2lhZG9taWVuaWUgbmFkYXdjeSBvcmF6IHRyd2FsZSBqZWogdXN1bmllY2llOyBq
YWtpZWtvbHdpZWsKcHJ6ZWdsYWRhbmllIGx1YiByb3pwb3dzemVjaG5pYW5pZSBqZXN0IHphYnJv
bmlvbmUuClRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29uZmlk
ZW50aWFsIG1hdGVyaWFsIGZvciB0aGUgc29sZSB1c2Ugb2YgdGhlIGludGVuZGVkIHJlY2lwaWVu
dChzKS4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgcGxlYXNlIGNvbnRh
Y3QgdGhlIHNlbmRlciBhbmQgZGVsZXRlIGFsbCBjb3BpZXM7IGFueSByZXZpZXcgb3IgZGlzdHJp
YnV0aW9uIGJ5Cm90aGVycyBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
