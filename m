Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 529338F35E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 20:29:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyKQa-0003DP-L7; Thu, 15 Aug 2019 18:24:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pnYX=WL=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hyKQZ-0003DK-Ao
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 18:24:47 +0000
X-Inumbo-ID: f53dec2e-bf89-11e9-8ba6-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f53dec2e-bf89-11e9-8ba6-12813bfff9fa;
 Thu, 15 Aug 2019 18:24:45 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@citrix.com>)
 id 1hyKQX-0005Tu-C2; Thu, 15 Aug 2019 18:24:45 +0000
Received: from localhost ([127.0.0.1] helo=localhost.localdomain)
 by xenbits.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@citrix.com>)
 id 1hyKQX-0002j0-5b; Thu, 15 Aug 2019 18:24:45 +0000
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 15 Aug 2019 19:16:27 +0100
Message-Id: <4c08e311d56967af4e9cb7863c2ecc3a90ceb83a.1565892726.git.lars.kurth@citrix.com>
X-Mailer: git-send-email 2.13.0
Subject: [Xen-devel] [PATCH LIVEPATCH-BUILD-TOOLS] Introduce a MAINTAINERS
 file
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmF0aW9uYWxlOiB0aGlzIHdpbGwgYWxsb3cgdXMgdG8gdXNlIGdldF9tYWludGFpbmVyLnBsIC8K
YWRkX21haW50YWluZXJzLnBsIHNjcmlwdHMgZnJvbSB4ZW4uZ2l0CgpTaWduZWQtb2ZmLWJ5OiBM
YXJzIEt1cnRoIDxsYXJzLmt1cnRoQGNpdHJpeC5jb20+Ci0tLQogTUFJTlRBSU5FUlMgfCAxMSAr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBNQUlOVEFJTkVSUwoKZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5F
UlMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4uZGUyYWVkYgotLS0gL2Rldi9u
dWxsCisrKyBiL01BSU5UQUlORVJTCkBAIC0wLDAgKzEsMTEgQEAKK1RoaXMgZmlsZSBmb2xsb3dz
IHRoZSBzYW1lIGNvbnZlbnRpb25zIGFzIG91dGxpbmVkIGluCit4ZW4uZ2l0Ok1BSU5UQUlORVJT
LiBQbGVhc2UgcmVmZXIgdG8gdGhlIGZpbGUgaW4geGVuLmdpdAorZm9yIG1vcmUgaW5mb3JtYXRp
b24uCisKK1RIRSBSRVNUCitNOglLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9y
YWNsZS5jb20+CitNOglSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxAY2l0cml4LmNvbT4K
K0w6CXhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZworUzoJU3VwcG9ydGVkCitGOgkqCitG
OgkqLwotLSAKMi4xMy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
