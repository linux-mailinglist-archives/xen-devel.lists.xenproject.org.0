Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 907F9137870
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 22:22:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iq1gW-0003Nm-Qw; Fri, 10 Jan 2020 21:19:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=viqM=27=xenproject.org=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iq1gV-0003Nh-3f
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 21:19:11 +0000
X-Inumbo-ID: d7205644-33ee-11ea-bfb8-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7205644-33ee-11ea-bfb8-12813bfff9fa;
 Fri, 10 Jan 2020 21:19:09 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@xenproject.org>)
 id 1iq1gS-0001Og-3y; Fri, 10 Jan 2020 21:19:08 +0000
Received: from localhost ([127.0.0.1] helo=MacBook-Pro-2.Home)
 by xenbits.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@xenproject.org>)
 id 1iq1gR-0006S6-VV; Fri, 10 Jan 2020 21:19:08 +0000
From: Lars Kurth <lars.kurth@xenproject.org>
To: xen-devel@lists.xenproject.org
Date: Fri, 10 Jan 2020 21:18:53 +0000
Message-Id: <89248aebf252aaabf5fce44ef4cffc7e3da38212.1578691030.git.lars.kurth@citrix.com>
X-Mailer: git-send-email 2.13.0
Subject: [Xen-devel] [PATCH] get-maintainer.pl: Dont fall over when L:
 contains a display name
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
Cc: jgross@suse.com, Lars Kurth <lars.kurth@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPgoKUHJpb3IgdG8gdGhpcyBj
aGFuZ2UgZS1tYWlsIGFkZHJlc3NlcyBvZiB0aGUgZm9ybSAiZGlzcGxheSBuYW1lCjxlbWFpbD4i
IHdvdWxkIHJlc3VsdCBpbnRvIGVtcHR5IG91dHB1dC4gQWxzbyBzZWUKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDIwLTAxL21zZzAwNzUzLmh0
bWwKClNpZ25lZC1vZmYtYnk6IExhcnMgS3VydGggPGxhcnMua3VydGhAY2l0cml4LmNvbT4KLS0t
CkNDOiBqZ3Jvc3NAc3VzZS5jb20KLS0tCiBzY3JpcHRzL2dldF9tYWludGFpbmVyLnBsIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCBiL3NjcmlwdHMvZ2V0X21haW50YWluZXIu
cGwKaW5kZXggMmU2NjFmNDdkOC4uNDhlMDczNzBlOCAxMDA3NTUKLS0tIGEvc2NyaXB0cy9nZXRf
bWFpbnRhaW5lci5wbAorKysgYi9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsCkBAIC0xMDczLDcg
KzEwNzMsNyBAQCBzdWIgYWRkX2NhdGVnb3JpZXMgewogCSAgICBteSAkcHR5cGUgPSAkMTsKIAkg
ICAgbXkgJHB2YWx1ZSA9ICQyOwogCSAgICBpZiAoJHB0eXBlIGVxICJMIikgewotCQlteSAkbGlz
dF9hZGRyZXNzID0gJHB2YWx1ZTsKKwkJbXkgKCRsaXN0X25hbWUsICRsaXN0X2FkZHJlc3MpID0g
cGFyc2VfZW1haWwoJHB2YWx1ZSk7ICAgICAgICAgICAgCiAJCW15ICRsaXN0X2FkZGl0aW9uYWwg
PSAiIjsKIAkJbXkgJGxpc3Rfcm9sZSA9IGdldF9saXN0X3JvbGUoJGkpOwogCi0tIAoyLjEzLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
