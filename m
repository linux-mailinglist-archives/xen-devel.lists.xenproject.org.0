Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA22783C2
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 05:59:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hrwlL-0001s6-C9; Mon, 29 Jul 2019 03:55:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NMPo=V2=intel.com=shane.wang@srs-us1.protection.inumbo.net>)
 id 1hruE7-0007Gk-Rs
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 01:13:23 +0000
X-Inumbo-ID: 0e90e5ad-b19e-11e9-8980-bc764e045a96
Received: from mga06.intel.com (unknown [134.134.136.31])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0e90e5ad-b19e-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 01:13:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jul 2019 18:13:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,320,1559545200"; d="scan'208";a="165280113"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga008.jf.intel.com with ESMTP; 28 Jul 2019 18:13:20 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 28 Jul 2019 18:13:20 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 28 Jul 2019 18:13:20 -0700
Received: from shsmsx105.ccr.corp.intel.com (10.239.4.158) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 28 Jul 2019 18:13:19 -0700
Received: from shsmsx107.ccr.corp.intel.com ([169.254.9.65]) by
 SHSMSX105.ccr.corp.intel.com ([169.254.11.15]) with mapi id 14.03.0439.000;
 Mon, 29 Jul 2019 09:13:18 +0800
From: "Wang, Shane" <shane.wang@intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] tboot: remove maintainers and declare orphaned
Thread-Index: AQHVQvAfzF+XAI8JWkeiphcaaFrL/Kbgz3kQ
Date: Mon, 29 Jul 2019 01:13:17 +0000
Message-ID: <3AB6CE7F274E534CAFD089D127A8A1FC3A97150F@SHSMSX107.ccr.corp.intel.com>
References: <20190725135112.83569-1-roger.pau@citrix.com>
In-Reply-To: <20190725135112.83569-1-roger.pau@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMTVkNWEyNjktYTNiOC00ZTkyLThlMTYtYTYyZWI3NDBkNWM2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiZEtxaUx6OGpPckhqN2loMG1UWWxuWTVRQmUwVGJKaDNCenQrT1FqSHYzbFdFQVFcLzhGa3ltc1kwTTc0eWtcLzJ3In0=
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Jul 2019 03:55:50 +0000
Subject: Re: [Xen-devel] [PATCH] tboot: remove maintainers and declare
 orphaned
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Gang Wei <gang.wei@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QUNLZWQgYnk6IFNoYW5lIFdhbmcgPHNoYW5lLndhbmdAaW50ZWwuY29tPg0KDQotLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogUm9nZXIgUGF1IE1vbm5lIFttYWlsdG86cm9nZXIucGF1
QGNpdHJpeC5jb21dIA0KU2VudDogVGh1cnNkYXksIEp1bHkgMjUsIDIwMTkgOTo1MSBQTQ0KVG86
IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KQ2M6IFJvZ2VyIFBhdSBNb25uZSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+OyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPjsgR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPjsgSWFuIEph
Y2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+OyBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPjsgS29ucmFkIFJ6
ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgU3RlZmFubyBTdGFiZWxsaW5p
IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgVGltIERlZWdhbiA8dGltQHhlbi5vcmc+OyBXZWkg
TGl1IDx3bEB4ZW4ub3JnPjsgR2FuZyBXZWkgPGdhbmcud2VpQGludGVsLmNvbT47IFdhbmcsIFNo
YW5lIDxzaGFuZS53YW5nQGludGVsLmNvbT4NClN1YmplY3Q6IFtQQVRDSF0gdGJvb3Q6IHJlbW92
ZSBtYWludGFpbmVycyBhbmQgZGVjbGFyZSBvcnBoYW5lZA0KDQpHYW5nIFdlaSBJbnRlbCBlbWFp
bCBhZGRyZXNzIGhhcyBiZWVuIGJvdW5jaW5nIGZvciBzb21lIHRpbWUgbm93LCBhbmQgdGhlIG90
aGVyIG1haW50YWluZXIgaXMgbm9uLXJlc3BvbnNpdmUgdG8gcGF0Y2hlcyBbMF0sIHNvIHJlbW92
ZSBtYWludGFpbmVycyBhbmQgZGVjbGFyZSBJTlRFTChSKSBUUlVTVEVEIEVYRUNVVElPTiBURUNI
Tk9MT0dZIChUWFQpIG9ycGhhbmVkLg0KDQpbMF0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA1L21zZzAwNTYzLmh0bWwNCg0KU2lnbmVk
LW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQotLS0NCkNj
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KQ2M6IEdlb3JnZSBE
dW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4NCkNjOiBJYW4gSmFja3NvbiA8aWFu
LmphY2tzb25AZXUuY2l0cml4LmNvbT4NCkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+DQpDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4NCkNjOiBLb25yYWQg
Unplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+DQpDYzogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4u
b3JnPg0KQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+DQpDYzogR2FuZyBXZWkgPGdhbmcud2VpQGlu
dGVsLmNvbT4NCkNjOiBTaGFuZSBXYW5nIDxzaGFuZS53YW5nQGludGVsLmNvbT4NCi0tLQ0KIE1B
SU5UQUlORVJTIHwgNCArLS0tDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRl
bGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUw0KaW5k
ZXggNGU3NjgwOTM0Yi4uODlhMDFiNzEwYiAxMDA2NDQNCi0tLSBhL01BSU5UQUlORVJTDQorKysg
Yi9NQUlOVEFJTkVSUw0KQEAgLTI0MCw5ICsyNDAsNyBAQCBTOglNYWludGFpbmVkDQogRjoJdG9v
bHMvZ29sYW5nDQogDQogSU5URUwoUikgVFJVU1RFRCBFWEVDVVRJT04gVEVDSE5PTE9HWSAoVFhU
KQ0KLU06CUdhbmcgV2VpIDxnYW5nLndlaUBpbnRlbC5jb20+DQotTToJU2hhbmUgV2FuZyA8c2hh
bmUud2FuZ0BpbnRlbC5jb20+DQotUzoJU3VwcG9ydGVkDQorUzoJT3JwaGFuZWQNCiBGOgl4ZW4v
YXJjaC94ODYvdGJvb3QuYw0KIEY6CXhlbi9pbmNsdWRlL2FzbS14ODYvdGJvb3QuaA0KIA0KLS0N
CjIuMjAuMSAoQXBwbGUgR2l0LTExNykNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
