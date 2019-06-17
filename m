Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD7448879
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 18:14:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcuEF-00045C-OY; Mon, 17 Jun 2019 16:11:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JT4l=UQ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hcuED-00044w-Fl
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 16:11:29 +0000
X-Inumbo-ID: 8ec95016-911a-11e9-8462-737418970a11
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8ec95016-911a-11e9-8462-737418970a11;
 Mon, 17 Jun 2019 16:11:26 +0000 (UTC)
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
IronPort-SDR: 8nm46r+DritebEq5LOJy7A69e1h7GCzUoMPm0FrVLUzrPPeR+dSeHH5juNDWhnFW+XNYH/2ywN
 dQYw35/RMOdocMCezqxCwY3s4Vh8sW0y6B+5rOpByBE9Qxd/qeQVUBO/bAdP9d6AhUupW24XZL
 ghN/iM/ysNm6dWsj3qZTMHIr/hG11U4fwq7VuSBwS8wTkrQH4qSdajt+lQJoCsSX5pLwbYu7aO
 5HAgHRny4fdA7b6NRVkxXVn0UvgeFJX8hwOdQz1UAhst60vaRpx316CAnbdL+9mL2YyXG74rBG
 0So=
X-SBRS: 2.7
X-MesageID: 1840717
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,385,1557201600"; 
   d="scan'208";a="1840717"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 17 Jun 2019 17:10:50 +0100
Message-ID: <20190617161050.4684-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] Config.mk: update OVMF to edk2-stable201905
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
 Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VXBkYXRlIHRvIHRoZSBsYXRlc3Qgc3RhYmxlIHRhZy4KClNpZ25lZC1vZmYtYnk6IEFudGhvbnkg
UEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KIENvbmZpZy5tayB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL0NvbmZpZy5tayBiL0NvbmZpZy5tawppbmRleCA0MTcwMzlkN2Y2Li4wZmE0NTkxMzc5IDEw
MDY0NAotLS0gYS9Db25maWcubWsKKysrIGIvQ29uZmlnLm1rCkBAIC0yNzQsNyArMjc0LDcgQEAg
UUVNVV9UUkFESVRJT05BTF9VUkwgPz0gZ2l0Oi8veGVuYml0cy54ZW4ub3JnL3FlbXUteGVuLXRy
YWRpdGlvbmFsLmdpdAogU0VBQklPU19VUFNUUkVBTV9VUkwgPz0gZ2l0Oi8veGVuYml0cy54ZW4u
b3JnL3NlYWJpb3MuZ2l0CiBNSU5JT1NfVVBTVFJFQU1fVVJMID89IGdpdDovL3hlbmJpdHMueGVu
Lm9yZy9taW5pLW9zLmdpdAogZW5kaWYKLU9WTUZfVVBTVFJFQU1fUkVWSVNJT04gPz0gZWY1Mjll
NmFiN2MzMTI5MGEzMzA0NWJiMWYxODM3NDQ3Y2MwZWI1NgorT1ZNRl9VUFNUUkVBTV9SRVZJU0lP
TiA/PSAyMGQyZTVhMTI1ZTM0ZmM4NTAxMDI2NjEzYTcxNTQ5YjJhMWEzZTU0CiBRRU1VX1VQU1RS
RUFNX1JFVklTSU9OID89IG1hc3RlcgogTUlOSU9TX1VQU1RSRUFNX1JFVklTSU9OID89IDBiNGI3
ODk3ZTA4Yjk2N2EwOWJlZDIwMjhhNzlmYWJmZjgyMzQyZGQKIAotLSAKQW50aG9ueSBQRVJBUkQK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
