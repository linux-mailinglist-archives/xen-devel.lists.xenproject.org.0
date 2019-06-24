Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 458B7510A8
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2019 17:36:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfQy2-00025P-Q6; Mon, 24 Jun 2019 15:33:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EXrY=UX=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hfQy0-00024m-QE
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2019 15:33:12 +0000
X-Inumbo-ID: 5fe7a363-9695-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5fe7a363-9695-11e9-8980-bc764e045a96;
 Mon, 24 Jun 2019 15:33:11 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: LBSCboi4CmuHI0ZhLiS8dKEbwlqxbx/9i5oDZDUhy33jUIWCOhvr+6HzNIgMvgFQbSyuSavqlV
 nHsMJGsfvqJnU8/yJ6hXdIyM3OcAG16J/TgiTRdFfCcMjd99ksJCb8u48+J7n8fdBjTaiOmIwk
 bXtf/c4aV3nQpOICgwX0AsbNtTLaRxmt0tPayd9SfTLFam16TTkqKIupJvX9YizmYQUNSBdqm3
 JhFhjiR+25iujCBGX+2XniSWjRq8fqvy0jytsojuzL9Iy+/iHvrR+J4w2a2DTxOXizR8ZAtmJX
 x10=
X-SBRS: 2.7
X-MesageID: 2148103
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,412,1557201600"; 
   d="scan'208";a="2148103"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 24 Jun 2019 16:32:55 +0100
Message-ID: <20190624153257.20163-7-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190624153257.20163-1-anthony.perard@citrix.com>
References: <20190624153257.20163-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PULL 6/8] xen: Drop includes of xen/hvm/params.h
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

eGVuLW1hcGNhY2hlLmMgZG9lc24ndCBuZWVkcyBwYXJhbXMuaC4KCnhlbi1odm0uYyB1c2VzIGRl
ZmluZXMgYXZhaWxhYmxlIGluIHBhcmFtcy5oIGJ1dCBzbyBpcyB4ZW5fY29tbW9uLmgKd2hpY2gg
aXMgaW5jbHVkZWQgYmVmb3JlLiBIVk1fUEFSQU1fKiBmbGFncyBhcmUgb25seSBuZWVkZWQgdG8g
bWFrZQp4Y19odm1fcGFyYW1fe2dldCxzZXR9IGNhbGxzIHNvIGluY2x1ZGluZyBvbmx5IHhlbmN0
cmwuaCwgd2hpY2ggaXMKd2hlcmUgdGhlIGRlZmluaXRpb24gdGhlIGZ1bmN0aW9uIGlzLCBzaG91
bGQgYmUgZW5vdWdoLgooeGVuY3RybC5oIGRvZXMgaW5jbHVkZSBwYXJhbXMuaCkKClNpZ25lZC1v
ZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgpSZXZpZXdl
ZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KTWVzc2FnZS1JZDog
PDIwMTkwNjE4MTEyMzQxLjUxMy00LWFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQogaHcv
aTM4Ni94ZW4veGVuLWh2bS5jICAgICAgfCAxIC0KIGh3L2kzODYveGVuL3hlbi1tYXBjYWNoZS5j
IHwgMiAtLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2h3
L2kzODYveGVuL3hlbi1odm0uYyBiL2h3L2kzODYveGVuL3hlbi1odm0uYwppbmRleCBlZDljMzdj
NzJkLi40NjlmMTI2MGE0IDEwMDY0NAotLS0gYS9ody9pMzg2L3hlbi94ZW4taHZtLmMKKysrIGIv
aHcvaTM4Ni94ZW4veGVuLWh2bS5jCkBAIC0yNyw3ICsyNyw2IEBACiAjaW5jbHVkZSAiZXhlYy9h
ZGRyZXNzLXNwYWNlcy5oIgogCiAjaW5jbHVkZSA8eGVuL2h2bS9pb3JlcS5oPgotI2luY2x1ZGUg
PHhlbi9odm0vcGFyYW1zLmg+CiAjaW5jbHVkZSA8eGVuL2h2bS9lODIwLmg+CiAKIC8vI2RlZmlu
ZSBERUJVR19YRU5fSFZNCmRpZmYgLS1naXQgYS9ody9pMzg2L3hlbi94ZW4tbWFwY2FjaGUuYyBi
L2h3L2kzODYveGVuL3hlbi1tYXBjYWNoZS5jCmluZGV4IDI1NDc1OWY3NzYuLmRjNzNjODZjNjEg
MTAwNjQ0Ci0tLSBhL2h3L2kzODYveGVuL3hlbi1tYXBjYWNoZS5jCisrKyBiL2h3L2kzODYveGVu
L3hlbi1tYXBjYWNoZS5jCkBAIC0xNyw4ICsxNyw2IEBACiAjaW5jbHVkZSAiaHcveGVuL3hlbi1s
ZWdhY3ktYmFja2VuZC5oIgogI2luY2x1ZGUgInFlbXUvYml0bWFwLmgiCiAKLSNpbmNsdWRlIDx4
ZW4vaHZtL3BhcmFtcy5oPgotCiAjaW5jbHVkZSAic3lzZW11L3hlbi1tYXBjYWNoZS5oIgogI2lu
Y2x1ZGUgInRyYWNlLmgiCiAKLS0gCkFudGhvbnkgUEVSQVJECgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
