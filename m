Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B32CE241CF2
	for <lists+xen-devel@lfdr.de>; Tue, 11 Aug 2020 17:10:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5Vud-0007dT-PI; Tue, 11 Aug 2020 15:10:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+4EG=BV=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1k5Vuc-0007Ru-AM
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2020 15:10:02 +0000
X-Inumbo-ID: 8dd4bd82-9843-4502-93e7-b47e6b37f51a
Received: from mail-40134.protonmail.ch (unknown [185.70.40.134])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8dd4bd82-9843-4502-93e7-b47e6b37f51a;
 Tue, 11 Aug 2020 15:10:00 +0000 (UTC)
Date: Tue, 11 Aug 2020 15:09:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1597158598;
 bh=vYpsPTDzCHkpN5A1GiHJ+4fofC5s7pInH+jhMDsL7lY=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=eRQkykCDvL8Nc+l6wnuEr0jvlIropxisiaYKu8K3QRoDjBJpvG0GOH4ApOQYMRtsv
 SRO+W0Y1P3GaH4/mioHoixmgcKqQSGJM/j2L7QUEnTre5TOwVOEcX0cCyfF40SlJlJ
 tNQfgMylosGoQBxD2ejykoRJ97OJwnZ1YCGfZTJo=
To: Andrew Cooper <andrew.cooper3@citrix.com>
From: Trammell Hudson <hudson@trmm.net>
Subject: Re: [RFC] efi/boot: Unified Xen executable for UEFI Secure Boot
 support
Message-ID: <LBx_CDon_LLjarWEqQRek_tyyaUZEHCu_K1HSb5jIuhDzFntslc03mL0YRYVwJ8Ng-jU5J7QZ92X6_iFl1474ddRMv46Vr09OJWBlSBnrcI=@trmm.net>
In-Reply-To: <2afa43a1-d29e-32db-1583-a752b4a122e9@citrix.com>
References: <SQvDCuitxs8ZbVLJqpnPlbhTvIw_fMkZDetiBpJD-DID2X8EnTvReCaJgThJ8b-3kS9gHm3-HYRqNJk-k1cVYPIQf04R8uuhPjm9WNKzJh4=@trmm.net>
 <1bd2d79e-5bef-835c-f6cc-9fd367e8beb7@suse.com>
 <FKRB6MJm-n6DwX0LoYfI4Ysny1U_xRbxvZn7ttLHGxpKTEnAmcoDMLsLsgKZGYaB2eVuIzoNQ6UPpsfiMlaRPW-7AIXQ9mqz_i9sF-tI2Ks=@trmm.net>
 <5e3b16b3-0f93-4683-dcc7-852c805870c8@suse.com>
 <y5v76XS6whE9vu9FqI2eN6ieuvXkjnAJ1oaBXdXyKKNjJxvbLqaRnHi99iq_AIknqaQ9V18cLCLy9v3dV8YIEsfyrQq9apJRcWiQeFXuGuk=@trmm.net>
 <132b5b88-c78d-01cf-df27-6430689570e4@citrix.com>
 <CXSQq8DgbTTtEtGG6W67lvGVMmT92dpQQWdC5bHKya9WwRwKZmcI3Oy4clutRHjY7BjDay5i-Iy5QVc6PAQsOKmIGvrI1MrfuN7RLnOnG1E=@trmm.net>
 <2afa43a1-d29e-32db-1583-a752b4a122e9@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: Trammell Hudson <hudson@trmm.net>
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

[ Responding to both Jan and Andrew's comments about config parsing
and file sources when secure boot is enabled ]

On Friday, August 7, 2020 2:23 PM, Jan Beulich <jbeulich@suse.com> wrote:
> [...]
> As said before, I think we want an all-or-nothing approach. You
> want to first establish whether the image is a unified one, and
> if so not fall back to reading from disk. Otherwise the claim
> of secure boot above is liable to be wrong.

It seems that the system owner who signs the unified Xen image can
choose to use a config, kernel, initrd, microcode, or xsm from the disk
if they a) reference it in the config file and b) do not embed a named
section in the unified image, in which case the code will
fall back to the read_file() function.

This is essentially the status-quo today, including the shim verification
of the kernel, in that all of the other values are essentially untrusted.

However, as Andrew points out:

On Monday, August 10, 2020 3:31 PM, Andrew Cooper <andrew.cooper3@citrix.co=
m> wrote:
> > On Thursday, August 6, 2020 8:14 PM, Andrew Cooper andrew.cooper3@citri=
x.com wrote:
> > > [...]
> > > In the absence of a full audit of all our command line arguments, and
> > > extra vigilance reviewing code coming in, the safer alternative is to
> > > prohibit use of the command line, and only accept it in its Kconfig
> > > embedded form for now.
> [...]
> With the proposal here, there are two signed sources; one in Kconfig,
> and one in the embedded xen.cfg file.

I added code that turns off argc/argv parsing if UEFI Secure Boot is
enabled, although it doesn't enforce a config file.  The system owner
could sign a unified image without a config file embedded, in which case
the x86 code path will do the read_file() approach for it and load an
attacker controlled config.

Much like the kexec and live patching options, it is a very caveat lector
sort of thing.  The owner of the machine can build and sign an insecure
hypervisor, kernel, etc configuration, if they want to, although it would
be nice to have some defaults to aim the footguns away from their shoes.
Adding runtime checks out of the early EFI boot path for secure boot status
and turning off some of the obviously risky pieces would be a good next ste=
p.

> [...]
> My main concern is simply to avoid giving any kind of impression that
> UEFI SecureBoot is generally usable at the moment.

"Generally usable with Microsoft's signing key and UEFI ecocsystem",
yeah, we're not really there yet.  There are still open issues in the
wider Linux distributions as well about how to handle things like kernel
command lines and initrd validation, so it's not just Xen.

"Generally usable for users enrolling their own platform key and reviewing
the system configuration details", however, I think we're fairly close to
having the building blocks to put together slightly more secure systems.

Thanks for all of you're detailed comments and thoughts on this patch
discussion!  Hopefully we can converge on something soon.

--
Trammell


