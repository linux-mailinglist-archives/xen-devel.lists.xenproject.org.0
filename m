Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D88E97A18D
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 09:01:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsM4O-0002lE-A4; Tue, 30 Jul 2019 06:57:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PKz9=V3=intel.com=lukasz.hawrylko@srs-us1.protection.inumbo.net>)
 id 1hsM4N-0002l7-El
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 06:57:11 +0000
X-Inumbo-ID: 3f4d13f7-b297-11e9-8980-bc764e045a96
Received: from mga01.intel.com (unknown [192.55.52.88])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3f4d13f7-b297-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 06:57:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jul 2019 23:57:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,325,1559545200"; d="scan'208";a="165757112"
Received: from lhawrylk-desk.igk.intel.com ([10.102.89.27])
 by orsmga008.jf.intel.com with ESMTP; 29 Jul 2019 23:57:04 -0700
From: Lukasz Hawrylko <lukasz.hawrylko@intel.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 30 Jul 2019 08:56:37 +0200
Message-Id: <20190730065637.3802-1-lukasz.hawrylko@intel.com>
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
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Lukasz Hawrylko <lukasz.hawrylko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3VwcG9ydCBmb3IgSW50ZWwgVFhUIGhhcyBvcnBoYW5lZCBzdGF0dXMgcmlnaHQgbm93IGJlY2F1
c2UKbm8gYWN0aXZlIG1haW50YWludGVyIGlzIGxpc3RlZC4gQWRkaW5nIG15c2VsZiBhcyByZXZp
ZXdlcgphbmQgbW92aW5nIGl0IHRvIE9kZCBGaXhlcyBzdGF0ZS4KClNpZ25lZC1vZmYtYnk6IEx1
a2FzeiBIYXdyeWxrbyA8bHVrYXN6Lmhhd3J5bGtvQGludGVsLmNvbT4KLS0tCiBNQUlOVEFJTkVS
UyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCA4OWEwMWI3MTBi
Li5jYTMwMGU4N2M4IDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJTkVSUwpA
QCAtMjQwLDcgKzI0MCw4IEBAIFM6CU1haW50YWluZWQKIEY6CXRvb2xzL2dvbGFuZwogCiBJTlRF
TChSKSBUUlVTVEVEIEVYRUNVVElPTiBURUNITk9MT0dZIChUWFQpCi1TOglPcnBoYW5lZAorUjoJ
THVrYXN6IEhhd3J5bGtvIDxsdWthc3ouaGF3cnlsa29AaW50ZWwuY29tPgorUzoJT2RkIEZpeGVz
CiBGOgl4ZW4vYXJjaC94ODYvdGJvb3QuYwogRjoJeGVuL2luY2x1ZGUvYXNtLXg4Ni90Ym9vdC5o
CiAKLS0gCjIuMjAuMQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCkludGVsIFRlY2hub2xvZ3kgUG9sYW5kIHNwLiB6
IG8uby4KdWwuIFNsb3dhY2tpZWdvIDE3MyB8IDgwLTI5OCBHZGFuc2sgfCBTYWQgUmVqb25vd3kg
R2RhbnNrIFBvbG5vYyB8IFZJSSBXeWR6aWFsIEdvc3BvZGFyY3p5IEtyYWpvd2VnbyBSZWplc3Ry
dSBTYWRvd2VnbyAtIEtSUyAxMDE4ODIgfCBOSVAgOTU3LTA3LTUyLTMxNiB8IEthcGl0YWwgemFr
bGFkb3d5IDIwMC4wMDAgUExOLgoKVGEgd2lhZG9tb3NjIHdyYXogeiB6YWxhY3puaWthbWkgamVz
dCBwcnplem5hY3pvbmEgZGxhIG9rcmVzbG9uZWdvIGFkcmVzYXRhIGkgbW96ZSB6YXdpZXJhYyBp
bmZvcm1hY2plIHBvdWZuZS4gVyByYXppZSBwcnp5cGFka293ZWdvIG90cnp5bWFuaWEgdGVqIHdp
YWRvbW9zY2ksIHByb3NpbXkgbyBwb3dpYWRvbWllbmllIG5hZGF3Y3kgb3JheiB0cndhbGUgamVq
IHVzdW5pZWNpZTsgamFraWVrb2x3aWVrCnByemVnbGFkYW5pZSBsdWIgcm96cG93c3plY2huaWFu
aWUgamVzdCB6YWJyb25pb25lLgpUaGlzIGUtbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIG1heSBj
b250YWluIGNvbmZpZGVudGlhbCBtYXRlcmlhbCBmb3IgdGhlIHNvbGUgdXNlIG9mIHRoZSBpbnRl
bmRlZCByZWNpcGllbnQocykuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQs
IHBsZWFzZSBjb250YWN0IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSBhbGwgY29waWVzOyBhbnkgcmV2
aWV3IG9yIGRpc3RyaWJ1dGlvbiBieQpvdGhlcnMgaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
