Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8AA9C6D53
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 12:03:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835381.1251251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBB9r-0003x3-15; Wed, 13 Nov 2024 11:03:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835381.1251251; Wed, 13 Nov 2024 11:03:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBB9q-0003vI-U2; Wed, 13 Nov 2024 11:03:34 +0000
Received: by outflank-mailman (input) for mailman id 835381;
 Wed, 13 Nov 2024 11:03:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZFwE=SI=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1tBB9p-0003vC-St
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 11:03:33 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea42c155-a1ae-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 12:03:30 +0100 (CET)
Received: from [192.168.1.113] (93-36-216-241.ip62.fastwebnet.it
 [93.36.216.241])
 by support.bugseng.com (Postfix) with ESMTPSA id 31E934EE073E;
 Wed, 13 Nov 2024 12:03:29 +0100 (CET)
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
X-Inumbo-ID: ea42c155-a1ae-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE2Mi41NS4xMzEuNDciLCJoZWxvIjoic3VwcG9ydC5idWdzZW5nLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImVhNDJjMTU1LWExYWUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDk1ODEwLjEyNTMyMiwic2VuZGVyIjoiZmVkZXJpY28uc2VyYWZpbmlAYnVnc2VuZy5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1731495809; bh=mMNm0qgI8mqfe7FAQY2Z8Nys2gA2oyNfp4n2WhDSpOI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=wtMcPZa7VmZzt7UJC6dGXai2UBuKu68ntwytoRHObnGLpv2k5PjEhH3yQi3C2eye/
	 1bSa29/fnIHe7LoM8drw7capx5anL5vBsCf4sigd2OQM3vilDX+Xvk+viLCtkoBhf3
	 uoU+dFL+pei55EbYN0Sm9/wUZapME99GglY+dtrIbIhl9VGQEosaHFKFuS6AgDb1Wx
	 +t50igu7lvMvhzGO6vMj4BWE8M1YFfGJWbefjEssrz+OpwdNuEU/lM5Uy3mQ9c4PSN
	 TVp1abmnn+E5F1dn2AUQA3OUbFed0bgamaHx2sGtyVIM6Fi011Cjuyxa7bRaGtxZlv
	 U7aU4NJCvyU2w==
Message-ID: <4d9d499e-c797-49c1-87a9-abe9a1fbd92d@bugseng.com>
Date: Wed, 13 Nov 2024 12:03:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 3/3] automation/eclair: tag Rule 16.3 as clean
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1731485149.git.federico.serafini@bugseng.com>
 <30ebf4ab10923dde132f0df60bc7445dc892affe.1731485149.git.federico.serafini@bugseng.com>
 <016ab4be-b6b5-4bee-be80-11579f3d8146@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <016ab4be-b6b5-4bee-be80-11579f3d8146@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/11/24 10:57, Jan Beulich wrote:
> On 13.11.2024 09:17, Federico Serafini wrote:
>> Tag MISRA C:2012 Rule 16.3 as clean for both architectures:
>> new violations will cause a failure of the CI/CD pipeline.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> ---
>> No changes from v1.
>> ---
>>   automation/eclair_analysis/ECLAIR/tagging.ecl | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> Where did Stefano's (conditional) ack go?

I missed it, sorry.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG
Ph.D. Student, Ca' Foscari University of Venice


