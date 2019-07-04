Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 212585FA7B
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 17:01:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj3Bw-0006QJ-AU; Thu, 04 Jul 2019 14:58:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8gU+=VB=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hj3Bu-0006Og-KF
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 14:58:30 +0000
X-Inumbo-ID: 2edfd168-9e6c-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2edfd168-9e6c-11e9-8980-bc764e045a96;
 Thu, 04 Jul 2019 14:58:29 +0000 (UTC)
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
IronPort-SDR: wWtNPv19kF7DNjGuILsH0lCNRBdn0nt/UWZ9Zv+Otn3mfCJUyBDZraqDZrKAKsTTUI7MaBz+Ex
 gMeUf0HLTTKdiGICSVrvTlL2T4VQZs/er7ukGIsqYQx/TXvXxNWXMGW7H2/KEtVWCONlrAiY1a
 VJmEMZMVYsBie1tanVAXQbnWPumeSaXqbDsz1yLyQUHYj+iXlLMhk3g/AVgmJcOyKla2D6y2y2
 JyXs/ZMBzn5l25rCohQY3ZmPKcAHlGYLiuTHyyMOQGGyCEJlLyKUJFwea7GN1tyVsNovfAXatI
 7TI=
X-SBRS: 2.7
X-MesageID: 2602744
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,451,1557201600"; 
   d="scan'208";a="2602744"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Thu, 4 Jul 2019 15:42:33 +0100
