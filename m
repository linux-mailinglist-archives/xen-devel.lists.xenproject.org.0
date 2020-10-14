Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B6B28E470
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 18:28:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6863.18041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSjdf-0005Mn-Rn; Wed, 14 Oct 2020 16:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6863.18041; Wed, 14 Oct 2020 16:28:31 +0000
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
	id 1kSjdf-0005MO-Oi; Wed, 14 Oct 2020 16:28:31 +0000
Received: by outflank-mailman (input) for mailman id 6863;
 Wed, 14 Oct 2020 16:28:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WBOb=DV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kSjde-0005M7-1a
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 16:28:30 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 108d1873-1c74-4836-be91-8357ba789c44;
 Wed, 14 Oct 2020 16:28:28 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=WBOb=DV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kSjde-0005M7-1a
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 16:28:30 +0000
X-Inumbo-ID: 108d1873-1c74-4836-be91-8357ba789c44
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 108d1873-1c74-4836-be91-8357ba789c44;
	Wed, 14 Oct 2020 16:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602692909;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=GYvjGHiPLwLr37AO1ujQE9TZBPnF7iXTNfM397l76wg=;
  b=BJOi2lxF4Kumq/5v6f7JqFV6559UnkYaxAJC0qLqhHXQyYLkTiIZ/1Y9
   lxYWLzqYciTDoAxqzpOqmEjzs4kp8oyFC338K8C4XdmUgxfHYGKmEf+JN
   +xc+PF87IrphDMYlYyZ4RfPseWhX5Vq76NwFUmf8xRK8pTVapgzZkXrzH
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: P31UaNUW0/aCe7Mb9/SgZaZXvqh3GEVD+qvM2mSni5xbW4NgqULBnXxAKxHEc74XTQixQ5s2WK
 0SUgwvHTKrJhMtZu2hj8dFNwn9SqA8KrezSaw2DjQrkxdII8cEd96AfjHJQmagm+JmLZyqGYjz
 LzbOrxnGikIv6CjNH+Ss8foU7Ev4qZN2aOWkd+SSom4t5PpC7NNxn8+YcAfyZ3TmVeKC/O+pjH
 aWFARQRtDCLjQxkFkO49uMHaiEo74CGxKnM01D7G5yvWp/EOe20ftCj8icA7KJQcGFiSoDnpAz
 E7I=
X-SBRS: 2.5
X-MesageID: 28982875
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,375,1596513600"; 
   d="scan'208";a="28982875"
Date: Wed, 14 Oct 2020 18:28:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>, Andy Lutomirski <luto@kernel.org>,
	Manuel Bouyer <bouyer@antioche.eu.org>
Subject: Re: [PATCH v2] x86/pv: Inject #UD for missing SYSCALL callbacks
Message-ID: <20201014162814.GT19254@Air-de-Roger>
References: <20200923101848.29049-4-andrew.cooper3@citrix.com>
 <20201009115301.19516-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201009115301.19516-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Fri, Oct 09, 2020 at 12:53:01PM +0100, Andrew Cooper wrote:
> Despite appearing to be a deliberate design choice of early PV64, the
> resulting behaviour for unregistered SYSCALL callbacks creates an untenable
> testability problem for Xen.  Furthermore, the behaviour is undocumented,
> bizarre, and inconsistent with related behaviour in Xen, and very liable
> introduce a security vulnerability into a PV guest if the author hasn't
> studied Xen's assembly code in detail.
> 
> There are two different bugs here.
> 
> 1) The current logic confuses the registered entrypoints, and may deliver a
>    SYSCALL from 32bit userspace to the 64bit entry, when only a 64bit
>    entrypoint is registered.
> 
>    This has been the case ever since 2007 (c/s cd75d47348b) but up until
>    2018 (c/s dba899de14) the wrong selectors would be handed to the guest for
>    a 32bit SYSCALL entry, making it appear as if it a 64bit entry all along.
> 
>    Xen would malfunction under these circumstances, if it were a PV guest.
>    Linux would as well, but PVOps has always registered both entrypoints and
>    discarded the Xen-provided selectors.  NetBSD really does malfunction as a
>    consequence (benignly now, but a VM DoS before the 2018 Xen selector fix).
> 
> 2) In the case that neither SYSCALL callbacks are registered, the guest will
>    be crashed when userspace executes a SYSCALL instruction, which is a
>    userspace => kernel DoS.
> 
>    This has been the case ever since the introduction of 64bit PV support, but
>    behaves unlike all other SYSCALL/SYSENTER callbacks in Xen, which yield
>    #GP/#UD in userspace before the callback is registered, and are therefore
>    safe by default.
> 
> This change does constitute a change in the PV ABI, for corner cases of a PV
> guest kernel registering neither callback, or not registering the 32bit
> callback when running on AMD/Hygon hardware.
> 
> It brings the behaviour in line with PV32 SYSCALL/SYSENTER, and PV64
> SYSENTER (safe by default, until explicitly enabled), as well as native
> hardware (always delivered to the single applicable callback).
> 
> Most importantly however, and the primary reason for the change, is that it
> lets us sensibly test the fast system call entrypoints under all states a PV
> guest can construct, to prove correct behaviour.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Andy Lutomirski <luto@kernel.org>
> CC: Manuel Bouyer <bouyer@antioche.eu.org>
> 
> v2:
>  * Drop unnecessary instruction suffixes
>  * Don't truncate #UD entrypoint to 32 bits
> 
> Manuel: This will result in a corner case change for NetBSD.
> 
> At the moment on native, 32bit userspace on 64bit NetBSD will get #UD (Intel,
> etc), or an explicit -ENOSYS (AMD, etc) when trying to execute a 32bit SYSCALL
> instruction.
> 
> After this change, a 64bit PV VM will consistently see #UD (like on Intel, etc
> hardware) even when running on AMD/Hygon hardware (as Xsyscall32 isn't
> registered with Xen), rather than following Xsyscall into the proper system
> call path.
> ---
>  xen/arch/x86/x86_64/entry.S | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
> index 000eb9722b..aaf8402f93 100644
> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -26,18 +26,30 @@
>  /* %rbx: struct vcpu */
>  ENTRY(switch_to_kernel)
>          leaq  VCPU_trap_bounce(%rbx),%rdx
> -        /* TB_eip = (32-bit syscall && syscall32_addr) ?
> -         *          syscall32_addr : syscall_addr */
> -        xor   %eax,%eax
> +
> +        /* TB_eip = 32-bit syscall ? syscall32_addr : syscall_addr */
> +        mov   VCPU_syscall32_addr(%rbx), %ecx

This being an unsigned long field, shouldn't you use %rcx here?

Roger.

