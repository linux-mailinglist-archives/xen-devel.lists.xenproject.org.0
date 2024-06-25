Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF7291607C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 09:54:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747366.1154755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM10Q-0006Y1-2G; Tue, 25 Jun 2024 07:54:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747366.1154755; Tue, 25 Jun 2024 07:54:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM10P-0006W2-W1; Tue, 25 Jun 2024 07:54:21 +0000
Received: by outflank-mailman (input) for mailman id 747366;
 Tue, 25 Jun 2024 07:54:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sQf/=N3=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sM10P-0006Vr-25
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 07:54:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2046af3b-32c8-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 09:54:19 +0200 (CEST)
Received: from [10.176.134.80] (unknown [160.78.253.181])
 by support.bugseng.com (Postfix) with ESMTPSA id 404804EE0738;
 Tue, 25 Jun 2024 09:54:18 +0200 (CEST)
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
X-Inumbo-ID: 2046af3b-32c8-11ef-b4bb-af5377834399
Message-ID: <52875aea-fceb-47d5-b970-d16972f9765a@bugseng.com>
Date: Tue, 25 Jun 2024 09:54:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 11/13] x86/pmtimer: address a violation of MISRA C
 Rule 16.3
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1719218291.git.federico.serafini@bugseng.com>
 <fea205262d4f7b337b804a013d0f1c411a721b46.1719218291.git.federico.serafini@bugseng.com>
 <97889584-4bf3-4cd1-9fd5-92b673b39d77@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <97889584-4bf3-4cd1-9fd5-92b673b39d77@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/06/24 17:43, Jan Beulich wrote:
> On 24.06.2024 11:04, Federico Serafini wrote:
>> Add missing break statement to address a violation of MISRA C Rule 16.3
>> ("An unconditional `break' statement shall terminate every
>> switch-clause").
>>
>> No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> I'm curious though on what basis you decided to split this off of
> patch 7, ...
> 
>> ---
>>   xen/arch/x86/hvm/pmtimer.c | 1 +
>>   1 file changed, 1 insertion(+)
> 
> ... touching various other files under xen/arch/x86/hvm/.

Looking at the log I found some commits where the component
name was made explicit.
I can squash it into patch 7 in a v3.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

