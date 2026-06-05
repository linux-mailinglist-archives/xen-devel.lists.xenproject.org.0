Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SPEKJMsfImoFSwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 03:00:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E137644349
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 03:00:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=FV7UuTIA;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from list by lists.xenproject.org with outflank-mailman.1328827.1593121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVIun-0001DV-JC; Fri, 05 Jun 2026 01:00:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328827.1593121; Fri, 05 Jun 2026 01:00:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVIun-0001A6-Fo; Fri, 05 Jun 2026 01:00:01 +0000
Received: by outflank-mailman (input) for mailman id 1328827;
 Fri, 05 Jun 2026 01:00:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kuba@kernel.org>) id 1wVIum-00013g-Pf
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 01:00:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVIul-0091UY-W9
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 03:00:00 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kuba@kernel.org>)
 id 6a221f5b-2eae-0a2a0a5409dd-0a2a450aa222-44
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 02:59:59 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <kuba@kernel.org>)
 id 6a221f8e-56b3-0a2a450a0019-ac6904feae1e-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 02:59:59 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 158FB6001A;
 Fri,  5 Jun 2026 00:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EEDF1F00893;
 Fri,  5 Jun 2026 00:59:56 +0000 (UTC)
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
	s=k20260515; t=1780621197;
	bh=uvxQ8m/0FnjSq2hX2DJ7JY5O6ptuAhKyFcmM0+SqdDI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=FV7UuTIA9nXYCTQdrZZfkYLPla7MfXoMk9JBQGXD8E6O3JeVZ8noXFwAiRTcGSkiG
	 W1E6UfVYL1zDmwogaVZj3DwZpjueen+dGCzKQo0ke5ZCdkt5y4s6jQvB3vcBr0q2k/
	 5zMUf1gXU4yYCb9VaqZ1FpKBYaxlJRzL8seAwf8I1EV3xbsR5RzcirVhuu+7mcYerp
	 2iHf8scUUAf0UGYnrFlhzWpP25WM1cMsSOLI91OeLkt8yMjFwVNEf8x7lNB0JkDCVX
	 FA7XptQIIQkiVR9RNrq6zyb+w3n9rtX2CXGMXtneI5zgxSgBjxNGwz6mh+H34odnWw
	 kP5OoFOiPLZYg==
Date: Thu, 4 Jun 2026 17:59:55 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-pci@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>, Mahesh J Salgaonkar
 <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>, Niklas
 Schnelle <schnelle@linux.ibm.com>, Gerald Schaefer
 <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, Alex Williamson <alex@shazbot.org>, Kevin Tian
 <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>, Leon Romanovsky
 <leon@kernel.org>, Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Keith Busch <kbusch@kernel.org>, Alexander
 Duyck <alexanderduyck@fb.com>, Dimitri Daskalakis <daskald@meta.com>,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [RFC 00/12] PCI: Add support for Scalable I/O Virtualization
Message-ID: <20260604175955.56ca1406@kernel.org>
In-Reply-To: <a07763e2-aff3-4468-83c2-d50a9e1605c8@gmail.com>
References: <20260604150153.3619662-1-dimitri.daskalakis1@gmail.com>
	<20260604182031.GB2487554@ziepe.ca>
	<a07763e2-aff3-4468-83c2-d50a9e1605c8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1780621199-7CA798B7-0C95DE28/0/0
X-purgate-type: clean
X-purgate-size: 441
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:dimitri.daskalakis1@gmail.com,m:jgg@ziepe.ca,m:bhelgaas@google.com,m:linux-pci@vger.kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:schnelle@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:alex@shazbot.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:leon@kernel.org,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:kbusch@kernel.org,m:alexanderduyck@fb.com,m:daskald@meta.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-s390@vger.kernel.org,m:kvm@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:dimitridaskalakis1@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kuba@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[ziepe.ca,google.com,vger.kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,shazbot.org,intel.com,nvidia.com,suse.com,epam.com,fb.com,meta.com,lists.ozlabs.org,lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E137644349

On Thu, 4 Jun 2026 16:49:05 -0700 Dimitri Daskalakis wrote:
> Hey Jason, thanks for the feedback. We (at Meta) are definitely
> interested in SIOV-like capabilities for device passthrough to containers.

I think "definitely interested" is quite an exaggeration.
More importantly, which big company is interested in what
tech should be irrelevant upstream. Please don't make these
sort of arguments. The code has to stand on its own.

