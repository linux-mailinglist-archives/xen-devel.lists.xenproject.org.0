Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9232E5F8A80
	for <lists+xen-devel@lfdr.de>; Sun,  9 Oct 2022 12:16:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418976.663692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohTKn-00041U-7E; Sun, 09 Oct 2022 10:15:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418976.663692; Sun, 09 Oct 2022 10:15:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohTKn-0003zH-4Q; Sun, 09 Oct 2022 10:15:01 +0000
Received: by outflank-mailman (input) for mailman id 418976;
 Sun, 09 Oct 2022 10:14:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ohTKl-0003zB-HR
 for xen-devel@lists.xenproject.org; Sun, 09 Oct 2022 10:14:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ohTKk-00047M-7U; Sun, 09 Oct 2022 10:14:58 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ohTKk-0002xV-1K; Sun, 09 Oct 2022 10:14:58 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=gGkiVbiKCcq5WPm6rQqeDJd0L2Y4IZoyaoPOQ/AJXF0=; b=VxcoulwSI1D70k0F1mmzHZ8gnm
	CGM8oS6eb673yeDgvt67XxE/pB1jb/0rH3v50vIyC6vgqJV2gdCi1/4HMppSpeS2dI9Sj4Z+z8r7y
	2kp0GPAfUQUCarIKDBPfGo3iPfQ0zZdWFC5G6hHRlJ7tTf82w8rc4rub/xHbc3SGlIM0=;
Message-ID: <b87e4263-4018-b840-74be-965aec89d187@xen.org>
Date: Sun, 9 Oct 2022 11:14:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: wl@xen.org, jbeulich@suse.com, george.dunlap@citrix.com,
 andrew.cooper3@citrix.com, bertrand.marquis@arm.com,
 Volodymyr_Babchuk@epam.com, roger.pau@citrix.com,
 Stefano Stabellini <stefano.stabellini@amd.com>
References: <alpine.DEB.2.22.394.2210071710070.3690179@ubuntu-linux-20-04-desktop>
 <20221008001544.78302-4-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 4/4] Remove extra copies of licenses and license
 headers
In-Reply-To: <20221008001544.78302-4-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 08/10/2022 01:15, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Remove the extra copy of the GPL license and license copyright headers
> from CONTRIBUTING and the top-level COPYING.
> 
> Mention of the LICENSES/ directory and also mention the SPDX tag.
> 
> SPDX support is still in progress and COPYING files in subdirectories
> still need to be updated.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> Patch new in v3
> ---
>   CONTRIBUTING | 150 ++--------------------
>   COPYING      | 351 +--------------------------------------------------
>   2 files changed, 17 insertions(+), 484 deletions(-)
> 
> diff --git a/CONTRIBUTING b/CONTRIBUTING
> index 6ec146baf0..7b6b03fb96 100644
> --- a/CONTRIBUTING
> +++ b/CONTRIBUTING
> @@ -19,10 +19,6 @@ Most notably:
>    - tools/xl           : LGPL v2.1
>    - xen/include/public : MIT license
>   
> -The COMMON COPYRIGHT NOTICES section of this document contains
> -sample copyright notices for the most common licenses used within
> -this repository.
> -

How about replacing this section with something like:

" See LICENSES/ for a list of licenses and SPDX tags currently used."

>   When creating new components, new files, or importing code please follow
>   the conventions outlined below. As a general rule, whenever code using a
>   license other than GPLv2 is introduced, attention must be drawn to the
> @@ -32,20 +28,22 @@ deviation. Any new code must be GPLv2 compatible.
>   New components
>   --------------
>   
> -When creating new components and directories that contain a
> -significant amount of files that are licensed under licenses other
> -than GPLv2 or the license specified in the COPYING file, please
> -create a new COPYING file in that directory containing a copy of the
> -license text and a rationale for using a different license. This helps
> -ensure that the license of this new component/directory is maintained
> -consistently with the original intention.
> +When creating new components and directories that contain a significant
> +amount of files that are licensed under licenses other than GPLv2,
> +please create a new COPYING file in that directory with the rationale
> +for using a different license. This helps ensure that the license of
> +this new component/directory is maintained consistently with the
> +original intention.

I don't understand why the wording "or the license specified in the 
COPYING file" is dropped. To me, the sentence was indicating that it is 
not necessary to create a COPYING file in every sub-directory if the 
license is not GPLv2 and it matches the license of a parent directory.

Do you plan to remove COPYING completely?

>   
>   New files
>   ---------
>   
> -If specific files that differ from the license in a directory are introduced,

This is fine to drop but ...

> -exceptions should be highlighted and discussed in the commit message or cover
> -letter introducing the file.

... I think this should be kept because we want to have justification 
why the license of a file doesn't match the license of the directory.

> +New files should start with a single-line SPDX comment to express the
> +license. The following comment and license are recommended:

Someone reading this may think that a new file in libxl wants to be 
GPLv2. So I would add in parentheses that the license may be different 
in some directory.

Similarly, I think this should be stronger than recommended. The SPDX 
should be a *must* and for the license there are effectively little 
leeway in which one we could use for existing components.
So how about:

"For instance, if the file is GPLv2, the comment would look like:

/* SPDX-License-Identifier... */

The recommended license of a directory will depend on the COPYING file. 
If the new file is using a different license, this should be highlighted 
and discussed in the commit message or cover letter introducing the file.
"

Cheers,

-- 
Julien Grall

