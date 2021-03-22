Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FF1343DFD
	for <lists+xen-devel@lfdr.de>; Mon, 22 Mar 2021 11:34:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100121.190548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOHrk-0000Tn-I1; Mon, 22 Mar 2021 10:32:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100121.190548; Mon, 22 Mar 2021 10:32:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOHrk-0000TQ-Eg; Mon, 22 Mar 2021 10:32:56 +0000
Received: by outflank-mailman (input) for mailman id 100121;
 Mon, 22 Mar 2021 10:32:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOHrj-0000TL-K7
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 10:32:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOHrj-0001Ct-JF
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 10:32:55 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOHrj-0002ki-IL
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 10:32:55 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lOHrg-00083n-Ap; Mon, 22 Mar 2021 10:32:52 +0000
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
	bh=vtPSTz4CW1VPx+bNbF230raYrB2ZHcoGx51a9ARb9JQ=; b=1MAgjRrVn55TIBgUq26iYA/VfS
	4Bd8rKKfgqDECeiO8CX2e/EAocuk5b2gMkM9bhawCo6YxD1MQziAkvndsgOaIj8prabj7uoC8gHP6
	FwdgRV3NoZcgSk6EuvNoYu6nq+UVw36KID9lQfaoys3UyV5N/NueeGZYWczSww7plyu0=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24664.29268.129126.416099@mariner.uk.xensource.com>
Date: Mon, 22 Mar 2021 10:32:52 +0000
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
    Julien Grall <jgrall@amazon.com>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.15 v3] SUPPORT.MD: Mark LiveUpdate of C/OCaml
 XenStored daemon as Tech Preview
In-Reply-To: <abaa77f4-3375-44c3-bab4-4b286ca42d35@xen.org>
References: <20210317120854.19903-1-julien@xen.org>
	<abaa77f4-3375-44c3-bab4-4b286ca42d35@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("Re: [PATCH for-4.15 v3] SUPPORT.MD: Mark LiveUpdate of C/OCaml XenStored daemon as Tech Preview"):
> Sorry I forgot to CC you on the original Ian. Would it be possible to 
> give an R-A for the patch below?

Sure,

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

