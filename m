Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FD14C6C9C
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 13:34:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280498.478449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOfDi-0005Xz-Vs; Mon, 28 Feb 2022 12:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280498.478449; Mon, 28 Feb 2022 12:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOfDi-0005Vk-ST; Mon, 28 Feb 2022 12:33:42 +0000
Received: by outflank-mailman (input) for mailman id 280498;
 Mon, 28 Feb 2022 12:33:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=py4b=TL=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nOfDi-0005Ve-Ca
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 12:33:42 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a8ee2a16-9892-11ec-8eba-a37418f5ba1a;
 Mon, 28 Feb 2022 13:33:41 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7048D106F;
 Mon, 28 Feb 2022 04:33:40 -0800 (PST)
Received: from [10.57.19.230] (unknown [10.57.19.230])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 02D523F73D;
 Mon, 28 Feb 2022 04:33:38 -0800 (PST)
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
X-Inumbo-ID: a8ee2a16-9892-11ec-8eba-a37418f5ba1a
Subject: Re: [PATCH] xen/arm32: head: Mark the end of subroutines with ENDPROC
 (take two)
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220228100740.60332-1-julien@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <ab9157d3-db7c-3eee-7145-fc2479779576@arm.com>
Date: Mon, 28 Feb 2022 13:33:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220228100740.60332-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Julien,

On 28.02.2022 11:07, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Commit 2ac705a59ef5 ("xen/arm32: head: Mark the end of subroutines
> with ENDPROC") intended to mark all the subroutines with ENDPROC.
> 
> Unfortunately, I missed fail(), switch_ttbr(), init_uart() and
> __lookup_processor_type(). Add ENDPROC for the benefits of
> static analysis tools and the reader.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---

I checked and it seems like you covered them all now.

Reviewed-by: Michal Orzel <michal.orzel@arm.com>

Cheers,
Michal

