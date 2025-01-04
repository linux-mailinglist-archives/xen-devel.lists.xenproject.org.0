Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAFEA0123F
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 05:27:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865304.1276601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTvkm-0006aq-QA; Sat, 04 Jan 2025 04:27:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865304.1276601; Sat, 04 Jan 2025 04:27:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTvkm-0006YL-NH; Sat, 04 Jan 2025 04:27:12 +0000
Received: by outflank-mailman (input) for mailman id 865304;
 Sat, 04 Jan 2025 04:27:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTvkl-0006YE-8l
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 04:27:11 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2991004e-ca54-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 05:27:09 +0100 (CET)
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
X-Inumbo-ID: 2991004e-ca54-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735964828; x=1736224028;
	bh=UQ4kxnUOPixt2ADCDMF9wnRjUKZuuclJXSknr+DdF/E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=SCsEi2sG4hUS/jhPfKhNlU+XPDjCzT5TfWjI2lmpzGSZJ2ecCBL/cUoVzWKJ+Ako9
	 yU9EnRepK/CBaKo1+qCrckuvMbIuS3fCZU6CYb5bfwW0K3hPSSYCr7DebHAg5KNpNl
	 vMiyVNNxpDEWEGItkbD9ac30lDfWcPVuwEY6S6SuvY1/eyzOdhG66kLWxVvdHl9S5i
	 rt0ZqMlxH0MWq5ZC09Pd807tGLnLVsdZtc3c410jw+tNCUXKB2JiDhiFgVBpII46Gf
	 ACECMwkkI9P1gI8joNkBGg8z6yXl08Tf8pWwCZj17SWF6F0jdWY4HbEDXYU2pbHZUa
	 i+F+wMJK6kG5w==
Date: Sat, 04 Jan 2025 04:27:05 +0000
To: =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 00/35] Introduce NS8250 UART emulator
Message-ID: <g8DY-fhruWr6rKYFNI3VVCryQD6E1Rgq9PTBag0G3UgykgZa4N72EU_Dlha21r3lADmxuxlx3IKOViOgUCc1cU5O_tyIlYv_YZg4aXlEFR8=@proton.me>
In-Reply-To: <Z13I2xEJpkMouslw@mail-itl>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <Z13I2xEJpkMouslw@mail-itl>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 003881b63e3ba29e399273905cd45b9ac62db106
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Saturday, December 14th, 2024 at 10:05 AM, Marek Marczykowski-G=C3=B3rec=
ki <marmarek@invisiblethingslab.com> wrote:

>
>
> On Thu, Dec 05, 2024 at 08:41:30PM -0800, Denis Mukhin via B4 Relay wrote=
:
>
> > The patch series introduces initial in-hypervisor emulator for
> > NS8250/NS16x50-compatible UARTs under CONFIG_HAS_VUART_NS8250.
> >
> > In parallel domain creation scenario (hyperlaunch), NS8520 emulator hel=
ps
> > early guest OS bringup debugging, because it eliminates dependency on t=
he
> > external emulator being operational by the time domains are created. Al=
so,
> > there's no early console facility similar to vpl011 to support x86 gues=
t OS
> > bring up.
> >
> > The NS8250 emulator is disabled by default.
>
>
> On a high level, why the mechanism used by earlyprintk=3Dxen (IIUC i/o
> port 0xe9) isn't enough?

I/O port 0xe9 needs some knowledge about Xen and potentially re-building/pa=
tching
guest OSes. The latter is not always possible right away. So using legacy
COM ports makes debugging a bit easier for engineers trying to bring up
Xen configuration.

> Hyperlaunch can't start full (Xen-unaware) HVM domains anyway, so
> a requirement to use a Xen-specific interface for the console shouldn't b=
e
> an issue, no?

With hyperlaunch virtual firmware (e.g. OVMF) in HVM case will execute
in parallel, which means all serial output from virtual firmware can be
easily captured, i.e. debugging on a new hardware should be a bit easier.

My understanding that not all firmware support debug I/O port 0xe9.
Rebuilding a firmware may be a quest in itself, which can be skipped if x86
port of Xen has legacy COM UART emulation in hypervisor.

Also, my understanding (please correct me if I'm wrong) it should be
theoretically possible to craft a hyperlaunch configuration where each
non-hardware domain is headless and has its own physical block device
controller passed-through and has no dependency on hardware domain.

>
> --
> Best Regards,
> Marek Marczykowski-G=C3=B3recki
> Invisible Things Lab



