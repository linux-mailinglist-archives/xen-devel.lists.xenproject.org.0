Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E090189FB7
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 16:34:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEaf1-0004D5-SG; Wed, 18 Mar 2020 15:31:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oAGh=5D=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jEaf0-0004D0-Mg
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 15:31:10 +0000
X-Inumbo-ID: 7e2cfed8-692d-11ea-a6c1-bc764e2007e4
Received: from mail-io1-f65.google.com (unknown [209.85.166.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e2cfed8-692d-11ea-a6c1-bc764e2007e4;
 Wed, 18 Mar 2020 15:31:10 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id w7so9965210ioj.12
 for <xen-devel@lists.xenproject.org>; Wed, 18 Mar 2020 08:31:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/76UvJy6OeIKDYTXb/6xD3lANvZvEuCLiJyx9INQAWg=;
 b=YMc84eD+2vCLLgNMO9mYiaVLsB8bh05G9f9f+g6A9/bP+JNfdjvpv2XUdIdzpdO6+p
 n+Sd59Z/psR/LOmpr9FVfV04s2MKuySGPV4uxBUyzh3yPebYbclApvo4dgYV2eNnsnvW
 fjG++8pdP8yb1kD3MBVZsEueAFcNcE+F9cf4tNxU9MYSChPAG4YtUR8BzP1iyPbXkO0A
 Ss2gMnk2WM/tlVzQcDkiQcSfHeNWuAYBVX4pOpGanb3Tsd5R4e+s+xngBT4cEDG9Mo9j
 McRsbgZy0Ca15aGyhJUUd/ZkYZP3eH3Ww8wI0MtbSMP99DfjRV6xfzQTBNbV+k1qW8S5
 athw==
X-Gm-Message-State: ANhLgQ3JUArpF2UW9V5+MaGuwL8WlGojvMD3lhAUheANBcNWijSlw6TN
 +Teng38+XuYE0ch2NlnTdKdVx1ssnNM=
X-Google-Smtp-Source: ADFU+vu9Hemq9tVyVpnrHa9BSC6b+aKU2KQcunQK2jdU5FE3MXDHD4pNttFKElKDq7vcvnaNTUDEPw==
X-Received: by 2002:a6b:3b50:: with SMTP id i77mr4293266ioa.145.1584545469304; 
 Wed, 18 Mar 2020 08:31:09 -0700 (PDT)
Received: from t0.lan (c-71-205-12-124.hsd1.co.comcast.net. [71.205.12.124])
 by smtp.googlemail.com with ESMTPSA id t12sm2768458ilf.60.2020.03.18.08.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 08:31:08 -0700 (PDT)
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 18 Mar 2020 09:31:06 -0600
Message-Id: <20200318153106.118281-1-tamas@tklengyel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/mem_sharing: move mem_sharing_domain
 declaration
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHVlIHRvIHJlY2VudCByZXNodWZmbGluZyBvZiBoZWFkZXIgaW5jbHVkZSBwYXRocyBtZW1fc2hh
cmluZyBubyBsb25nZXIKY29tcGlsZXMuIEZpeCBpdCBieSBtb3ZpbmcgbWVtX3NoYXJpbmdfZG9t
YWluIGRlY2xhcmF0aW9uIHRvIGxvY2F0aW9uIGl0CmlzIHVzZWQgaW4uCgpTaWduZWQtb2ZmLWJ5
OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+Ci0tLQogeGVuL2luY2x1ZGUv
YXNtLXg4Ni9odm0vZG9tYWluLmggIHwgMTMgKysrKysrKysrKysrKwogeGVuL2luY2x1ZGUvYXNt
LXg4Ni9tZW1fc2hhcmluZy5oIHwgMTEgLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTMg
aW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUv
YXNtLXg4Ni9odm0vZG9tYWluLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9kb21haW4uaApp
bmRleCA2MjRhNjdkMGRkLi45NWZlMThjZGRjIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20t
eDg2L2h2bS9kb21haW4uaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9kb21haW4uaApA
QCAtNjQsNiArNjQsMTkgQEAgc3RydWN0IGh2bV9pb3JlcV9zZXJ2ZXIgewogICAgIHVpbnQ4X3Qg
ICAgICAgICAgICAgICAgYnVmaW9yZXFfaGFuZGxpbmc7CiB9OwogCisjaWZkZWYgQ09ORklHX01F
TV9TSEFSSU5HCitzdHJ1Y3QgbWVtX3NoYXJpbmdfZG9tYWluCit7CisgICAgYm9vbCBlbmFibGVk
OworCisgICAgLyoKKyAgICAgKiBXaGVuIHJlbGVhc2luZyBzaGFyZWQgZ2ZuJ3MgaW4gYSBwcmVl
bXB0aWJsZSBtYW5uZXIsIHJlY2FsbCB3aGVyZQorICAgICAqIHRvIHJlc3VtZSB0aGUgc2VhcmNo
LgorICAgICAqLworICAgIHVuc2lnbmVkIGxvbmcgbmV4dF9zaGFyZWRfZ2ZuX3RvX3JlbGlucXVp
c2g7Cit9OworI2VuZGlmCisKIC8qCiAgKiBUaGlzIHN0cnVjdHVyZSBkZWZpbmVzIGZ1bmN0aW9u
IGhvb2tzIHRvIHN1cHBvcnQgaGFyZHdhcmUtYXNzaXN0ZWQKICAqIHZpcnR1YWwgaW50ZXJydXB0
IGRlbGl2ZXJ5IHRvIGd1ZXN0LiAoZS5nLiBWTVggUEkgYW5kIFNWTSBBVklDKS4KZGlmZiAtLWdp
dCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbWVtX3NoYXJpbmcuaCBiL3hlbi9pbmNsdWRlL2FzbS14
ODYvbWVtX3NoYXJpbmcuaAppbmRleCA1Mzc2MGEyODk2Li41M2I3OTI5ZDBlIDEwMDY0NAotLS0g
YS94ZW4vaW5jbHVkZS9hc20teDg2L21lbV9zaGFyaW5nLmgKKysrIGIveGVuL2luY2x1ZGUvYXNt
LXg4Ni9tZW1fc2hhcmluZy5oCkBAIC0yNiwxNyArMjYsNiBAQAogCiAjaWZkZWYgQ09ORklHX01F
TV9TSEFSSU5HCiAKLXN0cnVjdCBtZW1fc2hhcmluZ19kb21haW4KLXsKLSAgICBib29sIGVuYWJs
ZWQ7Ci0KLSAgICAvKgotICAgICAqIFdoZW4gcmVsZWFzaW5nIHNoYXJlZCBnZm4ncyBpbiBhIHBy
ZWVtcHRpYmxlIG1hbm5lciwgcmVjYWxsIHdoZXJlCi0gICAgICogdG8gcmVzdW1lIHRoZSBzZWFy
Y2guCi0gICAgICovCi0gICAgdW5zaWduZWQgbG9uZyBuZXh0X3NoYXJlZF9nZm5fdG9fcmVsaW5x
dWlzaDsKLX07Ci0KICNkZWZpbmUgbWVtX3NoYXJpbmdfZW5hYmxlZChkKSAoKGQpLT5hcmNoLmh2
bS5tZW1fc2hhcmluZy5lbmFibGVkKQogCiAvKiBBdWRpdGluZyBvZiBtZW1vcnkgc2hhcmluZyBj
b2RlPyAqLwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
