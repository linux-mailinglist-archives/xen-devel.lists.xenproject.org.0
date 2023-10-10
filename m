Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C527BFBDA
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 14:55:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615044.956193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqCGT-0000fO-1u; Tue, 10 Oct 2023 12:55:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615044.956193; Tue, 10 Oct 2023 12:55:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqCGS-0000cd-VR; Tue, 10 Oct 2023 12:55:08 +0000
Received: by outflank-mailman (input) for mailman id 615044;
 Tue, 10 Oct 2023 12:55:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c+X1=FY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qqCGR-0000bM-3J
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 12:55:07 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b7292c8-676c-11ee-9b0d-b553b5be7939;
 Tue, 10 Oct 2023 14:55:04 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 62B094EE0737;
 Tue, 10 Oct 2023 14:55:04 +0200 (CEST)
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
X-Inumbo-ID: 3b7292c8-676c-11ee-9b0d-b553b5be7939
MIME-Version: 1.0
Date: Tue, 10 Oct 2023 14:55:04 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, Paul
 Durrant <paul@xen.org>, George Dunlap <george.dunlap@citrix.com>, Wei Liu
 <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 8/9] xen/types: address Rule 10.1 for
 DECLARE_BITMAP use
In-Reply-To: <22895e24-b051-447a-b944-6ff173b0a790@xen.org>
References: <cover.1696514677.git.nicola.vetrini@bugseng.com>
 <9642dcb4ab51ec9eaeedf16056fbcd946a3efbea.1696514677.git.nicola.vetrini@bugseng.com>
 <80101145-1958-457a-8c80-cae816ae74aa@xen.org>
 <4b144869407871011c538af48b311c31@bugseng.com>
 <354c6138-509e-4106-9a27-3c75c85b85e5@xen.org>
 <alpine.DEB.2.22.394.2310061746190.3431292@ubuntu-linux-20-04-desktop>
 <d90524b8-70ee-457e-8d6a-9e69f135b81d@xen.org>
 <alpine.DEB.2.22.394.2310091803060.3431292@ubuntu-linux-20-04-desktop>
 <f9a24504-97e7-4a2e-8601-8e4672b45f88@xen.org>
 <eda6269602e89abf5bd1e23cc81d0528@bugseng.com>
 <bcc81d48-fafb-417a-a609-d6e0c17daf99@xen.org>
 <22895e24-b051-447a-b944-6ff173b0a790@xen.org>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <dbe64dec40acdb0944fc42f3983ace31@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/2023 14:15, Julien Grall wrote:
> On 10/10/2023 13:13, Julien Grall wrote:
>> 
>> 
>> On 10/10/2023 13:07, Nicola Vetrini wrote:
>>> 
>>>>>>> 
>>>>>>> I agree on everything Julien's wrote and I was about to suggest 
>>>>>>> to use a
>>>>>>> SAF comment to suppress the warning because it is clearer than a 
>>>>>>> int
>>>>>>> cast.
>>>>>>> 
>>>>>>> But then I realized that even if BITS_TO_LONGS was fixed, 
>>>>>>> wouldn't still
>>>>>>> we have a problem because IOMMU_FEAT_count is an enum?
>>>>>>> 
>>>>>>> Is it the case that IOMMU_FEAT_count would have to be cast 
>>>>>>> regardless,
>>>>>>> either to int or unsigned int or whatever to be used in 
>>>>>>> DECLARE_BITMAP?
>>>>>>> 
>>>>>>> 
>>>>>>> So we have 2 problems here: one problem is DECLARE_BITMAP taking 
>>>>>>> int
>>>>>>> instead of unsigned int, and another problem is IOMMU_FEAT_count 
>>>>>>> being
>>>>>>> an enum.
>>>>>>> 
>>>>>>> If I got it right, then I would go with the cast to int (like 
>>>>>>> done in
>>>>>>> this patch) with a decent comment on top of it.
>>>>>> 
>>>>>> I might be missing something here. But why should we use cast 
>>>>>> rather than /*
>>>>>> SAF-X */ just above? I would have expected we wanted to highlight 
>>>>>> the
>>>>>> violation rather than hiding it.
>>>>> 
>>>>> My understanding is that the cast is required when converting an 
>>>>> enum
>>>>> type to an integer type and vice versa. The idea is that we 
>>>>> shouldn't do
>>>>> implicit conversions as they are error prone, only explicit 
>>>>> conversions
>>>>> are allowed between enum and integers.
>>>> 
>>>> We have a lot of places in Xen using implicit conversion from enum 
>>>> to
>>>> integer (for instance in the P2M code for p2m_type_t). Does ECLAIR
>>>> report all of them? If not, then why?
>>>> 
>>> 
>>> Can you give some pointers as to where this enum is used in 
>>> arithmetic operations?
>> 
>> I can't think of any right now.
> 
> Obviously, right after I pressed send, I remember of one in
> __acpi_map_table() (x86 code).
> 
> FIX_ACPI_END is an enum, assigned to an 'int' and then used in 
> arithmetics.
> 
> Cheers,

A couple of remarks:
- that file is part of the exclude-list.json, therefore it's not bound 
to be MISRA compliant
   right now;
- assignment to a different essential type category is dealt with by 
Rule 10.3
   (The value of an expression shall not be assigned to an object with a 
narrower
    essential type or of a different essential type category), so perhaps
   Luca's script does indeed capture it with gcc compilation flags.

Aside from this, if you feel that a deviation comment is a better 
choice, I'm ok with
dealing with it in this way.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

