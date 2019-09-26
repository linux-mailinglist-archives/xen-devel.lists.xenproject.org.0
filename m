Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0338FBF4FB
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 16:24:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDUex-0007cH-4e; Thu, 26 Sep 2019 14:22:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KCTf=XV=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iDUev-0007cB-LK
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 14:22:17 +0000
X-Inumbo-ID: 0a662472-e069-11e9-bf31-bc764e2007e4
Received: from mail-lf1-x129.google.com (unknown [2a00:1450:4864:20::129])
 by localhost (Halon) with ESMTPS
 id 0a662472-e069-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 14:22:16 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id y127so1876590lfc.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2019 07:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=F+lLDVKEInDDLZ4wBdlhAUTPF4RpelcELyyw5CAPfVM=;
 b=P3dlxqbdZIHxH7/DkCtj2R4jfX8AcgiVhzA+vmK7zUTU6jM0ImUY9i8lzfagDjBQkd
 hd4h53Mit5HaZWTpBKil4AUq0aJAlpxzFL9jIimPdR8tekXt/FNMbOVSGSq+VM4SLAYj
 VCQ+rHnhHjx4odF4JlkerOHyaR7SwRwCqsX+E4m9PeRZ3wQU4QcT4zSnfUUrBzTu9xS3
 wHIPSKjZU8FGWedbJM3c6NqH1zUBiewBYkSdIgZ2Cm/rUAY+SmpKs6nAZkvmWUko7wIB
 gxz57MpdCf5dffhjWSPFl9khWuPtegQa7+6zIX9bcAV1V/sUlHdme1IQVQmY3RCgKo0S
 A/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=F+lLDVKEInDDLZ4wBdlhAUTPF4RpelcELyyw5CAPfVM=;
 b=nVljri7QEofaJLLM2NxP4+zm468Nj080VXp20V46QbF5g2FI4t+xTbmrdVcxm6cXpA
 P6A7lPiIdEUptRQFzz0G8AxaH4gN5cj/5DX8iuqc3hnZmAx3RAr1OKLSE23fDaEQpC3p
 oEKJ1ahRWkmgxyXaXhYjj1bC4Kv2i6yALVJd1IxOkepKWqCoFxZnwUVgdQjtypDhMerC
 Bx3v29M0NByl6VGkHqss5IkijxJWtSGccB0uJwPShE3CCH+l5XBf0cT/yU+4enFPf7uJ
 G2sOpwlC8V7Qi6TUgDn4C9SzagQiH54cWjm0aB91kakkCB1ysE1Ux5CUxFZqxXQacNm/
 OWCw==
X-Gm-Message-State: APjAAAXs+kN0s/wQrqOZ8F8HdWHWfcRZneV4xtAWIvWp3TElgFhbEC1s
 CtdT9GU2Bg5z0oA3S1kc63DaC5+t614=
X-Google-Smtp-Source: APXvYqzDOUycyFc47vBs+e2rdnNoryDB4xwtp6UT7dl7Sojv3CDz0hMiCk5+t07gjxse3blO6LjC5g==
X-Received: by 2002:a05:6512:14c:: with SMTP id
 m12mr2321114lfo.27.1569507735622; 
 Thu, 26 Sep 2019 07:22:15 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id t24sm537405ljc.23.2019.09.26.07.22.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 26 Sep 2019 07:22:15 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 26 Sep 2019 17:22:02 +0300
Message-Id: <1569507722-16981-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [PATCH] SUPPORT.md: Describe Renesas IPMMU-VMSA support
 (Arm)
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
Cc: sstabellini@kernel.org, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 Jan Beulich <jbeulich@suse.com>, volodymyr_babchuk@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKUmVuZXNhcyBJUE1NVS1WTVNBIHN1cHBvcnQgKEFybSkgY2FuIGJlIGNvbnNpZGVyZWQKYXMg
VGVjaG5vbG9naWNhbCBQcmV2aWV3IGZlYXR1cmUuCgpTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIg
VHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+Ci0tLQpQbGVhc2Ugbm90
ZSwgc2hvdWxkIG9ubHkgZ28gaW4gYWZ0ZXI6Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
YXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wOS9tc2cwMjcwNy5odG1sCgpDQzogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ0M6IEdlb3JnZSBEdW5sYXAgPEdl
b3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KQ0M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBl
dS5jaXRyaXguY29tPgpDQzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDQzogSnVs
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ0M6IEtvbnJhZCBSemVzenV0ZWsgV2ls
ayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4KQ0M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgpDQzogV2VpIExp
dSA8d2xAeGVuLm9yZz4KLS0tCiBTVVBQT1JULm1kIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9TVVBQT1JULm1kIGIvU1VQUE9SVC5tZAppbmRleCAz
NzU0NzNhLi4xMDBhM2IxIDEwMDY0NAotLS0gYS9TVVBQT1JULm1kCisrKyBiL1NVUFBPUlQubWQK
QEAgLTY0LDYgKzY0LDcgQEAgc3VwcG9ydGVkIGluIHRoaXMgZG9jdW1lbnQuCiAgICAgU3RhdHVz
LCBJbnRlbCBWVC1kOiBTdXBwb3J0ZWQKICAgICBTdGF0dXMsIEFSTSBTTU1VdjE6IFN1cHBvcnRl
ZAogICAgIFN0YXR1cywgQVJNIFNNTVV2MjogU3VwcG9ydGVkCisgICAgU3RhdHVzLCBSZW5lc2Fz
IElQTU1VLVZNU0E6IFRlY2ggUHJldmlldwogCiAjIyMgQVJNL0dJQ3YzIElUUwogCi0tIAoyLjcu
NAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
