Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDA64374B1
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 11:25:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214889.373719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdqo6-0003mz-GQ; Fri, 22 Oct 2021 09:25:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214889.373719; Fri, 22 Oct 2021 09:25:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdqo6-0003lC-DJ; Fri, 22 Oct 2021 09:25:46 +0000
Received: by outflank-mailman (input) for mailman id 214889;
 Fri, 22 Oct 2021 09:25:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mdqo5-0003l6-7n
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 09:25:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mdqo5-0000UL-73
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 09:25:45 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mdqo5-0001nH-6C
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 09:25:45 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mdqo2-00014n-0I; Fri, 22 Oct 2021 10:25:42 +0100
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
	bh=OzuthWXcpN0W96nr8nZ8VYNsR/P1pWvja/TTDSwOMnc=; b=ILxPezU6QMGIhbY6JZHGL/qj6d
	K3Mt9s8j7nvZhCnOk0TTEFtFcdnT+SubVgy9qefU01fQkPpawJ5G7XXTK2vZQbCuzfuWD+cu0pOCo
	j6q6nQFWV3CT/98Ox5cvWXjeksSikLst/9cwq8SRgSAgae0OOQEXlpzbVfpDf3Fq7I/0=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24946.33685.695365.801118@mariner.uk.xensource.com>
Date: Fri, 22 Oct 2021 10:25:41 +0100
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
    cardoe@cardoe.com,
    wl@xen.org,
    andrew.cooper3@citrix.com,
    anthony.perard@citrix.com
Subject: Re: [PATCH 0/3] automation: introduce an x86_64 Dom0/DomU test
In-Reply-To: <alpine.DEB.2.21.2110210831470.2311@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2110210831470.2311@sstabellini-ThinkPad-T480s>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Stefano Stabellini writes ("[PATCH 0/3] automation: introduce an x86_64 Dom0/DomU test"):
> The last patch is the one introducing a new test. This one can fail.
> However, it is a new test at the end of the pipeline: it doesn't impact
> the existing tests. In the worst case, the test will fail and the whole
> pipeline will be marked as "failed" but looking at the jobs all the
> other will continue to be marked as successful. In short, if it fails,
> we can simply ignore it. Also, at the moment it is actually succeeding.

Thanks.  For 4.16:

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

