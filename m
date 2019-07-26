Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 593C67633F
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 12:13:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqxBu-0004Xn-4K; Fri, 26 Jul 2019 10:11:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOBC=VX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hqxBs-0004Xb-EG
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 10:11:08 +0000
X-Inumbo-ID: abcbec0a-af8d-11e9-9971-0bcb72ee105c
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id abcbec0a-af8d-11e9-9971-0bcb72ee105c;
 Fri, 26 Jul 2019 10:11:02 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: E6VnhA82o/giP5ZSlhdwsCvGfy0uajjRSdPgV/LmB4RhbEoLyOuEOG6rlOwTrB4JUadcGLp4z9
 6t8TlF4E6SOWVxUqDY9Tg97oqTN8ZfkZxPiA4X5SCUa9x+YlCNRV/RDLIutnOxhBdeuXVIbhoJ
 Whdc/h3Zv6cBm7Psg1y+fr/2PXeGCHhmoTwbkANRc3V0BdI31P4d+fJACPCXvMh/Wj/zBtGDWa
 uYFX/vr7xRQdPLtaiY/DXt1pXct8DLgS74qCu8L/bEM6BGS8ilnTqULnkd5mo7qeNvY14EK99k
 Qgs=
X-SBRS: 2.7
X-MesageID: 3602470
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,310,1559534400"; 
   d="scan'208";a="3602470"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 26 Jul 2019 11:10:57 +0100
