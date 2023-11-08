Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E437E5CD5
	for <lists+xen-devel@lfdr.de>; Wed,  8 Nov 2023 19:06:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629380.981572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0mvi-0003sh-W5; Wed, 08 Nov 2023 18:05:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629380.981572; Wed, 08 Nov 2023 18:05:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0mvi-0003qE-TD; Wed, 08 Nov 2023 18:05:30 +0000
Received: by outflank-mailman (input) for mailman id 629380;
 Wed, 08 Nov 2023 18:05:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L/Mx=GV=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r0mvh-0003pp-7P
 for xen-devel@lists.xenproject.org; Wed, 08 Nov 2023 18:05:29 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65454d3d-7e61-11ee-98da-6d05b1d4d9a1;
 Wed, 08 Nov 2023 19:05:27 +0100 (CET)
Received: from [192.168.1.229] (93-36-216-194.ip62.fastwebnet.it
 [93.36.216.194])
 by support.bugseng.com (Postfix) with ESMTPSA id AE0F14EE0737;
 Wed,  8 Nov 2023 19:05:26 +0100 (CET)
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
X-Inumbo-ID: 65454d3d-7e61-11ee-98da-6d05b1d4d9a1
Message-ID: <a339d917-215c-4eb4-86f5-4ee5a8172251@bugseng.com>
Date: Wed, 8 Nov 2023 19:05:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] xen/sched: address violations of MISRA C:2012 Rule
 8.2
Content-Language: en-US, it
To: Henry Wang <Henry.Wang@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
References: <033b6f5f10e17409650dc438b22a0f0e0d5918a7.1696598833.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2310091824560.3431292@ubuntu-linux-20-04-desktop>
 <70AD5949-7F80-4671-9998-6239588EA61E@arm.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <70AD5949-7F80-4671-9998-6239588EA61E@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/23 03:26, Henry Wang wrote:
> Hi,
> 
>> On Oct 10, 2023, at 09:25, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>
>> On Mon, 9 Oct 2023, Federico Serafini wrote:
>>> Add missing parameter names. No functional change.
>>>
>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Release-acked-by: Henry Wang <Henry.Wang@arm.com>
Any chance to get an ack?

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

