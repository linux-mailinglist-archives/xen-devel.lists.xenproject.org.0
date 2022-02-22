Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C841A4C0038
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 18:35:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277126.473559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMZ3f-00063Z-02; Tue, 22 Feb 2022 17:34:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277126.473559; Tue, 22 Feb 2022 17:34:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMZ3e-00061k-TJ; Tue, 22 Feb 2022 17:34:38 +0000
Received: by outflank-mailman (input) for mailman id 277126;
 Tue, 22 Feb 2022 17:34:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6+Aw=TF=chiark.greenend.org.uk=ijackson@srs-se1.protection.inumbo.net>)
 id 1nMZ3d-00061e-7i
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 17:34:37 +0000
Received: from chiark.greenend.org.uk (v6.chiark.greenend.org.uk
 [2001:ba8:1e3::]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b26e0011-9405-11ec-8539-5f4723681683;
 Tue, 22 Feb 2022 18:34:35 +0100 (CET)
Received: by chiark.greenend.org.uk (Debian Exim 4.89 #1) with local
 (return-path ijackson@chiark.greenend.org.uk)
 id 1nMZ3Y-0004Zc-U7; Tue, 22 Feb 2022 17:34:32 +0000
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
X-Inumbo-ID: b26e0011-9405-11ec-8539-5f4723681683
From: Ian Jackson <ijackson@chiark.greenend.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <25109.7848.755943.430643@chiark.greenend.org.uk>
Date: Tue, 22 Feb 2022 17:34:32 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] coverity: disable flight from crontab
In-Reply-To: <20220221094800.54169-1-roger.pau@citrix.com>
References: <20220221094800.54169-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.4.1 (i586-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH] coverity: disable flight from crontab"):
> We are currently doing the Coverity Scans using a github workflow.

Acked-by: Ian Jackson <ijackson@chiark.greenend.org.uk>


-- 
Ian Jackson <ijackson@chiark.greenend.org.uk>   These opinions are my own.  

Pronouns: they/he.  If I emailed you from @fyvzl.net or @evade.org.uk,
that is a private address which bypasses my fierce spamfilter.

