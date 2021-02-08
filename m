Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEA5313B5E
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 18:47:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82999.153624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Ad0-0004Qq-07; Mon, 08 Feb 2021 17:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82999.153624; Mon, 08 Feb 2021 17:47:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Acz-0004QR-SJ; Mon, 08 Feb 2021 17:47:13 +0000
Received: by outflank-mailman (input) for mailman id 82999;
 Mon, 08 Feb 2021 17:47:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9Acy-0004QH-AQ
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 17:47:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9Acy-0000x0-9d
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 17:47:12 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9Acy-0000Vw-8M
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 17:47:12 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l9Acu-00039K-P0; Mon, 08 Feb 2021 17:47:08 +0000
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
	bh=5yoZFqMzJOYFYJ3eOacoTnR1JQ0/derntfD0JSsze0M=; b=Lawqt87bpd3UPpNvEell8eL92N
	ZIX1B9b49lrOSG76M5oAMGcqg8KsZyxw2ucUlj9FF6CrssTx7D75OoX29dU1bQTpYhJVrbRRrpdw/
	eWgUEAFgBNrgqXdgPjgU3DrNlSTen4TkK66y7WG6dkbJWa6TFk/9wNdI5BKPzlKv6By8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24609.31004.503545.742097@mariner.uk.xensource.com>
Date: Mon, 8 Feb 2021 17:47:08 +0000
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>,
    Anthony PERARD  <anthony.perard@citrix.com>
Subject: Re: [PATCH v20210111 07/39] xl: optionally print timestamps during
 xl migrate
In-Reply-To: <20210208183036.3f95bb0f.olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
	<20210111174224.24714-8-olaf@aepfle.de>
	<24609.25950.629059.164010@mariner.uk.xensource.com>
	<20210208183036.3f95bb0f.olaf@aepfle.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Olaf Hering writes ("Re: [PATCH v20210111 07/39] xl: optionally print timestamps during xl migrate"):
> Am Mon, 8 Feb 2021 16:22:54 +0000
> schrieb Ian Jackson <iwj@xenproject.org>:
> 
> > I wonder if I can get a quick second option from someone on the API
> > question.  Using up a single letter option is something I don't want
> > to just rush into.
> 
> Maybe put "-T" or "-t" into xl.c:main() instead, so that every command prints timestamp+pid?

Yes, I think following some informal irc discussions that that would
be best.

> For everything beside "migrate" it will only be useful along with a couple of "-v" to enable global debug output.

Right.

Ian.

