Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFUYAcug/WmwgQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 10:37:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E914F3CBA
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 10:37:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303296.1576756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLGhy-0002BX-5z; Fri, 08 May 2026 08:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303296.1576756; Fri, 08 May 2026 08:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLGhy-00028v-30; Fri, 08 May 2026 08:37:18 +0000
Received: by outflank-mailman (input) for mailman id 1303296;
 Fri, 08 May 2026 08:37:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wLGhw-000288-HW
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 08:37:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLGhv-00Fa4Y-Jk
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 10:37:15 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69fda0b8-e002-0a2a0a5209dd-0a2a4507db7a-22
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 10:37:15 +0200
Received: from [209.85.167.50] (helo=mail-lf1-f50.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69fda0bb-229c-0a2a45070019-d155a732f177-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 10:37:15 +0200
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5a858881ad2so1783885e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 01:37:15 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1778229435; cv=none;
        d=google.com; s=arc-20240605;
        b=XEufQMKJj34/59AFkU1u6f7520oyhSl4DYJb94SS5Zp7G/0cWggtzNRuSdRrQdmB44
         BZDfkS1yd0+2ruvTDKnWF+57tJuTHeyASY4Vow3pLAEe68rc0glySwz77tl71CSkTS8W
         0d00IC5nu3ipM5vuqUkGo3QN+dsAMUSDwM3+KD8DendRGYRiI2ahjMz3+9Fc59DWUasa
         LOB+gIXBddDsOoXyOhANdttsIn36yfYXcxQIAi+5qjGDfiTvz6HGfpq5Fmz6ESaJjgbC
         2hI6C2QdvQqRqRVVJT5kxIy9zh/tCA11V7Ja01HX6SwUqe62IEa/QXEvQuyxwd+cCqqd
         oQiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wpuQRbOQwrvqrL5TV1TLO/gtVPLeB51qcMTr2o4owZ8=;
        fh=+B/FOpuBiPJXqAXn9GQiahGpdb0p7rrV8Rb8Q45Y2iA=;
        b=Kx9dwFOmbQDSYUmbmyeIcBh4anQDYQtGEDDMHZ3OVLmVXfZfTkJy0DEQ+HRsP4CUSU
         BSoKa4Z0xFhlGt7rblpfFRA+7MW/k6s4Nyj2miGggNypepFA1tNr7zsV4mLMJSPCtZeM
         7HCvVCuZZwNrptj9YFtD3GzLVrl0ElfhbfqcRDmnmWXdcCtuN1A/A4jot62MsEciRFpw
         WpciZURj537Jaf5r2pJ4LBPgG2nQ4revfoMoyWSl4MzLY42F2woNeIR/0OzbmB8fNTHb
         55pJTFwTXWDZN6io5RrWimZKHxUzXrWNk6LT9r+Q2kPezF1Yin1qztD2DVzFOHP9b+td
         x51w==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778229435; x=1778834235; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpuQRbOQwrvqrL5TV1TLO/gtVPLeB51qcMTr2o4owZ8=;
        b=TYawcWIySkAfrE0YkSiA1Sz65PTfliPPw2mf2agR3C7FOps51ypXqnkA5iBsjUrC33
         3w2L66OjE9mOKzCBolLkRc1ok0sh8aYT/G5Sv7gSwuG4ezFS3NbnuMKcWg/0I4IAvM9F
         KaC+u/5Kw2FYj8UxWdF/8LBL6HjDyvdT3yynH+nkHVoBrHEA/EZ3wzZSAjtDuGdPVbuQ
         epQZvxh9FGAsp4KsyOC1OR5PDaabzncKjkbrqOISVeQ3W/3H26FJ8pkNRvWj7eT+yMUL
         UEKnQTvYPbKVlKJgv/dc+PELWjC5WTmH2d1T033WwIe4DWrbe+xW1HSeWR2P5TZhD4CH
         JOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778229435; x=1778834235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wpuQRbOQwrvqrL5TV1TLO/gtVPLeB51qcMTr2o4owZ8=;
        b=W2MkrO0xvujygMPVRAqtg8LuiZqlReraHh5pLA+6eb2TLDs9EnT3qB2QwbFByXzk9C
         RAs7avzy0stDgZoMYOZ/D5Yzoyy40QuBIrIHEnmPYZGiSybi6FDlsU0tg5X8u85VEcYe
         41nTdR6G/U73AiTlANw4WWTRt+1xdngwkFsJFC8ag825nScKZd6oUx5Asfkd/kmiI2WX
         1kc2D+9gHq0A7r06yCrb6K7Jdc7/zZTpq4QqobjiUvc8C+8vnJ8JIW8qiBOyCVhTkLkQ
         jdoNq7be/3Cj725y7tLQNOX0cAW8dqXTBABOfylUDa9FrLM0IXGyGV3kGHB4oVlp+aOZ
         k0JA==
X-Forwarded-Encrypted: i=1; AFNElJ/EBRAucUyqaqehdcN8udDChjQT9IX7zVycTwRSb9hYSISWpTxOSIhTNS/NPooWUjoVEn6Cu34ks0o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyFhhtQuPoiwvqKSaXEV+CHMwpGPn0Pq/L+OQiG9LzRN1lGLb2R
	RH9S0taAg9FU6lU2MM72oLOefFIuQiiSJO9szjzRxjKX+Va4WyDWoCH7SxlBvD6Qv8h7H2oVcJN
	ddBQOfco5sshXgabTHSHygBqZ27gJSc0=
X-Gm-Gg: Acq92OFTHrM2SV3i0Ov/S9+WeR4sPp9M6kg7FoNkozIdCsu0UfeCRP/aDP7KptvFjkg
	gti/xheIWO80kNehWnxxjKsz7R5uFqaXoTsH58hXx0ZJSH816ryhr84MGJdXsUSFqll4xOMqiOT
	C1dH1Qka3zuaIQJBpRmHQkQ/p1uzIpO7H5S0xSmXPbrLXG0tLk180HKKuFZf4oZYcaTriaOpt0z
	2KG8wKgwwsCGKCFMgHWHx2BbGypjj+F7YBvyrvsrclOSc5JjbCGN0exGhSRnqqakhb2QWIQBIzz
	MQCn7w==
X-Received: by 2002:a05:6512:33ca:b0:5a8:8222:7fd2 with SMTP id
 2adb3069b0e04-5a887add1f1mr3528722e87.2.1778229434408; Fri, 08 May 2026
 01:37:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1775125380.git.mykola_kvach@epam.com> <9b0f8922cd33df2b8e8038d639c1b8d8d73ce401.1775125380.git.mykola_kvach@epam.com>
 <4977CF18-39CC-4CC0-936A-890BAE5E8615@arm.com> <CAGeoDV8WkRGubF0qEXd4+PsXuabz3914G7bTYxTbaxZ2DsnY6w@mail.gmail.com>
 <87lddusvpy.fsf@epam.com>
In-Reply-To: <87lddusvpy.fsf@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 8 May 2026 11:37:02 +0300
X-Gm-Features: AVHnY4JYt4-0UmJ7JSJaWoyZcgjN2R8NDLx-IG2Pt8MeXk4pyFfoI5_ZvDR8HQg
Message-ID: <CAGeoDV_QcpgSpzHjn43EaaG7Owqes8+Zj-krOrKSJ3oCSpE9YQ@mail.gmail.com>
Subject: Re: [PATCH v8 13/13] xen/arm: Add support for system suspend
 triggered by hardware domain
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <Mykola_Kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Rahul Singh <Rahul.Singh@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ef75cf/1778229435-09B68C48-A14C093E/0/0
X-purgate-type: clean
X-purgate-size: 11142
X-Rspamd-Queue-Id: 63E914F3CBA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mail.gmail.com:mid,system_suspend_tasklet.data:url];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:Volodymyr_Babchuk@epam.com,m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:Mykola_Kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:Rahul.Singh@arm.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Hi Volodymyr,

