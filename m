Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 217AC14BD3B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 16:49:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwT4I-0002Pj-PN; Tue, 28 Jan 2020 15:46:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4GxB=3R=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1iwT4G-0002Pe-Is
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 15:46:21 +0000
X-Inumbo-ID: 52f08d6c-41e5-11ea-8396-bc764e2007e4
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5301::10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 52f08d6c-41e5-11ea-8396-bc764e2007e4;
 Tue, 28 Jan 2020 15:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1580226378;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=tL/1EY2Kjpt6lH1vf/lunytuHcFLqHKrd4LkHAh1JEk=;
 b=aDd5XJitAfY0GiPQWbkBHNHp4YqK9mKak7e1naj6uVQP7Tz3dGCDDKhYQAR5iZ3Gd3
 4TFGE7Yk06Sj747aN2UJSDiIVEHo6BVz0511mujqAU7MmNTWw/6anDScz2ouStA+nw3b
 yQR9C+qOpPFq4fzYbmG7eWCtZ+gwH9mn6vX2gmR7wWYz/b1n5HHzdnt0vKBG5yqP6MPs
 K+oHCROUFonBrSTHtDV54IdNUPodU8BE/3/PfhF9XTr7DIAVcj2YAgEsi+FZzPhgklpp
 dICuJPqhqOfbZcATOgiuHm0Wy/ifEDf6iDE36fdiL7xJ7nsiKZFkfKd0/Uzq1LbBzFTu
 L/RQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS32xJjw=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.1.7 SBL|AUTH)
 with ESMTPSA id j07b1dw0SFkGIYS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 28 Jan 2020 16:46:16 +0100 (CET)
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Tue, 28 Jan 2020 16:46:14 +0100
Message-Id: <20200128154614.30572-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v1] x86/domctl: fix typo in comment
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
Cc: Olaf Hering <olaf@aepfle.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGFycmF5IGlzIG5hbWVkIG1zcl9wb2xpY3kuCgpGaXhlcyBjb21taXQgNjA1MjlkZmVjYTEK
ClNpZ25lZC1vZmYtYnk6IE9sYWYgSGVyaW5nIDxvbGFmQGFlcGZsZS5kZT4KLS0tCiB4ZW4vaW5j
bHVkZS9wdWJsaWMvZG9tY3RsLmggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3Rs
LmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgKaW5kZXggZTMxM2RhNDk5Zi4uMmJiNzM5
NzkyMyAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oCisrKyBiL3hlbi9p
bmNsdWRlL3B1YmxpYy9kb21jdGwuaApAQCAtNjc1LDcgKzY3NSw3IEBAIHN0cnVjdCB4ZW5fZG9t
Y3RsX2NwdV9wb2xpY3kgewogICAgIHVpbnQzMl90IG5yX2xlYXZlczsgLyogSU4vT1VUOiBOdW1i
ZXIgb2YgbGVhdmVzIGluL3dyaXR0ZW4gdG8KICAgICAgICAgICAgICAgICAgICAgICAgICAqICdj
cHVpZF9wb2xpY3knLiAqLwogICAgIHVpbnQzMl90IG5yX21zcnM7ICAgLyogSU4vT1VUOiBOdW1i
ZXIgb2YgTVNScyBpbi93cml0dGVuIHRvCi0gICAgICAgICAgICAgICAgICAgICAgICAgKiAnbXNy
X2RvbWFpbl9wb2xpY3knICovCisgICAgICAgICAgICAgICAgICAgICAgICAgKiAnbXNyX3BvbGlj
eScgKi8KICAgICBYRU5fR1VFU1RfSEFORExFXzY0KHhlbl9jcHVpZF9sZWFmX3QpIGNwdWlkX3Bv
bGljeTsgLyogSU4vT1VUICovCiAgICAgWEVOX0dVRVNUX0hBTkRMRV82NCh4ZW5fbXNyX2VudHJ5
X3QpIG1zcl9wb2xpY3k7ICAgIC8qIElOL09VVCAqLwogCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
