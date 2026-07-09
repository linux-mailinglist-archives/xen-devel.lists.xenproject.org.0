Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IIlfEy7vT2qTqgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 20:57:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F39734A3E
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 20:57:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=flVtDyBt;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1358504.1612592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whtw9-0008CG-AM; Thu, 09 Jul 2026 18:57:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358504.1612592; Thu, 09 Jul 2026 18:57:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whtw9-00089Y-7Y; Thu, 09 Jul 2026 18:57:29 +0000
Received: by outflank-mailman (input) for mailman id 1358504;
 Thu, 09 Jul 2026 18:57:27 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1whtw7-00089S-Oh
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 18:57:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whtw6-0047LG-KH
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 20:57:26 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a4fef09-5cb7-0a2a0a5109dd-0a2a4509ea7c-12
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 20:57:26 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <sstabellini@kernel.org>)
 id 6a4fef15-b440-0a2a45090019-ac6904fee87a-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 20:57:26 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C7E1F6137D;
 Thu,  9 Jul 2026 18:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EADEB1F000E9;
 Thu,  9 Jul 2026 18:57:23 +0000 (UTC)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783623444;
	bh=8Qwe9Eb1EWMzqFxlc434ecVMDaK8l7iRxYDzMndfC5E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=flVtDyBtbhd5T6+87FCiik0HiOoDbs1JfbuB+NANhQ2vTEeesN4upqVDIOpWiOMVH
	 T4obYiKUosRb9bml5sFMsRmVKi+qFCInAUD8OHhLkvNgDZZMbGmYnHAJfZ30P8Kn/0
	 PFMIaZJdL1Bmhwm7rRGoFZo01X1+1lyNZ9/1ujByiXZrCPlx3ZmoBQ+FEKI8HTtLYS
	 WUuLNCL+djM9kz3/yMD0FKL1/3md/pRu/1wrBPlNA5ego75WppSBD9M3zg1Nrcqs5B
	 GPdgYh12syFRidEApoOgiiFX+v9oTEY2AKv+op01jAwn+XB1xQkFea3JFtV/59FOmB
	 GMSoi+1uTVmdw==
Date: Thu, 9 Jul 2026 11:57:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Halder, Ayan Kumar" <ayankuma@amd.com>
cc: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, ayan.kumar.halder@amd.com, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [for-4.22][PATCH v2] xen/arm: Fail domain construction if a
 secondary vCPU cannot be created
In-Reply-To: <aab9fd35-6230-474c-8848-480c8cccc43c@amd.com>
Message-ID: <alpine.DEB.2.22.394.2607091157100.565858@ubuntu-linux-20-04-desktop>
References: <20260709063643.11800-1-michal.orzel@amd.com> <aab9fd35-6230-474c-8848-480c8cccc43c@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-bad1c0/1783623446-64369A0B-CF7C005C/0/0
X-purgate-type: clean
X-purgate-size: 2098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[amd.com,lists.xenproject.org,kernel.org,xen.org,arm.com,epam.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ayankuma@amd.com,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:ayan.kumar.halder@amd.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D5F39734A3E

On Thu, 9 Jul 2026, Halder, Ayan Kumar wrote:
> On 09/07/2026 07:36, Michal Orzel wrote:
> > construct_domain() creates the secondary vCPUs in a loop, but on a
> > vcpu_create() failure it only prints a message and breaks out of the
> > loop returning success. As a result the domain can be partially
> > constructed with fewer vCPUs than d->max_vcpus. This causes two contract
> > violations:
> >   - Xen-Guest: domain's FDT is generated before vCPU creation - Xen exposes
> >     incorrect information (e.g. two vCPUs listed in a device tree while only
> >     one is actually created),
> >   - User-Xen: unlike x86, on Arm port we try to bail out as soon as
> >     possible on unsatisfied user requests (e.g. user requested two vCPUs
> >     for a domain but it was created with only one).
> 
> Unrelated, but just to add my 2 cents wearing a safety hat.
> 
> The user-xen contract comes from a system integrator. Xen should try to follow
> the contract and if not panic or bail out.
> 
> The Xen-guest contract can be used to enforce the rule that guest should read
> the contract before doing any safety critical task.
> 
> The most important thing is anything errors that are internal to Xen, should
> be propagated to the external world (either as panic or return an error to the
> guest or abort the guest). If there is a degradation is functionality (eg Xen
> creating a guest with lesser number of vCPUS that what the system integrator
> provided), then this is safety issue unless we put an assumption on guest to
> read its device tree and know the final configuration (which may not be always
> ok).
> 
> > 
> > Return an error instead of breaking out of the loop. Both callers
> > (construct_domU() and construct_hwdom()) already propagate a negative
> > return value and fail domain construction.
> > 
> > Fixes: 6b0e8e43348a ("xen/arm: allocate secondaries dom0 vcpus")
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

