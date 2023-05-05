Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DAF6F866E
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 18:09:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530500.826153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puxyu-0004Ed-CP; Fri, 05 May 2023 16:08:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530500.826153; Fri, 05 May 2023 16:08:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puxyu-0004C6-8T; Fri, 05 May 2023 16:08:28 +0000
Received: by outflank-mailman (input) for mailman id 530500;
 Fri, 05 May 2023 16:08:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fp4m=A2=citrix.com=prvs=4826eee3f=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1puxys-0004C0-MH
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 16:08:26 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f2916e0-eb5f-11ed-b226-6b7b168915f2;
 Fri, 05 May 2023 18:08:24 +0200 (CEST)
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
X-Inumbo-ID: 0f2916e0-eb5f-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683302904;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WFyZWrUsXdHPFST0v+jPBBnw/xYyynxZT39SG+tzogw=;
  b=V8jpbFH0ZR3YqxEQNRVXXDUAL7SToqm/wncRY8ZpImVPjICow67ZotHl
   VrBCSxNxsRb0TfMBkp6hEGexAjGNzjyF4ylJrolkomTU/JIZTLJ2qn+Ks
   2jKbp2Re+ESnfBqmFN4xb7yGyZT6DH/ThY1caOO4k41fnrFYA3MAaPaQk
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 108428034
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:3+8r5qzNCsK8S2c4dyd6t+cdxirEfRIJ4+MujC+fZmUNrF6WrkUFz
 mMeWWjSOf+INjSnLtsnbYnko00DsZ/Sx9UwTQdu+CAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UIHUMja4mtC5QRjPa0T5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWBU3
 /YqNwxRUhKCibut/5bjZcZG3dt2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZwNzhrC9
 jqdowwVBDkGEpuP6zyB9kvrobHzsz+4YIkvPuSBo6sCbFq7mTVIVUx+uUGAifuzh1O6WtlfA
 1cJ4Sdopq83nGS7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZjxcbN0rsucmSDps0
 UWG9/vyHiBmurCRTXOb95+XoCm0NCxTKnUNDQcbSSMV7t+lp5s85jrGVtt5GbS5psH0Ezr3h
 TuNqUADa6471JBRkf/hpBae3mzq/8KSJuIo2unJdmO/xAlLe7L5W46p5wHA0tIYA6mzFUbU6
 RDohPOiAPAy4YClzXLdG79QTejwuJ5pIxWH3wcxQsBJGyCFvif6INsOuGwWyFJBaJ5sRNP/X
 KPEVeq9Drd3NWDiU6J4apnZ5y8Cnfm5ToSNuhw5g7NzjnlNmOyvpnsGiba4hTyFraTVufhX1
 W2nWcitF20GLq9s0SC7QewQuZdymHBlnzmNGcmql0/4uVZ7WEN5tJ9faAfeBgzHxPrsTPrpH
 yZ3aJLRlkQ3vBzWaSjL648DRW03wYwALcmu8aR/L7fTSjeK7Ul9U5c9N5t9Id0690mU/8+Ul
 kyAtrhwkQWk3iKbc1XUMhiOqtrHBP5CkJ7yBgR0VX7A5pTpSdzHAHs3H3fvQYQayQ==
IronPort-HdrOrdr: A9a23:R/nPka8LOhLzFriCjfxuk+DjI+orL9Y04lQ7vn2ZKCYlCvBw8v
 rF8cjzuiWE7Ar5NEtQ/+xoW5PgfZq/z+8R3WB5B97LNzUO3lHYT72KwrGSoQEIcBeOkdK1u5
 0QCpSWy+eeMbG5t6rHCcWDferICePmzJyV
X-Talos-CUID: =?us-ascii?q?9a23=3AZ4WfXGpkvYK46aH+gJGhaA7mUcE/WHfv00uMH02?=
 =?us-ascii?q?5Bz9yd5nNZnC6o7wxxg=3D=3D?=
X-Talos-MUID: 9a23:13e6HwWJqmxYtDDq/CPKwyFAMsNs2uOJVnwjjdY+sPSubBUlbg==
X-IronPort-AV: E=Sophos;i="5.99,252,1677560400"; 
   d="scan'208";a="108428034"
