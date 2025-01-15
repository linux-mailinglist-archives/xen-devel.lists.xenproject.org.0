Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA77A11673
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 02:21:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872146.1283102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXs5V-0003fG-Rf; Wed, 15 Jan 2025 01:20:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872146.1283102; Wed, 15 Jan 2025 01:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXs5V-0003dY-P4; Wed, 15 Jan 2025 01:20:53 +0000
Received: by outflank-mailman (input) for mailman id 872146;
 Wed, 15 Jan 2025 01:20:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9vXr=UH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tXs5U-0003Zb-Hb
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 01:20:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f32d5789-d2de-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 02:20:48 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BDD2D5C5A51;
 Wed, 15 Jan 2025 01:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36952C4CEDD;
 Wed, 15 Jan 2025 01:20:45 +0000 (UTC)
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
X-Inumbo-ID: f32d5789-d2de-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736904046;
	bh=ViiLC0GwU5LMLuDCizfF1e2xq5a/X9rUrRZGpA7LkhQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pf9K8GRpaoM5VdrS2+Gg8HC4abfchCegNVHTuHowzWpGLSdIh5oGFqOxh34tqVvLI
	 p0ufFBPlZZU3O7B5PK9BtWSJ7ytkjd9UNiTnsulXue6PhMSg2Kjf3R4MRheC+DmPNT
	 hzCe74phPBKuzCw4Tod9dQCZ9/ZFjC9KJcb9uFUrT460MPtbEDz+3wXkgOvQqIuLQg
	 IGM9FxMT47vBzMPyX9NA/uI6Cpmr19gq97g2eyUzLNznUVnYbwIkYSBM3cs7jZGSVR
	 /0Hf5If5e2kX/DiDGblC/92ggv+43wHokXS+UEVVq8ftW6DmtwvEPl1sn75Je/xy6W
	 aNH3g8yNFxDww==
