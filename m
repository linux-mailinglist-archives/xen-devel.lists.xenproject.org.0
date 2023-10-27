Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E90DB7D8FED
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 09:34:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624265.972688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwHMa-00014a-EN; Fri, 27 Oct 2023 07:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624265.972688; Fri, 27 Oct 2023 07:34:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwHMa-00011z-Ab; Fri, 27 Oct 2023 07:34:36 +0000
Received: by outflank-mailman (input) for mailman id 624265;
 Fri, 27 Oct 2023 07:34:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FcCJ=GJ=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qwHMZ-00011t-Ft
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 07:34:35 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45aa59c8-749b-11ee-9b0e-b553b5be7939;
 Fri, 27 Oct 2023 09:34:33 +0200 (CEST)
Received: from [192.168.1.9] (net-188-218-250-245.cust.vodafonedsl.it
 [188.218.250.245])
 by support.bugseng.com (Postfix) with ESMTPSA id 8B11E4EE073E;
 Fri, 27 Oct 2023 09:34:32 +0200 (CEST)
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
X-Inumbo-ID: 45aa59c8-749b-11ee-9b0e-b553b5be7939
Message-ID: <2445a4b6-74c4-49c9-8373-e788da443a0a@bugseng.com>
Date: Fri, 27 Oct 2023 09:34:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 00/10] address violations of MISRA C:2012 Directive
 4.10
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <cover.1694510856.git.simone.ballarin@bugseng.com>
 <e642bc2a-cefa-4ee4-6394-3c10102e8164@suse.com>
 <alpine.DEB.2.22.394.2310190915590.1945130@ubuntu-linux-20-04-desktop>
 <6374f0f4-d58f-83ca-6eb3-d5a9fcbac525@suse.com>
 <alpine.DEB.2.22.394.2310201622160.2356865@ubuntu-linux-20-04-desktop>
 <36e6dd08-918c-9791-0dab-ca75d4b98d7e@suse.com>
 <alpine.DEB.2.22.394.2310231346370.3516@ubuntu-linux-20-04-desktop>
 <af4a86bc-40d3-4363-adc8-30981652cd2b@xen.org>
 <c1fa350f-6f49-e2b1-0cda-dec99df415ae@suse.com>
 <alpine.DEB.2.22.394.2310241254480.271731@ubuntu-linux-20-04-desktop>
 <f546b8dc-baa8-c178-12be-70f7c1a8fec8@suse.com>
 <50b3a500-aa7d-4d3d-8bcf-220f8ee69b0e@xen.org>
 <f6b207c6-4bc2-e172-428c-a2e3294cc490@suse.com>
 <1fc2c191-79b7-43fc-9068-5605e741c243@xen.org>
 <alpine.DEB.2.22.394.2310251408030.271731@ubuntu-linux-20-04-desktop>
 <1ec482ba-e334-3120-dbe5-fc1e5a29f9fe@suse.com>
 <alpine.DEB.2.22.394.2310261550370.271731@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <alpine.DEB.2.22.394.2310261550370.271731@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/10/23 00:50, Stefano Stabellini wrote:
> On Thu, 26 Oct 2023, Jan Beulich wrote:
>> On 25.10.2023 23:12, Stefano Stabellini wrote:
>>> On Wed, 25 Oct 2023, Julien Grall wrote:
>>>> On 25/10/2023 17:01, Jan Beulich wrote:
>>>>> On 25.10.2023 17:58, Julien Grall wrote:
>>>>>> On 25/10/2023 09:18, Jan Beulich wrote:
>>>>>>> On 24.10.2023 21:59, Stefano Stabellini wrote:
>>>>>>>> If I understood correctly I am fine with that. To make sure we are all
>>>>>>>> on the same page, can you provide a couple of samples?
>>>>>>>
>>>>>>> Taking the earlier example, instead of DRIVERS_PASSTHROUGH_VTD_DMAR_H it
>>>>>>> would then be VTD_DMAR_H. arch/x86/pv/mm.h would use PV_MM_H, but then
>>>>>>> you can already see that a hypothetical arch/x86/mm.h would use
>>>>>>> X86_MM_H,
>>>>>>> thus colliding with what your proposal would also yield for
>>>>>>> arch/x86/include/asm/mm.h. So maybe private header guards should come
>>>>>>> with e.g. a trailing underscore? Or double underscores as component
>>>>>>> separators, where .../include/... use only single underscores? Or
>>>>>>> headers in arch/*/include/asm/ use ASM_<name>_H (i.e. not making the
>>>>>>> architecture explicit in the guard name, on the grounds that headers
>>>>>>> from multiple architectures shouldn't be included at the same time)?
>>>>>> Thanks for providing some details.  The proposal for private headers
>>>>>> make sense. For arch/.../include/asm/ headers, I would strongly prefer
>>>>>> if we use prefix them with ASM_*.
>>>>>>
>>>>>> As a side note, I am guessing for asm-generic, we would want to use
>>>>>> ASM_GENERIC_* for the guard prefix. Is that correct?
>>>>>
>>>>> That was an assumption I was working from, yes. Could also be just
>>>>> GENERIC_ afaic.
>>>>
>>>> Thanks for the confirmation. I am fine with either GENERIC_ or ASM_GENERIC_.
>>>
>>> OK. So in summary:
>>> - arch/.../include/asm/ headers would use ASM_<filename>_H
>>> - private headers would use <dir>_<filename>_H
>>> - asm-generic headers would use ASM_GENERIC_<filename>_H
>>>
>>> If that's agreed, we can move forward with the patch following this
>>> scheme.
>>
>> FTAOD - just as long as <dir> is clarified to mean only the leaf-most
>> directory component (assuming we're still talking about the most
>> recently proposed scheme and we deem the risk of collisions low enough
>> there).
> 
> Yes, that's what I meant.

Ok, I'll work on the patch using this schema.

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


