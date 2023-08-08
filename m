Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1F5774A12
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 22:15:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580417.908616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTT70-0003JZ-Qu; Tue, 08 Aug 2023 20:15:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580417.908616; Tue, 08 Aug 2023 20:15:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTT70-0003Gy-OC; Tue, 08 Aug 2023 20:15:26 +0000
Received: by outflank-mailman (input) for mailman id 580417;
 Tue, 08 Aug 2023 20:15:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiCO=DZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qTT6y-0003Gs-Ot
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 20:15:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cde2426-3628-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 22:15:22 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5DE2A618C5;
 Tue,  8 Aug 2023 20:15:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93401C433C7;
 Tue,  8 Aug 2023 20:15:18 +0000 (UTC)
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
X-Inumbo-ID: 4cde2426-3628-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691525719;
	bh=DzLqUjHIokBCqXIWi41GI1OSvOB+/1CmJeF1xpqRA1o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mHjFWk9kEWjBv0s7LnAjrn3S+o24epM9JdKOgT4GNrfjJu+UoKvHh8jhYkE8HkMJ2
	 rH1ePgfidumnwmdkeHfhquXihP4G9+LATeRgXhdU44LaN9lTywqNLJJx0LHNET167b
	 ycCoBju7Y7ZAADzHmNlllw4n55+sCYMLi72cKpYGCQDXQkXBMvygLcLIGAjBcWf48h
	 uuwYfuGKfvf5fOd6gso5mL7dXdbm9iHhiw/n+4DH4bB5+yoPpYGVR3eA26/Gso3QxZ
	 5B+Ar7INTGWJpvqWApNGAOKLJlv0dEaOG+HSawRwM/ws7K+pkHGpFIhkbSurvTp1E3
	 fsEtIIX3QBj1Q==
Date: Tue, 8 Aug 2023 13:15:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Alexandru Isaila <aisaila@bitdefender.com>, 
    Petre Pircalabu <ppircalabu@bitdefender.com>, 
    federico.serafini@bugseng.com, tamas@tklengyel.com, 
    george.dunlap@cloud.com
Subject: Re: [XEN PATCH] xen: change parameter name in monitor_domctl()
 declaration
In-Reply-To: <4722cb01-2e0a-6a12-b398-0ddd024b50bd@suse.com>
Message-ID: <alpine.DEB.2.22.394.2308081313100.2127516@ubuntu-linux-20-04-desktop>
References: <6a25e9d729e85ba5712fd00f9c0514a459bb7631.1690471420.git.federico.serafini@bugseng.com> <alpine.DEB.2.22.394.2308041438170.2127516@ubuntu-linux-20-04-desktop> <4722cb01-2e0a-6a12-b398-0ddd024b50bd@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1365989943-1691525642=:2127516"
Content-ID: <alpine.DEB.2.22.394.2308081314030.2127516@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1365989943-1691525642=:2127516
Content-Type: text/plain; CHARSET=US-ASCII
Content-ID: <alpine.DEB.2.22.394.2308081314031.2127516@ubuntu-linux-20-04-desktop>

On Tue, 8 Aug 2023, Jan Beulich wrote:
> On 04.08.2023 23:39, Stefano Stabellini wrote:
> > Hi Tamas,
> > 
> > May I have your ack on this change?
> 
> I see you committed this, and there is an ack in the commit, but I can't
> see any ack on list (incl when checking mail archives, to exclude an
> issue with my mailbox).

That is strange! Something appears to be wrong with xen-devel. Adding
George in CC and attaching Tamas' reply.


> > On Thu, 27 Jul 2023, Federico Serafini wrote:
> >> Change parameter name in monitor_domctl() declaration for
> >> consistency with the corresponding definition.
> >> This addresses a violation of MISRA C:2012 Rule 8.3: "All declarations
> >> of an object or function shall use the same names and type qualifiers".
> >>
> >> No functional changes.
> >>
> >> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> > 
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > 
> > 
> >> ---
> >>  xen/include/xen/monitor.h | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/xen/include/xen/monitor.h b/xen/include/xen/monitor.h
> >> index 6b17a93071..713d54f7c1 100644
> >> --- a/xen/include/xen/monitor.h
> >> +++ b/xen/include/xen/monitor.h
> >> @@ -27,7 +27,7 @@
> >>  struct domain;
> >>  struct xen_domctl_monitor_op;
> >>  
> >> -int monitor_domctl(struct domain *d, struct xen_domctl_monitor_op *op);
> >> +int monitor_domctl(struct domain *d, struct xen_domctl_monitor_op *mop);
> >>  void monitor_guest_request(void);
> >>  
> >>  int monitor_traps(struct vcpu *v, bool sync, vm_event_request_t *req);
> >> -- 
> >> 2.34.1
> >>
> >>
> > 
> 
--8323329-1365989943-1691525642=:2127516
Content-Type: message/rfc822; NAME=tamas.eml
Content-Transfer-Encoding: BINARY
Content-ID: <alpine.DEB.2.22.394.2308081314560.2127516@ubuntu-linux-20-04-desktop>
Content-Description: 
Content-Disposition: ATTACHMENT; FILENAME=tamas.eml

