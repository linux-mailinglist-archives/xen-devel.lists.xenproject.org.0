Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 631678A8D70
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 23:05:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707758.1105995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxCT1-0005FB-Vp; Wed, 17 Apr 2024 21:05:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707758.1105995; Wed, 17 Apr 2024 21:05:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxCT1-0005CP-Sx; Wed, 17 Apr 2024 21:05:19 +0000
Received: by outflank-mailman (input) for mailman id 707758;
 Wed, 17 Apr 2024 21:05:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rxCT0-0005CJ-Gk
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 21:05:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rxCT0-0006U9-1l; Wed, 17 Apr 2024 21:05:18 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rxCSz-0005wk-Pn; Wed, 17 Apr 2024 21:05:17 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=ANszKmXADJPhZZVjMQoNSYOeDB/LblVcFxw92o/FOgc=; b=NAo0uJHyGJwK4Dc6weSoI73JZm
	Z5yqAYvZroJgd27zTgUn1TCORZ+0rdJTSNdkSFlpJ6Z5vOLDTYaOhjGL/417E+AbNZzC6N9QX4bJo
	e0J2RXwUIrnl8EbSUiNcdKHe4L48ICGnjLqiTbJQQZESj8xVnuEXaseX3ajPUxZ6FiCc=;
Message-ID: <b93c39de-5b8d-4589-909c-4f7d1d2dfdc9@xen.org>
Date: Wed, 17 Apr 2024 22:05:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: docs/misra: add R21.6 R21.14 R21.15 R21.16
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <alpine.DEB.2.22.394.2404161227340.2257106@ubuntu-linux-20-04-desktop>
 <b76bc307-6cf6-443f-80de-d27852ede25f@xen.org>
 <alpine.DEB.2.22.394.2404171208410.2257106@ubuntu-linux-20-04-desktop>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2404171208410.2257106@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 17/04/2024 20:10, Stefano Stabellini wrote:
> On Wed, 17 Apr 2024, Julien Grall wrote:
>> Hi Stefano,
>>
>> On 16/04/2024 20:27, Stefano Stabellini wrote:
>>> Also add two specific project-wide deviations for R21.6 and R21.15.
>>
>> In general, I am fine with add the two rules. However...
>>
>>>
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>>
>>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>>> index 32b02905d1..9123c8edb5 100644
>>> --- a/docs/misra/deviations.rst
>>> +++ b/docs/misra/deviations.rst
>>> @@ -387,6 +387,22 @@ Deviations related to MISRA C:2012 Rules:
>>>           of the Rule due to uses of this macro.
>>>         - Tagged as `deliberate` for ECLAIR.
>>>    +   * - R21.6
>>> +     - The use of snprintf() and vsnprintf() is justifiable as, despite
>>> +       the fact that such functions have the same names of the
>>> +       corresponding standard library functions, each configuration of
>>> +       Xen has a unique implementation for them; the code implementing
>>> +       such functions is subject to the analysis, so that any undefined
>>> +       or unspecified behavior associated to them falls under the
>>> +       responsibility of other MISRA guidelines
>>> +     - Tagged as `safe` for ECLAIR.
>>
>> ... this implies that ECLAIR should be modified. But this is not happening in
>> this patch. Looking at history, we tend to keep deviations.rst in sync with
>> ECLAIR, so I think it should be updated here too.
> 
> That is true but I am not very familiar with Eclair config language so
> it is better if that is done by the Bugseng team. I can merge their
> patch into this one or vice versa or they could be committed separately
> (keep in mind that the rule is not enabled in the ECLAIR scan so from a
> Gitlab-CI point of view we don't require the change to the ECLAIR config
> although it makes sense). I am happy either way.

My comment was not about Gitlab CI. It was more about consistency 
between the file and ECLAIR. I think they should be kept in sync because 
it explain how the tool doing the scanning behave.

My preference is to either split and only commit the rules now or wait 
for the ECLAIR change to happen.

Cheers,

-- 
Julien Grall

