Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D0D776368
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 17:09:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581194.909780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTkoC-0004Lo-KK; Wed, 09 Aug 2023 15:09:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581194.909780; Wed, 09 Aug 2023 15:09:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTkoC-0004Iw-Ha; Wed, 09 Aug 2023 15:09:12 +0000
Received: by outflank-mailman (input) for mailman id 581194;
 Wed, 09 Aug 2023 15:09:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkWR=D2=citrix.com=prvs=578b5fa55=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qTkoB-0004Iq-2w
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 15:09:11 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id afe573f5-36c6-11ee-b281-6b7b168915f2;
 Wed, 09 Aug 2023 17:09:09 +0200 (CEST)
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
X-Inumbo-ID: afe573f5-36c6-11ee-b281-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691593749;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=P8fp+v/6smNsGrR1Qs3vlq1yLFmGcEtmhV0Xy/O2hIM=;
  b=DyrRwl04sBvwx2mfKIUcRFlSlBQujsXvI00e6oul0sCR3Mag0h5laTfn
   63uGF8+OutEMhmjQbrHkRwig3T4yMl9ozzw9LgwOBwtzsqIMhiX0XGMTc
   j7mPLYc5fPS6MSUW3W2QNaEYQDEDTpTwnPTMNQxy2Ybyph2S016ukm4ao
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 119022402
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:ValHlaAXoq1K4BVW/zPjw5YqxClBgxIJ4kV8jS/XYbTApGh3hmZVm
 jRJWGzSOvzbazD2eYp2Ptnk8UIFvpDSztBmQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4GNA7wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw5NlOOFNnx
 /IkDzEobxCJteW1xbGac7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9I4XbHZ8Pwh7Cz
 o7A1zvXDQ8XDNCQ8jGYw1iWl+HIlyrbfI1HQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFamlBMBX9tbE8Uh9RqAjKHT5m6xGWwsXjNHLts8u6cLqScCj
 wHT2YmzXHo27ePTECjGnluJkd+sETYqFFYwTB0KcSwExtjjqrM0jRfMb+82RcZZkebJMT33x
 jmLqg03iLMSkdMH2s2HwLzXv96/jsOXF1Bov207Skrgt1okP9D9O+RE/HCBtZ59wJClok5tV
 ZTus+yX96gwAJ6Ej0Rhq81dTejyt55p3NAx6GOD/qXNFRz3oxZPnqgKulmSwXuF1O5eIVcFh
 2eN0T69HLcJYBOXgVZfOupd8fgCw6n6DsjCXfvJdNdIaZUZXFbZrXgzPB/MgD68zxJEfUQD1
 XGzK5nE4ZEyU/4P8dZLb71Fje9DKt4Wmgs/uqwXPzz4iOHDNRZ5uJ8OMUeUb/BR0U93iFy9z
 jqrDOPTk083eLSnMkHqHXs7cQhiwY4TWcqn9KS6t4erfmJbJY3WI6KAnOt+K9Q5z8y4VI7gp
 xmAZ6OR83Kn7VWvFOlAQio8AF8zdf6TdU4GABE=
IronPort-HdrOrdr: A9a23:gSTAGq0wmMlRM1aWf2WIIwqjBHYkLtp133Aq2lEZdPU0SKGlfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0AeVxelZhrcKqAeQeBEWmNQ96U
 9hGZIOcuEZDzJB/LvHCN/TKadd/DGFmprY+ts31x1WPGVXgzkL1XYANu6ceHcGIzVuNN4CO7
 e3wNFInDakcWR/VLXBOpFUN9KzweEijfjdEGc7OyI=
X-Talos-CUID: 9a23:eeglZG7SCyKdeINnDdss6nEtI/IMQHPh63b1Ik+yO2FqTb60cArF
X-Talos-MUID: 9a23:SneQqwS1kBEUWbtIRXSzqj58Of9k7J+lFXEnq4QIvMONFQh/bmI=
X-IronPort-AV: E=Sophos;i="6.01,159,1684814400"; 
   d="scan'208";a="119022402"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/spec-ctrl: Add SRSO whitepaper URL
Date: Wed, 9 Aug 2023 16:08:54 +0100
Message-ID: <20230809150854.66849-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

... now that it exists in public.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

I did try to get this URL ahead of finalising the XSA-434 patches, but alas...
---
 xen/arch/x86/spec_ctrl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index ebe56a96cdca..bafc41a2f6c4 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -898,6 +898,9 @@ static bool __init should_use_eager_fpu(void)
     }
 }
 
+/*
+ * https://www.amd.com/content/dam/amd/en/documents/corporate/cr/speculative-return-stack-overflow-whitepaper.pdf
+ */
 static void __init srso_calculations(bool hw_smt_enabled)
 {
     if ( !(boot_cpu_data.x86_vendor &

base-commit: 236fc9fdf97f4e7c64824ab793e8dca30dd54ffb
-- 
2.30.2


