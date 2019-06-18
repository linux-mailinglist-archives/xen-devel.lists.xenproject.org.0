Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A49094AB7F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 22:14:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdKRB-0006lO-Mk; Tue, 18 Jun 2019 20:10:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o782=UR=gmail.com=niko.tsirakis@srs-us1.protection.inumbo.net>)
 id 1hdKRA-0006lJ-1g
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 20:10:36 +0000
X-Inumbo-ID: 21815678-9205-11e9-8980-bc764e045a96
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 21815678-9205-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 20:10:34 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id d15so9440144qkl.4
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2019 13:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=tDGKNZ/PqiEwjQjFJrWA0WkuW0VloGU2clRIaSloWWc=;
 b=VbRE/iURmIhyPqQ9NFBYnUKkM6wJZSMsbAYrua7xCV5GsSf+jFSBuEU1RtSjlRDJs9
 kfvkLsCggZAEW7vu4yRZx2RQJSJB34SEuEDyoeOoNJKujSQmb95M4eRoy0tKLFWCbjDN
 6Ee9BeZvDxdkwZ/bJQXDXijqx0tUbBFrN8MQc4jMvKkCU6bJxon0JyiRmeCEJSvsFKAx
 yc+Emlt77bWbi/gs/AabAO1LtvY2pkeU2or6Ns4fdJaSzJhiizFF9VGM+oXtUepP/2Bd
 qsKwsIq/yS6qA0N0MTRShegfCMj1/30HuY3UjkdCTkEODXkLGWmcqdL8UFBHxzGM0WMm
 XwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=tDGKNZ/PqiEwjQjFJrWA0WkuW0VloGU2clRIaSloWWc=;
 b=mf8w0ac9356d9qm5jPWB5Nu046NFFsOIa1qo+020LTbPB8Eo2YnpFAapF7lSffOAcs
 HoJR694I68y4IZX1k2pjFd7GU0fC9HQ/QKhcsygAmdSCehRfa3HoE5rXO++RJTbjmtI7
 HU2d6dN9m86jpxtC2noni9TFHOJPWjhAUN3ExZIcYb95lA4kx3YTnhhe+iyi0NDhOzpR
 sX5oai3qd2TniuuHbSx+AAwiwqCqMguQsNLPiLfYVYu2Ed3FuXgwh5B90OwXQcVtbQSu
 w4RwPMm481zfN7lQAO9YQEtOcCBDYqZRfUU0MeomMSOEhaxP1uG1FsCviqb6TMRCQsUu
 hwEQ==
X-Gm-Message-State: APjAAAXXv42ArilwEdtKk+TU4TeEIMb2BmvvlfGORM3HK2Ifxe5/3d3z
 zwcUOj6x3ZrfxqQZTYc7A4OYST3Cfek=
X-Google-Smtp-Source: APXvYqwjSDuzU8Mg8b8k2jvYfTVXBCOePqAu2R+Tw4WKHz/xscTZjDTqDJYKUUoNy10ootOHaN7K/g==
X-Received: by 2002:a05:620a:1116:: with SMTP id
 o22mr91513120qkk.82.1560888634188; 
 Tue, 18 Jun 2019 13:10:34 -0700 (PDT)
Received: from niko-Latitude-E7470.fios-router.home
 (pool-108-54-183-56.nycmny.fios.verizon.net. [108.54.183.56])
 by smtp.gmail.com with ESMTPSA id s44sm11412656qtc.8.2019.06.18.13.10.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Jun 2019 13:10:33 -0700 (PDT)
From: Nicholas Tsirakis <niko.tsirakis@gmail.com>
X-Google-Original-From: Nicholas Tsirakis <tsirakisn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 18 Jun 2019 16:10:29 -0400
Message-Id: <4b6949fb8d84a255898ca4b285526f6513513371.1560888454.git.tsirakisn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH] argo: suppress select logging messages
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
Cc: Nicholas Tsirakis <tsirakisn@ainfosec.com>,
 Christopher Clark <christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U29tZSBsb2dnaW5nIG1lc3NhZ2VzIG1hZGUgbW9yZSBzZW5zZSBhcyBhcmdvIGRlYnVnCmxvZ3Mg
