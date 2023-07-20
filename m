Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C9875AE88
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 14:37:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566586.885600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMStr-0001ge-2r; Thu, 20 Jul 2023 12:36:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566586.885600; Thu, 20 Jul 2023 12:36:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMStq-0001dg-Vp; Thu, 20 Jul 2023 12:36:54 +0000
Received: by outflank-mailman (input) for mailman id 566586;
 Thu, 20 Jul 2023 12:36:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o2HW=DG=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qMStp-0001da-Oa
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 12:36:53 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a2099c4-26fa-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 14:36:51 +0200 (CEST)
Received: from [192.168.1.101] (unknown [37.162.143.190])
 by support.bugseng.com (Postfix) with ESMTPSA id E84D64EE0C89;
 Thu, 20 Jul 2023 14:36:50 +0200 (CEST)
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
X-Inumbo-ID: 1a2099c4-26fa-11ee-8611-37d641c3527e
Message-ID: <22263163-d3f3-eacd-1adc-0fb254ee618b@bugseng.com>
Date: Thu, 20 Jul 2023 14:36:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] x86/mtrr: address violations of MISRA C:2012 Rule 8.3
 on parameter types
Content-Language: en-US, it
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <76dba3f8a6a7bc12f15a9e4fc8c73826a08e4b5c.1689849810.git.federico.serafini@bugseng.com>
 <ZLklfgA3grgWIT7u@MacBook-Air-de-Roger.local>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <ZLklfgA3grgWIT7u@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 20/07/23 14:15, Roger Pau Monné wrote:
> On Thu, Jul 20, 2023 at 12:48:36PM +0200, Federico Serafini wrote:
>> +extern uint32_t get_pat_flags(struct vcpu *v, uint32_t gl1e_flags,
>> +                              paddr_t gpaddr, paddr_t spaddr,
>> +															uint8_t gmtrr_mtype);
> 
> Wrong usage of hard tabs.
> 
> Thanks, Roger.

Sorry, some update must have changed the settings of my editor.
Thanks for reporting.

Regards
-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

