Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B16E1C7BD
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 13:22:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQVRo-0000Ds-D6; Tue, 14 May 2019 11:18:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O8Y9=TO=citrix.com=prvs=0309661e3=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hQVRn-0000Dl-9V
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 11:18:15 +0000
X-Inumbo-ID: f4656988-7639-11e9-91ca-777a028e84c0
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f4656988-7639-11e9-91ca-777a028e84c0;
 Tue, 14 May 2019 11:18:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,468,1549929600"; d="scan'208";a="85432572"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 14 May 2019 13:17:54 +0200
Message-ID: <20190514111754.56758-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] pvshim: make PV shim build selectable from
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
ZXNlcnZlZCwgd2hpY2ggaXMgdG8gYnVpbGQgYQpQViBzaGltIHdoZW4gdGhlIHRhcmdldCBhcmNo
aXRlY3R1cmUgaXMgeDg2LgoKUmVxdWVzdGVkLWJ5OiBPbGFmIEhlcmluZyA8b2xhZkBhZXBmbGUu
ZGU+ClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
PgotLS0KTk9URTogcnVuIGF1dG9nZW4uc2ggYWZ0ZXIgYXBwbHlpbmcuCi0tLQpDYzogSWFuIEph
Y2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkNjOiBXZWkgTGl1IDx3ZWkubGl1MkBj
aXRyaXguY29tPgotLS0KIGNvbmZpZy9Ub29scy5tay5pbiAgICAgIHwgIDIgKysKIHRvb2xzL2Nv
bmZpZ3VyZS5hYyAgICAgIHwgMTIgKysrKysrKysrKysrCiB0b29scy9maXJtd2FyZS9NYWtlZmls
ZSB8ICA0IC0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9jb25maWcvVG9vbHMubWsuaW4gYi9jb25maWcvVG9vbHMubWsu
aW4KaW5kZXggOTgyNDVmNjNjOS4uODRkZGIxYTU0MiAxMDA2NDQKLS0tIGEvY29uZmlnL1Rvb2xz
Lm1rLmluCisrKyBiL2NvbmZpZy9Ub29scy5tay5pbgpAQCAtNzUsMyArNzUsNSBAQCBUSU5GT19M
SUJTICAgICAgICAgIDo9IEBUSU5GT19MSUJTQAogQVJHUF9MREZMQUdTICAgICAgICA6PSBAYXJn
cF9sZGZsYWdzQAogCiBGSUxFX09GRlNFVF9CSVRTICAgIDo9IEBGSUxFX09GRlNFVF9CSVRTQAor
CitDT05GSUdfUFZfU0hJTSAgICAgIDo9IEBwdnNoaW1ACmRpZmYgLS1naXQgYS90b29scy9jb25m
aWd1cmUuYWMgYi90b29scy9jb25maWd1cmUuYWMKaW5kZXggYzlmZDY5ZGRmYS4uMmQyZjY1N2Nh
YyAxMDA2NDQKLS0tIGEvdG9vbHMvY29uZmlndXJlLmFjCisrKyBiL3Rvb2xzL2NvbmZpZ3VyZS5h
YwpAQCAtNDkyLDQgKzQ5MiwxNiBAQCBBQ19BUkdfRU5BQkxFKFs5cGZzXSwKIAogQUNfU1VCU1Qo
bmluZXBmcykKIAorQUNfQVJHX0VOQUJMRShbcHZzaGltXSwKKyAgICBBU19IRUxQX1NUUklORyhb
LS1kaXNhYmxlLXB2c2hpbV0sCisgICAgICAgICAgICAgICAgICAgW0Rpc2FibGUgcHZzaGltIGJ1
aWxkICh4ODYgb25seSwgZW5hYmxlZCBieSBkZWZhdWx0KV0pLAorICAgIFtBU19JRihbdGVzdCAi
eCRlbmFibGVfcHZzaGltIiA9ICJ4bm8iXSwgW3B2c2hpbT1uXSwgW3B2c2hpbT15XSldLCBbCisg
ICAgY2FzZSAiJHRhcmdldF9jcHUiIGluCisgICAgICAgIGlbWzM0NTZdXTg2fHg4Nl82NCkKKyAg
ICAgICAgICAgcHZzaGltPSJ5Ijs7CisgICAgICAgICopIHB2c2hpbT0ibiI7OworICAgIGVzYWMK
K10pCitBQ19TVUJTVChwdnNoaW0pCisKIEFDX09VVFBVVCgpCmRpZmYgLS1naXQgYS90b29scy9m
aXJtd2FyZS9NYWtlZmlsZSBiL3Rvb2xzL2Zpcm13YXJlL01ha2VmaWxlCmluZGV4IGNmMzA0ZmM1
NzguLjgwOWE1ZmQwMjUgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2Zpcm13YXJlL01ha2VmaWxlCisrKyBi
L3Rvb2xzL2Zpcm13YXJlL01ha2VmaWxlCkBAIC0xLDEwICsxLDYgQEAKIFhFTl9ST09UID0gJChD
VVJESVIpLy4uLy4uCiBpbmNsdWRlICQoWEVOX1JPT1QpL3Rvb2xzL1J1bGVzLm1rCiAKLWlmbmVx
ICgkKFhFTl9UQVJHRVRfQVJDSCkseDg2XzMyKQotQ09ORklHX1BWX1NISU0gOj0geQotZW5kaWYK
LQogIyBodm1sb2FkZXIgaXMgYSAzMi1iaXQgcHJvdGVjdGVkIG1vZGUgYmluYXJ5LgogVEFSR0VU
ICAgICAgOj0gaHZtbG9hZGVyL2h2bWxvYWRlcgogSU5TVF9ESVIgOj0gJChERVNURElSKSQoWEVO
RklSTVdBUkVESVIpCi0tIAoyLjE3LjIgKEFwcGxlIEdpdC0xMTMpCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
