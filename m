Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D507709AC
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 22:28:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577306.904333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS1Nv-0006Zg-Av; Fri, 04 Aug 2023 20:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577306.904333; Fri, 04 Aug 2023 20:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS1Nv-0006WY-7P; Fri, 04 Aug 2023 20:26:55 +0000
Received: by outflank-mailman (input) for mailman id 577306;
 Fri, 04 Aug 2023 20:26:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgx5=DV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qS1Nt-0006WS-T9
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 20:26:53 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d4aa4c8-3305-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 22:26:50 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5DE4C61EC4;
 Fri,  4 Aug 2023 20:26:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5027FC433C8;
 Fri,  4 Aug 2023 20:26:46 +0000 (UTC)
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
X-Inumbo-ID: 3d4aa4c8-3305-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691180807;
	bh=tY5F1rqf7Bai+fG9/a2nIFX2WFWPSML1zoaLAFl7wBY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lWZZmazf4M3la8pYdqaZMOKxDIhd0xR07znF42rsdBnwn5ApP8HyvJjt9dQx7YYl8
	 OfEAVbSWBFHXaegBZhpM126QZxkt5/5cs4O6iocBPHXxkAGg+gnIlsx9pNRTDAyRt2
	 5pdECFmm6kc/x0onEFNlWto3IYAcXq7geQC0T2AJt+yNVUK2255aqF/94d7L98doRl
	 W54TdFDs2cktYc0Q+pRxi1/PkqcA0+8ICB5iVFgsdUGcdk0SCfpShLnyODkmNnlZfb
	 W42MDV74wvHAhy2+DJownbuVlh377wK6MATsfE/NeatTLkMudyfOC/XT//xuxvHhWf
	 X+qVXrDEiWaKA==
Date: Fri, 4 Aug 2023 13:26:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 02/11] x86: move declarations to address MISRA C:2012
 Rule 2.1
In-Reply-To: <8672f79a-3e44-1cc3-b448-9ee4a4ed9090@suse.com>
Message-ID: <alpine.DEB.2.22.394.2308041322100.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1690985045.git.nicola.vetrini@bugseng.com> <204bf3ffcdda04d6d6cf072c42b78720e1e85b4d.1690985045.git.nicola.vetrini@bugseng.com> <alpine.DEB.2.22.394.2308021910030.2127516@ubuntu-linux-20-04-desktop> <ad838567-fde6-defa-77b6-b5887c8438b6@suse.com>
 <6a5260299c5822abfbd74749ebea8f8f@bugseng.com> <8672f79a-3e44-1cc3-b448-9ee4a4ed9090@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 4 Aug 2023, Jan Beulich wrote:
> On 03.08.2023 16:22, Nicola Vetrini wrote:
> > On 03/08/2023 11:01, Jan Beulich wrote:
> >> On 03.08.2023 04:13, Stefano Stabellini wrote:
> >>> On Wed, 2 Aug 2023, Nicola Vetrini wrote:
> >>>> @@ -1169,8 +1170,6 @@ static void cf_check 
> >>>> irq_guest_eoi_timer_fn(void *data)
> >>>>
> >>>>      switch ( action->ack_type )
> >>>>      {
> >>>> -        cpumask_t *cpu_eoi_map;
> >>>
> >>> It is only used by case ACKTYPE_EOI so it can be moved there (with a 
> >>> new
> >>> block):
> >>>
> >>>
> >>>     case ACKTYPE_EOI:
> >>>     {
> >>>         cpumask_t *cpu_eoi_map = this_cpu(scratch_cpumask);
> >>>         cpumask_copy(cpu_eoi_map, action->cpu_eoi_map);
> >>>         spin_unlock_irq(&desc->lock);
> >>>         on_selected_cpus(cpu_eoi_map, set_eoi_ready, desc, 0);
> >>>         return;
> >>>     }
> >>>     }
> >>
> >> This pattern (two closing braces at the same level) is why switch scope
> >> variable declarations were introduced (at least as far as introductions
> >> by me go). If switch scope variables aren't okay (which I continue to
> >> consider questionable), then this stylistic aspect needs sorting first
> >> (if everyone else thinks the above style is okay - with the missing
> >> blank line inserted -, then so be it).
> > 
> > Actually, they can be deviated because they don't result in wrong code 
> > being generated.
> 
> Only later I recalled Andrew's intention to possibly make use of
> -ftrivial-auto-var-init. While, unlike I think he said, such declared
> variables aren't getting in the way of this (neither gcc nor clang
> warn about them), they also don't benefit from it (i.e. they'll be
> left uninitialized despite the command line option saying otherwise).
> IOW I think further consideration is going to be needed here.

Let me get this right. Are you saying that if we enable
-ftrivial-auto-var-init, due to a compiler limitation, variables
declared as follow:

  switch(var) {
      int a;
      char b;
      
      case ...

do not benefit from -ftrivial-auto-var-init ?

So if we moved the variable declarations elsewhere, in one of the two
following ways:

1)
  int a;
  int b;

  switch(var) {

2)
  switch(var) {

  case 1:
  {
      int a;
      int b;


Then -ftrivial-auto-var-init would take effect? If so, I think it is
worth a discussion on what to do there.

But either way right now I think it is fine to take the switch-related
patches out of this series.

