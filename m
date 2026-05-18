Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBB9NyO1Cmpp6AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 08:43:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E4D566DEC
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 08:43:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311506.1581626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOrh0-0006Mm-Aw; Mon, 18 May 2026 06:43:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311506.1581626; Mon, 18 May 2026 06:43:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOrh0-0006Jv-80; Mon, 18 May 2026 06:43:10 +0000
Received: by outflank-mailman (input) for mailman id 1311506;
 Mon, 18 May 2026 06:43:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wOrgy-0006J0-AF
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 06:43:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOrgx-00Gx9z-MJ
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 08:43:07 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0ab4f8-2eae-0a2a0a5409dd-0a2a4508ae62-10
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 08:43:07 +0200
Received: from [209.85.208.177] (helo=mail-lj1-f177.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0ab4fb-63b5-0a2a45080019-d155d0b1c4b5-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 08:43:07 +0200
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-38e8292423fso13106191fa.0
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2026 23:43:07 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1779086587; cv=none;
        d=google.com; s=arc-20240605;
        b=jqXIWps+V+x1LlYktPP8Qs0EO42fznXgQ5AKXr9cUff7N4SKqZ9yDbsOmhabuMPFCi
         UtZ/XHso75ksheGKBxbm9eum6vqgZ1ghfMVmwVL2ZzX24h99UK9FbBwfY3eRuIrQ9XAH
         RmKNGAmTQ9cHjgSqjrBs6rfZac3k7H/zB/C2nJs4oEco1voyZv4caFjUBHzK7CcRg0VC
         3A5/ODzzhbui1PxY782tOZcnQ5xQPCYs+72WXxAz3K3Eo5LoWtqihtWLs58X66Un7i8r
         TQC9Ifn6Z6Ry92Unbthsl+5A05dI9Or9rG7JMC2PJq7A6k0TCpN96s48SIifhLDs3pzP
         J0ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L27jH1Wg74nXpcVA57k1PWrZp94IvTXtyGvd5AlyrBE=;
        fh=F6qFXlazT2V4eGM+XXUTpU3niH6HQYBEcDO3rDUmPDs=;
        b=bf+l1nqLzFrQX/lygyuV5QEC9TQTsX50HjJr9zBc/HWvnFEXHnEBiJEzN18BS1ML5/
         SZbmz3BHV3aedKWO+lgg8jZhieazImc+1Gze4jQ9yFqjoOEqNOQ6gwirgeqSW/tDY/1N
         3uWtIUsK/ZFFhRuAWxpwvzeP5bA2nma+j7moQ7lySTn49qArBwMuleeQrp+RgfknnM5u
         bbX6tdq+aj3jLRqtwvwGXQZRe4aBAwIGotFCCFbjUy9EXbTFgZ/G29yYIYFPXOu7q8nn
         8j0lJHIdxilPjLelGFECNl4zihIXYCHrOd56P2FA1UwvnG2rYOaF3MboyO0AVRd2F7Uj
         UHEg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779086587; x=1779691387; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L27jH1Wg74nXpcVA57k1PWrZp94IvTXtyGvd5AlyrBE=;
        b=KIEtx4VYTHmP5ntYbYrYHWPt/1O9j2bQ9OrVxkbhTYd9OVieFEgTMEDLYjyFlrY4vh
         fPjOoO84wXkv3KFeoP/iS2rkE42zMO1r4ebDmFeHIcISde3/Wk/C0T0BvzR9G4zy1vT4
         q3gTOVRD+8qpc65UWlcgDmE+E2dKKeVwxRDbpTjJwsFKxwL9Ymmjqq6V8eyGfFhTET6t
         2SoZqpSPBXLizlDQjRP7VjWNPx3sUi9VdocE6D6xJZ4MjkcsFazfjXgYfe+lvRPfMlSC
         qkkgyfmAmmAZMTnd2joj4E89ou5Pjn/1CQgvkDCfsyN3x/HC4uHooMly/AdZXJqRGeMB
         Qxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779086587; x=1779691387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L27jH1Wg74nXpcVA57k1PWrZp94IvTXtyGvd5AlyrBE=;
        b=bd+VwJ+fqDF/SheddUagy7kI+p4sON198iScVUEwUoRK2rrEI6X9/X4qQ9RDu6ziw1
         SDirmQsr+kNqsGDY83Z904iEe3SHdFG2t8vs+eXf7dht/QV6yZal1ldLM74GKX/6a49R
         UwLgPGLS5vismhmSj6FPRb4jojakOF5Czo4R1dySHda9pdUm4oipdleTNFi4lV8KFj3Z
         ZNEnvPZB7yZGlS39vuW6nea69i2fdBgeqpvG+Ir1rt1ePV6TofwFwDGHKnMRLyfqqI5w
         bcCVidDu1OdQkOtDU3JlTSLRXCSPgZ/dJ9O3DICinI83YMPzSz11H2WArWkYN3ua1C+r
         2KWw==
X-Forwarded-Encrypted: i=1; AFNElJ/ESBajrjTLKvvb//eVM/7xsnpWeaB0gnkzmQ7EeYkwKj9t+OmNiAqO/e/pdw0zruVuZLv77yVDeS4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy0ESSw582iaHTlSs3wclHf1uVrDsT+eFXlYHV5kI1cfEKFyR3h
	5Tw7aCrQiPF1XAyYnXdNfKK02dVKJtC8e0q0pKst2Y6qZqaRDr0aU8D0+Tq0NXn5UfpCKzIqWRC
	GYjC+OztX9hoDaG6JPeKZRZEaHcOhZ7c=
X-Gm-Gg: Acq92OFfeBtqPQPZKFw5meCoPk2P8hE8S/bWy9NvyowsMBHOlGxvUznMUikSHt4iKvH
	WUpaDJitq7bjqgRUlRnjD//ur2JcGKZzxf9gWE1rk6Ocmjl5v5r66t63WwjKA0gl4e/KbTdhbGQ
	YF8QVIztsvKy8sSa53xdgcyHO0Dgx0czPapQZLJr5vDnRho1hvR9SleRn9ysTajNq7hWNZGK60O
	ley5n/QC7992l2jsjuHWrqzA72DL6JwZ4WrVK0aRMDy3ldzKGlNmcDQJyI1dIjU2Fxj42lXbXkY
	c6fGvi1C0Tb59Uc=
X-Received: by 2002:a05:651c:b10:b0:394:3442:427e with SMTP id
 38308e7fff4ca-39561dab890mr45443361fa.14.1779086586593; Sun, 17 May 2026
 23:43:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1778925998.git.mykola_kvach@epam.com> <d9db51c5-97a1-4131-8575-dca1ae2cf52c@suse.com>
In-Reply-To: <d9db51c5-97a1-4131-8575-dca1ae2cf52c@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 18 May 2026 09:42:55 +0300
X-Gm-Features: AVHnY4IfOaZU2yCaJSiIf6SUy8Thk4rK4xNuqdjA_EFbRKLFjKWY0fkuYkloZcA
Message-ID: <CAGeoDV9DitsH629pWGe+X=0VM+oi1BfSgWMxE+t32CCR5gMgtw@mail.gmail.com>
Subject: Re: [PATCH 0/2] xen/common: llc-coloring parser fixes
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, 
	Carlo Nonato <carlo.nonato@minervasys.tech>, 
	Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1779086587-BE368DB1-9A1CE30E/0/0
X-purgate-type: clean
X-purgate-size: 2889
X-Rspamd-Queue-Id: 50E4D566DEC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,mail.gmail.com:mid];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:mykola_kvach@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:carlo.nonato@minervasys.tech,m:marco.solieri@minervasys.tech,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.878];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Hi Jan,

