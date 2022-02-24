Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 182AB4C2F42
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 16:19:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278378.475609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNFtY-0007kO-HZ; Thu, 24 Feb 2022 15:19:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278378.475609; Thu, 24 Feb 2022 15:19:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNFtY-0007hH-Cy; Thu, 24 Feb 2022 15:19:04 +0000
Received: by outflank-mailman (input) for mailman id 278378;
 Thu, 24 Feb 2022 15:19:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nNFtX-0007gw-37
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 15:19:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nNFtW-0008Ia-Nu; Thu, 24 Feb 2022 15:19:02 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226] helo=[10.7.236.14])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nNFtW-0001jh-I5; Thu, 24 Feb 2022 15:19:02 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=IwLZCFnhujonOevLJT+dR1g+s6GliwijhPausKgPrFI=; b=5y1wwG5ewDAnwr//f2IhkND79p
	hVa0UXBx15D47gZsIG/biUGJe3ENQUhHydcvwfUqfb7OkPZZQ11J0XVf/zy8aadBxeaTjrhjT/vo5
	ZWV+aYZ7nIdJt+vvsXKe5YqX/aOXj1xQVCyQQu2vFZizmjH/695vRoXYSxJACiMSPBLg=;
Message-ID: <6e2e15ad-024d-09f8-f80d-b437ab958ed0@xen.org>
Date: Thu, 24 Feb 2022 15:19:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2] docs: add some clarification to xenstore-migration.md
From: Julien Grall <julien@xen.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220217114726.8994-1-jgross@suse.com>
 <5f1d5525-3c3f-bad9-3448-c266d0ad5004@xen.org>
In-Reply-To: <5f1d5525-3c3f-bad9-3448-c266d0ad5004@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 17/02/2022 19:38, Julien Grall wrote:
> On 17/02/2022 11:47, Juergen Gross wrote:
>> The Xenstore migration document is missing the specification that a
>> node record must be preceded by the record of its parent node in case
>> of live update.
> The patch also cover normal migration. So I think you want to drop " in 
> case of live update".
> 
> I can do the modification on commit:
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

I have committed the patch.

Cheers,

-- 
Julien Grall

