Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jVQDBk6SIGrh5AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 22:45:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AE363B313
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 22:45:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=jugmqWph;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from list by lists.xenproject.org with outflank-mailman.1327179.1592363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUsRZ-0004uK-O0; Wed, 03 Jun 2026 20:44:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327179.1592363; Wed, 03 Jun 2026 20:44:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUsRZ-0004sx-L6; Wed, 03 Jun 2026 20:44:05 +0000
Received: by outflank-mailman (input) for mailman id 1327179;
 Wed, 03 Jun 2026 20:44:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wUsRY-0004sr-5y
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 20:44:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUsRX-00H3eD-Bj
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 22:44:03 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a20920f-bab6-0a2a0a5309dd-0a2a45028798-6
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 22:44:03 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a209211-af86-0a2a45020019-ac6904fed7c6-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 22:44:02 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 431166008A;
 Wed,  3 Jun 2026 20:44:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 649101F00898;
 Wed,  3 Jun 2026 20:44:00 +0000 (UTC)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780519441;
	bh=hLwOhjndZi4XUFfYF6Al89pghpWx+o7Heg2jFizAGYY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=jugmqWphCzLKLQtWuqGUlnDMSGL1HA3i/gvzEbohrwzo2gWrSLy5cNqGsYcwJ46OE
	 2zZzTQQpr+spj02JTs6kk/e7Kn8HdMVzEi9zARjswS+wzDHrMdaxrKLhTepuNka5FA
	 cynhKQdCaP2caaMH0gJWfWFRO3dSnLQZfkm6mEW6ZLjqo/lKB/7U0geT89v7kePcQ3
	 DuAy5EG0nXyn7mAlM2FKgtFpZ4sCUTTEevHf3xZUrW4ER58btlxf4v8iJVF4PLjZa9
	 ZxM+kI9P6DBqY4p4Kx4YKrvQxurprxkaS7Nv6Oe3e/OUuE/uqlQh+VfraMgJW/GgnX
	 dEYcZOYuU9UOw==
Date: Wed, 3 Jun 2026 13:43:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Stewart Hildebrand <stewart.hildebrand@amd.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] vPCI: resolve MISRA R10.1 boolean arithmetic type
 violation
In-Reply-To: <616db16e-3c3e-4000-b6ea-d2703f5a848b@suse.com>
Message-ID: <alpine.DEB.2.22.394.2606031341070.1200252@ubuntu-linux-20-04-desktop>
References: <e23266191a366abe66d8104783d97578aa8734a4.1779428826.git.dmytro_prokopchuk1@epam.com> <984c91b8-3d2c-4431-bdf1-4a333ac341d1@suse.com> <alpine.DEB.2.22.394.2605261508390.182011@ubuntu-linux-20-04-desktop> <62abdafd-a49c-46e0-b529-0646a8d2425a@suse.com>
 <alpine.DEB.2.22.394.2606021840110.550703@ubuntu-linux-20-04-desktop> <b443469b-01fe-4196-a79f-811bfb6e17d8@suse.com> <aiAj7duOGUAkbB05@macbook.local> <616db16e-3c3e-4000-b6ea-d2703f5a848b@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-662625314-1780519440=:1200252"
