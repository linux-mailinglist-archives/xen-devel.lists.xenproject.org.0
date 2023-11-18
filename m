Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D07C7EFD3A
	for <lists+xen-devel@lfdr.de>; Sat, 18 Nov 2023 03:41:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635493.991436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4BHI-0000qT-3Q; Sat, 18 Nov 2023 02:41:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635493.991436; Sat, 18 Nov 2023 02:41:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4BHI-0000nJ-0T; Sat, 18 Nov 2023 02:41:48 +0000
Received: by outflank-mailman (input) for mailman id 635493;
 Sat, 18 Nov 2023 02:41:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W+gg=G7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r4BHG-0000nD-8K
 for xen-devel@lists.xenproject.org; Sat, 18 Nov 2023 02:41:46 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 015bb4db-85bc-11ee-9b0e-b553b5be7939;
 Sat, 18 Nov 2023 03:41:43 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BDD47CE2641;
 Sat, 18 Nov 2023 02:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DA4DC433C8;
 Sat, 18 Nov 2023 02:41:38 +0000 (UTC)
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
X-Inumbo-ID: 015bb4db-85bc-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700275300;
	bh=35DH54wYr34/lOwIr5QRfLXlmGIdcajrH99olY4oJjU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aYjAgq/CJ08PTdR4YsNtr/4TqMz2QLK8tei4TEr+qzk05gzATq53jJa2ugMa4AjU2
	 nGhtyH9Qtc2yMxocUBTC6H9GBHsPI9VSz8B3lTtiZ9VuR+Q+WLmYzTy4FvezF357AL
	 m3QMyVwpKSbLUtyYaHgYKqfBKR4liDcPHA3lwugX0Tc5KVQ6SeRz813UTuBvhwaaUp
	 /5OfPvfWyfONZL1WbJwwCrw9Koxc6mU8X4fFTkwpIwfP5L5qEIUN5pq8lQGhP8J/PF
	 N/HP/z5w8U2tudNL9Xiu6HLimGcS194bw+3kyAHuBLk4Ji/P/Zf3wzNkntN21ZJc7t
	 0nXENeRK2/F4w==
Date: Fri, 17 Nov 2023 18:41:36 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, roger.pau@citrix.com
Subject: Re: [XEN PATCH v2] automation/eclair: add deviations for MISRA C:2012
 Rule 8.3
