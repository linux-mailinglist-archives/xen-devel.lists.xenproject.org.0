Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C9F558A8D
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 23:15:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355187.582713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4UA2-00005h-6c; Thu, 23 Jun 2022 21:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355187.582713; Thu, 23 Jun 2022 21:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4UA2-0008VA-2l; Thu, 23 Jun 2022 21:14:46 +0000
Received: by outflank-mailman (input) for mailman id 355187;
 Thu, 23 Jun 2022 21:14:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lCxP=W6=bugseng.com=roberto.bagnara@srs-se1.protection.inumbo.net>)
 id 1o4UA0-0008V4-Uy
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 21:14:44 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fc18343-f339-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 23:14:42 +0200 (CEST)
Received: from [192.168.1.14] (unknown [151.63.34.150])
 by support.bugseng.com (Postfix) with ESMTPSA id DBBE44EE0778;
 Thu, 23 Jun 2022 23:14:40 +0200 (CEST)
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
X-Inumbo-ID: 7fc18343-f339-11ec-bd2d-47488cf2e6aa
Message-ID: <9f315162-f88f-9d96-04a6-480313cd83f1@bugseng.com>
Date: Thu, 23 Jun 2022 23:14:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.12) Gecko/20050929
 Thunderbird/1.0.7 Fedora/1.0.7-1.1.fc4 Mnenhy/0.7.3.0
Subject: Re: [PATCH 0/9] MISRA C 2012 8.1 rule fixes
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <Michal.Orzel@arm.com>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20220620070245.77979-1-michal.orzel@arm.com>
 <dd016e82-2480-0e1e-6286-18b2f677dd65@suse.com>
 <74ec2158-3d19-3b2c-1e8c-fb5b30267658@arm.com>
 <d91bb4ea-41be-225e-e2fe-1b03aa06c677@suse.com>
 <C45BA6EE-6294-4C6F-ADC4-3DE7C8DA866F@arm.com>
 <68d7fb35-e4c5-e5d2-13a8-9ee1369e8dbe@suse.com>
 <BE80A241-7983-425F-9212-0957E29AA5C7@arm.com>
 <7a8d70e3-c331-426d-fe96-77bd65caade7@suse.com>
 <alpine.DEB.2.22.394.2206221212510.2157383@ubuntu-linux-20-04-desktop>
 <8610703e-fd15-bba1-3bb1-cfe038f9b11c@bugseng.com>
 <3e86d233-7c9a-cd80-a744-c4bdd42ac85c@suse.com>
From: Roberto Bagnara <roberto.bagnara@bugseng.com>
In-Reply-To: <3e86d233-7c9a-cd80-a744-c4bdd42ac85c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Jan.

I know I will sound pedantic ;-)  but an important fact about
the MISRA standards is that reading the headline alone is almost
never enough.  In the specific of (advisory) Directive 4.6,
the Rationale says, among other things:

     It might be desirable not to apply this guideline when
     interfacing with The Standard Library or code outside
     the project’s control.

For this reason, size_t is typically set as an exception in the
tool configuration.  To properly deal with the many Standard Library
functions returning int, one can use a typedef named something
like "lib_int_t" to write, e.g.,

   const lib_int_t r = strncmp(...);

The lib_int_t typedef can be used with a suitable tool configuration,
just as I mentioned one would do with size_t.
Kind regards,

    Roberto

On 23/06/22 09:51, Jan Beulich wrote:
> On 23.06.2022 09:37, Roberto Bagnara wrote:
>> Rule 8.1 only applies to C90 code, as all the violating instances are
>> syntax errors in C99 and later versions of the language.  So,
>> the following line does not contain a violation of Rule 8.1:
>>
>>       unsigned x;
>>
>> It does contain a violation of Directive 4.6, though, whose correct
>> handling depends on the intention (uint32_t, uin64_t, size_t, ...).
> 
> Interesting - this goes straight against a rule we have set in
> ./CODING_STYLE. I'm also puzzled by you including size_t in your list
> of examples, when the spec doesn't. The sole "goal" of the directive
> (which is advisory only anyway) is to be able to determine allocation
> size. size_t size, however, varies as much as short, int, long, etc
> do.
> 
> Jan

