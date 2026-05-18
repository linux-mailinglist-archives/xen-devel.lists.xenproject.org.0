Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Gp7LdPJCmpC8QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 10:12:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29840568792
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 10:12:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311667.1581769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOt4e-0002X4-C7; Mon, 18 May 2026 08:11:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311667.1581769; Mon, 18 May 2026 08:11:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOt4e-0002UC-9R; Mon, 18 May 2026 08:11:40 +0000
Received: by outflank-mailman (input) for mailman id 1311667;
 Mon, 18 May 2026 08:11:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wOt4c-0002U0-UC
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 08:11:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOt4c-004u6F-5J
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 10:11:38 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0ac9ba-5cb7-0a2a0a5109dd-0a2a4506b342-0
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 10:11:38 +0200
Received: from [209.85.167.46] (helo=mail-lf1-f46.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0ac9b9-7371-0a2a45060019-d155a72ed556-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 10:11:37 +0200
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5aa0862dda1so2775069e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 01:11:37 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1779091897; cv=none;
        d=google.com; s=arc-20240605;
        b=jzud0CBxv77pSuJlwW2ZX455dMZv9bJhV5u/Mq2TsIE1J2Ls5UyoKsFpSpP4IYTMAw
         ZGLJDE9V7ixXhBmJUF4bDxXXbYZtex7mhUGkxbZE3kGinu73Jn5c8Nie+2/bOu84/eZR
         N5GnxTGUon8U8qJf4/9w7qDppp85I0nycSGuLQ0aKgf2+WdErRz54d882Bno2BpVsrLi
         NRWPyA25kReRcXatWn48wHxXrG9qUYWAekNelQg2C9R/Y2fUnLRjFiDfdwlWnyanOpDh
         tF3hqAqVqPROzCGObSlAUmtECU9MYKBKrj4tUhN9CgMprUMv0roEfdGu5LD4pUyHZ5I5
         5UHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iOSMKDA3THo11cMixsiTenFnNLnwDVr7W+zNctBt4B4=;
        fh=0sVRqm7+oyz7WJ/bTvyRrhIQoOB1v0nJ1T68JVaBfuo=;
        b=LMlKZax5XUtQr5Y9PftuJ2CojZLCMMXiLZiH7w6D0dX+i6DLubku3XC1+6SmdI2ojp
         hgIi7VCVAvnoA8E3HHaqIak7WENbaqDmSeaUBYVOb7QBytmc8tTSwGDmmsnYjNeTuKls
         bfFbn4RfEerhmqup8WDkSlq1Es7JglI6sXWr4UGZnOFTT+FeCiTRwlE+RlwSrdl2eUp6
         R/UWzQCxZRV7Azm2f2kcHOUjFSY17pzg/wB9xuwjGrI/E/QLwmdnR69ZY4BQf9jzM6fJ
         MeCqR8WmImB7bogr/Mg/qUJZN/G2A+1v9gcxkJBsXFXz/xVFZUBDQJdkkP0uTmnwaZV+
         2D8w==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779091897; x=1779696697; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iOSMKDA3THo11cMixsiTenFnNLnwDVr7W+zNctBt4B4=;
        b=oG/zw29glLfdj3xzNQQpehx2cf08rk50V4TpHCroZ9AbFzm+VWnq+OReJRKgO7TQu7
         Qomw+jOuBeDZd91FKa2vbt0xkJ/ZG3NN06mFFq/t1CoZQFZwtQwlses3Zv6HH/tTQqtd
         puwlZDn8t4RUq1umw+AHza3WyS26VyLVt9kR+jDmBKE823FyDn1N6L9cwW2/yDJVHPzI
         aqptw+gY8A9bZCSp4G9fzNBUvn1Pa96NElx+HsSkXcXFuBxHfR8T5Xng/gSd93+7Dvmd
         ras6vugedWfGkpIiDiiaYOGVhEGMK81Xe5oQ9op3WLtAI9s5h26w+bajAxREnASMlrY4
         35Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779091897; x=1779696697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iOSMKDA3THo11cMixsiTenFnNLnwDVr7W+zNctBt4B4=;
        b=HtmN5B4yXp25ro0hf6+IHve5296UqQB6J2yBuUjrCZ2V+3rifKbAPGjBlAUzBiNztm
         tsLr3cInidGETtceWXEmTOINevN9MhBiCjvOlFpOhfORBYYCA6RwS87kTHVajPd4XXEi
         6KHiB8QN++iUBxFGbMEneyehMnhu5YbEIbMLkjk9Z9WbilHE1YaCAdOKuzAgV5ca/cTO
         AZJ1gFciPzJKdXH0qn4K6tJvu5BDf6MdtLw6vXY00dHXKBj+yeQwJTQiPAFRujuoGjkl
         xeMed7jO3pl0bD7kYcJQzqgmedZvwhZh3iqlWPIkMwU2ehiyZyuAxnHQ7oIoFO1LAPeu
         BvIQ==
X-Gm-Message-State: AOJu0YzmO5gWfvxfTexkoY2pNK81aPvR4BAQHF1UD4piV2ji7E8ElOUx
	TGowzqZumtdZ4ib/9AvO8yOygbWL3xalZ9CCd7fhQulGv/OMLxEPhDfCgq+0rZw6yMqvyuub0nq
	4joZsCduwFb7c3CVjW/jEf7RmUmd0Hvg=
X-Gm-Gg: Acq92OE2cnAb7TmOlRxJRNwxiJSS+jBKh1KbyDXMXwhRjVGtLTIcbwP6SB4BAiheJPd
	9ehId7+w0idjxsvuQx0HzfvJe8aW5YnAI93dCKWN8At001zJBNahjxliqp7BKeAhArQXlSRM0Rl
	DUmN8ewb0BlL99j9/q9cLeWYcsv5Sp5bU7DQt05DOvT4hjDUtJPbXSwvhnM305pvyXQ14u2IUdo
	5dLgJzYzFVObvy3nJYz7qlpzDHMjg0hee3mWAiF/QGp8GynXiYfaMz0ulKugfuaQd7wQJWGy6Xv
	oTzQ
X-Received: by 2002:a05:6512:33c2:b0:5a8:89d6:93de with SMTP id
 2adb3069b0e04-5aa0e763944mr4331741e87.23.1779091897145; Mon, 18 May 2026
 01:11:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1778925998.git.mykola_kvach@epam.com> <cbb02d6c5af6606ada3e477e8d45d730ffe72723.1778925998.git.mykola_kvach@epam.com>
 <7f5c613a-33f6-481f-b3f3-d627833a461e@amd.com>
In-Reply-To: <7f5c613a-33f6-481f-b3f3-d627833a461e@amd.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 18 May 2026 11:11:25 +0300
X-Gm-Features: AVHnY4Ijom0BVbo0-UfPuVV3hywafJ1wCi1RS-fVVRFYdoT0qzxDvqgkP_nEdjY
Message-ID: <CAGeoDV8dL+5O+yYH7DPUFioKQpR6uaPe_cRc+VnJaWxh5NcXng@mail.gmail.com>
Subject: Re: [PATCH 1/2] xen/common: llc-coloring: clear color count on parse failure
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-16d1c6/1779091898-8E98AD75-583BA2BA/0/0
X-purgate-type: clean
X-purgate-size: 1002
X-Rspamd-Queue-Id: 29840568792
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,mail.gmail.com:mid,epam.com:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.957];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Hi Michal,

Thank you for the review.

On Mon, May 18, 2026 at 8:42=E2=80=AFAM Orzel, Michal <michal.orzel@amd.com=
> wrote:
>
>
>
> On 16-May-26 17:03, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > parse_color_config() updates the caller-provided color count while
> > parsing. If parsing later fails, leave the count at zero so callers
> > do not consume a partially parsed configuration.
> I would also add for clarity:
>   The bug is reachable in practice: cmdline_parse() ignores the -EINVAL
>   from a custom_param callback, so boot continues with the partial
>   xen_num_colors / dom0_num_colors that llc_coloring_init() and
>   dom0_set_llc_colors() then consume.

Ack, I will add this to the commit message in the next version.

>
> >
> > Fixes: 6cdea3444eaf ("xen/arm: add Dom0 cache coloring support")
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Best regards,
Mykola