In-Reply-To: <b6aa527b-cf1a-41e1-a10a-f0d33f113464@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311171841310.773207@ubuntu-linux-20-04-desktop>
References: <1c146f28cb19607ddd6741de4f7de051894a3381.1698314415.git.federico.serafini@bugseng.com> <662e9080-5648-47eb-95e6-41fcb618c68f@xen.org> <1f137be0-452d-4073-a79c-ffd8a501e434@bugseng.com> <831e23c2-f30d-4931-8749-99e4b9c4215b@xen.org>
 <66e59c25-fa6f-4fa4-aae8-aefa0b52c3b4@bugseng.com> <32f63354-872d-4598-a5ce-c851cacfc6d4@xen.org> <alpine.DEB.2.22.394.2310261554570.271731@ubuntu-linux-20-04-desktop> <b6aa527b-cf1a-41e1-a10a-f0d33f113464@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-241756858-1700275299=:773207"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-241756858-1700275299=:773207
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 17 Nov 2023, Federico Serafini wrote:
> On 27/10/23 00:55, Stefano Stabellini wrote:
> > +Roger
> > 
> > See below
> > 
> > On Thu, 26 Oct 2023, Julien Grall wrote:
> > > On 26/10/2023 15:04, Federico Serafini wrote:
> > > > On 26/10/23 15:54, Julien Grall wrote:
> > > > > Hi,
> > > > > 
> > > > > On 26/10/2023 13:13, Federico Serafini wrote:
> > > > > > On 26/10/23 12:25, Julien Grall wrote:
> > > > > > > Hi,
> > > > > > > 
> > > > > > > On 26/10/2023 11:04, Federico Serafini wrote:
> > > > > > > > Update ECLAIR configuration to deviate Rule 8.3 ("All
> > > > > > > > declarations
> > > > > > > > of
> > > > > > > > an object or function shall use the same names and type
> > > > > > > > qualifiers")
> > > > > > > > for the following functions: guest_walk_tables_[0-9]+_levels().
> > > > > > > > Update file docs/misra/deviations.rst accordingly.
> > > > > > > > No functional change.
> > > > > > > > 
> > > > > > > > Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> > > > > > > > ---
> > > > > > > > Changes in v2:
> > > > > > > >     - removed set_px_pminfo() from the scope of the deviation;
> > > > > > > >     - fixed tag of the commit.
> > > > > > > > ---
> > > > > > > >    automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
> > > > > > > >    docs/misra/deviations.rst                        | 6 ++++++
> > > > > > > >    2 files changed, 10 insertions(+)
> > > > > > > > 
> > > > > > > > diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl
> > > > > > > > b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > > > > > > > index d8170106b4..b99dfdafd6 100644
> > > > > > > > --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> > > > > > > > +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > > > > > > > @@ -204,6 +204,10 @@ const-qualified."
> > > > > > > > 
> > > > > > > > 
> > > > > > > > -config=MC3R1.R8.3,reports+={deliberate,"any_area(any_loc(file(adopted_mpparse_r8_3)))&&any_area(any_loc(file(^xen/arch/x86/include/asm/mpspec\\.h$)))"}
> > > > > > > >    -doc_end
> > > > > > > > +-doc_begin="For functions guest_walk_tables_[0-9]+_levels(),
> > > > > > > > parameter names of definitions deliberately differ from the ones
> > > > > > > > used in the corresponding declarations."
> > > > > > > > +-config=MC3R1.R8.3,declarations={deliberate,"^guest_walk_tables_[0-9]+_levels\\(const
> > > > > > > > struct vcpu\\*, struct p2m_domain\\*, unsigned long, walk_t\\*,
> > > > > > > > uint32_t, gfn_t, mfn_t, void\\*\\)$"}
> > > > > > > > +-doc_end
> > > > > > > > +
> > > > > > > >    -doc_begin="The following variables are compiled in multiple
> > > > > > > > translation units
> > > > > > > >    belonging to different executables and therefore are safe."
> > > > > > > >    -config=MC3R1.R8.6,declarations+={safe,
> > > > > > > > "name(current_stack_pointer||bsearch||sort)"}
> > > > > > > > diff --git a/docs/misra/deviations.rst
> > > > > > > > b/docs/misra/deviations.rst
> > > > > > > > index 8511a18925..9423b5cd6b 100644
> > > > > > > > --- a/docs/misra/deviations.rst
> > > > > > > > +++ b/docs/misra/deviations.rst
> > > > > > > > @@ -121,6 +121,12 @@ Deviations related to MISRA C:2012 Rules:
> > > > > > > >             - xen/common/unxz.c
> > > > > > > >             - xen/common/unzstd.c
> > > > > > > > +   * - R8.3
> > > > > > > > +     - In some cases, parameter names used in the function
> > > > > > > > definition
> > > > > > > > +       deliberately differ from the ones used in the
> > > > > > > > corresponding
> > > > > > > > declaration.
> > > > > > > 
> > > > > > > It would be helpful to provide a bit more reasoning in your commit
> > > > > > > message why this was desired. At least for Arm and common code, I
> > > > > > > would not want anyone to do that because it adds more confusion.
> > > > > > > 
> > > > > > > > +     - Tagged as `deliberate` for ECLAIR. Such functions are:
> > > > > > > > +         - guest_walk_tables_[0-9]+_levels()
> > > > > > > 
> > > > > > > I think you want to be a bit mores specific. Other arch may have
> > > > > > > such
> > > > > > > function in the function and we don't want to deviate them from
> > > > > > > the
> > > > > > > start.
> > > > > > > 
> > > > > > > Cheers,
> > > > > > > 
> > > > > > 
> > > > > > Alright, thanks for the observation.
> > > > > 
> > > > > Actually, I cannot find the original discussion. Do you have link? I
> > > > > am
> > > > > interested to read the reasoning and how many maintainers expressed
> > > > > there
> > > > > view.
> > > > > 
> > > > > Cheers,
> > > > > 
> > > > 
> > > > The discussion started here:
> > > > https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg00122.html
> > > > 
> > > > Then, I asked for further suggestions:
> > > > https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg00855.html
> > > 
> > > Thanks! So only Jan really provided feedback here. I don't think this is a
> > > good idea to deviate in this case. If we really want to keep in sync and
> > > use
> > > 'walk' for the name, then we could add a comment after. Something like:
> > > 
> > > uint32_t walk /* pfec */
> 
> What do you think about "pfec_walk" as parameter name?

I am OK with that
--8323329-241756858-1700275299=:773207--

