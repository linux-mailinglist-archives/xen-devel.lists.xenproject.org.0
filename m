Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJW/FHSIGmpt5QgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 30 May 2026 08:49:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB52A60B7DA
	for <lists+xen-devel@lfdr.de>; Sat, 30 May 2026 08:49:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1322867.1589039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTDUc-0003KV-IY; Sat, 30 May 2026 06:48:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322867.1589039; Sat, 30 May 2026 06:48:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTDUc-0003Hf-F1; Sat, 30 May 2026 06:48:22 +0000
Received: by outflank-mailman (input) for mailman id 1322867;
 Sat, 30 May 2026 06:48:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wTDUa-0003HZ-Rb
 for xen-devel@lists.xenproject.org; Sat, 30 May 2026 06:48:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wTDUZ-00CdDA-Az
 for xen-devel@lists.xenproject.org; Sat, 30 May 2026 08:48:19 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a1a87fb-2eae-0a2a0a5409dd-0a2a45059696-48
 for <xen-devel@lists.xenproject.org>; Sat, 30 May 2026 08:48:19 +0200
Received: from [209.85.167.53] (helo=mail-lf1-f53.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a1a8832-aaa8-0a2a45050019-d155a735f1a2-3
 for <xen-devel@lists.xenproject.org>; Sat, 30 May 2026 08:48:19 +0200
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5aa63daf2a5so129930e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 23:48:19 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1780123698; cv=none;
        d=google.com; s=arc-20240605;
        b=MK4XlozEkoGe+3rqhUEJdIG0w1a85HCrR/RTdiUafkZimV+49GKntx83iRDn++HH6X
         rHRCbv06+GdrqtyM5xavs+pySkgeNcq0814rk22qVo93gwLtV/zNRVs0dYghSRGoywxa
         FeFVyguA2ocNc3w/QZnj1z2VeaFygidW2g+6VqTvyxTErGaQTLVnDVDd2LruvkE+pgu6
         50i0zGCTFosyiLq5N0giP6m0NA+fFl48sKULG8emvALg5mJ0t0hq7YoWi/gVe01b9yoQ
         BmSdQaYsmlmpCDuXJYwYmbjDgQWR2LH6cG+crztkXq3jHoUL8zzXiLHQTsz6oUf9ImFV
         A4Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7j0pg8TN/7qQMlytW5UTmKIuov0iO6TEZujM6+giXMA=;
        fh=/Tq7X+nRCetFeaTnoqIgCIOw8I91xEW6Ck4UaUomaQw=;
        b=XyypTVg2uTnzHqVTk45rbSQAh3lzbNLytXa7884P9SbN6ECRQV1Bt6tAJ8VTZgI445
         enuJtmjvuZTyBQ6Y687FeN0aOQkQy0gahh9aYWxGouvtT6xJoKCxirYsbyBH978S+RJr
         CbP7Jtp3aAeJAk715AvlZeBKkT4+ABYPC9s4YNXYwlBR1blvrPUmauG2wsb1DYaseICf
         ZTz3PKOYGfX2Tss8MbTJ7QyQdxK6ajghpgMj4CYGCv4azyK4b+dQKXeDhGZvDJAIZbgP
         m9N5TMnelWoNYHlSiEL1hkOdU0oOp92nJ2DJ0DNj+NKOqP4//Dh0FXga/d5brhgyviK1
         mpoA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780123698; x=1780728498; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7j0pg8TN/7qQMlytW5UTmKIuov0iO6TEZujM6+giXMA=;
        b=dvH84vSu5sIAkxQrABkCyiMvw4PETkbkVLTjpzdtxXXPww7XD17IcdOVxCiNh6wlDE
         SePEcuUpikG8GtzUcywfWoOKQRbNTUPVY4bezBDVVxX4iuHoGB9NS5g4INoocMgwbNkh
         0wx1f4N2qP/ygDjRDN0z9tEt3yIWTgg7lbkUX8t2YKv1kf4cGNkHyPSDDpp7C9LnGB9s
         qhxVZfeHlvaGz3iktChO9nk8y+Lji4UKVkiO6/ykrWetjFlAOJbwaa2WfbsrWzEmEq+0
         oEi73lDOzdGO/4Wn7nkN33zori2IjAHyYL8UoeutbPlt9fwEeYlZjc8AqSiH5FvWym1y
         pucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780123698; x=1780728498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7j0pg8TN/7qQMlytW5UTmKIuov0iO6TEZujM6+giXMA=;
        b=tJ52CzTh5qXsaUggYI8a8USM/AAHJPC7wQvy217+z+y2BXmZU9kl3IXSFyJ+g3slvP
         5OfVQv5Jh5IWHOFP5zofAvzQsd6MucSTl247irysu/g647Tlmplm3Uo3ZXFbzD4a+bKl
         V5vV3r0woS7gLeQeBJqZxRuLR5Uj/niVfwblW8cCQwrwMkR77CfzoW8jkaOhvIZWo+I1
         QA/WGh/NruScF8UmXUm5akAeq2F/JYQrl0cm7BnM8H83i/OmZltHWYCeb1QlxPHqIQyQ
         nJnbggTyxQfl6cnqIF4YUAmgW8kM2YP2o5O8cSWEF1sFakHMB6PqYyEyCxiVIYEtrCpq
         hNzQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zUaL0sdz3/OTqEtOrCGFTqEtcD5SephcyjxkFG5WQlT3qG/dpy+BW4ZXvpUY5uqSsImYh7dph2ME=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxLMZaXxU8gDzde/hOUz5NM6EHUVrpltOJEDtXFy6OqhCUSeVhf
	TOGWlO1YQoPX0hGtvSlt7I8kwF5rnC5ahh/CSuylkiQ87Uyv4BoLxT4xEGuVSowwcZenIPS7aNZ
	sln3/f97CvwNdTBOmvSL+LXSknms/JHc=
X-Gm-Gg: Acq92OGr7u42Ofa0WOUP/3WWdg+jx8LSEKMHsF6TFne67XhL8kRd12HiE/vSOn3KIBq
	l8W/QrZj/gvHRT9mHO0i3cv3b/jVFqp3NEsd5/JkZcQ0mOZyJEBmoHpiacbk2Ev2+zHUaYgpTPd
	bPfN8j4RInwpInQEcJrZtldfYkt4UVeEt+q5mIgpxXaMOcX0W3caDgvZKVhRSM/zfi/P57ZguCD
	gfnMchDQRgMgj73Gnpc/uUR9EAjMvs6scTC2canzYAgu5ja4XCbovHQNVwsdrasp9wPIm1F8fRP
	nVUZU3Jp4aRq0RH4
X-Received: by 2002:a05:6512:6181:b0:5aa:6395:f9c5 with SMTP id
 2adb3069b0e04-5aa6395fa46mr293015e87.27.1780123698205; Fri, 29 May 2026
 23:48:18 -0700 (PDT)
MIME-Version: 1.0
References: <e9c45be41bb36ca341dad57196c753fbe82d1526.1774998397.git.mykola_kvach@epam.com>
 <d53d2b06-56d7-43bc-bb20-4df7b7bc3ca5@suse.com>
In-Reply-To: <d53d2b06-56d7-43bc-bb20-4df7b7bc3ca5@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Sat, 30 May 2026 09:48:06 +0300
X-Gm-Features: AVHnY4IhgQGqiohAUgmpjIXAUoxyDlJ8u1dtdUvIBlQobA53X2UHp_a26ZU7xpQ
Message-ID: <CAGeoDV8JHY6_dMATNcgoZkJYa5ma_EJ8fg=85NNXqMnNNTCY6w@mail.gmail.com>
Subject: Re: [PATCH v2] xen/domain: make shutdown state explicit
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Paul Durrant <paul@xen.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>, 
	Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c201ff/1780123699-E318B443-69D5983C/0/0
X-purgate-type: clean
X-purgate-size: 5995
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:mykola_kvach@epam.com,m:paul@xen.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:tim@xen.org,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,suse.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: AB52A60B7DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thanks, Jan. I agree with your comments and will rework this for v3.

The main change will be that domain_shutting_down() preserves the old
is_shutting_down semantics. It will be true once shutdown has started
and remain true after shutdown completion until domain_resume() resets
the state.

On Wed, Apr 8, 2026 at 4:06=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 01.04.2026 08:41, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > The shutdown flow currently overloads is_shutting_down and
> > is_shut_down to represent multiple phases of the shutdown lifecycle.
> > Some users treat is_shutting_down narrowly as "shutdown still needs to
> > be driven to completion", while others rely on it more broadly as
> > "the domain is no longer in its normal running state".
> >
> > Make the lifecycle explicit by introducing enum
> > domain_shutdown_state and helper predicates whose names match their
> > semantics: domain_shutting_down() for the transient phase,
> > domain_shutdown_completed() for the final state, and
> > domain_in_shutdown_state() for checks that need the union of both.
> >
> > The conversion is intentionally not mechanical. The old flags were not
> > mutually exclusive: once a domain became fully shut down,
> > is_shutting_down remained set. As a result, sites that previously
> > used the absence of is_shutting_down to exclude both the transient and
> > completed states now use domain_in_shutdown_state(), sites that care
> > specifically about the final state use domain_shutdown_completed(),
> > and only paths that still have work to do before shutdown finalization
> > use domain_shutting_down().
>
> In how far is the distinction between domain_shutting_down() and
> domain_in_shutdown_state() really necessary?

Agreed. I will drop domain_in_shutdown_state() in v3.

domain_shutting_down() will preserve the old is_shutting_down
semantics, rather than mean only the transient state. That is, it will
return true from the point where shutdown has started until
domain_resume() resets the state, including after shutdown has
completed.

> still leaves me pretty clueless as to almost(?) all of the uses of the
> latter (where I think the former could be used just as well). Many
> paths simply can't be taken anymore for a fully shut down domain, so
> the distinction between the two is moot there.
>
> I'm also concerned of the name domain_in_shutdown_state() itself. To

Yes, that name is misleading. Since the helper is not needed anymore,
I will remove it in v3.

> me this is far closer to domain_shutdown_completed() than to the union
> of both states. See how e.g. x86 CPUs can be "in shutdown state", i.e.
> not responding to anything but a reset or init signal.
>
> IOW an entirely mechanical replacement might in fact be easier to look
> at. And in the one rare case where the distinction might indeed be
> relevant, "domain_shutting_down() || domain_shutdown_completed()" could
> be used.

Agreed. I will follow this approach in v3.

The old is_shutting_down users will use domain_shutting_down(), with
the same effective semantics as before. The only users converted to
domain_shutdown_completed() will be the ones that previously checked
is_shut_down.

>
> > @@ -1423,9 +1423,12 @@ int domain_shutdown(struct domain *d, u8 reason)
> >      return 0;
> >  }
> >
> > -void domain_resume(struct domain *d)
> > +int domain_resume(struct domain *d)
> >  {
> >      struct vcpu *v;
> > +    enum domain_shutdown_state shutdown_state;
> > +    unsigned int shutdown_code;
> > +    int rc =3D 0;
> >
> >      /*
> >       * Some code paths assume that shutdown status does not get reset =
under
> > @@ -1435,10 +1438,18 @@ void domain_resume(struct domain *d)
> >
> >      spin_lock(&d->shutdown_lock);
> >
> > -    d->is_shutting_down =3D d->is_shut_down =3D 0;
> > +    shutdown_state =3D d->shutdown_state;
> > +    shutdown_code =3D d->shutdown_code;
> > +
> > +    if ( !domain_shutdown_completed(d) )
> > +    {
> > +        rc =3D -EINVAL;
> > +        goto out_unlock;
> > +    }
>
> I can't help the impression that you're mixing two things here - adjustme=
nt
> to how shutdown state is tracked, and enforcement of completed shutdown
> right here. This separate change likely would better be split out, and th=
en
> come with a description saying not only what is being changed, but also w=
hy,
> and why the change is correct for both call sites.

Agreed. I will drop this part from v3.

domain_resume() will remain void and the callers will be left
unchanged. This patch should only make the existing shutdown state
tracking explicit. If resume-state validation is needed, it can be done
as a separate change with its own justification for the affected call
sites.

>
> > @@ -1448,9 +1459,17 @@ void domain_resume(struct domain *d)
> >          v->paused_for_shutdown =3D 0;
> >      }
> >
> > + out_unlock:
> >      spin_unlock(&d->shutdown_lock);
> >
> >      domain_unpause(d);
> > +
> > +    if ( rc )
> > +        dprintk(XENLOG_WARNING,
> > +                "%pd: Invalid domain state for resume: shutdown_state=
=3D%u, shutdown_code=3D%u\n",
> > +                d, shutdown_state, shutdown_code);
>
> The shutdown code doesn't affect whether the function would fail. The ext=
ra
> variable just to log it anyway is therefore a little irritating. Is there
> any reason to this that I'm overlooking?

The reason was only to avoid printing while holding shutdown_lock.

I wanted to sample the state under the lock and emit the diagnostic
after dropping it. shutdown_code was included only as extra context for
that warning, not because it affected the decision.

That said, I agree this is not needed here. Since I will drop the
resume-state validation from v3, the warning and the extra cached
shutdown_code will go away as well.

Best regards,
Mykola

