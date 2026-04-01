Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HxbNONXzWk5cAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 19:37:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE6137EB7D
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 19:37:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270772.1559312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7zUf-0001LT-Pt; Wed, 01 Apr 2026 17:36:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270772.1559312; Wed, 01 Apr 2026 17:36:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7zUf-0001KD-N7; Wed, 01 Apr 2026 17:36:41 +0000
Received: by outflank-mailman (input) for mailman id 1270772;
 Wed, 01 Apr 2026 17:36:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ariadne@ariadne.space>) id 1w7zUe-0001K7-DH
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 17:36:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7zUc-006Hxx-Sv
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 19:36:38 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ariadne@ariadne.space>)
 id 69cd5796-e002-0a2a0a5209dd-0a2a450ab196-30
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 19:36:38 +0200
Received: from [149.248.47.155] (helo=hermes.ariadne.space)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <ariadne@ariadne.space>)
 id 69cd57a5-ee98-0a2a450a0019-95f82f9ba3f8-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 19:36:38 +0200
Received: from helios (unknown [100.74.42.12])
 by hermes.ariadne.space (Postfix) with ESMTP id 7600E2685C9
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 17:36:31 +0000 (UTC)
Received: from [100.96.180.11] (unknown [172.19.0.1])
 by helios (Postfix) with ESMTPSA id 3A04B16000D134
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 17:36:31 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=dkim header.d=ariadne.space header.i="@ariadne.space" header.h="From:Subject:Date:Message-ID:To:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ariadne.space;
	s=dkim; t=1775064991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HFjfwUNpk83YJkSRCUxCCTTOgWj5hI8q0tnVjaEpeOY=;
	b=tGVwmg2nSmfkWisRDUFBFlOvX4EIIgCfl8FtVZeKgzoQYwR4XEzsOzSdGvBZ2t0U3D12iP
	n9H+mKH7m3loZ7IWUQ1TPMFUzYmmmO6Jo6OhvmwrBt6M0enpq2uDhmdnO3EGCC0F28hH9o
	QhPURW5W2dBDzCm+vRTWoZS128svGq8=
Message-ID: <528bb66e-3eb6-41c7-a33c-43811c8f1afc@ariadne.space>
Date: Wed, 1 Apr 2026 10:36:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] CI: use Alpine's network setup
To: xen-devel@lists.xenproject.org
References: <cover.ca38f9571ab23e254a985ecfd4715235675aa06e.1774999414.git-series.marmarek@invisiblethingslab.com>
 <2a02d9e9a4fc47674d771f22e65b202b3dbf6336.1774999414.git-series.marmarek@invisiblethingslab.com>
Content-Language: en-US
From: Ariadne Conill <ariadne@ariadne.space>
In-Reply-To: <2a02d9e9a4fc47674d771f22e65b202b3dbf6336.1774999414.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1775064998-BF1480B1-C2B180D2/0/0
X-purgate-type: clean
X-purgate-size: 1343
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[ariadne.space,none];
	R_DKIM_ALLOW(-0.20)[ariadne.space:s=dkim];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ariadne.space:+];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[ariadne@ariadne.space,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ariadne@ariadne.space,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3EE6137EB7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 3/31/26 16:24, Marek Marczykowski-Górecki wrote:
> This allows Alpine startup script to properly handle service
> dependencies - necessary for starting dropbear ssh server.
> For the latter, always take the IP address from DHCP, in addition to the
> test-local one.
>
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
>   automation/scripts/qubes-x86-64.sh | 20 +++++++++-----------
>   1 file changed, 9 insertions(+), 11 deletions(-)
>
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index 7a59fa5f1116..91c0d5bec829 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -214,25 +214,23 @@ cat "${dom0_rootfs_parts[@]}" > binaries/dom0-rootfs.cpio.gz
>   # test-local configuration
>   mkdir -p rootfs
>   cd rootfs
> -mkdir -p boot etc/local.d root
> +mkdir -p boot etc/local.d root etc/network
>   cp -a ../automation/scripts/run-tools-tests root/
>   
> +echo "
> +auto xenbr0
> +iface xenbr0 inet dhcp
> +    bridge-ports eth0
> +    bridge-stp 0
> +    up ip a a 192.168.0.1/24 dev \$IFACE

Why not "address 192.168.0.1/24" here?  The DHCP client will still get 
run.  You can verify with ifquery(8).

Ariadne


