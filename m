Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 085D666DFEF
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 15:07:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479482.743360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHmc9-0007BV-JL; Tue, 17 Jan 2023 14:07:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479482.743360; Tue, 17 Jan 2023 14:07:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHmc9-00078y-GU; Tue, 17 Jan 2023 14:07:01 +0000
Received: by outflank-mailman (input) for mailman id 479482;
 Tue, 17 Jan 2023 14:07:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pHmc8-00078q-7N
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 14:07:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHmc7-0001PZ-J0; Tue, 17 Jan 2023 14:06:59 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.7.198]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHmc7-00088J-Dn; Tue, 17 Jan 2023 14:06:59 +0000
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
	bh=upwRCCs4UDo+eKOrVEkrMNJS1UU5v5QJnUv2lVns/F8=; b=BCivyuiVkkwRjrzwNC0OtLd7h7
	zSv8K6aLG0UaTMTNZxVmpzlc43JgaRqb2sfKUiziih445LibzmLv+3fUvyXy/7SWAnkDrZgpfmkFd
	s6849M3/lFrv3fkyMwfFVyvzrydrncFgmJRfcMYWOQvNeCyF21IK2fEd4BHn4Q/CKmfU=;
Message-ID: <8fb79fde-cc0e-9f9a-e22d-923ef7d6431e@xen.org>
Date: Tue, 17 Jan 2023 14:06:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 06/17] tools/xenstore: move changed domain handling
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230117091124.22170-1-jgross@suse.com>
 <20230117091124.22170-7-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230117091124.22170-7-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 17/01/2023 09:11, Juergen Gross wrote:
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

