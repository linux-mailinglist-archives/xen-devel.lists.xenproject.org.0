Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3E0736BD1
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 14:22:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551756.861443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBaN0-0007sh-Iz; Tue, 20 Jun 2023 12:22:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551756.861443; Tue, 20 Jun 2023 12:22:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBaN0-0007qD-FD; Tue, 20 Jun 2023 12:22:02 +0000
Received: by outflank-mailman (input) for mailman id 551756;
 Tue, 20 Jun 2023 12:22:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qBaMz-0007q7-Bv
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 12:22:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBaMy-0005Jl-KF; Tue, 20 Jun 2023 12:22:00 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=[192.168.9.99])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBaMy-00063X-Dq; Tue, 20 Jun 2023 12:22:00 +0000
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
	bh=GkEzq0Pxq2WTV+Y4eueK9QZbMoRd8newNZRWtgZhYmA=; b=VF7lEJqrqj8mDSpMDQpBsC1Zyq
	ivA4BKAlj9vIzFyuU5jAZvLcLwtCcOmz46jn5QaES9sbE2OJeEHt3JYTrwzQR+AFFERWUamUtuw4u
	aNS9VHDpzXS7pFzEHzX4n79bAQ7APToPAheK/eu3548E/mzkVExYqp0dHdc7dphXclCY=;
Message-ID: <ce60f564-1c2e-1472-2a8f-5f56f9b5a91d@xen.org>
Date: Tue, 20 Jun 2023 13:21:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 06/11] tools/xenstore: switch get_acc_data() to use name
 instead of key
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530091333.7678-1-jgross@suse.com>
 <20230530091333.7678-7-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230530091333.7678-7-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 30/05/2023 10:13, Juergen Gross wrote:
> Eliminate further TDB_DATA usage by switching get_acc_data() and
> get_acc_domid() from a TDB key to the name of the node in the data base
> as a parameter.
> 
> This is in preparation to replace TDB with a more simple data storage.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