Date: Fri, 5 May 2023 17:08:12 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH RFC] build: respect top-level .config also for
 out-of-tree hypervisor builds
Message-ID: <a08f3650-0c81-4873-ae10-f5200f8b7613@perard>
References: <beace0ce-e90b-eb79-4419-03de45ea7360@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <beace0ce-e90b-eb79-4419-03de45ea7360@suse.com>

On Wed, Mar 15, 2023 at 03:58:59PM +0100, Jan Beulich wrote:
> With in-tree builds Config.mk includes a .config file (if present) from
> the top-level directory. Similar functionality is wanted with out-of-
> tree builds. Yet the concept of "top-level directory" becomes fuzzy in
> that case, because there is not really a requirement to have identical
> top-level directory structure in the output tree; in fact there's no
> need for anything top-level-ish there. Look for such a .config, but only
> if the tree layout matches (read: if the directory we're building in is
> named "xen").

Well, as long as the "xen/" part of the repository is the only build
system to be able to build out-of-srctree, there isn't going to be a
top-level .config possible in the build tree, as such .config will be
outside of the build tree. Reading outside of the build tree or source
tree might be problematic.

It's a possibility that some project might want to just build the
hypervisor, and they happened to name the build tree "xen", but they
also have a ".config" use for something else. Kconfig is using ".config"
for other reason for example, like we do to build Xen.

It might be better to have a different name instead of ".config", and
putting it in the build tree rather than the parent directory. Maybe
".xenbuild-config" ?


I've been using the optional makefile named "xen-version" to adjust
variable of the build system, with content like:

    export XEN_TARGET_ARCH=arm64
    export CROSS_COMPILE=aarch64-linux-gnu-

so that I can have multiple build tree for different arch, and not have
to do anything other than running make and do the expected build. Maybe
that's not possible because for some reason, the build system still
reconfigure some variable when entering a sub-directory, but that's a
start.


> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> RFC: The directory name based heuristic of course isn't nice. But I
>      couldn't think of anything better. Suggestions?

I can only thing of looking at a file that is in the build-tree rather
than outside of it. A file named ".xenbuild-config" proposed early for
example.

> RFC: There also being a .config in the top-level source dir would be a
>      little problematic: It would be included _after_ the one in the
>      object tree. Yet if such a scenario is to be expected/supported at
>      all, it makes more sense the other way around.

Well, that would mean teaching Config.mk about out-of-tree build that
part of the repository is capable of, or better would be to stop trying
to read ".config" from Config.mk, and handle the file in the different
sub-build systems. Or just let people writing ".config" files to handle
the cases in those .config files.

> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -236,8 +236,17 @@ endif
>  
>  include scripts/Kbuild.include
>  
> -# Don't break if the build process wasn't called from the top level
> -# we need XEN_TARGET_ARCH to generate the proper config
> +# Don't break if the build process wasn't called from the top level.  We need
> +# XEN_TARGET_ARCH to generate the proper config.  If building outside of the
> +# source tree also check whether we need to include a "top-level" .config:
> +# Config.mk, using $(XEN_ROOT)/.config, would look only in the source tree.
> +ifeq ($(building_out_of_srctree),1)
> +# Try to avoid including a random unrelated .config: Assume our parent dir
> +# is a "top-level" one only when the objtree is .../xen.
> +ifeq ($(patsubst %/xen,,$(abs_objtree)),)
> +-include ../.config
> +endif
> +endif
>  include $(XEN_ROOT)/Config.mk
>  
>  # Set ARCH/SUBARCH appropriately.
> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -17,6 +17,13 @@ __build:
>  
>  -include $(objtree)/include/config/auto.conf
>  
> +# See commentary around the similar contruct in Makefile.
> +ifneq ($(abs_objtree),$(abs_srctree))
> +ifeq ($(patsubst %/xen,,$(abs_objtree)),)
> +../.config: ;
> +-include ../.config
> +endif
> +endif
>  include $(XEN_ROOT)/Config.mk
>  include $(srctree)/scripts/Kbuild.include

There's another makefile, "scripts/Makefile.clean", doesn't this would
need to be change as well?

Cheers,

-- 
Anthony PERARD

