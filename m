Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DB245B5E
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 13:27:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbkKK-0007SW-76; Fri, 14 Jun 2019 11:25:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y8Mf=UN=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hbkKI-0007Ru-1y
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 11:24:58 +0000
X-Inumbo-ID: 087e53c4-8e97-11e9-b1c3-5f976f97b11a
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 087e53c4-8e97-11e9-b1c3-5f976f97b11a;
 Fri, 14 Jun 2019 11:24:54 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0KqVKt5374Sipua02at4gsgz2QKNRA27APFGfR8P6oKgLKR12UccPvWqRn0ujONVcLQQVbG+jS
 bDTOIIaRp3PsdKfCUgmbn9ObL7UJn5WyaGLxxsJAoU4BluEwJYLJGmQtGHifB45foY39A5T4xC
 vxo7c4dEC4lE7i9bhIMudTXcmEaPLZL6Z3WbxFBq03bQvVcWTc2FwuaQgYT0xuMmZeTknNWGXN
 uaqr2H3YBtACYvMO7xS7mEP81IqAoJNwai33S6jr9vLrBDopE5net5IV9XUwDYhSb1e6UBoFJj
 z5Y=
X-SBRS: 2.7
X-MesageID: 1737470
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,373,1557201600"; 
   d="scan'208";a="1737470"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 14 Jun 2019 12:24:37 +0100
Message-ID: <20190614112444.29980-9-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190614112444.29980-1-anthony.perard@citrix.com>
References: <20190614112444.29980-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 08/15] libxl: Comment libxl__dm_spawn_state
 aboud init and dispose
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
Cc: Anthony
 PERARD <anthony.perard@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+
Ci0tLQogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCB8IDIgKysKIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5h
bC5oIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAppbmRleCA4NDYyMjdjM2NkLi4wMDQ2
YjMwNTQ5IDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCisrKyBiL3Rv
b2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKQEAgLTM5MjAsNiArMzkyMCw4IEBAIHR5cGVkZWYg
c3RydWN0IGxpYnhsX19kbV9zcGF3bl9zdGF0ZSBsaWJ4bF9fZG1fc3Bhd25fc3RhdGU7CiB0eXBl
ZGVmIHZvaWQgbGlieGxfX2RtX3NwYXduX2NiKGxpYnhsX19lZ2MgKmVnYywgbGlieGxfX2RtX3Nw
YXduX3N0YXRlKiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IHJjIC8qIGlm
ICEwLCBlcnJvciB3YXMgbG9nZ2VkICovKTsKIAorLyogQ2FsbCBkbXNzX2luaXQgYW5kIGRtc3Nf
ZGlzcG9zZSB0byBpbml0aWFsaXNlIGFuZCBkaXNwb3NlIG9mCisgKiBsaWJ4bF9fZG1fc3Bhd25f
c3RhdGUgKi8KIHN0cnVjdCBsaWJ4bF9fZG1fc3Bhd25fc3RhdGUgewogICAgIC8qIG1peGVkIC0g
c3Bhd24uYW8gbXVzdCBiZSBpbml0aWFsaXNlZCBieSB1c2VyOyByZXN0IGlzIHByaXZhdGU6ICov
CiAgICAgbGlieGxfX3NwYXduX3N0YXRlIHNwYXduOwotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