Date: Tue, 14 Jan 2025 17:20:43 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Artem Mygaiev <artem_mygaiev@epam.com>
Subject: Re: [PATCH] docs: fusa: Fix OFT tags for the design requirements
In-Reply-To: <20250114185707.3376960-1-ayan.kumar.halder@amd.com>
Message-ID: <alpine.DEB.2.22.394.2501141720280.2684657@ubuntu-linux-20-04-desktop>
References: <20250114185707.3376960-1-ayan.kumar.halder@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 14 Jan 2025, Ayan Kumar Halder wrote:
> The OFT tags for the design requirements are updated.
> 
> Fixes: b9f9b396452 ("docs: fusa: Add dom0less domain configuration requirements")
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>


Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  .../reqs/design-reqs/arm64/generic-timer.rst  | 16 +++++-----
>  .../fusa/reqs/design-reqs/arm64/sbsa-uart.rst | 30 +++++++++----------
>  2 files changed, 23 insertions(+), 23 deletions(-)
> 
> diff --git a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
> index 9d2a5a8085..745e755638 100644
> --- a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
> +++ b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
> @@ -21,7 +21,7 @@ Comments:
>  Domains can detect the presence of the Generic Timer device tree node.
>  
>  Covers:
> - - `XenProd~emulated_timer~1`
> + - `XenProd~arm64_emulated_timer~1`
>  
>  Read system counter frequency
>  -----------------------------
> @@ -37,7 +37,7 @@ Rationale:
>  Comments:
>  
>  Covers:
> - - `XenProd~emulated_timer~1`
> + - `XenProd~arm64_emulated_timer~1`
>  
>  Access CNTKCTL_EL1 system register from a domain
>  ------------------------------------------------
> @@ -53,7 +53,7 @@ Rationale:
>  Comments:
>  
>  Covers:
> - - `XenProd~emulated_timer~1`
> + - `XenProd~arm64_emulated_timer~1`
>  
>  Access virtual timer from a domain
>  ----------------------------------
> @@ -69,7 +69,7 @@ Rationale:
>  Comments:
>  
>  Covers:
> - - `XenProd~emulated_timer~1`
> + - `XenProd~arm64_emulated_timer~1`
>  
>  Access physical timer from a domain
>  -----------------------------------
> @@ -85,7 +85,7 @@ Rationale:
>  Comments:
>  
>  Covers:
> - - `XenProd~emulated_timer~1`
> + - `XenProd~arm64_emulated_timer~1`
>  
>  Trigger the virtual timer interrupt from a domain
>  -------------------------------------------------
> @@ -101,7 +101,7 @@ Rationale:
>  Comments:
>  
>  Covers:
> - - `XenProd~emulated_timer~1`
> + - `XenProd~arm64_emulated_timer~1`
>  
>  Trigger the physical timer interrupt from a domain
>  --------------------------------------------------
> @@ -117,7 +117,7 @@ Rationale:
>  Comments:
>  
>  Covers:
> - - `XenProd~emulated_timer~1`
> + - `XenProd~arm64_emulated_timer~1`
>  
>  Assumption of Use on the Platform
>  =================================
> @@ -139,7 +139,7 @@ While there is a provision to get this value by reading the "clock-frequency"
>  dt property [2], the use of this property is strongly discouraged.
>  
>  Covers:
> - - `XenProd~emulated_timer~1`
> + - `XenProd~arm64_emulated_timer~1`
>  
>  [1] Arm Architecture Reference Manual for A-profile architecture, Chapter 11
>  [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml
> diff --git a/docs/fusa/reqs/design-reqs/arm64/sbsa-uart.rst b/docs/fusa/reqs/design-reqs/arm64/sbsa-uart.rst
> index 89598fa8a5..9aaf081f16 100644
> --- a/docs/fusa/reqs/design-reqs/arm64/sbsa-uart.rst
> +++ b/docs/fusa/reqs/design-reqs/arm64/sbsa-uart.rst
> @@ -21,7 +21,7 @@ Comments:
>  Domains can detect the presence of the SBSA UART device tree node.
>  
>  Covers:
> - - `XenProd~emulated_uart~1`
> + - `XenProd~arm64_emulated_uart~1`
>  
>  Transmit data in software polling mode
>  --------------------------------------
> @@ -36,7 +36,7 @@ Rationale:
>  Comments:
>  
>  Covers:
> - - `XenProd~emulated_uart~1`
> + - `XenProd~arm64_emulated_uart~1`
>  
>  Transmit data in interrupt driven mode
>  --------------------------------------
> @@ -51,7 +51,7 @@ Rationale:
>  Comments:
>  
>  Covers:
> - - `XenProd~emulated_uart~1`
> + - `XenProd~arm64_emulated_uart~1`
>  
>  Receive data in software polling mode
>  -------------------------------------
> @@ -66,7 +66,7 @@ Rationale:
>  Comments:
>  
>  Covers:
> - - `XenProd~emulated_uart~1`
> + - `XenProd~arm64_emulated_uart~1`
>  
>  Receive data in interrupt driven mode
>  -------------------------------------
> @@ -81,7 +81,7 @@ Rationale:
>  Comments:
>  
>  Covers:
> - - `XenProd~emulated_uart~1`
> + - `XenProd~arm64_emulated_uart~1`
>  
>  Access UART data register
>  -------------------------
> @@ -96,7 +96,7 @@ Rationale:
>  Comments:
>  
>  Covers:
> - - `XenProd~emulated_uart~1`
> + - `XenProd~arm64_emulated_uart~1`
>  
>  Access UART receive status register
>  -----------------------------------
> @@ -111,7 +111,7 @@ Rationale:
>  Comments:
>  
>  Covers:
> - - `XenProd~emulated_uart~1`
> + - `XenProd~arm64_emulated_uart~1`
>  
>  Access UART flag register
>  -------------------------
> @@ -126,7 +126,7 @@ Rationale:
>  Comments:
>  
>  Covers:
> - - `XenProd~emulated_uart~1`
> + - `XenProd~arm64_emulated_uart~1`
>  
>  Access UART mask set/clear register
>  -----------------------------------
> @@ -141,7 +141,7 @@ Rationale:
>  Comments:
>  
>  Covers:
> - - `XenProd~emulated_uart~1`
> + - `XenProd~arm64_emulated_uart~1`
>  
>  Access UART raw interrupt status register
>  -----------------------------------------
> @@ -156,7 +156,7 @@ Rationale:
>  Comments:
>  
>  Covers:
> - - `XenProd~emulated_uart~1`
> + - `XenProd~arm64_emulated_uart~1`
>  
>  Access UART masked interrupt status register
>  --------------------------------------------
> @@ -171,7 +171,7 @@ Rationale:
>  Comments:
>  
>  Covers:
> - - `XenProd~emulated_uart~1`
> + - `XenProd~arm64_emulated_uart~1`
>  
>  Access UART interrupt clear register
>  ------------------------------------
> @@ -186,7 +186,7 @@ Rationale:
>  Comments:
>  
>  Covers:
> - - `XenProd~emulated_uart~1`
> + - `XenProd~arm64_emulated_uart~1`
>  
>  Receive UART TX interrupt
>  -------------------------
> @@ -202,7 +202,7 @@ Rationale:
>  Comments:
>  
>  Covers:
> - - `XenProd~emulated_uart~1`
> + - `XenProd~arm64_emulated_uart~1`
>  
>  Receive UART RX interrupt reception
>  -----------------------------------
> @@ -218,7 +218,7 @@ Rationale:
>  Comments:
>  
>  Covers:
> - - `XenProd~emulated_uart~1`
> + - `XenProd~arm64_emulated_uart~1`
>  
>  [1] Arm Base System Architecture, chapter B
> -[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/serial/arm_sbsa_uart.txt
> \ No newline at end of file
> +[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/serial/arm_sbsa_uart.txt
> -- 
> 2.25.1
> 