Message-ID: <20190726101057.21324-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH RFC] x86/shim: Refresh pvshim_defconfig
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KiBBZGQgYSBkZXBlbmRlbmN5IHNvIHRoZSBzaGltIGdldHMgcmVidWlsdCB3aGVuIHB2c2hpbV9k
ZWZjb25maWcgY2hhbmdlcy4KKiBEZWZhdWx0IHRvIHRoZSBOVUxMIHNjaGVkdWxlciBub3cgdGhh
dCBpdCB3b3JrcyB3aXRoIHZjcHUgb25saW5lL29mZmxpbmUuCgpTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNo
IDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4KQ0M6IERhcmlvIEZhZ2dpb2xpIDxkZmFnZ2lvbGlAc3VzZS5jb20+CgpUaGlz
IHBhdGNoIGRlcGVuZHMgb24gRGFyaW8ncyBzZXJpZXMsIGFuZCBjYW50IGdvIGluIHVudGlsIHRo
ZW4uCgpBbHNvIFJGQy4KCkNDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5l
bC5vcmc+CkNDOiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CgpJIHRyaWVk
IHR1cm5pbmcgb2ZmIE1FTV9BQ0NFU1MsIGJ1dCBJIGNhbid0IGdldCBLY29uZmlnIHRvIGFjdHVh
bGx5IHR1cm4gaXQKb2ZmIGluIHRoZSBidWlsZC4gIFdoYXQgaXMgdGhlIGRlYWwgd2l0aCBNRU1f
QUNDRVNTX0FMV0FZU19PTiA/ICBJdCBtYWtlcyBpdAppbXBvc3NpYmxlIHRvIHR1cm4gTUVNX0FD
Q0VTUyBvZmYsIGJlY2F1ZSBpdCBpcyBzZWxlY3RlZCBieSB4ODYsIHdoaWNoIGxlYXZlcwpNRU1f
QUNDRVNTIGVuYWJsZWQgYW5kIHVubW9kaWZpYWJsZS4KLS0tCiB0b29scy9maXJtd2FyZS94ZW4t
ZGlyL01ha2VmaWxlICAgICAgIHwgMiArLQogeGVuL2FyY2gveDg2L2NvbmZpZ3MvcHZzaGltX2Rl
ZmNvbmZpZyB8IDUgKysrKy0KIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUg
Yi90b29scy9maXJtd2FyZS94ZW4tZGlyL01ha2VmaWxlCmluZGV4IDgzNTk3ZjAwMTcuLjc0MzU0
MjEyNTEgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUKKysrIGIv
dG9vbHMvZmlybXdhcmUveGVuLWRpci9NYWtlZmlsZQpAQCAtNDEsNyArNDEsNyBAQCBsaW5rZmFy
bS5zdGFtcDogJChERVBfRElSUykgJChERVBfRklMRVMpIEZPUkNFCiAkKEQpOiBsaW5rZmFybS5z
dGFtcAogCSQoTUFLRSkgLUMgJChEKS94ZW4gZGlzdGNsZWFuCiAKLSQoRCkveGVuLy5jb25maWc6
ICQoRCkKKyQoRCkveGVuLy5jb25maWc6ICQoRCkgJChEKS94ZW4vYXJjaC94ODYvY29uZmlncy9w
dnNoaW1fZGVmY29uZmlnCiAJJChNQUtFKSAtQyAkKEBEKSBLQlVJTERfREVGQ09ORklHPXB2c2hp
bV9kZWZjb25maWcgWEVOX0NPTkZJR19FWFBFUlQ9eSBkZWZjb25maWcKIAogeGVuLXNoaW06ICQo
RCkveGVuLy5jb25maWcKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9jb25maWdzL3B2c2hpbV9k
ZWZjb25maWcgYi94ZW4vYXJjaC94ODYvY29uZmlncy9wdnNoaW1fZGVmY29uZmlnCmluZGV4IDk3
MTBhYTYyMzguLjMyOWFhZjkwMjkgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9jb25maWdzL3B2
c2hpbV9kZWZjb25maWcKKysrIGIveGVuL2FyY2gveDg2L2NvbmZpZ3MvcHZzaGltX2RlZmNvbmZp
ZwpAQCAtNSw2ICs1LDcgQEAgQ09ORklHX1BWSF9HVUVTVD15CiBDT05GSUdfUFZfU0hJTT15CiBD
T05GSUdfUFZfU0hJTV9FWENMVVNJVkU9eQogQ09ORklHX05SX0NQVVM9MzIKK0NPTkZJR19TQ0hF
RF9OVUxMPXkKICMgRGlzYWJsZSBmZWF0dXJlcyBub3QgdXNlZCBieSB0aGUgUFYgc2hpbQogIyBD
T05GSUdfU0hBRE9XX1BBR0lORyBpcyBub3Qgc2V0CiAjIENPTkZJR19CSUdNRU0gaXMgbm90IHNl
dApAQCAtMTMsMTAgKzE0LDEyIEBAIENPTkZJR19OUl9DUFVTPTMyCiAjIENPTkZJR19LRVhFQyBp
cyBub3Qgc2V0CiAjIENPTkZJR19YRU5PUFJPRiBpcyBub3Qgc2V0CiAjIENPTkZJR19YU00gaXMg
bm90IHNldAorIyBDT05GSUdfU0NIRURfQ1JFRElUIGlzIG5vdCBzZXQKICMgQ09ORklHX1NDSEVE
X0NSRURJVDIgaXMgbm90IHNldAogIyBDT05GSUdfU0NIRURfUlREUyBpcyBub3Qgc2V0CiAjIENP
TkZJR19TQ0hFRF9BUklOQzY1MyBpcyBub3Qgc2V0Ci0jIENPTkZJR19TQ0hFRF9OVUxMIGlzIG5v
dCBzZXQKICMgQ09ORklHX0xJVkVQQVRDSCBpcyBub3Qgc2V0CiAjIENPTkZJR19TVVBQUkVTU19E
VVBMSUNBVEVfU1lNQk9MX1dBUk5JTkdTIGlzIG5vdCBzZXQKICMgQ09ORklHX0RFQlVHIGlzIG5v
dCBzZXQKKyMgQ09ORklHX01FTV9BQ0NFU1NfQUxXQVlTX09OIGlzIG5vdCBzZXQKKyMgQ09ORklH
X01FTV9BQ0NFU1MgaXMgbm90IHNldAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
