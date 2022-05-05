Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE57151BF88
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 14:36:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322103.543308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmaid-0007Pb-DI; Thu, 05 May 2022 12:36:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322103.543308; Thu, 05 May 2022 12:36:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmaid-0007Mw-AZ; Thu, 05 May 2022 12:36:31 +0000
Received: by outflank-mailman (input) for mailman id 322103;
 Thu, 05 May 2022 12:36:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pu9C=VN=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nmaic-0007Mq-GZ
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 12:36:30 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id ec2723ab-cc6f-11ec-8fc4-03012f2f19d4;
 Thu, 05 May 2022 14:36:25 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24CC5106F;
 Thu,  5 May 2022 05:36:05 -0700 (PDT)
Received: from [10.57.3.137] (unknown [10.57.3.137])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B86543F885;
 Thu,  5 May 2022 05:36:03 -0700 (PDT)
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
X-Inumbo-ID: ec2723ab-cc6f-11ec-8fc4-03012f2f19d4
Message-ID: <5f7e5a83-0944-8464-564a-51d7a4d19c55@arm.com>
Date: Thu, 5 May 2022 14:35:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 2/2] xen: add support for initializing xenstore later
 as HVM domain
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, boris.ostrovsky@oracle.com
Cc: xen-devel@lists.xenproject.org, Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.22.394.2205041717070.43560@ubuntu-linux-20-04-desktop>
 <20220505002304.401417-2-sstabellini@kernel.org>
 <ca690076-dbbf-0f57-5e8b-af7bc6a9a14b@arm.com>
 <b19b0e49-d89b-7f94-0206-e85909fdc149@suse.com>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <b19b0e49-d89b-7f94-0206-e85909fdc149@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 05.05.2022 14:29, Juergen Gross wrote:
>>> -        /* Avoid truncation on 32-bit. */
>>> +        if (v == ~0ULL) {
>> No need for brackets for a single instruction.
> 
> The coding style says otherwise:
> 
>   This does not apply if only one branch of a conditional statement is a single
>   statement; in the latter case use braces in both branches:
> 
>   .. code-block:: c
> 
>         if (condition) {
>                 do_this();
>                 do_that();
>         } else {
>                 otherwise();
>         }
> 
> 
Good to know. So Luca, you can omit this comment.

> Juergen

Cheers,
Michal

