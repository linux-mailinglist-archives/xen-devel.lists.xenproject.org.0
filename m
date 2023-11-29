Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8DB7FDE62
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 18:28:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644137.1004754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8OMb-0005qT-J9; Wed, 29 Nov 2023 17:28:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644137.1004754; Wed, 29 Nov 2023 17:28:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8OMb-0005oH-G6; Wed, 29 Nov 2023 17:28:41 +0000
Received: by outflank-mailman (input) for mailman id 644137;
 Wed, 29 Nov 2023 17:28:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r8OMZ-0005lf-LI
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 17:28:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r8OMY-00006V-I9; Wed, 29 Nov 2023 17:28:38 +0000
Received: from 82-132-227-204.dab.02.net ([82.132.227.204] helo=[172.20.10.4])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r8OMX-0003o8-W7; Wed, 29 Nov 2023 17:28:38 +0000
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
	bh=3ED1pTlBIGqd7MPFj7+cdnVivCSFMib2CsjU+HXYpMM=; b=ne7gcNY1k0Eny39+5Y/slr2tIL
	YVeD5tflBTZg9RErfbNvGuZH/Nub885hGTVXlQSAlsNQwVYTmREmMaZeV6IdRzv9+VUwo7IpqXEOR
	p4Owt0F7QPkMblV8d5Naz3ar6yeOSalQT5zx71q6/z5TSIHZAY7f001LZMiDP29wA5No=;
Message-ID: <f6993fac-2370-4a9d-81e7-fb95b6a96a63@xen.org>
Date: Wed, 29 Nov 2023 18:28:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v5 1/2] automation/eclair: make the docs for MISRA
 C:2012 Dir 4.1 visible to ECLAIR
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>
References: <cover.1700211131.git.nicola.vetrini@bugseng.com>
 <dd207f2aa0a79b784df5d042f8a0169707c21902.1700211131.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2311281916270.3533093@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2311281916270.3533093@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 29/11/2023 04:16, Stefano Stabellini wrote:
> On Fri, 17 Nov 2023, Nicola Vetrini wrote:
>> To be able to check for the existence of the necessary subsections in
>> the documentation for MISRA C:2012 Dir 4.1, ECLAIR needs to have a source
>> file that is built.
>>
>> This file is generated from 'C-runtime-failures.rst' in docs/misra
>> and the configuration is updated accordingly.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> It looks like you also addressed all Julien's comments appropriately

They are indeed. So I have committed the series.

Cheers,

-- 
Julien Grall

