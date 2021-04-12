Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D26335C371
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 12:12:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.108893.207774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVtYT-0004Ip-TR; Mon, 12 Apr 2021 10:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 108893.207774; Mon, 12 Apr 2021 10:12:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVtYT-0004IQ-PK; Mon, 12 Apr 2021 10:12:29 +0000
Received: by outflank-mailman (input) for mailman id 108893;
 Mon, 12 Apr 2021 10:12:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lVtYS-0004IL-Nq
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 10:12:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lVtYS-0002Ru-Mx
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 10:12:28 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lVtYS-0001nn-LO
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 10:12:28 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lVtYN-0001p0-P4; Mon, 12 Apr 2021 11:12:23 +0100
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:CC:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=pAYIduxS3HtVbvf2kSC+TLaNmCWJAl5JKz6Z2jv7TUY=; b=V0I3+y7N5My2X0dsziwU1UV5Y0
	DjQfWASZZkWx8snU158/vwug/Dc7rm8IHd2R+jyLfBgguWnZ0v0gjawfSJqdaspsSH9dMCmmyOEZn
	UUsW/fXJNcaKWm+w2junS3GPW0ChUmDEgy4ShVn6CMxRadRo79h5CXHfLIn/qpY986FY=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24692.7431.556782.870034@mariner.uk.xensource.com>
Date: Mon, 12 Apr 2021 11:12:23 +0100
To: Jan Beulich <jbeulich@suse.com>
CC: committers@xenproject.org,
    xen-devel@lists.xenproject.org
Subject: Commit moratorium on staging-4.15 lifited
In-Reply-To: <24687.11032.872713.894725@mariner.uk.xensource.com>
References: <24684.14467.302145.214064@mariner.uk.xensource.com>
	<24687.11032.872713.894725@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Ian Jackson writes ("Re: Commit moratorium on staging-4.15"):
> Please hold off pushing to staging-4.15 until advised.  I need to
> do post-release updates do the version number and README and so on.  I
> plan to do that on Monday.

This is now done.  Backports may be pushed to staging-4.15 by the
stable tree maintainers, subject to the usual processes for stable
maintenance.

I noticed that 4.14 seems to be lacking the MAINTAINERS update so I
will do that now too.

Ian.

