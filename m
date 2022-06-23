Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CB255740F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 09:37:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354478.581595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4HOy-00016s-Bw; Thu, 23 Jun 2022 07:37:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354478.581595; Thu, 23 Jun 2022 07:37:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4HOy-00014k-8e; Thu, 23 Jun 2022 07:37:20 +0000
Received: by outflank-mailman (input) for mailman id 354478;
 Thu, 23 Jun 2022 07:37:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lCxP=W6=bugseng.com=roberto.bagnara@srs-se1.protection.inumbo.net>)
 id 1o4HOw-00014e-GA
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 07:37:18 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e3611b2-f2c7-11ec-b725-ed86ccbb4733;
 Thu, 23 Jun 2022 09:37:17 +0200 (CEST)
Received: from [10.0.0.126] (p548cac38.dip0.t-ipconnect.de [84.140.172.56])
 by support.bugseng.com (Postfix) with ESMTPSA id 612B94EE077B;
 Thu, 23 Jun 2022 09:37:15 +0200 (CEST)
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
X-Inumbo-ID: 4e3611b2-f2c7-11ec-b725-ed86ccbb4733
Message-ID: <8610703e-fd15-bba1-3bb1-cfe038f9b11c@bugseng.com>
Date: Thu, 23 Jun 2022 09:37:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.12) Gecko/20050929
 Thunderbird/1.0.7 Fedora/1.0.7-1.1.fc4 Mnenhy/0.7.3.0
Subject: Re: [PATCH 0/9] MISRA C 2012 8.1 rule fixes
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>, roberto.bagnara@bugseng.com
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <Michal.Orzel@arm.com>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, jbeulich@suse.com,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220620070245.77979-1-michal.orzel@arm.com>
 <dd016e82-2480-0e1e-6286-18b2f677dd65@suse.com>
 <74ec2158-3d19-3b2c-1e8c-fb5b30267658@arm.com>
 <d91bb4ea-41be-225e-e2fe-1b03aa06c677@suse.com>
 <C45BA6EE-6294-4C6F-ADC4-3DE7C8DA866F@arm.com>
 <68d7fb35-e4c5-e5d2-13a8-9ee1369e8dbe@suse.com>
 <BE80A241-7983-425F-9212-0957E29AA5C7@arm.com>
 <7a8d70e3-c331-426d-fe96-77bd65caade7@suse.com>
 <alpine.DEB.2.22.394.2206221212510.2157383@ubuntu-linux-20-04-desktop>
From: Roberto Bagnara <roberto.bagnara@bugseng.com>
In-Reply-To: <alpine.DEB.2.22.394.2206221212510.2157383@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi there.

Rule 8.1 only applies to C90 code, as all the violating instances are
syntax errors in C99 and later versions of the language.  So,
the following line does not contain a violation of Rule 8.1:

     unsigned x;

It does contain a violation of Directive 4.6, though, whose correct
handling depends on the intention (uint32_t, uin64_t, size_t, ...).

As a side note (still on the theme of the many ways of referring
to a concrete type) Rule 6.1 says not to use plain int for a bitfield
and using an explicitly signed or unsigned type instead.
(Note that Directive 4.6 does not apply to bitfield types.)
So

     int field1:2;

is not compliant; the following are compliant:

     signed int   field1:2;
     unsigned int field2:3;

But also the following are compliant, and we much favor
this variant as the specification of "int" buys nothing
and can even mislead someone into thinking that more bits
are reserved:

     signed   field1:2;
     unsigned field2:3;

I mention this to encourage, as a matter of style, not to add
"int" on bitfield types currently specified as "signed" or "unsigned".
Kind regards,

    Roberto

On 22/06/22 21:23, Stefano Stabellini wrote:
> +Roberto
> 
> 
> Hi Roberto,
> 
> A quick question about Rule 8.1.
> 
> 
> Michal sent a patch series to fix Xen against Rule 8.1 (here is a link
> if you are interested: https://marc.info/?l=xen-devel&m=165570851227125)
> 
> Although we all generally agree that the changes are a good thing, there
> was a question about the rule itself. Specifically, is the following
> actually a violation?
> 
>    unsigned x;
> 
> 
> Looking through the examples in the MISRA document I can see various
> instances of more confusing and obvious violations such as:
> 
>    const x;
>    extern x;
> 
> but no examples of using "unsigned" without "int". Do you know if it is
> considered a violation?
> 
> 
> Thanks!
> 
> Cheers,
> 
> Stefano
> 
> 
> 
> On Wed, 22 Jun 2022, Jan Beulich wrote:
>>>>>>> On 22.06.2022 12:25, Jan Beulich wrote:
>>>>>>>> On 20.06.2022 09:02, Michal Orzel wrote:
>>>>>>>>> This series fixes all the findings for MISRA C 2012 8.1 rule, reported by
>>>>>>>>> cppcheck 2.7 with misra addon, for Arm (arm32/arm64 - target allyesconfig).
>>>>>>>>> Fixing this rule comes down to replacing implicit 'unsigned' with explicit
>>>>>>>>> 'unsigned int' type as there are no other violations being part of that rule
>>>>>>>>> in the Xen codebase.
>>>>>>>>
>>>>>>>> I'm puzzled, I have to admit. While I agree with all the examples in the
>>>>>>>> doc, I notice that there's no instance of "signed" or "unsigned" there.
>>>>>>>> Which matches my understanding that "unsigned" and "signed" on their own
>>>>>>>> (just like "long") are proper types, and hence the omission of "int"
>>>>>>>> there is not an "omission of an explicit type".
> 
> [...]
> 
>>>>>> Neither the name of the variable nor the comment clarify that this is about
>>>>>> the specific case of "unsigned". As said there's also the fact that they
>>>>>> don't appear to point out the lack of "int" when seeing plain "long" (or
>>>>>> "long long"). I fully agree that "extern x;" or "const y;" lack explicit
>>>>>> "int".

