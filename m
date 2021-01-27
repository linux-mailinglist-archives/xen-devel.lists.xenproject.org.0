Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60016306057
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 16:57:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76217.137438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4nCU-0004yn-NW; Wed, 27 Jan 2021 15:57:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76217.137438; Wed, 27 Jan 2021 15:57:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4nCU-0004yO-KY; Wed, 27 Jan 2021 15:57:46 +0000
Received: by outflank-mailman (input) for mailman id 76217;
 Wed, 27 Jan 2021 15:57:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4nCT-0004yC-Bn
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 15:57:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4nCT-0000up-Ax
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 15:57:45 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4nCT-0002ml-A7
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 15:57:45 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l4nCO-0001fk-R6; Wed, 27 Jan 2021 15:57:40 +0000
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
	bh=7Rv6QuZZUijellN/KGVcOODdtODCFq3AOWLbEUSPZjw=; b=Ye8Kdw5jlyNqwKqv3IJh3ochXf
	4FPozYbMRyr4oivJMHuFIn+JJAR8H4NrFMxwL3RcXn5hoqlSvlLMdwIaV7A0Y1LpTT8xFgtqlklEO
	yeIRxJfv99Zhfg+E6kfTfP4QkUa1Q8K+Rg0IeLM0UZzlR+Ng8tS5ne3rWlCESJ4285NA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24593.36212.617275.862147@mariner.uk.xensource.com>
Date: Wed, 27 Jan 2021 15:57:40 +0000
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: xen-devel@lists.xenproject.org,
    Manuel Bouyer <bouyer@netbsd.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xenpmd.c: use dynamic allocation
In-Reply-To: <20210112181242.1570-21-bouyer@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
	<20210112181242.1570-21-bouyer@antioche.eu.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Manuel Bouyer writes ("[PATCH] xenpmd.c: use dynamic allocation"):
> From: Manuel Bouyer <bouyer@netbsd.org>
> 
> On NetBSD, d_name is larger than 256, so file_name[284] may not be large
> enough (and gcc emits a format-truncation error).
> Use asprintf() instead of snprintf() on a static on-stack buffer.

Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

