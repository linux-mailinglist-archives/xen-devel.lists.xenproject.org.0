Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2570752145C
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 13:56:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325533.548142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noOTL-0006I9-CJ; Tue, 10 May 2022 11:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325533.548142; Tue, 10 May 2022 11:56:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noOTL-0006Es-8k; Tue, 10 May 2022 11:56:11 +0000
Received: by outflank-mailman (input) for mailman id 325533;
 Tue, 10 May 2022 11:56:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kgyf=VS=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1noOTJ-0006Eh-Jv
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 11:56:09 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ac8f4b2-d058-11ec-8fc4-03012f2f19d4;
 Tue, 10 May 2022 13:56:05 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id C08E33200035;
 Tue, 10 May 2022 07:56:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 10 May 2022 07:56:02 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 May 2022 07:55:59 -0400 (EDT)
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
X-Inumbo-ID: 2ac8f4b2-d058-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1652183761; x=1652270161; bh=l470sTk6AYbXl/5StCvjUCS8xfxEHkh+cnC
	xv6SFlLs=; b=ZCUmZT3Os/s28TZniTUEc9go6riZk3N372WE1HduPF3qrdmJawx
	av0VkpNGQHtuzo4YPQFvGfd/BbSg0ZjFzEiqg4JXnZrmJAOxbt3ONgRGHspa723V
	9O3cggoTMIx77F4SMAKXxa7qfYTHTjdgWUnB1fF1lv86zpv93M0BsBbe/Z59AbXh
	Lxdnar9tCi/Y6jEBHnAKMHDVgkSAFkEcZMrfiBZuhboW9QE5ABuPIIbJEJNRmVyk
	ukDXMVWmNFI3jkUwsiBasRN2bq+UgdwN5VoqVj+lvxeC7hF32Mm18BdPnz3ciayP
	/DTIqeBSMCU/C/ZZOdrLjDWmOMjaruyWblg==
X-ME-Sender: <xms:0VJ6YnQwO4eBSbY0rnHrMbp8h4YAlXX6vDSBgIBjErtWOrwjzmzS0A>
    <xme:0VJ6Yoz1oUzQRYZ3b_qUJNMCt7zbNU213l-S5t7jbaW2L0shKY3IZNATjiumS1C-s
    u_pWkN4C93J2g>
X-ME-Received: <xmr:0VJ6Ys2sAeDOjNCVl5HlCSBHLmwhP0RQySBsul53z69PHRY2lVAx-gd3mx-yD0GpRx-ftWkQd34KPewyIBW5chkt9TI_YxjpIjPc-z08G9H7TucU9M8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedugdegudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepleekhfdu
    leetleelleetteevfeefteffkeetteejheelgfegkeelgeehhfdthedvnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:0VJ6YnAt1jn-l4zgHg0fazl9dHjr-PeRLkWENaSnPkzQHMQGi9KrSQ>
    <xmx:0VJ6Ygi9h0yGCLOB_8Dy-LEHwkK46fnlscSj0o0zjLwhXWnOIEdmyQ>
    <xmx:0VJ6YrpI5z0oEMsIAXEFVvn9hjXS7A1qubUiIRBF_zj2XNm1XzzX0g>
    <xmx:0VJ6YqYjAYFSsYT0UK9OIVGNr17ZrxDrb51wc8USSzvr_sl7qODIiA>
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/2] ns16550: reject IRQ above nr_irqs_gsi
Date: Tue, 10 May 2022 13:55:45 +0200
Message-Id: <20220510115546.1779279-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Intel LPSS has INTERRUPT_LINE set to 0xff by default, that can't
possibly work. While a proper IRQ configuration may be useful,
validating value retrieved from the hardware is still necessary. If it
fails, use the device in poll mode, instead of crashing down the line
(at smp_initr_init()). Currently it's
x86-specific, as the surrounding code is guarded with CONFIG_X86 anyway.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v2:
 - add log message
 - extend commit message
 - code style fix
---
 xen/drivers/char/ns16550.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index fb75cee4a13a..0c6f6ec43de1 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -1238,6 +1238,15 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
                             pci_conf_read8(PCI_SBDF(0, b, d, f),
                                            PCI_INTERRUPT_LINE) : 0;
 
+                if ( uart->irq >= nr_irqs_gsi )
+                {
+                    printk(XENLOG_WARNING
+                           "ns16550: %02x:%02x.%u reports invalid IRQ %d, "
+                           "falling back to a poll mode\n",
+                           b, d, f, uart->irq);
+                    uart->irq = 0;
+                }
+
                 return 0;
             }
         }
-- 
2.35.1


