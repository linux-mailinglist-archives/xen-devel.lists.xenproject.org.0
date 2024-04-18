Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3068A9344
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 08:40:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707950.1106417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxLRr-0003JO-Na; Thu, 18 Apr 2024 06:40:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707950.1106417; Thu, 18 Apr 2024 06:40:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxLRr-0003H8-Jm; Thu, 18 Apr 2024 06:40:43 +0000
Received: by outflank-mailman (input) for mailman id 707950;
 Thu, 18 Apr 2024 06:40:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QcTt=LX=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rxLRp-0003FM-FX
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 06:40:41 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90108e2a-fd4e-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 08:40:36 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id D9DE84EE073C;
 Thu, 18 Apr 2024 08:40:35 +0200 (CEST)
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
X-Inumbo-ID: 90108e2a-fd4e-11ee-94a3-07e782e9044d
MIME-Version: 1.0
Date: Thu, 18 Apr 2024 08:40:35 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 federico.serafini@bugseng.com, consulting@bugseng.com
Subject: Re: docs/misra: add R21.6 R21.14 R21.15 R21.16
In-Reply-To: <alpine.DEB.2.22.394.2404171411280.2257106@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2404161227340.2257106@ubuntu-linux-20-04-desktop>
 <b76bc307-6cf6-443f-80de-d27852ede25f@xen.org>
 <alpine.DEB.2.22.394.2404171208410.2257106@ubuntu-linux-20-04-desktop>
 <b93c39de-5b8d-4589-909c-4f7d1d2dfdc9@xen.org>
 <alpine.DEB.2.22.394.2404171411280.2257106@ubuntu-linux-20-04-desktop>
Message-ID: <9b5af11169f17103752a1c6798e4be89@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-04-17 23:13, Stefano Stabellini wrote:
> +Bugseng
> 
> On Wed, 17 Apr 2024, Julien Grall wrote:
>> Hi Stefano,
>> 
>> On 17/04/2024 20:10, Stefano Stabellini wrote:
>> > On Wed, 17 Apr 2024, Julien Grall wrote:
>> > > Hi Stefano,
>> > >
>> > > On 16/04/2024 20:27, Stefano Stabellini wrote:
>> > > > Also add two specific project-wide deviations for R21.6 and R21.15.
>> > >
>> > > In general, I am fine with add the two rules. However...
>> > >
>> > > >
>> > > > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> > > >
>> > > > diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>> > > > index 32b02905d1..9123c8edb5 100644
>> > > > --- a/docs/misra/deviations.rst
>> > > > +++ b/docs/misra/deviations.rst
>> > > > @@ -387,6 +387,22 @@ Deviations related to MISRA C:2012 Rules:
>> > > >           of the Rule due to uses of this macro.
>> > > >         - Tagged as `deliberate` for ECLAIR.
>> > > >    +   * - R21.6
>> > > > +     - The use of snprintf() and vsnprintf() is justifiable as, despite
>> > > > +       the fact that such functions have the same names of the
>> > > > +       corresponding standard library functions, each configuration of
>> > > > +       Xen has a unique implementation for them; the code implementing
>> > > > +       such functions is subject to the analysis, so that any undefined
>> > > > +       or unspecified behavior associated to them falls under the
>> > > > +       responsibility of other MISRA guidelines
>> > > > +     - Tagged as `safe` for ECLAIR.
>> > >
>> > > ... this implies that ECLAIR should be modified. But this is not happening
>> > > in
>> > > this patch. Looking at history, we tend to keep deviations.rst in sync
>> > > with
>> > > ECLAIR, so I think it should be updated here too.
>> >
>> > That is true but I am not very familiar with Eclair config language so
>> > it is better if that is done by the Bugseng team. I can merge their
>> > patch into this one or vice versa or they could be committed separately
>> > (keep in mind that the rule is not enabled in the ECLAIR scan so from a
>> > Gitlab-CI point of view we don't require the change to the ECLAIR config
>> > although it makes sense). I am happy either way.
>> 
>> My comment was not about Gitlab CI. It was more about consistency 
>> between the
>> file and ECLAIR. I think they should be kept in sync because it 
>> explain how
>> the tool doing the scanning behave.
>> 
>> My preference is to either split and only commit the rules now or wait 
>> for the
>> ECLAIR change to happen.
> 
> Understood. Maybe the Bugseng team can provide the corresponding
> ECLAIR/deviations.ecl changes

Sure, we can respin the patch with the appropriate deviation in place.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

