Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 360269C6D1F
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 11:48:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835339.1251200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBAvA-0006Gb-TJ; Wed, 13 Nov 2024 10:48:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835339.1251200; Wed, 13 Nov 2024 10:48:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBAvA-0006Ec-Qb; Wed, 13 Nov 2024 10:48:24 +0000
Received: by outflank-mailman (input) for mailman id 835339;
 Wed, 13 Nov 2024 10:48:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LXmd=SI=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1tBAv9-0006EW-9w
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 10:48:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cade1663-a1ac-11ef-a0c7-8be0dac302b0;
 Wed, 13 Nov 2024 11:48:18 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 463034EE073E;
 Wed, 13 Nov 2024 11:48:17 +0100 (CET)
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
X-Inumbo-ID: cade1663-a1ac-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE2Mi41NS4xMzEuNDciLCJoZWxvIjoic3VwcG9ydC5idWdzZW5nLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImNhZGUxNjYzLWExYWMtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDk0ODk4LjQyMzI0LCJzZW5kZXIiOiJhbGVzc2FuZHJvLnp1Y2NoZWxsaUBidWdzZW5nLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1731494897; bh=4xRF34YDWpBwJXXJq775mkZUgaV+16BSQdBnSairluc=;
	h=Date:From:To:Cc:Subject:Reply-To:In-Reply-To:References:From;
	b=ke453FUHHE4+MUxI4hRHlmpJG0S1jq1fpnmbP6EaTvr1icIofmhB/jU2Xd5AsrX0N
	 /QOoBNTrPpT8BTS1x3CygnByMEdR7ckB4MlgTzi7VQJaU2rFIUU/T5+VXyu1uTzySZ
	 JorIpaOdhmgDqoTIwThNvMkdAOYYtQke8rj1SbjnorXh4SMfiHH+hRQu5HV9S73uSI
	 xEjkel9/6/akWds5yrSOZZvndp4L28q+65Ff6VSrI8XJXMZjchJ8BL5V/XFnx6XiI6
	 gWFdrLKjaCDHuwtf505JVXuyhhJtWry6B6hM4+/6zA8OuF4TLN4xlDRuRyN0moPE3t
	 VZXLM4uqQrfTg==
MIME-Version: 1.0
Date: Wed, 13 Nov 2024 11:48:17 +0100
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen:add deviations for MISRA C 2012 Rule R5.2
Reply-To: alessandro.zucchelli@bugseng.com
Mail-Reply-To: alessandro.zucchelli@bugseng.com
In-Reply-To: <39168f90-7c80-451d-9c20-50da0de4af78@suse.com>
References: <41a1127e6d77d2be350e7679bd1034e0c2918e94.1731487210.git.alessandro.zucchelli@bugseng.com>
 <39168f90-7c80-451d-9c20-50da0de4af78@suse.com>
Message-ID: <3789df92285b2c08b855369f46f3a229@bugseng.com>
X-Sender: alessandro.zucchelli@bugseng.com
Organization: BUGSENG Srl
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,
At this link you can see all the violations of Rule 5.2:

https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/bugseng/xen/ECLAIR_normal/40_characters/X86_64/8143097084/PROJECT.ecd;/by_service/MC3R1.R5.2.html

By deviating the two macros CHECK_NAME_ and DEFINE_COMPAT_HANDLE all the 
violations are addressed.

On 2024-11-13 11:31, Jan Beulich wrote:
> On 13.11.2024 09:41, Alessandro Zucchelli wrote:
>> This addresses violations of MISRA C:2012 Rule 5.2 which states as
>> following: Identifiers declared in the same scope and name space shall
>> be distinct.
>> 
>> This deviation addresses violations of Rule 5.2 arising from
>> identifiers generated through token pasting macros CHECK_NAME_ and
>> DEFINE_COMPAT_HANDLE.
> 
> For each of the two, can you provide an example of where collisions
> result? At least for the latter I can't even see how that would
> work without the compiler complaining (i.e. the build breaking).
> 
> Jan

-- 
Alessandro Zucchelli, B.Sc.

Software Engineer, BUGSENG (https://bugseng.com)

