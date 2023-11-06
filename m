Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9AE7E2B60
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 18:41:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628244.979478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r03as-0002tQ-7J; Mon, 06 Nov 2023 17:40:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628244.979478; Mon, 06 Nov 2023 17:40:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r03as-0002qc-4K; Mon, 06 Nov 2023 17:40:58 +0000
Received: by outflank-mailman (input) for mailman id 628244;
 Mon, 06 Nov 2023 17:40:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r03aq-0002qW-DG
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 17:40:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r03aj-00080S-4k; Mon, 06 Nov 2023 17:40:49 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.14.214]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r03ai-0003kd-UJ; Mon, 06 Nov 2023 17:40:49 +0000
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
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=1WIafKxbXySPh1fBpOElj/hEX6FkM0qWCQyGa7IvW8Y=; b=cj26dw4cGo0poaQvKr+qIS3eU3
	ujS+QlVXHHOY96AxY4yUjutmirCUrkkxGBbpAPpruN1qlIWiSgPgxEYPf6f8p6x8qiAwNkrZ3i6Kr
	GEEs2dEl/oC3kVMHQcS9kLWYmMzXQFuLvtk3apPKAIsKEHyN631+tmYdvXD0ryi1/Fa0=;
Message-ID: <39e6d4b3-5468-4b91-a030-f36bcce3583d@xen.org>
Date: Mon, 6 Nov 2023 17:40:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Informal voting proposal
Content-Language: en-GB
To: Kelly Choi <kelly.choi@cloud.com>, xen-devel@lists.xenproject.org,
 committers@xenproject.org
References: <CAO-mL=zCpobcXHnAGeLL1tOP5dyqyThVri3a=76t_xYDMa+mrA@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAO-mL=zCpobcXHnAGeLL1tOP5dyqyThVri3a=76t_xYDMa+mrA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Kelly,

On 06/11/2023 16:40, Kelly Choi wrote:
> Hi all,
> 
> As an open-source community, there will always be differences of opinion in
> approaches and the way we think. It is imperative, however, that we view
> this diversity as a source of strength rather than a hindrance.
> 
> Recent deliberations within our project have led to certain matters being
> put on hold due to an inability to reach a consensus. While formal voting
> procedures serve their purpose, they can be time-consuming and may not
> always lead to meaningful progress.
> 
> Having received agreement from a few maintainers already, I would like to
> propose the following:

Thanks for the sending the proposal. While I like the idea of informal 
vote to move faster, I would like to ask some clarifications.

> 
> *Informal voting method:*
> 
>     1. Each project should ideally have more than 2 maintainers to
>     facilitate impartial discussions. Projects lacking this configuration will
>     be addressed at a later stage.
>     2. Anyone in the community is welcome to voice their opinions, ideas,
>     and concerns about any patch or contribution.
>     3. If members cannot agree, the majority informal vote of the
>     maintainers will be the decision that stands. For instance, if, after
>     careful consideration of all suggestions and concerns, 2 out of 3
>     maintainers endorse a solution within the x86 subsystem, it shall be the
>     decision we move forward with.

How do you know that all the options have been carefully considered?

>     4. Naturally, there may be exceptional circumstances, as such, a formal
>     vote may be warranted but should happen only a few times a year for serious
>     cases only.
Similarly here, you are suggesting that a formal vote can be called. But 
it is not super clear what would be the condition it could be used and 
how it can be called.

For instance, per the informal rule, if 2 out of 3 maintainers accept. 
Then it would be sensible for the patch to be merged as soon as the 5 
days windows is closed. Yet the 3rd maintainer technically object it. So 
could that maintainer request a formal vote? If so, how long do they have?

>     5. Informal votes can be as easy as 2 out of 3 maintainers providing
>     their Acked-by/Reviewed-by tag. Alternatively, Maintainers can call an
>     informal vote by simply emailing the thread with "informal vote proposed,
>     option 1 and option 2."
>     6. *All maintainers should reply with their vote within 5 working days.*

While I understand we want to move fast, this means that a maintainer 
that is away for PTO would not have the opportunity to answer.

Cheers,

-- 
Julien Grall

