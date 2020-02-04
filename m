Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11087151AF4
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 14:09:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyxua-0003th-OZ; Tue, 04 Feb 2020 13:06:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cOUj=3Y=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iyxuZ-0003tY-A8
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 13:06:39 +0000
X-Inumbo-ID: 2a641d05-474f-11ea-8f39-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a641d05-474f-11ea-8f39-12813bfff9fa;
 Tue, 04 Feb 2020 13:06:34 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id m10so2181408wmc.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2020 05:06:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3oIjWzkiKCd8SRh3Zl916SAIra1g+izJglbfmsonOfw=;
 b=aUGtS6R9TQJfcdkojk/ovSzEks86jbdJ2lSREeZDxPNf2LAIJ41JnuKORby6Pfx/+l
 6PyHCZCR358bqZCem89uuwW9gTeiHHjB/LGLEzXa6pQd7CQ1860DDyU/GOq2A+HjGPE3
 SAxB9nxJJT/zaczpOmUUxej91X6cgAoOsKG4WiAmZR3yyOrHAaOvnjQ38UsV0+ijMqAP
 0w/sZLKDGandP70t37RE0IWHoXLYF0EDCUPbzDCupVB0YjdFyRmwjaXAD5jRrsk9U9BN
 hoRTxeoV3WOo6BomIyD7RNTjEbmjfM4jyRI4FdF4Bn+aSk8uPsmNPiN2C3taVhgMy5Qg
 iZ0g==
X-Gm-Message-State: APjAAAXDayzs16w1sZr0Q8Cebzdu3jzSiFIYJE0mBMmiFgHR0LEYrnGY
 k8BY4U8+IX4VOxWMfGOEcdNP+EDN9VQ=
X-Google-Smtp-Source: APXvYqykJXdaCTIcvwETQqMrrbaV/SaGBg53j+IJ33UooSyJaYMLz5vfJAEou3o1xjhWF8FTKtV4eg==
X-Received: by 2002:a1c:451:: with SMTP id 78mr5528281wme.125.1580821593165;
 Tue, 04 Feb 2020 05:06:33 -0800 (PST)
Received: from ufe34d9ed68d054.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id y8sm3624776wma.10.2020.02.04.05.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 05:06:32 -0800 (PST)
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Tue,  4 Feb 2020 13:06:13 +0000
Message-Id: <20200204130614.15166-2-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200204130614.15166-1-julien@xen.org>
References: <20200204130614.15166-1-julien@xen.org>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 1/2] xen/x86: hap: Fix coding style in
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
Cc: julien@xen.org, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KUmV2aWV3ZWQtYnk6
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKLS0tCiAgICBDaGFuZ2Vz
IGluIHYyOgogICAgICAgIC0gQWRkIFJvZ2VyJ3MgcmV2aWV3ZWQtYnkKLS0tCiB4ZW4vYXJjaC94
ODYvbW0vaGFwL2hhcC5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vaGFwL2hhcC5jIGIv
eGVuL2FyY2gveDg2L21tL2hhcC9oYXAuYwppbmRleCAzZDkzZjM0NTFjLi4zMTM2MmEzMWI2IDEw
MDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0vaGFwL2hhcC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9t
bS9oYXAvaGFwLmMKQEAgLTQ3Myw3ICs0NzMsOCBAQCBpbnQgaGFwX2VuYWJsZShzdHJ1Y3QgZG9t
YWluICpkLCB1MzIgbW9kZSkKICAgICAgICAgICAgIGdvdG8gb3V0OwogICAgIH0KIAotICAgIGZv
ciAoaSA9IDA7IGkgPCBNQVhfTkVTVEVEUDJNOyBpKyspIHsKKyAgICBmb3IgKCBpID0gMDsgaSA8
IE1BWF9ORVNURURQMk07IGkrKyApCisgICAgewogICAgICAgICBydiA9IHAybV9hbGxvY190YWJs
ZShkLT5hcmNoLm5lc3RlZF9wMm1baV0pOwogICAgICAgICBpZiAoIHJ2ICE9IDAgKQogICAgICAg
ICAgICBnb3RvIG91dDsKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
