Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0459C169A2F
	for <lists+xen-devel@lfdr.de>; Sun, 23 Feb 2020 22:16:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5yZF-0004eP-4u; Sun, 23 Feb 2020 21:13:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qI4V=4L=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1j5yZD-0004eK-Dy
 for xen-devel@lists.xenproject.org; Sun, 23 Feb 2020 21:13:35 +0000
X-Inumbo-ID: 5962dbb0-5681-11ea-8a7f-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5962dbb0-5681-11ea-8a7f-12813bfff9fa;
 Sun, 23 Feb 2020 21:13:34 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id l5so3784594wrx.4
 for <xen-devel@lists.xenproject.org>; Sun, 23 Feb 2020 13:13:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6/mfFGJUpgQk9+0OQKyRLG9nIqZ1m4Uh/ASs0sA5yF8=;
 b=IdXZOPvjkhT9EBLRqQy5M/kPs0V5B7dNdVBVGanGy33nPcFx1VBYu/D8YBfWozo/+j
 bQ8rNMcRV3oj21sX6JqD9DuOnMj/pYK7zPpUt7lFgwg9wNw4GjAqacqX+DAzUlo1WXrc
 ATenjPwcOwKpSApk3PphKRqv6YIT8syMnaUOFdSejFQr3V+ZBN18+DB+busZrcCp63SN
 d6W6RMAjrj/ukDvqN66Pc0c1gPuW15DRcXNhiFodZd7NvgEeDnX7BWBkxLlPRdTWJnps
 vCgyl2gaktLSZkUrJye1owAJPpextYlZJgs/nvKKTi8KgXzkCfOJNtBuUZ8jnrzZH/7I
 ITyA==
X-Gm-Message-State: APjAAAUM8SiX0WL4+RtMp9LTXC4Ic48qu/10S+28sDIIv85wogFU8bJH
 DYkVM2OojLUtA53uHPcD0A5N4iCE
X-Google-Smtp-Source: APXvYqzCefa7Rm07Lhm/7zMfnqgCx/bVAkJvv/6xpNljNiweCBbn07wx5zfbFtV4UwhE07L09lzing==
X-Received: by 2002:a5d:6a8d:: with SMTP id s13mr10749344wru.55.1582492413843; 
 Sun, 23 Feb 2020 13:13:33 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 b13sm16318676wrq.48.2020.02.23.13.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2020 13:13:33 -0800 (PST)
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Sun, 23 Feb 2020 21:13:30 +0000
Message-Id: <20200223211330.9968-1-wl@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/dom0_build: PVH ABI is now in pvh.markdown
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KLS0tCiB4ZW4vYXJjaC94ODYvaHZt
L2RvbTBfYnVpbGQuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jIGIv
eGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMKaW5kZXggMzgwNDEyMTUxYi4uZmZiYjJiZDU4
NCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMKKysrIGIveGVuL2Fy
Y2gveDg2L2h2bS9kb20wX2J1aWxkLmMKQEAgLTYxNyw3ICs2MTcsNyBAQCBzdGF0aWMgaW50IF9f
aW5pdCBwdmhfc2V0dXBfY3B1cyhzdHJ1Y3QgZG9tYWluICpkLCBwYWRkcl90IGVudHJ5LAogICAg
IGludCByYzsKICAgICAvKgogICAgICAqIFRoaXMgc2V0cyB0aGUgdkNQVSBzdGF0ZSBhY2NvcmRp
bmcgdG8gdGhlIHN0YXRlIGRlc2NyaWJlZCBpbgotICAgICAqIGRvY3MvbWlzYy9odm1saXRlLm1h
cmtkb3duLgorICAgICAqIGRvY3MvbWlzYy9wdmgubWFya2Rvd24uCiAgICAgICovCiAgICAgdmNw
dV9odm1fY29udGV4dF90IGNwdV9jdHggPSB7CiAgICAgICAgIC5tb2RlID0gVkNQVV9IVk1fTU9E
RV8zMkIsCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
