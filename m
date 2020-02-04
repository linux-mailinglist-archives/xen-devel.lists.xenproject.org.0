Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9762151EC4
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 17:56:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iz1SV-0001MM-K7; Tue, 04 Feb 2020 16:53:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cOUj=3Y=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iz1ST-0001M8-Rh
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 16:53:53 +0000
X-Inumbo-ID: ec940064-476e-11ea-b211-bc764e2007e4
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec940064-476e-11ea-b211-bc764e2007e4;
 Tue, 04 Feb 2020 16:53:53 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t2so24004988wrr.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2020 08:53:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=X8EdGDnQtSogtP1to11CJyL0dhAEnaw0uAljyFQ0VF8=;
 b=WESpffjeasIc4jGurBhD5tjwL3hb90ieyzCEECz/30IbfJF8VDIu4E/R0pribtP2GS
 aWTbIP2tpUK0P17wSro+PBOnHli6Ggq6Mr7YAWreTEwUaEu9JGJxfSTf05UO2Aamvxbs
 qYCASvgHWm3mo/gmzdJtnDztAwY+RoLQLeYwclSj2ecTqgmsfAGivB/+RpbwJrFA9rU+
 wKA+RUmNdFzJEEuz60QPdXIUiZ4mZKqDCiLoucbX2KPfy/yLvHoGlv0gQ3BiYyPw3cee
 ZzXo7JtC/z4Mr+91LPG4Kzxcz0XQXm32XwevTeROEIOPVGVrpYEluKIynbhP+XIFOsym
 RloQ==
X-Gm-Message-State: APjAAAXSg+5zVclGVZ3QOMM9PVRIA1ERjAbgB+dk2x8oxN3e2XLHdcJu
 QDNkl7QzMEDF59fEA3mpHg1P2iNN39s=
X-Google-Smtp-Source: APXvYqywUaiXW8f2PTrsoSH2R/NgmDX+cTG3sU6STCT+UcioPY5EA5HaY0O4xVWXXWZZjo6qvXKYjQ==
X-Received: by 2002:a5d:53c1:: with SMTP id a1mr22393979wrw.373.1580835232473; 
 Tue, 04 Feb 2020 08:53:52 -0800 (PST)
Received: from ufe34d9ed68d054.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id a1sm30623752wrr.80.2020.02.04.08.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 08:53:51 -0800 (PST)
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Tue,  4 Feb 2020 16:53:49 +0000
Message-Id: <20200204165349.6404-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH] xen/include: Fix typoes in asm-x86/domain.h
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KClNpZ25lZC1vZmYtYnk6IEp1
bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+Ci0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9k
b21haW4uaCB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2RvbWFpbi5oIGIveGVu
L2luY2x1ZGUvYXNtLXg4Ni9kb21haW4uaAppbmRleCBhM2FlNWQ5YTIwLi5mMGMyNWZmZWMwIDEw
MDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2RvbWFpbi5oCisrKyBiL3hlbi9pbmNsdWRl
L2FzbS14ODYvZG9tYWluLmgKQEAgLTk3LDcgKzk3LDcgQEAgc3RydWN0IHNoYWRvd19kb21haW4g
ewogICAgIHN0cnVjdCBwYWdlX2xpc3RfaGVhZCBmcmVlbGlzdDsKICAgICB1bnNpZ25lZCBpbnQg
ICAgICB0b3RhbF9wYWdlczsgIC8qIG51bWJlciBvZiBwYWdlcyBhbGxvY2F0ZWQgKi8KICAgICB1
bnNpZ25lZCBpbnQgICAgICBmcmVlX3BhZ2VzOyAgIC8qIG51bWJlciBvZiBwYWdlcyBvbiBmcmVl
bGlzdHMgKi8KLSAgICB1bnNpZ25lZCBpbnQgICAgICBwMm1fcGFnZXM7ICAgIC8qIG51bWJlciBv
ZiBwYWdlcyBhbGxvY2F0ZXMgdG8gcDJtICovCisgICAgdW5zaWduZWQgaW50ICAgICAgcDJtX3Bh
Z2VzOyAgICAvKiBudW1iZXIgb2YgcGFnZXMgYWxsb2NhdGVkIHRvIHAybSAqLwogCiAgICAgLyog
MS10by0xIG1hcCBmb3IgdXNlIHdoZW4gSFZNIHZjcHVzIGhhdmUgcGFnaW5nIGRpc2FibGVkICov
CiAgICAgcGFnZXRhYmxlX3QgdW5wYWdlZF9wYWdldGFibGU7CkBAIC0xNjEsNyArMTYxLDcgQEAg
c3RydWN0IGhhcF9kb21haW4gewogICAgIHN0cnVjdCBwYWdlX2xpc3RfaGVhZCBmcmVlbGlzdDsK
ICAgICB1bnNpZ25lZCBpbnQgICAgICB0b3RhbF9wYWdlczsgIC8qIG51bWJlciBvZiBwYWdlcyBh
bGxvY2F0ZWQgKi8KICAgICB1bnNpZ25lZCBpbnQgICAgICBmcmVlX3BhZ2VzOyAgIC8qIG51bWJl
ciBvZiBwYWdlcyBvbiBmcmVlbGlzdHMgKi8KLSAgICB1bnNpZ25lZCBpbnQgICAgICBwMm1fcGFn
ZXM7ICAgIC8qIG51bWJlciBvZiBwYWdlcyBhbGxvY2F0ZXMgdG8gcDJtICovCisgICAgdW5zaWdu
ZWQgaW50ICAgICAgcDJtX3BhZ2VzOyAgICAvKiBudW1iZXIgb2YgcGFnZXMgYWxsb2NhdGVkIHRv
IHAybSAqLwogfTsKIAogLyoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKi8KLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
