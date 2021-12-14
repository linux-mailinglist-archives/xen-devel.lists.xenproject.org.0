Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3003A474BC2
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 20:20:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247050.426045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxDKP-0000qd-PB; Tue, 14 Dec 2021 19:19:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247050.426045; Tue, 14 Dec 2021 19:19:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxDKP-0000nA-LC; Tue, 14 Dec 2021 19:19:09 +0000
Received: by outflank-mailman (input) for mailman id 247050;
 Tue, 14 Dec 2021 19:19:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mxDKN-0000n4-SP
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 19:19:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxDKM-0006zs-Fq; Tue, 14 Dec 2021 19:19:06 +0000
Received: from [54.239.6.190] (helo=[192.168.26.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxDKM-0005Jv-7s; Tue, 14 Dec 2021 19:19:06 +0000
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
	bh=VWuuhPiWxrynR9YP+MPVfYcQ6l8C+r8VC875tn3U7L4=; b=SiV4qGUePjlBILafP/4lyhezxl
	oMaO28feyiS4aayFPi6/kkn0rcz0S28zbhaP4j2w4WIMRC8Gu63ZJmLzeN6M8+g5etAtVkNlRPYAu
	SdWM0nea5EASXCRFTDslq4d4n7kHHq+LLb7JUh0/FJqXv1sZTaeetEjNQ1kuXZ+f80cI=;
Message-ID: <4ed5073e-8083-ac72-6477-676eaf2e2eb8@xen.org>
Date: Tue, 14 Dec 2021 19:19:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH] SUPPORT.md, MAINTAINERS: De-support qemu-xen-traditional
To: Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20211209142640.24437-1-iwj@xenproject.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211209142640.24437-1-iwj@xenproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ian,

On 09/12/2021 14:26, Ian Jackson wrote:
> In 4.16 we changed to not build this by default.  I think it is now
> time to explicitly desupport it, completely, in favour of Linux dm
> stub domains.
> 
> Signed-off-by: Ian Jackson <iwj@xenproject.org>
> ---
>   MAINTAINERS |  2 +-
>   SUPPORT.md  | 18 +++++++++---------
>   2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e43dc0edce..933579541f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -455,7 +455,7 @@ S:	Supported
>   F:	tools/python
>   
>   QEMU-DM
> -S:	Supported
> +S:	Obsolete
>   T:	git https://xenbits.xenproject.org/git-http/qemu-xen-traditional.git
>   
>   QEMU UPSTREAM
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 3a34933c89..b64ebee93b 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -802,17 +802,17 @@ See the section **Blkback** for image formats supported by QEMU.
>   ### qemu-xen-traditional ###
>   
>   The Xen Project provides an old version of qemu with modifications
> -which enable use as a device model stub domain.  The old version is
> -normally selected by default only in a stub dm configuration, but it
> -can be requested explicitly in other configurations, for example in
> -`xl` with `device_model_version="QEMU_XEN_TRADITIONAL"`.
> +which enable use as a device model stub domain.  This old version is
> +not built by default.  Even if it is build, it is normally selected by
> +default only in a stub dm configuration, but it can be requested
> +explicitly in other configurations, for example in `xl` with
> +`device_model_version="QEMU_XEN_TRADITIONAL"`.
>   
> -    Status, Device Model Stub Domains: Supported, with caveats
> -    Status, as host process device model: No security support, not recommended
> +When device model stub domains are desired for the additional
> +security, we recommend using a device model stub domain consisting of
> +a modern qemu and a Linux kernel.

Looking at SUPPORT.md, we have:

### Linux device model stubdomains

Support for running qemu-xen device model in a linux stubdomain.

     Status: Tech Preview

Is it still accurate? If yes, I am not sure we can recommend user to 
switch to Linux stubdomain until this is fully supported.

Cheers,

-- 
Julien Grall

