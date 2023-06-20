Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EAD736AB5
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 13:16:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551684.861322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZKq-0002Tn-Ok; Tue, 20 Jun 2023 11:15:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551684.861322; Tue, 20 Jun 2023 11:15:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZKq-0002R8-Lo; Tue, 20 Jun 2023 11:15:44 +0000
Received: by outflank-mailman (input) for mailman id 551684;
 Tue, 20 Jun 2023 11:15:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qBZKq-0002R0-0Q
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 11:15:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBZKp-0003nQ-7q; Tue, 20 Jun 2023 11:15:43 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=[192.168.9.99])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBZKp-0003cR-1I; Tue, 20 Jun 2023 11:15:43 +0000
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
	bh=w/N63gcCnqanBwfJCZUdXawVcHWcRlamxp+cJrveup8=; b=aUxZWG+mquNAGVbq6oZSbQhXwn
	H0EbXEi6+VpcnLEFuDbgVcwuVFBmsF8VbZhzipjgKITaNoeECkZajGI3uMGzm2No4lPjaycmskSqH
	eO4sbzVLspF5g4YBOgyVmLoVZOPum2CoW9/npbSxEEYEXKU/QUi/jpzh9E526JTAMW+w=;
Message-ID: <4370fbd1-e2ba-7547-92a7-02cc18c6240c@xen.org>
Date: Tue, 20 Jun 2023 12:15:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 02/11] tools/xenstore: replace key in struct node with
 data base name
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530091333.7678-1-jgross@suse.com>
 <20230530091333.7678-3-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230530091333.7678-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 30/05/2023 10:13, Juergen Gross wrote:
> Instead of storing the TDB key in struct node, only store the name of
> the node used to access it in the data base.
> 
> Associated with that change replace the key parameter of access_node()
> with the equivalent db_name.
> 
> This is in preparation to replace TDB with a more simple data storage.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

