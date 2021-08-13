Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3123EBC19
	for <lists+xen-devel@lfdr.de>; Fri, 13 Aug 2021 20:33:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166875.304626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEbyk-00053i-DC; Fri, 13 Aug 2021 18:32:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166875.304626; Fri, 13 Aug 2021 18:32:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEbyk-000518-8e; Fri, 13 Aug 2021 18:32:26 +0000
Received: by outflank-mailman (input) for mailman id 166875;
 Fri, 13 Aug 2021 18:32:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EvoD=NE=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mEbyj-0004kY-De
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 18:32:25 +0000
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c8d68a2a-5ecf-43bb-a11a-d9afcc7bf99f;
 Fri, 13 Aug 2021 18:32:21 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 55AB85C012A;
 Fri, 13 Aug 2021 14:32:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 13 Aug 2021 14:32:21 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Aug 2021 14:32:19 -0400 (EDT)
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
X-Inumbo-ID: c8d68a2a-5ecf-43bb-a11a-d9afcc7bf99f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; bh=IKoBgzHmgDOlfPQ1xeHDTqsV+rETVf6ViwxBjXKEv
	as=; b=TMYghqOBgVzEwHL9479rfZDdn53w53KW6PXRVZJ5TjPgEQbby+JXXukT7
	xuxsaWJoDcWxpXkEfgO9lFbbL1tfyd4kgmtx2oiaiatze/rsMpTK8S7uZwpV0oOV
	HGQQHSxB1zQTUt1cyIwMsDTonKIehLoGU05c7OdF9Ma/d8jYbzTGbrf2ADhRJ24/
	XATIln0iH2yiwS0WMGuG4604fQCHysveqdcoQGy52PQPTQEXPk2UbkkEME5yrpb7
	02Rj65ueRTEFYAyVJ8fgX7os8QMEKUx6R49Bu6Dh7u+K2eBPLdKopLBbXNls/YF3
	YtHPwSqEpy+REBNl72GveTzU1yRIQ==
X-ME-Sender: <xms:tboWYfA8I6ZaNbepiQyEr0VFkLDVmPpTxVe6YMmso3IS0UwNxBSSrg>
    <xme:tboWYViu9vrhOrFrBOlSRauaUm2SXWg2wOi3ir_FgjQksh9TqKevSLri_zgYW6pke
    0KPD32yEU8k5Q>
X-ME-Received: <xmr:tboWYamjK3xjCZkACZYOcjKBLbTwa6Jq_k0Q1Gz8ISxQxgoC7WyuRJk06DSi8efLUUopnXZ4jE5LTEhiHsHjURQ3vPPvmVLd0Xz17GOfz_Fkzgm29g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrkeehgdduvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfgggtohfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeek
    jefhkeffkeekkeffiefhhffhledtgfejleeikeevffegfeelueehueeuleeljeenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:tboWYRzxTcaZolbGt24LuGuOSlPKcDOzwEulSSyovCaHXnvJ3ZhsBg>
    <xmx:tboWYUSV4j_6qFyiI1UdCrFNwfBsmoPp6GrofHqrb5ZqZ3ZaOuYuUw>
    <xmx:tboWYUZCK9kB2fc68Yv345x2LvkvdBw8nUwBwSPwBj9adehd4aSvzA>
    <xmx:tboWYTG-mb0LvYE7Nt47kVz-jX1f7d2TRcUeBDQjj2-2RROjVpY53g>
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] ns16550: add Exar dual PCIe UART card support
Date: Fri, 13 Aug 2021 20:31:39 +0200
Message-Id: <20210813183139.391546-2-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210813183139.391546-1-marmarek@invisiblethingslab.com>
References: <20210813183139.391546-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Invisible Things Lab
Content-Transfer-Encoding: 8bit

Besides standard UART setup, this device needs enabling
(vendor-specific) "Enhanced Control Bits" - otherwise disabling hardware
control flow (MCR[2]) is ignored. Add appropriate quirk to the
ns16550_setup_preirq(), similar to the handle_dw_usr_busy_quirk(). The
new function act on Exar cards only (based on vendor ID).