Thank you for the feedback.

On Fri, May 8, 2026 at 1:25=E2=80=AFAM Volodymyr Babchuk
<Volodymyr_Babchuk@epam.com> wrote:
>
> Hi Mykola,
>
> Mykola Kvach <xakep.amatop@gmail.com> writes:
>
> [...]
>
> >> > +    status =3D can_system_suspend();
> >> > +    if ( status )
> >> > +    {
> >> > +        system_state =3D SYS_STATE_resume;
> >> > +        goto resume_scheduler;
> >>
> >> When we have an error and we get the resume_scheduler path, we apply b=
ack the
> >> context of the guest saved previously in do_psci_1_0_system_suspend(),=
 so am I
> >> correct saying the guest won=E2=80=99t get any PSCI error back and we =
resume the guest
> >> from the guest resume entrypoint?
> >>
> >> In case, should we have a different path that returns a PSCI error (PS=
CI_*) into the guest
> >> x0, and skips the context restore?
> >
> > You are right about the current control flow: once the virtual
> > SYSTEM_SUSPEND request has been accepted and the domain has been parked=
, a
> > later failure in the Xen-wide suspend path resumes the domain through t=
he normal
> > domain resume path, rather than returning a PSCI error from the origina=
l call.
> >
> > This is intentional in the current design. The virtual PSCI SYSTEM_SUSP=
END
> > path parks the domain and saves its resume context. The actual Xen-wide=
 host
> > suspend is a separate step that is attempted only after all domains are
> > suspended.
> >
> > So a failure in the later Xen-wide suspend step is treated as an abort =
of the
> > host suspend attempt after the domain suspend was already accepted. The=
 domain
> > is then resumed through the existing domain resume path, similarly to t=
he
> > toolstack/xl suspend-resume flow, rather than by re-entering the guest =
PSCI
> > call path and modifying the saved vCPU context again.
> >
> > I agree this design is not obvious from the patch. I will clarify the c=
ommit
> > message and comments. If you or the maintainers think that failures bef=
ore the
> > physical SYSTEM_SUSPEND call succeeds should be reported back through t=
he
> > original virtual PSCI call, then this would require a different flow. I=
 was
> > trying to avoid that extra complexity in this series.
>
> I think that there is no sense to reporting an error back to guest. PSCI
> allows resume at any stage, so it is acceptable to have such brief "suspe=
nd"
>
> >
> >>
> >> > +    }
> >> > +
> >> > +    /*
> >> > +     * Non-boot CPUs have to be disabled on suspend and enabled on =
resume
> >> > +     * (hotplug-based mechanism). Disabling non-boot CPUs will lead=
 to PSCI
> >> > +     * CPU_OFF to be called by each non-boot CPU. Depending on the =
underlying
> >> > +     * platform capabilities, this may lead to the physical powerin=
g down of
> >> > +     * CPUs.
> >> > +     */
> >> > +    status =3D disable_nonboot_cpus();
> >> > +    if ( status )
> >> > +    {
> >> > +        system_state =3D SYS_STATE_resume;
> >> > +        goto resume_nonboot_cpus;
> >> > +    }
> >> > +
> >> > +    time_suspend();
> >> > +
> >> > +    status =3D iommu_suspend();
> >> > +    if ( status )
> >> > +    {
> >> > +        system_state =3D SYS_STATE_resume;
> >> > +        goto resume_time;
> >> > +    }
> >> > +
> >> > +    console_start_sync();
> >> > +    status =3D console_suspend();
> >> > +    if ( status )
> >> > +    {
> >> > +        dprintk(XENLOG_ERR, "Failed to suspend the console, err=3D%=
d\n", status);
> >> > +        system_state =3D SYS_STATE_resume;
> >> > +        goto resume_end_sync;
> >> > +    }
> >> > +
> >> > +    local_irq_save(flags);
> >> > +    status =3D gic_suspend();
> >> > +    if ( status )
> >> > +    {
> >> > +        system_state =3D SYS_STATE_resume;
> >> > +        goto resume_irqs;
> >> > +    }
> >> > +
> >> > +    set_init_ttbr(xen_pgtable);
> >> > +
> >> > +    /*
> >> > +     * Enable identity mapping before entering suspend to simplify
> >> > +     * the resume path
> >> > +     */
> >> > +    update_boot_mapping(true);
> >> > +
> >> > +    if ( prepare_resume_ctx(&cpu_context) )
> >> > +    {
> >> > +        status =3D call_psci_system_suspend();
> >> > +        /*
> >> > +         * If suspend is finalized properly by above system suspend=
 PSCI call,
> >> > +         * the code below in this 'if' branch will never execute. E=
xecution
> >> > +         * will continue from hyp_resume which is the hypervisor's =
resume point.
> >> > +         * In hyp_resume CPU context will be restored and since lin=
k-register is
> >> > +         * restored as well, it will appear to return from prepare_=
resume_ctx.
> >> > +         * The difference in returning from prepare_resume_ctx on s=
ystem suspend
> >> > +         * versus resume is in function's return value: on suspend,=
 the return
> >> > +         * value is a non-zero value, on resume it is zero. That is=
 why the
> >> > +         * control flow will not re-enter this 'if' branch on resum=
e.
> >> > +         */
> >> > +        if ( status )
> >> > +            dprintk(XENLOG_WARNING, "PSCI system suspend failed, er=
r=3D%d\n",
> >> > +                    status);
> >> > +    }
> >> > +
> >> > +    system_state =3D SYS_STATE_resume;
> >> > +    update_boot_mapping(false);
> >> > +
> >> > +    gic_resume();
> >> > +
> >> > + resume_irqs:
> >> > +    local_irq_restore(flags);
> >> > +
> >> > +    console_resume();
> >> > + resume_end_sync:
> >> > +    console_end_sync();
> >> > +
> >> > +    iommu_resume();
> >> > +
> >> > + resume_time:
> >> > +    time_resume();
> >> > +
> >> > + resume_nonboot_cpus:
> >> > +    /*
> >> > +     * The rcu_barrier() has to be added to ensure that the per cpu=
 area is
> >> > +     * freed before a non-boot CPU tries to initialize it (_free_pe=
rcpu_area()
> >> > +     * has to be called before the init_percpu_area()). This scenar=
io occurs
> >> > +     * when non-boot CPUs are hot-unplugged on suspend and hotplugg=
ed on resume.
> >> > +     */
> >> > +    rcu_barrier();
> >> > +    enable_nonboot_cpus();
> >> > +
> >> > + resume_scheduler:
> >> > +    scheduler_enable();
> >> > +    thaw_domains();
> >> > +
> >> > +    system_state =3D SYS_STATE_active;
> >> > +
> >> > +    printk("Resume (status %d)\n", status);
> >> > +
> >> > +    domain_resume(d);
> >> > +}
> >> > +
> >> > +static DECLARE_TASKLET(system_suspend_tasklet, system_suspend, NULL=
);
> >> > +
> >> > +void host_system_suspend(struct domain *d)
> >> > +{
> >> > +    system_suspend_tasklet.data =3D (void *)d;
> >> > +    /*
> >> > +     * The suspend procedure has to be finalized by the pCPU#0 (non=
-boot pCPUs
> >> > +     * will be disabled during the suspend).
> >> > +     */
> >> > +    tasklet_schedule_on_cpu(&system_suspend_tasklet, 0);
> >> > +}
> >> > +
> >> > /*
> >> >  * Local variables:
> >> >  * mode: C
> >> > diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> >> > index bd87ec430d..8fb9172186 100644
> >> > --- a/xen/arch/arm/vpsci.c
> >> > +++ b/xen/arch/arm/vpsci.c
> >> > @@ -5,6 +5,7 @@
> >> >
> >> > #include <asm/current.h>
> >> > #include <asm/domain.h>
> >> > +#include <asm/suspend.h>
> >> > #include <asm/vgic.h>
> >> > #include <asm/vpsci.h>
> >> > #include <asm/event.h>
> >> > @@ -232,8 +233,7 @@ static int32_t do_psci_1_0_system_suspend(regist=
er_t epoint, register_t cid)
> >> >     if ( is_64bit_domain(d) && is_thumb )
> >> >         return PSCI_INVALID_ADDRESS;
> >> >
> >> > -    /* SYSTEM_SUSPEND is not supported for the hardware domain yet =
*/
> >> > -    if ( is_hardware_domain(d) )
> >> > +    if ( !IS_ENABLED(CONFIG_SYSTEM_SUSPEND) && is_hardware_domain(d=
) )
> >> >         return PSCI_NOT_SUPPORTED;
> >> >
> >> >     /* Ensure that all CPUs other than the calling one are offline *=
/
> >> > @@ -266,6 +266,9 @@ static int32_t do_psci_1_0_system_suspend(regist=
er_t epoint, register_t cid)
> >> >             "SYSTEM_SUSPEND requested, epoint=3D%#"PRIregister", cid=
=3D%#"PRIregister"\n",
> >> >             epoint, cid);
> >> >
> >> > +    if ( is_control_domain(d) )
> >>
> >> Why is_control_domain() here and not is_hardware_domain() ?
> >
> > The use of is_control_domain() is intentional.
> >
> > The intended model is that Xen-wide host suspend is orchestrated by the
> > privileged management/control domain. The control domain coordinates th=
e
> > toolstack side, asks other domains to enter suspend, and then issues th=
e final
> > SYSTEM_SUSPEND request to Xen.
> >
> > This does not have to be the same entity as the hardware domain. If the
> > hardware domain is separate, it is one of the domains that the control =
domain
> > parks before the final host suspend step.
> >
> > The hwdom-specific checks in this patch have a different purpose: they =
avoid
> > the old hwdom_shutdown() path for SHUTDOWN_suspend and allow the hardwa=
re
> > domain to be parked as part of the suspend sequence. They do not define=
 the
> > policy for who is allowed to trigger Xen-wide host suspend.
> >
> > That said, this policy may not be optimal for all configurations, espec=
ially
> > when the control and hardware domain roles are split. I would appreciat=
e your
> > view, as well as the maintainers' views, on whether the trigger should =
remain
> > control-domain based, be tied to the hardware domain instead, or be exp=
ressed
> > through a separate host-suspend capability/helper.
>
>
> Hardware domain owns all the hardware. Hardware shall be put to
> power-down/suspended state before suspending the SoC, so it can be
> resumed afterwards. You can't just pause hardware domain in the same way
> as pausing all other domains.
>
> (Of course, we'll have the same issues with domain that have
> passed-through hardware, but in this case Dom0 shall orchestrate proper
> suspend sequence for these)

Yes, I agree that the hardware domain must not be externally
paused as a replacement for its own suspend path.

What I meant to describe is a guest-driven suspend sequence.
The control domain/toolstack may orchestrate the sequence,
but each domain that needs to quiesce hardware, including
the hardware domain and any domain with passed-through
devices, is expected to enter its own suspend path first and
quiesce its devices before issuing the virtual PSCI
SYSTEM_SUSPEND call.

Xen only treats other domains as ready for host suspend after
they have voluntarily reached SHUTDOWN_suspend. In the split
control/hardware-domain case, the final host-wide suspend
request from the control domain is accepted only after the
other domains, including the hardware domain, are already in
SHUTDOWN_suspend.

So my wording saying that the control domain "parks" the
hardware domain was imprecise. The control domain orchestrates
the sequence; it does not externally pause the hardware domain
as a substitute for its own suspend path.

Best regards,
Mykola

>
> [...]
>
> --
> WBR, Volodymyr

