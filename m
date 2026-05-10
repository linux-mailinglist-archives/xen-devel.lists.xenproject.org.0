Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMwgOtAfAGpiDQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 10 May 2026 08:04:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 556F8502C36
	for <lists+xen-devel@lfdr.de>; Sun, 10 May 2026 08:04:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1305289.1577869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLxFh-00048t-VN; Sun, 10 May 2026 06:02:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1305289.1577869; Sun, 10 May 2026 06:02:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLxFh-00046T-S0; Sun, 10 May 2026 06:02:57 +0000
Received: by outflank-mailman (input) for mailman id 1305289;
 Sun, 10 May 2026 06:02:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wLxFg-00046L-QO
 for xen-devel@lists.xenproject.org; Sun, 10 May 2026 06:02:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLxFf-00B9iF-3A
 for xen-devel@lists.xenproject.org; Sun, 10 May 2026 08:02:55 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a001f87-5cb7-0a2a0a5109dd-0a2a450c9010-18
 for <xen-devel@lists.xenproject.org>; Sun, 10 May 2026 08:02:55 +0200
Received: from [209.85.208.171] (helo=mail-lj1-f171.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a001f8e-62f1-0a2a450c0019-d155d0abb41b-3
 for <xen-devel@lists.xenproject.org>; Sun, 10 May 2026 08:02:54 +0200
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-38a01c80c34so25417961fa.0
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 23:02:54 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1778392974; cv=none;
        d=google.com; s=arc-20240605;
        b=GrAID9Ic83N7uiGV/RNGIpAfq9AVCTf+BG0HxyJtzeZQ475A++9UgsNC4vE5Zmq3ol
         T3x7KjupsF2OezQLc7vjZMG+OGrm3/hC7iUhO48lbcfGXtr7JvzdhYOc3R+cv5J/uT1a
         dOsNo05HwHptBlnDs8kAk1JRDVUHimigdYRTknsCqkh0YOWNZiTv4jVRmicnofKWRlbE
         bKytrfjFwQYcDhnOXV1aRWnKtyBkWJAehjjkIv5hA2EiCkib6E39Ykp0uqYYNywEY3jM
         rsnvuZgzvFoCS4fMbVe55t7vcfVevDWGbXRifALKg1XuHhqNXNJvDNLe+1S/tg3QlggL
         dzrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z6OihLhbY+E3GNfLoo4qiue9hQsmjnzdWfT2BfQ9lhQ=;
        fh=uAzoxIkY79cy0zES8IqO07ArU7DBG3jlr2bg4XRVkR0=;
        b=AjV3iuSZZ87c/O7MX83aZZIY1hBhT5fC/QDVqXu1gePK5BeAo0c/DLVDSaM3Wrf02/
         lSWun1+cm9BS1nwLRfR2iiO6191Ka5miXeietGa3qDPESYyjtwWnsC5UEC0v2nZ+L+TQ
         rnQ8sA0rC7p9zpGI59fMCNbQfEnEG25vNwVkr4EKUziTp/SWEzAZW4HP8B3lnV4n4afR
         HExzbn5pglHNFzDebbGyzfKGZJAAH2+T/us1pmDzQnw5183LyBw5d0TpyS023k4F+CN4
         kc9SFJbAbrj9Pqm9yJ0Kk06FVpNcXHr2VkY76g4sjAPf5h37/mJilD2F87V305S+iB3p
         iqHw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778392974; x=1778997774; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6OihLhbY+E3GNfLoo4qiue9hQsmjnzdWfT2BfQ9lhQ=;
        b=rAmyJNIkpP8kE1aMgze2mOBLQlunpDypTu5yhmxBl/JW0HmcbqE4GEfqZtn3GZQURa
         xKNWoI+CMa4Ng0hqJUJkj/hIAmYW6B0F19ArhM5fZE2vm4RXfg9uxmO3d2t1AIybYOph
         /U9LmtHhFpjNVa4UTPHhuCziPCJtl9evjSwhd0plW3vCyXCAfCdIvD9eIEHg65FjU0P9
         msFBdpvik/GHrHfXYtHIvm6K5+TnHWT4vGahOzEuQH7wZ7ekIUg0GQWxIwxjwUnSjHm6
         D8JAkY8AHBIsj/uCa0GWommCcuiisf+NrDP6/ej5DYd3s1kERfaY9ZBxPH4ryXk/fk7C
         GHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778392974; x=1778997774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z6OihLhbY+E3GNfLoo4qiue9hQsmjnzdWfT2BfQ9lhQ=;
        b=TT+JuqucG7TcZVkc9B2cTWBWHKWN+n+RyVwYwExV6ORqVKMmW2RDOg+2S01bpd5cYV
         I6c5FTy8sCEb2EBuWJnt3GJW1t8FNIBnBhE6ptwT3HlqXvmQ2hhZj2il6VSxPfBfaWBq
         EfhcneUNGNjMV7nNBuiIvzllQTzvIoBX5pzrn70AKvsACIDI7MAZCdCVmveWu9GMOANh
         6my7L9pwZ2dzi0Yt96A6kpVVo/UQNIWOj4peBp64G/cuZ/Puj3E0/mT673LuIT3GPCUk
         ilNzdmYjvNQIjS4ec70V/MuGdjiz69qJL9T1wCrOZYNE7mNiQOqqxbQoi/HN9KV80maK
         qUmA==
X-Gm-Message-State: AOJu0Yx2E1CqB1LPx1sjaSHqG3scK5Cjot/wn1CBoOSZychYWyQzJlXA
	lYy/n4pdsAQOBO8nlkUbJjcq9O1DmgbsAx04Negj3dLbd/nTj5qfJB1/Yy5IfMuxZXX9/e89Y77
	Y9MaVsca18GDbGxBFqxjDNZv6jCYH/+0=
X-Gm-Gg: Acq92OHSS8lEGRO8JXgZZ6C/psvFWdDFwDAjzY0U+j3HZOvisrJ9Gzj4bipSLppIwrn
	kUzsnHQK7rzuXOPIl6n+26EC/pu4H0ddV2M/lNwO1VfvDh+H4BLxDwY7qeHSFwxcPx2xrYLm4bG
	9uWphRG1p6UHCVyW3gFGQj04oAQTuX4cEBtcEFscKS5N4eoTXJzf7OPR4pZFpbsigVmoI0J5bR4
	cpZxrCYDHGe3G6UnMxYvKssjjA4vovwbPlZ3R1gjlbT0tKV/X4yXRpg7nLidDpYYk4HcAoPcrOp
	G/GlKA==
X-Received: by 2002:a05:651c:41c8:b0:394:4e7:9805 with SMTP id
 38308e7fff4ca-394081312f7mr13755891fa.19.1778392973629; Sat, 09 May 2026
 23:02:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1775125380.git.mykola_kvach@epam.com> <5e1951e1c17037e020de9c0eecb5fba94edcd9dd.1775125380.git.mykola_kvach@epam.com>
 <EB3F884F-FCD6-4AE7-84FA-79ABF31EA88E@arm.com> <CAGeoDV80QHdesYQF-J4fg7wYQ6RLNg6u27aQhj4F+JoM4hU3uQ@mail.gmail.com>
 <CF8E0EB2-3048-4B04-B763-AE5EF1909416@arm.com>
In-Reply-To: <CF8E0EB2-3048-4B04-B763-AE5EF1909416@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Sun, 10 May 2026 09:02:42 +0300
X-Gm-Features: AVHnY4Liw9b4vVk0zuGrKmULc20ZcK-O_7r4lptAmDphN-WnqIpD3Sa7zwS3D0Y
Message-ID: <CAGeoDV_SqVtcAZemSx1Ap0R6JqnbAxoLYCctPEU3DkcuQC-A1g@mail.gmail.com>
Subject: Re: [PATCH v8 02/13] xen/arm: gic-v2: Implement GIC suspend/resume functions
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d25034/1778392974-E0D63CF5-B8D4D1B9/0/0
X-purgate-type: clean
X-purgate-size: 6276
X-Rspamd-Queue-Id: 556F8502C36
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On Fri, May 8, 2026 at 1:57=E2=80=AFPM Luca Fancellu <Luca.Fancellu@arm.com=
> wrote:
>
> Hi Mykola,
>
> >
> >>
> >>> +        }
> >>> +
> >>> +        off =3D i * sizeof(irqs->icfgr);
> >>> +        for ( j =3D 0; j < ARRAY_SIZE(irqs->icfgr); j++ )
> >>> +            writel_gicd(irqs->icfgr[j], GICD_ICFGR + off + j * 4);
> >>> +    }
> >>> +
> >>> +    /* Make sure all registers are restored and enable distributor *=
/
> >>> +    writel_gicd(gic_ctx.dist.ctlr, GICD_CTLR);
> >>> +
> >>> +    /* Restore GIC CPU interface configuration */
> >>> +    writel_gicc(gic_ctx.cpu.pmr, GICC_PMR);
> >>> +    writel_gicc(gic_ctx.cpu.bpr, GICC_BPR);
> >>> +
> >>> +    /* Enable GIC CPU interface */
> >>> +    writel_gicc(gic_ctx.cpu.ctlr, GICC_CTLR);
> >>> +}
> >>> +
> >>
> >> I also see that we don=E2=80=99t save pending SGIs state (by GICD_CPEN=
DSGIRn/GICD_SPENDSGIRn) or Active Priorities registers
> >> state (GICC_APRn/GICC_NSAPRn [latter if security extension are there])=
 as written in [1] =E2=80=9C4.5 Preserving and restoring GIC state=E2=80=9D=
