Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C91CF32D45C
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 14:43:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93259.176036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHoF5-0001ol-3k; Thu, 04 Mar 2021 13:42:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93259.176036; Thu, 04 Mar 2021 13:42:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHoF5-0001oM-0e; Thu, 04 Mar 2021 13:42:15 +0000
Received: by outflank-mailman (input) for mailman id 93259;
 Thu, 04 Mar 2021 13:42:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHoF3-0001oH-Ip
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 13:42:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHoF3-0003ib-G0
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 13:42:13 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHoF3-0000Db-EU
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 13:42:13 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lHoF0-0005Lr-3M; Thu, 04 Mar 2021 13:42:10 +0000
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
	bh=3SRdSTzymaBRDF96qiFo4YlIWh9G48EwBjsnKXqr1DI=; b=PiRQ48gn/KK7n8vg5QRvZpff/Y
	IYS200QRjJRnC62Ncf3FEntV1c1R8/yLcaXoPfEQqOSRqplLJJyKBjWvaT9ZY32gqut3NWI/Nw8DH
	Fb3qs7rPGdAJ4djuL0yGhpHyJiVkdI6pIWKZseKm9x1eA/o5u/TUE6dqt4ptl6z5zESM=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24640.58289.822243.338643@mariner.uk.xensource.com>
Date: Thu, 4 Mar 2021 13:42:09 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.15] tools/libxendevicemodel: Strip __XEN_TOOLS__ header guard
In-Reply-To: <20210304130319.10719-1-andrew.cooper3@citrix.com>
References: <20210304130319.10719-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH for-4.15] tools/libxendevicemodel: Strip __XEN_TOOLS__ header guard"):
> This is inappropriate for the header file of a standalone library with stable
> API and ABI.

wat

> Discovered when trying to actually remove the use of unstable libraries from a
> trivial userspace emulator.  Current users of xendevicemodel.h inherit
> __XEN_TOOLS__ from libxenctrl.h (or equiv).

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

