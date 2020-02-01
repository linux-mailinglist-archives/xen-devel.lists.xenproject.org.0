Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AED14F5AC
	for <lists+xen-devel@lfdr.de>; Sat,  1 Feb 2020 02:23:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixhSn-0001oR-P1; Sat, 01 Feb 2020 01:20:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=U5Sr=3V=prgmr.com=srn@srs-us1.protection.inumbo.net>)
 id 1ixhSl-0001oB-VN
 for xen-devel@lists.xenproject.org; Sat, 01 Feb 2020 01:20:44 +0000
X-Inumbo-ID: 109aaa5c-4491-11ea-b211-bc764e2007e4
Received: from mail.prgmr.com (unknown [2605:2700:0:5::4713:9506])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 109aaa5c-4491-11ea-b211-bc764e2007e4;
 Sat, 01 Feb 2020 01:20:43 +0000 (UTC)
Received: from localhost.localdomain (c-174-62-72-237.hsd1.ca.comcast.net
 [174.62.72.237]) (Authenticated sender: srn)
 by mail.prgmr.com (Postfix) with ESMTPSA id BB61C72008A;
 Sat,  1 Feb 2020 01:22:35 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.prgmr.com BB61C72008A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prgmr.com;
 s=default; t=1580538155;
 bh=ObcgTufZkU5X+KlWE0DZEjaBH7Uf7j5KTZHoa1pWZiQ=;
 h=From:To:Cc:Subject:Date:From;
 b=SMnsWsgzNa7U9swgJo07o+n6/sCCt//4y/0xZxGBAJJSGdKsqSsHVS7XVohMPiMxj
 B29oaGzi1NUoeTbCG2yRH9ODiMkG8Jemsqv7oNHuee91cMDHpw0oZKQ8VBoMp7PmKy
 ZrvCjZXsVlE+BtV/9fAGbL0K4XKcloo5ewE2DHlE=
From: Sarah Newman <srn@prgmr.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 31 Jan 2020 17:20:26 -0800
Message-Id: <20200201012026.5976-1-srn@prgmr.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] docs/misc: xen-command-line: fix parameters in
 sample serial configuration
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
Cc: Sarah Newman <srn@prgmr.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIG5hbWVzIG9mIHRoZSBzZXJpYWwgcGFyYW1ldGVycyB1c2UgaHlwaGVucywgbm90IHVuZGVy
c2NvcmVzLgoKU2lnbmVkLW9mZi1ieTogU2FyYWggTmV3bWFuIDxzcm5AcHJnbXIuY29tPgotLS0K
IGRvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYyB8IDQgKystLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kb2NzL21p
c2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MgYi9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5w
YW5kb2MKaW5kZXggNWViM2EwNzI3Ni4uNTA1MTU4M2E1ZCAxMDA2NDQKLS0tIGEvZG9jcy9taXNj
L3hlbi1jb21tYW5kLWxpbmUucGFuZG9jCisrKyBiL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5l
LnBhbmRvYwpAQCAtMzY5LDggKzM2OSw4IEBAIFRoZSBhY2NlcHRlZCBuYW1lIGtleXdvcmRzIGZv
ciBuYW1lPXZhbHVlIHBhaXJzIGFyZToKIFRoZSBmb2xsb3dpbmcgYXJlIGV4YW1wbGVzIG9mIGNv
cnJlY3Qgc3BlY2lmaWNhdGlvbnM6CiAKICAgICBjb20xPTExNTIwMCw4bjEsMHgzZjgsNAotICAg
IGNvbTE9MTE1MjAwLDhuMSwweDNmOCw0LHJlZ193aWR0aD00LHJlZ19zaGlmdD0yCi0gICAgY29t
MT1iYXVkPTExNTIwMCxwYXJpdHk9bixzdG9wX2JpdHM9MSxpb19iYXNlPTB4M2Y4LHJlZ193aWR0
aD00CisgICAgY29tMT0xMTUyMDAsOG4xLDB4M2Y4LDQscmVnLXdpZHRoPTQscmVnLXNoaWZ0PTIK
KyAgICBjb20xPWJhdWQ9MTE1MjAwLHBhcml0eT1uLHN0b3AtYml0cz0xLGlvLWJhc2U9MHgzZjgs
cmVnLXdpZHRoPTQKIAogIyMjIGNvbnJpbmdfc2l6ZQogPiBgPSA8c2l6ZT5gCi0tIAoyLjE3LjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
