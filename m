Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C49BB77340
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 23:11:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr7Sd-0001Q9-UD; Fri, 26 Jul 2019 21:09:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOBC=VX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hr7Sb-0001PX-C8
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 21:09:05 +0000
X-Inumbo-ID: 9896f862-afe9-11e9-a538-af422943e65b
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9896f862-afe9-11e9-a538-af422943e65b;
 Fri, 26 Jul 2019 21:09:03 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: s6VJ7E6nyrRnEIgN2478Qx13OYDbRl6tJN21hxCerridkSYK002MZn4yiPWy9hVYGVddHnz5HN
 Iiv5/lwCQdqmKewQXzoNPfDIw1+7E1qz4Ko9K9/jjdUbMGutUyE22XyQUqSoxUWLZzPvFbGs0V
 xmEKxwwHpRMjM9hNaS7dEYPRusWPJ2B8LMbhZCSRUQRqdThwQSM77/dP3R4tCCOrOyDwLu1fio
 3uv9t4mxE+9v8dgmPmPwp9AxSnjMci78LTCjfQt+azYKqrs8BQ3EagEbJ5Y2gupKIiA6QlyPJb
 WVw=
X-SBRS: 2.7
X-MesageID: 3613657
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,312,1559534400"; 
   d="scan'208";a="3613657"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 26 Jul 2019 22:08:52 +0100
Message-ID: <20190726210854.6408-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190726210854.6408-1-andrew.cooper3@citrix.com>
References: <20190726210854.6408-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/4] xen/percpu: Drop unused xen/percpu.h
 includes
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tm9uZSBvZiB0aGVzZSBoZWFkZXJzIHVzZSBhbnkgUEVSX0NQVSgpIGluZnJhc3RydWN0dXJlLgoK
eGVuL3J3bG9jay5oIGhvd2V2ZXIgZG9lcywgYW5kIHBpY2tlZCBpdCB1cCB0cmFuc2l0aXZlbHkg
dmlhIHhlbi9zcGlubG9jay5oLApzbyBpbmNsdWRlIGl0IHByb3Blcmx5LgoKU2lnbmVkLW9mZi1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4g
QmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkNDOiBTdGVmYW5vIFN0YWJl
bGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNDOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5n
cmFsbEBhcm0uY29tPgpDQzogVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVw
YW0uY29tPgotLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvaTM4Ny5oICB8IDEgLQogeGVuL2luY2x1
ZGUveGVuL211bHRpY2FsbC5oIHwgMSAtCiB4ZW4vaW5jbHVkZS94ZW4vcmN1cGRhdGUuaCAgfCAx
IC0KIHhlbi9pbmNsdWRlL3hlbi9yd2xvY2suaCAgICB8IDEgKwogeGVuL2luY2x1ZGUveGVuL3Nw
aW5sb2NrLmggIHwgMSAtCiA1IGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA0IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaTM4Ny5oIGIveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9pMzg3LmgKaW5kZXggNDM0YTc3NjFhNS4uYTc4MzU0OWRiOSAxMDA2NDQK
LS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9pMzg3LmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4
Ni9pMzg3LmgKQEAgLTEyLDcgKzEyLDYgQEAKICNkZWZpbmUgX19BU01fSTM4Nl9JMzg3X0gKIAog
I2luY2x1ZGUgPHhlbi90eXBlcy5oPgotI2luY2x1ZGUgPHhlbi9wZXJjcHUuaD4KIAogLyogQnl0
ZSBvZmZzZXQgb2YgdGhlIHN0b3JlZCB3b3JkIHNpemUgd2l0aGluIHRoZSBGWFNBVkUgYXJlYS9w
b3J0aW9uLiAqLwogI2RlZmluZSBGUFVfV09SRF9TSVpFX09GRlNFVCA1MTEKZGlmZiAtLWdpdCBh
L3hlbi9pbmNsdWRlL3hlbi9tdWx0aWNhbGwuaCBiL3hlbi9pbmNsdWRlL3hlbi9tdWx0aWNhbGwu
aAppbmRleCBkMGFhNTIwMDljLi5hYzgyMzg2NjBhIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94
ZW4vbXVsdGljYWxsLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL211bHRpY2FsbC5oCkBAIC01LDcg
KzUsNiBAQAogI2lmbmRlZiBfX1hFTl9NVUxUSUNBTExfSF9fCiAjZGVmaW5lIF9fWEVOX01VTFRJ
Q0FMTF9IX18KIAotI2luY2x1ZGUgPHhlbi9wZXJjcHUuaD4KICNpZmRlZiBDT05GSUdfQ09NUEFU
CiAjaW5jbHVkZSA8Y29tcGF0L3hlbi5oPgogI2VuZGlmCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVk
ZS94ZW4vcmN1cGRhdGUuaCBiL3hlbi9pbmNsdWRlL3hlbi9yY3VwZGF0ZS5oCmluZGV4IDM0MDJl
YjVjYWYuLjEzODUwODY1ZWQgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9yY3VwZGF0ZS5o
CisrKyBiL3hlbi9pbmNsdWRlL3hlbi9yY3VwZGF0ZS5oCkBAIC0zMyw3ICszMyw2IEBACiAKICNp
bmNsdWRlIDx4ZW4vY2FjaGUuaD4KICNpbmNsdWRlIDx4ZW4vc3BpbmxvY2suaD4KLSNpbmNsdWRl
IDx4ZW4vcGVyY3B1Lmg+CiAjaW5jbHVkZSA8eGVuL2NwdW1hc2suaD4KICNpbmNsdWRlIDx4ZW4v
cHJlZW1wdC5oPgogCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vcndsb2NrLmggYi94ZW4v
aW5jbHVkZS94ZW4vcndsb2NrLmgKaW5kZXggMzU2NTdjNTZjNC4uM2RmZWExYWMyYSAxMDA2NDQK
LS0tIGEveGVuL2luY2x1ZGUveGVuL3J3bG9jay5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9yd2xv
Y2suaApAQCAtMSw2ICsxLDcgQEAKICNpZm5kZWYgX19SV0xPQ0tfSF9fCiAjZGVmaW5lIF9fUldM
T0NLX0hfXwogCisjaW5jbHVkZSA8eGVuL3BlcmNwdS5oPgogI2luY2x1ZGUgPHhlbi9zcGlubG9j
ay5oPgogCiAjaW5jbHVkZSA8YXNtL2F0b21pYy5oPgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUv
eGVuL3NwaW5sb2NrLmggYi94ZW4vaW5jbHVkZS94ZW4vc3BpbmxvY2suaAppbmRleCBhODExYjcz
YmYzLi4yYzc0MTVlMjNhIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vc3BpbmxvY2suaAor
KysgYi94ZW4vaW5jbHVkZS94ZW4vc3BpbmxvY2suaApAQCAtNCw3ICs0LDYgQEAKICNpbmNsdWRl
IDxhc20vc3lzdGVtLmg+CiAjaW5jbHVkZSA8YXNtL3NwaW5sb2NrLmg+CiAjaW5jbHVkZSA8YXNt
L3R5cGVzLmg+Ci0jaW5jbHVkZSA8eGVuL3BlcmNwdS5oPgogCiAjaWZuZGVmIE5ERUJVRwogc3Ry
dWN0IGxvY2tfZGVidWcgewotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
