Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E58B7F7025
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 10:40:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640317.998315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Sg2-0006Rc-MO; Fri, 24 Nov 2023 09:40:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640317.998315; Fri, 24 Nov 2023 09:40:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Sg2-0006Pw-Iy; Fri, 24 Nov 2023 09:40:46 +0000
Received: by outflank-mailman (input) for mailman id 640317;
 Fri, 24 Nov 2023 09:40:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5NGl=HF=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r6Sg1-0006Pq-PH
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 09:40:45 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89f7dc89-8aad-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 10:40:44 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 3493F4EE073C;
 Fri, 24 Nov 2023 10:40:44 +0100 (CET)
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
X-Inumbo-ID: 89f7dc89-8aad-11ee-98e2-6d05b1d4d9a1
MIME-Version: 1.0
Date: Fri, 24 Nov 2023 10:40:44 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Xen Devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Jbeulich
 <jbeulich@suse.com>, Andrew Cooper3 <andrew.cooper3@citrix.com>, Julien
 Grall <julien@xen.org>, George Dunlap <george.dunlap@citrix.com>, Wei Liu
 <wl@xen.org>
Subject: MISRA: Compatible declarations for sort and bsearch
Message-ID: <f60a702c838c3274cf9e1193964222f4@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

in xen/lib.h and xen/sort.h there are definitions of the functions 
bsearch and sort that have no prior declarations, and therefore are 
subject to a violation of MISRA C Rule 8.4.

I'm wondering whether it would be preferred

1. to put a declaration just before the definition, in lib.h and sort.h
2. deviate these functions, as their signatures are well-known and 
somewhat standardized

other resolution strategies are possible, but I think these are the main 
ones.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

