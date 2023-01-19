Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A54673AAC
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 14:46:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481087.745787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIVFa-0007B6-Nk; Thu, 19 Jan 2023 13:46:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481087.745787; Thu, 19 Jan 2023 13:46:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIVFa-000784-Ko; Thu, 19 Jan 2023 13:46:42 +0000
Received: by outflank-mailman (input) for mailman id 481087;
 Thu, 19 Jan 2023 13:46:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pIVFY-00077o-DC
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 13:46:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pIVFX-0003QN-SG; Thu, 19 Jan 2023 13:46:39 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.13.107]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pIVFX-00050z-Mr; Thu, 19 Jan 2023 13:46:39 +0000
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
	bh=djdDb4AAb62iIEjZ1ymbb4hKXz8DEMYviTvN3i3qlhM=; b=xryrQJFTuuL+5tBIDe4m7gZsMV
	XS0J5jqOzJR/8372xkMFOGgBqaJj41ZfaLTQYI0AsovHpmPmGupfzCEeE9syWLK/SjTgFaRFsgtVS
	g+L3uTTrxG3AnbwiP7NG22T4LvMJ3/k3mq+ndiAiP0rti91SngyfJSZYzKnKmf8b3/eo=;
Message-ID: <85ac4580-f2e5-eb96-6d21-7ed92057710a@xen.org>
Date: Thu, 19 Jan 2023 13:46:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 15/17] tools/xenstore: let check_store() check the
 accounting data
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230118095016.13091-1-jgross@suse.com>
 <20230118095016.13091-16-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230118095016.13091-16-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 18/01/2023 09:50, Juergen Gross wrote:
> Today check_store() is only testing the correctness of the node tree.
> 
> Add verification of the accounting data (number of nodes) and correct
> the data if it is wrong.
> 
> Do the initial check_store() call only after Xenstore entries of a
> live update have been read. This is wanted to make sure the accounting
> data is correct after a live update.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

