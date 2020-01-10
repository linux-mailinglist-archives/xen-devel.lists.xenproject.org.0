Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 513AF137997
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 23:25:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iq2h4-0000oP-Fg; Fri, 10 Jan 2020 22:23:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q3sE=27=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iq2h3-0000oK-3N
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 22:23:49 +0000
X-Inumbo-ID: defaa7bc-33f7-11ea-bfc5-12813bfff9fa
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id defaa7bc-33f7-11ea-bfc5-12813bfff9fa;
 Fri, 10 Jan 2020 22:23:48 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id m24so3602505wmc.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2020 14:23:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dD3pH+qLvJ2A2T8y5inZXY25FZgxaeam4cVrf8Ri36o=;
 b=SstC19PvlmocTfg9Xmzln9840DJ3bFpDVskPKb/2Iwyaw9UMJpU3NuQ/PQOmVZOVBc
 YLt8E9zfcm/4Gv1S75844PY1G2gEgUHG264lhXAdvr7xbgdZDVCCds10uGqx6tY/Rtcq
 JT5+U9o+bPAmv6EfyV5x77/gcHPoBMdRHD1mtQcwm0alxQLhfEQmOcaBOg8IRf1NgPp3
 AyAMbRijreP24ftmaqbxnexp83ZbUIi+Zv1i8HwFdzRDHtXF8joIlkmIvTWOabe5FlzO
 U/3zT8poAaOt99s5bvg8JDON3+nkhrEZy/i4f/8hK3UIHocJAxIzhj3oHfSeJ6WlTDhg
 1t9Q==
X-Gm-Message-State: APjAAAXTWbWizjsgfVrnkc7SNQrCpM92d1WibKY5gk/XtGpLgD8T6jsH
 ot5ZtT8J2tqlr9hVc93lmizrmo8NOLzhbg==
X-Google-Smtp-Source: APXvYqwfmOz4kKFCvL5yKtWSD5+m4KBGJsPg8oQ9t4BsSlQ+zGrXlFP+BHNBtI8PhYRvtOnFNqUPKA==
X-Received: by 2002:a1c:b7c4:: with SMTP id h187mr6544282wmf.105.1578695027321; 
 Fri, 10 Jan 2020 14:23:47 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com.com (54-240-197-226.amazon.com.
 [54.240.197.226])
 by smtp.gmail.com with ESMTPSA id i5sm3839803wml.31.2020.01.10.14.23.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 Jan 2020 14:23:46 -0800 (PST)
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Fri, 10 Jan 2020 22:23:44 +0000
Message-Id: <20200110222344.66071-1-julien@xen.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xen/sched: rt: Fix typo in a comment
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Meng Xu <mengxu@cis.upenn.edu>, Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KLS0tCiB4ZW4vY29t
bW9uL3NjaGVkX3J0LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkX3J0LmMgYi94ZW4vY29t
bW9uL3NjaGVkX3J0LmMKaW5kZXggYjJiMjk0ODFmMy4uYzQwYTdlNDk5MCAxMDA2NDQKLS0tIGEv
eGVuL2NvbW1vbi9zY2hlZF9ydC5jCisrKyBiL3hlbi9jb21tb24vc2NoZWRfcnQuYwpAQCAtMTIy
LDcgKzEyMiw3IEBACiAgKi8KIC8qCiAgKiBSVERTX3NjaGVkdWxlZDogSXMgdGhpcyB1bml0IGVp
dGhlciBydW5uaW5nIG9uLCBvciBjb250ZXh0LXN3aXRjaGluZyBvZmYsCi0gKiBhIHBoeWlzY2Fs
IGNwdT8KKyAqIGEgcGh5c2ljYWwgY3B1PwogICogKyBBY2Nlc3NlZCBvbmx5IHdpdGggZ2xvYmFs
IGxvY2sgaGVsZC4KICAqICsgU2V0IHdoZW4gY2hvc2VuIGFzIG5leHQgaW4gcnRfc2NoZWR1bGUo
KS4KICAqICsgQ2xlYXJlZCBhZnRlciBjb250ZXh0IHN3aXRjaCBoYXMgYmVlbiBzYXZlZCBpbiBy
dF9jb250ZXh0X3NhdmVkKCkKLS0gCjIuMjQuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
