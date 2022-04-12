Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4594FE39B
	for <lists+xen-devel@lfdr.de>; Tue, 12 Apr 2022 16:21:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303673.518111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neHNF-0000Mw-RP; Tue, 12 Apr 2022 14:20:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303673.518111; Tue, 12 Apr 2022 14:20:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neHNF-0000KH-O2; Tue, 12 Apr 2022 14:20:05 +0000
Received: by outflank-mailman (input) for mailman id 303673;
 Tue, 12 Apr 2022 14:20:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P3wJ=UW=chiark.greenend.org.uk=ijackson@srs-se1.protection.inumbo.net>)
 id 1neHNE-0008Pe-8a
 for xen-devel@lists.xenproject.org; Tue, 12 Apr 2022 14:20:04 +0000
Received: from chiark.greenend.org.uk (v6.chiark.greenend.org.uk
 [2001:ba8:1e3::]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2b4aee8-ba6b-11ec-8fbc-03012f2f19d4;
 Tue, 12 Apr 2022 16:20:02 +0200 (CEST)
Received: by chiark.greenend.org.uk (Debian Exim 4.89 #1) with local
 (return-path ijackson@chiark.greenend.org.uk)
 id 1neHN9-00049g-9B; Tue, 12 Apr 2022 15:19:59 +0100
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
X-Inumbo-ID: a2b4aee8-ba6b-11ec-8fbc-03012f2f19d4
From: Ian Jackson <ijackson@chiark.greenend.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <25173.35471.207443.559232@chiark.greenend.org.uk>
Date: Tue, 12 Apr 2022 15:19:59 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] osstest: install irqbalance
In-Reply-To: <20220412112859.73330-1-roger.pau@citrix.com>
References: <20220412112859.73330-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.4.1 (i586-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH] osstest: install irqbalance"):
> Or else all interrupts will get bound to (v)CPU 0.
> 
> This doesn't cause issues on small boxes, but boxes with a non-trivial
> amount of CPUs can struggle without interrupts being balanced across
> available vCPUs, as the number of vCPUs offered to dom0 matches the
> number of physical CPUs.

Wow.  This was missing all this time!  I wonder if it was in the
default install in some previous Debian release...

Acked-by: Ian Jackson <ijackson@chiark.greenend.org.uk>


-- 
Ian Jackson <ijackson@chiark.greenend.org.uk>   These opinions are my own.  

Pronouns: they/he.  If I emailed you from @fyvzl.net or @evade.org.uk,
that is a private address which bypasses my fierce spamfilter.

