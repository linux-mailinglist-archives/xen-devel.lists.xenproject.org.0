Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DF99CDD41
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 12:09:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837124.1253044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBuBe-0005Wk-Gx; Fri, 15 Nov 2024 11:08:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837124.1253044; Fri, 15 Nov 2024 11:08:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBuBe-0005UH-EF; Fri, 15 Nov 2024 11:08:26 +0000
Received: by outflank-mailman (input) for mailman id 837124;
 Fri, 15 Nov 2024 11:08:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=62fI=SK=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1tBuBc-0005Tv-4a
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 11:08:24 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebb3e723-a341-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 12:08:19 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id CAD0C4EE073E;
 Fri, 15 Nov 2024 12:08:18 +0100 (CET)
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
X-Inumbo-ID: ebb3e723-a341-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE2Mi41NS4xMzEuNDciLCJoZWxvIjoic3VwcG9ydC5idWdzZW5nLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImViYjNlNzIzLWEzNDEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjY4ODk5Ljc3Mzg5Nywic2VuZGVyIjoiYWxlc3NhbmRyby56dWNjaGVsbGlAYnVnc2VuZy5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1731668898; bh=1aY84lPzsOS3IBkwv1Cw0rGgmCE1xiEfUXLDjPoETC0=;
	h=Date:From:To:Cc:Subject:Reply-To:In-Reply-To:References:From;
	b=Hak4fhAcv3Ff5MSz6BO/ljd7J8L/8+eEc7mVRoYz6vjNjbuJUBXACg5dOsgLVafLE
	 4RAbqwhfNZKS9ikeNm/WFPqrJ/oKLMzXRlYQeMPwCocjjSQ5Gu6Rb4k0v1+M+h0ngY
	 +vomS1CrkzdrTE6MiXuDQDIithAYrpZBy0VzCDO/DQosUScJX11mGCA7AXA5I56l/m
	 sViqwAiZWEHj2cBxc15F58KZ6wsebxiqpieViPbpmBEHrCsWZ64Z+8AHYdpWJWCvfG
	 KWF+LKJY1IG0RQRI47U3rS7bMjs95IKmv/lMw8dX4cnfR+hDqBfHpY5ca41icYAQwP
	 /HytKLIwbjwzQ==
MIME-Version: 1.0
Date: Fri, 15 Nov 2024 12:08:18 +0100
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, consulting@bugseng.com, Simone Ballarin
 <simone.ballarin@bugseng.com>, xen-devel@lists.xenproject.org, Doug
 Goldstein <cardoe@cardoe.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen:add deviations for MISRA C 2012 Rule R5.2
Reply-To: alessandro.zucchelli@bugseng.com
Mail-Reply-To: alessandro.zucchelli@bugseng.com
In-Reply-To: <alpine.DEB.2.22.394.2411131822260.222505@ubuntu-linux-20-04-desktop>
References: <41a1127e6d77d2be350e7679bd1034e0c2918e94.1731487210.git.alessandro.zucchelli@bugseng.com>
 <39168f90-7c80-451d-9c20-50da0de4af78@suse.com>
 <3789df92285b2c08b855369f46f3a229@bugseng.com>
 <24b117ed-dd5a-47a7-8c5d-ddddd7407ac9@suse.com>
 <alpine.DEB.2.22.394.2411131822260.222505@ubuntu-linux-20-04-desktop>
Message-ID: <0fa9be78162b596c69da6c1bf840364e@bugseng.com>
X-Sender: alessandro.zucchelli@bugseng.com
Organization: BUGSENG Srl
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-11-14 03:23, Stefano Stabellini wrote:
> On Wed, 13 Nov 2024, Jan Beulich wrote:
>> On 13.11.2024 11:48, Alessandro Zucchelli wrote:
>> > At this link you can see all the violations of Rule 5.2:
>> >
>> > https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/bugseng/xen/ECLAIR_normal/40_characters/X86_64/8143097084/PROJECT.ecd;/by_service/MC3R1.R5.2.html
>> 
>> Thank you. From a cursory look these all appear to be a result of the 
>> 40
>> chars limit we put in place (quite arbitrarily). That's not mentioned 
>> at
>> all ...
>> 
>> > By deviating the two macros CHECK_NAME_ and DEFINE_COMPAT_HANDLE all the
>> > violations are addressed.
>> >
>> > On 2024-11-13 11:31, Jan Beulich wrote:
>> >> On 13.11.2024 09:41, Alessandro Zucchelli wrote:
>> >>> This addresses violations of MISRA C:2012 Rule 5.2 which states as
>> >>> following: Identifiers declared in the same scope and name space shall
>> >>> be distinct.
>> >>>
>> >>> This deviation addresses violations of Rule 5.2 arising from
>> >>> identifiers generated through token pasting macros CHECK_NAME_ and
>> >>> DEFINE_COMPAT_HANDLE.
>> 
>> ... in the description.
>> 
>> Together with the 5.4 patch having the same lack of context, I wonder
>> whether we shouldn't simply up that limit.
> 
> Yes: if we up to the limit to 64 (another arbitrary number), can be 
> mark
> both 5.4 and 5.1 as clean? If so, I think we should do it right away.
> 
Hi,
In doc/misra/rules.rst, the limit is documented as 40, but in the 
configuration
file automation/eclair_analysis/ECLAIR/toolchain.ecl, it is set to 63.

If you intend to proceed by increasing the limit, you may ignore this 
deviation
as well as my other deviation concerning Rule 5.4. In that case, please 
update
the documentation in doc/misra/rules.rst to reflect the new limit.

> 
>> Or else, as suggested there,
>> to instead exclude such derived identifiers. After all the derived 
>> ones
>> will be distinct as long as what they're derived from is distinct.
>> 
>> Finally - please don't top-post.
>> 
>> Jan
>> 
>> >> For each of the two, can you provide an example of where collisions
>> >> result? At least for the latter I can't even see how that would
>> >> work without the compiler complaining (i.e. the build breaking).

-- 
Alessandro Zucchelli, B.Sc.

Software Engineer, BUGSENG (https://bugseng.com)

