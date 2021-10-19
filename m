Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A35BF43349D
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 13:24:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213036.371134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcnEE-0001If-VP; Tue, 19 Oct 2021 11:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213036.371134; Tue, 19 Oct 2021 11:24:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcnEE-0001G8-RR; Tue, 19 Oct 2021 11:24:22 +0000
Received: by outflank-mailman (input) for mailman id 213036;
 Tue, 19 Oct 2021 11:24:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mcnED-0001G0-DS
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 11:24:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mcnED-00004q-Cj
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 11:24:21 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mcnED-0006bI-Bd
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 11:24:21 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mcnE9-0000Jo-TR; Tue, 19 Oct 2021 12:24:17 +0100
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
	bh=uhclx5EtyiFhHum1k4PTCfxl6fWsmasFCb3BWZuVQwY=; b=suhjN5xBv/f6m39KebFXkoYaP6
	qog2jyAOusyr9wPZSdXf/0tNbOOn6i4HGTu7yl1MQFiR91QgqLyt2tkp4UpQPtlP4ctqfybCFit4/
	9n5E0J08v/EeLgCgI7MiqBJWv4AZvp6Ud7Z6s+sjKvAIJBfXmRW9C8BaCt+y9xmq+0Bg=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24942.43745.600566.92584@mariner.uk.xensource.com>
Date: Tue, 19 Oct 2021 12:24:17 +0100
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] tools: fix oom setting of xenstored
In-Reply-To: <20211019112140.26988-1-jgross@suse.com>
References: <20211019112140.26988-1-jgross@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("[PATCH v2] tools: fix oom setting of xenstored"):
> Commit f282182af32939 ("tools/xenstore: set oom score for xenstore
> daemon on Linux") introduced a regression when not setting the oom
> value in the xencommons file. Fix that.
> 
> Fixes: f282182af32939 ("tools/xenstore: set oom score for xenstore daemon on Linux")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Ian Jackson <iwj@xenproject.org>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>

and pushed, thanks.

Ian.

