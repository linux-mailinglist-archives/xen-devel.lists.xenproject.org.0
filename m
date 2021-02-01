Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C403E30AA81
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 16:09:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79953.145872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6apQ-0003yf-Fg; Mon, 01 Feb 2021 15:09:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79953.145872; Mon, 01 Feb 2021 15:09:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6apQ-0003y1-By; Mon, 01 Feb 2021 15:09:24 +0000
Received: by outflank-mailman (input) for mailman id 79953;
 Mon, 01 Feb 2021 15:09:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6apO-0003xb-TO
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 15:09:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6apO-0004Jf-P5
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 15:09:22 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6apO-0004R7-NQ
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 15:09:22 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l6apL-0007k9-FO; Mon, 01 Feb 2021 15:09:19 +0000
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
	bh=dGGSACJOMJZtTzt+/JjXmWZTZXWco5h2qLf96Gs5OkY=; b=HWZ/xrFjDH8npH1gyCWisY86Y3
	F0dcTUH30s9hexmtIiD1WUaORoEfMqL/Hc2LKM9kkIPG1lifYNplZ1hTGvx80KMqqWow3FOmxtanl
	3NoxukuIBZYdGUTDW6cGTvI0YNlnazgkQmr+uOYrnPjXgKafmzzAQ+OGsyPGT6g9HjHA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24600.6559.225650.207177@mariner.uk.xensource.com>
Date: Mon, 1 Feb 2021 15:09:19 +0000
To: Manuel Bouyer <bouyer@netbsd.org>
Cc: <xen-devel@lists.xenproject.org>,
    Wei  Liu <wl@xen.org>,
    Ian Jackson <ian.jackson@eu.citrix.com>
Subject: Re: [PATCH v3 1/2] xenpmd.c: use dynamic allocation
In-Reply-To: <20210130182711.2473-1-bouyer@netbsd.org>
References: <20210130182711.2473-1-bouyer@netbsd.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Manuel Bouyer writes ("[PATCH v3 1/2] xenpmd.c: use dynamic allocation"):
> On NetBSD, d_name is larger than 256, so file_name[284] may not be large
> enough (and gcc emits a format-truncation error).
> Use asprintf() instead of snprintf() on a static on-stack buffer.
> 
> Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
> Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

I consider this a bugfix, so

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

I think Roger's ack got dropped, so I have added it back.#

Ian.

