Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCA0E3360
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 15:04:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNckb-0001pC-M3; Thu, 24 Oct 2019 13:02:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZeBO=YR=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iNckZ-0001p3-Gw
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 13:01:59 +0000
X-Inumbo-ID: 761acdc0-f65e-11e9-94a0-12813bfff9fa
Received: from mail-wr1-f46.google.com (unknown [209.85.221.46])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 761acdc0-f65e-11e9-94a0-12813bfff9fa;
 Thu, 24 Oct 2019 13:01:58 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id a11so9901951wra.6
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2019 06:01:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wjJrHvsBj7VSq00KNW4Y783u8nPwSFX/0mxCttqLCf8=;
 b=pHgVDVIjdwKJgfedWxjX1kYIxwHsvGB4So7EROrUq2EifLUj7jjYtyvfzGackmiqDj
 NgZ7HvrMQNP4kljZwjxab7YxJ0plUZaAnOjNcOsjkL+wEqfx4pux154m39aVRs1aDSvv
 1vDcQky0BPwdHGuRtEcmjVxeqUnwT1oOEEuV9Z6llP22wuErTN0Hrp9r4uJIxF4D2VK1
 n5eDqoAebUZhTeGpNXSGpsLAcOhvv0xYWcIdcejnVX84qj7LLCNlvzwkKasd5QZKzyEi
 +wbNy+we0ixgg1mwzjcCf5J6JATeMSyOMS+FvYIu2qOEIcXXWqZy3iXK/Zs1bA5kpx1V
 0MYw==
X-Gm-Message-State: APjAAAUHau29timOrOo2eQRc16Ec0spDdh1emYG6YFEYJWUUovoKP+LD
 0Tk0bvxI5CQiOlr6IjQoRKopL7sdjAA=
X-Google-Smtp-Source: APXvYqySjQ82GkcvwgqP/l3SoNkiDkKabynrY2RurrvXEEFId97OQpp11V2dwv1yQAA71aORTAsZoA==
X-Received: by 2002:a5d:5544:: with SMTP id g4mr3947105wrw.72.1571922117334;
 Thu, 24 Oct 2019 06:01:57 -0700 (PDT)
Received: from debian.mshome.net (54.163.200.146.dyn.plus.net.
 [146.200.163.54])
 by smtp.gmail.com with ESMTPSA id u187sm1525302wme.15.2019.10.24.06.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 06:01:56 -0700 (PDT)
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Thu, 24 Oct 2019 14:01:54 +0100
Message-Id: <20191024130154.19145-1-wl@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 for-4.13] CONTRIBUTING: drop blktap2 and add
 tools/libs
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
Cc: Juergen Gross <jgross@suse.com>, lars.kurth@citrix.com,
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QmxrdGFwMiBpcyBnb25lIGFuZCB0b29scy9saWJzIGlzIG1pc3NpbmcgaW4gdGhlIGRvY3VtZW50
LgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KUmV2aWV3ZWQtYnk6IEp1ZXJn
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tCi0tLQogQ09OVFJJQlVUSU5HIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvQ09OVFJJQlVU
SU5HIGIvQ09OVFJJQlVUSU5HCmluZGV4IDQ3ZjUzZTlhNDkuLjZlYzE0NmJhZjAgMTAwNjQ0Ci0t
LSBhL0NPTlRSSUJVVElORworKysgYi9DT05UUklCVVRJTkcKQEAgLTEzLDcgKzEzLDcgQEAgTW9z
dCBvZiB0aGUgWGVuIFByb2plY3QgY29kZSBpcyBsaWNlbnNlZCB1bmRlciBHUEx2MiwgYnV0IGEg
bnVtYmVyIG9mCiBkaXJlY3RvcmllcyBhcmUgcHJpbWFyaWx5IGxpY2Vuc2VkIHVuZGVyIGRpZmZl
cmVudCBsaWNlbnNlcy4KIAogTW9zdCBub3RhYmx5OgotIC0gdG9vbHMvYmxrdGFwMiAgICAgIDog
QlNELU1vZGlmaWVkCisgLSB0b29scy9saWJzICAgICAgICAgOiBMR1BMIHYyLjEKICAtIHRvb2xz
L2xpYnhjICAgICAgICA6IExHUEwgdjIuMQogIC0gdG9vbHMvbGlieGwgICAgICAgIDogTEdQTCB2
Mi4xCiAgLSB0b29scy94bCAgICAgICAgICAgOiBMR1BMIHYyLjEKLS0gCjIuMjAuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
