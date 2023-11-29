Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 922837FD1B1
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 10:08:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643765.1004235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8GXX-00063B-7B; Wed, 29 Nov 2023 09:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643765.1004235; Wed, 29 Nov 2023 09:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8GXX-00061L-4M; Wed, 29 Nov 2023 09:07:27 +0000
Received: by outflank-mailman (input) for mailman id 643765;
 Wed, 29 Nov 2023 09:07:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qQo/=HK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r8GXV-0005zO-EF
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 09:07:25 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5dc9c59-8e96-11ee-98e3-6d05b1d4d9a1;
 Wed, 29 Nov 2023 10:07:24 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id E32644EE0737;
 Wed, 29 Nov 2023 10:07:23 +0100 (CET)
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
X-Inumbo-ID: b5dc9c59-8e96-11ee-98e3-6d05b1d4d9a1
MIME-Version: 1.0
Date: Wed, 29 Nov 2023 10:07:23 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper3
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Xen Devel
 <xen-devel@lists.xenproject.org>
Subject: Re: MISRA: Compatible declarations for sort and bsearch
In-Reply-To: <alpine.DEB.2.22.394.2311281923170.3533093@ubuntu-linux-20-04-desktop>
References: <f60a702c838c3274cf9e1193964222f4@bugseng.com>
 <ca540835e3cce50a852fdf2b3956205a@bugseng.com>
 <b3e14bf0-def2-4e1c-83f6-a94a203c7b8d@suse.com>
 <5ebb62b5485bb1a0c4e805af6580ab6d@bugseng.com>
 <alpine.DEB.2.22.394.2311281923170.3533093@ubuntu-linux-20-04-desktop>
Message-ID: <e2db57f8c40cedae1ac768255d7c28fa@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-29 04:26, Stefano Stabellini wrote:
> On Mon, 27 Nov 2023, Nicola Vetrini wrote:
>> > > /*
>> > >   * TODO: make first_valid_mfn static when NUMA is supported on Arm, this
>> > >   * is required because the dummy helpers are using it.
>> > >   */
>> > > extern mfn_t first_valid_mfn;
>> > >
>> > > it should probably be deviated.
>> >
>> > NUMA work is still in progress for Arm, I think, so I'd rather wait with
>> > deviating.
>> >
>> 
>> +Stefano
>> 
>> I can leave it as is, if that's indeed going to become static at some 
>> point.
> 
> I see the point in waiting given the TODO comment, but I wouldn't want
> this issue to be the only thing standing between us and zero violation
> of Rule 8.4 on ARM. So I think we should add SAF to the comment and
> remove it when not necessary any longer.

Ok, thanks.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

