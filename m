Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C808856A1
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 10:40:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696287.1087087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnEtg-0005SY-WB; Thu, 21 Mar 2024 09:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696287.1087087; Thu, 21 Mar 2024 09:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnEtg-0005QS-SN; Thu, 21 Mar 2024 09:39:40 +0000
Received: by outflank-mailman (input) for mailman id 696287;
 Thu, 21 Mar 2024 09:39:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n2z5=K3=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rnEtf-0005Nx-8J
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 09:39:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eefff8be-e766-11ee-afe0-a90da7624cb6;
 Thu, 21 Mar 2024 10:39:38 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 672B24EE0748;
 Thu, 21 Mar 2024 10:39:37 +0100 (CET)
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
X-Inumbo-ID: eefff8be-e766-11ee-afe0-a90da7624cb6
MIME-Version: 1.0
Date: Thu, 21 Mar 2024 10:39:37 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn?=
 =?UTF-8?Q?=C3=A9?= <roger.pau@citrix.com>, George Dunlap
 <George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Dario
 Faggioli <dfaggioli@suse.com>, "consulting @ bugseng . com"
 <consulting@bugseng.com>
Subject: Re: [PATCH 0/7] xen/trace: Treewide API cleanup
In-Reply-To: <9a88b98aeb598b0889ab6b88fc06bdfc@bugseng.com>
References: <20240318163552.3808695-1-andrew.cooper3@citrix.com>
 <9a88b98aeb598b0889ab6b88fc06bdfc@bugseng.com>
Message-ID: <ce9a72f56826cfdbeca141227c33c633@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-03-20 12:01, Nicola Vetrini wrote:
> On 2024-03-18 17:35, Andrew Cooper wrote:
>> Rework the trace API to unify it (remove the HVM specific 
>> obfuscation), and
>> remove MISRA violations.
>> 
>> v3:
>>  * Delete TRACE_PARAM64()
>> 
>> Andrew Cooper (7):
>>   xen/trace: Introduce new API
>>   xen/credit2: Clean up trace handling
>>   xen/rt: Clean up trace handling
>>   xen/sched: Clean up trace handling
>>   xen: Switch to new TRACE() API
>>   xen/trace: Update final {__,}trace_var() users to the new API
>>   xen/trace: Drop old trace API
> 
> Hi Andrew,
> 
> thanks for the series. I'll run it trough ECLAIR when I have some spare 
> time, so that we can assess the impact especially on Rule 20.7.

Everything is fine for Rule 20.7 in a differential run with respect to 
yesterday's staging branch

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

