Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF62808E35
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 18:08:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650051.1015307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBHrH-0001zC-CG; Thu, 07 Dec 2023 17:08:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650051.1015307; Thu, 07 Dec 2023 17:08:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBHrH-0001x1-9g; Thu, 07 Dec 2023 17:08:19 +0000
Received: by outflank-mailman (input) for mailman id 650051;
 Thu, 07 Dec 2023 17:08:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rBHrG-0001ve-A0
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 17:08:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rBHrF-0008OQ-My; Thu, 07 Dec 2023 17:08:17 +0000
Received: from [15.248.3.113] (helo=[10.24.67.25])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rBHrF-00074y-HM; Thu, 07 Dec 2023 17:08:17 +0000
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
	bh=WwsmGZVN/xWSBfU0j2LsxeV1lzCLnjz131N5lQXkExs=; b=UWkOBS4U3qRFU4f1FXgBG6e4pF
	P/ztvdXMrMtI1DJNH3vTIef7agps083k7xYh20jkiXO9dYZw5Go6Ht0NX3C5CuZZM6NjY/aeoberf
	2tB/OTnePGKW/+qykorVY/2uA9ZId6TYIWdIsargKruucnNXsLGuyGCaD2pmXHws9Zu8=;
Message-ID: <74abb34c-f253-4b4e-a3bb-3feb01fcc902@xen.org>
Date: Thu, 7 Dec 2023 17:08:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair_analysis: file exclusion automation
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <e17fba6f45a03f7acb0af342ed8aea97130dba4a.1701949157.git.nicola.vetrini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e17fba6f45a03f7acb0af342ed8aea97130dba4a.1701949157.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/12/2023 11:39, Nicola Vetrini wrote:
> +-doc_begin="libfdt is out of scope."
> +-file_tag+={out_of_scope,"^xen/include/xen/libfdt/.*$"}

AFAICT, before this was marked as "adopted". But this is now moved to 
"out_of_scope". Can you explain why?

It also feels somewhat unrelated to the rest of the patch.

Cheers,

-- 
Julien Grall

