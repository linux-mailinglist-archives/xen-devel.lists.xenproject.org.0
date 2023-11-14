Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9788E7EB0B2
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 14:18:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632395.986668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2tIu-0008NR-90; Tue, 14 Nov 2023 13:18:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632395.986668; Tue, 14 Nov 2023 13:18:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2tIu-0008LB-6Q; Tue, 14 Nov 2023 13:18:08 +0000
Received: by outflank-mailman (input) for mailman id 632395;
 Tue, 14 Nov 2023 13:18:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZdVB=G3=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r2tIt-0008JW-56
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 13:18:07 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d2622f9-82f0-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 14:18:02 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 0D5254EE0738;
 Tue, 14 Nov 2023 14:18:02 +0100 (CET)
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
X-Inumbo-ID: 3d2622f9-82f0-11ee-98db-6d05b1d4d9a1
MIME-Version: 1.0
Date: Tue, 14 Nov 2023 14:18:02 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com,
 xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 jbeulich@suse.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [XEN PATCH v3 2/3] docs: make the docs for MISRA C:2012 Dir 4.1
 visible to ECLAIR
In-Reply-To: <0e6c48d5-d108-44d9-bd6b-479d18044be2@xen.org>
References: <cover.1696231870.git.nicola.vetrini@bugseng.com>
 <fd60f0f3c777652bd305a97b559cb7ee23293e8d.1696231870.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2310021531430.2348112@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2311071240240.3478774@ubuntu-linux-20-04-desktop>
 <0c853769-8d59-4ce4-95d3-8acefddd8ed8@xen.org>
 <791354c61840c8e37cd2ee3c99689236@bugseng.com>
 <0e6c48d5-d108-44d9-bd6b-479d18044be2@xen.org>
Message-ID: <a508af252f3c7a96e6fdfa655a49502b@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2023-11-09 13:05, Julien Grall wrote:
> Hi,
> 
> On 08/11/2023 17:12, Nicola Vetrini wrote:
>> On 2023-11-08 17:25, Julien Grall wrote:
>>> Hi Stefano,
>>> 
>>> On 07/11/2023 20:41, Stefano Stabellini wrote:
>>>> +Julien, Andrew
>>>> 
>>>> Julien and Andrew raised concerns on this patch on the Xen Matrix
>>>> channel. Please provide further details.
>>> 
>>> Thanks! It looks like I was already CCed but this likely got lost 
>>> with all the MISRA patches...
>>> 
>>> On Matrix, there was concerned raised that the documentation now have 
>>> a dependency on C compiler and you are also build C files in docs.
>>> 
>>> In addition to that, I have a few more comments.
>>> 
>> 
>> The .rst file was chosen to have a human-readable format for the 
>> runtime failures
>> documentation. The other option that is otherwise viable is having a 
>> dummy .c or .h in
>> the sources (in this case it would likely be under xen/).
>> 
>> The transformation of this file into a .c file could be done from 
>> xen's Makefile of course,
>> but I reckoned that would have been more difficult, as the Makefile 
>> for the docs is
>> far shorter
> 
> I understand that the Makefile for docs is shorter. However this seems 
> to be the wrong place to "compile" a file.
> 
> I think it makes more sense to do it from xen/ as those deviations are 
> only for the hypervisor. IOW they don't apply for the tools.
> 
> [....]
> 

I have the intention to place this in the eclair analysis build script, 
to keep the
modifications to a minimum.

>>>>>> +
>>>>>> +all: $(TARGETS)
>>>>>> +
>>>>>> +# This Makefile will generate the object files indicated in 
>>>>>> TARGETS by taking
>>>>>> +# the corresponding .rst file, converting its content to a C 
>>>>>> block comment and
>>>>>> +# then compiling the resulting .c file. This is needed for the 
>>>>>> file's content to
>>>>>> +# be available when performing static analysis with ECLAIR on the 
>>>>>> project.
>>> 
>>> I am a bit lost with the explanation. The generated object will be 
>>> empty. So why do you require to generate it?
>>> 
>> 
>> See above. The only requirement is that some intercepted toolchain 
>> invocation happens
>> and that the processed file has a comment block containing the strings 
>> specified below.
>> The resulting artifact isn't needed in any way.
> 
> Just to confirm, there is no way for Eclair to specify some extra file 
> that don't require "compilation"?
> 

Correct.

>> 
>>> Furthermore, the content doesn't seem to follow a specific syntax (or 
>>> at least it is not clear that it should follow one). So why do you 
>>> need to expose the content to Eclair?
>>> 
>> 
>> Under the hood there's a regex matching the resulting comment block 
>> against a set of default
>> templates used to indicate that the project has some form of 
>> documentation around runtime
>> failures. The default templates are along these lines (the comment 
>> begin and end markers
>> need not be on the same line):
>> 
>> /* Documentation for MISRA C:2012 Dir 4.1: overflow <description> */
>> 
>> If the string is matched, then documentation for that particular 
>> category of runtime
>> failures is deemed present, otherwise a violation will be reported 
>> (one for each category).
>> Both the categories and format of the string to be matched can be 
>> customized, but I'd like
>> to avoid doing that.
> 
> Ok. The format should be documented at top of the rst file so a 
> developper knows how to modify the file correctly.
> 

Ok. Although the authoritative reference is the ECLAIR User Manual, so 
what I'll put here is to be taken as an example.

>> 
>>>>>> +
>>>>>> +# sed is used in place of cat to prevent occurrences of '*/'
>>>>>> +# in the .rst from breaking the compilation
>>>>>> +$(TARGETS:.o=.c): %.c: %.rst
>>>>>> +    printf "/*\n\n" > $@.tmp
>>>>>> +    sed -e 's|\*/|*//*|g' $< >> $@.tmp
>>>>>> +    printf "\n\n*/\n" >> $@.tmp
>>>>>> +    mv $@.tmp $@
>>>>>> +
>>>>>> +%.o: %.c
>>>>>> +    $(CC) -std=c99 -c $< -o $@
>>> 
>>> AFAICT, this will generate a file using the host compiler. This may 
>>> be different from the compiler used to build Xen.
>>> 
>>> So I will repeat myself, how all of this matters? Maybe it would be 
>>> useful if you provide some documentation from Eclair.
>>> 
>>> Cheers,
>> 
>> The only non-trivial bit is that the file 
>> automation/eclair_analysis/ECLAIR/toolchain.ecl
>> specifies some compilers (if this needs to be adjusted to something 
>> other that $(CC), then I
>> may need some additional guidance) and the c99 standard, hence if you 
>> use a different
>> compiler ECLAIR will complain that you didn't document the toolchain 
>> assumptions according
>> to D1.1 (which is incidentally why we created the file 
>> C-language-toolchain.rst).
> 
> We should use the same/compiler as used by the hypervisor. I feel 
> anything else is just a gross hack and may break in the long term. 
> Hence why it makes a lot more sense to generate/"compile" the file from 
> the hypervisor Makefile.
> 

See above. Placing the compilation in the analysis script will use the 
same compiler used for the hypervisor.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

