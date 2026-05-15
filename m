Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gP3vAAeSB2pU9AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 23:37:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA74C558368
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 23:37:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1310571.1581419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wO0DI-0008Rl-MP; Fri, 15 May 2026 21:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1310571.1581419; Fri, 15 May 2026 21:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wO0DI-0008Pw-Ip; Fri, 15 May 2026 21:36:56 +0000
Received: by outflank-mailman (input) for mailman id 1310571;
 Fri, 15 May 2026 21:36:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wO0DH-0008Po-3Q
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 21:36:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wO0DG-002BwX-CK
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 23:36:54 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a0791c8-5cb7-0a2a0a5109dd-0a2a4502deda-14
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 23:36:54 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a0791f5-af86-0a2a45020019-ac6904fea8a2-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 23:36:54 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C468C60154;
 Fri, 15 May 2026 21:36:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29F7FC2BCB0;
 Fri, 15 May 2026 21:36:52 +0000 (UTC)
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
	s=k20201202; t=1778881012;
	bh=0yI/Ou+ei5OsZY0tsbVqoyZGFwt4ifG4mR08ru/hFn0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CzxMEKWtmGG6Y9ylpTeXWvoaqzM+HYBRlzTXUSTVE0lg2W4iaSOo9ztc5iAiLspFA
	 t3pJULCWhyP0EQ4D7AHKoTwSNzzB0HvvQpfihpCMP1l2qDDSqTDDLiz0NGvJr5dfvv
	 WcwVVvVlmXFm+ElvXapwPwo89sXLQwfQnfQjQHx1CoXYZQ0+Ha0xg4gZZrukSVguVF
	 X9IUW6VQ1hTH7Qh9vBfCDNX0fmmiArYiqwFuA132TOkTqEXQegBTa+Vmvl5DbsCRfZ
	 ec890Pok/kPjdldxXv7MwRLNj5cEq8VFXpLBf6u2nqtmHaLAbFqy2idOdZA22fMEkc
	 mUQ94bVgHvjKw==
Date: Fri, 15 May 2026 14:36:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Mykola Kvach <xakep.amatop@gmail.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Mykola Kvach <mykola_kvach@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, oleksii.kurochko@gmail.com
Subject: Re: [PATCH] xen/arm: gic-v3: Wait for redistributor RWP using the
 right bit
In-Reply-To: <EDF5B3D9-F532-4D8E-B156-172649433AE9@arm.com>
Message-ID: <alpine.DEB.2.22.394.2605151436280.52999@ubuntu-linux-20-04-desktop>
References: <0fc5e4d297b8dde66ea36be3ebd60a68dea2562d.1778749474.git.mykola_kvach@epam.com> <EDF5B3D9-F532-4D8E-B156-172649433AE9@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-720697/1778881014-AA374161-F65D886F/0/0
X-purgate-type: clean
X-purgate-size: 1278
X-Rspamd-Queue-Id: AA74C558368
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:oleksii.kurochko@gmail.com,m:xakepamatop@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.xenproject.org,epam.com,kernel.org,xen.org,arm.com,amd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Oleksii, can we have a release ack for this fix?

On Fri, 15 May 2026, Luca Fancellu wrote:
> Hi Mykola,
> 
> > On 14 May 2026, at 10:08, Mykola Kvach <xakep.amatop@gmail.com> wrote:
> > 
> > From: Mykola Kvach <mykola_kvach@epam.com>
> > 
> > gicv3_do_wait_for_rwp() is used for both distributor and
> > redistributor writes. The CTLR register is at offset 0 for both,
> > but the RWP bit is not in the same position.
> > 
> > For GICD_CTLR, RWP is bit 31. For GICR_CTLR, bit 31 is UWP,
> > while RWP is bit 3. The redistributor wait path was therefore
> > polling UWP instead of RWP.
> > 
> > UWP covers upstream writes, including Generate SGI packets, and is
> > not a substitute for redistributor register write completion. The
> > existing redistributor callers need RWP semantics for redistributor
> > register writes such as GICR_ICENABLER0 and GICR_CTLR updates.
> > 
> > Add GICR_CTLR_RWP and pass the expected RWP bit to the shared
> > helper.
> > 
> > Fixes: bc183a0235e ("xen/arm: Add support for GIC v3")
> > Reported-by: Luca Fancellu <luca.fancellu@arm.com>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> 
> This looks ok to me
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> 
> Cheers,
> Luca
> 

