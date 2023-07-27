Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1B5765DAD
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 23:03:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571265.894704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP88R-00047u-JB; Thu, 27 Jul 2023 21:02:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571265.894704; Thu, 27 Jul 2023 21:02:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP88R-00045e-GY; Thu, 27 Jul 2023 21:02:59 +0000
Received: by outflank-mailman (input) for mailman id 571265;
 Thu, 27 Jul 2023 21:02:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qP88Q-00045Y-Rj
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 21:02:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qP88Q-00087k-8c; Thu, 27 Jul 2023 21:02:58 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qP88Q-0000QL-3r; Thu, 27 Jul 2023 21:02:58 +0000
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
	bh=o7uZ+Q2BtEZ55P9bEmiu5QcU7ktieuMi5uLVV8JVEf4=; b=IYJLLM0CyEk7FcIKs77aKILpZQ
	wDRbb4GN5NoRMqQhgHoDTUXgC9/2rahtaeWPgVS3imRsWJf19tnKh9MY2V5t6a0tQgau0lHcgNv0x
	JJBkF45YvISuTxELRNUDbAOWFZjh7qfuSf+JFdRBcXNHhXh5l73RSmjmU1oxfYOvjpqc=;
Message-ID: <d87f1a06-c1ce-d5c6-ce96-5614f12a2344@xen.org>
Date: Thu, 27 Jul 2023 22:02:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v3 00/25] tools/xenstore: drop TDB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230724110247.10520-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 24/07/2023 12:02, Juergen Gross wrote:
> Juergen Gross (25):
>    tools/xenstore: explicitly specify create or modify for tdb_store()
>    tools/xenstore: replace key in struct node with data base name
>    tools/xenstore: let transaction_prepend() return the name for access
>    tools/xenstore: rename do_tdb_delete() and change parameter type
>    tools/xenstore: rename do_tdb_write() and change parameter type
>    tools/xenstore: switch get_acc_data() to use name instead of key
>    tools/xenstore: add wrapper for tdb_fetch()

I have committed up to this patch.

Cheers,

-- 
Julien Grall

