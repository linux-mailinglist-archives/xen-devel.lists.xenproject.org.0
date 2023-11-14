Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 084487EB92E
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 23:13:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633301.988014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r31eI-0006TE-SQ; Tue, 14 Nov 2023 22:12:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633301.988014; Tue, 14 Nov 2023 22:12:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r31eI-0006R0-OD; Tue, 14 Nov 2023 22:12:46 +0000
Received: by outflank-mailman (input) for mailman id 633301;
 Tue, 14 Nov 2023 22:12:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r31eH-0006Qu-HU
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 22:12:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r31eG-0000PN-Ub; Tue, 14 Nov 2023 22:12:44 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r31eG-0007dp-Nv; Tue, 14 Nov 2023 22:12:44 +0000
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
	bh=r62ZJ3GOUBlg8aH+/dMYP0mBVAWLLeanObaGFVwIVSg=; b=zqRgKoUTighEm3QOx/d2//UUQZ
	lO9tew03NjwWZKZK4OCtsAZ3UcXDOiRi8abnQ3i3WfrbsrBw9MUyxQIjA+JK8XgtIXS2mHqEEwFVX
	l729rmxTx25lgi1MU6Ua5FSWRvjuroMjOi0fGbmVe2rF+lD2CjWEcQJiWr4Hof22SgSY=;
Message-ID: <f63fa9b5-a821-49d4-88f6-7d991ab6c644@xen.org>
Date: Tue, 14 Nov 2023 22:12:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 1/2] automation/eclair: make the docs for MISRA
 C:2012 Dir 4.1 visible to ECLAIR
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, jbeulich@suse.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>
References: <cover.1699975581.git.nicola.vetrini@bugseng.com>
 <f14b266f18089f5951a3e390a5ebfe713beb8dbb.1699975581.git.nicola.vetrini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f14b266f18089f5951a3e390a5ebfe713beb8dbb.1699975581.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/11/2023 15:36, Nicola Vetrini wrote:
> To be able to check for the existence of the necessary subsections in
> the documentation for MISRA C:2012 Dir 4.1, ECLAIR needs to have a source
> file that is built.
> 
> This file is generated from 'C-runtime-failures.rst' in docs/misra
> and the configuration is updated accordingly.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> Changes from RFC:
> - Dropped unused/useless code
> - Revised the sed command
> - Revised the clean target
> 
> Changes in v2:
> - Added explanative comment to the makefile
> - printf instead of echo
> 
> Changes in v3:
> - Terminate the generated file with a newline
> - Build it with -std=c99, so that the documentation
>    for D1.1 applies.
> Changes in v5:
> - Transform and build the file directly in the eclair-specific directory
> ---
>   automation/eclair_analysis/build.sh   | 21 +++++++++++++++++++--
>   automation/eclair_analysis/prepare.sh |  7 ++++---
>   2 files changed, 23 insertions(+), 5 deletions(-)
> 
> diff --git a/automation/eclair_analysis/build.sh b/automation/eclair_analysis/build.sh
> index ec087dd822fa..f24292ed0643 100755
> --- a/automation/eclair_analysis/build.sh
> +++ b/automation/eclair_analysis/build.sh
> @@ -33,12 +33,29 @@ else
>     PROCESSORS=6
>   fi
>   
> +runtime_failures_docs() {
> +  doc="C-runtime-failures.rst"
> +  builddir="automation/eclair_analysis"
> +
> +  cp "docs/misra/${doc}" "${builddir}"

Is it necessary to copy the .rst? IOW, would it be sufficient to use...

> +  cd "${builddir}"
> +  printf "/*\n\n" >"${doc}.tmp"
> +  sed -e 's|\*/|*//*|g' "${doc}" >>"${doc}.tmp"

... docs/misc/${doc} here?

> +  printf "\n\n*/\n" >>"${doc}.tmp"
> +  mv "${doc}.tmp" "${doc}.c"

NIT: I am not sure why you need to first create .tmp and then create.c.

> +
> +  # Cannot redirect to /dev/null because it would be excluded from the analysis
> +  "${CROSS_COMPILE}gcc-12" -std=c99 -c "${doc}.c" -o "${doc}.o"

NIT: It would be helpful to specify why -std=c99 is used. Above, you 
suggest this is to enable D1.1.

NIT: Can we define CC and use here and ...

> +  cd -
> +}
> +
>   (
> -  cd xen
> +  runtime_failures_docs
>   
>     make "-j${PROCESSORS}" "-l${PROCESSORS}.0"    \
>          "CROSS_COMPILE=${CROSS_COMPILE}"         \
>          "CC=${CROSS_COMPILE}gcc-12"              \

...? This would make easier to re-use the code.

>          "CXX=${CROSS_COMPILE}g++-12"             \
> -       "XEN_TARGET_ARCH=${XEN_TARGET_ARCH}"
> +       "XEN_TARGET_ARCH=${XEN_TARGET_ARCH}"     \
> +       -C xen
>   )
> diff --git a/automation/eclair_analysis/prepare.sh b/automation/eclair_analysis/prepare.sh
> index 0cac5eba00ae..fe9d16e48ecc 100755
> --- a/automation/eclair_analysis/prepare.sh
> +++ b/automation/eclair_analysis/prepare.sh
> @@ -35,11 +35,12 @@ else
>   fi
>   
>   (
> -    cd xen
> -    cp "${CONFIG_FILE}" .config
> +    ./configure
> +    cp "${CONFIG_FILE}" xen/.config
>       make clean
>       find . -type f -name "*.safparse" -print -delete
> -    make -f ${script_dir}/Makefile.prepare prepare
> +    cd xen
> +    make -f "${script_dir}/Makefile.prepare" prepare
>       # Translate the /* SAF-n-safe */ comments into ECLAIR CBTs
>       scripts/xen-analysis.py --run-eclair --no-build --no-clean
>   )

Cheers,

-- 
Julien Grall

