Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B10BB13DD
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 19:43:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8T4k-0005V4-60; Thu, 12 Sep 2019 17:40:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UuS5=XH=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1i8T4i-0005Uz-QF
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 17:40:08 +0000
X-Inumbo-ID: 5cbb3694-d584-11e9-b299-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5cbb3694-d584-11e9-b299-bc764e2007e4;
 Thu, 12 Sep 2019 17:40:08 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@citrix.com>)
 id 1i8T4h-0006Yw-Q2; Thu, 12 Sep 2019 17:40:07 +0000
Received: from localhost ([127.0.0.1] helo=localhost.localdomain)
 by xenbits.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@citrix.com>)
 id 1i8T4h-0000st-Ji; Thu, 12 Sep 2019 17:40:07 +0000
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 12 Sep 2019 18:39:51 +0100
Message-Id: <20190912173951.3232-1-lars.kurth@citrix.com>
X-Mailer: git-send-email 2.13.0
Subject: [Xen-devel] [PATCH OSSTEST] Introduce a MAINTAINERS file
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
Cc: Lars Kurth <lars.kurth@citrix.com>, Ian Jackson <ian.jackson@citrix.com>
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
b24uCisKK1RIRSBSRVNUCitNOiAgICBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AY2l0cml4LmNv
bT4KK0w6ICAgIHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZworUzogICAgU3VwcG9ydGVk
CitGOiAgICAqCitGOiAgICAqLworVjogICAgeGVuLW1haW50YWluZXJzLTEKLS0gCjIuMTMuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
