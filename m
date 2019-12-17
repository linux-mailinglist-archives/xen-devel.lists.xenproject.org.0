Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B545B122E87
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 15:22:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihDgy-00025U-4G; Tue, 17 Dec 2019 14:19:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sBqe=2H=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ihDgx-00025P-4c
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 14:19:15 +0000
X-Inumbo-ID: 2ed77fd6-20d8-11ea-88e7-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ed77fd6-20d8-11ea-88e7-bc764e2007e4;
 Tue, 17 Dec 2019 14:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576592346;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=anwfHO9xoag/gbGfuJcNMc/9bJ8ktLhYhyaCyCmNxWk=;
 b=egzCvJo9Mn/G73AYN5HXvYX+grlJBJ5AETbR6SNCNiSoubKuI1xNEdMo
 oBlvJijuVqUmXIjDH1BWbGaAsDHLTuN/HJy3UAXnI97pJSOmXr2IB79Yf
 BgiZGv3G6nwZCB7a+IhrQoZ4xV6bF7dUP/aTDEhSJghLOuASCTZcfUqoG c=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XKsBbHQHjNgEJLE18f/oQKA6IJCfc6aUNVB4D+YjibCazPYuVzzmhMCh38OAEDyfcKzVFZM7RN
 6pLWTq7aWktMfm/Lnoo0uOsxJD6OnMPdIy/QAaB3BxRl/rImwWi8+n6HS9JXOgmAt7z5H4tjnv
 sh84Z03zhGCSaYwX+exA4Tq2mq71Rcpno7R+F/AQ8kyDAaBwezjjEIcY1Jq0DLBT4GYLE+D2QM
 sGVZZ7jJ7McmFurXFhiZD31uEtyVQnsBuZkEsKGRB/xnmtwpuC5HuIzmr0KvDuF/7p4DYealTp
 0sw=
X-SBRS: 2.7
X-MesageID: 10223725
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,325,1571716800"; d="scan'208";a="10223725"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 17 Dec 2019 14:18:43 +0000
Message-ID: <20191217141843.7016-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] 4.13.0: Update SUPPORT.md
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
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0t
LQogU1VQUE9SVC5tZCB8IDEwICsrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvU1VQUE9SVC5tZCBiL1NVUFBPUlQu
bWQKaW5kZXggZjdhN2E1NmMyOS4uYjI0NjQ5ZWYyZCAxMDA2NDQKLS0tIGEvU1VQUE9SVC5tZAor
KysgYi9TVVBQT1JULm1kCkBAIC05LDEzICs5LDEzIEBAIGZvciB0aGUgZGVmaW5pdGlvbnMgb2Yg
dGhlIHN1cHBvcnQgc3RhdHVzIGxldmVscyBldGMuCiAKICMgUmVsZWFzZSBTdXBwb3J0CiAKLSAg
ICBYZW4tVmVyc2lvbjogNC4xMy1yYwotICAgIEluaXRpYWwtUmVsZWFzZTogbi9hCi0gICAgU3Vw
cG9ydGVkLVVudGlsOiBUQkQKLSAgICBTZWN1cml0eS1TdXBwb3J0LVVudGlsOiBVbnJlbGVhc2Vk
IC0gbm90IHlldCBzZWN1cml0eS1zdXBwb3J0ZWQKKyAgICBYZW4tVmVyc2lvbjogNC4xMworICAg
IEluaXRpYWwtUmVsZWFzZTogMjAxOS0xMi0xOAorICAgIFN1cHBvcnRlZC1VbnRpbDogMjAyMS0w
Ni0xOAorICAgIFNlY3VyaXR5LVN1cHBvcnQtVW50aWw6IDIwMjItMTItMTgKIAogUmVsZWFzZSBO
b3RlcwotOiA8YSBocmVmPSJodHRwczovL3dpa2kueGVucHJvamVjdC5vcmcvd2lraS9YZW5fUHJv
amVjdF9YLllZX1JlbGVhc2VfTm90ZXMiPlJOPC9hPgorOiA8YSBocmVmPSJodHRwczovL3dpa2ku
eGVucHJvamVjdC5vcmcvd2lraS9YZW5fUHJvamVjdF80LjEzX1JlbGVhc2VfTm90ZXMiPlJOPC9h
PgogCiAjIEZlYXR1cmUgU3VwcG9ydAogCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
