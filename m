Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGhyLzze9Gn8FQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 01 May 2026 19:09:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B70BF4AE5AD
	for <lists+xen-devel@lfdr.de>; Fri, 01 May 2026 19:09:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1298812.1573846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIrM1-0006B7-OD; Fri, 01 May 2026 17:08:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1298812.1573846; Fri, 01 May 2026 17:08:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIrM1-00068T-Iv; Fri, 01 May 2026 17:08:41 +0000
Received: by outflank-mailman (input) for mailman id 1298812;
 Fri, 01 May 2026 17:08:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wIrLz-00065N-Ni
 for xen-devel@lists.xenproject.org; Fri, 01 May 2026 17:08:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wIrLx-009ywS-IG
 for xen-devel@lists.xenproject.org; Fri, 01 May 2026 19:08:39 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69f4ddd7-2eae-0a2a0a5409dd-0a2a450c8d3e-34
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2026 19:08:39 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69f4de16-62f1-0a2a450c0019-ac6904feb828-3
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2026 19:08:38 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 451E36011F;
 Fri,  1 May 2026 17:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA466C2BCB4;
 Fri,  1 May 2026 17:08:36 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777655317;
	bh=ZKvnwmGodYs6HnVjN+oPgadh7nyz/qEnXV9PluO6LT8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GgjuUTd8WAeB5/wQ/e4MQnFtEMFztzkxlg6PyS9qCh7wZXAB541Lo05jdMLhczG67
	 99Yp6I7awijWAdA5KD6XR/7ew6uBmMSHm1Q1SeDYGX5+10zrE2bG8o2e9Xschlk7jv
	 blVpN5KS4WG6CQTZGuVxXUfehnlEouvMzqryTl08Lfym8FrPodc7gJAR3zGnpDSj9L
	 Jb9cPatUY2YVfkhbL/xHNCjACXjjwLvGaFrDZsiPzNoHBUnRr0eBdzEfzJID8aSYA+
	 aOA3s8xhGFpd9LAcqN2n+Gc+k3GLH24laCntiGRM4sU0r7q5drO997qvmvaYTerI0c
	 7YB5YFkZyfyzA==
Date: Fri, 1 May 2026 10:08:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 2/2] xen/arm: skip holes in physical address space
 when setting up frametable
In-Reply-To: <42E57541-C0A9-4E19-A8F1-825E83A856DB@arm.com>
Message-ID: <alpine.DEB.2.22.394.2605011008180.512397@ubuntu-linux-20-04-desktop>
References: <20260430125103.401811-1-michal.orzel@amd.com> <20260430125103.401811-3-michal.orzel@amd.com> <42E57541-C0A9-4E19-A8F1-825E83A856DB@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1916185994-1777655317=:512397"
X-purgate-ID: tlsNG-d25034/1777655319-F7811CF5-F83D828C/0/0
X-purgate-type: clean
X-purgate-size: 985
X-Rspamd-Queue-Id: B70BF4AE5AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1916185994-1777655317=:512397
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 1 May 2026, Luca Fancellu wrote:
> This fixed 32Mb alignment feels a bit more than we need, If for example the
> chunk is less than 32Mb? If we had some variable alignment for chunks less
> than 32MB we would maybe help alloc_boot_pages job, in the end if the chunk
> is less than 32Mb it won’t get the contiguous bit anyway.
> 
> But I’m fine also if you leave it as it is.
> 
> With the above fixed:
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> Tested-by: Luca Fancellu <luca.fancellu@arm.com>
> 
> I’ve also tested on Arm64 MMU, Arm32 MMU, Arm64 MPU virtual platforms.

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-1916185994-1777655317=:512397--

