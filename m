Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFF6761DEF
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 18:02:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569815.890928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOKTY-00008p-CG; Tue, 25 Jul 2023 16:01:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569815.890928; Tue, 25 Jul 2023 16:01:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOKTY-00006L-8n; Tue, 25 Jul 2023 16:01:28 +0000
Received: by outflank-mailman (input) for mailman id 569815;
 Tue, 25 Jul 2023 16:01:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qOKTX-00006F-2b
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 16:01:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qOKTW-0006Wp-8D; Tue, 25 Jul 2023 16:01:26 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.17.43]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qOKTW-0002jH-1u; Tue, 25 Jul 2023 16:01:26 +0000
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
	bh=TTddz3KDHA+u9P8uLHSBtOip9rReMIppMTqy0uZHQZ0=; b=zBQm3AMSSEulvFIJBLE0yTaQ4C
	h9gsmoStonFhnjlzwOXRgA9+4n8R3l8tzVMxVRYUb2oXExisW2kfJVG5wIEfzrYsVCUbUz+dAnMiV
	5oEGI8pC1iwhH31u5cteEj1hhjWvkFTxQ+unBif99i0DkXX05HWmCMyoU2v/uXLKSFBA=;
Message-ID: <c5314cd4-eba6-0dba-1fd0-77cdbc710a0a@xen.org>
Date: Tue, 25 Jul 2023 17:01:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v3 01/25] tools/xenstore: explicitly specify create or
 modify for tdb_store()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-2-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230724110247.10520-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 24/07/2023 12:02, Juergen Gross wrote:
> Instead of using TDB_REPLACE for either creating or modifying a TDB
> entry, use either TDB_INSERT or TDB_MODIFY when calling tdb_store().
> 
> At higher function levels use the abstract mode values NODE_CREATE
> and NODE_MODIFY.
> 
> This is for preparing to get rid of TDB, even if it is beneficial
> while using TDB, too.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