,
> >> was it intentional?
> >
> > Yes, this was intentional.
> >
> > The GICv2 suspend callback is called at a quiescent point in the
> > SYSTEM_SUSPEND path: all domains are already shut down for suspend, gue=
st
> > execution is quiesced, the scheduler is disabled, non-boot CPUs have be=
en
> > offlined, and CPU0 enters gic_suspend() with local interrupts disabled.
> >
> > For SGIs, I don't consider GICD_CPENDSGIRn/GICD_SPENDSGIRn part of the =
saved
> > host GIC context. Xen uses physical SGIs as IPIs, and IPI delivery is a=
n
> > internal synchronization mechanism, not architectural state that should=
 be
> > replayed after SYSTEM_SUSPEND. Guest SGI state is virtual GIC state and=
 is not
> > represented by these physical GICD SGI pending registers.
>
> ack, I would maybe mention in the commit message that we exclude transien=
t IPI/active-priority
> state at the suspend quiescent point.

Ack.

>
> >
> > For GICC_APRn/GICC_NSAPRn, those registers describe active priority sta=
te for
> > interrupts already acknowledged by the CPU interface. The final suspend=
 path is
> > not expected to run with an active physical interrupt context. If those
> > registers were non-zero there, restoring only APR/NSAPR would not make =
the
> > corresponding interrupt handling context valid after resume, and could =
instead
> > leave the CPU interface with stale active priority state.
>
> Ok I understand now, but if we are expecting here GICD_ISACTIVERn zeroed,=
 why are
