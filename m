Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D91A9320FD
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 09:11:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759350.1169041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTcKw-00015y-Ll; Tue, 16 Jul 2024 07:10:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759350.1169041; Tue, 16 Jul 2024 07:10:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTcKw-00014T-J2; Tue, 16 Jul 2024 07:10:58 +0000
Received: by outflank-mailman (input) for mailman id 759350;
 Tue, 16 Jul 2024 07:10:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=liZX=OQ=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sTcKv-00014N-4k
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2024 07:10:57 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ba91498-4342-11ef-bbfb-fd08da9f4363;
 Tue, 16 Jul 2024 09:10:56 +0200 (CEST)
Received: from [10.176.133.251] (unknown [160.78.253.158])
 by support.bugseng.com (Postfix) with ESMTPSA id CC4B04EE073C;
 Tue, 16 Jul 2024 09:10:55 +0200 (CEST)
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
X-Inumbo-ID: 8ba91498-4342-11ef-bbfb-fd08da9f4363
Message-ID: <ceebe9da-15b3-4d80-937f-9d8ac814a563@bugseng.com>
Date: Tue, 16 Jul 2024 09:10:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 5/9] x86/traps: address violations of MISRA C Rule
 16.3
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1721050709.git.federico.serafini@bugseng.com>
 <d16e294e1cbd74001c1ca276023d13f66f4ec0d3.1721050709.git.federico.serafini@bugseng.com>
 <5b3c9818-9ac5-49ae-9ae6-fb96a0410297@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <5b3c9818-9ac5-49ae-9ae6-fb96a0410297@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/07/24 09:08, Jan Beulich wrote:
> On 15.07.2024 18:48, Federico Serafini wrote:
>> Add break or pseudo keyword fallthrough to address violations of
>> MISRA C Rule 16.3: "An unconditional `break' statement shall terminate
>> every switch-clause".
>>
>> No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> And my A-b was lost? Please can you be more diligent in collecting tags,
> helping committers?

You are right, sorry Jan.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

