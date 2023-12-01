Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4206280131C
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 19:49:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645654.1007879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r98aB-0008IX-AQ; Fri, 01 Dec 2023 18:49:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645654.1007879; Fri, 01 Dec 2023 18:49:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r98aB-0008GZ-69; Fri, 01 Dec 2023 18:49:47 +0000
Received: by outflank-mailman (input) for mailman id 645654;
 Fri, 01 Dec 2023 18:49:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r98a9-0008GR-TN
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 18:49:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r98a9-00064I-Q4; Fri, 01 Dec 2023 18:49:45 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r98a9-0000SH-Iu; Fri, 01 Dec 2023 18:49:45 +0000
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
	bh=+HISquiAvBzODWLHuNwOOj6O0ivE4JZ+sOGDAqBj9wY=; b=WIA2V3oQ4ex0SRbaVHetpugt4i
	DbirR4bHtTcMxjcsAIz1R2vAoHn5Yles6dj66ghKUmY/Z1XnMAtlYGHXnROCQWrmQH7kkTqHdEfJ9
	hjBU4NQ80WMmPCV55V28x3PduxDQr1Wt/7dvV1ZwmRCOZA9Vctx5pKnF4eanItohptvA=;
Message-ID: <0e20592b-9800-4b9d-9f2f-a996f9ac00bd@xen.org>
Date: Fri, 1 Dec 2023 18:49:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CODING_STYLE: Add a section of the naming convention
Content-Language: en-GB
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20231201184728.31766-1-julien@xen.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231201184728.31766-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/12/2023 18:47, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Several maintainers have expressed a stronger preference
> to use '-' when in filename and option that contains multiple
> words.
> 
> So document it in CODING_STYLE.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>   CODING_STYLE | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/CODING_STYLE b/CODING_STYLE
> index ced3ade5a6fb..afd09177745b 100644
> --- a/CODING_STYLE
> +++ b/CODING_STYLE
> @@ -144,6 +144,15 @@ separate lines and each line should begin with a leading '*'.
>    * Note beginning and end markers on separate lines and leading '*'.
>    */
>   
> +Naming convention
> +-----------------
> +
> +When command line option or filename contain multiple words, a '-'
> +should be to separate them. E.g. 'timer-works'.
> +
> +Note that some of the option and filename are using '_'. This is now
> +deprecated.

Urgh, I sent the wrong draft :(. This is the wording I wanted to propose:

+Naming convention
+-----------------
+
+'-' should be used to separate words in commandline options and filenames.
+E.g. timer-works.
+
+Note that some of the options and filenames are using '_'. This is now
+deprecated.
+

Cheers,

-- 
Julien Grall

