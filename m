Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 894613B95A7
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 19:44:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149012.275432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lz0jS-0008PX-Ti; Thu, 01 Jul 2021 17:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149012.275432; Thu, 01 Jul 2021 17:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lz0jS-0008NT-QV; Thu, 01 Jul 2021 17:44:10 +0000
Received: by outflank-mailman (input) for mailman id 149012;
 Thu, 01 Jul 2021 17:44:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uD8v=LZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lz0jR-0008NH-GZ
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 17:44:09 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id efca23bc-da93-11eb-835a-12813bfff9fa;
 Thu, 01 Jul 2021 17:44:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A8826613CF;
 Thu,  1 Jul 2021 17:44:07 +0000 (UTC)
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
X-Inumbo-ID: efca23bc-da93-11eb-835a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625161448;
	bh=XauLEPYd/jYs64JpDvfc3TTx0NmqPddBd+EF4qXuebY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ftAZdRrGVvCCdWd5M8VuIzp7elLONE46uxBOuj9DIWNsBFgAgVYq8ya9Qn8HfwCRN
	 Sb0fx9YoPUuhyfkECYmDkS4xDZBnmiAxSVCQhVSr8R2OmsrSERhkphlyOeHgVIvRyG
	 dr7rGmmAD9Id4oALVGq0GO7XiSB0sggnNYpREAaF7GtsGWQ6WSmDVFbLMBwLNrWVc3
	 xQ/aSGXYLRcU2kABPAUkkV73EBtIZ4Nla/iSsW0L3sNgAaWlu0SKygGhDS70FEdFCU
	 yBa4ASUV4J7GNYXfLEANoTaOjR/kiB4M9NywuUjsi7iLLTz5Lnu+nbp29efUJMFon/
	 0Y6RUfF2fKEqg==
Date: Thu, 1 Jul 2021 10:44:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Luca Fancellu <luca.fancellu@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, 
    Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v6 9/9] docs/doxygen: doxygen documentation for
 grant_table.h
In-Reply-To: <31171081-1007-4B4E-91CC-25EA1041EB58@arm.com>
Message-ID: <alpine.DEB.2.21.2107011043410.9437@sstabellini-ThinkPad-T480s>
References: <20210510084105.17108-1-luca.fancellu@arm.com> <20210510084105.17108-10-luca.fancellu@arm.com> <alpine.DEB.2.21.2106231530320.24906@sstabellini-ThinkPad-T480s> <31171081-1007-4B4E-91CC-25EA1041EB58@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1419850380-1625161448=:9437"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1419850380-1625161448=:9437
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 1 Jul 2021, Luca Fancellu wrote:
> Hi Stefano,
> 
> > On 24 Jun 2021, at 00:34, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Mon, 10 May 2021, Luca Fancellu wrote:
> >> Modification to include/public/grant_table.h:
> >> 
> >> 1) Add doxygen tags to:
> >> - Create Grant tables section
> >> - include variables in the generated documentation
> >> - Used @keepindent/@endkeepindent to enclose comment
> >>   section that are indented using spaces, to keep
> >>   the indentation.
> >> 2) Add .rst file for grant table for Arm64
> > 
> > Why only arm64?
> 
> This is a mistake, it should be just “Add .rst file for grant table"
> 
> > 
> > 
> >> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> >> ---
> >> v6 changes:
> >> - Fix misaligned comment
> >> - Moved comments to make them display in the docs
> >> - Included more documentation in the docs
> >>  (see output here: https://luca.fancellu.gitlab.io/xen-docs/hypercall-interfaces/common/grant_tables.html)
> > 
> > It looks much much better. All the info we care about seems to be there.
> > The only things that I noticed missing and might be good to keep is the
> > small comment about HYPERVISOR_grant_table_op:
> > 
> > /* ` enum neg_errnoval
> > * ` HYPERVISOR_grant_table_op(enum grant_table_op cmd,
> > * `                           void *args,
> > * `                           unsigned int count)
> > * `
> > *
> > * @args points to an array of a per-command data structure. The array
> > * has @count members
> 
> Where do you want me to put this comment in the html page? In the end of the description in the top of the page?

Yeah, that looks like a good place
--8323329-1419850380-1625161448=:9437--

