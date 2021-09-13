Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E02408B31
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 14:40:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185654.334330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPlF8-0000Ct-2t; Mon, 13 Sep 2021 12:39:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185654.334330; Mon, 13 Sep 2021 12:39:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPlF7-00009l-WD; Mon, 13 Sep 2021 12:39:25 +0000
Received: by outflank-mailman (input) for mailman id 185654;
 Mon, 13 Sep 2021 12:39:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mPlF6-00009d-SK
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 12:39:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mPlF6-0004u5-Qa
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 12:39:24 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mPlF6-0008Vw-PN
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 12:39:24 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mPlF2-0002gl-00; Mon, 13 Sep 2021 13:39:20 +0100
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
	bh=p93Z4e4zyxvtw9WGM+b9HiuMVHLePdBTKDUcFtY6zxI=; b=OktoPjF6SZbYtqrURq9HnWrwtd
	kozZSXKFZP3YkfdLjriHB7HCpMA9haGWnS85D4cW9XyzrP9a/hNskK4InjI61JHt/iKHgMBgE71lk
	rIaPLGufuUYoNIOSv1lBS/pUBVH6t/erXed1i9uo7ni8BjUmwcyar5LZm5QPVBXQltew=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24895.18039.739149.734153@mariner.uk.xensource.com>
Date: Mon, 13 Sep 2021 13:39:19 +0100
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>,
    <xen-devel@lists.xenproject.org>,
    George Dunlap <george.dunlap@citrix.com>,
    Nick Rosbrook <rosbrookn@ainfosec.com>,
    Nick  Rosbrook <rosbrookn@gmail.com>,
    Ting-Wei Lan <lantw44@gmail.com>
Subject: Re: [PATCH] tools/go: honor append build flags
In-Reply-To: <YT8z9DUaxOyx9gcz@MacBook-Air-de-Roger.local>
References: <20210707071531.69001-1-roger.pau@citrix.com>
	<YOWvPLcQywmEIPdI@FED-nrosbr-BE.crux.rad.ainfosec.com>
	<YT8z9DUaxOyx9gcz@MacBook-Air-de-Roger.local>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monné writes ("Re: [PATCH] tools/go: honor append build flags"):
> Unless someone else has opinions I think this is ready to be
> committed. Can a committer please queue it up?

Thanks for the ping.  Committed, with my ack.

Thanks,
Ian.

