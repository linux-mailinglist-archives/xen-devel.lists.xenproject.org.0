Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8421C1073A
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 12:51:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLmnI-0005bo-Uu; Wed, 01 May 2019 10:48:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9pMH=TB=citrix.com=prvs=01726d3a8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hLmnH-0005aP-Uu
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 10:48:55 +0000
X-Inumbo-ID: b52f918e-6bfe-11e9-a79a-c70a89f204db
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b52f918e-6bfe-11e9-a79a-c70a89f204db;
 Wed, 01 May 2019 10:48:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,417,1549929600"; d="scan'208";a="84837307"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 1 May 2019 11:48:38 +0100
Message-ID: <20190501104839.21621-15-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190501104839.21621-1-ian.jackson@eu.citrix.com>
References: <20190501104839.21621-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH v2 14/15] cross builds: Build armhf
 kernels on amd64 hosts
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
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T3VyIGFybWhmIGhvc3RzIGFyZSBkZXZib2FyZHMgYW5kIHZlcnkgc2xvdywgYXMgd2VsbCBhcyBz
Y2FyY2UuICBJdAp0YWtlcyAxN2tzIG9yIHNvIGZvciBhIGtlcm5lbCBidWlsZC4gIFRoaXMgd2ls
bCBnbyAqbXVjaCogZmFzdGVyIG9uCmFuIGFtZDY0IGJveCBhbmQgd2UgaGF2ZSBsb3RzIG9mIHRo
b3NlIHRvby4KCnN0YW5kYWxvbmUtZ2VuZXJhdGUtZHVtcC1mbGlnaHQtcnVudmFycyBzaG93cyB0
aGF0IHRoZSBvbmx5IGNoYW5nZSBpcwp0byBjaGFuZ2UgaG9zdF9hcmNoIGZyb20gYXJtaGYgdG8g
YW1kNjQgaW4gYnVpbGQtYXJtaGYtcHZvcHMgam9icy4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNr
c29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3Jh
bGxAYXJtLmNvbT4KLS0tCnYyOiBGaXggdHlwbyBpbiBjb21taXQgbWVzc2FnZS4KLS0tCiBtZmkt
Y29tbW9uIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvbWZpLWNvbW1vbiBiL21maS1jb21tb24KaW5kZXggN2I1Yzg5NGYu
LjMwZjI2OTJkIDEwMDY0NAotLS0gYS9tZmktY29tbW9uCisrKyBiL21maS1jb21tb24KQEAgLTQy
NCw3ICs0MjQsNyBAQCBjcmVhdGVfYnVpbGRfam9icyAoKSB7CiAgICAgZmkKIAogICAgIGpvYl9j
cmVhdGVfYnVpbGRfY3Jvc3NhYmxlIGJ1aWxkLSRhcmNoLXB2b3BzIGJ1aWxkLWtlcm4gJGFyY2gg
ICAgICAgICAgICBcCi0gICAgICAgICAgICAgICAgLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKKyAgICAgICAgICAgICAgICBhcm1o
ZiBhbWQ2NCAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAogICAgICAgICAgICAgICAgIGtjb25maWdob3c9eGVuLWVuYWJsZS14ZW4tY29uZmlnICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgICAgICAgICAgICAgJFJVTlZBUlMgJEJVSUxE
X1JVTlZBUlMgJEJVSUxEX0xJTlVYX1JVTlZBUlMgJGFyY2hfcnVudmFycyAgIFwKICAgICAgICAg
ICAgICAgICAkaG9zdG9zX3J1bnZhcnMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
