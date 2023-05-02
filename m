Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F67A6F49F7
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 20:57:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528784.822358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptvBq-0000mK-8g; Tue, 02 May 2023 18:57:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528784.822358; Tue, 02 May 2023 18:57:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptvBq-0000kb-4b; Tue, 02 May 2023 18:57:30 +0000
Received: by outflank-mailman (input) for mailman id 528784;
 Tue, 02 May 2023 18:57:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ptvBo-0000kJ-37
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 18:57:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ptvBn-0003j4-FA; Tue, 02 May 2023 18:57:27 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[192.168.27.23]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ptvBn-0005E7-98; Tue, 02 May 2023 18:57:27 +0000
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
	bh=mUiVQ/ID7Mf9r5d/C6BFsfv6tI7q/JAE0UDgvSyOPsU=; b=WjTQ2BOSDP4ntjMiRL3gHONm9R
	n2Yfob7K1cXcYtRbvpEDozixeJDvHAGGbHov5ntM5ebI7W/OW3XGRG6fcohxFQhCgPxcRtglKnyjq
	bmlipOCZ2jeFBhhijBM86Ht368+KQlbzrDpFzekXjwSYlRVIAJISslizVXJkvhQ8lXDE=;
Message-ID: <4e7f5761-e21c-ee8b-6bb4-cd3753ce9b33@xen.org>
Date: Tue, 2 May 2023 19:57:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v4 06/13] tools/xenstore: add current connection to
 domain_memory_add() parameters
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230405070349.25293-1-jgross@suse.com>
 <20230405070349.25293-7-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230405070349.25293-7-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 05/04/2023 08:03, Juergen Gross wrote:
> In order to enable switching memory accounting to the generic array
> based accounting, add the current connection to the parameters of
> domain_memory_add().
> 
> This requires to add the connection to some other functions, too.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

