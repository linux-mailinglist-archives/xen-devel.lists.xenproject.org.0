Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC67D72A1A8
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 19:53:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546257.852985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7gIJ-0000nN-Ks; Fri, 09 Jun 2023 17:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546257.852985; Fri, 09 Jun 2023 17:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7gIJ-0000kr-Hm; Fri, 09 Jun 2023 17:53:03 +0000
Received: by outflank-mailman (input) for mailman id 546257;
 Fri, 09 Jun 2023 17:53:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q7gII-0000kl-0a
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 17:53:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q7gIH-0002pA-47; Fri, 09 Jun 2023 17:53:01 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[192.168.17.204]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q7gIG-0001ST-Ui; Fri, 09 Jun 2023 17:53:01 +0000
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
	bh=XuYm4ZYL23yn6SmBdxQWXOSBURGKR5dA2aWd/Zbj6gA=; b=riRR8UFtMC2HOdFBkapUZC45C9
	cDgGLeed/v3CLuX4m4dvX5hkKt95oZMYXu+pqeHfOXEUSxuPvYJdACHJgi6eY8jqb5V8sXIfSpA7S
	lNFeYQDrr8o1ebcF+InhbSJTn+S/Itkqzu7K5NacMsSgdclIR+cBMdpVN6YMphTiZbho=;
Message-ID: <920df8b2-e097-7558-bf92-5e7e4a13f450@xen.org>
Date: Fri, 9 Jun 2023 18:52:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH v3 03/16] tools/xenstore: modify interface of
 create_hashtable()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530085418.5417-1-jgross@suse.com>
 <20230530085418.5417-4-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230530085418.5417-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 30/05/2023 09:54, Juergen Gross wrote:
> The minsize parameter of create_hashtable() doesn't have any real use
> case for Xenstore, so drop it.
> 
> For better talloc_report_full() diagnostic output add a name parameter
> to create_hashtable().
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

