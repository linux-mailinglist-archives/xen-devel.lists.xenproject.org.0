Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4ED93F2059
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 21:07:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169114.308932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGnNB-0008PP-KM; Thu, 19 Aug 2021 19:06:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169114.308932; Thu, 19 Aug 2021 19:06:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGnNB-0008Le-Ef; Thu, 19 Aug 2021 19:06:41 +0000
Received: by outflank-mailman (input) for mailman id 169114;
 Thu, 19 Aug 2021 19:06:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s4yt=NK=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mGnN9-0008Dw-Pq
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 19:06:39 +0000
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3152679c-4063-4bba-a285-de6273cb9d11;
 Thu, 19 Aug 2021 19:06:38 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 0D4D43200980;
 Thu, 19 Aug 2021 15:06:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 19 Aug 2021 15:06:37 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 15:06:35 -0400 (EDT)
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
X-Inumbo-ID: 3152679c-4063-4bba-a285-de6273cb9d11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; bh=llIunglqLdGPA+WyvDWpyBlljJRyGN7mUOneRQzXw
	Io=; b=KbVVKZlvIBkQ1qUdeRdJRalGwDzBDqPgMEfpPahtFW0wjBOqDniBnx0EH
	NvoCMEjbYqQmJW1IIto8GD4cXxOY9eWW5fefwFK1w+PTEjaNl3IxIcNHEzD2sKmq
	eF+zxSfttkr9mXnHhtmTwqWLpy0lQJqoUmaecvmO9suSInqrBp9Ar2f9qHPbz1AC
	hNuzwk8iYXRG0Cd1rCwxn8BS7bqWyV7scIoqk8q5GjXJC4m62fRi/2PoLwjJUsdh
	fbOnUqusoTcZdkVGJo6OguoUfVoeV4x8Jpi5q4tWKXyzUU+z7v78FR8gxJl3Mh5U
	OeEpqr8GK71WyQJ/CydezPtvKZ/JA==
X-ME-Sender: <xms:vKseYa1W_KR2zHKAsFZPKAIzj2SUi2XpBAYBCe-UH4Y-pvZblKztBA>
    <xme:vKseYdFxwioHaUFfSarutd6Q-D1bt0QnJdupoO3BkBtIW95eTYZnBdFJBdgs35EWv
    cq3Hl-9wSB36g>
X-ME-Received: <xmr:vKseYS6UGAmSt-SAroYiSEaVyDFhBjKQgnJrxKSrAN90p8PoU1H3e0h_APw4QDdxu0RidToD9Q4EyN3UGFFdQnVT5PAgyYvIvIEIHjy7KtpeGK98dQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgddufeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfgggtohfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeel
    keeujefhfeeiveektedvueelgeekhfdvhefftdfgteeufeegheetudetheffhfenucffoh
    hmrghinhepmhgrgihlihhnvggrrhdrtghomhenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthh
    hinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:vKseYb3X47djwFRxPGTDhXqHtpu2khw3yWSozNB3AJLfVhwL_sD9Mg>
    <xmx:vKseYdFtVgRGkiFlRcIsepRedqDaHCz50gCEMJZRuHAn7aR6-zNe5w>
    <xmx:vKseYU8kCXs583jJnKCNah9qvn3WUwMHqk7fC0q8qL2z8d4CZGen1Q>
    <xmx:vKseYS7BkK4fSkOwmx8tFAdynLTJkaiHcs5IAo6OZtpKKORJC1FJBQ>
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
Subject: [PATCH v3 2/2] ns16550: add Exar PCIe UART cards support
Date: Thu, 19 Aug 2021 21:06:25 +0200
Message-Id: <20210819190625.476165-2-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819190625.476165-1-marmarek@invisiblethingslab.com>
References: <20210819190625.476165-1-marmarek@invisiblethingslab.com>
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
Changes in v3:
 - guard the quirk based on a PCI device ID only (via checking
   uart->param)
 - use const param
 - code style fixes

I've opted to move the #ifdef into ns16550_setup_preirq() itself and
move the whole enable_exar_enhanced_bits() into appropriate #ifdef too
(need to move it anyway, to use uart_param). But if you prefer the older
structure (#ifdef inside ns16550_setup_preirq()), I can do that too.
---
 xen/drivers/char/ns16550.c  | 83 ++++++++++++++++++++++++++++++++++++-
 xen/include/xen/8250-uart.h |  5 +++
 xen/include/xen/pci_ids.h   |  2 +
 3 files changed, 88 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 20da8fd3b421..b777c8711ee0 100644
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
 
@@ -104,6 +107,8 @@ struct ns16550_config_param {
     unsigned int uart_offset;
     unsigned int first_offset;
 };
+
+static void enable_exar_enhanced_bits(const struct ns16550 *uart);
 #endif
 
 static void ns16550_delayed_resume(void *data);
@@ -303,6 +308,11 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
     /* Handle the DesignWare 8250 'busy-detect' quirk. */
     handle_dw_usr_busy_quirk(uart);
 
+#ifdef CONFIG_HAS_PCI
+    /* Enable Exar "Enhanced function bits" */
+    enable_exar_enhanced_bits(uart);
+#endif
+
     /* Line control and baud-rate generator. */
     ns_write_reg(uart, UART_LCR, lcr | UART_LCR_DLAB);
     if ( uart->baud != BAUD_AUTO )
@@ -781,7 +791,37 @@ static const struct ns16550_config_param __initconst uart_param[] = {
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
@@ -1007,7 +1047,25 @@ static const struct ns16550_config __initconst uart_config[] =
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
@@ -1177,6 +1235,27 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
     return 0;
 }
 
+static void enable_exar_enhanced_bits(const struct ns16550 *uart)
+{
+    uint8_t efr;
+
+    switch ( uart->param - uart_param )
+    {
+    case param_exar_xr17v352:
+    case param_exar_xr17v354:
+    case param_exar_xr17v358:
+        /*
+         * Exar XR17V35x cards ignore setting MCR[2] (hardware flow control)
+         * unless "Enhanced control bits" is enabled.
+         * The below checks for a 2, 4 or 8 port UART, following Linux driver.
+         */
+        efr = ns_read_reg(uart, UART_XR_EFR);
+        efr |= UART_EFR_ECB;
+        ns_write_reg(uart, UART_XR_EFR, efr);
+        break;
+    }
+}
+
 #endif /* CONFIG_HAS_PCI */
 
 /*
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


