Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B387F167D
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 15:56:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636970.992665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r55hY-00082D-Kf; Mon, 20 Nov 2023 14:56:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636970.992665; Mon, 20 Nov 2023 14:56:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r55hY-0007y4-Hn; Mon, 20 Nov 2023 14:56:40 +0000
Received: by outflank-mailman (input) for mailman id 636970;
 Mon, 20 Nov 2023 14:56:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uh/B=HB=citrix.com=prvs=681f0548f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1r55hX-0007tb-OT
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 14:56:39 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 015f2fc5-87b5-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 15:56:37 +0100 (CET)
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
X-Inumbo-ID: 015f2fc5-87b5-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1700492197;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uDEFdY6E/rTQZjQXn56NaCkxT9dqQV5VyYEwEpX7kCQ=;
  b=a1bi1O8sOKLS2nqJv5jAk3lGJzI8fS5PWVk3+Rh8lVjT00J4g+f9SUPy
   QRs8uYfjF+XoddfqLq9SAor0IXwp5nBZKyUDNOZFcSYVKHOOEdrL8Z71h
   9YuppVJlTqEitGO39ByxqpbNFoqwsFKFhIbgt2ir48WHq20SHoopc3H0S
   o=;
X-CSE-ConnectionGUID: YxgkUgEXQvaxEBofcrPFUw==
X-CSE-MsgGUID: I8RdwhXlS0mNkBg/AzojDQ==
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 127427127
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:RXUQJaLiVriJstj/FE+RupUlxSXFcZb7ZxGr2PjKsXjdYENSgzdRx
 2oXUGzXMvuMajT1fdh/b4+yoU8GvZDcmt42GQdlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAhk/nOHvylULKs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrfwP9TlK6q4mhB5wZmPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5GEW5Ny
 PM1GAkTZwCureW4y6iDZNRz05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGspM0yojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUoXQGpkPwR/C+
 Qoq+UzYUisWK9yvzQHd91SvrOCItDH8Wq4rQejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasnDQRRt5RGO0S8xyWx+zf5APxLnMfUjdLZdgitck3bT8nz
 FmEm5XuHzMHmKKRYWKQ8PGTtzzaESoIKW4PYwcUQA1D5MPsyLzflTqWEIwlSvTsyISoSHevm
 1hmsRTSmZ0incEI6qqWzWnZiiKBjJ/HRRQNyDjICzfNAhxCWGK1W2C5wQGEta4cdNfHHgnpg
 ZQSpySJAAkz4XCxeM+lGrxl8EmBvartDdElqQcH82Md3zqs4WW/Wotb/StzIkxkWu5dJmexP
 BaD6F4PuMUIVJdPUUOQS9jpY/nGMIC6TYi1PhwqRocmjmdNmP+vo3g1OB/4M5HFm0kwi6AvU
 ap3gu71ZUv2/Z9PlWLsL89EiO9D+8zL7T+LLXwN50j9gOX2ib/8YettDWZimchjvf7e+12Pq
 I8DXyZIoj0GONDDjuDs2dZ7BTg3wbITXPgad+Q/mja/Hzdb
IronPort-HdrOrdr: A9a23:MREhx6sfsJOHDLPAF9IHqo5U7skDTtV00zEX/kB9WHVpmszxra
 6TdZMgpGbJYVcqKRcdcL+7WJVoLUmxyXcx2/h1AV7AZniAhILLFvAA0WKK+VSJcEeSygce79
 YFT0EXMqyJMbEQt6fHCWeDfOrIuOP3kpyVuQ==
X-Talos-CUID: 9a23:iHcum29Vi3YwdVP0Q1CVv38EFcMYfVDt9WnZM2KSDmhiUoW7dEDFrQ==
X-Talos-MUID: 9a23:SVcDWwhTE/Rxd8Qf7fWUzcMpFZdS77uuOEQ2yZAguOOLcgViPDWxtWHi
X-IronPort-AV: E=Sophos;i="6.04,214,1695700800"; 
   d="scan'208";a="127427127"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/3] xen: Drop bool_t
Date: Mon, 20 Nov 2023 14:56:23 +0000
Message-ID: <20231120145623.167383-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231120145623.167383-1-andrew.cooper3@citrix.com>
References: <20231120145623.167383-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

No more users.

This completes the work started in commit 920234259475 ("xen/build: Use C99
booleans"), July 2016.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/include/xen/types.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
index 64e75674da4f..449947b353be 100644
--- a/xen/include/xen/types.h
+++ b/xen/include/xen/types.h
@@ -64,7 +64,6 @@ typedef __u64 __be64;
 
 typedef unsigned int __attribute__((__mode__(__pointer__))) uintptr_t;
 
-typedef bool bool_t;
 #define test_and_set_bool(b)   xchg(&(b), true)
 #define test_and_clear_bool(b) xchg(&(b), false)
 
-- 
2.30.2


