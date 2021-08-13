Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A25EB3EBC18
	for <lists+xen-devel@lfdr.de>; Fri, 13 Aug 2021 20:33:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166874.304614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEbyg-0004n6-3q; Fri, 13 Aug 2021 18:32:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166874.304614; Fri, 13 Aug 2021 18:32:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEbyg-0004ke-0n; Fri, 13 Aug 2021 18:32:22 +0000
Received: by outflank-mailman (input) for mailman id 166874;
 Fri, 13 Aug 2021 18:32:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EvoD=NE=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mEbye-0004kY-FW
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 18:32:20 +0000
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2eb9a1eb-3476-46fb-9352-08ae86850b45;
 Fri, 13 Aug 2021 18:32:19 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9B9605C0127;
 Fri, 13 Aug 2021 14:32:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 13 Aug 2021 14:32:19 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Aug 2021 14:32:17 -0400 (EDT)
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
X-Inumbo-ID: 2eb9a1eb-3476-46fb-9352-08ae86850b45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:message-id:mime-version:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=tzcGpq
	uqEMxLUV7wXKWsl7IgLxKOwcw/8mp2lR4H8qs=; b=PDaXNWQrMcEOibPW5UU1Mg
	ZTuJZ+LFUiloLz6F/bSFZVWyOiyorUJj8hHhyes79dG96vDEdTkwr3Yveh7/L84i
	O8X6gSwxM6T4+5nuEynN3U02R9qpPJGDhGghWmQ6oms+vWjPn6UjbGLZ95usN0xG
	6xBWSaaYVG3UwS1PZIJPNAxMlgP22fdAQzdeF50Zb0pMSrlFTqG8k/fCnjlIJAnv
	pipXTOixXeIKEZKeJ5NypC5YTwrgGUV3kpdmL1koPWDrbzfEHn9Jifr5wN/AvLzc
	8mnUy6kcPlwgyFlUm8ww0iQdITtsHcUvDwnQAfMCst8SG2BsfHKWa1rzjjz3iSSw
	==
X-ME-Sender: <xms:sroWYcI3KqmfyNVTSm7WN5IvCrBkA0VLZglXjKVoDDAwf03cZUv4Rg>
    <xme:sroWYcIl4N-Yv6F4pWJ_NJsVYftMBELeqV-kGAWCqkMowuFDHZTIejBQKIQ_ylvqF
    OEEJh7xA3BSuA>
X-ME-Received: <xmr:sroWYcu3lLZ2Ig49C51dAxUpYXQ7A1zzJxShd5WJyFCOgqOOV0q5VGwXKemt8s2sL_3bYESssLjxyYSQ_kGvSKrlgvGB3XLc43IOGgXU-PJDX81ZWQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrkeehgdduvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffogggtohfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetgeet
    keeukeffhfejueeludehtedtkeeuiedtgffgtdfhveefueeiiefhudehgeenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:sroWYZYPehi41AQfUEmO10o6hQonK_PdVA8YmD__z6Rlk2srFV27GA>
    <xmx:sroWYTYrhcQ4d6TdZ5TvY2aCDEMfca2SUfYjdwivZycB5hkCWUONtg>
    <xmx:sroWYVCGNHwWFrkV_HRLnmHVndLDyY-i5tMse_-lh-fdgrKHWs4sHA>
    <xmx:s7oWYYMRffe0NgRrbptqEVQayIzP14qr9ZwNzQjGwbV3dy49E5zhLA>
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
Subject: [PATCH 1/2] ns16550: do not override fifo size if explicitly set
Date: Fri, 13 Aug 2021 20:31:38 +0200
Message-Id: <20210813183139.391546-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Invisible Things Lab
Content-Transfer-Encoding: 8bit

If fifo size is already set via uart_params, do not force it to 16 - which
may not match the actual hardware. Specifically Exar cards have fifo of
256 bytes.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 xen/drivers/char/ns16550.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 16a73d0c0e47..97b85b0225cc 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -357,7 +357,8 @@ static void __init ns16550_init_preirq(struct serial_port *port)
     ns16550_setup_preirq(uart);
 
     /* Check this really is a 16550+. Otherwise we have no FIFOs. */
-    if ( ((ns_read_reg(uart, UART_IIR) & 0xc0) == 0xc0) &&
+    if ( uart->fifo_size <= 1 &&
+         ((ns_read_reg(uart, UART_IIR) & 0xc0) == 0xc0) &&
          ((ns_read_reg(uart, UART_FCR) & UART_FCR_TRG14) == UART_FCR_TRG14) )
         uart->fifo_size = 16;
 }
-- 
2.31.1


