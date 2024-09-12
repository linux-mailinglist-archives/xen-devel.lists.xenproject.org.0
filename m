Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FF897671A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 12:59:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797291.1207201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sohXd-0002T9-Fd; Thu, 12 Sep 2024 10:59:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797291.1207201; Thu, 12 Sep 2024 10:59:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sohXd-0002Qc-Cq; Thu, 12 Sep 2024 10:59:13 +0000
Received: by outflank-mailman (input) for mailman id 797291;
 Thu, 12 Sep 2024 10:59:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4RyJ=QK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sohXc-0002QU-3o
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 10:59:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0986067f-70f6-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 12:59:09 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 171C34EE0CA5;
 Thu, 12 Sep 2024 12:59:09 +0200 (CEST)
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
X-Inumbo-ID: 0986067f-70f6-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1726138749; bh=9EbdGAjbi+EgH+kyvyDWCCakL1rFnVGx2b0ZcGvA1sM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=smJjQAmQqQuZk0Ww06wWeewqnXf/zZI/1BVOLlhpjNrEwNooSw1uxs4yfjgnyIU6h
	 uHSimOsR2puSmgVS1EZh6e4bIlrXkKqB4zp8OzrRhoUaWivqkBm9/KZm/CFmNZVIy8
	 MIXSlQAhcUgDtSsA5SK5U4StufXsoYqD0HERFWZNP1fGrmeyqnA9+y80xV+JDIqCJK
	 V+5TiVhldhz2Yro8snM7+Mf8WNWN2S2xQB6IsKimyOL5dPlop5D9wU38Ucu1MqZUxu
	 R6WWaaJytZvVtl3HIS2888b8h8KYWlNc5M86gNFUaCyww3D4k/+EZ+qQIFCnki1cOY
	 ITcePrZ0yqyQQ==
MIME-Version: 1.0
Date: Thu, 12 Sep 2024 12:59:09 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: xen | Failed pipeline for staging | 6e7f7a0c
In-Reply-To: <c964c7f1-8953-4b18-b67a-6ab3d9c3a2c6@suse.com>
References: <66e2a27042b52_2fc0cec83515@gitlab-sidekiq-catchall-v2-74cb86846c-gh22d.mail>
 <c964c7f1-8953-4b18-b67a-6ab3d9c3a2c6@suse.com>
Message-ID: <ce3874bf3d1bfd3571c1a28012852767@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-09-12 12:20, Jan Beulich wrote:
> On 12.09.2024 10:12, GitLab wrote:
>> 
>> 
>> Pipeline #1450299635 has failed!
>> 
>> Project: xen ( https://gitlab.com/xen-project/hardware/xen )
>> Branch: staging ( 
>> https://gitlab.com/xen-project/hardware/xen/-/commits/staging )
>> 
>> Commit: 6e7f7a0c ( 
>> https://gitlab.com/xen-project/hardware/xen/-/commit/6e7f7a0c16c4d406bda6d4a900252ff63a7c5fad 
>> )
>> Commit Message: xen/x86/pvh: handle ACPI RSDT table in PVH Dom0...
>> Commit Author: Stefano Stabellini
>> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
>> 
>> 
>> Pipeline #1450299635 ( 
>> https://gitlab.com/xen-project/hardware/xen/-/pipelines/1450299635 ) 
>> triggered by Jan Beulich ( https://gitlab.com/jbeulich )
>> had 4 failed jobs.
>> 
>> Job #7805959443 ( 
>> https://gitlab.com/xen-project/hardware/xen/-/jobs/7805959443/raw )
>> 
>> Stage: build
>> Name: opensuse-tumbleweed-gcc-debug
>> Job #7805959441 ( 
>> https://gitlab.com/xen-project/hardware/xen/-/jobs/7805959441/raw )
>> 
>> Stage: build
>> Name: opensuse-tumbleweed-gcc
>> Job #7805959427 ( 
>> https://gitlab.com/xen-project/hardware/xen/-/jobs/7805959427/raw )
>> 
>> Stage: build
>> Name: ubuntu-24.04-x86_64-gcc-debug
>> Job #7805959253 ( 
>> https://gitlab.com/xen-project/hardware/xen/-/jobs/7805959253/raw )
>> 
>> Stage: analyze
>> Name: eclair-x86_64
> 
> For this one I'm afraid I once again can't make sense of the artifacts 
> that are
> saved. That is I can't spot what failed, and hence what may need 
> adjustment in
> what was committed.
> 

That's odd. I don't see any obvious failures either in the log files.
Can you try re-running it to see if it reproduces?

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

