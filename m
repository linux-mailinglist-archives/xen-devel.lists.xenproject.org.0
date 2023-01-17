Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C05670BBA
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 23:39:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479919.744027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHubu-0006uc-Ea; Tue, 17 Jan 2023 22:39:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479919.744027; Tue, 17 Jan 2023 22:39:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHubu-0006sV-Aw; Tue, 17 Jan 2023 22:39:18 +0000
Received: by outflank-mailman (input) for mailman id 479919;
 Tue, 17 Jan 2023 22:39:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pHubt-0006sP-Oi
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 22:39:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHubt-0005aw-1c; Tue, 17 Jan 2023 22:39:17 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHubs-0001Ut-Sv; Tue, 17 Jan 2023 22:39:16 +0000
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
	bh=gZQ5HEqX71hU1/q6YSaasZdkyxy17ihJcYZ+dxCrIeQ=; b=RiKVvrspXq0ajBTdUMGpo16DhW
	RNVwCKn7qIqaN18uJOUzFU0M2iPMCE7OEwIj9Cmr4zcb7oMP6ES82EBxiW6O+Q5i4UbO/zginQP0z
	X2vQyPYas8IdObpvKcu9EOOyLGL+84GqQsoLjapSgQcpPU1xKfc/GUrKchn+YEOTovkU=;
Message-ID: <d980e8e7-8fd3-4eab-eec8-312202f2df18@xen.org>
Date: Tue, 17 Jan 2023 22:39:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 17/17] tools/xenstore: make output of "xenstore-control
 help" more pretty
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230117091124.22170-1-jgross@suse.com>
 <20230117091124.22170-18-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230117091124.22170-18-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 17/01/2023 09:11, Juergen Gross wrote:
> Using a tab for separating the command from the options in the output
> of "xenstore-control help" results in a rather ugly list.
> 
> Use a fixed size for the command instead.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Rwviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

