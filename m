Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A437F45457A
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 12:17:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226757.391981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnIvm-0003Xi-28; Wed, 17 Nov 2021 11:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226757.391981; Wed, 17 Nov 2021 11:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnIvl-0003V9-V5; Wed, 17 Nov 2021 11:16:45 +0000
Received: by outflank-mailman (input) for mailman id 226757;
 Wed, 17 Nov 2021 11:16:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mnIvk-0003Uf-GZ
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 11:16:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mnIvk-0006PV-EF
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 11:16:44 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mnIvk-0001kr-DN
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 11:16:44 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mnIve-00059f-VH; Wed, 17 Nov 2021 11:16:39 +0000
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
	bh=q7DWdBP8a1VxxvQm5j9gplXTa8COphzD0/B88JW8l48=; b=labg0j7Mw9FQiZb4BVOzs6YZxp
	Z0Z1tjC1KiD6d12L2SWKxpQr9tdhpK6Veh9lQMa09NWNGMggV5WY3tg8W+PnlcOsnSpic1TFENBXG
	ancSkiXY6b2T+dXBeIvbnhvQ4jqIIy//oDisOwi+lCMODeB/N15kRfqQxxvSy7GQLgr8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24980.58518.431781.673797@mariner.uk.xensource.com>
Date: Wed, 17 Nov 2021 11:16:38 +0000
To: Andrew Cooper <amc96@srcf.net>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
    xen-devel@lists.xenproject.org,
    Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=  <marmarek@invisiblethingslab.com>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.16 4/4] tools/python: fix python libxc bindings to
 pass a max grant version
In-Reply-To: <a673781a-a819-78e9-9ac5-d54345555d95@srcf.net>
References: <20211115121741.3719-1-roger.pau@citrix.com>
	<20211115121741.3719-5-roger.pau@citrix.com>
	<a673781a-a819-78e9-9ac5-d54345555d95@srcf.net>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: [PATCH for-4.16 4/4] tools/python: fix python libxc bindings to pass a max grant version"):
> On 15/11/2021 12:17, Roger Pau Monne wrote:
> > Such max version should be provided by the caller, otherwise the
> > bindings will default to specifying a max version of 2, which is
> > inline with the current defaults in the hypervisor.
> >
> > Fixes: 7379f9e10a ('gnttab: allow setting max version per-domain')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

FTR

Acked-by: Ian Jackson <iwj@xenproject.org>