>From tamas@tklengyel.com Sat Aug  5 04:06:33 2023
Return-Path: <SRS0=apUu=DW=tklengyel.com=bounce+b5c693.cd840-sstabellini=kernel.org@kernel.org>
Delivered-To: stefano-oss@posteo.net
Received: from posteo.de [185.67.36.169]
	by ubuntu-linux-20-04-desktop with IMAP (fetchmail-6.4.2)
	for <sstabellini@localhost> (single-drop); Sat, 05 Aug 2023 04:06:33 -0700 (PDT)
Received: from proxy02.posteo.name ([127.0.0.1])
	by dovecot15.posteo.name (Dovecot) with LMTP id OD0XKygrzmTfMAIAB3Nl4w
	for <stefano-oss@posteo.net>; Sat, 05 Aug 2023 13:06:14 +0200
Received: from proxy02.posteo.de ([127.0.0.1])
	by proxy02.posteo.name (Dovecot) with LMTP id fqefNzspzmTX4QAAGFAyLg
	; Sat, 05 Aug 2023 13:06:14 +0200
Received: from mailin02.posteo.de (unknown [10.0.0.62])
	by proxy02.posteo.de (Postfix) with ESMTPS id 4RJ0BL2G6Jz12M6
	for <stefano-oss@posteo.net>; Sat,  5 Aug 2023 13:06:02 +0200 (CEST)
Received: from mx01.posteo.de (mailin02.posteo.de [127.0.0.1])
	by mailin02.posteo.de (Postfix) with ESMTPS id 3ED26216E2
	for <stefano-oss@posteo.net>; Sat,  5 Aug 2023 13:06:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at posteo.de
X-Spam-Flag: NO
X-Spam-Score: -4.75
X-Spam-Level: 
X-Spam-Status: No, score=-4.75 tagged_above=-1000 required=5
	tests=[HEADER_FROM_DIFFERENT_DOMAINS=0.249, HTML_MESSAGE=0.001,
	RCVD_IN_DNSWL_HI=-5, T_POSTEO_TLSINY=0.01,
	T_RCVD_IN_ABUSIX_WHITE=-0.01] autolearn=disabled
X-Posteo-Antispam-Signature: v=1; e=base64; a=aes-256-gcm; d=p4jeoLx8GSVfXysvUQMETnPVZwsS1NCfRrCQ+OIfXMVkjhIZ6cJqJzQ2xsxWawG5B4emcNKFyaO0uF37H3jKNhljpy3WUd4kJSdvfddciH4VZJrlRmkPTO3n77X06CxEC2ZK2K7g
Authentication-Results: posteo.de; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: posteo.de; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: posteo.de;
	dkim=pass (2048-bit key) header.d=tklengyel.com header.i=@tklengyel.com header.b=NZXhVc+1;
	dkim-atps=neutral
X-Posteo-TLS-Received-Status: TLSv1.3
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by mx01.posteo.de (Postfix) with ESMTPS id 4RJ0BK3q2Lz11g3
	for <stefano-oss@posteo.net>; Sat,  5 Aug 2023 13:06:01 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 748A3601D0
	for <stefano-oss@posteo.net>; Sat,  5 Aug 2023 11:06:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E997BC433C9; Sat,  5 Aug 2023 11:05:59 +0000 (UTC)
