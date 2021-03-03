Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AAA32B650
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 10:48:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92786.174883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHO6x-0008MK-HP; Wed, 03 Mar 2021 09:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92786.174883; Wed, 03 Mar 2021 09:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHO6x-0008Lv-Do; Wed, 03 Mar 2021 09:48:07 +0000
Received: by outflank-mailman (input) for mailman id 92786;
 Wed, 03 Mar 2021 09:48:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHO6w-0008Lq-D1
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 09:48:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHO6w-0004u1-AN
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 09:48:06 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHO6w-0004Cj-9B
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 09:48:06 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lHO6s-0001hl-VT; Wed, 03 Mar 2021 09:48:03 +0000
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
	bh=esCPhHYB03o8fuy+NHk7sy/LvsUVkr6R1iBk4ZvqtJU=; b=PxhGoUx+1K3/V0roEoUTSmrglj
	E4cY4U3Y/A5QR3qxUKJGp8mCKoMYzLAQZHaNodoogxPn2FH+NheKopWgqBZfA/CKsLqIndLD91sH1
	MbsMXUu9d4Dppe5huKPEF5Rw8/kEB8cnHF9FOdPo4czwNJP4rvjuS6ezdCfMMKojz3rI=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24639.23378.722148.653250@mariner.uk.xensource.com>
Date: Wed, 3 Mar 2021 09:48:02 +0000
To: Nick Rosbrook <rosbrookn@gmail.com>
Cc: xen-devel@lists.xenproject.org,
    george.dunlap@citrix.com,
    Nick Rosbrook <rosbrookn@ainfosec.com>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [RFC v2 0/7] add function support to IDL
In-Reply-To: <cover.1614734296.git.rosbrookn@ainfosec.com>
References: <cover.1614734296.git.rosbrookn@ainfosec.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Nick Rosbrook writes ("[RFC v2 0/7] add function support to IDL"):
> At a Xen Summit design session for the golang bindings (see [1]), we
> agreed that it would be beneficial to expand the libxl IDL with function
> support. In addition to benefiting libxl itself, this would allow other
> language bindings to easily generate function wrappers.
> 
> The first version of this RFC is quite old [1]. I did address comments
> on the original RFC, but also expanded the scope a bit. As a way to
> evaluate function support, I worked on using this addition to the IDL to
> generate device add/remove/destroy functions, and removing the
> corresponding macros in libxl_internal.h. However, I stopped short of
> actually completing a build with this in place, as I thought it made
> sense to get feedback on the idea before working on the next step.

This is exciting!  I hope to find time to look at it, but I'm the
release manager for Xen 4.15 and that's taking most of my time right
now.

Regards,
Ian.

