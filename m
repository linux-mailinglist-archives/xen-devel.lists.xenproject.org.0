Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54240592DE5
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 13:07:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387284.623461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNXwh-0003tS-8w; Mon, 15 Aug 2022 11:07:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387284.623461; Mon, 15 Aug 2022 11:07:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNXwh-0003rO-5U; Mon, 15 Aug 2022 11:07:47 +0000
Received: by outflank-mailman (input) for mailman id 387284;
 Mon, 15 Aug 2022 11:07:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ks0i=YT=protonmail.com=dylangerdaly@srs-se1.protection.inumbo.net>)
 id 1oNXwf-0003qw-9A
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 11:07:45 +0000
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c7bd881-1c8a-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 13:07:44 +0200 (CEST)
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
X-Inumbo-ID: 7c7bd881-1c8a-11ed-924f-1f966e50362f
Date: Mon, 15 Aug 2022 11:07:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1660561663; x=1660820863;
	bh=li26dMUDWFbxTv86fHZPJMCU0Kpai1zfgWsBa4jwIzk=;
	h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
	 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
	 Feedback-ID:Message-ID;
	b=nqDDvszNzPv+/s4XNANRQaQpRbyYWqAOcaEk0ZnTtU/4KWF34XfYN2ZWgAEt7hQ0o
	 ail3VJ2dSmzXcWDlpEdQHxKIWs4Jfy+Y11VAuEyuComkP1ljZqxt4VtYhDX77tx9xp
	 PieO+Yswy+svw3tdJvU+5MAgPLepdgUGA+2AnYA+0yBtPspI6THUvPrqlbAzuQ5Ykp
	 6ZtETp7mBsG+B4ug1e9IDmfgNaN+HbSJ2v43/fUD2+PnXTTWZvG0T6NiI5z5ZDGEu/
	 vfJwv9jV5GV2T+grpGtqriM1fKRpsZ3pg1NneSgloKGLVsP6JyMg0O7mbIs08nf2a4
	 OAOtNS5oLvB7w==
To: Jan Beulich <jbeulich@suse.com>
From: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Reply-To: Dylanger Daly <dylangerdaly@protonmail.com>
Subject: Re: Ryzen 6000 (Mobile)
Message-ID: <uGB9M0prJ1uFQ4e4SWvoe_jFXgjpBlNr1C8q90DWeR6CtiSzXBUQ1nGLD6tl1dTeYvqP6347vsu-MVKu7P17KH4QU8GFSkeuOCcQCyslSMY=@protonmail.com>
In-Reply-To: <a485f128-6caf-4f4a-3d61-423e2ee67121@suse.com>
References: <wMV4okoInWxTqAaH6sxUug6my9BOlkurOWuCUILGFxoYe96U_-Z-KPjDdacRmuIksOMX-chaAN0lnGj5XevfNJKw6fIVhsSIqBCxGHweK-Q=@protonmail.com> <4c3976aa-dad4-2707-2852-9b26593692d0@citrix.com> <pDQL7BhwlO49buWymLE-VFEZJim7qNeMmAeThZgHF9qzcbNbQ6ZoSXktgD14I_HYpsdxqfCugrNoJ227u5DLCWEEXk_h9c7bf4iKdgoQbQ8=@protonmail.com> <b3e00f33-527e-e29c-87fb-0773344aa1f6@suse.com> <a485f128-6caf-4f4a-3d61-423e2ee67121@suse.com>
Feedback-ID: 21854323:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi All,

It would appear this issue isn't specific to the Lenovo Yoga Slim 7 ProX, s=
omeone else in the Qubes community is having the same issue (https://github=
.com/QubesOS/qubes-issues/issues/7620#issuecomment-1209114810)

Can anyone shed some light on what possibly might be making a Xen 4.14 Hype=
rvisor crash after attempting to start a domU? Dom0 start's just fine, it '=
feels' like a memory violation or DMA/IOMMU issue, because the VM does succ=
essfully start, however 1 or 2 seconds after it successfully boot the mouse=
 (in dom0) locks up for 2-3 seconds and the entire device resets.

I can't seem to get any logs at all, xen's console, dom0 dmesg and domU's d=
mesg all appear to be fine in the lead up to the crash. I assume no one has=
 had a chance to use Xen on Ryzen 6000 (Rembrandt) yet due to the fact it's=
 hard to get your hands on with the chip shortage etc.

I'm hoping it's something that can be fixed with a cmdline flag, it's very =
frustrating having this shiny new laptop sitting on my desk :P

Cheers all

