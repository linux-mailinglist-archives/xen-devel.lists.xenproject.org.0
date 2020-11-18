Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EF32B7F7B
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 15:34:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29904.59595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfOWt-0004xy-T8; Wed, 18 Nov 2020 14:33:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29904.59595; Wed, 18 Nov 2020 14:33:51 +0000
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
	id 1kfOWt-0004xZ-Pr; Wed, 18 Nov 2020 14:33:51 +0000
Received: by outflank-mailman (input) for mailman id 29904;
 Wed, 18 Nov 2020 14:33:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BWMM=EY=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kfOWs-0004xU-JX
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 14:33:50 +0000
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec5adf63-0d4e-45cc-9dec-818a141f8828;
 Wed, 18 Nov 2020 14:33:49 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a186so435738wme.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2020 06:33:49 -0800 (PST)
Received: from CBGR90WXYV0
 (host109-146-187-185.range109-146.btcentralplus.com. [109.146.187.185])
 by smtp.gmail.com with ESMTPSA id s2sm4040430wmh.37.2020.11.18.06.33.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Nov 2020 06:33:48 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=BWMM=EY=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kfOWs-0004xU-JX
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 14:33:50 +0000
X-Inumbo-ID: ec5adf63-0d4e-45cc-9dec-818a141f8828
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ec5adf63-0d4e-45cc-9dec-818a141f8828;
	Wed, 18 Nov 2020 14:33:49 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a186so435738wme.1
        for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2020 06:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=DJotjOUv926v61vr8+5zIsh5S7P/Yyu7PPcb+ZYdyK8=;
        b=XJlJmh4e4v8JOBiq22YecsH+3mXOHaJJvxTxY1vEjRvzv00Ejmz6AOeMoHwFhAhGDr
         bni2j12CMUftkR3XKYsbDrlIncRYrL0YH7yVpTXU1sBYQP7SYljShVoc+QjWhHeHFgoK
         SayxLTiv9bUalZMmPbnyuXmhWTCAmwMtkQBqld72DEZ+iZnVx91Z7qNgR2wREoHGzCst
         Yxl7vA9usmh0bAdozvihaRkzCKl/eNdggNWoZPcV5hfYE8XevqYh6tapTdvMo79jWoJV
         2/+u1fRiKUuJmlWlmL69tTNgxqy1kabvHxjpJcU7YEaFAhM5LsnQVoTaeRQe1+hZhr3T
         nbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=DJotjOUv926v61vr8+5zIsh5S7P/Yyu7PPcb+ZYdyK8=;
        b=nCEvtlkRA7tl0M4b0oe4+wu/u7MT4jOMyqfKye1r/mnno/C8GG8yYejCs13lQHp15z
         u6uMlpTyf0PAvRGfyPsDFhFzX6OS32CCSs/rS7n0jHcnEQEGkiSpsbgqmjJlt3L/x/TK
         W4VKDaXbUjAiYo58t8RUMRsZR74H80ZBXVoBJ+enJFji04i7HdEy98pWHXg6S8yVLvn6
         vBOVVGD7aJ+nGVun4uAKuvZXPUX/fEHp3PD2lszYzUdnbp5suuYrDxKh1YRXHNw4B45T
         L8TwAX1wGiORlqhJKaBtw/WJmCjMMcu89HZK1nd5SKEDc9vwDUqzHHbfIXDe4sOY1nQP
         2+oQ==
X-Gm-Message-State: AOAM530YYs8ZmDS3ImmvMpX15AEPmYPYiosYtcCUWWBMxWn+GEOZZ5zr
	jybVwG9coTZx7mULHe1IZgw=
X-Google-Smtp-Source: ABdhPJzoN8sjB+HEfAvTPSscOLM4UTc9ZgrE4Qz7dErWzkTsTnuSVmwq11j6HMglRcBYnu16A1BWGw==
X-Received: by 2002:a1c:b18a:: with SMTP id a132mr313349wmf.95.1605710028818;
        Wed, 18 Nov 2020 06:33:48 -0800 (PST)
Received: from CBGR90WXYV0 (host109-146-187-185.range109-146.btcentralplus.com. [109.146.187.185])
        by smtp.gmail.com with ESMTPSA id s2sm4040430wmh.37.2020.11.18.06.33.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2020 06:33:48 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>,
	"'Jan Beulich'" <jbeulich@suse.com>
Cc: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Wei Liu'" <wl@xen.org>,
	=?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Daniel De Graaf'" <dgdegra@tycho.nsa.gov>,
	<committers@xenproject.org>,
	<xen-devel@lists.xenproject.org>,
	"'Juergen Gross'" <jgross@suse.com>
