Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDfUCiI2gWmUEwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 00:41:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3256D2B29
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 00:41:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219092.1528035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vn3Ws-0001Nj-Az; Mon, 02 Feb 2026 23:40:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219092.1528035; Mon, 02 Feb 2026 23:40:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vn3Ws-0001LQ-6x; Mon, 02 Feb 2026 23:40:26 +0000
Received: by outflank-mailman (input) for mailman id 1219092;
 Mon, 02 Feb 2026 23:40:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QtZ7=AG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vn3Wq-0001LK-QG
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 23:40:24 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8919cd28-0090-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Feb 2026 00:40:21 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5A6C840DC8;
 Mon,  2 Feb 2026 23:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08CAEC116C6;
 Mon,  2 Feb 2026 23:40:17 +0000 (UTC)
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
X-Inumbo-ID: 8919cd28-0090-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770075619;
	bh=7o7SfeYG+gMPMtdSkYXK8C7sCYH2mIvH1bLRi5urTCE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rQDlwiDSc1Qkae7/U8YIz8I7YsB2Mr+PMrvTcAaHKl+YItGh5xdgzqTiPKR+uXx2o
	 9AhZ2jpcPyGFVMBBG2QmZhn2Ip7cU5hPjwulhzZTJMfuwyZ4pFzx+vEZJ48TnUA/p6
	 Fj3H8c550xx5wohlTLcKt3eUYLCQetaWThRGgX+7GUD1Fgu3Hz2sgfIZQlJJP43YH3
	 BqQvetezLEhbutxWbFTlaHHrbIN3plfkVvWCKatxaiybM3i4U3qTB4DPKVDowx9Wlm
	 /yb/OgGQXf/SIXOxTVHIg7PGEkIEYIZpHOiMUHI4J2G1I2jCwJIdzl3vP9QWHHyDec
	 L/X032BruFYQA==
Date: Mon, 2 Feb 2026 15:40:16 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@xen.org
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v1] automation: align XTF qemu parameters across
 achitectures
In-Reply-To: <20260202193230.21412-2-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2602021540100.2599007@ubuntu-linux-20-04-desktop>
References: <20260202193230.21412-2-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@xen.org,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C3256D2B29
X-Rspamd-Action: no action

On Mon, 1 Feb 2026, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> It is handy to have 2 CPUs and more RAM for smoke testing a hypervisor
> change via XTF.
> 
> Align x86 QEMU configuration with Arm for XTF tests: 2 CPU and 2G of RAM.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Please provide a link to the successful pipeline. With that:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  automation/scripts/include/xtf-x86-64     | 3 ++-
>  automation/scripts/include/xtf-x86-64-efi | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/automation/scripts/include/xtf-x86-64 b/automation/scripts/include/xtf-x86-64
> index b1b0cc201efa..186f074bd8eb 100644
> --- a/automation/scripts/include/xtf-x86-64
> +++ b/automation/scripts/include/xtf-x86-64
> @@ -23,7 +23,8 @@ function xtf_arch_setup()
>          -nographic \
>          -monitor none \
>          -serial stdio \
> -        -m 512 \
> +        -m 2048 \
> +        -smp 2 \
>          -kernel ${XEN_BINARY} \
>          -initrd ${XTF_BINARY} \
>          -append \"${XEN_CMDLINE}\" \
> diff --git a/automation/scripts/include/xtf-x86-64-efi b/automation/scripts/include/xtf-x86-64-efi
> index 8340c745dbf4..15c6463dcdc5 100644
> --- a/automation/scripts/include/xtf-x86-64-efi
> +++ b/automation/scripts/include/xtf-x86-64-efi
> @@ -49,7 +49,8 @@ EOF
>          -nographic \
>          -monitor none \
>          -serial stdio \
> -        -m 512 \
> +        -m 2048 \
> +        -smp 2 \
>          -M q35,kernel-irqchip=split \
>          -drive if=pflash,format=raw,readonly=on,file=${FW_PREFIX}OVMF_CODE${suff}.fd \
>          -drive if=pflash,format=raw,file=${WORKDIR}/OVMF_VARS${suff}.fd \
> -- 
> 2.52.0
> 

