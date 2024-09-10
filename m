Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FB6972BFE
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 10:19:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795081.1204198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snw5W-0001XJ-FD; Tue, 10 Sep 2024 08:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795081.1204198; Tue, 10 Sep 2024 08:19:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snw5W-0001VH-CI; Tue, 10 Sep 2024 08:19:02 +0000
Received: by outflank-mailman (input) for mailman id 795081;
 Tue, 10 Sep 2024 08:19:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W0jq=QI=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1snw5U-0001V7-4y
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 08:19:00 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5414a060-6f4d-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 10:18:58 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 0B0DA4EE079F;
 Tue, 10 Sep 2024 10:18:58 +0200 (CEST)
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
X-Inumbo-ID: 5414a060-6f4d-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725956338; bh=P4P802atmWrONJVIQ4E/yrpmCCsY9FgAk3kEJdllJ44=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mruDDkm8LEggYpZvGTHmGDTia/BBZAs4ZwB4a7pBI3EUNw81MaEyrbBY3IE7tJ2xJ
	 kE8D/+Q8coOapoffj2lKCByP8Q+zHPxG+XfuO5GUvUoMIRN5dfcjWrBwVtz/fe+hp7
	 0E4wp9GAXSpl1d17m4DHCr7HWtwlbxuzVvA02tzA1xvX9JD6R5Hub53duvhcRT7uB2
	 7yEpUMWvH56QYlLifoBkkJjJvvMWcLLrrcCXTZiFTlj6o00RVQdoi4Cc3C9FveVagP
	 HEiyfgZiU3XiZbdHsUSxxvPHbHguo2PbsUZ9retab7LXwy3Wj/py0AsZ7uTykc9izq
	 2s3ekDEiaLWLA==
MIME-Version: 1.0
Date: Tue, 10 Sep 2024 10:18:58 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2] automation/eclair_analysis: deviate linker symbols
 for Rule 18.2
In-Reply-To: <c10ce0ba-dd51-4d3e-8ab9-62ee1b39cd31@suse.com>
References: <e3a9c3268685562ae557248d6e76376579d99715.1725714006.git.nicola.vetrini@bugseng.com>
 <b0599929-d6f7-48f8-b93c-4b4882225da9@suse.com>
 <alpine.DEB.2.22.394.2409092141570.3672@ubuntu-linux-20-04-desktop>
 <c10ce0ba-dd51-4d3e-8ab9-62ee1b39cd31@suse.com>
Message-ID: <4423feb68c0d94bef0fdf79e0cb8feab@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-09-10 08:26, Jan Beulich wrote:
> On 10.09.2024 06:46, Stefano Stabellini wrote:
>> On Mon, 9 Sep 2024, Jan Beulich wrote:
>>> On 07.09.2024 15:03, Nicola Vetrini wrote:
>>>> +   * - R18.2
>>>> +     - Subtraction between pointers encapsulated by macro 
>>>> page_to_mfn
>>>> +       are safe.
>>>> +     - Tagged as `safe` for ECLAIR.
>>> 
>>> This one is a result of using frame_table[], aiui. Alternative 
>>> approaches
>>> were discussed before. Did that not lead anywhere, requiring a purely
>>> textual / configurational deviation?
>> 
>> During the last MISRA discussion we agree that this was an acceptable
>> approach. What else did you have in mind?
> 
> One was to have the linker scripts provide the symbol. I think there 
> were
> one or two more, yet I - perhaps wrongly - haven't been taking notes 
> ...
> 

One thing I'm fairly sure has been suggested for symbols that were not 
linker-defined is the following mitigation:

gcc -fsanitize=address,pointer-subtract
ASAN_OPTIONS=detect_invalid_pointer_pairs=2 ./a.out

See GCC manual Section "3.12 Program Instrumentation Options"
https://gcc.gnu.org/onlinedocs/gcc-12.1.0/gcc.pdf


>> In any case, keep in mind that
>> exploring options is a task in itself and we could use our efforts on
>> reducing the numbers of violations instead which I think is more 
>> useful.
> 
> Sure. Otoh quickest is not always best.
> 


-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