> we saving/restoring it? Shouldn=E2=80=99t we instead have a runtime check=
 that it=E2=80=99s zero and in case
> it=E2=80=99s not bail out? And in the resume path we would only zero it.
>
> Am I missing something?

Good questions.

Yes, the distinction I should have made clearer is between CPU-interface
active-priority state and distributor active state.

For GICC_APRn/GICC_NSAPRn, I expect the state to be quiesced at this point.
Those registers track active priorities in the CPU interface. Xen reaches
gic_suspend() with local interrupts disabled, and for the guest-routed
interrupt case that can leave a distributor active bit behind, Xen has
already performed the physical EOI, so the CPU-interface priority has been
dropped.
There is no CPU-interface active-priority context that we can meaningfully
replay after resume.

That is different from GICD_ISACTIVERn. In EOImode=3D=3D1, EOIR only drops =
the
priority. The interrupt remains active in the distributor until the separat=
e
deactivation step. For a guest-routed interrupt Xen's GICv2 guest end path =
does
only the physical EOI; deactivation is completed later by the virtual GIC/G=
ICV
path when the guest completes the interrupt.

This is why APR/NSAPR and ISACTIVERn are treated differently. For example:

  1. A physical IRQ routed to a guest is acknowledged by Xen.
  2. The GIC marks the interrupt active in the distributor.
  3. Xen EOIs it, which drops the physical priority.
  4. Xen queues/injects the interrupt to the vGIC.
  5. The guest has not yet run, or the virtual interrupt is not yet deliver=
able
     because of guest PMR/priority/local IRQ masking/vGIC state.
  6. Therefore the guest-side deactivate has not happened yet, and the phys=
ical
     distributor active bit remains set.

There is also a late suspend window in the current Xen path: domains are
suspended and the scheduler is disabled before local IRQs are disabled.
A guest-routed IRQ can therefore be taken by Xen after the guest is already
suspended, but before gic_suspend(). Xen can EOI/priority-drop it and queue
it for the guest, while the guest cannot run and deactivate it before the
GIC state is saved.

This is the same class of issue handled by Linux for GIC EOImode=3D=3D1. Li=
nux
saves/restores the active state because forwarded interrupts can remain act=
ive
while passed to a VM [1].

So I don't think GICD_ISACTIVERn should be treated as "must be zero" unless=
 we
also add an explicit suspend-abort/quiesce policy for in-flight guest
interrupts. That would be a different design: detect non-zero active/in-fli=
ght
state, unwind suspend, thaw domains, let the guest drain/deactivate the
interrupts, and retry later. This series does not implement that policy. Gi=
ven
the current flow, preserving GICD_ISACTIVERn avoids losing architectural
interrupt-controller state across suspend/resume.

I am not opposed to such a policy as a follow-up if we want stricter suspen=
d
quiescence rules, but I think it should be designed explicitly rather than
inferred from the GIC save/restore code.

Best regards,
Mykola

[1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/1447701208-=
18150-5-git-send-email-marc.zyngier@arm.com/

>
> >
> > So I did not add save/restore for GICD_CPENDSGIRn/GICD_SPENDSGIRn or
> > GICC_APRn/GICC_NSAPRn in this patch. I can add a short comment in v9 to=
 make
> > this scope explicit.
> >
> > Please let me know if you think there is a suspend/resume path where th=
is
> > state still needs to be preserved.
> >
> > Best regards,
> > Mykola
>
> Cheers,
> Luca
>

