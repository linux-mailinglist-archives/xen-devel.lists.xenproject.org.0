Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0016EB136B
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 19:23:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8Sl0-0003AA-O6; Thu, 12 Sep 2019 17:19:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UuS5=XH=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1i8Sky-0003A5-M1
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 17:19:44 +0000
X-Inumbo-ID: 831f9486-d581-11e9-b76c-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 831f9486-d581-11e9-b76c-bc764e2007e4;
 Thu, 12 Sep 2019 17:19:44 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@citrix.com>)
 id 1i8Skx-0006BY-Ip; Thu, 12 Sep 2019 17:19:43 +0000
Received: from localhost ([127.0.0.1] helo=localhost.localdomain)
 by xenbits.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@citrix.com>)
 id 1i8Skx-00080k-Bt; Thu, 12 Sep 2019 17:19:43 +0000
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 12 Sep 2019 18:19:23 +0100
Message-Id: <20190912171923.3050-1-lars.kurth@citrix.com>
X-Mailer: git-send-email 2.13.0
Subject: [Xen-devel] [livepatch-build-tools] Add V: entry to maintainers
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

VXNhZ2Ugb2YgZ2V0X21haW50YWluZXJzLnBsIG5vdyByZXF1aXJlcyB0aGUgVjogZW50cnkgdW5k
ZXIKVEhFIFJFU1QgdG8gaWRlbnRpZnkgYSBNQUlOVEFJTkVSUyBmaWxlIGluIG9uZSBvZiB0aGUg
WGVuCnRyZWVzLiBTZWUgWzFdCgpbMV0gbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRt
bC94ZW4tZGV2ZWwvMjAxOS0wOS90aHJlYWRzLmh0bWwjMDAyNjMKClNpZ25lZC1vZmYtYnk6IExh
cnMgS3VydGggPGxhcnMua3VydGhAY2l0cml4LmNvbT4KLS0tCiBNQUlOVEFJTkVSUyB8IDEgKwog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMg
Yi9NQUlOVEFJTkVSUwppbmRleCBkZTJhZWRiLi5iOTJhOGZlIDEwMDY0NAotLS0gYS9NQUlOVEFJ
TkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAtOSwzICs5LDQgQEAgTDoJeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCiBTOglTdXBwb3J0ZWQKIEY6CSoKIEY6CSovCitWOgl4ZW4tbWFpbnRh
aW5lcnMtMQotLSAKMi4xMy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
