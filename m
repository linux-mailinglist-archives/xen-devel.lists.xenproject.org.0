Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7A27AAE53
	for <lists+xen-devel@lfdr.de>; Fri, 22 Sep 2023 11:38:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606805.944845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjcbX-0005WA-9c; Fri, 22 Sep 2023 09:37:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606805.944845; Fri, 22 Sep 2023 09:37:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjcbX-0005Tu-6s; Fri, 22 Sep 2023 09:37:43 +0000
Received: by outflank-mailman (input) for mailman id 606805;
 Fri, 22 Sep 2023 09:37:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xJX2=FG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qjcbW-0005To-Hd
 for xen-devel@lists.xenproject.org; Fri, 22 Sep 2023 09:37:42 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acd5af32-592b-11ee-878a-cb3800f73035;
 Fri, 22 Sep 2023 11:37:41 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id CEBD94EE0739;
 Fri, 22 Sep 2023 11:37:40 +0200 (CEST)
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
X-Inumbo-ID: acd5af32-592b-11ee-878a-cb3800f73035
MIME-Version: 1.0
Date: Fri, 22 Sep 2023 11:37:40 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
 <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 1/3] docs/misra: add documentation skeleton for MISRA
 C:2012 Dir 4.1
In-Reply-To: <alpine.DEB.2.22.394.2309071659440.6458@ubuntu-linux-20-04-desktop>
References: <cover.1693558913.git.nicola.vetrini@bugseng.com>
 <e74433904abe30e2e9e030f663a7a87813dabd24.1693558913.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2309071659440.6458@ubuntu-linux-20-04-desktop>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <c19018082eecd0bf1e8d7ef97be53edc@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit


>> +Documentation for MISRA C:2012 Dir 4.1: invariant violation
>> +___________________________________________________________
>> +
>> +To be written.
> 
> What's an invariant violation?
> 
> 

It's the violation of a project invariant (e.g., an assert or 
BUILD_BUG).
Something along the lines of this could fit in the documentation:
"The extensive checks in the code ensure that any violation of a
compile-time invariant will be detected in prior to release builds, and 
failure
of run-time invariant is also extensively tested."

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

