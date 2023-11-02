Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 870E77DEE3E
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 09:36:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626768.977308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyTBS-0003Pc-LY; Thu, 02 Nov 2023 08:36:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626768.977308; Thu, 02 Nov 2023 08:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyTBS-0003Nd-IZ; Thu, 02 Nov 2023 08:36:10 +0000
Received: by outflank-mailman (input) for mailman id 626768;
 Thu, 02 Nov 2023 08:36:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HN1Y=GP=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qyTBR-0003NS-15
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 08:36:09 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd9eb127-795a-11ee-98d6-6d05b1d4d9a1;
 Thu, 02 Nov 2023 09:36:06 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id B26B34EE0737;
 Thu,  2 Nov 2023 09:36:06 +0100 (CET)
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
X-Inumbo-ID: dd9eb127-795a-11ee-98d6-6d05b1d4d9a1
MIME-Version: 1.0
Date: Thu, 02 Nov 2023 09:36:06 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, Simone Ballarin <simone.ballarin@bugseng.com>, Doug
 Goldstein <cardoe@cardoe.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 v5] xen: Add deviations for MISRA C:2012
 Rule 7.1
In-Reply-To: <alpine.DEB.2.22.394.2310311441530.1795129@ubuntu-linux-20-04-desktop>
References: <0c86b50a796ba2aaab01e30935ed559ab719d33a.1698418578.git.nicola.vetrini@bugseng.com>
 <98da41d4-f818-44c7-bd3c-b3e3b224ff0d@xen.org>
 <alpine.DEB.2.22.394.2310301544460.1625118@ubuntu-linux-20-04-desktop>
 <ee3c415d-bedd-432e-bf31-6e806b9cf976@xen.org>
 <alpine.DEB.2.22.394.2310311441530.1795129@ubuntu-linux-20-04-desktop>
Message-ID: <888f5522620fa8ef016a23e40b942e68@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi Julien, Stefano

On 2023-10-31 22:41, Stefano Stabellini wrote:
> On Tue, 30 Oct 2023, Julien Grall wrote:
>> Hi Stefano,
>> 
>> On 30/10/2023 22:49, Stefano Stabellini wrote:
>> > On Mon, 30 Oct 2023, Julien Grall wrote:
>> > > Hi Nicola,
>> > >
>> > > On 27/10/2023 16:11, Nicola Vetrini wrote:
>> > > > diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>> > > > index 8511a189253b..8aaaa1473fb4 100644
>> > > > --- a/docs/misra/deviations.rst
>> > > > +++ b/docs/misra/deviations.rst
>> > > > @@ -90,6 +90,13 @@ Deviations related to MISRA C:2012 Rules:
>> > > >             - __emulate_2op and __emulate_2op_nobyte
>> > > >             - read_debugreg and write_debugreg
>> > > >    +   * - R7.1
>> > > > +     - It is safe to use certain octal constants the way they are
>> > > > defined
>> > > > +       in specifications, manuals, and algorithm descriptions. Such
>> > > > places
>> > > > +       are marked safe with a /\* octal-ok \*/ in-code comment, or with
>> > > > a
>> > > > SAF
>> > > > +       comment (see safe.json).
>> > >
>> > > Reading this, it is unclear to me why we have two ways to deviate the rule
>> > > r7.1. And more importantely, how would the developper decide which one to
>> > > use?
>> >
>> > I agree with you on this and we were discussing this topic just this
>> > morning in the FUSA community call. I think we need a way to do this
>> > with the SAF framework:
>> >
>> > if (some code with violation) /* SAF-xx-safe */
>> >
>> > This doesn't work today unfortunately. It can only be done this way:
>> >
>> > /* SAF-xx-safe */
>> > if (some code with violation)
>> >
>> > Which is not always desirable. octal-ok is just an ad-hoc solution for
>> > one specific violation but we need a generic way to do this. Luca is
>> > investigating possible ways to support the previous format in SAF.
>> 
>> Why can't we use octal-ok everywhere for now?
> 
> I think this is a good option for now, yes
> 
> 
>> My point here is to make simple for the developper to know what to 
>> use.
>> 
>> >
>> > I think we should take this patch for now and harmonize it once SAF is
>> > improved.
>> 
>> The description of the deviation needs some improvement.
> 
> +1
> 
> 
>> To give an example,
>> with the current wording, one could they can use octal-ok everywhere. 
>> But
>> above, you are implying that SAF-xx-safe should be
>> preferred.
>> 
>> I would still strongly prefer if we use octal-ok everywhere because 
>> this is
>> simple to remember. But if the other are happy to have both SAF-XX and
>> octal-ok, then the description needs to be completely unambiguous and 
>> the
>> patch should contain some explanation why we have two different ways 
>> to
>> deviate.
> 
> I think we could say "octal-ok" only and not mention SAF. As you can 
> see
> from the other messages we still have work to do on SAF to be able to
> use it the way we would like to use it.

Thanks for the feedback; I'll revise the patch to use and mention only 
octal-ok.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

