Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B38A27FFA1
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 14:59:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269.4260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNyAd-0005NG-2q; Thu, 01 Oct 2020 12:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269.4260; Thu, 01 Oct 2020 12:58:51 +0000
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
	id 1kNyAc-0005Mr-VV; Thu, 01 Oct 2020 12:58:50 +0000
Received: by outflank-mailman (input) for mailman id 1269;
 Thu, 01 Oct 2020 12:58:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uQij=DI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kNyAb-0005Mm-Kq
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 12:58:49 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd519763-a09f-4943-8908-0f14a9b74855;
 Thu, 01 Oct 2020 12:58:47 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=uQij=DI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kNyAb-0005Mm-Kq
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 12:58:49 +0000
X-Inumbo-ID: cd519763-a09f-4943-8908-0f14a9b74855
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id cd519763-a09f-4943-8908-0f14a9b74855;
	Thu, 01 Oct 2020 12:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601557128;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=tC8IZ2rjKb4/mSW5V73QWviVu64ioiomUQkuFzhd1wQ=;
  b=hzbs3XjxEqLCRph5teqaMkrf8x5fkXQ7o2VYcRPIJi8FYocCIgkcQC+9
   hDMBbM6zF4SMX+XwLGMrI0ahbBw+zWCGvjRhhcYixBAMG9v3uOwSzUAj6
   DJGEB6e13GeH0QZB/PKlxP2tLtuQkBXsJkKHqaw4GD2n2E2qypbnvYOdk
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: vC2etBxWYWR1ygoadZP4GIkq5pGHw14rA3hKun27GlbE7nzJrlX5mWivm+EGA8NPDFb0GGnTUU
 vYpG3una6dg3ZG47cTZP3Nonik4p4SCh1mch51PEF9HgAZXQDyCnumvvwq1XgLX5JCcolg6UML
 I1KjWMYC+TsQefUG6B0Us59v0zRqUx4UoWXrOgfWu9w02+hWtxSAWMMNyhTSM6I2ZMEzu9lgw0
 +blvHj/hob3T91CYbpXBrHjVcM994xOJq4pNo4NOxx0AQdcTihTG3BGFWddXeKZjygw9HMiU85
 S3M=
X-SBRS: None
X-MesageID: 28071257
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,323,1596513600"; 
   d="scan'208";a="28071257"
Subject: Re: [PATCH RFC] docs: Add minimum version depencency policy document
To: George Dunlap <george.dunlap@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>, Jan Beulich
	<jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Rich Persaud <persaur@gmail.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
References: <20200930125736.95203-1-george.dunlap@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <868b25bd-ab2c-7f33-1dc2-9476c86d8050@citrix.com>
Date: Thu, 1 Oct 2020 13:58:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930125736.95203-1-george.dunlap@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 30/09/2020 13:57, George Dunlap wrote:
> Define a specific criteria for how we determine what tools and
> libraries to be compatible with.  This will clarify issues such as,
> "Should we continue to support Python 2.4" moving forward.

Luckily that one is settled.  Arguably a better option might be "what is
the minimum toolchain to support" ?

> Note that CentOS 7 is set to stop receiving "normal" maintenance
> updates in "Q4 2020"; assuming that 4.15 is released after that, we
> only need to support CentOS / RHEL 8.

While I appreciate that this doesn't mean "we'll break CentOS 7 in Q4",
I'm going to have some substantial development issues if C7 actually
stops working, at least in the short to medium term.

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

I think it is great that this is going into Sphinx.

However, I'd prefer to avoid proliferating random things at the top
level, to try and keep everything in a coherent structure.


For better or worse, I guestimated at "admin guide" (end user and
sysadmin guide), "guest docs" (VM ABI, and guest kernel developers), and
"hypervisors docs" (hacking Xen).

I'm happy to shuffle the dividing lines if a better arrangement becomes
obvious.  This particular doc logically lives with "building Xen from
source".

Alternatively, I considered putting in an explicit "unsorted" section in
the short term, so content can get added, and still be clear that it
isn't in its final resting place.

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

The problem we have is that xen.git contains two very different things. 
There is the hypervisor itself, which is embedded, and can easily be
cross compiled, and there is the content of tools/ which depends on a
lot of distro infrastructure.

We expect tools/ to work in any supported distro, without having to do
weird toolchain gymnastics.

For xen/ at the moment we have a very obsolete toolchain requirements,
and this is holding us back in some areas.  We're looking to bring that
forward, and may consider that being newer than some of the old distros
is necessary.

At the moment however, we have quite a lot of functionality which is
dependent on being able to detect suitable toolchain.  GCOV and CET-SS
are examples.  These features will turn themselves off in older distros,
so while you can "build" Xen that far back, you might not get everything.

For CET in particular, there is no feasible way to support it on older
toolchains.  (unless someone comes up with an extremely convincing way
of hand-crafting memory operands using raw .byte's in inline assembler.)

I definitely don't think it is unreasonable for us to require the use of
(potentially) bleeding edge toolchains if they want to use (potentially)
bleeding edge features.  CET-SS isn't bleeding edge any more, but
CET-IBT is due to the additional linker work required to make it
function.  A future one which we need to do something about is Control
Flow Integrity, which is Clang specific, depends on LTO, and caused
Linux to up their minimum supported version to 10.0.1 which was when all
the bugfixes got merged.

> +
> +Distros we consider when deciding minimum versions
> +--------------------------------------------------
> +
> +We currently aim to support Xen building and running on the following distributions:
> +Debian_,
> +Ubuntu_,
> +OpenSUSE_,
> +Arch Linux,

No link for Arch?

> +SLES_,
> +Yocto_,
> +CentOS_,
> +and RHEL_.
> +
> +.. _Debian: https://www.debian.org/releases/
> +.. _Ubuntu: https://wiki.ubuntu.com/Releases
> +.. _OpenSUSE: https://en.opensuse.org/Lifetime
> +.. _SLES: https://www.suse.com/lifecycle/
> +.. _Yocto: https://wiki.yoctoproject.org/wiki/Releases
> +.. _CentOS: https://wiki.centos.org/About/Product
> +.. _RHEL: https://access.redhat.com/support/policy/updates/errata
> +
> +Specific distro versions supported in this release
> +--------------------------------------------------
> +
> +======== ==================
> +Distro   Supported releases
> +======== ==================
> +Debian   10 (Buster)
> +Ubuntu   20.10 (Groovy Gorilla), 20.04 (Focal Fossa), 18.04 (Bionic Beaver), 16.04 (Xenial Xerus)
> +OpenSUSE Leap 15.2
> +SLES     SLES 11, 12, 15
> +Yocto    3.1 (Dunfell)
> +CentOS   8
> +RHEL     8
> +======== ==================

How about a 3rd column for "supported until" ?  It would stop this page
becoming stale simply over time.

> +
> +.. note::
> +
> +   We also support Arch Linux, but as it's a rolling distribution, the
> +   concept of "security supported releases" doesn't really apply.

Should we rationalise this list with the docker containers?

~Andrew

