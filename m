Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA034E686
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 12:57:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heHBw-0006Pi-Kl; Fri, 21 Jun 2019 10:54:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Su6Z=UU=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1heHBu-0006PS-Nz
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 10:54:46 +0000
X-Inumbo-ID: fb549d3c-9412-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fb549d3c-9412-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 10:54:45 +0000 (UTC)
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
IronPort-SDR: uAUANqurQVuiHmctksfiUbTsh9YirwrEq7cQDny0WDE1k5j9VTlY8PligOUtu0II1ORd2cCqUV
 PtRSr2qv6xsJGnBEzvO15j1hpPRucJZdtf/b2z9GMmJvVpP4UOvObJoD4CXcVMkhECq7MPC48Y
 KQKSqf8O/oDBWExJA+JngQyDDKK4RtaEG31+kAyAntkOaoWeIiXI099K/rZftP7CO4ieYB81GZ
 UdKVtxAUUIiRLQUVi7pp4pC4SioD312mVTHv8SfQKFLyHbii7Jphj319cPJEMnpF6wkqow2MBy
 DFk=
X-SBRS: 2.7
X-MesageID: 2052042
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,400,1557201600"; 
   d="scan'208";a="2052042"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 21 Jun 2019 11:54:40 +0100
Message-ID: <20190621105441.3025-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190621105441.3025-1-anthony.perard@citrix.com>
References: <20190621105441.3025-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 1/2] Revert xen/io/ring.h of "Clean up a few
 header guard symbols"
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paul Durrant <paul.durrant@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyByZXZlcnRzIGNoYW5nZXMgdG8gaW5jbHVkZS9ody94ZW4vaW8vcmluZy5oIGZyb20gY29t
bWl0CjM3Njc3ZDdkYjM5YTNjMjUwYWQ2NjFkMDBmYjdjM2I1OWQwNDdiMWYuCgpGb2xsb3dpbmcg
Mzc2NzdkN2RiMyAiQ2xlYW4gdXAgYSBmZXcgaGVhZGVyIGd1YXJkIHN5bWJvbHMiLCBRRU1VIHN0
YXJ0CnRvIGZhaWwgdG8gYnVpbGQ6CgpJbiBmaWxlIGluY2x1ZGVkIGZyb20gfi94ZW4vdG9vbHMv
Li4vdG9vbHMvaW5jbHVkZS94ZW4vaW8vYmxraWYuaDozMTowLAogICAgICAgICAgICAgICAgIGZy
b20gfi94ZW4vdG9vbHMvcWVtdS14ZW4tZGlyL2h3L2Jsb2NrL3hlbl9ibGtpZi5oOjUsCiAgICAg
ICAgICAgICAgICAgZnJvbSB+L3hlbi90b29scy9xZW11LXhlbi1kaXIvaHcvYmxvY2sveGVuLWJs
b2NrLmM6MjI6Cn4veGVuL3Rvb2xzLy4uL3Rvb2xzL2luY2x1ZGUveGVuL2lvL3JpbmcuaDo2ODow
OiBlcnJvcjogIl9fQ09OU1RfUklOR19TSVpFIiByZWRlZmluZWQgWy1XZXJyb3JdCiAjZGVmaW5l
IF9fQ09OU1RfUklOR19TSVpFKF9zLCBfc3opIFwKCkluIGZpbGUgaW5jbHVkZWQgZnJvbSB+L3hl
bi90b29scy9xZW11LXhlbi1kaXIvaHcvYmxvY2sveGVuX2Jsa2lmLmg6NDowLAogICAgICAgICAg
ICAgICAgIGZyb20gfi94ZW4vdG9vbHMvcWVtdS14ZW4tZGlyL2h3L2Jsb2NrL3hlbi1ibG9jay5j
OjIyOgp+L3hlbi90b29scy9xZW11LXhlbi1kaXIvaW5jbHVkZS9ody94ZW4vaW8vcmluZy5oOjY2
OjA6IG5vdGU6IHRoaXMgaXMgdGhlIGxvY2F0aW9uIG9mIHRoZSBwcmV2aW91cyBkZWZpbml0aW9u
CiAjZGVmaW5lIF9fQ09OU1RfUklOR19TSVpFKF9zLCBfc3opIFwKClRoZSBpc3N1ZSBpcyB0aGF0
IHNvbWUgcHVibGljIHhlbiBoZWFkZXJzIGhhdmUgYmVlbiBpbXBvcnRlZCAoYnkKZjY1ZWFkYjYz
OSAieGVuOiBpbXBvcnQgcmluZy5oIGZyb20geGVuIikgYnV0IG5vdCBhbGwuIFdpdGggdGhlIGNo
YW5nZQppbiB0aGUgZ3VhcmRzIHN5bWJvbGUsIHRoZSByaW5nLmggaGVhZGVyIHN0YXJ0IHRvIGJl
IGltcG9ydGVkIHR3aWNlLgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnku
cGVyYXJkQGNpdHJpeC5jb20+Ci0tLQpDQzogTWFya3VzIEFybWJydXN0ZXIgPGFybWJydUByZWRo
YXQuY29tPgotLS0KCk5vdGVzOgogICAgdjM6CiAgICAtIG5ldyBwYXRjaCwgcmVwbGFjZSAieGVu
OiBGaXggYnVpbGQgd2l0aCBwdWJsaWMgaGVhZGVycyIgZnJvbSBwcmV2aW91cwogICAgICBwYXRj
aCBzZXJpZXMgdmVyc2lvbgogICAgLSBSZXZlcnQgcHJvYmxlbWF0aWMgY2hhbmdlIGluc3RlYWQu
CgogaW5jbHVkZS9ody94ZW4vaW8vcmluZy5oIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody94
ZW4vaW8vcmluZy5oIGIvaW5jbHVkZS9ody94ZW4vaW8vcmluZy5oCmluZGV4IDYyYWJmZDdhNmUu
LjFhZGFjZjA5ZjkgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvaHcveGVuL2lvL3JpbmcuaAorKysgYi9p
bmNsdWRlL2h3L3hlbi9pby9yaW5nLmgKQEAgLTI0LDggKzI0LDggQEAKICAqIFRpbSBEZWVnYW4g
YW5kIEFuZHJldyBXYXJmaWVsZCBOb3ZlbWJlciAyMDA0LgogICovCiAKLSNpZm5kZWYgWEVOX1BV
QkxJQ19JT19SSU5HX0gKLSNkZWZpbmUgWEVOX1BVQkxJQ19JT19SSU5HX0gKKyNpZm5kZWYgX19Y
RU5fUFVCTElDX0lPX1JJTkdfSF9fCisjZGVmaW5lIF9fWEVOX1BVQkxJQ19JT19SSU5HX0hfXwog
CiAvKgogICogV2hlbiAjaW5jbHVkZSdpbmcgdGhpcyBoZWFkZXIsIHlvdSBuZWVkIHRvIHByb3Zp
ZGUgdGhlIGZvbGxvd2luZwpAQCAtNDY5LDcgKzQ2OSw3IEBAIHN0cnVjdCBuYW1lIyNfZGF0YV9p
bnRmIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKIH07ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKIERFRklORV9YRU5fRkxFWF9SSU5HKG5hbWUpCiAK
LSNlbmRpZiAvKiBYRU5fUFVCTElDX0lPX1JJTkdfSCAqLworI2VuZGlmIC8qIF9fWEVOX1BVQkxJ
Q19JT19SSU5HX0hfXyAqLwogCiAvKgogICogTG9jYWwgdmFyaWFibGVzOgotLSAKQW50aG9ueSBQ
RVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
