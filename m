Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9F128EF40
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 11:16:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7159.18783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSzLT-0006aa-FA; Thu, 15 Oct 2020 09:14:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7159.18783; Thu, 15 Oct 2020 09:14:47 +0000
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
	id 1kSzLT-0006aB-Bw; Thu, 15 Oct 2020 09:14:47 +0000
Received: by outflank-mailman (input) for mailman id 7159;
 Thu, 15 Oct 2020 09:14:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0U26=DW=protonmail.com=dylangerdaly@srs-us1.protection.inumbo.net>)
 id 1kSzLR-0006a6-Be
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 09:14:45 +0000
Received: from mail-40134.protonmail.ch (unknown [185.70.40.134])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b3ea5527-7da8-44fb-b409-c8f3bb62271f;
 Thu, 15 Oct 2020 09:14:42 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=0U26=DW=protonmail.com=dylangerdaly@srs-us1.protection.inumbo.net>)
	id 1kSzLR-0006a6-Be
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 09:14:45 +0000
X-Inumbo-ID: b3ea5527-7da8-44fb-b409-c8f3bb62271f
Received: from mail-40134.protonmail.ch (unknown [185.70.40.134])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b3ea5527-7da8-44fb-b409-c8f3bb62271f;
	Thu, 15 Oct 2020 09:14:42 +0000 (UTC)
Date: Thu, 15 Oct 2020 09:14:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail; t=1602753281;
	bh=uApoKZdPH581TK1za6hWeAIesw7Sgfzm/ZWDVQo6M1U=;
	h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
	b=mmB0NtwBI4tkQtcwWdtADNP029F3ACb0ygOjVPb0GtOAAe8yXQmLm/53ynPFvHE10
	 N+3wtBV1+V28LybpwVycFltktdYGHMNrEQOHRUc9x82Cx2U0952y6OjgkJT/gsRX8y
	 woxSgm0Y54izuoVU1nGQHQ8AQYzylUkfcuO6x3Ds=
To: Jan Beulich <jbeulich@suse.com>
From: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Reply-To: Dylanger Daly <dylangerdaly@protonmail.com>
Subject: Re: Ryzen 4000 (Mobile) Softlocks/Micro-stutters
Message-ID: <U00A4lb9CgpRhV9huYxk5kvyAAam9UcFJ7h2K1a6-M84ef8W58V4Shq7hmU5WKh3rKaVRl6EiTXVmDc-czrBJvyf7h1mjh3Dc3SPvj8qIog=@protonmail.com>
In-Reply-To: <72589937-a918-96c8-4589-6d30efaead9a@suse.com>
References: <9lQU_gCfRzGyyNb2j86pxTMi1IET1Iq7iK3994agUZPrTI5Xd-aCJAaRYuJlD3L5LT2WaV4N3-YF4xKl5ukialT0M_YD0ve6gmDFFfatpXw=@protonmail.com> <72589937-a918-96c8-4589-6d30efaead9a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
	mailout.protonmail.ch

Hi Jan, thank you for responding.

Indeed this is for dom0, I only recently tried limiting a domU to 1 core an=
d observed absolutely no softlocks, UI animations are smooth as butter with=
 1 core only.

Indeed I believe this is a CPU Scheduling issue, I've tried both the older =
credit and RTDS however both don't boot correctly.
The number of cores on this CPU is 8, 16 threads however Qubes by default d=
isables SMT, sched_credit2_max_cpus_runqueue is 16 by default, I've tried t=
esting with setting this to 7 or 8 however it'll either not boot, or nothin=
g will change.

There are a number of credit2 tweak-ables so I'm hoping to play around and =
drop the `dom0_max_vcpus=3D1`, I suspect `sched_credit2_max_cpus_runqueue` =
is the main thing to play with.

I did manage to get it booting with sched_credit2_max_cpus_runqueue=3D7 but=
 it ended up locking up shortly after X launched on dom0

=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90

On Thursday, October 15th, 2020 at 7:18 PM, Jan Beulich <jbeulich@suse.com>=
 wrote:

> On 15.10.2020 02:38, Dylanger Daly wrote:
>
> > I'm currently using Xen 4.14 (Qubes 4.1 OS) on a Ryzen 7 4750U PRO, by =
default I'll experience softlocks where the mouse for example will jolt fro=
m time to time, in this state it's not usable.
>
> From what you say below I imply this is in Dom0?
>
> > Adding `dom0_max_vcpus=3D1 dom0_vcpus_pin` to Xen's CMDLINE results in =
no more jolting however performance isn't what it should be on an 8 core CP=
U, softlocks are still a problem within domU's, any sort of UI animation fo=
r example.
> >
> > Reverting this commit (8e2aa76dc1670e82eaa15683353853bc66bf54fc) result=
s in even worse performance with or without the above changes to CMDLINE, a=
nd it's not usable at all.
>
> You saying this surely has a reason, but making the connection would
>
> help. I don't consider it surprising that a revert of an improvement
>
> makes things worse. You having bothered to find a certain code change
>
> also makes me suspect you've experimented with other scheduler
>
> related settings - if so, please share all data you've got. (FAOD -
>
> with the information provided I have no idea what to suggest, sorry.)
>
> Jan

