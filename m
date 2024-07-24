Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C6C93B8C8
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 23:46:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764525.1174994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWjnn-0005gl-05; Wed, 24 Jul 2024 21:45:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764525.1174994; Wed, 24 Jul 2024 21:45:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWjnm-0005e7-Rl; Wed, 24 Jul 2024 21:45:38 +0000
Received: by outflank-mailman (input) for mailman id 764525;
 Wed, 24 Jul 2024 21:45:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ik8X=OY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sWjnl-0005e1-Da
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 21:45:37 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0de26c3d-4a06-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 23:45:34 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 27FA961232;
 Wed, 24 Jul 2024 21:45:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 136ACC32781;
 Wed, 24 Jul 2024 21:45:31 +0000 (UTC)
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
X-Inumbo-ID: 0de26c3d-4a06-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721857532;
	bh=PI1sF0WC4cuOOemn4pl0GJf1GEmVZf9Ce5PDuMa6gjM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gjbXZxkgtSPx5gpJSwA9qT46Q2gWSqDSShGVAJ5IfZ15iHafDSLvlD8UcVukxSf3v
	 sv1ZKMIqjvnvSGwSdRjyacOaR3/+sAVYRdFLl1d0xPnZB+eplZLQxz1PskiRi/ugmb
	 EQiRvgWDMg5nIsLJAPmzsbPeQFlmK1MucPkSJL+dlcfOxCM3kjATLTADzrNkfC7Z5i
	 +l02Ccany17GMKA9YSJYKzjpYWecbkXa4FHOciHMI6j4A97E6+XNeNTaefCBlvuQJU
	 HK20sZOb6I3VTWaKNFH2hDUqo0DM7y3g1QJbgv5CZvxPfKtbRPVQX843GfvBLV56vd
	 N6CCDFrw5HFDA==
Date: Wed, 24 Jul 2024 14:45:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Victor Lira <victorm.lira@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, roberto.bagnara@bugseng.com, 
    consulting@bugseng.com, simone.ballarin@bugseng.com
Subject: Re: [RFC PATCH v2] automation: add linker symbol name script
In-Reply-To: <5b2862d6d036248e8cdd76e9884f173c6b7ff325.1721842334.git.victorm.lira@amd.com>
Message-ID: <alpine.DEB.2.22.394.2407241441480.4857@ubuntu-linux-20-04-desktop>
References: <5b2862d6d036248e8cdd76e9884f173c6b7ff325.1721842334.git.victorm.lira@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 24 Jul 2024, victorm.lira@amd.com wrote:
> From: Victor Lira <victorm.lira@amd.com>
> 
> Signed-off-by: Victor Lira <victorm.lira@amd.com>
> Requested-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> Notes:
> This is a utilty script for help with the MISRA process.
> This script matches all linker symbol names in linker script files for
> arm and x86.
> Not included are symbol names starting with "." or symbol names enclosed
> in quotes since the files dont't use any. The regular expression also does
> not match for "&=" and similar compound assignments.
> ---
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: roberto.bagnara@bugseng.com
> Cc: consulting@bugseng.com
> Cc: simone.ballarin@bugseng.com
> ---
> Changes v2:
> - address style comments
> - updated script to use .lds instead of .lds.S
> - remove sample output from patch
> ---
>  automation/eclair_analysis/linker-symbols.sh | 34 ++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100755 automation/eclair_analysis/linker-symbols.sh
> 
> diff --git a/automation/eclair_analysis/linker-symbols.sh b/automation/eclair_analysis/linker-symbols.sh
> new file mode 100755
> index 0000000000..35ec97eb8e
> --- /dev/null
> +++ b/automation/eclair_analysis/linker-symbols.sh
> @@ -0,0 +1,34 @@

Hi Victor,

A previous comment about the presence of /bin/bash meant to suggest to
use instead something like:

#!/usr/bin/env bash

or if you don't use any bash-ism:

#!/bin/sh

The rest looks OK to me


> +# Stop immediately if any executed command has exit status different from 0.
> +set -e
> +
> +# Extract linker symbol names (except those starting with ".") from assignments.
> +
> +script_name=$(basename "$0")
> +script_dir="$(
> +  cd "$(dirname "$0")"
> +  echo "${PWD}"
> +)"
> +src_dir="${script_dir}/../.."
> +
> +usage() {
> +  echo "Usage: ${script_name} <arm|x86>"
> +}
> +
> +if [ $# -ne 1 ]; then
> +  usage
> +  exit 1
> +fi
> +
> +if [ "$1" != "arm" ] && [ "$1" != "x86" ]; then
> +    usage
> +    exit 1
> +fi
> +
> +filepath="${src_dir}/xen/arch/${1}/xen.lds"
> +
> +if [ ! -f "$filepath" ]; then
> +    echo "Must be run after build."
> +    exit 2
> +fi
> +
> +sed -n "s/^\s*\([a-zA-Z_][a-zA-Z_0-9.\-]*\)\s*=.*;.*$/\1/p" $filepath
> --
> 2.25.1
> 

