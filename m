Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5900F68884
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 14:05:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hmzfQ-0001BL-VT; Mon, 15 Jul 2019 12:01:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cAUX=VM=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hmzfP-0001BG-Fm
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 12:01:15 +0000
X-Inumbo-ID: 3c2cd37a-a6f8-11e9-919c-475233fb0d0b
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c2cd37a-a6f8-11e9-919c-475233fb0d0b;
 Mon, 15 Jul 2019 12:01:10 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Uz0aOrVzZz+kgDMVovt1lbapuCzrdA9BZZzz3HNkhOW/hHzlIWh5Z1h5Vt803FKzrFCoVL7zbL
 br3FaqMgpnac5YQjVn7LgpmKu6bTwXVXl6SzkucxpuBjp70ZcGKE8YhlAii1d5EgbNcmaEfKRk
 QI11azNBlcPUrL0Hz8YOxj0STcWVJLxdnwt6Zqw9rn84g9/4eJiAoggKjDv6LA4zY48bSsveY3
 nXnoaRon2hWrcc0+UmLWCNdOJXvbQwzggs8KYFyhrZ5mnZT0q318IhwRcoUXSa9s2T26Dlb4Mg
 BC8=
X-SBRS: 2.7
X-MesageID: 2956775
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,493,1557201600"; 
   d="scan'208";a="2956775"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 15 Jul 2019 13:01:01 +0100
Message-ID: <20190715120101.4080-1-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] MAINTAINERS: Make myself libxl golang
 binding maintainer
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
 Konrad Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgot
LS0KdjI6Ci0gUHV0IGluIGFscGhhYmV0aWNhbCBvcmRlcgotIFJlcGxhY2Ugc3BhY2VzIHdpdGgg
dGFicwoKQ0M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBjaXRyaXguY29tPgpDQzogV2VpIExp
dSA8d2xAeGVuLm9yZz4KQ0M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+CkNDOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNDOiBUaW0gRGVlZ2FuIDx0
aW1AeGVuLm9yZz4KQ0M6IEtvbnJhZCBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpDQzog
U3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDQzogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCiBNQUlOVEFJTkVSUyB8IDUgKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBi
L01BSU5UQUlORVJTCmluZGV4IGI4ZTRkYWFlNDEuLmYxODU2N2I1NmEgMTAwNjQ0Ci0tLSBhL01B
SU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC0yMzQsNiArMjM0LDExIEBAIFM6CVN1cHBv
cnRlZAogRjoJeGVuL2FyY2gveDg2L2RlYnVnLmMKIEY6CXRvb2xzL2RlYnVnZ2VyL2dkYnN4Lwog
CitHT0xBTkcgQklORElOR1MKK006CUdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4
LmNvbT4KK1M6CU1haW50YWluZWQKK0Y6CXRvb2xzL2dvbGFuZworCiBJTlRFTChSKSBUUlVTVEVE
IEVYRUNVVElPTiBURUNITk9MT0dZIChUWFQpCiBNOglHYW5nIFdlaSA8Z2FuZy53ZWlAaW50ZWwu
Y29tPgogTToJU2hhbmUgV2FuZyA8c2hhbmUud2FuZ0BpbnRlbC5jb20+Ci0tIAoyLjIwLjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
