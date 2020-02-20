Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A22621661AD
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 17:00:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4oE0-0004SR-Kc; Thu, 20 Feb 2020 15:58:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3eft=4I=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1j4oDz-0004SK-59
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 15:58:51 +0000
X-Inumbo-ID: e17f03d0-53f9-11ea-ade5-bc764e2007e4
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e17f03d0-53f9-11ea-ade5-bc764e2007e4;
 Thu, 20 Feb 2020 15:58:48 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id s144so3116069wme.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2020 07:58:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RjCErxV1fd4EPEsvWOIBm33hZVK4rJisF1iaULlCcbw=;
 b=bQrykW7yu11nX1BnEsdo97hZXs+C3sCELYWngWIcAACwonBZEXjaEik67bhAbdntyx
 OdnZzxDpvetOMqzJHJVsujACz+IBuLK3qB/AdDcJleYqGOWWiRtARHsPXZDSjx9wapff
 OvGGbc1t/sGl7eQT9Nzoe+ZqAlKP6egKnaaFvRc1eLvGuTYYESbrT09CnfDlaCg1Q78P
 0yaLWqRq/cDAVMOTXRNuX5ENdLsFdrxeEqV+6fAPhkzviOG3j6N383+flO4rtRwwP/08
 CV2op4GZEbHnhuOau7rk+zg1IsYYBOFmcuqG9Rea1TAsP2OrfG5gw5O/+Ji7/npzdxJA
 j7YQ==
X-Gm-Message-State: APjAAAWPNAhE9mBSII9DYoq29OXCuib2PPZX9xgC/0stqwEw6HocXBrl
 FzyTztsoNEcJ+XQMLvGG9EN9pWW9
X-Google-Smtp-Source: APXvYqwoaOTqLjdxcgd8luMnM2HCwf6sB8s0ZsnWwSzenBOrjMeKVwEacl8bT/OcM4q8nPxFA45VcQ==
X-Received: by 2002:a7b:cd8e:: with SMTP id y14mr5299876wmj.150.1582214326802; 
 Thu, 20 Feb 2020 07:58:46 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 q130sm5657423wme.19.2020.02.20.07.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 07:58:46 -0800 (PST)
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Thu, 20 Feb 2020 15:58:43 +0000
Message-Id: <20200220155843.1795-1-wl@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] MAINTAINERS: make Roger VPCI maintainer
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Um9nZXIgaGFzIGtpbmRseSBhZ3JlZWQgdG8gdGFrZSBvbiB0aGUgYnVyZGVuLgoKU2lnbmVkLW9m
Zi1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KLS0tCiBNQUlOVEFJTkVSUyB8IDYgKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMg
Yi9NQUlOVEFJTkVSUwppbmRleCA0NjQyNGMxODMzLi5lN2QxZDVhODhhIDEwMDY0NAotLS0gYS9N
QUlOVEFJTkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAtNTAwLDYgKzUwMCwxMiBAQCBGOgl4ZW4v
aW5jbHVkZS8qL3ZtX2V2ZW50LmgKIEY6CXhlbi9pbmNsdWRlL2FzbS14ODYvaHZtL21vbml0b3Iu
aAogRjoJeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdm1fZXZlbnQuaAogCitWUENJCitNOglSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KK1M6CVN1cHBvcnRlZAorRjoJeGVu
L2RyaXZlcnMvdnBjaQorRjoJeGVuL2luY2x1ZGUveGVuL3ZwY2kuaAorCiBWVFBNCiBNOglEYW5p
ZWwgRGUgR3JhYWYgPGRnZGVncmFAdHljaG8ubnNhLmdvdj4KIE06CVF1YW4gWHUgPHF1YW4ueHUw
QGdtYWlsLmNvbT4KLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
