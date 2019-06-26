Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B6C56B70
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 16:00:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg8P8-0007K2-U2; Wed, 26 Jun 2019 13:56:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ehih=UZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hg8P7-0007Ic-2M
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 13:56:05 +0000
X-Inumbo-ID: 21fd19a2-981a-11e9-98cb-fbe3daafef57
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21fd19a2-981a-11e9-98cb-fbe3daafef57;
 Wed, 26 Jun 2019 13:56:02 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: dANB8aaGyp2brybmodCKgJvpXju4OatnIH0amBnsoIdRBLPRPslcBwI+mymZd4N4jk1M3haE9/
 mzt4YkApeEa2k0jdIZvqrk0Sd7oh1JbQS7MNybL3DcyXw+XGgEthpH6ydnZmyxdojmHs1VKXIR
 BNwqRapFEff1T/OhE2d36Hf9FQYIjUqRyVKKu6hE31d9Ssp81AZhhawd8GJGAgh707z6fzGUIK
 7SWWfUS3enOxS8Qorq0xqUPoSalZ/TE/VQ7ax80pBakR1lQxo6Dkw8cAO4dtcNIi38L83xP4ZE
 2kE=
X-SBRS: 2.7
X-MesageID: 2289004
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,420,1557201600"; 
   d="scan'208";a="2289004"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 26 Jun 2019 15:55:41 +0200
Message-ID: <20190626135546.50665-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/5] build improvements/fixes after b41666f2c1
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
Cc: Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpUaGUgZm9sbG93aW5nIGZpeGVzIGFyaXNlIGZyb20gdGhlIHRyYXZpcy1jaSBmYWxs
b3V0IGNhdXNlZCBieQpiNDE2NjZmMmMxICgnY29uZmlnOiBkb24ndCBoYXJkY29kZSB0b29sY2hh
aW4gYmluYXJpZXMnKS4gRmlyc3QgcGF0Y2hlcwphaW0gdG8gc2ltcGxpZnkgYW5kIGdyb3VwIHRv
Z2V0aGVyIHRoZSBwbGFjZSB3aGVyZSB0b29sY2hhaW4gYmluYXJpZXMgdG8KYmUgdXNlZCBieSB0
aGUgYnVpbGQgc3lzdGVtLiBMYXN0IHBhdGNoIGNoYW5nZXMgdGhlIHRyYXZpcy1jaSBidWlsZApz
Y3JpcHQgdG8gYWNjb21tb2RhdGUgdGhlIGNoYW5nZXMgaW50cm9kdWNlZCBieSBiNDE2NjZmMmMx
LgoKVGhhbmtzLCBSb2dlci4KClJvZ2VyIFBhdSBNb25uZSAoNSk6CiAgbWFrZTogc2ltcGxpZnkg
c2V0dGluZyBIT1NUe0NDL0NYWH0KICBrY29uZmlnOiBkb24ndCBwYXNzIEFSQ0ggYW5kIFNSQ0FS
Q0ggb24gdGhlIHN1Yi1tYWtlIGNhbGwKICBrY29uZmlnOiBpbmNsdWRlIGRlZmF1bHQgdG9vbGNo
YWluIHZhbHVlcwogIGtjb25maWc6IGRpc2FibGUgbm9uLWxpdGVyYWwgZm9ybWF0IHN0cmluZyB3
YXJuaW5ncwogIHRyYXZpczogcGFzcyBhIGNvcnJlY3QgQ0MvQ1hYIGlmIENST1NTX0NPTVBJTEUg
aXMgZGVmaW5lZAoKIENvbmZpZy5tayAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxMCAtLS0t
LS0tLS0tCiBjb25maWcvU3RkR05VLm1rICAgICAgICAgICAgICAgICAgIHwgIDQgKysrKwogc2Ny
aXB0cy90cmF2aXMtYnVpbGQgICAgICAgICAgICAgICB8ICA4ICsrKysrKysrCiB4ZW4vTWFrZWZp
bGUgICAgICAgICAgICAgICAgICAgICAgIHwgMTAgKysrKystLS0tLQogeGVuL3Rvb2xzL2tjb25m
aWcvTWFrZWZpbGUua2NvbmZpZyB8IDEyICsrKysrKysrLS0tLQogNSBmaWxlcyBjaGFuZ2VkLCAy
NSBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKCi0tIAoyLjIwLjEgKEFwcGxlIEdpdC0x
MTcpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
