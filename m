Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8020A33011B
	for <lists+xen-devel@lfdr.de>; Sun,  7 Mar 2021 14:01:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94509.178098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIt1J-0002i9-Bx; Sun, 07 Mar 2021 13:00:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94509.178098; Sun, 07 Mar 2021 13:00:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIt1J-0002hk-8I; Sun, 07 Mar 2021 13:00:29 +0000
Received: by outflank-mailman (input) for mailman id 94509;
 Sun, 07 Mar 2021 13:00:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lIt1I-0002hf-4o
 for xen-devel@lists.xenproject.org; Sun, 07 Mar 2021 13:00:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lIt1D-00037L-UG; Sun, 07 Mar 2021 13:00:23 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lIt1D-0005U2-Ku; Sun, 07 Mar 2021 13:00:23 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=urjHlxySHDzp7Wmm/LEClvYh+cIsf2+1hiRjHBN50ME=; b=OjJDnrf0NfvZB0UyD/FlI+WYx8
	x0K8sPLvcIv0zKAz3IqohzxEXNym3jJXJ8/mEh1PA7OSiyHhgaAFchLSUZ9dvmiMrNDcMZHY3ofqc
	VrrDKllGgi2oEMEzJgRsO9BQeJDW88CGhVo/zaYBzNtAvJttpylcLcPbV7KPoe8W7wyw=;
Subject: Re: [PATCH for-4.15] xen: Bump the minimum version of GCC supported
 to 4.9 (5.1 on arm64)
To: xen-devel@lists.xenproject.org, famzheng@amazon.com
Cc: sstabellini@kernel.org, cardoe@cardoe.com, wl@xen.org,
 Bertrand.Marquis@arm.com, andrew.cooper3@citrix.com
References: <161507188317.11025.6744028462008264481@c667a6b167f6>
From: Julien Grall <julien@xen.org>
Message-ID: <af575951-9d48-09da-d120-a6120ca29ead@xen.org>
Date: Sun, 7 Mar 2021 13:00:21 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <161507188317.11025.6744028462008264481@c667a6b167f6>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 06/03/2021 23:04, no-reply@patchew.org wrote:
> Hi,
> 
> Patchew automatically ran gitlab-ci pipeline with this patch (series) applied, but the job failed. Maybe there's a bug in the patches?
> 
> You can find the link to the pipeline near the end of the report below:
> 
> Type: series
> Message-id: 20210306214148.27021-1-julien@xen.org
> Subject: [PATCH for-4.15] xen: Bump the minimum version of GCC supported to 4.9 (5.1 on arm64)
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> sleep 10
> patchew gitlab-pipeline-check -p xen-project/patchew/xen
> === TEST SCRIPT END ===
> 
> warning: redirecting to https://gitlab.com/xen-project/patchew/xen.git/
> warning: redirecting to https://gitlab.com/xen-project/patchew/xen.git/
>  From https://gitlab.com/xen-project/patchew/xen
>   * [new tag]               patchew/20210306214148.27021-1-julien@xen.org -> patchew/20210306214148.27021-1-julien@xen.org
> Switched to a new branch 'test'
> f332859b88 xen: Bump the minimum version of GCC supported to 4.9 (5.1 on arm64)
> 
> === OUTPUT BEGIN ===
> [2021-03-06 21:45:17] Looking up pipeline...
> [2021-03-06 21:45:18] Found pipeline 266507477:
> 
> https://gitlab.com/xen-project/patchew/xen/-/pipelines/266507477
> 
> [2021-03-06 21:45:18] Waiting for pipeline to finish...
> [2021-03-06 22:00:21] Still waiting...
> [2021-03-06 22:15:26] Still waiting...
> [2021-03-06 22:30:31] Still waiting...
> [2021-03-06 22:45:35] Still waiting...
> [2021-03-06 23:00:41] Still waiting...
> [2021-03-06 23:04:42] Pipeline failed
> [2021-03-06 23:04:42] Job 'qemu-smoke-x86-64-clang-pvh' in stage 'test' is skipped
> [2021-03-06 23:04:42] Job 'qemu-smoke-x86-64-gcc-pvh' in stage 'test' is skipped
> [2021-03-06 23:04:42] Job 'qemu-smoke-x86-64-clang' in stage 'test' is skipped
> [2021-03-06 23:04:42] Job 'qemu-smoke-x86-64-gcc' in stage 'test' is skipped
> [2021-03-06 23:04:42] Job 'qemu-smoke-arm64-gcc' in stage 'test' is skipped
> [2021-03-06 23:04:42] Job 'qemu-alpine-arm64-gcc' in stage 'test' is skipped
> [2021-03-06 23:04:42] Job 'build-each-commit-gcc' in stage 'test' is skipped
> [2021-03-06 23:04:42] Job 'alpine-3.12-clang' in stage 'build' is failed

The following jobs are failing:

alpine-3.12-clang [1]
debian-unstable-32-gcc-debug
debian-unstable-clang
debian-unstable-gcc-randconfig
ubuntu-bionic-clang

Cloning into 'qemu-xen-dir-remote.tmp'...
error: inflate: data stream error (incorrect data check)
fatal: serious inflate inconsistency
fatal: index-pack failed

This looks unrelated to my patch. Possibly a network error?

=========

centos-7-2-gcc [2]
centos-7-2-gcc-debug
centos-7-gcc
centos-7-gcc-debug

Centos 7 is using GCC 4.8.5. This patch is bumping the minimum version 
to 4.9. So the failure is expected.

We may have to disable the jobs if my patch goes ahead. May I ask why we 
chose to build on Centos 7?


==========

ubuntu-trusty-gcc [3]
ubuntu-trusty-gcc-debug

Ubuntu trusty is using GCC 4.8.4. This patch is bumping the minimum 
version to 4.9. So the failure is expected. We may have to disable the 
jobs if my patch goes ahead. May I ask why we chose to build on Ubuntu 
trusty?


Cheers,

[1] https://gitlab.com/xen-project/patchew/xen/-/jobs/1078273595
[2] https://gitlab.com/xen-project/patchew/xen/-/jobs/1078273539
[3] https://gitlab.com/xen-project/patchew/xen/-/jobs/1078273575


> === OUTPUT END ===
> 
> Test command exited with code: 1
> 

-- 
Julien Grall