Delivered-To: sstabellini@kernel.org
Received: from so254-35.mailgun.net (so254-35.mailgun.net [198.61.254.35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 348A5C433C8
	for <sstabellini@kernel.org>; Sat,  5 Aug 2023 11:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 348A5C433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tklengyel.com
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; s=mailo; t=1691233557; x=1691240757; h=Content-Type: Cc: To: To:
 Subject: Subject: Message-ID: Date: From: From: In-Reply-To: References:
 MIME-Version: Sender: Sender;
 bh=XEy1vcTg986vcuRn0cPfqtUGQoVn71aO6yXWNPsDcxk=;
 b=NZXhVc+1LvgtFz3pZo5eY/1oI+bvlQ3bB+A78sFqnfnLDKJHOLEuyKq99mzA6xhCmle23OzwhRXlfjR0LhB5pn4eVXXoV+/SIXHrUd4/yX/JPwvz03PB7MiA4ori9XJ88+EjC4BEJaniSPsz3G3hc0L/niZXBBzOJZXVCwR5K+cwaW4TECmqvXDAdvOiTkyfmU9df3JW7qSdw6+0SbtvQcTI06VFiROAHiBn2TGDwSzxYtEA43P3JHEw2zvukbN+VqO8dj6dDMAVtyYPimJ79CPesn6HYDDmsR0kTptCyFBgHLT7Gm2rFb1qoh1feNUtlH6rw4kZnH21KTHw7io5ZQ==
X-Mailgun-Sending-Ip: 198.61.254.35
X-Mailgun-Sid: WyI2MzhkZCIsInNzdGFiZWxsaW5pQGtlcm5lbC5vcmciLCJjZDg0MCJd
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171]) by
 aba04b98da0a with SMTP id 64ce2d1544e01654935e5a3b (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Sat, 05 Aug 2023 11:05:57 GMT
Sender: tamas@tklengyel.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-586a3159588so25627287b3.0
        for <sstabellini@kernel.org>; Sat, 05 Aug 2023 04:05:57 -0700 (PDT)
X-Gm-Message-State: AOJu0YziM/EzIuEAzcUpHfY7hNhb9pGl+eZvYLzSfl2n7nkjDlH48XUp
	6O8gexWJG+sWR/f3n9EugmCpOnFYliZVhHKlcr4=
X-Google-Smtp-Source: AGHT+IHeaTodq61jc8nt4YGs/RkXrtsDT5KZst1gZHUjz80gQXJivp4tUcqwXUIDc+OnFE93Mhgqw4csAoe7ZxG3rV0=
X-Received: by 2002:a81:6c45:0:b0:586:9384:ffd7 with SMTP id
 h66-20020a816c45000000b005869384ffd7mr2473174ywc.9.1691233556109; Sat, 05 Aug
 2023 04:05:56 -0700 (PDT)
MIME-Version: 1.0
References: <6a25e9d729e85ba5712fd00f9c0514a459bb7631.1690471420.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2308041438170.2127516@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2308041438170.2127516@ubuntu-linux-20-04-desktop>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Sat, 5 Aug 2023 13:05:44 +0200
X-Gmail-Original-Message-ID: <CABfawh=r2Ad6ZvHqjH3UpGGx2wjjuurhcOabby=Xv=E2zK0TsA@mail.gmail.com>
Message-ID: <CABfawh=r2Ad6ZvHqjH3UpGGx2wjjuurhcOabby=Xv=E2zK0TsA@mail.gmail.com>
Subject: Re: [XEN PATCH] xen: change parameter name in monitor_domctl() declaration
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, consulting@bugseng.com, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	Federico Serafini <federico.serafini@bugseng.com>
Content-Type: multipart/alternative; boundary="0000000000005822c306022aff56"

<div dir="auto"><div><br><br><div class="gmail_quote"><div dir="ltr" class="gmail_attr">On Fri, Aug 4, 2023, 11:39 PM Stefano Stabellini &lt;<a href="mailto:sstabellini@kernel.org">sstabellini@kernel.org</a>&gt; wrote:<br></div><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Tamas,<br>
<br>
May I have your ack on this change?<br>
<br>
<br>
On Thu, 27 Jul 2023, Federico Serafini wrote:<br>
&gt; Change parameter name in monitor_domctl() declaration for<br>
&gt; consistency with the corresponding definition.<br>
&gt; This addresses a violation of MISRA C:2012 Rule 8.3: &quot;All declarations<br>
&gt; of an object or function shall use the same names and type qualifiers&quot;.<br>
&gt; <br>
&gt; No functional changes.<br>
&gt; <br>
&gt; Signed-off-by: Federico Serafini &lt;<a href="mailto:federico.serafini@bugseng.com" target="_blank" rel="noreferrer">federico.serafini@bugseng.com</a>&gt;<br>
<br>
Reviewed-by: Stefano Stabellini &lt;<a href="mailto:sstabellini@kernel.org" target="_blank" rel="noreferrer">sstabellini@kernel.org</a>&gt;<br></blockquote></div></div><div dir="auto"><br></div><div dir="auto">Acked-by: Tamas K Lengyel &lt;<a href="mailto:tamas@tklengyel.com">tamas@tklengyel.com</a>&gt;</div><div dir="auto"><div class="gmail_quote"><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--8323329-1365989943-1691525642=:2127516--

