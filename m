Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0468FA3CEC9
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 02:35:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893447.1302324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkvSl-0005hd-HD; Thu, 20 Feb 2025 01:34:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893447.1302324; Thu, 20 Feb 2025 01:34:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkvSl-0005f7-D8; Thu, 20 Feb 2025 01:34:51 +0000
Received: by outflank-mailman (input) for mailman id 893447;
 Thu, 20 Feb 2025 01:34:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/j1Y=VL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tkvSj-0005f1-Qb
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 01:34:49 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc6e1cce-ef2a-11ef-9896-31a8f345e629;
 Thu, 20 Feb 2025 02:34:44 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A5D466111F;
 Thu, 20 Feb 2025 01:34:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 794BFC4CED1;
 Thu, 20 Feb 2025 01:34:41 +0000 (UTC)
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
X-Inumbo-ID: dc6e1cce-ef2a-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740015282;
	bh=tUfrzn5DJAWU1ZUOa8C6PHqrM/bNTYd/aDvIYjxbghs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fYhgcXHtjXGIGhEJOfWMtgYAe+RCdUEjC5yeJayD8L11PAEsn2+8KlhR0op0Bapx+
	 UanVSBmM+M03RyVvtbS/OCA12tCcMrVoGrJ6szAAp/NRhp812llWaD3VC5nlDaJfoF
	 1JpI7spDwdyp/M08/wiF/QsuMf+Sq/AtOxDgHF4WkurbSeDX085jFnZnUG4hL5AKa8
	 RLDliYk2SbTeyz4gz8NjbRC6Gm9shXG6XKQvDcj6BEjcI438W8KTIrchwdliMrlOrD
	 oZB/TCPvbiwANDEFIFqmo8SqdI9mze3E5og9me5GLjkKO/eLkwUFr73wCZEx3ct/t/
	 T6yLHokKGx2+A==
Date: Wed, 19 Feb 2025 17:34:39 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Andrushchenko <andr2000@gmail.com>
cc: Jan Beulich <jbeulich@suse.com>, Artem_Mygaiev@epam.com, 
    Luca.Fancellu@arm.com, roger.pau@citrix.com, 
    marmarek@invisiblethingslab.com, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 0/2] code style exercise: Drivers folder samples
In-Reply-To: <924753a2-8abc-4d49-84f9-6f4677bf76f1@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2502191725300.1791669@ubuntu-linux-20-04-desktop>
References: <20250216102108.2665222-1-andr2000@gmail.com> <4f1fcad5-dd6c-471f-9496-023973fa8857@suse.com> <alpine.DEB.2.22.394.2502171833370.1085376@ubuntu-linux-20-04-desktop> <f6db4e23-8c6e-43a5-a90a-ea3526f88b23@suse.com> <26cfd51b-123f-48e7-9911-2c96b48abdfe@gmail.com>
 <f0a4af56-016f-4ea7-92a8-6f6f4a62809a@suse.com> <924753a2-8abc-4d49-84f9-6f4677bf76f1@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 19 Feb 2025, Oleksandr Andrushchenko wrote:
> Yes, I do agree. But only if we talk about having an automated
> code style check now (which is definitely the goal at some time).
> Before that we could still use the tool to take all that good that
> it does and manually prepare a set of patches to fix those
> code style issues which we like.

Let's explore this option a bit more. Let's say that we write down our
coding style in plain English by enhancing CODING_STYLE. This newer
CODING_STYLE has also a corresponding clang-format configuration.

Now, we cannot use clang-format to reformat everything because, as we
are discovering with this example, clang-format is overzealous and
changes too many things. Instead, we take "inspiration" from
clang-format's output but we manually prepare a patch series to apply
code style changes to Xen as the coding style today is not uniform
across the code base and also not always conforming to CODING_STYLE.

At this point, we have already made an improvement to CODING_STYLEe, and
made the Xen coding style more uniform across the codebase.

But do we also have an automated coding style checker that we can use?
Can we use clang-format to check new patches coming in? Or would
clang-format flag too many things as coding style errors?

If it is flagging too many things as error, so we cannot use it as
automated checker, is it still worth going through the exercise? Yes, we
make some improvement we haven't reached the goal of having an automated
code style checker.

