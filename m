Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB12A55BEC
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 01:28:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904387.1312267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqLa2-0006wd-G9; Fri, 07 Mar 2025 00:28:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904387.1312267; Fri, 07 Mar 2025 00:28:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqLa2-0006tv-CY; Fri, 07 Mar 2025 00:28:46 +0000
Received: by outflank-mailman (input) for mailman id 904387;
 Fri, 07 Mar 2025 00:28:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nrba=V2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tqLa1-0006tp-Fb
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 00:28:45 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20185a86-faeb-11ef-9ab4-95dc52dad729;
 Fri, 07 Mar 2025 01:28:44 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F1C3C5C5B53;
 Fri,  7 Mar 2025 00:26:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBB24C4CEE0;
 Fri,  7 Mar 2025 00:28:41 +0000 (UTC)
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
X-Inumbo-ID: 20185a86-faeb-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741307322;
	bh=DseHk7TQgpv0Ka0ULO2XRWjossUKuRaHhlInfJACrBQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=a7DR0L+ypCNtKDapF39D8c4Lx7bhK7DtFyocQhJh9X+rpnIzytA5P2aubHjvCtEk7
	 9lC72In83oRbeLf3OeKSYkl79XeVTMnfkCK6NyRbGG5RjMqszJlHGvMMt5RtNRsop8
	 Cl6K1VAn013MsMDJo76a8BaXRZeAuRnYNWdJFkuUWkhPAQcpgPqktWCtNCb3cU+dd1
	 70lmvLxo+yUuaK6PaBzI2AYYaoKZg3QiKlUTBF3Q2ffrV/LQ/vGihWOrfIjtn26dUb
	 xZDH/d83G8EgAwuNAFe+kn8o8q1yiX0qcVzdLlPgIzMYmKLu/qUUfMjkjirDZND+0E
	 fBfxgUQFtZiWA==
Date: Thu, 6 Mar 2025 16:28:41 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: [IMAGEBUILDER PATCH] Add domain capabilities
In-Reply-To: <20250306221310.203221-1-jason.andryuk@amd.com>
Message-ID: <alpine.DEB.2.22.394.2503061628300.2600338@ubuntu-linux-20-04-desktop>
References: <20250306220343.203047-1-jason.andryuk@amd.com> <20250306221310.203221-1-jason.andryuk@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 6 Mar 2025, Jason Andryuk wrote:
> Add domain capabilities to creating disaggregated systems.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  README.md                | 16 ++++++++++++++
>  scripts/uboot-script-gen | 47 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 63 insertions(+)
> 
> diff --git a/README.md b/README.md
> index ae2fdfd..25c9b6e 100644
> --- a/README.md
> +++ b/README.md
> @@ -250,6 +250,22 @@ Where:
>    Set driver_domain in xl config file. This option is only available for
>    the disk_image script.
>  
> +- DOMU_CAPS[number] = "string" or "hex" (optional)
> +  A "|"-concatentated string of capabilities:
> +    - control
> +    - hardware
> +    - xenstore
> +    - dom0 (All of the above)
> +    - none
> +
> +  e.g. "control|hardware"
> +
> +  Or a numeric bitwise flags to specify domain capabilities:
> +  0: None
> +  1: Control
> +  2: Hardware
> +  4: Xenstore
> +
>  - LINUX is optional but specifies the Linux kernel for when Xen is NOT
>    used.  To enable this set any LINUX\_\* variables and do NOT set the
>    XEN variable.
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index db2c011..397d73b 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -309,6 +309,43 @@ function add_device_tree_cpupools()
>      done
>  }
>  
> +function parse_domain_caps()
> +{
> +    local caps_str="$1"
> +    local caps=0
> +
> +    for x in $( echo $caps_str | sed 's/|/ /g' | tr '[:upper:]' '[:lower:]' )
> +    do
> +        case "$x" in
> +        none)
> +            caps=$(( caps | 0 ))
> +            ;;
> +        control)
> +            caps=$(( caps | 0x1 ))
> +            ;;
> +        hardware)
> +            caps=$(( caps | 0x2 ))
> +            ;;
> +        xenstore)
> +            caps=$(( caps | 0x4 ))
> +            ;;
> +        dom0|domain0)
> +            caps=$(( caps | 0x7 ))
> +            ;;
> +        [0-9]*|0x[0-9a-fA-f]*)
> +            caps=$(( caps | $x ))
> +            ;;
> +        *)
> +            return 1
> +            ;;
> +        esac
> +    done
> +
> +    echo "$caps"
> +
> +    return 0
> +}
> +
>  function xen_device_tree_editing()
>  {
>      dt_set "/chosen" "#address-cells" "hex" "0x2"
> @@ -386,6 +423,16 @@ function xen_device_tree_editing()
>          then
>              dt_set "/chosen/domU$i" "max_maptrack_frames" "int" "${DOMU_MAPTRACK_FRAMES[i]}"
>          fi
> +        if test -n "${DOMU_CAPS[i]}"
> +        then
> +            local caps
> +
> +            if ! caps=$( parse_domain_caps ${DOMU_CAPS[i]} ) ; then
> +                echo "Invalid DOMU_CAPS[$i] \"${DOMU_CAPS[i]}\""
> +                cleanup_and_return_err
> +            fi
> +            dt_set "/chosen/domU$i" "capabilities" "int" "$caps"
> +        fi
>  
>          if test -n "${DOMU_SHARED_MEM[i]}"
>          then
> -- 
> 2.48.1
> 

