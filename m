Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCECD673A9E
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 14:44:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481068.745756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIVCu-0005UB-Ou; Thu, 19 Jan 2023 13:43:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481068.745756; Thu, 19 Jan 2023 13:43:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIVCu-0005Ri-M7; Thu, 19 Jan 2023 13:43:56 +0000
Received: by outflank-mailman (input) for mailman id 481068;
 Thu, 19 Jan 2023 13:43:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pIVCt-0005Rc-KI
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 13:43:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pIVCs-0003As-Sm; Thu, 19 Jan 2023 13:43:54 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.13.107]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pIVCs-0004p8-Lm; Thu, 19 Jan 2023 13:43:54 +0000
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
	bh=tHUQGdSFD6mqmsnAT4Z8BxMS7XRdwXxpSbQHs7bkerQ=; b=xPRb3SdLm5GeK3bCvJKqxrL2Nc
	Y1+4fqvgDT3yV/vNtMYk3ktvDb1qSwCa5zUzYOFPoboAaMSSr4sdvDM50wlPJqFsA+1lq0rJubAJf
	zcJX6i6Q1PeuSf6Ry+0qhZhUp7RW5XVQuf0v6eabzXzDSnBp/MMbiqL4XQlcSfRnyGh8=;
Message-ID: <dfa17a7d-e360-1469-80d6-c9ee9981f64e@xen.org>
Date: Thu, 19 Jan 2023 13:43:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 08/17] tools/xenstore: change per-domain node
 accounting interface
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230118095016.13091-1-jgross@suse.com>
 <20230118095016.13091-9-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230118095016.13091-9-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 18/01/2023 09:50, Juergen Gross wrote:
> Rework the interface and the internals of the per-domain node
> accounting:
> 
> - rename the functions to domain_nbentry_*() in order to better match
>    the related counter name
> 
> - switch from node pointer to domid as interface, as all nodes have the
>    owner filled in
> 
> - use a common internal function for adding a value to the counter
> 
> For the transaction case add a helper function to get the list head
> of the per-transaction changed domains, enabling to eliminate the
> transaction_entry_*() functions.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>


Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

