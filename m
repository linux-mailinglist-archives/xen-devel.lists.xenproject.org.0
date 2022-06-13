Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 571F254859F
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 16:00:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348334.574620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0kc2-0005B6-Hz; Mon, 13 Jun 2022 14:00:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348334.574620; Mon, 13 Jun 2022 14:00:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0kc2-00059K-EW; Mon, 13 Jun 2022 14:00:14 +0000
Received: by outflank-mailman (input) for mailman id 348334;
 Mon, 13 Jun 2022 14:00:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ypXD=WU=efficios.com=compudj@srs-se1.protection.inumbo.net>)
 id 1o0kc0-00059E-NU
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 14:00:13 +0000
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 230fcd97-eb21-11ec-bd2c-47488cf2e6aa;
 Mon, 13 Jun 2022 16:00:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 2294D3B10F9;
 Mon, 13 Jun 2022 10:00:09 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ytcVYjVUi3F7; Mon, 13 Jun 2022 10:00:08 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id A9A433B14C9;
 Mon, 13 Jun 2022 10:00:08 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id yoCRG8Enc8Nh; Mon, 13 Jun 2022 10:00:08 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id 9CA723B155A;
 Mon, 13 Jun 2022 10:00:08 -0400 (EDT)
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
X-Inumbo-ID: 230fcd97-eb21-11ec-bd2c-47488cf2e6aa
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com A9A433B14C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1655128808;
	bh=aI6PzN9lXEK0hyp7LFwjblv4fYLLDcdjYxhB2mBqp04=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=aJiCF2Uv3uZEv1JU2BVCDp13gUIK53UOQMO/BzZPA+SXuc8t7rkLC0cWZmvwVS34k
	 6MnkVmOLorQ6PrhgZc4uNSgpI6WhtjNoz1knb937yy66w0RI/neSKOkv7iYx4ZOto0
	 P1vgVsR0ADWiZywAbcOfVCFJhN55vbD+6aHyBDQE72tj4cEHU5RsAahfoEiyUUUOz2
	 5KSZTYQYE+laVVovV/72SDsEvFRsTRAzfmh5yzOZcOmPzMJJYO+xO90mLwIR9ZxIHq
	 X2XZIAH7x/0RF2VTVo9PXQmKz0VBqlOrvDZVTpzdByTiF1gk1XtJK9H5+SHFNs+Fpg
	 t/qt5DZMA94sg==
X-Virus-Scanned: amavisd-new at efficios.com
Date: Mon, 13 Jun 2022 10:00:08 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: grub-devel <grub-devel@gnu.org>, Daniel Kiper <dkiper@net-space.pl>, 
	xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <1164797797.55925.1655128808531.JavaMail.zimbra@efficios.com>
In-Reply-To: <CAKf6xpv3aBrzB=ds5jSd2MbFr=VePOMfJygos6E4cLegaizU0w@mail.gmail.com>
References: <20220609185024.447922-1-mathieu.desnoyers@efficios.com> <20220609185024.447922-3-mathieu.desnoyers@efficios.com> <CAKf6xpv3aBrzB=ds5jSd2MbFr=VePOMfJygos6E4cLegaizU0w@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] grub-mkconfig linux_xen: Fix quadratic algorithm
 for sorting menu items
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_4272 (ZimbraWebClient - FF100 (Linux)/8.8.15_GA_4257)
Thread-Topic: grub-mkconfig linux_xen: Fix quadratic algorithm for sorting menu items
Thread-Index: UGSf0pzUBdTgYTvAqJYK7vc4LOjpcA==

----- On Jun 10, 2022, at 4:00 PM, Jason Andryuk jandryuk@gmail.com wrote:

> On Thu, Jun 9, 2022 at 2:50 PM Mathieu Desnoyers
> <mathieu.desnoyers@efficios.com> wrote:
>>
>> The current implementation of the 20_linux_xen script implements its
>> menu items sorting in bash with a quadratic algorithm, calling "sed",
>> "sort", "head", and "grep" to compare versions between individual lines,
>> which is annoyingly slow for kernel developers who can easily end up
>> with 50-100 kernels in their boot partition.
>>
>> This fix is ported from the 10_linux script, which has a similar
>> quadratic code pattern.
>>
>> [ Note: this is untested. I would be grateful if anyone with a Xen
>>   environment could test it before it is merged. ]
> 
> Hi, Mathieu,
> 
> I tested by manually applying patch 2/5 on top of Fedora 36's
> installed /etc/grub.d/20_linux_xen, and manually applying patch 1/5 to
> /usr/share/grub/grub-mkconfig_lib.  It seems to generate grub.cfg
> menuentry-ies in the correct order.

Noted. Added your Tested-by to patch 2/5. Thanks!

> 
> Note for patch 1/5, it's best practice to use "$@" with the double
> quotes to prevent word splitting of arguments.  Doesn't really matter
> for that function at this time though.

I'll update patch 1/5 with this change. It's best practice indeed. I notice
that there are quite a few other places in grub-mkconfig_lib.in that do
follow this best practice though.

Thanks,

Mathieu

> 
> Regards,
> Jason

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com

