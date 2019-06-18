Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8775249F21
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 13:27:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdCDR-0001W6-PX; Tue, 18 Jun 2019 11:23:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OpMR=UR=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hdCDQ-0001Vu-5T
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 11:23:52 +0000
X-Inumbo-ID: 8b8cf30c-91bb-11e9-b404-0f70dbafb896
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b8cf30c-91bb-11e9-b404-0f70dbafb896;
 Tue, 18 Jun 2019 11:23:50 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: OcJzgzlo3IL+pq/7CWnXhz+sREFwNVBJeXlnOdmmpNoIinHrL60jbWq6F+AsxmGCJwTS79wgB5
 sY21hff+x2wajYBwOU/PP/fqYsvCoHGITr1FmHrtvA8WEQ/OlJ9FleIe1CWpv825Dc7r1u81Ps
 YIDUtPJcvDu5OU5Xc4niwoYu6Ys1YMKF6V6xVN1H7AKn8tafJ6czECiw1lsKXVEkIbXUDt5Ch2
 aVLHGbfweJiU++DpAufBN+d5IjAZhFpVe1EphbfOF+KBfivJPBBM+gq5oXPS/xv9E/Zve1iFAC
 /BU=
X-SBRS: 2.7
X-MesageID: 1889152
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,389,1557201600"; 
   d="scan'208";a="1889152"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 18 Jun 2019 12:23:40 +0100
Message-ID: <20190618112341.513-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190618112341.513-1-anthony.perard@citrix.com>
References: <20190618112341.513-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 3/4] xen: Drop includes of xen/hvm/params.h
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
 Paul Durrant <paul.durrant@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
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
ZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KCk5v
dGVzOgogICAgdjI6CiAgICAtIG5ldyBwYXRjaCByZXBsYWNpbmcgInhlbjogSW1wb3J0IFhlbiBw
dWJsaWMgaGVhZGVycyB1c2VkIGJ5IHhlbi1odm0uYyIKICAgIC0gb25seSBkcm9wIGluY2x1ZGVz
IG9mIHBhcmFtcy5oLCBhbmQgZG9uJ3QgaW1wb3J0IHRoZSBvdGhlciB0d287CiAgICBpb3JlcS5o
IGlzIGFuIGludGVyZmFjZSB3aXRoIFhlbjsgZTgyMC5oIGlzIGp1c3QgdXNlZCBieSBRRU1VIHRv
IGZpZ3VyZQogICAgb3V0IHRoZSBndWVzdCBtZW1vcnkgbGF5b3V0IHdpdGhvdXQgcHJvcGVyIGNv
bW11bmljYXRpb24gd2l0aCB0aGUgWGVuCiAgICB0b29sc3RhY2tzIG9yIHNvbWV0aGluZyBsaWtl
IHRoYXQuCgogaHcvaTM4Ni94ZW4veGVuLWh2bS5jICAgICAgfCAxIC0KIGh3L2kzODYveGVuL3hl
bi1tYXBjYWNoZS5jIHwgMiAtLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2h3L2kzODYveGVuL3hlbi1odm0uYyBiL2h3L2kzODYveGVuL3hlbi1odm0uYwpp
bmRleCAyOTM5MTIyZTdjLi5hZTNkZWI0ZWYzIDEwMDY0NAotLS0gYS9ody9pMzg2L3hlbi94ZW4t
aHZtLmMKKysrIGIvaHcvaTM4Ni94ZW4veGVuLWh2bS5jCkBAIC0yNyw3ICsyNyw2IEBACiAjaW5j
bHVkZSAiZXhlYy9hZGRyZXNzLXNwYWNlcy5oIgogCiAjaW5jbHVkZSA8eGVuL2h2bS9pb3JlcS5o
PgotI2luY2x1ZGUgPHhlbi9odm0vcGFyYW1zLmg+CiAjaW5jbHVkZSA8eGVuL2h2bS9lODIwLmg+
CiAKIC8vI2RlZmluZSBERUJVR19YRU5fSFZNCmRpZmYgLS1naXQgYS9ody9pMzg2L3hlbi94ZW4t
bWFwY2FjaGUuYyBiL2h3L2kzODYveGVuL3hlbi1tYXBjYWNoZS5jCmluZGV4IDI1NDc1OWY3NzYu
LmRjNzNjODZjNjEgMTAwNjQ0Ci0tLSBhL2h3L2kzODYveGVuL3hlbi1tYXBjYWNoZS5jCisrKyBi
L2h3L2kzODYveGVuL3hlbi1tYXBjYWNoZS5jCkBAIC0xNyw4ICsxNyw2IEBACiAjaW5jbHVkZSAi
aHcveGVuL3hlbi1sZWdhY3ktYmFja2VuZC5oIgogI2luY2x1ZGUgInFlbXUvYml0bWFwLmgiCiAK
LSNpbmNsdWRlIDx4ZW4vaHZtL3BhcmFtcy5oPgotCiAjaW5jbHVkZSAic3lzZW11L3hlbi1tYXBj
YWNoZS5oIgogI2luY2x1ZGUgInRyYWNlLmgiCiAKLS0gCkFudGhvbnkgUEVSQVJECgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
