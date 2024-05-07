Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F4E8BEAAE
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 19:37:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718430.1121011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4Okg-00018g-3U; Tue, 07 May 2024 17:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718430.1121011; Tue, 07 May 2024 17:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4Okg-00015y-01; Tue, 07 May 2024 17:37:18 +0000
Received: by outflank-mailman (input) for mailman id 718430;
 Tue, 07 May 2024 17:37:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s4Oke-00015s-87
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 17:37:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s4Okc-0003pi-Vk; Tue, 07 May 2024 17:37:14 +0000
Received: from [15.248.2.31] (helo=[10.24.67.35])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s4Okc-0003VO-Mh; Tue, 07 May 2024 17:37:14 +0000
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
	bh=wblJRTqKKZsdNoe9ayI7MRwbMHoVJ4a8NXxsfgPQbSM=; b=jqpwiMGzM6jdOpssEvE+cC92sF
	P6KE8iDG+GVxlaZ+S9zNjnPBCXsbANjwcHO27k5unUCpqbvmaa9TtUYnWjacxny2Xxvq5+0t0/Fcc
	7Lw6Pq3d/9R0Xz1/P0pKHhVttj2yOaeHccIczau9h5zLLVQJP790euiq3W2PT2+zOX/M=;
Message-ID: <35c8fbfb-8b09-4aae-8c98-402dcd65ca2e@xen.org>
Date: Tue, 7 May 2024 18:37:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] xen/arm64: bpi: Add missing code symbol
 annotations
Content-Language: en-GB
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, jbeulich@suse.com,
 andrew.cooper3@citrix.com, edgar.iglesias@amd.com
References: <20240501035448.964625-1-edgar.iglesias@gmail.com>
 <20240501035448.964625-7-edgar.iglesias@gmail.com>
 <alpine.DEB.2.22.394.2405031656490.1151289@ubuntu-linux-20-04-desktop>
 <CAJy5ezpgXVp838aA_E8vJDARoO5iQOh07D+Gpn0kMCLj_iXyLw@mail.gmail.com>
 <398afdf1-8a11-4584-bb07-cf6fc2373d21@xen.org>
 <CAJy5ezpNQP5q0NVaGdXtt5BbJSzCMfTfFt-0RRgVq3+DqMbKgA@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAJy5ezpNQP5q0NVaGdXtt5BbJSzCMfTfFt-0RRgVq3+DqMbKgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 07/05/2024 17:55, Edgar E. Iglesias wrote:
> On Tue, May 7, 2024 at 11:57 AM Julien Grall <julien@xen.org> wrote:
> Hi Julien,

Hi Edgar,

> 
> The reason I choose FUNC for the start of the symbol is because these
> symbols contain
> executable code (not only a table of pointers to code somewhere else)
> and the ELF spec
> says that STT_FUNC means the symbol contains functions or other executable
> code (not only callable functions IIUC):
> 
> "STT_FUNC The symbol is associated with a function or other executable code."
> https://refspecs.linuxbase.org/elf/elf.pdf
> (Symbol Table 1-20).

Thanks for the pointer. I originally did intend to suggest the change, 
but then I saw the use of LABEL in x86 (such as svm_stgi_label). There 
are a few others example with LABEL_LOCAL.

AFAICT, this is also executable code which the only difference that it 
is not meant to be called by someone else. Furthermore, LABEL is using 
DO_CODE_ALIGN(...) for the alignment which imply that it is intended to 
be used by executable code. So I thought the only difference was whether 
the label was intended to be used as a function.

> 
> I think using LABEL instead of GLOBAL for the _end labels of these
> code sequences makes sense.
> I'm happy to change the _start labels to LABEL too if you guys feel
> that's better.

I have to admit I am little confused with the difference between LABEL 
vs FUNC. I think I will need some guidance from Jan (he introduced 
linkage.h).

Cheers,

-- 
Julien Grall

