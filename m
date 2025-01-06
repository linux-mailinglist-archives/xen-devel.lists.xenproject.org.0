Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B848A0326C
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 23:02:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866031.1277326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUvAB-0005Ir-Op; Mon, 06 Jan 2025 22:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866031.1277326; Mon, 06 Jan 2025 22:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUvAB-0005GS-Lb; Mon, 06 Jan 2025 22:01:31 +0000
Received: by outflank-mailman (input) for mailman id 866031;
 Mon, 06 Jan 2025 22:01:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T/Ld=T6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tUvAA-0005GM-Cl
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 22:01:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6e92887-cc79-11ef-99a4-01e77a169b0f;
 Mon, 06 Jan 2025 23:01:28 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 73D2B5C60E5;
 Mon,  6 Jan 2025 22:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C231C4CED2;
 Mon,  6 Jan 2025 22:01:25 +0000 (UTC)
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
X-Inumbo-ID: c6e92887-cc79-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736200886;
	bh=+SgfoRqkrmN/LiTQaBhlqzmt92UAGuRngzCafowYl1k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=V0j0fqfwl4w1yeLE8v9dKNz7Gl75P7ufdXEsrqPbTCJA2C/3vHvv1iFfG2og0s7Nl
	 AvvtZ6aoLhp7qDJ1idOOhukJ86BbE+8Dt1C6aOUZZIjhVr6i630cDlxuQEaxXYQWlA
	 ZEAW5DD0LNk84sYpEAwTD1itLcW7zkXx5WzqZ3t+6mlEUIukEJtrGgtcXXAj9qO6gK
	 wmnr06Gm7JLWV+hxctRySskldopmOXqHW3zx4bqXH/Qjyuc59Xu5UgxZrR5vOCsYiw
	 W8/ZUuvNIE90hOfr9QY4htltsGYOj0IxAqnDQc9klWQjlEDh4tMSk0O4EcGeTRKyAC
	 /1FiGD1wVtTug==
Date: Mon, 6 Jan 2025 14:01:23 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.20] public/version: soften wording for deprecated
 sub-ops
In-Reply-To: <8ca8ac20-a19f-49ef-9631-08cdcef854d2@suse.com>
Message-ID: <alpine.DEB.2.22.394.2501061229300.133435@ubuntu-linux-20-04-desktop>
References: <bf8cc342-52aa-44ee-8bce-ce2be6406904@suse.com> <0c8a13d0-04d7-4ed6-a8d8-a4423867fa3f@citrix.com> <8ca8ac20-a19f-49ef-9631-08cdcef854d2@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 6 Jan 2025, Jan Beulich wrote:
> On 06.01.2025 12:08, Andrew Cooper wrote:
> > On 06/01/2025 11:04 am, Jan Beulich wrote:
> >> These interfaces were - afaict - originally introduced this way on the
> >> firm assumption that the used array sizes would be good virtually
> >> forever.  While this assumption turned out to not be true for at least
> >> some of them, this still doesn't really render them "broken": They still
> >> fit their original purpose, and they are still usable for a fair subset
> >> of environments.  Re-word the comments accordingly.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > No.
> > 
> > The community voted and rejected this opinion.
> 
> That's not my recollection of what was voted on, and with the vote results
> not being available referring to them is unhelpful anyway.
> 
> My (admittedly vague) recollection is that it was decided to leave enough
> room for wording choice by submitters. That would cover your original
> patch, and it would equally cover mine.

The community-wide survey indicated that it is acceptable to use the
term "broken" in our documentation [1]. While the survey was not tied to
a specific instance, it was undoubtedly influenced by the ongoing
discussion at the time.

If the purpose of this patch is to replace the term "broken", as it
would seem from the commit message, I would recommend dropping the patch
and leaving the wording as it is, given that the community has expressed
approval of its use. Let us respect that decision.

However, if the goal is to improve clarity by specifying "due to its
size limitations" and noting that the truncation occurs "silently", then
I believe the patch could be reviewed with that objective in mind.

In other words, we should not replace "broken" simply for the sake of
doing so. That discussion has already been settled. When reviewing this
patch, our focus should be on its other merits, if any.

Based on the above, I would not take the patch in its current form. But
if Jan is up for rewording the commit message, and focusing purely on
the clarity of the in-code comments maybe a future version could be
acceptable.

[1] https://cryptpad.fr/form/#/2/form/view/7ByH95Vd7KiDOvN4wjV5iUGlMuZbkVdwk7cYpZdluWo/