X-purgate-ID: tlsNG-720697/1780519443-AB762161-76CEADF3/0/0
X-purgate-type: clean
X-purgate-size: 5380
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ubuntu-linux-20-04-desktop:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmytro_prokopchuk1@epam.com,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 61AE363B313

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-662625314-1780519440=:1200252
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 3 Jun 2026, Jan Beulich wrote:
> On 03.06.2026 14:54, Roger Pau Monné wrote:
> > On Wed, Jun 03, 2026 at 08:04:25AM +0200, Jan Beulich wrote:
> >> On 03.06.2026 03:41, Stefano Stabellini wrote:
> >>> On Tue, 2 Jun 2026, Jan Beulich wrote:
> >>>> On 27.05.2026 00:12, Stefano Stabellini wrote:
> >>>>> On Fri, 22 May 2026, Jan Beulich wrote:
> >>>>>> (extending Cc list)
> >>>>>>
> >>>>>> On 22.05.2026 08:13, Dmytro Prokopchuk1 wrote:
> >>>>>>> --- a/xen/drivers/vpci/header.c
> >>>>>>> +++ b/xen/drivers/vpci/header.c
> >>>>>>> @@ -586,7 +586,7 @@ static void cf_check bar_write(
> >>>>>>>          if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
> >>>>>>>              gprintk(XENLOG_WARNING,
> >>>>>>>                      "%pp: ignored BAR %zu write while mapped\n",
> >>>>>>> -                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
> >>>>>>> +                    &pdev->sbdf, bar - pdev->vpci->header.bars + (hi ? 1 : 0));
> >>>>>>>          return;
> >>>>>>>      }
> >>>>>>>  
> >>>>>>> @@ -647,7 +647,7 @@ static void cf_check guest_mem_bar_write(const struct pci_dev *pdev,
> >>>>>>>          if ( guest_addr != bar->guest_addr )
> >>>>>>>              gprintk(XENLOG_WARNING,
> >>>>>>>                      "%pp: ignored guest BAR %zu write while mapped\n",
> >>>>>>> -                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
> >>>>>>> +                    &pdev->sbdf, bar - pdev->vpci->header.bars + (hi ? 1 : 0));
> >>>>>>>          return;
> >>>>>>>      }
> >>>>>>>      bar->guest_addr = guest_addr;
> >>>>>>
> >>>>>> Well. If I'm not mistaken we had discussed situations like this (long ago).
> >>>>>> Imo the added verbosity gets in the way of readability. If we absolutely
> >>>>>> cannot or don't want to deviate such constructs (of which I expect we have
> >>>>>> more), then we ought to consider alternatives (like changing the variables'
> >>>>>> types in the case here).
> >>>>>>
> >>>>>> As to deviating: rules.rst, according to my reading, says that &, |, ^, or
> >>>>>> shifts would be okay to use with a bool operand. What's wrong with also
> >>>>>> permitting this for other operators?
> >>>>>
> >>>>> In my opinion, if we are going to treat bool as its own type, it makes
> >>>>> sense not to silently mix bools into arithmetic with int types. I also
> >>>>> do not find this patch less readable -- I actually find it more
> >>>>> readable, since it makes it more obvious that hi is a bool.
> >>>>
> >>>> Well, okay, we have different opinions there. This reply of yours applies
> >>>> to the first paragraph of my earlier reply though, despite its placement.
> >>>> What about the aspect mentioned in the second paragraph?
> >>>
> >>> You mean "then we ought to consider alternatives (like changing the
> >>> variables' types in the case here)" ?
> >>
> >> That's another option, but not what I meant. I simply don't understand why
> >> some operators are okay to use with booleans while others aren't. Adding
> >> (for example) booleans can be quite helpful. Take this example from gas
> >> sources as example:
> >>
> >>       if (overlap.bitfield.imm8
> >> 	  + overlap.bitfield.imm8s
> >> 	  + overlap.bitfield.imm16
> >> 	  + overlap.bitfield.imm32
> >> 	  + overlap.bitfield.imm32s
> >> 	  + overlap.bitfield.imm64 != 1)
> >>
> >> And then see how the added verbosity would hamper readability:
> >>
> >>       if ((overlap.bitfield.imm8 ? 1 : 0)
> >> 	  + (overlap.bitfield.imm8s ? 1 : 0)
> >> 	  + (overlap.bitfield.imm16 ? 1 : 0)
> >> 	  + (overlap.bitfield.imm32 ? 1 : 0)
> >> 	  + (overlap.bitfield.imm32s ? 1 : 0)
> >> 	  + (overlap.bitfield.imm64 ? 1 : 0) != 1)
> >>
> >>> Other alternatives could be OK, but also this patch as-is is OK to me.
> >>
> >> I'm not going to veto it (not being a maintainer of the code I really
> >> can't), but as per above the transformation imo is setting a bad example.
> > 
> > What about getting the BAR index based on the register value, and
> > hence avoiding the pointer arithmetic plus the boolean type addition?
> > I think that's clear and doesn't violate any MISRA rules, it would
> > obviously not settle the discussion about boolean type abuse as
> > integers, but would be fine to solve the specific issue in vPCI IMO.
> 
> For the case here - sure, that should be fine. But I specifically
> wanted to understand (generally) why we are limiting ourselves, as
> surely other cases are going to show up.

My view on this is that booleans should be treated as booleans, and we
should not rely on implicit conversions to int types. I prefer the
second form because it makes it clear these are booleans. The added
verbosity helps me see at a glance that these are booleans and should be
treated as such. The first form is more dangerous because I might forget
they are booleans, assume they are int types, and use them in an
operation that would result in undefined or implementation-specific
behavior.

I am also fine with Roger's proposal.
--8323329-662625314-1780519440=:1200252--

