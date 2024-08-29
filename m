Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90534963707
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 02:48:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785344.1194797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjTKu-00075G-Vq; Thu, 29 Aug 2024 00:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785344.1194797; Thu, 29 Aug 2024 00:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjTKu-00072R-Sl; Thu, 29 Aug 2024 00:48:28 +0000
Received: by outflank-mailman (input) for mailman id 785344;
 Thu, 29 Aug 2024 00:48:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i2Q5=P4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sjTKt-00072L-Sc
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 00:48:27 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6624c521-65a0-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 02:48:26 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 02979A437A8;
 Thu, 29 Aug 2024 00:48:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F228C4CEC0;
 Thu, 29 Aug 2024 00:48:23 +0000 (UTC)
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
X-Inumbo-ID: 6624c521-65a0-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724892504;
	bh=Z6XxHWm2G5Gj/WMxdWAToykBCZyJ0Kzr8JWEK3KlLaE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aaHX+Ul7wWaT1iJIb/vq1EG3lvecVSO44igI5GKpmVe4rzE1FVKLWUVqcciVAYmvx
	 E3WOeuNiP3lbqtvXzPJzUavOaFPXXs+HJZTW8P8k1/okMjXqPxKMvcF91oHFliHxQW
	 7U5pBT1VPoXHkBQq08tkqVszUQSCIpmNXDYtuNhfbR4vQZPPJw8NwvEjzJVOEQxaPH
	 92kyfGw9Qmw7A6teSgMgprvevNEQ0i2UUXfiwMd9OZmL28bsotvHs9PHcs+I0Z4wo7
	 0X/PqSHNAd3zQZADW948K3axVBORC+r0avCn0KgUK9wXI318eyxZvcwvhvlzvdUxT7
	 1EcutVx4G6LPQ==
Date: Wed, 28 Aug 2024 17:48:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: victorm.lira@amd.com, Stefano Stabellini <sstabellini@kernel.org>, 
    roberto.bagnara@bugseng.com, consulting@bugseng.com, 
    simone.ballarin@bugseng.com, xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH v3] automation: add linker symbol name script
In-Reply-To: <68c3ac17-2ccb-40db-b105-712d444440c3@suse.com>
Message-ID: <alpine.DEB.2.22.394.2408281748050.53815@ubuntu-linux-20-04-desktop>
References: <29c7f6cd166d5d3c0e9f64dc937e29dc7ecf3f2d.1721933988.git.victorm.lira@amd.com> <68c3ac17-2ccb-40db-b105-712d444440c3@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 26 Jul 2024, Jan Beulich wrote:
> On 25.07.2024 21:01, victorm.lira@amd.com wrote:
> > From: Victor Lira <victorm.lira@amd.com>
> > 
> > Requested-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Victor Lira <victorm.lira@amd.com>
> 
> Looks okay to me now, just that I don't see ...
> 
> > --- /dev/null
> > +++ b/automation/eclair_analysis/linker-symbols.sh
> > @@ -0,0 +1,34 @@
> > +#!/bin/sh
> > +
> > +# Stop immediately if any executed command has exit status different from 0.
> > +set -e
> > +
> > +# Extract linker symbol names (except those starting with ".") from assignments.
> > +
> > +script_name=$(basename "$0")
> > +script_dir="$(
> > +  cd "$(dirname "$0")"
> > +  echo "${PWD}"
> > +)"
> > +src_dir="${script_dir}/../.."
> > +
> > +fatal() {
> > +  echo "${script_name}: $*" >&2
> > +  exit 1
> > +}
> > +
> > +usage() {
> > +  fatal "Usage: ${script_name} <arm|x86>"
> > +}
> > +
> > +if [ $# -ne 1 ]; then
> > +  usage
> > +fi
> > +
> > +filepath="${src_dir}/xen/arch/${1}/xen.lds"
> > +
> > +if [ ! -f "$filepath" ]; then
> > +  fatal "Could not find ${1} linker script. Must be run after arm/x86 build."
> 
> ... why you have "arm/x86" there when the message already includes ${1}.
> That'll simply go stale (and unnoticed) when PPC and/or RISC-V make further
> progress. Actually in usage() I'm similarly uncertain you want to mention
> the two architectures explicitly. Just say <arch> there? Happy to make
> adjustments while committing, so long as you agree.

I made the suggested changes on commit adding my R-b

