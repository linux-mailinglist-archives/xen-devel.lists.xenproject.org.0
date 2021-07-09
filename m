Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8443C2775
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 18:22:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153801.284154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1tG5-0003aR-7r; Fri, 09 Jul 2021 16:21:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153801.284154; Fri, 09 Jul 2021 16:21:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1tG5-0003Y6-4s; Fri, 09 Jul 2021 16:21:45 +0000
Received: by outflank-mailman (input) for mailman id 153801;
 Fri, 09 Jul 2021 16:21:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m1tG3-0003Xz-NR
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 16:21:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m1tG3-0004ia-Lq
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 16:21:43 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m1tG3-00047j-Kt
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 16:21:43 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1m1tFy-0004qE-Qj; Fri, 09 Jul 2021 17:21:38 +0100
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
	bh=TMVVps2m/IFzp9vbKnm1JGXOUDWAYDSOnyIcy1LdA/8=; b=QeGNzcFVkuKFJhCS1szrZUrnL5
	FaAeKO7+ixhjHHfNqx1b/c89ctWWJJ5hJ+HlLbh5AHueSGAflIPO6BEB0gIXnK4HqjCAjYqIU1Zm9
	3QsIDhYjpY4zfBJrpr7hNz8IZsKAAogOE3YuSalLBnxqmjRCPP8QX2U/SxTVX27TYrno=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24808.30610.559142.775285@mariner.uk.xensource.com>
Date: Fri, 9 Jul 2021 17:21:38 +0100
To: Julien Grall <julien@xen.org>
Cc: committers@xenproject.org,
    xen-devel@lists.xenproject.org,
    Doug Goldstein <cardoe@cardoe.com>,
    Wei Liu <wl@xen.org>
Subject: Re: gitlab merge request -> list patchbomb workflows
In-Reply-To: <8a40ee32-4141-ddc4-4c19-582334f3b245@xen.org>
References: <24808.28606.387467.578829@mariner.uk.xensource.com>
	<8a40ee32-4141-ddc4-4c19-582334f3b245@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("Re: gitlab merge request -> list patchbomb workflows"):
> I have recently started to use b4 [1] to fetch patches and collect tags 
> from the mailing list. I am wondering if the tools could be extended to 
> also allow a quick look through of the review "state" of each patch?

Cool.  That's interesting.  I need to think about it some more, but I
think this is a possible alternative to using patchwork for the
analysis task.

Also, if a robot wanted to post a v2 it could use b4 to fold the acks
etc. into the repost, without the submitter having to add them to the
git branch.

Ian.

