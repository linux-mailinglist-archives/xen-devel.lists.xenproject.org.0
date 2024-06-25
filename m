Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED69915F0C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 08:47:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747259.1154616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLzxN-00065t-F9; Tue, 25 Jun 2024 06:47:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747259.1154616; Tue, 25 Jun 2024 06:47:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLzxN-00063g-CI; Tue, 25 Jun 2024 06:47:09 +0000
Received: by outflank-mailman (input) for mailman id 747259;
 Tue, 25 Jun 2024 06:47:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sQf/=N3=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sLzxM-0004zo-MT
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 06:47:08 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd340412-32be-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 08:47:07 +0200 (CEST)
Received: from [172.20.10.8] (unknown [37.161.81.3])
 by support.bugseng.com (Postfix) with ESMTPSA id 7FB294EE0738;
 Tue, 25 Jun 2024 08:47:06 +0200 (CEST)
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
X-Inumbo-ID: bd340412-32be-11ef-b4bb-af5377834399
Message-ID: <31ed9bcf-dc5b-41d1-9931-e6be70e3fe71@bugseng.com>
Date: Tue, 25 Jun 2024 08:47:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 01/13] automation/eclair: fix deviation of MISRA C
 Rule 16.3
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1719218291.git.federico.serafini@bugseng.com>
 <c43a32405cc949ef5bf26a2ca1d1cc7ee7f5e664.1719218291.git.federico.serafini@bugseng.com>
 <1149f3da-480e-4949-924b-6cdf39b1e17f@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <1149f3da-480e-4949-924b-6cdf39b1e17f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/06/24 12:57, Jan Beulich wrote:
> On 24.06.2024 11:04, Federico Serafini wrote:
>> Escape the final dot of the comment and extend the search of a
>> fallthrough comment up to 2 lines after the last statement.
>>
>> Fixes: a128d8da913b21eff6c6d2e2a7d4c54c054b78db "automation/eclair: add deviations for MISRA C:2012 Rule 16.3"
> 
> Nit: Yes, the respective doc says "at least 12 digits", but please also keep
> at that going forward.

Noted.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

