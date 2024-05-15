Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A08728C6132
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 09:10:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721941.1125659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s78ld-0007NT-5a; Wed, 15 May 2024 07:09:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721941.1125659; Wed, 15 May 2024 07:09:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s78ld-0007Lw-1K; Wed, 15 May 2024 07:09:37 +0000
Received: by outflank-mailman (input) for mailman id 721941;
 Wed, 15 May 2024 07:09:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=opSn=MS=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1s78lb-0007Ig-EV
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 07:09:35 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1460df76-128a-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 09:09:33 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 5FF4A4EE0738;
 Wed, 15 May 2024 09:09:32 +0200 (CEST)
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
X-Inumbo-ID: 1460df76-128a-11ef-b4bb-af5377834399
MIME-Version: 1.0
Date: Wed, 15 May 2024 09:09:32 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 bertrand.marquis@arm.com, julien@xen.org, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH 03/10] automation/eclair_analysis: deviate macro
 count_args_ for MISRA Rule 20.7
In-Reply-To: <alpine.DEB.2.22.394.2405011254290.497719@ubuntu-linux-20-04-desktop>
References: <cover.1713885065.git.nicola.vetrini@bugseng.com>
 <7de407c218f0911e28b7c3f609a55636165166a8.1713885065.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2404241727520.3940@ubuntu-linux-20-04-desktop>
 <5b675fcdf688723bc6d4ea260d10004e@bugseng.com>
 <alpine.DEB.2.22.394.2405011254290.497719@ubuntu-linux-20-04-desktop>
Message-ID: <006e9d571de6383679ab7fdb84dfcdd7@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-05-01 21:54, Stefano Stabellini wrote:
> On Mon, 29 Apr 2024, Nicola Vetrini wrote:
>> On 2024-04-25 02:28, Stefano Stabellini wrote:
>> > On Tue, 23 Apr 2024, Nicola Vetrini wrote:
>> > > The count_args_ macro violates Rule 20.7, but it can't be made
>> > > compliant with Rule 20.7 without breaking its functionality. Since
>> > > it's very unlikely for this macro to be misused, it is deviated.
>> >
>> > That is OK but can't we use the SAF- framework to do it, given that it
>> > is just one macro?
>> >
>> > If not, this is also OK.
>> >
>> >
>> 
>> It would be more fragile, for no substantial gain
> 
> OK
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Hi,

I think this patch slipped through the cracks. I see it only has 
Stefano's R-by, so perhaps it needs a further ack?

Thanks,

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

