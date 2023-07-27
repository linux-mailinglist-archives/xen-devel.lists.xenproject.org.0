Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB6B765EE8
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 00:03:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571289.894786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP94q-00065i-Oh; Thu, 27 Jul 2023 22:03:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571289.894786; Thu, 27 Jul 2023 22:03:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP94q-00062u-Ko; Thu, 27 Jul 2023 22:03:20 +0000
Received: by outflank-mailman (input) for mailman id 571289;
 Thu, 27 Jul 2023 22:03:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qP94p-00062o-KX
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 22:03:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qP94p-00011v-7g; Thu, 27 Jul 2023 22:03:19 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qP94p-0002uz-33; Thu, 27 Jul 2023 22:03:19 +0000
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
	bh=uj2S3YzBIVY3m1lJsG1LdhTzIvHm6E6tuA+UWGIT75g=; b=X9atb07MkkEc+JN/hJwiiJE9LN
	1en/fXfV0DYLQ5bNlsV38L5u8pS1cEskFqC79IE2Urizr4N2ttEJeUWZWL7m3ytDVXK9K4osZJQTs
	OV15sR3fDCbEZivwIi+2X0f5TrJd/Fqyrz7SL05iLvxVAQLNuEX6q15KJaY9hV0uq+us=;
Message-ID: <a3731224-0984-49b9-d386-8656e1454534@xen.org>
Date: Thu, 27 Jul 2023 23:03:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v3] device_tree: address violations of MISRA C:2012
 Rules 8.2 and 8.3
To: Stefano Stabellini <sstabellini@kernel.org>,
 Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com
References: <982ad65413e08e8c10ef035cb8246ba7277ff01b.1690292999.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2307251223470.3118466@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2307251223470.3118466@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 25/07/2023 20:23, Stefano Stabellini wrote:
> On Tue, 25 Jul 2023, Federico Serafini wrote:
>> Give a name to unnamed parameters thus addressing violations of
>> MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
>> named parameters").
>> Keep consistency between parameter names and types used in function
>> declarations and the ones used in the corresponding function
>> definitions, thus addressing violations of MISRA C:2012 Rule 8.3
>> ("All declarations of an object or function shall use the same names
>> and type qualifiers").
>>
>> No functional changes.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

I have committed the patch.

Cheers,

-- 
Julien Grall

