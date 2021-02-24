Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 727AB323ADA
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 11:54:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89259.168004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEro8-0002oW-Pn; Wed, 24 Feb 2021 10:54:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89259.168004; Wed, 24 Feb 2021 10:54:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEro8-0002o7-Mb; Wed, 24 Feb 2021 10:54:16 +0000
Received: by outflank-mailman (input) for mailman id 89259;
 Wed, 24 Feb 2021 10:54:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lEro7-0002o2-SI
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 10:54:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lEro7-0003cg-QG
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 10:54:15 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lEro7-0006AS-Ox
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 10:54:15 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lEro4-0006bf-Bl; Wed, 24 Feb 2021 10:54:12 +0000
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
	bh=9JN2optW0yIzKfa1RJQdHleQKv352qScGmZsEaZTUng=; b=zeaMmBIDmhmrwjhtIEz/bNcOvb
	c5R9Hpp3qzH12mU2/v4JcWWe7o79XmyqujmvBk0eP9amJSs691pWsAa27oaDOFuYXulD+Uog3zmU/
	BnFIL9Sx8FMyoqBX9ytoeY8TQ1hljYZY9Oa/Sn1Gv9pphSRQnxNMIPqeYljvD6vtcN3U=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24630.12372.139290.270183@mariner.uk.xensource.com>
Date: Wed, 24 Feb 2021 10:54:12 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Jan Beulich <jbeulich@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
Subject: Re: [PATCH 0/2] hvmloader: drop usage of system headers
In-Reply-To: <20210224102641.89455-1-roger.pau@citrix.com>
References: <20210224102641.89455-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH 0/2] hvmloader: drop usage of system headers"):
> Following two patches aim to make hvmloader standalone, so that it don't
> try to use system headers. It shouldn't result in any functional
> change.

Both patches:

Reviewed-by: Ian Jackson <iwj@xenproject.org>

Given its status as a build fix,

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Thanks,
Ian.

