Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A913F03A1
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 14:17:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168238.307169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGKVN-0004c8-AQ; Wed, 18 Aug 2021 12:17:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168238.307169; Wed, 18 Aug 2021 12:17:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGKVN-0004a9-5J; Wed, 18 Aug 2021 12:17:13 +0000
Received: by outflank-mailman (input) for mailman id 168238;
 Wed, 18 Aug 2021 12:17:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWQ4=NJ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mGKVL-0004Zf-VB
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 12:17:11 +0000
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 311a1c04-1c16-4168-a105-239e8f90fe66;
 Wed, 18 Aug 2021 12:17:10 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 9F8EE5C0182;
 Wed, 18 Aug 2021 08:17:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 18 Aug 2021 08:17:10 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Aug 2021 08:17:08 -0400 (EDT)
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
X-Inumbo-ID: 311a1c04-1c16-4168-a105-239e8f90fe66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; bh=tHLu54DNbApK5FuCKF/dJDYYj+E0iXg9UepGQhkZ6
	3g=; b=pn9MK2ROqqZWRCLxD57EocBhpwWnlXIFBryNVjg519i/3L5Rbb/bm0z5Y
	eI/OXW1NnP6F66blG9rLmx1VRcJ7tl5EavCDdq8CG2HRkAt43HjBfy6bzCq+eSfy
	q6g5Uc8EN9JRyPAJ3P1pn5LM2KmhvG4YrWqYHS4b1yg1zo2Nvt8PFx6hotwAivFo
	1D3pZq7pQHEUrf/Oq9kkp2gTNyfFx0KnOzavzV6SXACbuSxDNYDo4NkQ9Nd+Rsmk
	Uf8yXldFPOFSDZ9G3aqPhHQ8BdRYefApFyStgPzZxE5PgAa5MCO/7ZD118KO9ah/
	hWn2MYZpeqZWrgGsg9SVFol8wdQoQ==
X-ME-Sender: <xms:RvocYQFH6jxHjG85MAvjkY4nFXnJBClANogApY9h4C75eWZBt5KsSA>
    <xme:RvocYZU9bQYzYdbvDKml1pHNXZqA4bj_AScP7YNLP2uxWK6HJd-7htfCwnSTIL8a1
    BMRauwLaqg1-w>
X-ME-Received: <xmr:RvocYaJuk9SprVngzq7D5qUeK9_FNt_P8Vkwzuyc5ETz1vO9CCw2CE1I68WqmPQkANqs_88>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleehgdehtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhggtghogfesthekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepleek
    ueejhfefieevkeetvdeuleegkefhvdehffdtgfetueefgeehteduteehfffhnecuffhomh
    grihhnpehmrgiglhhinhgvrghrrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhih
    hnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:RvocYSETZ7agz5dH7W3hwIGOj2o9nWQsC5P-nzO0NE9z0R_4l4jPwg>
    <xmx:RvocYWWPwsGbtAt1gZPb2Hf2QX1L0x9CAL_dNXZWYcPbr1Bgm3U9BA>
    <xmx:RvocYVNorpS9Eo6OXDnfl4Y0-QcPCsn2LY1ZXSNgcwIOVcV_ZQy-vg>
    <xmx:RvocYYJu64O0_Njem6GP2oWpdc4hXmC01mvuwfSHUq1K-KkIu5lLXQ>
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
Subject: [PATCH v2 2/2] ns16550: add Exar PCIe UART cards support
Date: Wed, 18 Aug 2021 14:16:48 +0200
Message-Id: <20210818121649.462413-2-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210818121649.462413-1-marmarek@invisiblethingslab.com>
References: <20210818121649.462413-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Invisible Things Lab
Content-Transfer-Encoding: 8bit

Besides standard UART setup, this device needs enabling
(vendor-specific) "Enhanced Control Bits" - otherwise disabling hardware
control flow (MCR[2]) is ignored. Add appropriate quirk to the
ns16550_setup_preirq(), similar to the handle_dw_usr_busy_quirk(). The
new function act on Exar 2-, 4-, and 8- port cards only. I have tested
the functionality on 2-port card but based on the Linux driver, the same
applies to other models too.

Additionally, Exar card supports fractional divisor (DLD[3:0] register,
at 0x02). This part is not supported here yet, and seems to not
be required for working 115200bps at the very least.

The specification for the 2-port card is available at:
https://www.maxlinear.com/product/interface/uarts/pcie-uarts/xr17v352

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v2:
 - use read-modify-write for enabling ECB
 - handle also 4- and 8-ports cards (but not everything from Exar)
 - formatting fixes
---
 xen/drivers/char/ns16550.c  | 81 ++++++++++++++++++++++++++++++++++++-
 xen/include/xen/8250-uart.h |  5 +++
 xen/include/xen/pci_ids.h   |  2 +
 3 files changed, 86 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 97b85b0225cc..27501f28aa7b 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -88,6 +88,9 @@ struct ns16550_config {
         param_pericom_2port,
         param_pericom_4port,
         param_pericom_8port,
+        param_exar_xr17v352,
+        param_exar_xr17v354,
+        param_exar_xr17v358,
     } param;
 };
 
