Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2529658FA97
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 12:19:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384369.619732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM5Gf-0000EI-W2; Thu, 11 Aug 2022 10:18:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384369.619732; Thu, 11 Aug 2022 10:18:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM5Gf-0000Bu-TK; Thu, 11 Aug 2022 10:18:21 +0000
Received: by outflank-mailman (input) for mailman id 384369;
 Thu, 11 Aug 2022 10:18:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XZap=YP=citrix.com=prvs=215a4cc3a=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1oM5Ge-0000Bo-ME
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 10:18:20 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea15a9c7-195e-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 12:18:18 +0200 (CEST)
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
X-Inumbo-ID: ea15a9c7-195e-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660213098;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YxGRDrkzYxuJpnGy2bIMOKaWBNPvAXtfX87uJdHcwkY=;
  b=WrA5EWKm2HLVT9C4RoPa9J+f/qozdfeT9IIfWrSoSL6d6/qt6RZe7H9s
   m7bRTJacZec7kJIF9p+eHfIEBfdJd8Jxtv61ehCoHrz4Tqbj9Oo0JBs9L
   OclVx48b7NprSVSgc4p7aB+bE5D6fdKzLPorGF4kiReOR/5xRBWv9iTiK
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77101571
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:VhI1oKm87tw61DktrsaqcuDo5gzvJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbCjqGbv6KZmCjf9lwYY7g9R8BsJLczdc1TwE+r3o8QSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8vWo4ow/jb8kk37K2r4GpwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kTObcqpcApD1pl7
 MQpGjURVxeCutyplefTpulE3qzPLeHuNYIb/Hph0SvYHbAtRpWrr6fivIECmm1q34YXQKiYN
 5FxhTlHNXwsZzVVPUwMTpY3k+qymXD7dxVTqU6PpLpx6G/WpOB0+OeyaYKMJ4PTLSlTthqkg
 2744knzOxILKf2NziSpzFyilvCayEsXX6pNTeblp5aGmma72Wg7GBAQE1yhrpGRiESzRtZeI
 Ew84Tc1oO4580nDZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZ8hMcO7ZFsA2Zwj
 xnQwo2vVWcHXKCppWy107Oun2yUZyYuBnY6VB0BUTIC4uTdv9Rm5v7QdeqPAJJZn/WsR2+om
 2HV9XFg71kApZVVjvvmpDgrlxrp/8GUFVBtu207S0r/tmtEiJiZi5tEALQxxdJJN86nQ1aIp
 xDocODOvblVXflheMFgKdjh/Y1FBN7faVUweXY1Q/EcG82FohZPh7x47jBkP1tOOc0ZYzLva
 0K7kVoPuscLYyPzPP8qOdjZ5yEWIU/IS7zYug38NIISMvCdiifelM2RWaJg9z+0yxV9+U3OE
 ZyabdytHR4nNEiT9xLvHr91+eJ6mUgDKZb7H8+TI+KPjeXDPxZ4iN4tbDOzUwzOxPna+lWFo
 40Oa5DiJtc2eLSWXxQ7OLU7dTgiRUXXz7ivwyCLXoZv+jZbJVw=
IronPort-HdrOrdr: A9a23:V7UpG6/P4zuUd/t4f/Juk+DWI+orL9Y04lQ7vn2YSXRuE/Bw8P
 re+8jztCWE8Qr5N0tQ+uxoVJPufZq+z+8Q3WByB8bBYOCOggLBR+sOgbcKqweQfREWndQ86U
 4PScZD4aXLfD1Hsfo=
X-IronPort-AV: E=Sophos;i="5.93,228,1654574400"; 
   d="scan'208";a="77101571"
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Ross Lagerwall
	<ross.lagerwall@citrix.com>
Subject: [PATCH] x86/cpu: Drop _init from *_cpu_cap functions
Date: Thu, 11 Aug 2022 11:17:15 +0100
Message-ID: <20220811101715.3947873-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

These functions may be called by init_amd() after the _init functions
have been purged during CPU hotplug or PV shim boot so drop the _init.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/cpu/common.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 0412dbc915..20581bf3f8 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -57,7 +57,7 @@ static unsigned int forced_caps[NCAPINTS];
 
 DEFINE_PER_CPU(bool, full_gdt_loaded);
 
-void __init setup_clear_cpu_cap(unsigned int cap)
+void setup_clear_cpu_cap(unsigned int cap)
 {
 	const uint32_t *dfs;
 	unsigned int i;
@@ -86,7 +86,7 @@ void __init setup_clear_cpu_cap(unsigned int cap)
 	}
 }
 
-void __init setup_force_cpu_cap(unsigned int cap)
+void setup_force_cpu_cap(unsigned int cap)
 {
 	if (__test_and_set_bit(cap, forced_caps))
 		return;
@@ -100,7 +100,7 @@ void __init setup_force_cpu_cap(unsigned int cap)
 	__set_bit(cap, boot_cpu_data.x86_capability);
 }
 
-bool __init is_forced_cpu_cap(unsigned int cap)
+bool is_forced_cpu_cap(unsigned int cap)
 {
 	return test_bit(cap, forced_caps);
 }
-- 
2.31.1


