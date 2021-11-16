Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B88CE452E88
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 10:58:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226230.390868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmvDd-0002Bl-FT; Tue, 16 Nov 2021 09:57:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226230.390868; Tue, 16 Nov 2021 09:57:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmvDd-0002AG-CK; Tue, 16 Nov 2021 09:57:37 +0000
Received: by outflank-mailman (input) for mailman id 226230;
 Tue, 16 Nov 2021 09:57:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mmvDb-0002AA-MR
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 09:57:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mmvDa-0000Os-Gn; Tue, 16 Nov 2021 09:57:34 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[10.85.43.125])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mmvDa-0000d9-Ae; Tue, 16 Nov 2021 09:57:34 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=0Lo2epoeWzoqHOe36PCsxxoloWugAJ3vHvDiVqsFtbc=; b=0nrWWdCBvJ+YoIbjy1U5mfmyt0
	Fdm4NYFTyUwpdfNYW3HbHZCRFmRre3sBAUv+CwDSP/cxy4mLp+2r6EmLqoM+6YgqFwnnJcyfskehR
	l2D+VMoBV+cj5AQx6jcQxoy0hyVg8GtJDkEzDfujHs2LHCYT0Wt4blSTqca0RE8Wi0LA=;
Message-ID: <3fb62abf-5a72-fd70-3130-2505b8b42aad@xen.org>
Date: Tue, 16 Nov 2021 09:57:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [XEN][RFC PATCH v4 1/1] Update libfdt to v1.6.1
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Luca Fancellu <luca.fancellu@arm.com>,
 Vikram Garhwal <fnu.vikram@xilinx.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, bertrand.marquis@arm.com,
 volodymyr_babchuk@epam.com
References: <1636702040-116895-1-git-send-email-fnu.vikram@xilinx.com>
 <1636702040-116895-2-git-send-email-fnu.vikram@xilinx.com>
 <AE30D3B0-0863-465C-AFBC-8DEB28919A8A@arm.com>
 <alpine.DEB.2.22.394.2111121400280.1412361@ubuntu-linux-20-04-desktop>
 <57d10284-cbd0-2867-2c09-9f1f7824d938@xen.org>
 <alpine.DEB.2.22.394.2111151415020.1412361@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2111151415020.1412361@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefano,

On 16/11/2021 03:15, Stefano Stabellini wrote:
> On Mon, 15 Nov 2021, Julien Grall wrote:
>> On 12/11/2021 22:01, Stefano Stabellini wrote:
>>> On Fri, 12 Nov 2021, Luca Fancellu wrote:
>>>>> On 12 Nov 2021, at 07:27, Vikram Garhwal <fnu.vikram@xilinx.com> wrote:
>>>>>
>>>>> Update libfdt to v1.6.1 of libfdt taken from
>>>>> git://github.com/dgibson/dtc.
>>>>> This update is done to support device tree overlays.
>>>>>
>>>>> A few minor changes are done to make it compatible with Xen:
>>>>>      fdt_overlay.c: overlay_fixup_phandle()
>>>>>
>>>>>          Replace strtoul() with simple_strtoul() as strtoul() is not
>>>>> available in
>>>>>          Xen lib and included lib.h.
>>>>>
>>>>>          Change char *endptr to const char *endptr. This change is
>>>>> required for
>>>>>          using simple_strtoul().
>>>>>
>>>>>      libfdt_env.h:
>>>>>          Remaining Xen changes to libfdt_env.h carried over from existing
>>>>>          libfdt (v1.4.0)
>>>>
>>>> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
>>>>
>>>> I’ve also tested it on FVP and on a Juno board, starting few guests and it
>>>> worked.
>>>>
>>>> Tested-by: Luca Fancellu <luca.fancellu@arm.com>
>>>
>>> Thanks Luca! The patch also passes the gitlab-ci tests and looks OK to
>>> me. I'll let Julien ack it as he was the one with a couple of comments
>>> before.
>>
>> The next version addressed my comments. So:
>>
>> Reviewed-by: Julien Grall <jgrall@amazon.com>
>>
>> I have also queued the patch in a temporary branch for-next/4.17:
>>
>> https://xenbits.xen.org/gitweb/?p=people/julieng/xen-unstable.git;a=shortlog;h=refs/heads/for-next/4.17
>>
>> The patch will land in staging when the tree re-opens.
> 
> Hey Julien,
> 
> Thanks for that!
> 
> Do you think it would make sense to keep "for-next/4.17" under
> xen-integration [1] so that we can easily trigger gitlab-ci runs on it?

It would be good to have gitlab-ci running on the branch. However...

> 
> I cannot setup an automatic mirror of your branch on xen-integration
> because xen-integration is already mirroring upstream xen.git. For now,
> I have just manually pushed:
> https://gitlab.com/xen-project/fusa/xen-integration/-/tree/for-next/4.17
> 
> Which triggered (all green):
> https://gitlab.com/xen-project/fusa/xen-integration/-/pipelines/409417946
> 
> FYI you should have full rights to push and make edits on
> xen-integration.

... AFAICT the tree can be edited by non-committers as well. I don't 
expect anyone in the list to mess up with the branch, but part of me 
would prefer if only you and I can modify it.

That said, I can push manually to xen-integration to trigger the CI 
everytime we need to update it.

Cheers,

-- 
Julien Grall

