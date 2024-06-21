Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA36913044
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jun 2024 00:25:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745655.1152805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKmge-0008OI-Tu; Fri, 21 Jun 2024 22:24:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745655.1152805; Fri, 21 Jun 2024 22:24:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKmge-0008MB-RG; Fri, 21 Jun 2024 22:24:52 +0000
Received: by outflank-mailman (input) for mailman id 745655;
 Fri, 21 Jun 2024 22:24:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B+dc=NX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sKmgd-0008M5-NT
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 22:24:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12159d72-301d-11ef-90a3-e314d9c70b13;
 Sat, 22 Jun 2024 00:24:49 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5FEAE61F12;
 Fri, 21 Jun 2024 22:24:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD618C2BBFC;
 Fri, 21 Jun 2024 22:24:46 +0000 (UTC)
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
X-Inumbo-ID: 12159d72-301d-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719008688;
	bh=o8TbK0ni2OrU29q0sruc8RM7BJDHAGGwxdornMcUQXA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=M342ko7HVUhbLn2TNGYwTnamQSLtwbrVzXlHN0388kGkmF09wKGboNlijtJXW+qxz
	 SrYOWBOIMmnVun1LSt3D1W2P5Ke/WlmAdo8K9ai+2LkUi9RpR007wV+XDO7pxsyj86
	 lAZRXBk45Ajs82lY+y6MQ5D7iW2kzMq6druH/ybmcKGFsfVTBTjsg5lgrWA1ttC1yI
	 d74csY2VJP3hiuBwJzyTp9lw6MVLEQqvfaLGcJOT8Ia8ziAoq/mP+gZpBCFRN2EFKY
	 fIpvDfWMEaOr1/23fuEMVl2qIN9uhuGZw54DV5/IcohjKfsUCAURXGxWIOzFeSLo2S
	 ZOuNpxoMGT8gA==
Date: Fri, 21 Jun 2024 15:24:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Federico Serafini <federico.serafini@bugseng.com>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, oleksii.kurochko@gmail.com
Subject: Re: [XEN PATCH v3] automation/eclair: add deviation for MISRA C Rule
 17.7
In-Reply-To: <alpine.DEB.2.22.394.2406191819370.2572888@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2406211522270.2572888@ubuntu-linux-20-04-desktop>
References: <b571bd05955ab9967a44517c9947545a2a530f01.1718354974.git.federico.serafini@bugseng.com> <alpine.DEB.2.22.394.2406191819370.2572888@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 19 Jun 2024, Stefano Stabellini wrote:
> On Fri, 14 Jun 2024, Federico Serafini wrote:
> > Update ECLAIR configuration to deviate some cases where not using
> > the return value of a function is not dangerous.
> > 
> > Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
 
I would like to request a release ack, as this patch only affects the
ECLAIR analysis for R17.7, which is non-blocking anyway (meaning: it
cannot cause a gitlab-ci failure, it is only informative).



> > ---
> > Changes in v3:
> > - removed unwanted underscores;
> > - grammar fixed;
> > - do not constraint to the first actual argument.
> > Changes in v2:
> > - do not deviate strlcpy and strlcat.
> > ---
> >  automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
> >  docs/misra/deviations.rst                        | 9 +++++++++
> >  2 files changed, 13 insertions(+)
> > 
> > diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > index 447c1e6661..97281082a8 100644
> > --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> > +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > @@ -413,6 +413,10 @@ explicit comment indicating the fallthrough intention is present."
> >  -config=MC3R1.R17.1,macros+={hide , "^va_(arg|start|copy|end)$"}
> >  -doc_end
> >  
> > +-doc_begin="Not using the return value of a function does not endanger safety if it coincides with an actual argument."
> > +-config=MC3R1.R17.7,calls+={safe, "any()", "decl(name(__builtin_memcpy||__builtin_memmove||__builtin_memset||cpumask_check))"}
> > +-doc_end
> > +
> >  #
> >  # Series 18.
> >  #
> > diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> > index 36959aa44a..f3abe31eb5 100644
> > --- a/docs/misra/deviations.rst
> > +++ b/docs/misra/deviations.rst
> > @@ -364,6 +364,15 @@ Deviations related to MISRA C:2012 Rules:
> >         by `stdarg.h`.
> >       - Tagged as `deliberate` for ECLAIR.
> >  
> > +   * - R17.7
> > +     - Not using the return value of a function does not endanger safety if it
> > +       coincides with an actual argument.
> > +     - Tagged as `safe` for ECLAIR. Such functions are:
> > +         - __builtin_memcpy()
> > +         - __builtin_memmove()
> > +         - __builtin_memset()
> > +         - cpumask_check()
> > +
> >     * - R20.4
> >       - The override of the keyword \"inline\" in xen/compiler.h is present so
> >         that section contents checks pass when the compiler chooses not to
> > -- 
> > 2.34.1
> > 
> 

