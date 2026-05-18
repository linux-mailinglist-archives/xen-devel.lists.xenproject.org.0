Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIhvNqa9Cmrb7AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 09:20:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F005675C2
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 09:20:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311574.1581688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOsGU-0006B3-9P; Mon, 18 May 2026 07:19:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311574.1581688; Mon, 18 May 2026 07:19:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOsGU-00068m-6Z; Mon, 18 May 2026 07:19:50 +0000
Received: by outflank-mailman (input) for mailman id 1311574;
 Mon, 18 May 2026 07:19:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wOsGT-00068g-5H
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 07:19:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOsGS-00EqMo-Ha
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 09:19:48 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0abd8e-e002-0a2a0a5209dd-0a2a450bde56-16
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 09:19:48 +0200
Received: from [209.85.208.178] (helo=mail-lj1-f178.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0abd94-212f-0a2a450b0019-d155d0b2d939-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 09:19:48 +0200
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-38ea6a5a0b3so16696081fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 00:19:48 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1779088788; cv=none;
        d=google.com; s=arc-20240605;
        b=O4o7VuV0V21mN/Hjk8pFAADZGlwuarf46hm2wLWEw/wx/lkXdbWG7fMj74ONUS9Bh1
         X6iG1dEq1IOaQmmBVX6AoTB1WAB+pYKBZrW30GrYwe7m4AWygutej9DlNkqz5CtoTq1d
         wHxJm5VhgXx6/N6IDbYzUsTcXFXZ8KMfN5Vq0iQO1w7lBdng/dUyMXmI3uEX6ZXwb6hW
         4uN0AEVUljDwmWoEDXnZwyEjz3svs/fiN2KFgIVbQOIqEt07nhcrrWpztMWjRGeZok/n
         QOuRoS6ujsyZqjR/+wRpH20clz4jKzFebXBwFRBMXl/5zGB7Z9rxypfXAZLCSoiN6e4m
         Enyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XqKh2H5OQ1Dg1L1lKIwZJ6zaaT9V+e6s0GtG2jzMM94=;
        fh=QoAKTk/9VDlNwcmDZ1nH53LgYL0xRRdphyzLOnBU0Ws=;
        b=e9spgFs79SS425PkTSb9OzlYXDjAWH+3HNlrBfYZEkLDl3aWpzTlgT92FoW8YOfzuM
         JrL7wU8oKD5yLdG2SJ275FGfAtX7h5t8as6jpT748HFSp3fJGPr+paJaG8j+tx6HD6cl
         cIeFXOQ6fnmFtMdWdzJZ5ppr/nCMdsW6pUo+ekc4V4k1qFXQHobArsKV4peJP6nMCTgk
         k4IWk0QjiQMxhkK53mzqHxIuQi+ws+dyeE8u+xBE1Y5d4+dBIGWUvPJgpmvVV7Vbq0YY
         Xx+X+4W7Sl3AgknnEHQIfsx5GoWrUpXXfMbTHFYqKLNK57FPVLCissKKqw07HoT1JfVh
         ap+w==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779088788; x=1779693588; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqKh2H5OQ1Dg1L1lKIwZJ6zaaT9V+e6s0GtG2jzMM94=;
        b=SGJVBFkPrvJyOEK0k4BKaBMxEQWG494D7IgbTuBDttjqs1yJDwokh+NJLluFXWPaEd
         v4UwU3lGlyXX36++vqxwBrFkhVdqL7Oiv/0UAW/oKjWZHkpq6xqedBxRyCQPe22a0Nyl
         94d825ZcMZOWHw9K0WeivJqJ0DO6F1uz3c+l5f5v18cN6KrGcyVLE/rZ+TBxdVHZ8XRT
         t5wlO2QVD40/E93J5KVV23I/9W/H/SFd345szr8UBvxCasra9OtSkPKho9fzZJuAdNJp
         /cFlMoHfO49WLuVLYRxQ/jfB+Bulc0GWtc5pUb7hwQO9l3wooAJtIoHi8KRCBM+Fx9Jh
         t67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779088788; x=1779693588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XqKh2H5OQ1Dg1L1lKIwZJ6zaaT9V+e6s0GtG2jzMM94=;
        b=jz1q1T+ny+gmcxH1yT/9jPc+u2F1ZeBVsc6Hxh78vkpl+1n4taW/aHWh51dA/GiUbS
         cp1xRveOYiWqp1JoWs4Lbru2slRBx9F9qc0V/3GkL9/1LI3vm5jgHVRdFNsT3HjMk+9S
         ycoHYiWNZLijchxw+IN1tpjNvCG6EEctnOQJnszlZ1CsNM62DqT5L0+clsGdgx2tIU7w
         LrQ2fQLDUPmdu1Uj20TRdkg0mmZvNDUQShLAOMDENdiAxkR0Z88/Cc2d1g2AiyxgjvJW
         1+vRA0I75Q+GOMLFbCv6SwldYBUIbG087UEI8XrPRNPmcaFmp4aJwnjD7bJ1pRz98Tky
         h2Hg==
X-Forwarded-Encrypted: i=1; AFNElJ8tQRtwYqYcAoc5Aqn+ziH5UqFtfJ70IkntN488cX9nH8HgvzVH9aI2jBcYmcPUmxDCA7/skuCwGHc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz26UeChrpf7W6nr4KB+QQF9aYILpyZaWVmhMS/tLWVTux+wY29
	eAacEff0f0wnrc5azJxpkU53MJVj9SzHLn02LTcjnr4eiRXmUYFeLNjtydwWY1aiO2bllN3VjIi
	+HZU0IjOEKexfIWbdlFPRwZyWu0RQaYA=
X-Gm-Gg: Acq92OFVW0bdFHFQa2Ro85bGwgteR25JtqVjuihkSZ8LGKs9kxkaUofmSHwfRrrf8t1
	7lCj3FgjqvijUohaTN31j5F2RZrByiVQ/IeNGxZL3mNSyp/UVVn8Fb1y1LnDjOVPO12k/yVczVk
	KLC2fbUrGIViSbOf5AXvbX/hZ97Qln5mNDoDmayTuTn5EjC5jpjtXvwzwL0I29CmF2ENrPrZva3
	98RKq1oZU/I0EAIzaGoHHtfyPA5I2KYyGCQQdAIlRAfB/NEKWGDQRJWhKOAeOE4lnyu6DFgcnqa
	ZSIR
X-Received: by 2002:a2e:8812:0:b0:393:e50b:6b2a with SMTP id
 38308e7fff4ca-39561c360d6mr31427231fa.11.1779088787501; Mon, 18 May 2026
 00:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1778925998.git.mykola_kvach@epam.com> <d9db51c5-97a1-4131-8575-dca1ae2cf52c@suse.com>
 <CAGeoDV9DitsH629pWGe+X=0VM+oi1BfSgWMxE+t32CCR5gMgtw@mail.gmail.com>
 <a5d1dc32-c505-4f42-8d48-ba2710d7b831@suse.com> <CAGeoDV_8BNRPy9tbe1ArgR4Lj8YHZPwo_7D59oJJSiSqNQFNFQ@mail.gmail.com>
 <22edbeb3-4b0b-48d4-9873-76bfa31b970d@suse.com>
In-Reply-To: <22edbeb3-4b0b-48d4-9873-76bfa31b970d@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 18 May 2026 10:19:36 +0300
X-Gm-Features: AVHnY4Lv3pVlfuck1gY7G0IBtYWJgoNUyOjGgPF-y08xcl4h2KigeBkfm2LufmE
Message-ID: <CAGeoDV8ucuZ-FrYe6j_ke4cK33z27=rNZ-9oZzb0R9PxqDJBqQ@mail.gmail.com>
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
X-purgate-ID: tlsNG-42698a/1779088788-13175F3B-01CE4FEC/0/0
X-purgate-type: clean
X-purgate-size: 4131
X-Rspamd-Queue-Id: 40F005675C2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	NEURAL_HAM(-0.00)[-0.950];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On Mon, May 18, 2026 at 10:06=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 18.05.2026 09:01, Mykola Kvach wrote:
> > On Mon, May 18, 2026 at 9:52=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >> On 18.05.2026 08:42, Mykola Kvach wrote:
> >>> On Mon, May 18, 2026 at 9:20=E2=80=AFAM Jan Beulich <jbeulich@suse.co=
m> wrote:
> >>>> On 16.05.2026 17:03, Mykola Kvach wrote:
> >>>>> This small series fixes two issues in parse_color_config().
> >>>>>
> >>>>> The first patch makes parse failures leave the caller-visible color=
 count
> >>>>> at zero.  This prevents a rejected command-line value from leaving =
a
> >>>>> partially parsed configuration behind for later init paths to consu=
me.
> >>>>>
> >>>>> The second patch rejects empty color tokens.  Previously, delimiter=
s in
> >>>>> places where a color value was expected could be interpreted as col=
or 0,
> >>>>> because simple_strtoul() returns zero without advancing the input p=
ointer.
> >>>>> The patch checks that each parsed color value consumed input.  It a=
lso
> >>>>> adds the missing newline to the DT color parsing error message.
> >>>>>
> >>>>> Mykola Kvach (2):
> >>>>>   xen/common: llc-coloring: clear color count on parse failure
> >>>>>   xen/common: llc-coloring: reject empty color tokens
> >>>>
> >>>> For both of these, a question which isn't even considered in the rea=
soning
> >>>> is whether the present behavior may be intentional. Especially for t=
he 2nd
> >>>> ISTR Stefano(?) not so long ago indicating that the behavior is inde=
ed
> >>>> intended to be this way. That may have been somewhere on Matrix rath=
er than
> >>>> on the list, though.
> >>>
> >>> Thank you for pointing this out.
> >>>
> >>> For the first patch, my reasoning was that returning an error while
> >>> leaving a partially parsed caller-visible color count behind looks
> >>> surprising. If the value is rejected, I think later init paths should
> >>> not be able to consume the partially parsed state.
> >>>
> >>> For the second patch, my reasoning was that the current behavior look=
s
> >>> accidental rather than an intentional extension of the syntax.
> >>
> >> That was my impression as well, hence why I had raised the question ba=
ck
> >> then.
> >>
> >>> The parser comment says:
> >>>
> >>> COLOR_CONFIGURATION ::=3D COLOR | RANGE,...,COLOR | RANGE
> >>> RANGE ::=3D COLOR-COLOR
> >>>
> >>> The user guide also describes this as a comma-separated list of color=
s
> >>> or ranges, with ranges written as hyphen-separated inclusive interval=
s.
> >>> I don't see an empty-token production there.
> >>
> >> What you quote is insufficient to determine: COLOR may be allowed to b=
e
> >> <nothing>. Iirc the reasoning went in particular towards a range with
> >> merely the upper end specified being something (halfway) meaningful.
> >
> > Right, I see your point.
> >
> > The grammar does not define COLOR explicitly, so it does not by itself
> > prove that an empty token is invalid. I was implicitly reading COLOR as
> > a numeric color value, partly because all examples seem to use numeric
> > values, but I agree that this is not stated there.
> >
> > If this behavior is intentional, then I agree the second patch should
> > not go in as-is.
>
> Just to mention: Something like "-5" won't be interpreted as "0-5" even
> right now. Instead it's taken as a single color with value -5U, afaict.

I don't think that is what happens with the current parser.

I tested this without the patches from this series:

(XEN) Command line: dom0_mem=3D2048M console=3Ddtuart dtuart=3Dserial0
(XEN) loglvl=3Dall console_timestamps=3Dboot llc-coloring=3Don
(XEN) xen-llc-colors=3D-5
...
(XEN) LLC coloring info:
(XEN) Number of LLC colors supported: 32
(XEN) Xen LLC colors (6): { 0-5 }

So "-5" is currently interpreted as "0-5", not as a single color with
value -5U.

That seems to happen because simple_strtoul() does not consume the
leading '-', so start remains 0 and the parser then takes the range
path.

Best regards,
Mykola