Message-ID: <20190704144233.27968-36-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704144233.27968-1-anthony.perard@citrix.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 35/35] OvmfPkg/OvmfXen: use
 RealTimeClockRuntimeDxe from EmbeddedPkg
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QSBYZW4gUFZIIGd1ZXN0IGRvZXNuJ3QgaGF2ZSBhIFJUQyB0aGF0IE9WTUYgd291bGQgZXhwZWN0
LCBzbwpQY2F0UmVhbFRpbWVDbG9ja1J1bnRpbWVEeGUgZmFpbHMgdG8gaW5pdGlhbGl6ZSBhbmQg
cHJldmVudCB0aGUKZmlybXdhcmUgZnJvbSBmaW5pc2ggdG8gYm9vdC4gVG8gcHJldmVudCB0aGF0
LCB3ZSB3aWxsIHVzZQpYZW5SZWFsVGltZUNsb2NrTGliIHdoaWNoIHNpbXBseSBhbHdheXMgcmV0
dXJuIHRoZSBzYW1lIHRpbWUuClRoaXMgd2lsbCB3b3JrIG9uIGJvdGggWGVuIFBWSCBhbmQgSFZN
IGd1ZXN0cy4KClJlZjogaHR0cHM6Ly9idWd6aWxsYS50aWFub2NvcmUub3JnL3Nob3dfYnVnLmNn
aT9pZD0xNjg5ClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBj
aXRyaXguY29tPgpBY2tlZC1ieTogTGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KLS0t
CgpOb3RlczoKICAgIHYzOgogICAgLSBtb3ZlZCBSZWFsVGltZUNsb2NrTGlifCovWGVuUmVhbFRp
bWVDbG9ja0xpYi5pbmYgdG8gdGhlIGdsb2JhbAogICAgICBbTGlicmFyeUNsYXNzZXNdCgogT3Zt
ZlBrZy9Pdm1mWGVuLmRzYyB8IDMgKystCiBPdm1mUGtnL092bWZYZW4uZmRmIHwgMiArLQogMiBm
aWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvT3ZtZlBrZy9Pdm1mWGVuLmRzYyBiL092bWZQa2cvT3ZtZlhlbi5kc2MKaW5kZXggYWY5MmNl
M2VkMi4uNGY2MjZmYjVlZiAxMDA2NDQKLS0tIGEvT3ZtZlBrZy9Pdm1mWGVuLmRzYworKysgYi9P
dm1mUGtnL092bWZYZW4uZHNjCkBAIC0xOTksNiArMTk5LDcgQEAgW0xpYnJhcnlDbGFzc2VzXQog
ICBYZW5Jb01taW9MaWJ8T3ZtZlBrZy9MaWJyYXJ5L1hlbklvTW1pb0xpYi9YZW5Jb01taW9MaWIu
aW5mDQogDQogICBUY2cyUGh5c2ljYWxQcmVzZW5jZUxpYnxPdm1mUGtnL0xpYnJhcnkvVGNnMlBo
eXNpY2FsUHJlc2VuY2VMaWJOdWxsL0R4ZVRjZzJQaHlzaWNhbFByZXNlbmNlTGliLmluZg0KKyAg
UmVhbFRpbWVDbG9ja0xpYnxPdm1mUGtnL0xpYnJhcnkvWGVuUmVhbFRpbWVDbG9ja0xpYi9YZW5S
ZWFsVGltZUNsb2NrTGliLmluZg0KIA0KIFtMaWJyYXJ5Q2xhc3Nlcy5jb21tb25dDQogICBCYXNl
Q3J5cHRMaWJ8Q3J5cHRvUGtnL0xpYnJhcnkvQmFzZUNyeXB0TGliL0Jhc2VDcnlwdExpYi5pbmYN
CkBAIC01NjQsNyArNTY1LDcgQEAgW0NvbXBvbmVudHNdCiAgIH0NCiAgIE1kZU1vZHVsZVBrZy9V
bml2ZXJzYWwvUmVzZXRTeXN0ZW1SdW50aW1lRHhlL1Jlc2V0U3lzdGVtUnVudGltZUR4ZS5pbmYN
CiAgIE1kZU1vZHVsZVBrZy9Vbml2ZXJzYWwvTWV0cm9ub21lL01ldHJvbm9tZS5pbmYNCi0gIFBj
QXRDaGlwc2V0UGtnL1BjYXRSZWFsVGltZUNsb2NrUnVudGltZUR4ZS9QY2F0UmVhbFRpbWVDbG9j
a1J1bnRpbWVEeGUuaW5mDQorICBFbWJlZGRlZFBrZy9SZWFsVGltZUNsb2NrUnVudGltZUR4ZS9S
ZWFsVGltZUNsb2NrUnVudGltZUR4ZS5pbmYNCiAgIE1kZU1vZHVsZVBrZy9Vbml2ZXJzYWwvRHJp
dmVySGVhbHRoTWFuYWdlckR4ZS9Ecml2ZXJIZWFsdGhNYW5hZ2VyRHhlLmluZg0KICAgTWRlTW9k
dWxlUGtnL1VuaXZlcnNhbC9CZHNEeGUvQmRzRHhlLmluZiB7DQogICAgIDxMaWJyYXJ5Q2xhc3Nl
cz4NCmRpZmYgLS1naXQgYS9Pdm1mUGtnL092bWZYZW4uZmRmIGIvT3ZtZlBrZy9Pdm1mWGVuLmZk
ZgppbmRleCA1MTdhNDkyZjE0Li5lNmU5ZTE4NGVmIDEwMDY0NAotLS0gYS9Pdm1mUGtnL092bWZY
ZW4uZmRmCisrKyBiL092bWZQa2cvT3ZtZlhlbi5mZGYKQEAgLTMwNyw3ICszMDcsNyBAQCBbRlYu
RFhFRlZdCiBJTkYgIE1kZU1vZHVsZVBrZy9CdXMvUGNpL1BjaUJ1c0R4ZS9QY2lCdXNEeGUuaW5m
DQogSU5GICBNZGVNb2R1bGVQa2cvVW5pdmVyc2FsL1Jlc2V0U3lzdGVtUnVudGltZUR4ZS9SZXNl
dFN5c3RlbVJ1bnRpbWVEeGUuaW5mDQogSU5GICBNZGVNb2R1bGVQa2cvVW5pdmVyc2FsL01ldHJv
bm9tZS9NZXRyb25vbWUuaW5mDQotSU5GICBQY0F0Q2hpcHNldFBrZy9QY2F0UmVhbFRpbWVDbG9j
a1J1bnRpbWVEeGUvUGNhdFJlYWxUaW1lQ2xvY2tSdW50aW1lRHhlLmluZg0KK0lORiAgRW1iZWRk
ZWRQa2cvUmVhbFRpbWVDbG9ja1J1bnRpbWVEeGUvUmVhbFRpbWVDbG9ja1J1bnRpbWVEeGUuaW5m
DQogDQogSU5GICBPdm1mUGtnL1hlbklvUHZoRHhlL1hlbklvUHZoRHhlLmluZg0KIElORiAgT3Zt
ZlBrZy9YZW5Jb1BjaUR4ZS9YZW5Jb1BjaUR4ZS5pbmYNCi0tIApBbnRob255IFBFUkFSRAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
