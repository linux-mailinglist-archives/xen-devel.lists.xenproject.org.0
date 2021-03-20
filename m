Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 654F7342D32
	for <lists+xen-devel@lfdr.de>; Sat, 20 Mar 2021 14:59:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99518.189323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNc7t-0001kT-I5; Sat, 20 Mar 2021 13:58:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99518.189323; Sat, 20 Mar 2021 13:58:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNc7t-0001k4-Ee; Sat, 20 Mar 2021 13:58:49 +0000
Received: by outflank-mailman (input) for mailman id 99518;
 Sat, 20 Mar 2021 13:58:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lNc7r-0001jz-Kc
 for xen-devel@lists.xenproject.org; Sat, 20 Mar 2021 13:58:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lNc7r-0007SC-Gy
 for xen-devel@lists.xenproject.org; Sat, 20 Mar 2021 13:58:47 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lNc7r-000491-Fz
 for xen-devel@lists.xenproject.org; Sat, 20 Mar 2021 13:58:47 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lNc7n-0002xv-VQ; Sat, 20 Mar 2021 13:58:44 +0000
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
	bh=CeFCcc52cHmx3OyDtw56cS5LkV3mqaeE0Yfy/9Jkk5M=; b=GgyDBR9nW/fAyp59oiCPRztA6Y
	Aqk8aM94M5TCPzp1JujfzHAj1m0w8GKAy98LBG16+gZjXultLY6ixmz+Kr2t8Urk9CjHM6HFmyy8z
	u8znGPlYz9O8Ccem2w22gVeghEkJpBd6bdw06hAhI9ad384hUBPL+fBxbL9u1sEP2Qjg=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24661.65427.691862.12219@mariner.uk.xensource.com>
Date: Sat, 20 Mar 2021 13:58:43 +0000
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
    Julien Grall <jgrall@amazon.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.15 v2] SUPPORT.MD: Mark LiveUpdate of C XenStored daemon as Tech Preview
In-Reply-To: <20210317112745.15207-1-julien@xen.org>
References: <20210317112745.15207-1-julien@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("[PATCH for-4.15 v2] SUPPORT.MD: Mark LiveUpdate of C XenStored daemon as Tech Preview"):
> From: Julien Grall <jgrall@amazon.com>
> 
> Support to liveupdate C XenStored daemon was added during the 4.15
> development cycle. Add a section in SUPPORT.MD to explain what is the
> support state.
> 
> For now, it is a tech preview.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

