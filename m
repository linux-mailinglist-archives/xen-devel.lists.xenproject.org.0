Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8A01DvdgwmmecAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 11:01:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4567306187
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 11:01:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260216.1553578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4yZQ-0000Oq-Gu; Tue, 24 Mar 2026 10:01:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260216.1553578; Tue, 24 Mar 2026 10:01:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4yZQ-0000MF-Dn; Tue, 24 Mar 2026 10:01:08 +0000
Received: by outflank-mailman (input) for mailman id 1260216;
 Tue, 24 Mar 2026 10:01:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w4yZP-0000Lf-1h
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 10:01:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4yZO-001ZCN-Dh
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 11:01:06 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c260da-e002-0a2a0a5209dd-0a2a4503b0c4-30
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 11:01:06 +0100
Received: from [209.85.208.169] (helo=mail-lj1-f169.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c260e1-1947-0a2a45030019-d155d0a9cd8a-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 11:01:06 +0100
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-38bd3c6c502so25373511fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 03:01:06 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1774346465; cv=none;
        d=google.com; s=arc-20240605;
        b=bzd0ZDY7qSSQwWaeY/JHYAYPRzLxRt86HMBG8mdY6MKjyoJhzN28XF4ulilEur13Mh
         c8gAbJo+H5xmvIjgp8hxZOjWcpiXplQaKZzn8xL6q0Wq7gRvYttpkn67iARvqRJwJN1t
         gx/vwBuC2F+6edmC+vS/L7vslGmccv02V8NDbtojLBrXbuyIyFPJ7BU2opltvLqH4+k0
         nOQovdT1D3shcOMoNQtK2z9VhOjxd+abZ1hCHb45acKURuzjI7NgwcBcySqtEtsslFPU
         TZjbDA96wczdVUuHxK0EnjIsKxEy5GMprH5zYe4VHhc1v3m/bMleQkgbh2e7tydXc4QQ
         ziJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vti3dJ2V5oeI+p3j2rVJPrK82fkJwwm+IMJOx28LmOM=;
        fh=VOXfUY/9jxVlo5Oie8g2PfMfSuQb+LU+K1sdCNvuHos=;
        b=Ai/rZHMI3Kk43VySoqCAf05LW1cT9fC1KZEFEHnbOTp4CJ1y/NQZATVl4N13AR8Q7C
         qHFWbHzaSgyfH1hhYmrRiikyCt2rDJOZAhwNazIwqZD5qpfxKNj5ZQMEahObbpWZp0pv
         eb+LmCe0YE8xP6snxgVR/CwbaPXPSychXzrPAYOKIusfEjc7tNSuRisSTPXoUnwPm0ig
         fzX9XjIVA5RvBBVvPENtRn6Uuq1emQNPnxtDV/ewz6cMwbJBVCVuHsejWQ71WgTUuF9+
         CJTGeXvhxMBWY+h2WRbUhX/LUZ4B33GVtn4eydFtKf47frDoUi0pmqL2BW1BqoAGPJ/v
         zkcw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774346465; x=1774951265; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vti3dJ2V5oeI+p3j2rVJPrK82fkJwwm+IMJOx28LmOM=;
        b=Pg22emfQ35VWc2vsvw+iQSKQJgtP5d3Rde2iC9OsJc+T6ggY2+BDrPKclUPtpsU51h
         9LyuDQyg1z+viQ5fhBLaQd5cRBqmkiKlmNvhhA+gQTstSoALOo3k9eNyT+5nOOaDN2+Y
         xq45p+llpNKLISuQJ8Pzr4Y2yIsoKVfxWjhlqmybAR9HKo2UdisB7+OQrjAx+8Elpv2P
         /Q+EuS6+sctlmyIU7mEDZnt5STIAkOIm4CD8nnAIZ+YBe6kfPwLjVlzwK4G0qbrEXEvH
         DiwYM1QUoHojZc3CK49ATnfbjpcikzGskFOHxI5i5YXxjC3r29J9ZsAfBjaGo2VgYjqm
         RFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774346465; x=1774951265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vti3dJ2V5oeI+p3j2rVJPrK82fkJwwm+IMJOx28LmOM=;
        b=Fd3Alv2I1zZyTBbgBft7gH4ISoPAPlyQqCp6tSG79Cn2v/srZtxqDPDp1Kyz7B2i7E
         0JgDCbE3gmhqT+aWzebHBbIx0B3tx63nGCUuP7xf8ht7B6qfukHaszEI6e66JorPhoYb
         FnIXdRGpy08S5vuYfojGO/pSSQ8A7thKkEqO+yksUZflsmZxPdLTTnOi+RHv9zDIbDRA
         4O6X7lVI8JUCPY1jy8tRT0JFHLrgkzWG0bmT3LIFBthWmdUDZ0RvZhQ9BJGVygduhn1Y
         8bkQgaBGwq13SmdYSnQF64lJ2kJnimeHO3CeofBWHM5O9zbPfOqYjXlfKskatlNmJMaS
         yykQ==
X-Gm-Message-State: AOJu0Yx4SDG85S9uHnRa6sgwmF31zUfZM68jPttz8uXKalEJgTqScwq+
	Xz+PGNbtlSvGSTTR4KbHoWgY3kYfpjvgWlrZ6BVgNEKX0SFEb5hE8EYjeN0DaCWVt/5OgeWvyCV
	jKZUQKWVRuUi3yq2B0QDd0tOp9v1bJg7UcmAB
X-Gm-Gg: ATEYQzxvMGtMfWgQX4DePQn+UWenJXh1rUoKz5BM/3am2m/NkeNGEOaGy37+HGN7RNR
	bk4t7Hqh4O2IpqsE8lgn2PFZoxUrdSI0vD/5a0uVSNIUHFHdZfgIA9tuWYJ9/kJ+zd+a81VMytQ
	h3brRsC4rR0j2U5hnHDrg/V07dpeBuETw5k2VrmvsQc8EI1DOPdIwsUuvzsEjuxGJxG3WXY/rqU
	88xnJNycN+orwSK/Ccd8VLKmvUKE1rlX3JT9VymPvidIi9UVCZ7Y/XI6rYifzSCGhhO6ZAvCAwf
	7bWeDg==
X-Received: by 2002:a05:651c:19a6:b0:38b:fb66:5797 with SMTP id
 38308e7fff4ca-38bfb6659e1mr50336661fa.12.1774346463809; Tue, 24 Mar 2026
 03:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <2004584dbbe393c9de4b3231bf91a24f6e5de5de.1773875416.git.mykola_kvach@epam.com>
 <5bc8a4ab-3e23-494a-b5ce-d1aa5c6ec7de@amd.com>
In-Reply-To: <5bc8a4ab-3e23-494a-b5ce-d1aa5c6ec7de@amd.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 24 Mar 2026 12:00:00 +0200
X-Gm-Features: AQROBzDl7RQmCd1VGU60veq1_tOcAsHY0kZIBGxaD1yzx1vIKnDvdn8u5ekTIDI
Message-ID: <CAGeoDV8aHc7hZR=WV1dyncvgPxwPuqw8bdQz_s+ujzZPtuS5bg@mail.gmail.com>
Subject: Re: [PATCH] xen/domain: make shutdown state explicit
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>, 
	Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-33051d/1774346466-4806C72C-AE2F7EEF/0/0
X-purgate-type: clean
X-purgate-size: 2517
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,amd.com:email];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:paul@xen.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:sstabellini@kernel.org,m:tim@xen.org,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	RSPAMD_EMAILBL_FAIL(0.00)[jbeulich.suse.com:query timed out];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: E4567306187
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal,

