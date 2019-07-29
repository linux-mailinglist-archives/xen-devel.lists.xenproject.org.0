Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7DA7901A
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 18:00:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs82h-0003Ht-8A; Mon, 29 Jul 2019 15:58:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q6P6=V2=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hs82f-0003Fa-4j
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 15:58:29 +0000
X-Inumbo-ID: b3ff9662-b219-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b3ff9662-b219-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 15:58:27 +0000 (UTC)
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
IronPort-SDR: M890CLPCpFfqnE2cjW8xX/uQQNcOltnjt07MeD+nw1QyM4+9e78xtnnk4yhOoHfu9VXuHFiN0r
 2RY5GDbHgOcRrdjEc5ubTE8sBujEXA+2OakhZgbTq87B04xyYHBIBqOvSBfyS0VvJlWKexvpVH
 PnuSn+56L7LgNBAeOpkFGTOYosXftLujP27DhjWfGuJ7OlpSIHTR3yYaN2g2FaTJVf4moT0xzU
 KtoDLpWrUNRNffaqxxLnq2spvz+6dTaQeTC9gzh6Vy4cwWCIHwjcy2pITclIhCcWe/NaHMtSru
 v0o=
X-SBRS: 2.7
X-MesageID: 3579653
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,323,1559534400"; 
   d="scan'208";a="3579653"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Mon, 29 Jul 2019 16:39:44 +0100
Message-ID: <20190729153944.24239-36-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729153944.24239-1-anthony.perard@citrix.com>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 35/35] OvmfPkg/OvmfXen: use
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
IGEvT3ZtZlBrZy9Pdm1mWGVuLmRzYyBiL092bWZQa2cvT3ZtZlhlbi5kc2MKaW5kZXggNWUwN2Iz
NzI3OS4uNWEzMWY3NWYwNSAxMDA2NDQKLS0tIGEvT3ZtZlBrZy9Pdm1mWGVuLmRzYworKysgYi9P
dm1mUGtnL092bWZYZW4uZHNjCkBAIC0xOTksNiArMTk5LDcgQEAgW0xpYnJhcnlDbGFzc2VzXQog
DQogICBUY2cyUGh5c2ljYWxQcmVzZW5jZUxpYnxPdm1mUGtnL0xpYnJhcnkvVGNnMlBoeXNpY2Fs
UHJlc2VuY2VMaWJOdWxsL0R4ZVRjZzJQaHlzaWNhbFByZXNlbmNlTGliLmluZg0KICAgVHBtTWVh
c3VyZW1lbnRMaWJ8TWRlTW9kdWxlUGtnL0xpYnJhcnkvVHBtTWVhc3VyZW1lbnRMaWJOdWxsL1Rw
bU1lYXN1cmVtZW50TGliTnVsbC5pbmYNCisgIFJlYWxUaW1lQ2xvY2tMaWJ8T3ZtZlBrZy9MaWJy
YXJ5L1hlblJlYWxUaW1lQ2xvY2tMaWIvWGVuUmVhbFRpbWVDbG9ja0xpYi5pbmYNCiANCiBbTGli
cmFyeUNsYXNzZXMuY29tbW9uXQ0KICAgQmFzZUNyeXB0TGlifENyeXB0b1BrZy9MaWJyYXJ5L0Jh
c2VDcnlwdExpYi9CYXNlQ3J5cHRMaWIuaW5mDQpAQCAtNTY0LDcgKzU2NSw3IEBAIFtDb21wb25l
bnRzXQogICB9DQogICBNZGVNb2R1bGVQa2cvVW5pdmVyc2FsL1Jlc2V0U3lzdGVtUnVudGltZUR4
ZS9SZXNldFN5c3RlbVJ1bnRpbWVEeGUuaW5mDQogICBNZGVNb2R1bGVQa2cvVW5pdmVyc2FsL01l
dHJvbm9tZS9NZXRyb25vbWUuaW5mDQotICBQY0F0Q2hpcHNldFBrZy9QY2F0UmVhbFRpbWVDbG9j
a1J1bnRpbWVEeGUvUGNhdFJlYWxUaW1lQ2xvY2tSdW50aW1lRHhlLmluZg0KKyAgRW1iZWRkZWRQ
a2cvUmVhbFRpbWVDbG9ja1J1bnRpbWVEeGUvUmVhbFRpbWVDbG9ja1J1bnRpbWVEeGUuaW5mDQog
ICBNZGVNb2R1bGVQa2cvVW5pdmVyc2FsL0RyaXZlckhlYWx0aE1hbmFnZXJEeGUvRHJpdmVySGVh
bHRoTWFuYWdlckR4ZS5pbmYNCiAgIE1kZU1vZHVsZVBrZy9Vbml2ZXJzYWwvQmRzRHhlL0Jkc0R4
ZS5pbmYgew0KICAgICA8TGlicmFyeUNsYXNzZXM+DQpkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9Pdm1m
WGVuLmZkZiBiL092bWZQa2cvT3ZtZlhlbi5mZGYKaW5kZXggNTE3YTQ5MmYxNC4uZTZlOWUxODRl
ZiAxMDA2NDQKLS0tIGEvT3ZtZlBrZy9Pdm1mWGVuLmZkZgorKysgYi9Pdm1mUGtnL092bWZYZW4u
ZmRmCkBAIC0zMDcsNyArMzA3LDcgQEAgW0ZWLkRYRUZWXQogSU5GICBNZGVNb2R1bGVQa2cvQnVz
L1BjaS9QY2lCdXNEeGUvUGNpQnVzRHhlLmluZg0KIElORiAgTWRlTW9kdWxlUGtnL1VuaXZlcnNh
bC9SZXNldFN5c3RlbVJ1bnRpbWVEeGUvUmVzZXRTeXN0ZW1SdW50aW1lRHhlLmluZg0KIElORiAg
TWRlTW9kdWxlUGtnL1VuaXZlcnNhbC9NZXRyb25vbWUvTWV0cm9ub21lLmluZg0KLUlORiAgUGNB
dENoaXBzZXRQa2cvUGNhdFJlYWxUaW1lQ2xvY2tSdW50aW1lRHhlL1BjYXRSZWFsVGltZUNsb2Nr
UnVudGltZUR4ZS5pbmYNCitJTkYgIEVtYmVkZGVkUGtnL1JlYWxUaW1lQ2xvY2tSdW50aW1lRHhl
L1JlYWxUaW1lQ2xvY2tSdW50aW1lRHhlLmluZg0KIA0KIElORiAgT3ZtZlBrZy9YZW5Jb1B2aER4
ZS9YZW5Jb1B2aER4ZS5pbmYNCiBJTkYgIE92bWZQa2cvWGVuSW9QY2lEeGUvWGVuSW9QY2lEeGUu
aW5mDQotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
