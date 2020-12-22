Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 868862E107B
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 00:06:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58112.102015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krqiD-0004iV-7i; Tue, 22 Dec 2020 23:05:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58112.102015; Tue, 22 Dec 2020 23:05:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krqiD-0004i6-45; Tue, 22 Dec 2020 23:05:01 +0000
Received: by outflank-mailman (input) for mailman id 58112;
 Tue, 22 Dec 2020 23:04:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=odvS=F2=protonmail.com=dylangerdaly@srs-us1.protection.inumbo.net>)
 id 1krqiA-0004i0-VJ
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 23:04:59 +0000
Received: from mail1.protonmail.ch (unknown [185.70.40.18])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 13360254-26e2-45e0-846a-149f5e8d051f;
 Tue, 22 Dec 2020 23:04:55 +0000 (UTC)
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
X-Inumbo-ID: 13360254-26e2-45e0-846a-149f5e8d051f
Date: Tue, 22 Dec 2020 23:04:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail; t=1608678293;
	bh=ACcda9xu//P+Y6Ww1pup/3a4oMjn+VRQw6mpes2mt0Y=;
	h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
	b=GqZGSKdXVFE4M8z2OSeBzRF6/zIC/UEf+52qjICus9rdVwE9GVXziWGowuAStGPUA
	 ESVmOLEtJAIOYM8stFMejuOri89hkemvaTHdXvsFt0j6Jsad0QTUXmikXvSOICZgQl
	 HAPHbS2sCHmuNWNpeE2g6vRWsYPd/YBhIs2M6wFQ=
To: Jan Beulich <jbeulich@suse.com>
From: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Reply-To: Dylanger Daly <dylangerdaly@protonmail.com>
Subject: Re: Ryzen 4000 (Mobile) Softlocks/Micro-stutters
Message-ID: <T95F2Mi9RUUZ4w2wdeRqqM4uRyKgOFQNyooqEoTTDByK-0t9hZ1izG68lf90iExeYabEPSEv8puUeg0SEJtOmz8vYbVox2za28DXLd_h-_s=@protonmail.com>
In-Reply-To: <768d9dbb-4387-099f-b489-7952d7e883b0@suse.com>
References: <9lQU_gCfRzGyyNb2j86pxTMi1IET1Iq7iK3994agUZPrTI5Xd-aCJAaRYuJlD3L5LT2WaV4N3-YF4xKl5ukialT0M_YD0ve6gmDFFfatpXw=@protonmail.com> <2cc5da3e-0ad0-4647-f1ca-190788c2910b@citrix.com> <3pKjdPYCiRimYjqHQP0xd_vqhoTOJqthTXOrY_rLeNvnQEpIF24gXDKgRhmr95JfARJzbVJVbfTrrJeiovGVHGbV0QBSZ2jez2Y_wt6db7g=@protonmail.com> <768d9dbb-4387-099f-b489-7952d7e883b0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
	mailout.protonmail.ch

Hey All,

I think I've narrowed down what could be the issue.

I think disabling SMT on any AMD Zen 2 CPU is breaking Xen's Credit2 schedu=
ler, I can only test on AMD Ryzen 4000 based Mobile CPUs, but I think this =
is what is causing issues with softlocks/having to pin dom0 1 vcpu.

I'm currently trying to re-enable SMT on Qubes 4.1 (Xen 4.14) and I'll repo=
rt my findings here.

