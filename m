Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F334C6E66
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 14:40:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280572.478560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOgFs-0000Si-B0; Mon, 28 Feb 2022 13:40:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280572.478560; Mon, 28 Feb 2022 13:40:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOgFs-0000Q6-7T; Mon, 28 Feb 2022 13:40:00 +0000
Received: by outflank-mailman (input) for mailman id 280572;
 Mon, 28 Feb 2022 13:39:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=py4b=TL=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nOgFq-0000Q0-A1
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 13:39:58 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id ea1e127b-989b-11ec-8eba-a37418f5ba1a;
 Mon, 28 Feb 2022 14:39:57 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BA671042;
 Mon, 28 Feb 2022 05:39:55 -0800 (PST)
Received: from [10.57.19.230] (unknown [10.57.19.230])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 353393F73D;
 Mon, 28 Feb 2022 05:39:54 -0800 (PST)
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
X-Inumbo-ID: ea1e127b-989b-11ec-8eba-a37418f5ba1a
Subject: Re: [PATCH v2] xen/arm32: head: Don't set r12 and update the
 documentation
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220228133536.57004-1-julien@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <33590325-765c-334e-27e9-f8e6122d6dad@arm.com>
Date: Mon, 28 Feb 2022 14:39:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220228133536.57004-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Julien,

On 28.02.2022 14:35, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Since commit 54c4ae18d158 ("xen/arm32: head: Rework and document
> launch()"), the boot code is setting r12 but not read it.
> 
> So remove the two instructions setting r12 and update the documentation
> to show r12 has no specific purpose.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
>     Changes in v2:
>         - Don't set r12.
> ---

Reviewed-by: Michal Orzel <michal.orzel@arm.com>

Cheers,
Michal