Thank you for the review.

On Thu, Mar 19, 2026 at 12:09=E2=80=AFPM Orzel, Michal <michal.orzel@amd.co=
m> wrote:
>
>
>
> On 19/03/2026 00:25, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > The domain shutdown flow currently overloads is_shutting_down and
> > is_shut_down to represent multiple phases of the shutdown lifecycle,
> > while some users treat is_shutting_down as a broader "domain is no
> > longer normal" condition.
> >
> > Make the shutdown lifecycle explicit by introducing
> > enum domain_shutdown_state and converting the existing users to helper
> > predicates describing whether shutdown is in progress, complete, or
> > active.
> >
> > At the same time, make domain_resume() validate its input state and
> > return an error to its callers. Resume is now accepted only from the
> > fully shut down state.
> Also, you limit it now to SHUTDOWN_suspend or SHUTDOWN_soft_reset. Ideall=
y you
> should explain why i.e. resuming from crash/poweroff/reboot is semantical=
ly
> meaningless.

That makes sense. Looking at the existing flow more closely, the
suspend and soft-reset cases are not symmetric.

For suspend, the intended semantics are explicit and long-standing:
the public SCHEDOP_shutdown documentation describes special resume
semantics only for SHUTDOWN_suspend, libxl documents resume for a
suspended domain, and xc_domain_resume has long rejected domains
which are not shut down with SHUTDOWN_suspend.

Soft reset is different. The toolstack may choose soft-reset as the
action for other shutdown reasons too, e.g. on_reboot=3Dsoft-reset.
In that case the domain reaches the soft-reset path with
shutdown_code still set to SHUTDOWN_reboot, and only afterwards the
toolstack decides to perform a soft reset. So the new validation in
domain_resume() is too strict for the existing soft-reset flow.

Given that, I agree the checks should not be there in the current
form.

I'll drop the checks in the next version.

Best regards,
Mykola

>
> >
> > This removes the implicit coupling between unrelated users of
> > is_shutting_down and makes the shutdown/resume state transitions
> > self-describing.
> >
> > Suggested-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> This is mostly a mechanical change. I verified that correct helpers are u=
sed in
> place of old flags.
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>
> ~Michal
>

