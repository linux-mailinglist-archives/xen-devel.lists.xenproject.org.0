Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D338672A1D1
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 20:10:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546286.853044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7gZ1-00065I-2F; Fri, 09 Jun 2023 18:10:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546286.853044; Fri, 09 Jun 2023 18:10:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7gZ0-00062Q-VV; Fri, 09 Jun 2023 18:10:18 +0000
Received: by outflank-mailman (input) for mailman id 546286;
 Fri, 09 Jun 2023 18:10:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q7gYz-00062G-Tl
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 18:10:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q7gYz-0003Nk-9n; Fri, 09 Jun 2023 18:10:17 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.17.204]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q7gYz-0002MO-4F; Fri, 09 Jun 2023 18:10:17 +0000
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
	bh=8tSQpT7KhEawzc0kQ/FE1YX7P/O+7wKbHKE6JsL1xBc=; b=2C6nTLa2gcjziNTosT3FqJbAl4
	M9hrUmp747iM81ZjDZGNZN2Kg2BFHwyWI+YcD8syNvpX7ayP8dBFcs4dZypgB1MtdxksgpaIj/6Bt
	3+Ha6yf5AZg1ZB6NWW5wtu8dV8fPXNK2gsAWjxWNOGh/z4UUzIHT2lAqKN1StxjJCAGI=;
Message-ID: <7f966e47-5fa9-9115-f4e9-b06cb01ec655@xen.org>
Date: Fri, 9 Jun 2023 19:10:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH v3 11/16] tools/libs/store: make libxenstore independent
 of utils.h
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530085418.5417-1-jgross@suse.com>
 <20230530085418.5417-12-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230530085418.5417-12-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 30/05/2023 09:54, Juergen Gross wrote:
> There is no real need for including tools/xenstore/utils.h from
> libxenstore, as only streq() and ARRAY_SIZE() are obtained via that
> header.
> 
> streq() is just !strcmp(), and ARRAY_SIZE() is brought in via
> xen-tools/common-macros.h.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

