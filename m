Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4195652750
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 20:50:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467313.726365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7ice-00039M-Ub; Tue, 20 Dec 2022 19:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467313.726365; Tue, 20 Dec 2022 19:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7ice-00036w-Ru; Tue, 20 Dec 2022 19:49:56 +0000
Received: by outflank-mailman (input) for mailman id 467313;
 Tue, 20 Dec 2022 19:49:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p7ice-00036q-5t
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 19:49:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7icd-0002cX-Jm; Tue, 20 Dec 2022 19:49:55 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.6.189]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7icd-0007FH-DP; Tue, 20 Dec 2022 19:49:55 +0000
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
	bh=bsIlR5ybcC1LX61Gt392+0aCZP/6gWO+3FoSZpLEtvI=; b=CE7N1MKoOVAkAndR6F3GixEopk
	WRya+8ybe3uT3RrGRRr2rKwswbl4sNeEISz81dwOeinN/JWOz1DhDfVmvNnukR84D+TG+8BDnKh8l
	RSvVnfCCY1NgM+ybZIYvytxr2FcbGMNAu74/p1x7DFgQAKme61Y9Gqn6KEkioRslMjhA=;
Message-ID: <32e76523-69a0-6418-99e1-6842db8da0df@xen.org>
Date: Tue, 20 Dec 2022 19:49:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v2 09/19] tools/xenstore: move changed domain handling
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221213160045.28170-1-jgross@suse.com>
 <20221213160045.28170-10-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221213160045.28170-10-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 13/12/2022 16:00, Juergen Gross wrote:
> Move all code related to struct changed_domain from
> xenstored_transaction.c to xenstored_domain.c.
> 
> This will be needed later in order to simplify the accounting data
> updates in cases of errors during a request.
> 
> Split the code to have a more generic base framework.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

