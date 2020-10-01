Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 725032802E8
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 17:36:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1348.4485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kO0d6-000467-QM; Thu, 01 Oct 2020 15:36:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348.4485; Thu, 01 Oct 2020 15:36:24 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kO0d6-00045i-N0; Thu, 01 Oct 2020 15:36:24 +0000
Received: by outflank-mailman (input) for mailman id 1348;
 Thu, 01 Oct 2020 15:36:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jQH2=DI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kO0d5-00045W-5W
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 15:36:23 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 454e3879-34f0-42be-9752-b7f769ec28f1;
 Thu, 01 Oct 2020 15:36:22 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=jQH2=DI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kO0d5-00045W-5W
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 15:36:23 +0000
X-Inumbo-ID: 454e3879-34f0-42be-9752-b7f769ec28f1
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 454e3879-34f0-42be-9752-b7f769ec28f1;
	Thu, 01 Oct 2020 15:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601566582;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9/1+8AILDFhHJ17SHU4YqTmVOgEzlfLSZ8XgvI3ulq0=;
  b=dddyYhrPIfSarEWMMpDYERj04KUhG5V3PZ3dlgxVPReppdDVIbYWDkvM
   tf0WPZBUoD8N8/emBM/Mz3a+6avh75UAS81GgiO97+NYc73+qQp8rnv0O
   Y3+wtgcP7eD/52MZdATduqIVcv2JO+mqnrHdMSxjG8bII2O1P/qSpJhiU
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: i7SDzJzibXEPIMYH8BJAX+IT8uBW/cMj+idMK1F3wUDZf6G6eqPw5PTrSkLpZC/v8hbMGY8wmS
 s0CpCnYJGHvfos1L3sRY+EdYcA/P1PEQY98NTvdzroT7Kdtbrcar5C2Ao/lI8wQp2RGTnMzI/6
 qd0jO8UHKHBpiwv3oFDDDpdKOBtANitSB0YUea5rZEHBcBq9tvEwCwvk5DLsLkYON1HQ7us3Gc
 c+v5s+QVpGvHQxFMCLtBliKycFhig0eomLKjQIhmaZeMUFyq7XifE2vhkvHhIqyk5LOFmyTAeK
 vVw=
X-SBRS: None
X-MesageID: 28068741
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,323,1596513600"; 
   d="scan'208";a="28068741"
Date: Thu, 1 Oct 2020 17:36:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: George Dunlap <george.dunlap@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@citrix.com>,
	Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Rich Persaud <persaur@gmail.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: Re: [PATCH RFC] docs: Add minimum version depencency policy document
Message-ID: <20201001153612.GG19254@Air-de-Roger>
References: <20200930125736.95203-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20200930125736.95203-1-george.dunlap@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Wed, Sep 30, 2020 at 01:57:36PM +0100, George Dunlap wrote:
> Define a specific criteria for how we determine what tools and
> libraries to be compatible with.  This will clarify issues such as,
> "Should we continue to support Python 2.4" moving forward.
> 
> Note that CentOS 7 is set to stop receiving "normal" maintenance
> updates in "Q4 2020"; assuming that 4.15 is released after that, we
> only need to support CentOS / RHEL 8.
> 
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
> ---
> 
> CC: Ian Jackson <ian.jackson@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Rich Persaud <persaur@gmail.com>
> CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
> ---
>  docs/index.rst                        |  2 +
>  docs/policies/dependency-versions.rst | 76 +++++++++++++++++++++++++++
>  2 files changed, 78 insertions(+)
>  create mode 100644 docs/policies/dependency-versions.rst
> 
> diff --git a/docs/index.rst b/docs/index.rst
> index b75487a05d..ac175eacc8 100644
> --- a/docs/index.rst
> +++ b/docs/index.rst
> @@ -57,5 +57,7 @@ Miscellanea
>  -----------
>  
>  .. toctree::
> +   :maxdepth: 1
>  
> +   policies/dependency-versions
>     glossary
> diff --git a/docs/policies/dependency-versions.rst b/docs/policies/dependency-versions.rst
> new file mode 100644
> index 0000000000..d5eeb848d8
> --- /dev/null
> +++ b/docs/policies/dependency-versions.rst
> @@ -0,0 +1,76 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Build and runtime dependencies
> +==============================
> +
> +Xen depends on other programs and libraries to build and to run.
> +Chosing a minimum version of these tools to support requires a careful
> +balance: Supporting older versions of these tools or libraries means
> +that Xen can compile on a wider variety of systems; but means that Xen
> +cannot take advantage of features available in newer versions.
> +Conversely, requiring newer versions means that Xen can take advantage
> +of newer features, but cannot work on as wide a variety of systems.
> +
> +Specific dependencies and versions for a given Xen release will be
> +listed in the toplevel README, and/or specified by the ``configure``
> +system.  This document lays out the principles by which those versions
> +should be chosen.
> +
> +The general principle is this:
> +
> +    Xen should build on currently-supported versions of major distros
> +    when released.
> +
> +"Currently-supported" means whatever that distro's version of "full
> +support".  For instance, at the time of writing, CentOS 7 and 8 are
> +listed as being given "Full Updates", but CentOS 6 is listed as
> +"Maintenance updates"; under this criterium, we would try to ensure
> +that Xen could build on CentOS 7 and 8, but not on CentOS 6.
> +
> +Exceptions for specific distros or tools may be made when appropriate.
> +
> +One exception to this is compiler versions for the hypervisor.
> +Support for new instructions, and in particular support for new safety
> +features, may require a newer compiler than many distros support.
> +These will be specified in the README.
> +
> +Distros we consider when deciding minimum versions
> +--------------------------------------------------
> +
> +We currently aim to support Xen building and running on the following distributions:
> +Debian_,
> +Ubuntu_,
> +OpenSUSE_,
> +Arch Linux,
> +SLES_,
> +Yocto_,
> +CentOS_,
> +and RHEL_.

Could we add FreeBSD here, I've been packaging Xen there for quite
some time now, and try to keep it working.

It's an interesting target because it has quite a different toolchain
as it's fully llvm based (clang + lld) and then it's using the ELF
Toolchain.

https://www.freebsd.org/releases/

Not sure if we want to rename the current section to Linux distros and
add a different one for other OSes.

Thanks, Roger.

