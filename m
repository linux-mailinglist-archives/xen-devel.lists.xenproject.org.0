Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C4C396F26
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 10:41:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134740.250623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lnzwg-0005Pg-DO; Tue, 01 Jun 2021 08:40:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134740.250623; Tue, 01 Jun 2021 08:40:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lnzwg-0005Ni-9e; Tue, 01 Jun 2021 08:40:18 +0000
Received: by outflank-mailman (input) for mailman id 134740;
 Tue, 01 Jun 2021 08:40:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lnzwe-0005Nb-Qq
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 08:40:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lnzwd-00006a-N6; Tue, 01 Jun 2021 08:40:15 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lnzwd-0007fi-GR; Tue, 01 Jun 2021 08:40:15 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=IJWbL+e1S2nPPWMdMcq0auZeSSq+qjk/7s/F7aq5Mr4=; b=XjWL/DGesC9jswEhrQKGIOVd49
	7wCpZZ5gFFsxHDWDDo585D5e51+WEVf7FBqAljdD2HM6T+gG34XwzfWzBKRoocKYI2tIW3GGNoTPu
	/6llLmiH9B2Bjgzmyu//EVm1c59HYfR3t+xPuHGDXiEc/lf6NxZeh8tVlvdykOgHQnf8=;
Subject: Re: [PATCH v4 3/4] xen: Add files needed for minimal riscv build
To: Jan Beulich <jbeulich@suse.com>, Connor Davis <connojdavis@gmail.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>
Cc: Alistair Francis <alistair23@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1621712830.git.connojdavis@gmail.com>
 <88ca49cea8dc0c44604957d42722388bb3d9e3ff.1621712830.git.connojdavis@gmail.com>
 <7d1b6d2a-641c-4508-9b29-b74db4769170@suse.com>
 <39a8a78c-3662-528f-fde4-d47427e64b15@gmail.com>
 <b0699bc4-5e79-7ce0-c885-b4d8dfa8b74f@gmail.com>
 <0eab888a-4c48-497d-6c43-b749389e52dd@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e95a2ae5-16a7-aa2d-67c9-b8a0d6f0c2e5@xen.org>
Date: Tue, 1 Jun 2021 09:40:13 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <0eab888a-4c48-497d-6c43-b749389e52dd@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 01/06/2021 07:03, Jan Beulich wrote:
> On 01.06.2021 04:26, Connor Davis wrote:
>>
>>
>> On 5/25/21 12:13 PM, Bob Eshleman wrote:
>>> On 5/25/21 1:48 AM, Jan Beulich wrote:
>>>> On 24.05.2021 16:34, Connor Davis wrote:
>>>>> Add arch-specific makefiles and configs needed to build for
>>>>> riscv. Also add a minimal head.S that is a simple infinite loop.
>>>>> head.o can be built with
>>>>>
>>>>> $ make XEN_TARGET_ARCH=riscv SUBSYSTEMS=xen -C xen tiny64_defconfig
>>>>> $ make XEN_TARGET_ARCH=riscv SUBSYSTEMS=xen -C xen TARGET=head.o
>>>>>
>>>>> No other TARGET is supported at the moment.
>>>>>
>>>>> Signed-off-by: Connor Davis <connojdavis@gmail.com>
>>>>> ---
>>>>>    config/riscv.mk                         |  4 +++
>>>>>    xen/Makefile                            |  8 +++--
>>>>>    xen/arch/riscv/Kconfig                  | 47 +++++++++++++++++++++++++
>>>>>    xen/arch/riscv/Kconfig.debug            |  0
>>>>>    xen/arch/riscv/Makefile                 |  0
>>>>>    xen/arch/riscv/Rules.mk                 |  0
>>>>>    xen/arch/riscv/arch.mk                  | 14 ++++++++
>>>>>    xen/arch/riscv/asm-offsets.c            |  0
>>>>>    xen/arch/riscv/configs/tiny64_defconfig | 13 +++++++
>>>>>    xen/arch/riscv/head.S                   |  6 ++++
>>>>>    xen/include/asm-riscv/config.h          | 47 +++++++++++++++++++++++++
>>>>>    11 files changed, 137 insertions(+), 2 deletions(-)
>>>>>    create mode 100644 config/riscv.mk
>>>>>    create mode 100644 xen/arch/riscv/Kconfig
>>>>>    create mode 100644 xen/arch/riscv/Kconfig.debug
>>>>>    create mode 100644 xen/arch/riscv/Makefile
>>>>>    create mode 100644 xen/arch/riscv/Rules.mk
>>>>>    create mode 100644 xen/arch/riscv/arch.mk
>>>>>    create mode 100644 xen/arch/riscv/asm-offsets.c
>>>>>    create mode 100644 xen/arch/riscv/configs/tiny64_defconfig
>>>>>    create mode 100644 xen/arch/riscv/head.S
>>>>>    create mode 100644 xen/include/asm-riscv/config.h
>>>> I think this wants to be accompanied by an addition to ./MAINTAINERS
>>>> right away, such that future RISC-V patches can be acked by the
>>>> respective designated maintainers, rather than falling under "THE REST".
>>>> Question is whether you / we have settled yet who's to become arch
>>>> maintainer there.
>>>>
>>>> Jan
>>>>
>>> I'd like to volunteer myself for this, as I'm slated to continue
>>> with the port indefinitely and would at least like to review
>>> patches.  If Connor has the time, I think it makes sense for him
>>> to be listed there too.
>>>
>>> Until we have others (it's just us two right now), it'll be a
>>> lot of us reviewing each other's arch-specific work (in addition to
>>> reviewers elsewhere in the Xen project, of course).
>>>
>>> -Bobby
>>>
>> Jan: can you list Bobby as the maintainer on commit? You can list me as
>> well,
>> but I can't guarantee a time commitment unlike Bobby.
> 
> Well, actually I did expect a v5 submission with whatever entry you
> both deem suitable. Otoh I now realize that patch 1 had my extra
> request addressed (by myself) and hence with this one needing just
> that entry, I could indeed add that addition myself while committing.
> Let me move the mails back to the to-be-committed folder...

At the risk of being picky, I don't think this should be done of commit. 
Instead, a formal patch should be sent with both maintainers + one of 
the committer acking (or signed-off-by) the proposal.

Cheers,

-- 
Julien Grall

