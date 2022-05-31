Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D523538DED
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 11:41:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339397.564257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvyNB-00006n-Gq; Tue, 31 May 2022 09:41:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339397.564257; Tue, 31 May 2022 09:41:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvyNB-0008W4-DP; Tue, 31 May 2022 09:41:09 +0000
Received: by outflank-mailman (input) for mailman id 339397;
 Tue, 31 May 2022 09:41:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nvyNA-0008Vm-2g
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 09:41:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nvyN8-00009B-4v; Tue, 31 May 2022 09:41:06 +0000
Received: from [54.239.6.187] (helo=[192.168.31.167])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nvyN7-0001fK-UU; Tue, 31 May 2022 09:41:06 +0000
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
	bh=KMb7jxQSPc/OMyDnquFQK7AvqnxlS10nnNQbZD4mO7Q=; b=bdP7jQgSkv2XbHUpYGryO7CrIb
	EWOfMKT0gr1CnWikFpaObK8VGG84JAMGHbOjaCzwNlCbc/GCewp/GEVTEzQOzXyNhjneHXDWYx4tc
	4MPz/i9nKcWlJtZLc9Q8reAb7kGWsV13TFdbPBeBGWchIglc9owGfwQmVuNZ6f3qUJuE=;
Message-ID: <10687069-5498-11f8-5474-fa34ee837025@xen.org>
Date: Tue, 31 May 2022 10:41:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] docs/misra: introduce rules.rst
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 George Dunlap <george.dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.22.394.2205241650160.1905099@ubuntu-linux-20-04-desktop>
 <a19d22ca-33ef-b348-ac88-490010464bad@xen.org>
 <alpine.DEB.2.22.394.2205251740280.1905099@ubuntu-linux-20-04-desktop>
 <0cf7383d-896e-76f0-b1cc-2f20bd7f368e@suse.com>
 <D9A44AC3-A959-442F-A94C-C9EFB359BEF1@arm.com>
 <da68ca4d-3498-ec6a-7a5d-040f23dd41a6@suse.com>
 <765738F2-97E9-40EF-A50E-2912C7D2A286@arm.com>
 <alpine.DEB.2.22.394.2205261233000.1905099@ubuntu-linux-20-04-desktop>
 <c0b481fb-5172-3515-764f-dba9f906c049@suse.com>
 <alpine.DEB.2.22.394.2205271602320.1905099@ubuntu-linux-20-04-desktop>
 <3882cc86-72a7-8e19-5f7b-b1cc89cce02e@xen.org>
 <5b790260-dd5c-9f62-7151-7684a0dc18fa@suse.com>
 <0cc9c342-f355-5816-09e9-a996624c6a79@xen.org>
 <6d6115a9-2810-0c9b-bba3-968b3ac50110@suse.com>
 <d4c6aa78-cc94-274c-db05-c62ff0badc9d@xen.org>
 <dcafd462-f912-8c59-f1bf-32f65ae45fd4@suse.com>
 <A7121189-9A68-41C6-A8EF-D823A0BBF4FF@citrix.com>
 <138D3C39-74A6-46CB-B598-2FC5FAD1E52D@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <138D3C39-74A6-46CB-B598-2FC5FAD1E52D@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 30/05/2022 14:35, Bertrand Marquis wrote:
>> Obviously something *else* we might want is a more convenient way to keep that rationale for the future, when we start to officially document deviations.  Given that the scanner will point out all the places where deviations happen, I don’t think an unstructured comment with an informal summary of the justification would be a problem — it seems like it would be a lot easier, when we start to officially document deviations, to transform comments in the existing codebase, than to search through the mailing lists and/or git commit history to find the rationale (or try to work out unaided what the intent was).  But I don’t have strong opinions on the matter.
> 
> Maybe agreeing on a simple tag to start that can later be improved (Luca Fancellu on my side will start working on that with the FuSa SIG and Eclair next month).
> 
> So I would suggest:
> 
> /**
>   * MISRA_DEV: Rule ID
>   * xxxxx justification
>   *
>   */
> 
> Whenever we will have defined the final way, we will replace those entries with the new system.
> 
> Would that be an agreeable solution ?

I am fine with that. With one NIT thought, in Xen comments the first 
line of multi-line comment is "/*" rather than "/**".

Cheers,

-- 
Julien Grall

