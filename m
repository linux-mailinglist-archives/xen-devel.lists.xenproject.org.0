Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCZ2EqjqzGk/XwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 11:51:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4655378037
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 11:51:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270079.1558888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7sEE-0003EZ-G6; Wed, 01 Apr 2026 09:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270079.1558888; Wed, 01 Apr 2026 09:51:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7sEE-0003Ce-DR; Wed, 01 Apr 2026 09:51:14 +0000
Received: by outflank-mailman (input) for mailman id 1270079;
 Wed, 01 Apr 2026 09:51:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w7sED-0003CY-F8
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 09:51:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7sEC-00Amil-Qx
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 11:51:12 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69ccea60-e002-0a2a0a5209dd-0a2a4507941a-44
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 11:51:12 +0200
Received: from [209.85.208.46] (helo=mail-ed1-f46.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69ccea90-ba2d-0a2a45070019-d155d02eb144-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 11:51:12 +0200
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-66dd27d4465so898055a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 02:51:12 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1775037072; cv=none;
        d=google.com; s=arc-20240605;
        b=UuYzPTX/khGzL7pbdHBn+EPpH5f/H4ZYf/PW+sLHQ9GVFl24GHPpv4lqClBZMvA8GV
         8lR3u9ePtlJ4xXBRinkGopslGjahldpNq+7kOCYJgQCXit35q+c4wj/ae4G1D9EkmtfP
         aNdAxG+yJOJ9ZfzljVbm3sjha/i3j51OH3SUEonUbG4neYpzb0nSkojsmArv9HjIx+4+
         gxpMLGlBF9ZiKnhgpSOA9OFT5/PV3AFhcAATttLwhsObzZhctzXnZFkCTGMcL/Uw1uR1
         cTG9S71WRz4HEbC9AZ9f24/2M6UB99SjqP6BDMZ86e9xR84ZNnWE450f/BX3ygZhuKml
         qL/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qqOxVJSOhlw5ozKDEA2l/kprJZUMQ9y432cAxgYgfp8=;
        fh=bL0eezStd3aXRSa1QAyu7N6zVeBx5OkniALhDBsoIuk=;
        b=eqY84/OmmyjhUVx0S3wv2bR5fWb1IN6eioEs7hibtSkZU/fkauoI/0Rp63t0gDF6P1
         ShhzNIP6GgHHX2+2f8Orv2YMxxsjJDDmpaQYDGaLJr49L1VOCZpx9AUAS933kW4RYdN5
         W+eHM4ynYUCbAvmGqXaaRKD+eS6zeUC4EUlzntQ3WCJtGrMOxTCd3T//CTO050G4SHDH
         mkuTU4VG4JpJdbwShol7ZLon0HFntt2dc0VYNMD02QqAbrpWaK1wGOLftzsgHzgVC95t
         zWr4IV33HKsJIVR3RgOkkvVJwjEDh0v4YlZxfEuwc44P+m++U9S60OzRwLVY5VlvRJ9I
         5bnA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775037072; x=1775641872; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqOxVJSOhlw5ozKDEA2l/kprJZUMQ9y432cAxgYgfp8=;
        b=WuyFue/JGFOozuNHoi7WRKsH96fOfLRmXMMUmSTc6Py+qRyA6WnDoN4Db8U9RSPJFS
         85BU0uQH0OJ+0UL9P8zGysmfn2TuO1d7vBQHTdFMJkAlaBDM6dNRQ85uqaFcqticbQeA
         2zX7rarXRzN6iYSh5icl58pZQYNeBiyoghiI2YoUkNSMg6HWPGKrK/q5YRMZoVrV7Ac1
         OgAt4M4eTXxGAM5oEyPhby/Uq1VXwFklMYRGog3gq3zOb8E2W3772zMvMuTBl5guDimr
         5W3jfEVplPQcxTH0mMOlaFRPAKL27i4JK2GtZY3ES6jODqYsA/2cGXVyQwSovHldyEiS
         xNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775037072; x=1775641872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qqOxVJSOhlw5ozKDEA2l/kprJZUMQ9y432cAxgYgfp8=;
        b=RbgitCUV75ECvshiBi+TuftSgk25xEr57OsHSvJHjIu5HTOCPu4khOY4AaOhHHDwfe
         r3XHkooqe4D+NviNm0lOdqLWj+vX6292UDfq0GJWekUHieIB7TnQ1hyY9cpFTgtjqQB7
         phlaaMSR4N7Tmsons8jsUNIKg+3tdP9LjifUBE9O3yaqIFdJmtqGz51qmzM3/g466TL3
         BVN9B9+BPc1mDKLtoPJcNbwVhZcdnyt7cnwGZEmDgvI5fgpAN4pZjsEkc9drVwAzBeYR
         IR1JCLRhGA3snFoTOnKBxVEoivOmMTxjRPTgYjXT2JXBFcesA8n9laHViyu+l/SurpFs
         v9Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVn3jUDfcgCpAGMCAZJESJ2aECbNMESdVN46G79E5bUyF5Zf6xWtu0jLD+kGU0bV/wzFv8SNtI1ZSM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQJjQwMNP9QqxlGRrPK8RffpP/4NE4uWuCWHc4lc6wZwrOJJLR
	Brmnu1+dExC6yt2kcDvEwJ4xFrw88z27i/35JNgMBgZboJ6MUauz7tWT0nd8HN5FxJiUZ06MG6j
	vFbII+501L/bRSgwAIx3kZU/ODfMBiXU=
X-Gm-Gg: ATEYQzwjsdkR1kymKJAyl7lIIe2SFtLDG+XiNolnuvlPYmfw6rtVNIwC0Xl/VcT9Ach
	Z/tXOulJwpduOPDah2dmszNsISgWMErS3fHu1mIhMIDFVynMs3sE7BpdGOOS0oUjdgKYO7J1cSD
	Z5KNKOMPKSbOSGcBnDumso+S9dD0Oj3Aw2P0IDfGhs5eX8DE/MbFFwqFAGm8xzQJP0PfOQ9C5ZI
	v5Tc6dFSegWhXUFQc9d8693Nx2MOFPSa5Og29XMstIDXSH8SgUabJpTKSbrlHbQHKUYbliHcEX4
	GMkN
X-Received: by 2002:a05:6402:528a:b0:66b:f737:95f4 with SMTP id
 4fb4d7f45d1cf-66db00b3e35mr1585165a12.7.1775037071866; Wed, 01 Apr 2026
 02:51:11 -0700 (PDT)
MIME-Version: 1.0
References: <e1d18d55557ebe232fd62174f186b1cf228e48e5.1774981189.git.mykola_kvach@epam.com>
 <dc5550d7-5a2d-4ca1-85de-5a17c24aeac4@suse.com> <CAGeoDV-ffZsOW+Cu0-oPA1obBOv_1nWU8_PAdaqaoy6=YUHGig@mail.gmail.com>
 <5b16e00e-9a4d-4a18-8a5e-dde10b42a043@suse.com> <CAGeoDV_Cdpa6beFemKaVcCguwmo95x0g0rsRYbS1x5dAUxFPLQ@mail.gmail.com>
 <5fb9b5ee-ee71-49ec-b545-62c8ec27fc15@suse.com>
In-Reply-To: <5fb9b5ee-ee71-49ec-b545-62c8ec27fc15@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 1 Apr 2026 12:51:00 +0300
X-Gm-Features: AQROBzB70yO3YCeggq1-mH2mrx_MlMC40IhOrPlmmwIj0lwROslqAZfropiRQ-0
Message-ID: <CAGeoDV-HCKUXZ-CZBASLik=xkR02w-n=5+HVsYGwfDf4zD-3zA@mail.gmail.com>
Subject: Re: [PATCH v3] xen/arm: vpsci: ignore upper 32 bits for SMC32 PSCI arguments
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ef75cf/1775037072-1079541E-8B15F73D/0/0
X-purgate-type: clean
X-purgate-size: 6707
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,xen.org:email,arm.com:email,suse.com:email,epam.com:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: A4655378037
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 1, 2026 at 12:22=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 01.04.2026 10:49, Mykola Kvach wrote:
> > On Wed, Apr 1, 2026 at 11:14=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >> On 01.04.2026 09:13, Mykola Kvach wrote:
> >>> On Wed, Apr 1, 2026 at 9:29=E2=80=AFAM Jan Beulich <jbeulich@suse.com=
> wrote:
> >>>> On 31.03.2026 20:31, Mykola Kvach wrote:
> >>>>> From: Mykola Kvach <mykola_kvach@epam.com>
> >>>>>
> >>>>> SMCCC DEN0028G, section 3.1, states that for AArch64 SMC/HVC calls
> >>>>> using Wn, only the least significant 32 bits are significant and th=
e
> >>>>> upper 32 bits must be ignored by the implementation.
> >>>>>
> >>>>> So for SMC32 PSCI calls, Xen must not treat non-zero upper bits in =
the
> >>>>> argument registers as an error. Instead, they should be discarded w=
hen
> >>>>> decoding the arguments.
> >>>>>
> >>>>> Arm ARM DDI 0487J.a (D1-5406) also notes that the upper 32 bits may=
 be
> >>>>> implementation defined when entering from AArch32. Xen zeros them o=
n
> >>>>> entry, but that guarantee is only relevant for 32-bit domains.
> >>>>>
> >>>>> Update PSCI v0.2+ CPU_ON, CPU_SUSPEND, AFFINITY_INFO and SYSTEM_SUS=
PEND
> >>>>> to read SMC32 arguments via PSCI_ARG32(), while keeping the SMC64
> >>>>> handling unchanged.
> >>>>>
> >>>>> No functional change is intended for PSCI 0.1.
> >>>>>
> >>>>> Suggested-by: Julien Grall <julien@xen.org>
> >>>>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> >>>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >>>>
> >>>> I thought I might as well include this in my next commit sweep, but =
isn't
> >>>> this R-b being invalidated by ...
> >>>>
> >>>>> ---
> >>>>> v3:
> >>>>>  - use PSCI_ARG_CONV for SYSTEM_SUSPEND
> >>>>
> >>>> ... this change. That's ...
> >>>>
> >>>>> @@ -422,14 +427,8 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *r=
egs, uint32_t fid)
> >>>>>      case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> >>>>>      case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> >>>>>      {
> >>>>> -        register_t epoint =3D PSCI_ARG(regs, 1);
> >>>>> -        register_t cid =3D PSCI_ARG(regs, 2);
> >>>>> -
> >>>>> -        if ( fid =3D=3D PSCI_1_0_FN32_SYSTEM_SUSPEND )
> >>>>> -        {
> >>>>> -            epoint &=3D GENMASK(31, 0);
> >>>>> -            cid &=3D GENMASK(31, 0);
> >>>>> -        }
> >>>>> +        register_t epoint =3D PSCI_ARG_CONV(regs, 1, is_conv_64);
> >>>>> +        register_t cid =3D PSCI_ARG_CONV(regs, 2, is_conv_64);
> >>>>>
> >>>>>          perfc_incr(vpsci_system_suspend);
> >>>>>          PSCI_SET_RESULT(regs, do_psci_1_0_system_suspend(epoint, c=
id));
> >>>>
> >>>> ... this hunk aiui, which is far from merely cosmetic imo. While
> >>>
> >>> Nobody said that the change had to be purely cosmetic in order to kee=
p
> >>> the tag. I understood it differently from the official Xen
> >>> documentation pages.
> >>>
> >>>> behavior looks to remain the same for PSCI_1_0_FN32_SYSTEM_SUSPEND, =
it
> >>>
> >>> Exactly. If the changes are not substantial, I do not see a reason to
> >>> drop the tag ...
> >>>
> >>>> clearly changes for PSCI_1_0_FN64_SYSTEM_SUSPEND. That may be intend=
ed
> >>>> and for the better, but the change clearly wasn't reviewed by Bertra=
nd,
> >>>> nor - when offering the R-b - did he ask for this extra change.
> >>>
> >>> ... and this is also how I understood the Xen patch submission
> >>> guidelines [1], which say:
> >>>
> >>> "Note that if there are several revisions of a patch, you ought to
> >>> copy tags that have accumulated during the review. For example, if
> >>> person A and person B added a Reviewed-by: tag to v1 of your patch,
> >>> include it into v2 of your patch. If you make substantial changes
> >>> after certain tags were already applied, you will want to consider
> >>> which ones are no longer applicable (and may require re-providing)."
> >>>
> >>> So my understanding was that tags should normally be kept across
> >>> revisions, unless the changes are substantial enough to make them no
> >>> longer applicable.
> >>
> >> Maybe our understanding of "substantial" differs. To me that's anythin=
g
> >> changing functionality. Style adjustments, typo corrections, and alike
> >> generally aren't substantial (albeit even then there may be exceptions=
).
> >
> > Thanks for clarifying what you consider substantial.
> >
> > Even under that interpretation, I do not see a functionality change
> > here. "Refactoring" seems like the more accurate term in this case:
> > the internal form changes, but the intended external behavior does
> > not.
> >
> > It may be that we are using "functional change" in slightly different
> > senses here.
> >
> > For v3, the switch to PSCI_ARG_CONV() in SYSTEM_SUSPEND was meant to
> > make this case consistent with the helper-based argument decoding used
> > elsewhere, not to change behavior.
> >
> > In particular, I do not see a functional change for
> > PSCI_1_0_FN64_SYSTEM_SUSPEND: v2 used PSCI_ARG(regs, 1/2), and in v3
> > PSCI_ARG_CONV(regs, 1/2, is_conv_64) should resolve to the same thing
> > when is_conv_64 is true.
>
> Isn't the whole point of the patch to alter behavior when is_conv_64 is
> false? For that case PSCI_1_0_FN64_SYSTEM_SUSPEND behavior looks to
> change in v3, when it didn't in v2. Whereas for
> PSCI_1_0_FN32_SYSTEM_SUSPEND the v3 change indeed only eliminates open-
> coding, which one may or may not regard as "substantial".

I think the point I was trying to make is slightly narrower: in this
code path, is_conv_64 is derived directly from fid via
smccc_is_conv_64(fid) before the switch (fid).

So for PSCI_1_0_FN64_SYSTEM_SUSPEND, I do not see how
is_conv_64 =3D=3D false could arise here: if we are in the FN64 case,
the function ID already encodes the 64-bit convention.

Conversely, if is_conv_64 is false here, then this cannot be the
FN64 case.

On that basis, I do not see a behavioral change for the FN64
SYSTEM_SUSPEND case in v3.


Best regards,
Mykola

>
> Personally I'm taking what's written in a pretty strict sense: If in
> doubt, drop tags which may no longer cover all changes they would
> apply to. (This is, in my interpretation, generally less of a problem
> for A-b, as that only conveys "this kind of change is okay to make",
> without covering much of the details. In the case here retaining A-b
> would probably have been acceptable, albeit there's still room for
> interpretation. For example, if an A-b was offered based on somebody
> else's R-b, then likely the A-b would need dropping if the R-b is
> dropped.)
>
> Jan

