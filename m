Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0313345466C
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 13:30:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226842.392152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnK5M-0002Yw-FG; Wed, 17 Nov 2021 12:30:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226842.392152; Wed, 17 Nov 2021 12:30:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnK5M-0002Vc-Ay; Wed, 17 Nov 2021 12:30:44 +0000
Received: by outflank-mailman (input) for mailman id 226842;
 Wed, 17 Nov 2021 12:30:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mnK5L-0002VW-I8
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 12:30:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mnK5L-0008Gr-HL
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 12:30:43 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mnK5L-0005yI-GH
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 12:30:43 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mnK5H-0005Ss-3j; Wed, 17 Nov 2021 12:30:39 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=eMpLQOCrMuv81uO3DLJrULXUZspxIUHGZLl50yxIF00=; b=l8JhZ4ylx+W4oItODDvruOG5nD
	5X8Dc5JRa+3k16uJRixwAdiSHIGMVqO7pEp/558nCVPDSbp2XjxBryx4NjUOqntAL8JhFWBoW5C2e
	+jSDQAYZMdG8w9VssKOcIK0TblB7LRIukrVb9jT5HR98gJGEua9XtZDxZEu1TmZkmmnY=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24980.62958.680856.115625@mariner.uk.xensource.com>
Date: Wed, 17 Nov 2021 12:30:38 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.16] MAINTAINERS: declare REMUS support orphaned
In-Reply-To: <20211117122647.17872-1-roger.pau@citrix.com>
References: <20211117122647.17872-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH for-4.16] MAINTAINERS: declare REMUS support orphaned"):
> The designated maintainer email address for the remus entry is
> bouncing, so remove it and declare the entry as orphaned as there's no
> other maintainer.

Hrm, :-(.

Acked-by: Ian Jackson <iwj@xenproject.org>

