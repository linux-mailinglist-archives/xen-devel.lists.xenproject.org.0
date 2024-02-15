Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A35856764
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 16:23:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681857.1060831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rada4-0002ZX-7u; Thu, 15 Feb 2024 15:23:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681857.1060831; Thu, 15 Feb 2024 15:23:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rada4-0002WL-4r; Thu, 15 Feb 2024 15:23:20 +0000
Received: by outflank-mailman (input) for mailman id 681857;
 Thu, 15 Feb 2024 15:23:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YE+Y=JY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rada2-0002WF-PB
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 15:23:18 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23cc432a-cc16-11ee-98f5-efadbce2ee36;
 Thu, 15 Feb 2024 16:23:15 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 153034EE0737;
 Thu, 15 Feb 2024 16:23:16 +0100 (CET)
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
X-Inumbo-ID: 23cc432a-cc16-11ee-98f5-efadbce2ee36
MIME-Version: 1.0
Date: Thu, 15 Feb 2024 16:23:16 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Xen Devel <xen-devel@lists.xenproject.org>,
 Consulting <consulting@bugseng.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Andrew
 Cooper3 <andrew.cooper3@citrix.com>, Roger Pau <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: Return type of clean_and_invalidate_dcache_va_range
In-Reply-To: <2171bcc9eeea6613409e3ee1e9eedbc3@bugseng.com>
References: <e050b096ff39aa857f9c267a8dbb4ef6@bugseng.com>
 <alpine.DEB.2.22.394.2402091402080.1925432@ubuntu-linux-20-04-desktop>
 <f86baad0-f113-4156-9c10-6910e8c63492@xen.org>
 <02446758-a5a9-4a8a-8ce6-15abdc9ede65@suse.com>
 <99faac70440a68824a17fcaaea55ef48@bugseng.com>
 <09589e8f-77b6-47f7-b5bd-cf485e4b60f1@xen.org>
 <c0b8f2ec-a3bb-45a6-b748-052d55a6fd5c@suse.com>
 <9eb25d90-9f10-44e5-b9aa-32e3f898389a@xen.org>
 <2171bcc9eeea6613409e3ee1e9eedbc3@bugseng.com>
Message-ID: <1bb3e139fbc3d8e22f84b9ad22363d1b@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit


> 
> I do like the idea. I applied some of the suggestions to this proof of 
> concept patch (attached). Still not compile-tested, since the CI seems 
> a bit slow today.

arch_grant_cache_flush is missing the return type on x86, sorry.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

