Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 485428B6E21
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 11:23:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714662.1115938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1jhB-00007q-GB; Tue, 30 Apr 2024 09:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714662.1115938; Tue, 30 Apr 2024 09:22:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1jhB-00004q-CJ; Tue, 30 Apr 2024 09:22:41 +0000
Received: by outflank-mailman (input) for mailman id 714662;
 Tue, 30 Apr 2024 09:22:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Ppc=MD=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1s1jhA-0008WM-0Q
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 09:22:40 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fe3d3f4-06d3-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 11:22:38 +0200 (CEST)
Received: from [192.168.1.11] (host-79-60-221-62.business.telecomitalia.it
 [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id F24394EE0738;
 Tue, 30 Apr 2024 11:22:37 +0200 (CEST)
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
X-Inumbo-ID: 2fe3d3f4-06d3-11ef-909b-e314d9c70b13
Message-ID: <fe6f66dd-f2b2-40aa-9290-0313e80ea391@bugseng.com>
Date: Tue, 30 Apr 2024 11:22:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging | b819bd65
To: Jan Beulich <jbeulich@suse.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6630a5ea2588_2c1971e1c10965b@gitlab-sidekiq-catchall-v2-ddbc855b7-4zkpr.mail>
 <892ad877-2576-4ce5-9110-47fa5f1fdb06@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <892ad877-2576-4ce5-9110-47fa5f1fdb06@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/04/24 11:00, Jan Beulich wrote:
> On 30.04.2024 10:03, GitLab wrote:
>>
>>
>> Pipeline #1272869158 has failed!
>>
>> Project: xen ( https://gitlab.com/xen-project/hardware/xen )
>> Branch: staging ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging )
>>
>> Commit: b819bd65 ( https://gitlab.com/xen-project/hardware/xen/-/commit/b819bd65f4fb25be582f66ba2e4134f61d86f459 )
>> Commit Message: revert "x86/mm: re-implement get_page_light() u...
>> Commit Author: Jan Beulich ( https://gitlab.com/jbeulich )
>>
>>
>> Pipeline #1272869158 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/1272869158 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
>> had 3 failed jobs.
>>
>> Job #6745823842 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/6745823842/raw )
>>
>> Stage: test
>> Name: adl-pci-hvm-x86-64-gcc-debug
>> Job #6745823720 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/6745823720/raw )
>>
>> Stage: analyze
>> Name: eclair-x86_64
> 
> This flags start_nested_{svm,vmx}() as regressions, when the regression was
> previously spotted already. Is that intended? I.e. shouldn't the comparison
> be to the previous pipeline run, such that issues are pointed out only for
> what is actually being added anew with the patch / batch under test?
> 
>> Job #6745823721 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/6745823721/raw )
>>
>> Stage: analyze
>> Name: eclair-ARM64
> 
> Similarly this appears to point out regressions which were previously spotted.

A patch to make ECLAIR analysis *not* allowed to fail has been sent.
It will also solve the issue you are pointing out.
Thanks for reporting it.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