@@ -169,6 +172,29 @@ static void handle_dw_usr_busy_quirk(struct ns16550 *uart)
     }
 }
 
+static void enable_exar_enhanced_bits(struct ns16550 *uart)
+{
+#ifdef NS16550_PCI
+    if ( uart->bar &&
+         pci_conf_read16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[2],
+                         uart->ps_bdf[2]), PCI_VENDOR_ID) == PCI_VENDOR_ID_EXAR )
+    {
+        u8 devid = ns_read_reg(uart, UART_XR_DVID);
+        u8 efr;
+        /*
+         * Exar XR17V35x cards ignore setting MCR[2] (hardware flow control)
+         * unless "Enhanced control bits" is enabled.
+         * The below checks for a 2, 4 or 8 port UART, following Linux driver.
+         */
+        if ( devid == 0x82 || devid == 0x84 || devid == 0x88 ) {
+            efr = ns_read_reg(uart, UART_XR_EFR);
+            efr |= UART_EFR_ECB;
+            ns_write_reg(uart, UART_XR_EFR, efr);
+        }
+    }
+#endif
+}
+
 static void ns16550_interrupt(
     int irq, void *dev_id, struct cpu_user_regs *regs)
 {
@@ -303,6 +329,9 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
     /* Handle the DesignWare 8250 'busy-detect' quirk. */
     handle_dw_usr_busy_quirk(uart);
 
+    /* Enable Exar "Enhanced function bits" */
+    enable_exar_enhanced_bits(uart);
+
     /* Line control and baud-rate generator. */
     ns_write_reg(uart, UART_LCR, lcr | UART_LCR_DLAB);
     if ( uart->baud != BAUD_AUTO )
@@ -781,7 +810,37 @@ static const struct ns16550_config_param __initconst uart_param[] = {
         .lsr_mask = UART_LSR_THRE,
         .bar0 = 1,
         .max_ports = 8,
-    }
+    },
+    [param_exar_xr17v352] = {
+        .base_baud = 7812500,
+        .uart_offset = 0x400,
+        .reg_width = 1,
+        .fifo_size = 256,
+        .lsr_mask = UART_LSR_THRE,
+        .bar0 = 1,
+        .mmio = 1,
+        .max_ports = 2,
+    },
+    [param_exar_xr17v354] = {
+        .base_baud = 7812500,
+        .uart_offset = 0x400,
+        .reg_width = 1,
+        .fifo_size = 256,
+        .lsr_mask = UART_LSR_THRE,
+        .bar0 = 1,
+        .mmio = 1,
+        .max_ports = 4,
+    },
+    [param_exar_xr17v358] = {
+        .base_baud = 7812500,
+        .uart_offset = 0x400,
+        .reg_width = 1,
+        .fifo_size = 256,
+        .lsr_mask = UART_LSR_THRE,
+        .bar0 = 1,
+        .mmio = 1,
+        .max_ports = 8,
+    },
 };
 
 static const struct ns16550_config __initconst uart_config[] =
@@ -1007,7 +1066,25 @@ static const struct ns16550_config __initconst uart_config[] =
         .vendor_id = PCI_VENDOR_ID_PERICOM,
         .dev_id = 0x7958,
         .param = param_pericom_8port
-    }
+    },
+    /* Exar Corp. XR17V352 Dual PCIe UART */
+    {
+        .vendor_id = PCI_VENDOR_ID_EXAR,
+        .dev_id = 0x0352,
+        .param = param_exar_xr17v352
+    },
+    /* Exar Corp. XR17V354 Quad PCIe UART */
+    {
+        .vendor_id = PCI_VENDOR_ID_EXAR,
+        .dev_id = 0x0354,
+        .param = param_exar_xr17v354
+    },
+    /* Exar Corp. XR17V358 Octal PCIe UART */
+    {
+        .vendor_id = PCI_VENDOR_ID_EXAR,
+        .dev_id = 0x0358,
+        .param = param_exar_xr17v358
+    },
 };
 
 static int __init
diff --git a/xen/include/xen/8250-uart.h b/xen/include/xen/8250-uart.h
index 5c3bac33221e..74e9d552a718 100644
--- a/xen/include/xen/8250-uart.h
+++ b/xen/include/xen/8250-uart.h
@@ -35,6 +35,8 @@
 #define UART_USR          0x1f    /* Status register (DW) */
 #define UART_DLL          0x00    /* divisor latch (ls) (DLAB=1) */
 #define UART_DLM          0x01    /* divisor latch (ms) (DLAB=1) */
+#define UART_XR_EFR       0x09    /* Enhanced function register (Exar) */
+#define UART_XR_DVID      0x8d    /* Device identification */
 
 /* Interrupt Enable Register */
 #define UART_IER_ERDAI    0x01    /* rx data recv'd       */
@@ -121,6 +123,9 @@
 /* Frequency of external clock source. This definition assumes PC platform. */
 #define UART_CLOCK_HZ     1843200
 
+/* Bits in Exar specific UART_XR_EFR register */
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


