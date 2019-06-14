Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF9E45B68
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 13:28:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbkKD-0007QT-P8; Fri, 14 Jun 2019 11:24:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y8Mf=UN=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hbkKC-0007QA-2p
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 11:24:52 +0000
X-Inumbo-ID: 04842d70-8e97-11e9-b1fe-37d331339edf
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 04842d70-8e97-11e9-b1fe-37d331339edf;
 Fri, 14 Jun 2019 11:24:48 +0000 (UTC)
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
IronPort-SDR: /KsnXc/7nM74rGBfYlgkBO5FOjSlu2K4d4lo5tPjK0TjceeXgNZtIzX+RgUdbwBtlk+9Rr4/E7
 5sLqiIWG/b+Wn6hbTRm8t/HAThHFu4ZD3Wl2v1mq/E/vQPtWsSQSyW3bqTBl4mEfBEEhHy2lHj
 JW0xZ7kIql6rIh4VtcPF4kk9SYqrGqKsPbD2p2keNGa6XHV6fYE8DtdRrTyG3516uoeduAZkkP
 0RAIGNKg55AHFRgnp58W8BvZD7Obm7SmLyxzNuO5FRETDLdYrtQ4qoll5sLQtCAcWk4qf/9JYc
 mHk=
X-SBRS: 2.7
X-MesageID: 1737461
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,373,1557201600"; 
   d="scan'208";a="1737461"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 14 Jun 2019 12:24:31 +0100
Message-ID: <20190614112444.29980-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190614112444.29980-1-anthony.perard@citrix.com>
References: <20190614112444.29980-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 02/15] libxl: Remove unused variable in
 libxl__device_pci_add_xenstore
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

KmRldmljZSBpc24ndCB1c2VkLgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhv
bnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQogdG9vbHMvbGlieGwvbGlieGxfcGNpLmMgfCA0IC0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xp
YnhsL2xpYnhsX3BjaS5jIGIvdG9vbHMvbGlieGwvbGlieGxfcGNpLmMKaW5kZXggNGVjNjg3Mjc5
OC4uNjc2NzdkN2I1NSAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfcGNpLmMKKysrIGIv
dG9vbHMvbGlieGwvbGlieGxfcGNpLmMKQEAgLTExNSw3ICsxMTUsNiBAQCBzdGF0aWMgaW50IGxp
YnhsX19kZXZpY2VfcGNpX2FkZF94ZW5zdG9yZShsaWJ4bF9fZ2MgKmdjLCB1aW50MzJfdCBkb21p
ZCwgbGlieGxfZAogICAgIGNoYXIgKm51bV9kZXZzLCAqYmVfcGF0aDsKICAgICBpbnQgbnVtID0g
MDsKICAgICB4c190cmFuc2FjdGlvbl90IHQgPSBYQlRfTlVMTDsKLSAgICBsaWJ4bF9fZGV2aWNl
ICpkZXZpY2U7CiAgICAgaW50IHJjOwogICAgIGxpYnhsX2RvbWFpbl9jb25maWcgZF9jb25maWc7
CiAgICAgbGlieGxfZGV2aWNlX3BjaSBwY2lkZXZfc2F2ZWQ7CkBAIC0xNDksOSArMTQ4LDYgQEAg
c3RhdGljIGludCBsaWJ4bF9fZGV2aWNlX3BjaV9hZGRfeGVuc3RvcmUobGlieGxfX2djICpnYywg
dWludDMyX3QgZG9taWQsIGxpYnhsX2QKICAgICBpZiAoIXN0YXJ0aW5nKQogICAgICAgICBmbGV4
YXJyYXlfYXBwZW5kX3BhaXIoYmFjaywgInN0YXRlIiwgR0NTUFJJTlRGKCIlZCIsIFhlbmJ1c1N0
YXRlUmVjb25maWd1cmluZykpOwogCi0gICAgR0NORVcoZGV2aWNlKTsKLSAgICBsaWJ4bF9fZGV2
aWNlX2Zyb21fcGNpZGV2KGdjLCBkb21pZCwgcGNpZGV2LCBkZXZpY2UpOwotCiAgICAgbG9jayA9
IGxpYnhsX19sb2NrX2RvbWFpbl91c2VyZGF0YShnYywgZG9taWQpOwogICAgIGlmICghbG9jaykg
ewogICAgICAgICByYyA9IEVSUk9SX0xPQ0tfRkFJTDsKLS0gCkFudGhvbnkgUEVSQVJECgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
