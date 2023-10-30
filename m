Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F07A7DC29D
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 23:49:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625404.974632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxb4h-0003XT-4R; Mon, 30 Oct 2023 22:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625404.974632; Mon, 30 Oct 2023 22:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxb4h-0003Vo-0r; Mon, 30 Oct 2023 22:49:35 +0000
Received: by outflank-mailman (input) for mailman id 625404;
 Mon, 30 Oct 2023 22:49:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KEI1=GM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qxb4f-0003Vi-GU
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 22:49:33 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96d236ba-7776-11ee-98d6-6d05b1d4d9a1;
 Mon, 30 Oct 2023 23:49:32 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DB5E260BB5;
 Mon, 30 Oct 2023 22:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC291C433C8;
 Mon, 30 Oct 2023 22:49:28 +0000 (UTC)
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
X-Inumbo-ID: 96d236ba-7776-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698706170;
	bh=l0+1I/+BKsLqolV87ldHTy5/JRzQXOlOWSJwv/qjzqQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rQTTe7bq0MeGj+ojGjNrY6jfsfrn42hvhRa1nY6K/wOoJoXGjzxyZDKtngkJdWgHB
	 JPxn8dbVzjFgeupzDJu/IUN1qYkwDmfUDBRUAzLYDEmnLjq9xy/U1tThwSTaInkWGO
	 baxElC89/5B+d9xHMVbiUBSpG2tjlV2Ampe1o7xTtnFkqpJX+tdEe5ydF2VvtOGhTQ
	 fMyzeY7I5Ex4zDsCl8P+gVRp92kjoYDOkARga/15uNFVJBb56WCUGcs6sQ/uPqurkO
	 GFXWBO7UxoVq52uDG97ZN1tK7Q3HuaUyqqf/6MXLeTuxZbUCoG/LJzps8KyTmh+KOU
	 H+fRhbyQLz+ZQ==
Date: Mon, 30 Oct 2023 15:49:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 v5] xen: Add deviations for MISRA C:2012
 Rule 7.1
In-Reply-To: <98da41d4-f818-44c7-bd3c-b3e3b224ff0d@xen.org>
Message-ID: <alpine.DEB.2.22.394.2310301544460.1625118@ubuntu-linux-20-04-desktop>
References: <0c86b50a796ba2aaab01e30935ed559ab719d33a.1698418578.git.nicola.vetrini@bugseng.com> <98da41d4-f818-44c7-bd3c-b3e3b224ff0d@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Oct 2023, Julien Grall wrote:
> Hi Nicola,
> 
> On 27/10/2023 16:11, Nicola Vetrini wrote:
> > diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> > index 8511a189253b..8aaaa1473fb4 100644
> > --- a/docs/misra/deviations.rst
> > +++ b/docs/misra/deviations.rst
> > @@ -90,6 +90,13 @@ Deviations related to MISRA C:2012 Rules:
> >            - __emulate_2op and __emulate_2op_nobyte
> >            - read_debugreg and write_debugreg
> >   +   * - R7.1
> > +     - It is safe to use certain octal constants the way they are defined
> > +       in specifications, manuals, and algorithm descriptions. Such places
> > +       are marked safe with a /\* octal-ok \*/ in-code comment, or with a
> > SAF
> > +       comment (see safe.json).
> 
> Reading this, it is unclear to me why we have two ways to deviate the rule
> r7.1. And more importantely, how would the developper decide which one to use?

I agree with you on this and we were discussing this topic just this
morning in the FUSA community call. I think we need a way to do this
with the SAF framework:

if (some code with violation) /* SAF-xx-safe */

This doesn't work today unfortunately. It can only be done this way:

/* SAF-xx-safe */
if (some code with violation)

Which is not always desirable. octal-ok is just an ad-hoc solution for
one specific violation but we need a generic way to do this. Luca is
investigating possible ways to support the previous format in SAF.

I think we should take this patch for now and harmonize it once SAF is
improved.

