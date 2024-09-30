Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 205D698B06C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 00:46:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807651.1219230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svP9U-0005tf-Ev; Mon, 30 Sep 2024 22:46:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807651.1219230; Mon, 30 Sep 2024 22:46:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svP9U-0005rh-BO; Mon, 30 Sep 2024 22:46:00 +0000
Received: by outflank-mailman (input) for mailman id 807651;
 Mon, 30 Sep 2024 22:45:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yJxO=Q4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1svP9S-0005rb-U1
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 22:45:58 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c12ca484-7f7d-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 00:45:56 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9A44F5C3DFA;
 Mon, 30 Sep 2024 22:45:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53AE7C4CEC7;
 Mon, 30 Sep 2024 22:45:54 +0000 (UTC)
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
X-Inumbo-ID: c12ca484-7f7d-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727736355;
	bh=Jrip/emJdUyFXOLhADT5GN4/fIPq6IMrGS3qQ/pHf2I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jFYDpI5vId7UoISA3XJg24MkQP/L5E3MsiI5Wm6kQR6lnP1AAu9onneorq83aVXX/
	 B9FeS0ev9IdiIktKc6pTYSfkl6LbrkjF3/dpOy+eztoUmJUhKD1/UaEmzUPpuQPA7D
	 4FG3L3UXBjarFz+5LHXKWuNF5aBJsKm3L6sdvXkqvBmQRTCCgfhTkkd3X3yIOaiNvd
	 7eKI5ZhJgx8FBQWeJuF8dGdI3FakEdQDtHYnfPPbet5AbbhW02MkDk7mE1BVP/Qw09
	 mXdCfTFVcqr4mShyDG1FlTJ+P6RsUWx3duXRvZ/VkZHFHr+18ICFy5G4qfWnUIzLJi
	 ao6hsqrAqRfVg==
Date: Mon, 30 Sep 2024 15:45:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
cc: xen-devel@lists.xenproject.org, S32@nxp.com, 
    Andrei Cherechesu <andrei.cherechesu@nxp.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Community Manager <community.manager@xenproject.org>
Subject: Re: [PATCH v2 6/8] CHANGELOG.md: Add NXP S32CC and SCMI-SMC layer
 support mentions
In-Reply-To: <20240930114715.642978-7-andrei.cherechesu@oss.nxp.com>
Message-ID: <alpine.DEB.2.22.394.2409301545291.451631@ubuntu-linux-20-04-desktop>
References: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com> <20240930114715.642978-7-andrei.cherechesu@oss.nxp.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Sep 2024, Andrei Cherechesu (OSS) wrote:
> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> 
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> ---
>  CHANGELOG.md | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 26e7d8dd2a..66ea505843 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -11,6 +11,10 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>     - Prefer ACPI reboot over UEFI ResetSystem() run time service call.
>  
>  ### Added
> +  - On Arm:
> +   - Add support for NXP S32CC platforms and NXP LINFlexD UART driver.
> +   - Add basic handling for SCMI requests over SMC using Shared Memory,
> +   by allowing forwarding the calls to EL3 FW if coming from Dom0.

Misalignment?

Other than that:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


>  ### Removed
>   - On x86:
> -- 
> 2.45.2
> 
> 

