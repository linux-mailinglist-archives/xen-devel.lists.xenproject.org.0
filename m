Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 859562DDAD0
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 22:27:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56188.98184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kq0nb-0007to-Rp; Thu, 17 Dec 2020 21:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56188.98184; Thu, 17 Dec 2020 21:26:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kq0nb-0007tS-OV; Thu, 17 Dec 2020 21:26:59 +0000
Received: by outflank-mailman (input) for mailman id 56188;
 Thu, 17 Dec 2020 21:26:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ya8y=FV=vps.thesusis.net=psusi@srs-us1.protection.inumbo.net>)
 id 1kq0na-0007tN-N5
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 21:26:58 +0000
Received: from vps.thesusis.net (unknown [34.202.238.73])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78b7d677-1498-43ea-b151-22931e222092;
 Thu, 17 Dec 2020 21:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by vps.thesusis.net (Postfix) with ESMTP id B05002781D;
 Thu, 17 Dec 2020 16:26:57 -0500 (EST)
Received: from vps.thesusis.net ([127.0.0.1])
 by localhost (vps.thesusis.net [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gmEwGuj1UTxB; Thu, 17 Dec 2020 16:26:57 -0500 (EST)
Received: by vps.thesusis.net (Postfix, from userid 1000)
 id 7191F2781C; Thu, 17 Dec 2020 16:26:57 -0500 (EST)
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
X-Inumbo-ID: 78b7d677-1498-43ea-b151-22931e222092
References: <87h7oudcbx.fsf@vps.thesusis.net> <CAHD1Q_zcruQ6KVHApvhb=0+mG0m80T+tmg1UzjQBki8j+aR51A@mail.gmail.com> <87czzcdtir.fsf@vps.thesusis.net> <CAHD1Q_z+WW36rfr1RAFYKjU5bocA90OonBmSKECRnpacvWyPmQ@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 26.3
From: Phillip Susi <phill@thesusis.net>
To: "Guilherme G. Piccoli" <guilherme.piccoli@canonical.com>
Cc: kexec mailing list <kexec@lists.infradead.org>, xen-devel@lists.xenproject.org
Subject: Re: kexec not working in xen domU?
Date: Thu, 17 Dec 2020 16:25:25 -0500
In-reply-to: <CAHD1Q_z+WW36rfr1RAFYKjU5bocA90OonBmSKECRnpacvWyPmQ@mail.gmail.com>
Message-ID: <873604p1i6.fsf@vps.thesusis.net>
MIME-Version: 1.0
Content-Type: text/plain


Guilherme G. Piccoli writes:

> Hm..not many prints, either earlyprintk didn't work, or it's a really
> early boot issue. Might worth to investigate if it's not a purgatory
> issue too - did you try to use the ""new"" kexec syscall, by running
> "kexec -s -l" instead of just "kexec -l" ?
> Also, worth to try that with upstream kernel and kexec-tools - I
> assume you're doing that already?

I tried with -s and it didn't help.  So far I tried it originally on my
Ubuntu 20.04 amazon vps, then on my debian testing ( linux 5.9.0 ) on my
local xen server.  I'll try building the latest upstream kernel and
kexec tomorrow.

