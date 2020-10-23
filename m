Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6272971BC
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 16:52:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11050.29296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVyQQ-0004v3-FF; Fri, 23 Oct 2020 14:52:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11050.29296; Fri, 23 Oct 2020 14:52:14 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVyQQ-0004ue-C1; Fri, 23 Oct 2020 14:52:14 +0000
Received: by outflank-mailman (input) for mailman id 11050;
 Fri, 23 Oct 2020 14:52:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UuJs=D6=xenproject.org=iwj@srs-us1.protection.inumbo.net>)
 id 1kVyQP-0004uZ-D1
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 14:52:13 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34bf1b99-e4e5-444e-a1ba-39416efcbd17;
 Fri, 23 Oct 2020 14:52:12 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kVyQO-0005mn-Fq
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 14:52:12 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kVyQO-0003rK-Cg
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 14:52:12 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1kVyQL-00083u-4R; Fri, 23 Oct 2020 15:52:09 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=UuJs=D6=xenproject.org=iwj@srs-us1.protection.inumbo.net>)
	id 1kVyQP-0004uZ-D1
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 14:52:13 +0000
X-Inumbo-ID: 34bf1b99-e4e5-444e-a1ba-39416efcbd17
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 34bf1b99-e4e5-444e-a1ba-39416efcbd17;
	Fri, 23 Oct 2020 14:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=wN6vjdYJBuYzKtmGQANpBjSnJ+IdsjQMiN9RUJbYgvY=; b=cPdli9rji9Hldqb4OQ2TMA+gPs
	nn1I+mdbj/IiupP78aL664lgmjvh/corLI/sgaD+ML2wAOVVD+Dc5/Krxi+xGivFx3zh2SaexmRIN
	slzqLM4nTblaHpsZGBuT9qhhrE/HYNxMNIenica2CL7LwVcuK+9JcHLG1zQVMwjgLp0c=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <iwj@xenproject.org>)
	id 1kVyQO-0005mn-Fq
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 14:52:12 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <iwj@xenproject.org>)
	id 1kVyQO-0003rK-Cg
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 14:52:12 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
	(envelope-from <iwj@xenproject.org>)
	id 1kVyQL-00083u-4R; Fri, 23 Oct 2020 15:52:09 +0100
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24466.60952.899550.965639@mariner.uk.xensource.com>
Date: Fri, 23 Oct 2020 15:52:08 +0100
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    Samuel Thibault <samuel.thibault@ens-lyon.org>,
    Christian Lindig <christian.lindig@citrix.com>,
    David Scott <dave@recoil.org>,
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v2 1/3] tools/libs: move official headers to common directory
In-Reply-To: <20201023141934.20062-2-jgross@suse.com>
References: <20201023141934.20062-1-jgross@suse.com>
	<20201023141934.20062-2-jgross@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("[PATCH v2 1/3] tools/libs: move official headers to common directory"):
> Instead of each library having an own include directory move the
> official headers to tools/include instead. This will drop the need to
> link those headers to tools/include and there is no need any longer
> to have library-specific include paths when building Xen.
> 
> While at it remove setting of the unused variable
> PKG_CONFIG_CFLAGS_LOCAL in libs/*/Makefile.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Christian Lindig <christian.lindig@citrix.com>
> Tested-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thanks, all three

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

and pushed.

Ian.

