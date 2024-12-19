Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6069F77D1
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 09:58:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860912.1272891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOCMG-0003Q6-EV; Thu, 19 Dec 2024 08:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860912.1272891; Thu, 19 Dec 2024 08:58:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOCMG-0003Mw-Bo; Thu, 19 Dec 2024 08:58:12 +0000
Received: by outflank-mailman (input) for mailman id 860912;
 Thu, 19 Dec 2024 08:58:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b6Cw=TM=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tOCME-0003Mq-Na
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 08:58:11 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e53c79a-bde7-11ef-a0d7-8be0dac302b0;
 Thu, 19 Dec 2024 09:58:09 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 0498E4EE073E;
 Thu, 19 Dec 2024 09:58:07 +0100 (CET)
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
X-Inumbo-ID: 5e53c79a-bde7-11ef-a0d7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1734598688; bh=DJWjUrAB1oGSVS7h+LROqv3bN/0cH+/2/vj2UzHtJr4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=upSLlDEpdjTJ6bveO3TRM0s68huj6WVUcXzdimqadjMv/xdMNt5YxzQqdtQjLCmVu
	 ZC6cI2kRZvla4JuoFPpyQo4cKP4REO+1N6YzTV90LiUcmSg2uiAdWE4TOzxhrh8rbE
	 FMI1F7zcus2eOLugBuJpvR5L8dJ+DjWWdM/NZL63T+ROPwhov+JoiKRnhJajsUt1dk
	 RBi3c1isvUSaMC+o1M1u4svx0J0OxiSvAG3Ibgc3WzVcE+Ds21jqGhpeGEq+uRcULc
	 Zzm/XvCbhRkAxbkxplf8ubysrsbSwP0IpQc1vqggER12KCeLbxJdUmGvqltFvRkvR9
	 Ri+Rp7MU2Yusg==
MIME-Version: 1.0
Date: Thu, 19 Dec 2024 09:58:07 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
 consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, Doug
 Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2] misra: add deviation for MISRA C Rule R11.8.
In-Reply-To: <d312a46a-238a-4fa3-84d7-4836c610c8ea@suse.com>
References: <7e4f836606d72769a80299c5451f6f7241471d8a.1734530952.git.alessandro.zucchelli@bugseng.com>
 <d312a46a-238a-4fa3-84d7-4836c610c8ea@suse.com>
Message-ID: <58439457588e585b08b48931e94754b2@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-12-19 09:49, Jan Beulich wrote:
> On 18.12.2024 15:25, Alessandro Zucchelli wrote:
>> Rule 11.8 states as following: "A cast shall not remove any `const' or
>> `volatile' qualification from the type pointed to by a pointer".
>> 
>> Function `__hvm_copy' in `xen/arch/x86/hvm/hvm.c' is a double-use
>> function, where the parameter needs to not be const because it can be
>> set for write or not. As it was decided a new const-only function will
>> lead to more developer confusion than it's worth, this violation is
>> addressed by deviating the function.
>> All cases of casting away const-ness are accompanied with a comment
>> explaining why it is safe given the other flags passed in; such 
>> comment is used
>> by the deviation in order to match the appropriate function call.
>> 
>> No functional change.
>> 
>> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
>> ---

>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -393,6 +393,12 @@ Fixing this violation would require to increase 
>> code complexity and lower readab
>>  
>> -config=MC3R1.R11.8,reports+={safe,"any_area(any_loc(any_exp(macro(^container_of$))))"}
>>  -doc_end
>> 
>> +-doc_begin="Function __hvm_copy in xen/arch/x86/hvm/hvm.c is a 
>> double-use
>> +function, where the parameter needs to not be const because it can be 
>> set for
>> +write or not"
>> +-config=MC3A2.R11.8,reports+={safe,"any_area(any_loc(text(^.*__hvm_copy.*HVMCOPY_to_guest 
>> doesn't modify.*$)))"}
> 
> This is probably good enough for now, yet still: It constrains 
> re-formatting
> that we may want to do on such function calls. Personally I'd consider 
> it
> entirely unexpected if I ended up (re)introducing a violation just by 
> re-
> formatting one of those function calls to
> 
>     return __hvm_copy(
>                (void *)buf /* HVMCOPY_to_guest doesn't modify */,
>                addr, size, current, HVMCOPY_to_guest | HVMCOPY_linear,
>                PFEC_page_present | PFEC_write_access | pfec, pfinfo);
> 
> yet aiui the pattern above would have this effect (I don't think .* 
> matches
> newlines; instead I expect such regex-es to be applied to individual 
> lines
> only). Thoughts anyone?
> 

Hi Jan,

we can simply drop the "__hvm_copy" part from the regex. The regex can 
be made multiline, or alternatively we can apply the search to a range 
of lines. By default it searches on the same location mentioned by the 
report, which in this case is the line containing __hvm_copy (range 
defaults to 0..0). However I would leave it either as is or without the 
__hvm_copy prefix.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