cmF0aGVyIHRoYW4gc3RhbmRhcmQgWGVuIGxvZ3MuIFVzZSBhcmdvX2RwcmludGsKdG8gb25seSBw
cmludCB0aGlzIGluZm8gaWYgYXJnbyBERUJVRyBpcyBlbmFibGVkLgoKU2lnbmVkLW9mZi1ieTog
TmljaG9sYXMgVHNpcmFraXMgPHRzaXJha2lzbkBhaW5mb3NlYy5jb20+Ci0tLQogeGVuL2NvbW1v
bi9hcmdvLmMgfCA5ICsrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
NSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2FyZ28uYyBiL3hlbi9jb21t
b24vYXJnby5jCmluZGV4IGM4ZjQzMDI5NjMuLjU5YjY1NWY0YzggMTAwNjQ0Ci0tLSBhL3hlbi9j
b21tb24vYXJnby5jCisrKyBiL3hlbi9jb21tb24vYXJnby5jCkBAIC0xNDU2LDcgKzE0NTYsNyBA
QCBmaW5kX3JpbmdfbWZucyhzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgYXJnb19yaW5nX2luZm8g
KnJpbmdfaW5mbywKICAgICBpZiAoIHJpbmdfaW5mby0+bWZucyApCiAgICAgewogICAgICAgICAv
KiBSaW5nIGFscmVhZHkgZXhpc3RlZDogZHJvcCB0aGUgcHJldmlvdXMgbWFwcGluZy4gKi8KLSAg
ICAgICAgZ3ByaW50ayhYRU5MT0dfSU5GTywgImFyZ286IHZtJXUgcmUtcmVnaXN0ZXIgZXhpc3Rp
bmcgcmluZyAiCisgICAgICAgIGFyZ29fZHByaW50aygiYXJnbzogdm0ldSByZS1yZWdpc3RlciBl
eGlzdGluZyByaW5nICIKICAgICAgICAgICAgICAgICAiKHZtJXU6JXggdm0ldSkgY2xlYXJzIG1h
cHBpbmdcbiIsCiAgICAgICAgICAgICAgICAgZC0+ZG9tYWluX2lkLCByaW5nX2luZm8tPmlkLmRv
bWFpbl9pZCwKICAgICAgICAgICAgICAgICByaW5nX2luZm8tPmlkLmFwb3J0LCByaW5nX2luZm8t
PmlkLnBhcnRuZXJfaWQpOwpAQCAtMTUxNiw3ICsxNTE2LDcgQEAgZmluZF9yaW5nX21mbnMoc3Ry
dWN0IGRvbWFpbiAqZCwgc3RydWN0IGFyZ29fcmluZ19pbmZvICpyaW5nX2luZm8sCiAgICAgewog
ICAgICAgICBBU1NFUlQocmluZ19pbmZvLT5ubWZucyA9PSBOUEFHRVNfUklORyhsZW4pKTsKIAot
ICAgICAgICBncHJpbnRrKFhFTkxPR19ERUJVRywgImFyZ286IHZtJXUgcmluZyAodm0ldToleCB2
bSV1KSAlcCAiCisgICAgICAgIGFyZ29fZHByaW50aygiYXJnbzogdm0ldSByaW5nICh2bSV1OiV4
IHZtJXUpICVwICIKICAgICAgICAgICAgICAgICAibWZuX21hcHBpbmcgJXAgbGVuICV1IG5tZm5z
ICV1XG4iLAogICAgICAgICAgICAgICAgIGQtPmRvbWFpbl9pZCwgcmluZ19pbmZvLT5pZC5kb21h
aW5faWQsCiAgICAgICAgICAgICAgICAgcmluZ19pbmZvLT5pZC5hcG9ydCwgcmluZ19pbmZvLT5p
ZC5wYXJ0bmVyX2lkLCByaW5nX2luZm8sCkBAIC0xNzMwLDcgKzE3MzAsNyBAQCByZWdpc3Rlcl9y
aW5nKHN0cnVjdCBkb21haW4gKmN1cnJkLAogICAgICAgICBsaXN0X2FkZCgmcmluZ19pbmZvLT5u
b2RlLAogICAgICAgICAgICAgICAgICAmY3VycmQtPmFyZ28tPnJpbmdfaGFzaFtoYXNoX2luZGV4
KCZyaW5nX2luZm8tPmlkKV0pOwogCi0gICAgICAgIGdwcmludGsoWEVOTE9HX0RFQlVHLCAiYXJn
bzogdm0ldSByZWdpc3RlcmluZyByaW5nICh2bSV1OiV4IHZtJXUpXG4iLAorICAgICAgICBhcmdv
X2RwcmludGsoImFyZ286IHZtJXUgcmVnaXN0ZXJpbmcgcmluZyAodm0ldToleCB2bSV1KVxuIiwK
ICAgICAgICAgICAgICAgICBjdXJyZC0+ZG9tYWluX2lkLCByaW5nX2lkLmRvbWFpbl9pZCwgcmlu
Z19pZC5hcG9ydCwKICAgICAgICAgICAgICAgICByaW5nX2lkLnBhcnRuZXJfaWQpOwogICAgIH0K
QEAgLTE3NzAsOCArMTc3MCw3IEBAIHJlZ2lzdGVyX3Jpbmcoc3RydWN0IGRvbWFpbiAqY3VycmQs
CiAgICAgICAgICAgICBnb3RvIG91dF91bmxvY2syOwogICAgICAgICB9CiAKLSAgICAgICAgZ3By
aW50ayhYRU5MT0dfREVCVUcsCi0gICAgICAgICAgICAgICAgImFyZ286IHZtJXUgcmUtcmVnaXN0
ZXJpbmcgZXhpc3RpbmcgcmluZyAodm0ldToleCB2bSV1KVxuIiwKKyAgICAgICAgYXJnb19kcHJp
bnRrKCJhcmdvOiB2bSV1IHJlLXJlZ2lzdGVyaW5nIGV4aXN0aW5nIHJpbmcgKHZtJXU6JXggdm0l
dSlcbiIsCiAgICAgICAgICAgICAgICAgY3VycmQtPmRvbWFpbl9pZCwgcmluZ19pZC5kb21haW5f
aWQsIHJpbmdfaWQuYXBvcnQsCiAgICAgICAgICAgICAgICAgcmluZ19pZC5wYXJ0bmVyX2lkKTsK
ICAgICB9Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