Additionally, Exar card supports fractional divisor (DLD[3:0] register,
at 0x10). This part is not supported here yet, and seems to not
be required for working 115200bps at the very least.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 xen/drivers/char/ns16550.c  | 39 +++++++++++++++++++++++++++++++++++--
 xen/include/xen/8250-uart.h |  4 ++++
 xen/include/xen/pci_ids.h   |  2 ++
 3 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 97b85b0225cc..540124b198df 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -88,6 +88,7 @@ struct ns16550_config {
         param_pericom_2port,
         param_pericom_4port,
         param_pericom_8port,
+        param_exar_xr17v3521,
     } param;
 };
 
@@ -169,6 +170,21 @@ static void handle_dw_usr_busy_quirk(struct ns16550 *uart)
     }
 }
 
+static void enable_exar_enhanced_bits(struct ns16550 *uart)
+{
+#ifdef NS16550_PCI
+    if ( uart->bar &&
+         pci_conf_read16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[2],
+                         uart->ps_bdf[2]), PCI_VENDOR_ID) == PCI_VENDOR_ID_EXAR )
+    {
+        /* Exar cards ignores setting MCR[2] (hardware flow control) unless
+         * "Enhanced control bits" is enabled.
+         */
+        ns_write_reg(uart, UART_XR_EFR, UART_EFR_ECB);
+    }
+#endif
+}
+
 static void ns16550_interrupt(
     int irq, void *dev_id, struct cpu_user_regs *regs)
 {
@@ -303,6 +319,9 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
     /* Handle the DesignWare 8250 'busy-detect' quirk. */
     handle_dw_usr_busy_quirk(uart);
 
+    /* Enable Exar "Enhanced function bits" */
+    enable_exar_enhanced_bits(uart);
+
     /* Line control and baud-rate generator. */
     ns_write_reg(uart, UART_LCR, lcr | UART_LCR_DLAB);
     if ( uart->baud != BAUD_AUTO )
@@ -781,7 +800,17 @@ static const struct ns16550_config_param __initconst uart_param[] = {
         .lsr_mask = UART_LSR_THRE,
         .bar0 = 1,
         .max_ports = 8,
-    }
+    },
+    [param_exar_xr17v3521] = {
+        .base_baud = 7812500,
+        .uart_offset = 0x400,
+        .reg_width = 1,
+        .fifo_size = 256,
+        .lsr_mask = UART_LSR_THRE,
+        .bar0 = 1,
+        .mmio = 1,
+        .max_ports = 2,
+    },
 };
 
 static const struct ns16550_config __initconst uart_config[] =
@@ -1007,7 +1036,13 @@ static const struct ns16550_config __initconst uart_config[] =
         .vendor_id = PCI_VENDOR_ID_PERICOM,
         .dev_id = 0x7958,
         .param = param_pericom_8port
-    }
+    },
+    /* Exar Corp. XR17V3521 Dual PCIe UART */
+    {
+        .vendor_id = PCI_VENDOR_ID_EXAR,
+        .dev_id = 0x0352,
+        .param = param_exar_xr17v3521
+    },
 };
 
 static int __init
diff --git a/xen/include/xen/8250-uart.h b/xen/include/xen/8250-uart.h
index 5c3bac33221e..8c12fbbb3d5a 100644
--- a/xen/include/xen/8250-uart.h
+++ b/xen/include/xen/8250-uart.h
@@ -121,6 +121,10 @@
 /* Frequency of external clock source. This definition assumes PC platform. */
 #define UART_CLOCK_HZ     1843200
 
+/* Exar specific */
+#define UART_XR_EFR       0x09
+#define UART_EFR_ECB      0x10
+
 /* Resume retry settings */
 #define RESUME_DELAY      MILLISECS(10)
 #define RESUME_RETRIES    100
diff --git a/xen/include/xen/pci_ids.h b/xen/include/xen/pci_ids.h
index 7788ba9d2f34..e798477a7e23 100644
--- a/xen/include/xen/pci_ids.h
+++ b/xen/include/xen/pci_ids.h
@@ -4,6 +4,8 @@
 
 #define PCI_VENDOR_ID_PERICOM            0x12d8
 
+#define PCI_VENDOR_ID_EXAR               0x13a8
+
 #define PCI_VENDOR_ID_OXSEMI             0x1415
 
 #define PCI_VENDOR_ID_BROADCOM           0x14e4
-- 
2.31.1


