Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCEF32B913
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 17:08:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92894.175143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHU3D-0006dY-U8; Wed, 03 Mar 2021 16:08:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92894.175143; Wed, 03 Mar 2021 16:08:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHU3D-0006dE-QR; Wed, 03 Mar 2021 16:08:39 +0000
Received: by outflank-mailman (input) for mailman id 92894;
 Wed, 03 Mar 2021 16:08:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHU3B-0006d7-M9
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 16:08:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHU3B-0003zS-LJ
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 16:08:37 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHU3B-0005Wp-KG
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 16:08:37 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lHU38-0002Un-9E; Wed, 03 Mar 2021 16:08:34 +0000
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
	bh=b6Y2ILNtXyy6F4Wi0+hE/oc2Zw9GEarWcGvHfh8GfmY=; b=UUHX7PbBDJdLbU0Ns++HWVFhIY
	d9cSSXniDRdC5BCs3q6BQbJBzxrGWLUdihH6RyykJfKJdk0Bm5IuZzvL0Xa83gSKXleq1URFk6B/R
	K1Jd+H467t2AahkmuPRZdYfBUiwpVbpCBvefRwtLOiImggz8q/7kJF3m9R/75qAalRHU=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24639.46209.972182.673496@mariner.uk.xensource.com>
Date: Wed, 3 Mar 2021 16:08:33 +0000
To: Norbert Manthey <nmanthey@amazon.de>
Cc: <xen-devel@lists.xenproject.org>,
    Juergen Gross <jgross@suse.com>,
    Wei Liu <wl@xen.org>,
    Julien Grall <jgrall@amazon.co.uk>,
    Michael Kurth <mku@amazon.de>
Subject: [PATCH XENSTORE v1 02/10] xenstore: fix print format string
In-Reply-To: <20210226144144.9252-3-nmanthey@amazon.de>
References: <20210226144144.9252-1-nmanthey@amazon.de>
	<20210226144144.9252-3-nmanthey@amazon.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Norbert Manthey writes ("[PATCH XENSTORE v1 02/10] xenstore: fix print format string"):
> Use the correct format specifier for unsigned values. Additionally, a
> cast was dropped, as the format specifier did not require it anymore.
> 
> This was reported by analysis with cppcheck.
> 
> Signed-off-by: Norbert Manthey <nmanthey@amazon.de>
> Reviewed-by: Thomas Friebel <friebelt@amazon.de>
> Reviewed-by: Julien Grall <jgrall@amazon.co.uk>

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

