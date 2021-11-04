Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B307445C7F
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 00:00:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221938.383878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1milhx-0002b4-9Z; Thu, 04 Nov 2021 22:59:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221938.383878; Thu, 04 Nov 2021 22:59:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1milhx-0002YO-6Z; Thu, 04 Nov 2021 22:59:45 +0000
Received: by outflank-mailman (input) for mailman id 221938;
 Thu, 04 Nov 2021 22:59:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1milhw-0002YI-8D
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 22:59:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1milhv-0006T9-Ta; Thu, 04 Nov 2021 22:59:43 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.26.82]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1milhv-0001W5-N3; Thu, 04 Nov 2021 22:59:43 +0000
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
	bh=6So2Z5VjW3eOo7zzm6bBVxoAYgZpQUTSWCaMT616TpE=; b=b6pqk/mjpKUieNZTZs6j3I04qs
	Fw8wvAi1qxU+7Iwjx6qsFY45tqQQpdYu7pgMZ8GVvuRQzQUcuI1SpR5W0UCkv8V2TkBrwvMHzj/JB
	9WLXzqJ7kudXu2MOI9lbl8xSLT/w9n/aZSX8KPB/hmA7VQg+a20mjmkWM5LGdE+NGG/c=;
Message-ID: <9f3208df-f3a8-e5ed-ee30-aed152d32ad5@xen.org>
Date: Thu, 4 Nov 2021 22:59:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH] MAINTAINERS: add Bertrand to the ARM reviewers
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com
References: <alpine.DEB.2.22.394.2111041357580.284830@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2111041357580.284830@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 04/11/2021 21:00, Stefano Stabellini wrote:
> 
> Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

I am not sure where the Acked-by is coming from. Can Bertrand confirm on 
the ML that the is happy to be a reviewer?

> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

There is a missing signed-off-by on the patch.

I am happy with the proposal, although I will wait for the two remarks 
to be resolved before giving my acked-by.

Cheers,

-- 
Julien Grall