Thank you for the feedback.

On Mon, May 18, 2026 at 9:20=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 16.05.2026 17:03, Mykola Kvach wrote:
> > This small series fixes two issues in parse_color_config().
> >
> > The first patch makes parse failures leave the caller-visible color cou=
nt
> > at zero.  This prevents a rejected command-line value from leaving a
> > partially parsed configuration behind for later init paths to consume.
> >
> > The second patch rejects empty color tokens.  Previously, delimiters in
> > places where a color value was expected could be interpreted as color 0=
,
> > because simple_strtoul() returns zero without advancing the input point=
er.
> > The patch checks that each parsed color value consumed input.  It also
> > adds the missing newline to the DT color parsing error message.
> >
> > Mykola Kvach (2):
> >   xen/common: llc-coloring: clear color count on parse failure
> >   xen/common: llc-coloring: reject empty color tokens
>
> For both of these, a question which isn't even considered in the reasonin=
g
> is whether the present behavior may be intentional. Especially for the 2n=
d
> ISTR Stefano(?) not so long ago indicating that the behavior is indeed
> intended to be this way. That may have been somewhere on Matrix rather th=
an
> on the list, though.

Thank you for pointing this out.

For the first patch, my reasoning was that returning an error while
leaving a partially parsed caller-visible color count behind looks
surprising. If the value is rejected, I think later init paths should
not be able to consume the partially parsed state.

For the second patch, my reasoning was that the current behavior looks
accidental rather than an intentional extension of the syntax.

The parser comment says:

COLOR_CONFIGURATION ::=3D COLOR | RANGE,...,COLOR | RANGE
RANGE ::=3D COLOR-COLOR

The user guide also describes this as a comma-separated list of colors
or ranges, with ranges written as hyphen-separated inclusive intervals.
I don't see an empty-token production there.

If empty tokens are intended to mean color 0, then I agree the second
patch should be dropped or reworked, and the syntax should be documented
explicitly instead. From the current in-code and user-facing docs,
rejecting them looked more consistent to me.

>
> In any event, you didn't Cc the authors of the patch, without which it
> seems unlikely that they might even notice the submission.

On Cc: I followed the submission workflow from the Xen Project
documentation, including the add_maintainers.pl.
The documentation says that, when following those steps, the scripts
will add the correct people automatically.

Apparently that was not sufficient in this case. I will add the
original authors explicitly if there is a next posting.

Best regards,
Mykola

