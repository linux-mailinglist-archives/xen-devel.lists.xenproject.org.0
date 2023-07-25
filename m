Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A42761DAD
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 17:53:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569807.890917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOKLK-0006T6-IL; Tue, 25 Jul 2023 15:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569807.890917; Tue, 25 Jul 2023 15:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOKLK-0006Qy-FE; Tue, 25 Jul 2023 15:52:58 +0000
Received: by outflank-mailman (input) for mailman id 569807;
 Tue, 25 Jul 2023 15:52:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qOKLI-0006Qg-Sv
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 15:52:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qOKLI-0005nZ-9M; Tue, 25 Jul 2023 15:52:56 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.17.43]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qOKLI-0002F6-2U; Tue, 25 Jul 2023 15:52:56 +0000
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
	bh=7qDZFJRj2LL7ebMZ3E20PUwjJ7m7lGtYgIZd/Kgbkeg=; b=Z2CgkqMU9Gsi6ySywBByQzV3cy
	AbAk8HlZK64fk0WHaBJt8acFPeTp97+PYtdK6QNDdmlVRcQURZtZtcPbuq9RRAGqad6YjRlYPxIRU
	LTr0HYv8knAn8Xjf/F5coRZuX8TxoNOlfnzduvfJQaToiZbLkdASpeBFwvqqzSe9VAvk=;
Message-ID: <7ea8ac60-cda6-0f6f-d203-c9ed153b45bc@xen.org>
Date: Tue, 25 Jul 2023 16:52:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/2] tools/xenstore: add const to the return type of
 canonicalize()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724103324.4207-1-jgross@suse.com>
 <20230724103324.4207-2-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230724103324.4207-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 24/07/2023 11:33, Juergen Gross wrote:
> The return type of canonicalize() can be modified to const char *.
> This avoids the need to cast the const away from the input parameter.
> 
> There need to be quite some other functions modified to take const
> parameters in order to avoid further casts.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

