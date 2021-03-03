Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE1132B91F
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 17:14:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92912.175228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHU8Q-0008Ij-1W; Wed, 03 Mar 2021 16:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92912.175228; Wed, 03 Mar 2021 16:14:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHU8P-0008IK-U9; Wed, 03 Mar 2021 16:14:01 +0000
Received: by outflank-mailman (input) for mailman id 92912;
 Wed, 03 Mar 2021 16:14:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHU8O-0008IC-Ev
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 16:14:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHU8O-00047r-E9
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 16:14:00 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHU8O-00069t-DN
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 16:14:00 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lHU8L-0002Xc-2d; Wed, 03 Mar 2021 16:13:57 +0000
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
	bh=p4sREm35iyBY7TBcQKfjhYDaCyL95jjsV8ZAUaDmBhg=; b=IaTZrVBmSvi7XsK8IaMwg4rDNu
	mhW2yw3ErixvnhpQa5cG6Zq3gzcaP9TaPFHfkLUzAWjm8YAqWfrxx5Kg1ntc1+jZ6qVHEZAtuBDS9
	SffRCQ3UBy/ioCTxnWtsdqeRn50oy+L6CoSNFj6hK/9zMGR/lShmTJNr8pLi8ZOxQxcM=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24639.46532.800022.313673@mariner.uk.xensource.com>
Date: Wed, 3 Mar 2021 16:13:56 +0000
To: Norbert Manthey <nmanthey@amazon.de>
Cc: <xen-devel@lists.xenproject.org>,
    Juergen Gross <jgross@suse.com>,
    Wei Liu <wl@xen.org>,
    Julien Grall <jgrall@amazon.co.uk>,
    Michael Kurth <mku@amazon.de>
Subject: Re: [PATCH XENSTORE v1 10/10] xs: add error handling
In-Reply-To: <20210226144144.9252-11-nmanthey@amazon.de>
References: <20210226144144.9252-1-nmanthey@amazon.de>
	<20210226144144.9252-11-nmanthey@amazon.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Norbert Manthey writes ("[PATCH XENSTORE v1 10/10] xs: add error handling"):
> In case of a failure deep in the call tree, we might return NULL as the
> value of the domain. In that case, error out instead of dereferencing
> the NULL pointer.
> 
> This bug was discovered and resolved using Coverity Static Analysis
> Security Testing (SAST) by Synopsys, Inc.
> 
> Signed-off-by: Norbert Manthey <nmanthey@amazon.de>
> Reviewed-by: Julien Grall <jgrall@amazon.co.uk>
> Reviewed-by: Raphael Ning <raphning@amazon.co.uk>

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

