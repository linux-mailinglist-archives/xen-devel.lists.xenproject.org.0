Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAE42F4BE2
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 14:02:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66480.118085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzfmG-0008L4-0p; Wed, 13 Jan 2021 13:01:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66480.118085; Wed, 13 Jan 2021 13:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzfmF-0008Kf-TS; Wed, 13 Jan 2021 13:01:31 +0000
Received: by outflank-mailman (input) for mailman id 66480;
 Wed, 13 Jan 2021 13:01:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kzfmE-0008KZ-Jv
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 13:01:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kzfmE-0004Ar-Fz
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 13:01:30 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kzfmE-0003hj-EH
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 13:01:30 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1kzfmA-00016S-Tx; Wed, 13 Jan 2021 13:01:26 +0000
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
	bh=RLAaFFz16DdmEVDRjOatBrQPJeZzEzcw+5CDygyZh6w=; b=xcgHkb2cwlYraLFR8CetE+z7Yc
	/Iunwek5HK38FMMsFCzd4DONiQH0ycmLXBARVjm3emIg93DlPYKKEsthH3/bynfkybYJXwLCtYIKM
	zysDUzqfQFZL/9dsHrsqT4oN+azYIqz2tEi30OiCQNzMim/yhhJLc8jUU6vhxU2f22kk=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24574.61222.420015.914048@mariner.uk.xensource.com>
Date: Wed, 13 Jan 2021 13:01:26 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Andrew Cooper <amc96@cam.ac.uk>
Subject: Re: [PATCH 3/3] tools: Move memshrtool from tests/ to misc/
In-Reply-To: <20210113123455.23209-4-andrew.cooper3@citrix.com>
References: <20210113123455.23209-1-andrew.cooper3@citrix.com>
	<20210113123455.23209-4-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH 3/3] tools: Move memshrtool from tests/ to misc/"):
> memshrtool is a tool for a human to use, rather than a test.  Move it into
> misc/ as a more appropriate location to live.  Also rename it to
> xen-memshare-tool

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

