Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A890B10733
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 12:50:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLmnN-0005hp-10; Wed, 01 May 2019 10:49:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9pMH=TB=citrix.com=prvs=01726d3a8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hLmnL-0005gL-Jg
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 10:48:59 +0000
X-Inumbo-ID: b7387bb2-6bfe-11e9-b2ec-ef05a20ef145
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b7387bb2-6bfe-11e9-b2ec-ef05a20ef145;
 Wed, 01 May 2019 10:48:55 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,417,1549929600"; d="scan'208";a="84837311"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 1 May 2019 11:48:29 +0100
Message-ID: <20190501104839.21621-6-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190501104839.21621-1-ian.jackson@eu.citrix.com>
References: <20190501104839.21621-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH v2 05/15] arch replumbing:
 ts-debian-di-install: Remove unidiomatic { }
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmph
Y2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiB0cy1kZWJpYW4tZGktaW5zdGFsbCB8IDQgKystLQog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS90cy1kZWJpYW4tZGktaW5zdGFsbCBiL3RzLWRlYmlhbi1kaS1pbnN0YWxsCmluZGV4IDM2
MWExNzEwLi41Y2IzZDM1ZCAxMDA3NTUKLS0tIGEvdHMtZGViaWFuLWRpLWluc3RhbGwKKysrIGIv
dHMtZGViaWFuLWRpLWluc3RhbGwKQEAgLTE1MiwxMCArMTUyLDEwIEBAIHN1YiBzZXR1cF9uZXRi
b290KCQkJCkKIAlkaWUgaWYgJHJ7ICIkZ2hvLT57R3Vlc3R9X25ldGJvb3Rfa2VybmVsIiB9CiAJ
fHwgICAgICRyeyAiJGdoby0+e0d1ZXN0fV9uZXRib290X3JhbWRpc2siIH07CiAKLQlteSAkZGlf
cGF0aCA9ICRje1RmdHBQYXRofS4nLycuJGdoby0+e1RmdHB9e0RpQmFzZX0uJy8nLiR7YXJjaH0u
Jy8nLgorCW15ICRkaV9wYXRoID0gJGN7VGZ0cFBhdGh9LicvJy4kZ2hvLT57VGZ0cH17RGlCYXNl
fS4nLycuJGFyY2guJy8nLgogCSAgICBkZWJpYW5fZ3Vlc3RfZGlfdmVyc2lvbigkZ2hvKS4nLScu
JGdoby0+e1N1aXRlfTsKIAotICAgICAgICBpZiAoJHthcmNofSA9fiBtL2FtZDY0fGkzODYvKSB7
CisgICAgICAgIGlmICgkYXJjaCA9fiBtL2FtZDY0fGkzODYvKSB7CiAJICAgICRrZXJuZWwgPSAi
JGRpX3BhdGgvdm1saW51ei14ZW4iOwogCSAgICAkcmFtZGlzayA9ICIkZGlfcGF0aC9pbml0cmQu
Z3oteGVuIjsKICAgICAgICAgfSBlbHNlIHsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