References: <20201109163826.13035-1-jgross@suse.com> <aaa3c26f-4bfa-d881-8e72-112e3108f4b5@xen.org> <1b54d0bb-deab-f4bd-b773-67a716a1fde1@suse.com> <ddb6025e-a4fb-9691-c71f-7a8f0e5543be@xen.org>
In-Reply-To: <ddb6025e-a4fb-9691-c71f-7a8f0e5543be@xen.org>
Subject: RE: [PATCH v6 0/3] XSA-343 followup patches
Date: Wed, 18 Nov 2020 14:33:47 -0000
Message-ID: <00b501d6bdb7$d3b7ef00$7b27cd00$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHTfmsryMCTAg2gQ7GRkOex+DklFQIObga+Ak9QwZ8CDQ+RhKmhGxBw

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Julien Grall
> Sent: 18 November 2020 14:18
> To: Jan Beulich <jbeulich@suse.com>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap =
<george.dunlap@citrix.com>; Ian Jackson
> <iwj@xenproject.org>; Stefano Stabellini <sstabellini@kernel.org>; Wei =
Liu <wl@xen.org>; Roger Pau
> Monn=C3=A9 <roger.pau@citrix.com>; Daniel De Graaf =
<dgdegra@tycho.nsa.gov>; committers@xenproject.org; xen-
> devel@lists.xenproject.org; Juergen Gross <jgross@suse.com>
> Subject: Re: [PATCH v6 0/3] XSA-343 followup patches
>=20
> Hi Jan,
>=20
> On 18/11/2020 08:22, Jan Beulich wrote:
> > On 17.11.2020 19:13, Julien Grall wrote:
> >> On 09/11/2020 16:38, Juergen Gross wrote:
> >>> Juergen Gross (3):
> >>>     xen/events: access last_priority and last_vcpu_id together
> >>>     xen/evtchn: rework per event channel lock
> >>>     xen/evtchn: revert 52e1fc47abc3a0123
> >>
> >> While looking at the list of commits, I noticed that the first =
patch
> >> hasn't been committed. They were all acked/reviewed, so I am a bit
> >> puzzled why this was omitted...
> >>
> >> I have nearly missed as I was expecting the 3 patches to be =
committed
> >> together. May I suggest that in the future we reply to the cover =
letter
> >> and mention which patches are (or not) committed?
> >>
> >> Regarding patch #1, I will commit it tomorrow unless there are =
strong
> >> objections against.
> >
> > Without a clear outline of what would break with the present logic,
> > I had previously indicated I'm not convinced of the change. This
> > isn't a strong objection, no, but I still wouldn't want to see my
> > name associated with it in such a case.
>=20
> I was under the impression that the committer job is mostly mechanical
> (i.e. collecting tags and applying patches). There are no rules in
> MAINTAINERS that mention committers can decide what gets committed as
> long as maintainers approved it and there are no strong objections.
>=20
> > Furthermore I clearly view
> > this as not a backporting candidate, while the other two are (as I
> > did previously indicate). Hence the latter two patches wanted
> > re-basing ahead of the first one anyway, to ease the backports.
>=20
> I understand the backport concern. However, if there were clash, then =
it
> means you had to resolve them on commit to staging. Surely, they were
> quite minimal otherwise you would have sent an e-mail on xen-devel, =
right?
>=20
> > While I will accept there are different views possible here, I also
> > don't think sending mail in such a case is a good use of resources.
> > The information what was or was not committed is readily available. =
> Personally I view such mails
> as at least very close to spam.
>=20
> This is a matter of perspective. It helps to confirm with the
> contributor that it was fine to merge only part of the series =
(multiple
> pair of eyes is always better than one...) or mentioning any =
clash/reworked.
>=20
> It also makes easier for reviewers to figure out what was committed as
> it can be difficult to know if a patch was merged because commit title
> can be altered (even simply dropping the prefix "xen/" can take a =
coule
> of more minutes to pinpoint commit).
>=20
> Therefore, I think there is a value for such e-mail to be sent out. It
> will likely improve coordination among the member of the community.

+1

Knowing that part of a long series has already been committed would be =
useful. When I do the usual pull/rebase dance prior to re-submitting I =
have, more than once, been surprised by rebase failures because some of =
the patches had been committed but were modified in doing do. It's not a =
massive problem but an email would have at least made me aware I needed =
to be a bit more careful.

  Paul

>=20
> I would be happy to consider different approach if it fullfills that =
goal.
>=20
> Cheers,
>=20
> --
> Julien Grall



