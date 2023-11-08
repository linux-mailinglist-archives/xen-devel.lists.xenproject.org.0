Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A327E5B1F
	for <lists+xen-devel@lfdr.de>; Wed,  8 Nov 2023 17:25:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629354.981523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0lMc-00016C-Vj; Wed, 08 Nov 2023 16:25:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629354.981523; Wed, 08 Nov 2023 16:25:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0lMc-00012q-RX; Wed, 08 Nov 2023 16:25:10 +0000
Received: by outflank-mailman (input) for mailman id 629354;
 Wed, 08 Nov 2023 16:25:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r0lMb-00012N-Jl
 for xen-devel@lists.xenproject.org; Wed, 08 Nov 2023 16:25:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r0lMa-0000pB-EV; Wed, 08 Nov 2023 16:25:08 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[10.95.129.229]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r0lMZ-0000MB-Rv; Wed, 08 Nov 2023 16:25:08 +0000
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
	bh=dqrQ5GVhWQeWYMjyOy1zVb4RTKpys5Yj70fR/AH5278=; b=ZHrTkaJnfIu/UDyng+kfDhzQqQ
	412t3Nhoer7DCioSzprCoXA53DSVkiLDHUT3UyDgdS6AbmzvmfRI1KuwaygIbxyxrIJ1h03rVo9SS
	TNqC83b5yEokcA4feyTR2vUxQ7v1BNKwKm/rWbaZetOYpwSNwu5fKjNnux/3A1RKqgD0=;
Message-ID: <0c853769-8d59-4ce4-95d3-8acefddd8ed8@xen.org>
Date: Wed, 8 Nov 2023 16:25:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 2/3] docs: make the docs for MISRA C:2012 Dir 4.1
 visible to ECLAIR
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 jbeulich@suse.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Henry Wang <Henry.Wang@arm.com>
References: <cover.1696231870.git.nicola.vetrini@bugseng.com>
 <fd60f0f3c777652bd305a97b559cb7ee23293e8d.1696231870.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2310021531430.2348112@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2311071240240.3478774@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2311071240240.3478774@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 07/11/2023 20:41, Stefano Stabellini wrote:
> +Julien, Andrew
> 
> Julien and Andrew raised concerns on this patch on the Xen Matrix
> channel. Please provide further details.

Thanks! It looks like I was already CCed but this likely got lost with 
all the MISRA patches...

On Matrix, there was concerned raised that the documentation now have a 
dependency on C compiler and you are also build C files in docs.

In addition to that, I have a few more comments.

> 
> 
> On Mon, 2 Oct 2023, Stefano Stabellini wrote:
>> On Mon, 2 Oct 2023, Nicola Vetrini wrote:
>>> To be able to check for the existence of the necessary subsections in
>>> the documentation for MISRA C:2012 Dir 4.1, ECLAIR needs to have a source
>>> file that is built.
>>>
>>> This file is generated from 'C-runtime-failures.rst' in docs/misra
>>> and the configuration is updated accordingly.
>>>
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>
>> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>>
>>
>>> ---
>>> Changes from RFC:
>>> - Dropped unused/useless code
>>> - Revised the sed command
>>> - Revised the clean target
>>>
>>> Changes in v2:
>>> - Added explanative comment to the makefile
>>> - printf instead of echo
>>>
>>> Changes in v3:
>>> - Terminate the generated file with a newline
>>> - Build it with -std=c99, so that the documentation
>>>    for D1.1 applies.
>>> ---
>>>   docs/Makefile       |  7 ++++++-
>>>   docs/misra/Makefile | 22 ++++++++++++++++++++++
>>>   2 files changed, 28 insertions(+), 1 deletion(-)
>>>   create mode 100644 docs/misra/Makefile
>>>
>>> diff --git a/docs/Makefile b/docs/Makefile
>>> index 966a104490ac..ff991a0c3ca2 100644
>>> --- a/docs/Makefile
>>> +++ b/docs/Makefile
>>> @@ -43,7 +43,7 @@ DOC_PDF  := $(patsubst %.pandoc,pdf/%.pdf,$(PANDOCSRC-y)) \
>>>   all: build
>>>   
>>>   .PHONY: build
>>> -build: html txt pdf man-pages figs
>>> +build: html txt pdf man-pages figs misra

This means you always generate and compile the C files when it seems to 
be only useful for Eclair. I think we should consider to only call 
'misra' for the Eclair build.

The files should also be generated/compiled in an Eclair specific 
directory rather than in docs.

>>>   
>>>   .PHONY: sphinx-html
>>>   sphinx-html:
>>> @@ -66,9 +66,14 @@ endif
>>>   .PHONY: pdf
>>>   pdf: $(DOC_PDF)
>>>   
>>> +.PHONY: misra
>>> +misra:
>>> +	$(MAKE) -C misra
>>> +
>>>   .PHONY: clean
>>>   clean: clean-man-pages
>>>   	$(MAKE) -C figs clean
>>> +	$(MAKE) -C misra clean
>>>   	rm -rf .word_count *.aux *.dvi *.bbl *.blg *.glo *.idx *~
>>>   	rm -rf *.ilg *.log *.ind *.toc *.bak *.tmp core
>>>   	rm -rf html txt pdf sphinx/html
>>> diff --git a/docs/misra/Makefile b/docs/misra/Makefile
>>> new file mode 100644
>>> index 000000000000..949458ff9e15
>>> --- /dev/null
>>> +++ b/docs/misra/Makefile
>>> @@ -0,0 +1,22 @@
>>> +TARGETS := C-runtime-failures.o

We don't usually have uppercase in the file name. Is this something that 
Eclair mandates? In fact, looking at the series, it is not clear how 
Eclair will find the file. Can you clarify?

>>> +
>>> +all: $(TARGETS)
>>> +
>>> +# This Makefile will generate the object files indicated in TARGETS by taking
>>> +# the corresponding .rst file, converting its content to a C block comment and
>>> +# then compiling the resulting .c file. This is needed for the file's content to
>>> +# be available when performing static analysis with ECLAIR on the project.

I am a bit lost with the explanation. The generated object will be 
empty. So why do you require to generate it?

Furthermore, the content doesn't seem to follow a specific syntax (or at 
least it is not clear that it should follow one). So why do you need to 
expose the content to Eclair?

>>> +
>>> +# sed is used in place of cat to prevent occurrences of '*/'
>>> +# in the .rst from breaking the compilation
>>> +$(TARGETS:.o=.c): %.c: %.rst
>>> +	printf "/*\n\n" > $@.tmp
>>> +	sed -e 's|\*/|*//*|g' $< >> $@.tmp
>>> +	printf "\n\n*/\n" >> $@.tmp
>>> +	mv $@.tmp $@
>>> +
>>> +%.o: %.c
>>> +	$(CC) -std=c99 -c $< -o $@

AFAICT, this will generate a file using the host compiler. This may be 
different from the compiler used to build Xen.

So I will repeat myself, how all of this matters? Maybe it would be 
useful if you provide some documentation from Eclair.

Cheers,

-- 
Julien Grall

