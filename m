Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBED144B13
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 06:16:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu8L9-00058Q-W4; Wed, 22 Jan 2020 05:14:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gwqu=3L=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1iu5Kn-00069C-5q
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 02:01:33 +0000
X-Inumbo-ID: 0344cbae-3cbb-11ea-b833-bc764e2007e4
Received: from mail-yw1-xc44.google.com (unknown [2607:f8b0:4864:20::c44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0344cbae-3cbb-11ea-b833-bc764e2007e4;
 Wed, 22 Jan 2020 02:00:50 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id d7so2476447ywl.12
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2020 18:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i+rEX8O6S9+veG9wMoy7cCMlNnRtHJYvsqiOpzSqXRQ=;
 b=L60pT08D7Q2bBZ22haUeQcX2IcWe8oAvuHq/EpGbtFmuji3VIDfUHe17XyVkYECCD4
 ESwxq9Qbz7VaYU4yhQLAM3ED49h0V/aTLeLhqWldPJcbS52dnnlnnvik8fck7+rSUVPg
 GhJL3bXxa1QQPIWgt1Tt6vjBZoiu0PmPXRk5pdi0jgYqE47RTMcJz6lWPZR53t+bUFud
 B4yyojQspOA57CwdbEHkF4i25DZrYm1JwCK/fUSLBDlvIjs4maU1e0peXEcoiFBXgXNU
 nWzR0U8mcxkK3F5M9zgAsOOcsZ6gZga0eUMmSnPVM3fjHRhJChCKsaH/7BrZ/M7ywB2W
 AHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i+rEX8O6S9+veG9wMoy7cCMlNnRtHJYvsqiOpzSqXRQ=;
 b=tb1k28P6peQdxPf0VlhnQIoTJGWIGJO01RzAg0ug9iRE0wV0W/Yznuyl7/Fs+9NHFJ
 MMMs0YotUidfd8ZgWMOz8tpG97PqS9G9K6lViRvBOUVez5PVTsKieOWm7OJaG+sWJHG9
 V2VFshLo8yfANgZ8ZY9WbJLGWUo8MusjQNqfN12OWjACdnsNDxmiDM9abaAEQ5az7HZM
 U6744zGGKu4FJMW/S5nK/Lbbdim/uKGmd0BdWAK774VbSsB1oa2iMDNm24leisiKPnB8
 sxag9dryzz9HjIiC9ssfHN632/kweosTVj+eG4nbi7Q5KuEsNlWhA1zOJn3upBYkHGKw
 R1IA==
X-Gm-Message-State: APjAAAXTAbVpBFrcLfPOI5nmYV4FX3Xv0t5TySX/sNKK6HEw1B3ihDKA
 Px2MV5RDfkB+dkpG/PJwm/tKHcosI6C55w==
X-Google-Smtp-Source: APXvYqyYpCPCFFHphp5NkgQt3SEvOynCKlSmpWiS9OArvUwEdvojmPMrkxDlQfeiUoqaMIx2jQZ1vQ==
X-Received: by 2002:a81:294c:: with SMTP id p73mr801068ywp.477.1579658449437; 
 Tue, 21 Jan 2020 18:00:49 -0800 (PST)
Received: from bobbye-pc.knology.net ([216.186.244.35])
 by smtp.gmail.com with ESMTPSA id q185sm17504248ywh.61.2020.01.21.18.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 18:00:49 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 21 Jan 2020 19:58:52 -0600
Message-Id: <e39f9cef7a692a32deb5711c06f7329b97505f6b.1579615303.git.bobbyeshleman@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1579615303.git.bobbyeshleman@gmail.com>
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 Jan 2020 05:14:01 +0000
Subject: [Xen-devel] [RFC XEN PATCH 13/23] riscv: Add smp.c
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
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Bobby Eshleman <bobby.eshleman@starlab.io>,
 Dan Robertson <dan@dlrobertson.com>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPgoKU2lnbmVk
LW9mZi1ieTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPgotLS0K
IHhlbi9hcmNoL3Jpc2N2L3NtcC5jIHwgNDEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgeGVuL2FyY2gvcmlzY3Yvc21wLmMKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9yaXNj
di9zbXAuYyBiL3hlbi9hcmNoL3Jpc2N2L3NtcC5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDAwMDAwMDAwMDAuLjczNWRhMjJjZDIKLS0tIC9kZXYvbnVsbAorKysgYi94ZW4vYXJjaC9yaXNj
di9zbXAuYwpAQCAtMCwwICsxLDQxIEBACisjaW5jbHVkZSA8eGVuL21tLmg+CisjaW5jbHVkZSA8
eGVuL3NtcC5oPgorI2luY2x1ZGUgPGFzbS9zeXN0ZW0uaD4KKyNpbmNsdWRlIDxhc20vc21wLmg+
CisjaW5jbHVkZSA8YXNtL3BhZ2UuaD4KKyNpbmNsdWRlIDxhc20vZmx1c2h0bGIuaD4KKwordm9s
YXRpbGUgdW5zaWduZWQgbG9uZyBzdGFydF9zZWNvbmRhcnlfcGVuX3JlbGVhc2UgPSBIQVJUSURf
SU5WQUxJRDsKKwordm9pZCBmbHVzaF90bGJfbWFzayhjb25zdCBjcHVtYXNrX3QgKm1hc2spCit7
CisgICAgZmx1c2hfYWxsX2d1ZXN0c190bGIoKTsKK30KKwordm9pZCBzbXBfc2VuZF9ldmVudF9j
aGVja19tYXNrKGNvbnN0IGNwdW1hc2tfdCAqbWFzaykKK3sKKyAgICAvKiBUT0RPICovCit9CisK
K3ZvaWQgc21wX3NlbmRfY2FsbF9mdW5jdGlvbl9tYXNrKGNvbnN0IGNwdW1hc2tfdCAqbWFzaykK
K3sKKyAgICBjcHVtYXNrX3QgdGFyZ2V0X21hc2s7CisKKyAgICBjcHVtYXNrX2FuZG5vdCgmdGFy
Z2V0X21hc2ssIG1hc2ssIGNwdW1hc2tfb2Yoc21wX3Byb2Nlc3Nvcl9pZCgpKSk7CisKKyAgICBp
ZiAoIGNwdW1hc2tfdGVzdF9jcHUoc21wX3Byb2Nlc3Nvcl9pZCgpLCBtYXNrKSApCisgICAgewor
ICAgICAgICBsb2NhbF9pcnFfZGlzYWJsZSgpOworICAgICAgICBzbXBfY2FsbF9mdW5jdGlvbl9p
bnRlcnJ1cHQoKTsKKyAgICAgICAgbG9jYWxfaXJxX2VuYWJsZSgpOworICAgIH0KK30KKworLyoK
KyAqIExvY2FsIHZhcmlhYmxlczoKKyAqIG1vZGU6IEMKKyAqIGMtZmlsZS1zdHlsZTogIkJTRCIK
KyAqIGMtYmFzaWMtb2Zmc2V0OiA0CisgKiBpbmRlbnQtdGFicy1tb2RlOiBuaWwKKyAqIEVuZDoK
KyAqLwotLSAKMi4yNS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
