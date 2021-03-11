Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A82336F5D
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 10:55:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96419.182384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKI2S-0008Hf-62; Thu, 11 Mar 2021 09:55:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96419.182384; Thu, 11 Mar 2021 09:55:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKI2S-0008HC-1U; Thu, 11 Mar 2021 09:55:28 +0000
Received: by outflank-mailman (input) for mailman id 96419;
 Thu, 11 Mar 2021 09:55:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lKI2P-0008Gt-QD
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 09:55:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lKI2O-0002Ab-Gx; Thu, 11 Mar 2021 09:55:24 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lKI2O-0008FB-5u; Thu, 11 Mar 2021 09:55:24 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Wc7PHMegeQlqr3XGkjq6u6HbJjpLeO6qTp+ms/Kl+yg=; b=OT5QDv//1IGW6Go4ZBDqpmtPDS
	iiHFn7D44+bq74GRvtumGpf8TBrnNyu//f4oBOYuA/k9zA8at1sC7vrNO/EXFC/QYIeRu6tuqmDBi
	A8BzZkH02FVXht9+s978YuJyyOwu9c/YoOGVd926R+z823nzBq36xtBHx0L08yleVR/4=;
Subject: Re: [PATCH for-4.15] arm: replace typeof() with __typeof__()
To: Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Elliott Mitchell <ehem+xen@m5p.com>
References: <202103092114.129LEgZp059925@m5p.com>
 <eaef1b6d-db89-945a-e8be-2b3f9145780c@citrix.com>
 <e8c826f7-8bf5-fb5d-c1ec-97d8ba1d79d0@suse.com>
 <24648.44584.312512.639736@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <65481c0a-5c1f-5c87-0697-72a04654f90c@xen.org>
Date: Thu, 11 Mar 2021 09:55:22 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <24648.44584.312512.639736@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 10/03/2021 11:31, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH for-4.15] arm: replace typeof() with __typeof__()"):
>> On 09.03.2021 22:27, Andrew Cooper wrote:
>>> This wants backporting as a build fix, so should be considered for 4.15
>>> at this point.
> 
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Thanks! I have committed the patch now.

Cheers,

-- 
Julien Grall

