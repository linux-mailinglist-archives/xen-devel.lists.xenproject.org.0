Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB5C4E7B26
	for <lists+xen-devel@lfdr.de>; Sat, 26 Mar 2022 00:36:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294966.501933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXtTx-0005nk-DX; Fri, 25 Mar 2022 23:36:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294966.501933; Fri, 25 Mar 2022 23:36:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXtTx-0005lG-Ab; Fri, 25 Mar 2022 23:36:37 +0000
Received: by outflank-mailman (input) for mailman id 294966;
 Fri, 25 Mar 2022 22:59:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M4Ou=UE=nmedia.net=chris@srs-se1.protection.inumbo.net>)
 id 1nXsuO-0000vf-Ph
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 22:59:52 +0000
Received: from ref.nmedia.net (ref.nmedia.net [204.80.187.146])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45cd7eaa-ac8f-11ec-a405-831a346695d4;
 Fri, 25 Mar 2022 23:59:50 +0100 (CET)
Received: by ref.nmedia.net (Postfix, from userid 1000)
 id C85931E7486; Fri, 25 Mar 2022 15:42:36 -0700 (PDT)
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
X-Inumbo-ID: 45cd7eaa-ac8f-11ec-a405-831a346695d4
Date: Fri, 25 Mar 2022 15:42:36 -0700
From: Chris Cappuccio <chris@nmedia.net>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Roger Pau Monn? <roger.pau@citrix.com>,
	Marek Marczykowski-G?recki <marmarek@invisiblethingslab.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	OpenBSD technical mailing list <tech@openbsd.org>
Subject: Re: Security support status of xnf(4) and xbf(4)
Message-ID: <Yj5FXBj7qKIvs94O@ref.nmedia.net>
References: <Yj3qW/y20htoSvuK@itl-email>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yj3qW/y20htoSvuK@itl-email>

Demi Marie Obenour [demi@invisiblethingslab.com] wrote:
> Linux???s netfront and blkfront drivers recently had a security
> vulnerability (XSA-396) that allowed a malicious backend to potentially
> compromise them.  In follow-up audits, I found that OpenBSD???s xnf(4)
> currently trusts the backend domain.  I reported this privately to Theo
> de Raadt, who indicated that OpenBSD does not consider this to be a
> security concern.
> 

A malicious backend could completely compromise the virtual host in an
infinite number of ways. Perhaps a small patch to find incorrect values
would be of value, but even then, a patch would only be a very slight
improvment. If you patch the manual page, should OpenBSD start putting
notifications in all manual pages that a compromised virtual machine
backend may compromise the integrity of the virtual host?

Chris

