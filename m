Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D413B77E9D4
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 21:42:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584914.915810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWMOw-0007vO-Oo; Wed, 16 Aug 2023 19:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584914.915810; Wed, 16 Aug 2023 19:41:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWMOw-0007tO-Lg; Wed, 16 Aug 2023 19:41:54 +0000
Received: by outflank-mailman (input) for mailman id 584914;
 Wed, 16 Aug 2023 19:41:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8vYs=EB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qWMOu-0007tF-HV
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 19:41:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0fad1c7-3c6c-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 21:41:50 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9413862CB1;
 Wed, 16 Aug 2023 19:41:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BD95C433C7;
 Wed, 16 Aug 2023 19:41:46 +0000 (UTC)
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
X-Inumbo-ID: f0fad1c7-3c6c-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692214908;
	bh=jgkm8xLfvboqRUZ+0wiq2MHUaK40aBOzhktic6+bFE0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Vs76GPbonLel+OGWvTSS4xlqPpKpOA3anf+10MkTHDbj87rjvRsXkWsCWGdkYDFOQ
	 ERNJEycQIPXTaAEsooVHRjxiUwba9T1zFF3wWXPfk7XZthQagGEG8THeIbdarxZ6E/
	 QrcXoM8Ei8YV90DkCQZtvdNn2NYYJu//oZmF3uIHHLu+kZZp+TmXC0ieRaGKp42lsz
	 W2zrMqALn+XdI6HH1CvtCwsXs9fgG0R3K+xwdlzyF4Im0SC7FTgPgMuY8Y6xJy7Fjd
	 iOtZx1vjfx+9nI9pPOx8tPvAtLbbPOv8Jrm+zfKuW1ooJ95Dn0Od1Z8d3gNp7QK5fi
	 IAR3ZSr1N0cvA==
Date: Wed, 16 Aug 2023 12:41:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    "stefano.stabellini@amd.com" <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, xenia.ragiadakou@amd.com, 
    Ayan Kumar Halder <ayankuma@amd.com>, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    roger.pau@citrix.com, Julien Grall <julien@xen.org>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: Placing of the documentation for MISRA C:2012 Directive 4.1
In-Reply-To: <95a86d69e97eb127a26f65cceb87e3bf@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308161232300.6458@ubuntu-linux-20-04-desktop>
References: <95a86d69e97eb127a26f65cceb87e3bf@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 16 Aug 2023, Nicola Vetrini wrote:
> Hi,
> 
> it has been agreed during past MISRA meetings that Directive 4.1
> ("Run-time failures shall be minimized") shall be dealt with by documenting
> how in Xen such runtime failures are prevented, so by preparing a document
> analogous to
> docs/misra/C-language-toolchain.rst.
> 
> A common way to deal with this in ECLAIR is to create an header file
> and include it in at least one file that is part of the analyzed build, so
> that the
> checker can see it.

I am not following: why does ECLAIR need to see the documentation of how
we minimize runtimes failures in Xen?


> One obvious candidate for this is having a .h file inside docs/misra that is
> included
> either by a dummy .c file inside the same directory (and then build the docs
> in the analyzed
> configuration) or somewhere else (I came up with no
> good places where to include it).
> It could also be a standalone .c file somewhere else, but I don't think this
> would be the preferred way.

ECLAIR aside, I think the primary use of this document is to be read by
people: community members and assessors. So I think it would be best to
write it in a human-readable format and convert it to a .h file if that's
required for ECLAIR.

For instance, we could write it as RST file under docs/misra (RST is our
preferred file format for documents as it can be easily converted to
HTML and PDF), and then convert it into a .h file as part of the Xen
build system ("make xen" takes the RST file, adds #ifndef and #endif
arounds it, and creates a .h header out of it.)

If it is too difficult to convert RST to .h, then also a very basic text
document would suffice.


> You can see a possible draft of the structure of this file here [1], but
> providing the content
> here would require a substantial amount of collaboration with people having a
> broader
> knowledge about Xen and its practices to prevent the runtime errors delineated
> here, so
> a possibility is making an RFC patch to gather some inputs to fill the
> sections appropriately.

That makes sense


> As a side note, the directive should be added to docs/misra/rules.rst. It can
> be part of
> the patch addressing the violations, tough.
> 
> [1] https://github.com/BUGSENG/eclair_demo/blob/main/ECLAIR/MISRA_C_2012_doc.h

