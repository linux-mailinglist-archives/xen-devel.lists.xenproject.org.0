Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46ECF30ACAE
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 17:33:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80011.146105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6c7y-0007Cx-7d; Mon, 01 Feb 2021 16:32:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80011.146105; Mon, 01 Feb 2021 16:32:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6c7y-0007Ca-4K; Mon, 01 Feb 2021 16:32:38 +0000
Received: by outflank-mailman (input) for mailman id 80011;
 Mon, 01 Feb 2021 16:32:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6c7w-0007CC-16
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 16:32:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6c7v-0006GQ-TU
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 16:32:35 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6c7v-0003AA-Sh
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 16:32:35 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l6c7s-0007yU-G6; Mon, 01 Feb 2021 16:32:32 +0000
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
	bh=mD9K0ja73FntMSDedb+moNvmJiBIdbM4YuBQENcV2EQ=; b=wIimVN4DX5fdHJWmN5uAIdz7s1
	6QNzFi5vR0sSkYlMR0XqoJ8PKiw8b7wIIHiwB2i1Yq7W+SNPa/LzfCnrvpayk9bHzjWhjSb3HPAaO
	NZMXzGW6O0BaVZoME+WJfh/xxXHF+I6T+tSCD9luyWnZfDPPtoEyHWkvKWNSqk7GPDQM=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24600.11552.182964.601654@mariner.uk.xensource.com>
Date: Mon, 1 Feb 2021 16:32:32 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.15] xenstore: fix build on {Net/Free}BSD
In-Reply-To: <20210201155317.57748-1-roger.pau@citrix.com>
References: <20210201155317.57748-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH for-4.15] xenstore: fix build on {Net/Free}BSD"):
> The endian.h header is in sys/ on NetBSD and FreeBSD.

That's a bit irritating.  Ah well.

Acked-by: Ian Jackson <iwj@xenproject.org>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Ian.

