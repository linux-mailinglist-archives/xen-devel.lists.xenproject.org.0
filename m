Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 076CB183A9E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 21:26:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCUNO-0000UL-5l; Thu, 12 Mar 2020 20:24:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xLcY=45=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jCUNM-0000UG-1R
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 20:24:16 +0000
X-Inumbo-ID: 70ebbf13-649f-11ea-b21f-12813bfff9fa
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 70ebbf13-649f-11ea-b21f-12813bfff9fa;
 Thu, 12 Mar 2020 20:24:15 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id m25so9117293edq.8
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2020 13:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Xw6QgFWKdCqZZf/x6qZD9uafUzz7v1orx5Mlam9cZ6c=;
 b=RACDPYaJ4zf75fmDjlZT+pCMNzPSds3fEug8ZdM2PvcFXTRPnP3kTdjdNaE4Rfapw+
 FaYeZOFqfpTNKBPx+hXb939DgezsOXCZg4qApciVzqs89oQs+Cblv5a7OMauTv+xj+kq
 /GFEvnoQlTgFu1McZV33MZTYnxoDkzs0mPOEjxZezxrdZh92jsN9rlIykqd2xo5rd+7v
 yoOOzVhITzKP31S/+7t5AnvxIWPaQNl/nlOxXQhj+ZSSiU2/a1MYJGzUB0opmTGkvJ6v
 AbogA4yumib8IOwo31TLvH3/IrV//dFl1i6Z2hUnB0mIweRG1y8iJ427ZRs1O/4PJq5O
 rxSg==
X-Gm-Message-State: ANhLgQ1ADHiipmQXo4YqU4y+PbbpwIXcyqtSdOhti/HpTa0GTzpAsqfn
 uK/DaamQ5O7bvHpwb0xKa/pN16XwjKxN7A==
X-Google-Smtp-Source: ADFU+vvnLjI11TZ5eI+F13FzDb+ckEYlEWwu9IQLJmKlwvC7hQ10yTJg4giNsjj+IPMEgkqWyhdz4Q==
X-Received: by 2002:a05:6402:1acf:: with SMTP id
 ba15mr9466723edb.279.1584044654192; 
 Thu, 12 Mar 2020 13:24:14 -0700 (PDT)
Received: from ufe34d9ed68d054.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id p34sm280815edb.63.2020.03.12.13.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 13:24:13 -0700 (PDT)
From: julien@xen.org
To: xen-devel@lists.xenproject.org
Date: Thu, 12 Mar 2020 20:24:07 +0000
Message-Id: <20200312202407.1154-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH] tools/helpers: xen-init-dom0: Mark
 clear_domid_history() static
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
Cc: Julien Grall <jgrall@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, paul@xen.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KCnhlbi1pbml0LWRvbTAgaXMg
YSBzdGFuZGFsb25lIGJpbmFyeSwgc28gYWxsIHRoZSBmdW5jdGlvbnMgYnV0IHRoZQptYWluKCkg
c2hvdWxkIGJlIHN0YXRpYy4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFt
YXpvbi5jb20+CkNjOiBwYXVsQHhlbi5vcmcKLS0tCiB0b29scy9oZWxwZXJzL3hlbi1pbml0LWRv
bTAuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2hlbHBlcnMveGVuLWluaXQtZG9tMC5jIGIvdG9vbHMvaGVs
cGVycy94ZW4taW5pdC1kb20wLmMKaW5kZXggNTZmNjlhYjY2Zi4uYzk5MjI0YTRiNiAxMDA2NDQK
LS0tIGEvdG9vbHMvaGVscGVycy94ZW4taW5pdC1kb20wLmMKKysrIGIvdG9vbHMvaGVscGVycy94
ZW4taW5pdC1kb20wLmMKQEAgLTEyLDcgKzEyLDcgQEAKICNkZWZpbmUgRE9NTkFNRV9QQVRIICAg
Ii9sb2NhbC9kb21haW4vMC9uYW1lIgogI2RlZmluZSBET01JRF9QQVRIICAgICAiL2xvY2FsL2Rv
bWFpbi8wL2RvbWlkIgogCi1pbnQgY2xlYXJfZG9taWRfaGlzdG9yeSh2b2lkKQorc3RhdGljIGlu
dCBjbGVhcl9kb21pZF9oaXN0b3J5KHZvaWQpCiB7CiAgICAgaW50IHJjID0gMTsKICAgICB4ZW50
b29sbG9nX2xvZ2dlcl9zdGRpb3N0cmVhbSAqbG9nZ2VyOwotLSAKMi4xNy4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
