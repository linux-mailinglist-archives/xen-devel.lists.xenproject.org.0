Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D88881517FA
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 10:37:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyub9-0001DR-QZ; Tue, 04 Feb 2020 09:34:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cOUj=3Y=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iyub8-0001Ch-EE
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 09:34:22 +0000
X-Inumbo-ID: 839ca774-4731-11ea-a933-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 839ca774-4731-11ea-a933-bc764e2007e4;
 Tue, 04 Feb 2020 09:34:18 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id s144so1777387wme.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2020 01:34:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VS370gLrXj/T0EnX2y8E7F4GunVSOLL2YMmsXGW0glg=;
 b=KsB9h9AOcIieFMNRM/fzoq5WJfLB/Nrmau18aW2Wu/zzETg9Xfw/fHWs9LfdHxKEU8
 ypzsZh0M6NyaJxVQ4T85Tt4gynexahNMu9IS+esaHmD0vCTv3CYHJBfvbb1Z7pgSmGN0
 KFXvvJEkBoHZk89ymIXTT9/90WUfD9mb9CrPTmA6EHwK+oFSHX6Kpt9i79nDIBOeIyyI
 4z57WbWiJXb0D0Arx7rOta86Fb1/eCN1l2+h+/M/C928URub/BpIy31DRWpeXBRcjxQ1
 ByD14xWog15y2daYdvzExXftWi/ofPUBGnldiMkVitF6+Pk9zsp+09ixWW7D8oB2lp1a
 ySMA==
X-Gm-Message-State: APjAAAUlx5vfW5TfrNv/oQqY7HXTQyYKr4hQzvPcmMlmCyfSj0xzrs0F
 KQsWzZwjFti8bSOhyisPLMrUiIJHGPc=
X-Google-Smtp-Source: APXvYqxTxwTE/McsCJd2u4Or8WLrb/KGlOLt8fhu5gYLoBxb3z4yGoCleDI2pSccTIK5CcwSN9AnVA==
X-Received: by 2002:a05:600c:146:: with SMTP id
 w6mr5074858wmm.180.1580808856951; 
 Tue, 04 Feb 2020 01:34:16 -0800 (PST)
Received: from ufe34d9ed68d054.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id p11sm16923031wrn.40.2020.02.04.01.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 01:34:16 -0800 (PST)
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Tue,  4 Feb 2020 09:34:10 +0000
Message-Id: <20200204093411.15887-2-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200204093411.15887-1-julien@xen.org>
References: <20200204093411.15887-1-julien@xen.org>
Subject: [Xen-devel] [PATCH 1/2] xen/x86: hap: Fix coding style in
 hap_enable()
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KClNpZ25lZC1vZmYtYnk6IEp1
bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+Ci0tLQogeGVuL2FyY2gveDg2L21tL2hhcC9o
YXAuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL2hhcC9oYXAuYyBiL3hlbi9hcmNoL3g4
Ni9tbS9oYXAvaGFwLmMKaW5kZXggM2Q5M2YzNDUxYy4uMzEzNjJhMzFiNiAxMDA2NDQKLS0tIGEv
eGVuL2FyY2gveDg2L21tL2hhcC9oYXAuYworKysgYi94ZW4vYXJjaC94ODYvbW0vaGFwL2hhcC5j
CkBAIC00NzMsNyArNDczLDggQEAgaW50IGhhcF9lbmFibGUoc3RydWN0IGRvbWFpbiAqZCwgdTMy
IG1vZGUpCiAgICAgICAgICAgICBnb3RvIG91dDsKICAgICB9CiAKLSAgICBmb3IgKGkgPSAwOyBp
IDwgTUFYX05FU1RFRFAyTTsgaSsrKSB7CisgICAgZm9yICggaSA9IDA7IGkgPCBNQVhfTkVTVEVE
UDJNOyBpKysgKQorICAgIHsKICAgICAgICAgcnYgPSBwMm1fYWxsb2NfdGFibGUoZC0+YXJjaC5u
ZXN0ZWRfcDJtW2ldKTsKICAgICAgICAgaWYgKCBydiAhPSAwICkKICAgICAgICAgICAgZ290byBv
dXQ7Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
