Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1018966A7
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 09:37:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700334.1093302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrvAk-0003Kk-J2; Wed, 03 Apr 2024 07:36:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700334.1093302; Wed, 03 Apr 2024 07:36:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrvAk-0003Ia-Fs; Wed, 03 Apr 2024 07:36:38 +0000
Received: by outflank-mailman (input) for mailman id 700334;
 Wed, 03 Apr 2024 07:36:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PE2n=LI=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rrvAi-0003IU-5V
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 07:36:36 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e529315b-f18c-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 09:36:34 +0200 (CEST)
Received: from [192.168.1.18] (host-82-59-164-46.retail.telecomitalia.it
 [82.59.164.46])
 by support.bugseng.com (Postfix) with ESMTPSA id 4294E4EE0739;
 Wed,  3 Apr 2024 09:36:33 +0200 (CEST)
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
X-Inumbo-ID: e529315b-f18c-11ee-a1ef-f123f15fe8a2
Message-ID: <06883269-6b7e-45cb-81f7-75baf4e85628@bugseng.com>
Date: Wed, 3 Apr 2024 09:36:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 5/7] xen/sched: address a violation of MISRA C:2012
 Rule 16.3
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1712042178.git.federico.serafini@bugseng.com>
 <dcb134b4094104632b05270f01accebcf7c04c4e.1712042178.git.federico.serafini@bugseng.com>
 <4fa4c9e5-4948-4636-a58a-1a21a076d47f@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <4fa4c9e5-4948-4636-a58a-1a21a076d47f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/04/24 08:55, Jan Beulich wrote:
> On 02.04.2024 09:22, Federico Serafini wrote:
>> Add break statement to address a violation of MISRA C:2012 Rule 16.3
>> ("An unconditional `break' statement shall terminate every
>> switch-clause ").
>>
>> No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> However, this is the 2nd patch in this series with exactly the same title.
> Going just from titles, one option would be to fold both. The other option
> would be to change the title prefix of patch 3 to "xen/credit2:".

I'll go for the first option.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

