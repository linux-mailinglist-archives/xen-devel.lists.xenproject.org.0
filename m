Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A87A0122B
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 04:58:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865220.1276512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTvIy-0005uA-TG; Sat, 04 Jan 2025 03:58:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865220.1276512; Sat, 04 Jan 2025 03:58:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTvIy-0005sH-Pe; Sat, 04 Jan 2025 03:58:28 +0000
Received: by outflank-mailman (input) for mailman id 865220;
 Sat, 04 Jan 2025 03:58:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTvIw-0005qY-SE
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 03:58:26 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 263eff94-ca50-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 04:58:26 +0100 (CET)
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
X-Inumbo-ID: 263eff94-ca50-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735963105; x=1736222305;
	bh=i8SweO/7+CrvITbcSVv379HteG9ln8/znTvZd8thGgg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=ABVLxjGucb9kGtzcHVpw7wJzFOAItSCjjlexevaH3fbEFAmd3Gq/RORCdkixWDbcM
	 oiUAR7QNjdiq7/M+zST3Lt5rMS7jt0p7SK7MbQHqkwUFK2nl0JNyA27r1rVuRomnIE
	 d6q9xwq2fRgrYh6KAVj2ojrXxz/oeyfqOPhkUVRQKSnxoGmCKhVzWLE/7SgqB+fN+3
	 CyiJz3mmb7XuEpQC5pciGXzE71lf5MsFM5Tk15Kqq/bz0vab3hwX+Tmh4DTQke4I4+
	 ahXZZToVUuFiLk1PUQ1Kovuf8Xpe6DI2dL+J/rO/OQDN0sVXMcVGOOeH1yHm/PxZZV
	 QyzgHo5lShy7w==
Date: Sat, 04 Jan 2025 03:58:23 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 29/35] x86/hvm: add HVM-specific Kconfig
Message-ID: <JYnExqPNvYs3nAbLXqEQ3RLA2A1Llei-IsJzlJ16Ws1wB3e2deXBvY3TjDxM2FhHU2fRc2HG3MFXOfQC_aGEaMr2A3gB9ZGPX_Z-VFAhsq8=@proton.me>
In-Reply-To: <Z1r8DWGh6sujHZss@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-29-e9aa923127eb@ford.com> <Z1r8DWGh6sujHZss@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: e7bd6cc39660f432b300ad6d519e7c79f535c1ea
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, December 12th, 2024 at 7:06 AM, Roger Pau Monn=C3=A9 <roger.pa=
u@citrix.com> wrote:

>
>
> On Thu, Dec 05, 2024 at 08:41:59PM -0800, Denis Mukhin via B4 Relay wrote=
:
>
> > From: Denis Mukhin dmukhin@ford.com
> >
> > Add separate menu for configuring HVM build-time settings.
> > That will help organizing HVM-specific options under a separate menu.
>
>
> Instead of being a separate menu, which feels a bit odd under default
> settings because there's just an "HVM support" option inside, could
> you make it look like the PV support menu, that indents PV specific
> options:
>
> [] PV support
> [ ] Support for 32bit PV guests
> [] Support for PV linear pagetables

My rationale is that code base at arch/x86/hvm deserves its own Kconfig bec=
ause
there a bunch of configuration options just for arch/x86/hvm.
I think that will also help managing configuration since they all in dedica=
ted
location.

I enabled "HVM menu" using correct Kconfig syntax in v3.

>
> Thanks, Roger.



