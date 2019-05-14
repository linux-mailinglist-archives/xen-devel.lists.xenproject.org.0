Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E541C9D3
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 16:03:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQXyL-0005UO-No; Tue, 14 May 2019 14:00:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O8Y9=TO=citrix.com=prvs=0309661e3=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hQXyK-0005UG-8q
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 14:00:00 +0000
X-Inumbo-ID: 8b7ceb1e-7650-11e9-af36-071cca6c920d
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b7ceb1e-7650-11e9-af36-071cca6c920d;
 Tue, 14 May 2019 13:59:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,468,1549929600"; d="scan'208";a="85440072"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 14 May 2019 15:59:22 +0200
Message-ID: <20190514135922.57629-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] pvshim: make PV shim build selectable from
 configure
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
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U28gYSB1c2VyIGNhbiBkZWNpZGUgd2hldGhlciB0byBjb21waWxlIGEgUFYgc2hpbSBhcyBwYXJ0
IG9mIHRoZSB0b29scwpidWlsZC4gTm90ZSB0aGF0IHRoZSBkZWZhdWx0IGJlaGF2aW9yIGlzIHBy
ZXNlcnZlZCwgd2hpY2ggaXMgdG8gYnVpbGQKYSBQViBzaGltIHdoZW4gdGhlIHRhcmdldCBvciBo
b3N0IChpZiB0YXJnZXQgaXMgdW5zZXQpIGFyY2hpdGVjdHVyZSBpcwo2NGJpdCB4ODYuCgpSZXF1
ZXN0ZWQtYnk6IE9sYWYgSGVyaW5nIDxvbGFmQGFlcGZsZS5kZT4KU2lnbmVkLW9mZi1ieTogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQpOT1RFOiBydW4gYXV0b2dl
bi5zaCBhZnRlciBhcHBseWluZy4KLS0tCkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUu
Y2l0cml4LmNvbT4KQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQpDaGFuZ2Vz
IHNpbmNlIHYxOgogLSBPbmx5IGVuYWJsZSBieSBkZWZhdWx0IG9uIHg4Nl82NCwgbGlrZSB0aGUg
cHJldmlvdXMgYmVoYXZpb3IuCiAtIEZhbGxiYWNrIHRvIHVzZSBob3N0X2NwdSBpZiB0YXJnZXRf
Y3B1IGlzIGVtcHR5LgotLS0KIGNvbmZpZy9Ub29scy5tay5pbiAgICAgIHwgIDIgKysKIHRvb2xz
L2NvbmZpZ3VyZS5hYyAgICAgIHwgMTMgKysrKysrKysrKysrKwogdG9vbHMvZmlybXdhcmUvTWFr
ZWZpbGUgfCAgNCAtLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvY29uZmlnL1Rvb2xzLm1rLmluIGIvY29uZmlnL1Rvb2xz
Lm1rLmluCmluZGV4IDk4MjQ1ZjYzYzkuLjg0ZGRiMWE1NDIgMTAwNjQ0Ci0tLSBhL2NvbmZpZy9U
b29scy5tay5pbgorKysgYi9jb25maWcvVG9vbHMubWsuaW4KQEAgLTc1LDMgKzc1LDUgQEAgVElO
Rk9fTElCUyAgICAgICAgICA6PSBAVElORk9fTElCU0AKIEFSR1BfTERGTEFHUyAgICAgICAgOj0g
QGFyZ3BfbGRmbGFnc0AKIAogRklMRV9PRkZTRVRfQklUUyAgICA6PSBARklMRV9PRkZTRVRfQklU
U0AKKworQ09ORklHX1BWX1NISU0gICAgICA6PSBAcHZzaGltQApkaWZmIC0tZ2l0IGEvdG9vbHMv
Y29uZmlndXJlLmFjIGIvdG9vbHMvY29uZmlndXJlLmFjCmluZGV4IGM5ZmQ2OWRkZmEuLmZjZjI4
MmU3NGUgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2NvbmZpZ3VyZS5hYworKysgYi90b29scy9jb25maWd1
cmUuYWMKQEAgLTQ5Miw0ICs0OTIsMTcgQEAgQUNfQVJHX0VOQUJMRShbOXBmc10sCiAKIEFDX1NV
QlNUKG5pbmVwZnMpCiAKK0FDX0FSR19FTkFCTEUoW3B2c2hpbV0sCisgICAgQVNfSEVMUF9TVFJJ
TkcoWy0tZGlzYWJsZS1wdnNoaW1dLAorICAgICAgICAgICAgICAgICAgIFtEaXNhYmxlIHB2c2hp
bSBidWlsZCAoZW5hYmxlZCBieSBkZWZhdWx0IG9uIDY0Yml0IHg4NildKSwKKyAgICBbQVNfSUYo
W3Rlc3QgIngkZW5hYmxlX3B2c2hpbSIgPSAieG5vIl0sIFtwdnNoaW09bl0sIFtwdnNoaW09eV0p
XSwgWworICAgIGNwdT1gdGVzdCAteiAiJHRhcmdldF9jcHUiICYmIGVjaG8gIiRob3N0X2NwdSIg
fHwgZWNobyAiJHRhcmdldF9jcHUiYAorICAgIGNhc2UgIiRjcHUiIGluCisgICAgICAgIHg4Nl82
NCkKKyAgICAgICAgICAgcHZzaGltPSJ5Ijs7CisgICAgICAgICopIHB2c2hpbT0ibiI7OworICAg
IGVzYWMKK10pCitBQ19TVUJTVChwdnNoaW0pCisKIEFDX09VVFBVVCgpCmRpZmYgLS1naXQgYS90
b29scy9maXJtd2FyZS9NYWtlZmlsZSBiL3Rvb2xzL2Zpcm13YXJlL01ha2VmaWxlCmluZGV4IGNm
MzA0ZmM1NzguLjgwOWE1ZmQwMjUgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2Zpcm13YXJlL01ha2VmaWxl
CisrKyBiL3Rvb2xzL2Zpcm13YXJlL01ha2VmaWxlCkBAIC0xLDEwICsxLDYgQEAKIFhFTl9ST09U
ID0gJChDVVJESVIpLy4uLy4uCiBpbmNsdWRlICQoWEVOX1JPT1QpL3Rvb2xzL1J1bGVzLm1rCiAK
LWlmbmVxICgkKFhFTl9UQVJHRVRfQVJDSCkseDg2XzMyKQotQ09ORklHX1BWX1NISU0gOj0geQot
ZW5kaWYKLQogIyBodm1sb2FkZXIgaXMgYSAzMi1iaXQgcHJvdGVjdGVkIG1vZGUgYmluYXJ5Lgog
VEFSR0VUICAgICAgOj0gaHZtbG9hZGVyL2h2bWxvYWRlcgogSU5TVF9ESVIgOj0gJChERVNURElS
KSQoWEVORklSTVdBUkVESVIpCi0tIAoyLjE3LjIgKEFwcGxlIEdpdC0xMTMpCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
