Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB9B7BF80E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 11:58:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614653.955869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq9V1-0000bO-7W; Tue, 10 Oct 2023 09:57:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614653.955869; Tue, 10 Oct 2023 09:57:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq9V1-0000Zl-2g; Tue, 10 Oct 2023 09:57:59 +0000
Received: by outflank-mailman (input) for mailman id 614653;
 Tue, 10 Oct 2023 09:57:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EVYk=FY=citrix.com=prvs=64039df0c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qq9Uz-0000Zb-2G
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 09:57:57 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a83d517-6753-11ee-9b0d-b553b5be7939;
 Tue, 10 Oct 2023 11:57:54 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 7a83d517-6753-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696931874;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XFUlfhoZvMHmB7+XO7vsO+/1R92MFgKP5/e539Ce+gM=;
  b=gMlxotDmq4ezxlMLKznTNv2vCPLFT29YlbGT67DdxZcahWMGRmafhO1g
   YV4/HEH7gH7cFDE40bCawl5KlMaA5yULKGehqpiPy8PKPrkCE2SXAoPQF
   fgRLLeT3pVfapRFzHlwB7ouPYgBH3DbPq55sHT0zjmdi01Fz24YRmgTmX
   4=;
X-CSE-ConnectionGUID: WeZzT1J/R/6c+wQWO38EQw==
X-CSE-MsgGUID: 6dixwcayQP+jorURmse1mQ==
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 124981856
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:ZnkDLq7H718CBBQDGKxgbQxRtCvHchMFZxGqfqrLsTDasY5as4F+v
 mofCmqHa/+MMGfzct13Oozi9BsGu5SDzNM2GwBvrC8zHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRG/ykTraCY3gtLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU355wehBtC5gZlPKgS5AeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5my
 vEqOgxUTFe5wLy9g62Cdc431ukaM5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmRJUIXUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0MxBrJ9
 juWojqR7hcyatCe2SWO+2OVvqzNmjnGYocJGeS9z6s/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c9xRGOo+4UeTx7bO4gCYLmIZQSVMbtNgv8gzLRQI/
 FKUm9LiBRR0raaYD3ma89+8sjeaKSUTa2gYakc5oRAtuoe55ttp11SWE4clT/bdYsDJ9S/Y/
 D24vhRnpfIpypAAlLqCwnec0x+Vuc2cJuIq3Tk7Tl5J/ysgOt/7NtT4tQmHhRpTBNzHFATd4
 hDoj+DbvLhXUs/X/MCYaL9VdIxF8cppJ9E1bbRHJ54k7z2r/DaJcIlb4FmSz28yaZ5aJ1cFj
 KLJ0D69BaO/31PwN8ebm6rrV6wXIVHITLwJrMz8YNtUeYRWfwSa5ixobkP49zmzwRZ8zv9iY
 czAKpzE4ZMm5UNPlWXeegvg+eVzmnBWKZ37GPgXMChLIZLBPSXIGN/pwXOFb/wj7bPsnTg5B
 +13bpPQoz0GCb2WX8Ui2dJLRbz8BSRhVM+eRg0+XrLrHzeK70l6UqSAmulxJ9cNcmY8vr6gw
 0xRk3RwkDLX7UAr4y3TApy/QNsDhapCkE8=
