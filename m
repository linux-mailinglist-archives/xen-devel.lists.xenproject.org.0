Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7575FA39
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 16:45:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj2wc-0003DZ-Kl; Thu, 04 Jul 2019 14:42:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8gU+=VB=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hj2wa-0003DJ-Pr
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 14:42:40 +0000
X-Inumbo-ID: f72765d8-9e69-11e9-8bbb-33a75ef24107
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f72765d8-9e69-11e9-8bbb-33a75ef24107;
 Thu, 04 Jul 2019 14:42:37 +0000 (UTC)
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
IronPort-SDR: TB8tsBgRSS/HXkr8uYBoDFm5ddsDG2lo3mSfW0LB3TCzVTcWlz4xGLdTcRo////+nbmjgN5Mvv
 5dCJFm1Umhx9Uh6EX/ocuO5e/gZQ9FpJDbVu1EBWEkObzuCLS6Nzu4SSLPfvLrkDMbzHHH9ekX
 1HO+TAlkknn25yHCzPuypMTzAZGFe+vxVKbLPXIB+W5Bu/WeQzR4UVbFoz3JS0p9r+N+9hd9ma
 bGKUeKgMIWarbAqyj+IHm2v0YyqB93SqmJW71upDs3G5V/UQNp4ZB30tbF3rd1+7BA3r6N3rOQ
 8lo=
X-SBRS: 2.7
X-MesageID: 2588779
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,451,1557201600"; 
   d="scan'208";a="2588779"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Thu, 4 Jul 2019 15:41:59 +0100
Message-ID: <20190704144233.27968-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704144233.27968-1-anthony.perard@citrix.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 01/35] OvmfPkg/ResetSystemLib: Add missing
 dependency on PciLib
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

QWRkIG1pc3NpbmcgZGVwZW5kZW5jeSBvbiBQY2lMaWIKYW5kIHJlbW92ZSBleHRyYSBpbmNsdWRl
cyBvZiBPdm1mUGxhdGZvcm1zLmguCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50
aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IExhc3psbyBFcnNlayA8bGVyc2Vr
QHJlZGhhdC5jb20+Ci0tLQoKTm90ZXM6CiAgICB2MjoKICAgIC0gYWxzbyBhZGQgUGNpTGliLmgg
aW5jbHVkZSB0byB0aGUgLmMKICAgIC0gYW5kIHJlbW92ZSBleHRyYSBpbmNsdWRlIG9mIE92bWZQ
bGF0Zm9ybXMuaAoKIE92bWZQa2cvTGlicmFyeS9SZXNldFN5c3RlbUxpYi9SZXNldFN5c3RlbUxp
Yi5pbmYgfCAxICsKIE92bWZQa2cvTGlicmFyeS9SZXNldFN5c3RlbUxpYi9SZXNldFN5c3RlbUxp
Yi5jICAgfCAzICstLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9MaWJyYXJ5L1Jlc2V0U3lzdGVtTGliL1Jlc2V0
U3lzdGVtTGliLmluZiBiL092bWZQa2cvTGlicmFyeS9SZXNldFN5c3RlbUxpYi9SZXNldFN5c3Rl
bUxpYi5pbmYKaW5kZXggN2M0NGY5OWE1Yy4uMmYyNGRhYzg3ZiAxMDA2NDQKLS0tIGEvT3ZtZlBr
Zy9MaWJyYXJ5L1Jlc2V0U3lzdGVtTGliL1Jlc2V0U3lzdGVtTGliLmluZgorKysgYi9Pdm1mUGtn
L0xpYnJhcnkvUmVzZXRTeXN0ZW1MaWIvUmVzZXRTeXN0ZW1MaWIuaW5mCkBAIC0zMCw0ICszMCw1
IEBAIFtQYWNrYWdlc10KIFtMaWJyYXJ5Q2xhc3Nlc10NCiAgIERlYnVnTGliDQogICBJb0xpYg0K
KyAgUGNpTGliDQogICBUaW1lckxpYg0KZGlmZiAtLWdpdCBhL092bWZQa2cvTGlicmFyeS9SZXNl
dFN5c3RlbUxpYi9SZXNldFN5c3RlbUxpYi5jIGIvT3ZtZlBrZy9MaWJyYXJ5L1Jlc2V0U3lzdGVt
TGliL1Jlc2V0U3lzdGVtTGliLmMKaW5kZXggMjc0NjBjZDEwMC4uOThkZDgwZTMzYyAxMDA2NDQK
LS0tIGEvT3ZtZlBrZy9MaWJyYXJ5L1Jlc2V0U3lzdGVtTGliL1Jlc2V0U3lzdGVtTGliLmMKKysr
IGIvT3ZtZlBrZy9MaWJyYXJ5L1Jlc2V0U3lzdGVtTGliL1Jlc2V0U3lzdGVtTGliLmMKQEAgLTEx
LDExICsxMSwxMCBAQAogI2luY2x1ZGUgPExpYnJhcnkvQmFzZUxpYi5oPg0KICNpbmNsdWRlIDxM
aWJyYXJ5L0RlYnVnTGliLmg+DQogI2luY2x1ZGUgPExpYnJhcnkvSW9MaWIuaD4NCisjaW5jbHVk
ZSA8TGlicmFyeS9QY2lMaWIuaD4NCiAjaW5jbHVkZSA8TGlicmFyeS9UaW1lckxpYi5oPg0KICNp
bmNsdWRlIDxPdm1mUGxhdGZvcm1zLmg+DQogDQotI2luY2x1ZGUgPE92bWZQbGF0Zm9ybXMuaD4N
Ci0NCiBWT0lEDQogQWNwaVBtQ29udHJvbCAoDQogICBVSU5UTiBTdXNwZW5kVHlwZQ0KLS0gCkFu
dGhvbnkgUEVSQVJECgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
