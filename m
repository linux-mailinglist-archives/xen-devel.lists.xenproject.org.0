Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 749AE4E39C
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 11:33:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heFs8-0006zh-R7; Fri, 21 Jun 2019 09:30:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SSIY=UU=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1heFs6-0006zc-9s
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 09:30:14 +0000
X-Inumbo-ID: 2b1229b1-9407-11e9-8980-bc764e045a96
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5301::4])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2b1229b1-9407-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 09:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1561109411;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=xxdswEIu/QTUWfLGt8VS7MJmXb2fumz0I97gZTr1xpc=;
 b=JwoHAiu9o6+vTQVxJysxv5GlwLOh8Odd2RUFkLzwG7sgLa2+2R5cZPmqI4XlVGYfq7
 Cw1iUurd1hY6FvfJFRPMixjFSaBeG+7KCz7NmUqWs4/VqFyXzDpc+lXFwKZccQVHUmsd
 M8wTF/Ef9o1+p4ciTaaf/WfetOh2+HJhV9EcpIszVuV/P+72cTzfJIQ18dhMuWBv6Pgb
 WdyV7s6P3lyrZR9vkk2FuPt+D+zkK/zb1KGRH6fg9DEh32lkvEPh1ExSk0rBvJb0Dj2w
 ya0EFbqNQUHu7GpR/wuwdVdZRpTIUCCPvRhLSplTPaI3XQYK5+A3ng7nUX9d6vRAY8jo
 K5nw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuznLRsvz6zGrN/JP2665"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.24 AUTH)
 with ESMTPSA id 60b3d8v5L9U7B6b
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Fri, 21 Jun 2019 11:30:07 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Date: Fri, 21 Jun 2019 11:30:05 +0200
Message-Id: <20190621093005.29329-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v1] docs: substitute XEN_CONFIG_DIR in xl.conf.5
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
Cc: Olaf Hering <olaf@aepfle.de>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

eGwoMSkgb3BlbnMgeGwuY29uZiBpbiBYRU5fQ09ORklHX0RJUi4KU3Vic3RpdHV0ZSB0aGlzIHZh
cmlhYmxlIGFsc28gaW4gdGhlIG1hbiBwYWdlLgoKU2lnbmVkLW9mZi1ieTogT2xhZiBIZXJpbmcg
PG9sYWZAYWVwZmxlLmRlPgotLS0KIGRvY3MvbWFuL3hsLjEucG9kLmluICAgICAgfCAyICstCiBk
b2NzL21hbi94bC5jb25mLjUucG9kLmluIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZG9jcy9tYW4veGwuMS5wb2Qu
aW4gYi9kb2NzL21hbi94bC4xLnBvZC5pbgppbmRleCAzZDY0ZWFhNWIyLi5mYjE3MTUzNjM1IDEw
MDY0NAotLS0gYS9kb2NzL21hbi94bC4xLnBvZC5pbgorKysgYi9kb2NzL21hbi94bC4xLnBvZC5p
bgpAQCAtNTAsNyArNTAsNyBAQCBzZXR1cCB0aGUgYnJpZGdlLgogCiBJZiB5b3Ugc3BlY2lmeSB0
aGUgYW1vdW50IG9mIG1lbW9yeSBkb20wIGhhcywgcGFzc2luZyBCPGRvbTBfbWVtPiB0bwogWGVu
LCBpdCBpcyBoaWdobHkgcmVjb21tZW5kZWQgdG8gZGlzYWJsZSBCPGF1dG9iYWxsb29uPi4gRWRp
dAotQjwvZXRjL3hlbi94bC5jb25mPiBhbmQgc2V0IGl0IHRvIDAuCitCPEBYRU5fQ09ORklHX0RJ
UkAveGwuY29uZj4gYW5kIHNldCBpdCB0byAwLgogCiA9aXRlbSBydW4geGwgYXMgQjxyb290Pgog
CmRpZmYgLS1naXQgYS9kb2NzL21hbi94bC5jb25mLjUucG9kLmluIGIvZG9jcy9tYW4veGwuY29u
Zi41LnBvZC5pbgppbmRleCAyYmViMjExOWE4Li5iMTYwMzZhYWViIDEwMDY0NAotLS0gYS9kb2Nz
L21hbi94bC5jb25mLjUucG9kLmluCisrKyBiL2RvY3MvbWFuL3hsLmNvbmYuNS5wb2QuaW4KQEAg
LTEsNiArMSw2IEBACiA9aGVhZDEgTkFNRQogCi0vZXRjL3hlbi94bC5jb25mIC0gWEwgR2xvYmFs
L0hvc3QgQ29uZmlndXJhdGlvbiAKK0BYRU5fQ09ORklHX0RJUkAveGwuY29uZiAtIFhMIEdsb2Jh
bC9Ib3N0IENvbmZpZ3VyYXRpb24gCiAKID1oZWFkMSBERVNDUklQVElPTgogCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