IronPort-HdrOrdr: A9a23:ShiZn6Efu/JKdW0upLqFnpLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdlZJjko6HJBEGBKUmsiKKdkrNhSYtKPTOW+FdASbsP0WKM+UyQJ8STzJ8n6U
 4kSdkNNDSSNyk4sS+Z2njJLz9I+rDun87Y5pa9vg4dNT2Gc5sB0+46MHfpLqQffngCOXNTLu
 vh2iMznUvfRZ1hVLXFOpBqZZm4mzT+ruOjXTc2QzI34gyHjTel85/9CQWV0y0fXTRG3Ks4/X
 KAtwDi/K2sv8ihzBXRzXXe4v1t6b7c4+oGKN2Hj8AULjn2qgKwf4RnRpWJoTAyp4iUmTAXue
 iJjwYrOsxy73/LXmWtuhvrxizpzToo4W+K8y7+vVLT5eDpTjczC85MnrtDdArIzkI8sNZ3wM
 twrgakXtdsfEn9dOuU3amIazha0m6P5VYym+8aiHJSFaMYdb9qtIQauHhYFZ8RdRiKpLzORI
 NVbf301bJzSxe3fnrZtm5gzJiHRXIoBCqLRUAEp4i8zyVWtGoR9TpK+OUv2lM7sL4tQZhN4O
 rJdo5ykqtVc8MQZaVhQM8cXMqMDHDXSx6kChPDHb3eLtBUB5vxke+o3Fx13pD0RHUw9upvpH
 0VaiIIiYYwE3ieRPFmkqc7sGGZfI16NQ6djf22rKIJzYEUf4CbexFqkjgV4pKdSsUkc4vmsr
 6ISeRr6t/YXDPT8NVyrlbDs287EwhRbCXj0uxLFG5m5Pi7d7EDuoHgAb/uzZLWYH0ZZl8=
X-Talos-CUID: 9a23:IlLW9WMvrJRXd+5DZyRV5nJNOIcfNSPWj2jpHGjjWUtQV+jA
X-Talos-MUID: 9a23:mjNjnQQqZqI1mB4mRXSyiDByK8xh8p2WS0IKi6g8vtKJbClJbmI=
X-IronPort-AV: E=Sophos;i="6.03,212,1694750400"; 
   d="scan'208";a="124981856"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH for-4.19] x86/cpu-policy: Adjust CPUID_MAX_SERIALISED_LEAVES to placate MISRA
Date: Tue, 10 Oct 2023 10:57:48 +0100
Message-ID: <20231010095748.1205365-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

MISRA doesn't like !!CONST being used in place of a 1 (Rule 10.1).  Update the
expression to just be a plain 1, which still matches the description.

No functional change.

Reported-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>

After considering the comment several times, I've decided to leave it as is.
It's slightly awkward grammar but it's ok.
---
 xen/include/xen/lib/x86/cpu-policy.h | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index bab3eecda6c1..d5e447e9dc06 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -100,13 +100,14 @@ const char *x86_cpuid_vendor_to_str(unsigned int vendor);
  * interaction with the toolstack.  (Sum of all leaves in each union, less the
  * entries in basic which sub-unions hang off of.)
  */
-#define CPUID_MAX_SERIALISED_LEAVES                     \
-    (CPUID_GUEST_NR_BASIC +                             \
-     CPUID_GUEST_NR_FEAT   - !!CPUID_GUEST_NR_FEAT +    \
-     CPUID_GUEST_NR_CACHE  - !!CPUID_GUEST_NR_CACHE +   \
-     CPUID_GUEST_NR_TOPO   - !!CPUID_GUEST_NR_TOPO +    \
-     CPUID_GUEST_NR_XSTATE - !!CPUID_GUEST_NR_XSTATE +  \
-     CPUID_GUEST_NR_EXTD + 2 /* hv_limit and hv2_limit */ )
+#define CPUID_MAX_SERIALISED_LEAVES             \
+    (CPUID_GUEST_NR_BASIC +                     \
+     CPUID_GUEST_NR_FEAT   - 1 +                \
+     CPUID_GUEST_NR_CACHE  - 1 +                \
+     CPUID_GUEST_NR_TOPO   - 1 +                \
+     CPUID_GUEST_NR_XSTATE - 1 +                \
+     CPUID_GUEST_NR_EXTD +                      \
+     2 /* hv_limit and hv2_limit */ )
 
 /* Maximum number of MSRs written when serialising a cpu_policy. */
 #define MSR_MAX_SERIALISED_ENTRIES 2

base-commit: c035151902689aa5a3765aeb16fa52755917b9ca
-- 
2.30.2


