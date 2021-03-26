Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D211E34A6AC
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 12:58:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101739.194740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPl6x-0002gy-IX; Fri, 26 Mar 2021 11:58:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101739.194740; Fri, 26 Mar 2021 11:58:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPl6x-0002gY-FU; Fri, 26 Mar 2021 11:58:43 +0000
Received: by outflank-mailman (input) for mailman id 101739;
 Fri, 26 Mar 2021 11:58:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPl6v-0002gT-Td
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 11:58:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPl6v-0005zt-SP
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 11:58:41 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPl6v-0000EA-Q1
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 11:58:41 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lPl6s-0002Ns-Dp; Fri, 26 Mar 2021 11:58:38 +0000
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
	bh=40SCwoy52KEhslfGLhSAz1yNVsyeEsgt7AvCDNi10I4=; b=xqUaljyrLa/RLlvlwR8n/Sa5oN
	KlVPxEEN/y1ohxv1yM6N/1PVBhV1MCy5LdAfCZQQDI/DyuYbevvLDT9dkqXYNvYMphGusIYFHnnfr
	Pn0HtZK0ai6z+zo/xHTbIi/bY3wHGZZ5mTK5VluOm/xxFzQZoe9XePrhFV1PairUxSBY=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24669.52334.265626.387095@mariner.uk.xensource.com>
Date: Fri, 26 Mar 2021 11:58:38 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Community Manager <community.manager@xenproject.org>
Subject: Re: [PATCH for-4.15] changelog: note MSR access change
In-Reply-To: <20210325162032.81348-1-roger.pau@citrix.com>
References: <20210325162032.81348-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH for-4.15] changelog: note MSR access change"):
> The change to deny all accesses to MSRs indexes not explicitly handled
> prevents leaking unwanted data into guests.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

