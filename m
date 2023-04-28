Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D31AF6F1308
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 10:10:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527202.819537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psJBW-0006iz-Bo; Fri, 28 Apr 2023 08:10:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527202.819537; Fri, 28 Apr 2023 08:10:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psJBW-0006gA-8G; Fri, 28 Apr 2023 08:10:30 +0000
Received: by outflank-mailman (input) for mailman id 527202;
 Fri, 28 Apr 2023 08:10:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TmhV=AT=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1psJBU-0006g0-HF
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 08:10:28 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 224cc02c-e59c-11ed-b224-6b7b168915f2;
 Fri, 28 Apr 2023 10:10:27 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2a8a5f6771fso93743451fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Apr 2023 01:10:27 -0700 (PDT)
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
X-Inumbo-ID: 224cc02c-e59c-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1682669426; x=1685261426;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9do+S2FEEjKxmRM+f2f1iEqcQl8DyalQDpF2+cUGZVI=;
        b=Gv67nv/EyFLjbNJCdDNNVG+env0R/0hR7lRQsR3ZRLIZ1xziDZ7k7kqOciZSNTNq4P
         9y0bFeh9Jn38wZTiVVF0peJPwGAY5RRklyIYtKqcUEof7uD1rVeFknPU4td6feBSJF6/
         VmBWcUdF5IDpp0KH61wbRYiN7qUCX6jPMZehI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682669426; x=1685261426;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9do+S2FEEjKxmRM+f2f1iEqcQl8DyalQDpF2+cUGZVI=;
        b=dRfjnwKASYTDnlz9nyE0+r1+QhWJ3aGmig/UsZiL0xx7WTbFdLdNdentbdzAhKdrpl
         2HiJnMhhGzAnA2rQa+gkILpsUeq2Cjg4ICUuRZB/tOYwypEfnh6w8pCqrK5YoI9J6i25
         DXiHSJMe6330Y7QIEOQfcVdQC5tdc9IPNsWDhoov9LLRge+TUBYKVQCuBw6EhCW4TwkU
         cHjVzhOGgaKWVeB2Pc/F0ast1JWkeBEkT+cLE7v5FyVDeo08tnTImCfXdQ4puDE0NpWy
         9ZsoecoifK7eXzxZSqguQrDldOO2rLkhP08ImHhGHkRIWTaOnjIQhua4v+STDAVaauty
         I8Ng==
X-Gm-Message-State: AC+VfDwJW+ONLjwvxAWimjSjRMx804yV/nmtc4q50RXYISM8r52b7gXm
	0NehScbo84HL6UkDVK8zm7Q91bSlLJcpawt8WE4OS2I0MI9No7jw
X-Google-Smtp-Source: ACHHUZ5n8uykskIiiQ1GRnWK98t305gCrpDHyz6xeswD7z3TgDunuIvMW1CCUxi5t00Hue/3Z5cUp2OI4SMrzRhKGhI=
X-Received: by 2002:a2e:9d42:0:b0:2ab:4bb3:e32c with SMTP id
 y2-20020a2e9d42000000b002ab4bb3e32cmr147514ljj.31.1682669426460; Fri, 28 Apr
 2023 01:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230428080832.2461044-1-george.dunlap@cloud.com> <20230428080832.2461044-3-george.dunlap@cloud.com>
In-Reply-To: <20230428080832.2461044-3-george.dunlap@cloud.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 28 Apr 2023 09:10:15 +0100
Message-ID: <CA+zSX=ZzhJOkOdbbS3Vr1yino=7k5u3E3r-FvQbi6eopk4tK9w@mail.gmail.com>
Subject: Re: [PATCH 3/5] credit: Limit load balancing to once per millisecond
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000007066f505fa6101ee"

--0000000000007066f505fa6101ee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please ignore patches 1-4 of this series...

 -George

On Fri, Apr 28, 2023 at 9:08=E2=80=AFAM George Dunlap <george.dunlap@cloud.=
com>
wrote:

> The credit scheduler tries as hard as it can to ensure that it always
> runs scheduling units with positive credit (PRI_TS_UNDER) before
> running those with negative credit (PRI_TS_OVER).  If the next
> runnable scheduling unit is of priority OVER, it will always run the
> load balancer, which will scour the system looking for another
> scheduling unit of the UNDER priority.
>
> Unfortunately, as the number of cores on a system has grown, the cost
> of the work-stealing algorithm has dramatically increased; a recent
> trace on a system with 128 cores showed this taking over 50
> microseconds.
>
> Add a parameter, load_balance_ratelimit, to limit the frequency of
> load balance operations on a given pcpu.  Default this to 1
> millisecond.
>
> Invert the load balancing conditional to make it more clear, and line
> up more closely with the comment above it.
>
> Overall it might be cleaner to have the last_load_balance checking
> happen inside csched_load_balance(), but that would require either
> passing both now and spc into the function, or looking them up again;
> both of which seemed to be worse than simply checking and setting the
> values before calling it.
>
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>
> ---
>  docs/misc/xen-command-line.pandoc |  6 +++++
>  xen/common/sched/credit.c         | 40 ++++++++++++++++++++++++++-----
>  xen/include/public/sysctl.h       |  6 +++++
>  3 files changed, 46 insertions(+), 6 deletions(-)
>
> diff --git a/docs/misc/xen-command-line.pandoc
> b/docs/misc/xen-command-line.pandoc
> index e0b89b7d33..ae51a8cfa2 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1840,6 +1840,12 @@ By default, Xen will use the INVPCID instruction
> for TLB management if
>  it is available.  This option can be used to cause Xen to fall back to
>  older mechanisms, which are generally slower.
>
> +### load-balance-ratelimit
> +> `=3D <integer>`
> +
> +The minimum interval between load balancing events on a given pcpu.
> +At the moment only credit honors this parameter.
> +
>  ### noirqbalance (x86)
>  > `=3D <boolean>`
>
> diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
> index f2cd3d9da3..b8bdfd5f6a 100644
> --- a/xen/common/sched/credit.c
> +++ b/xen/common/sched/credit.c
> @@ -50,6 +50,8 @@
>  #define CSCHED_TICKS_PER_TSLICE     3
>  /* Default timeslice: 30ms */
>  #define CSCHED_DEFAULT_TSLICE_MS    30
> +/* Default load balancing ratelimit: 1ms */
> +#define CSCHED_DEFAULT_LOAD_BALANCE_RATELIMIT_US 1000
>  #define CSCHED_CREDITS_PER_MSEC     10
>  /* Never set a timer shorter than this value. */
>  #define CSCHED_MIN_TIMER            XEN_SYSCTL_SCHED_RATELIMIT_MIN
> @@ -153,6 +155,7 @@ struct csched_pcpu {
>
>      unsigned int idle_bias;
>      unsigned int nr_runnable;
> +    s_time_t last_load_balance;
>
>      unsigned int tick;
>      struct timer ticker;
> @@ -218,7 +221,7 @@ struct csched_private {
>
>      /* Period of master and tick in milliseconds */
>      unsigned int tick_period_us, ticks_per_tslice;
> -    s_time_t ratelimit, tslice, unit_migr_delay;
> +    s_time_t ratelimit, tslice, unit_migr_delay, load_balance_ratelimit;
>
>      struct list_head active_sdom;
>      uint32_t weight;
> @@ -612,6 +615,8 @@ init_pdata(struct csched_private *prv, struct
> csched_pcpu *spc, int cpu)
>      BUG_ON(!is_idle_unit(curr_on_cpu(cpu)));
>      cpumask_set_cpu(cpu, prv->idlers);
>      spc->nr_runnable =3D 0;
> +
> +    spc->last_load_balance =3D NOW();
>  }
>
>  static void cf_check
> @@ -1267,7 +1272,8 @@ csched_sys_cntl(const struct scheduler *ops,
>                   && (params->ratelimit_us > XEN_SYSCTL_SCHED_RATELIMIT_M=
AX
>                       || params->ratelimit_us <
> XEN_SYSCTL_SCHED_RATELIMIT_MIN))
>               || MICROSECS(params->ratelimit_us) >
> MILLISECS(params->tslice_ms)
> -             || params->vcpu_migr_delay_us >
> XEN_SYSCTL_CSCHED_MGR_DLY_MAX_US )
> +             || params->vcpu_migr_delay_us >
> XEN_SYSCTL_CSCHED_MGR_DLY_MAX_US
> +             || params->load_balance_ratelimit_us >
> XEN_SYSCTL_CSCHED_LB_RATE_MAX_US)
>                  goto out;
>
>          spin_lock_irqsave(&prv->lock, flags);
> @@ -1278,6 +1284,7 @@ csched_sys_cntl(const struct scheduler *ops,
>              printk(XENLOG_INFO "Disabling context switch rate
> limiting\n");
>          prv->ratelimit =3D MICROSECS(params->ratelimit_us);
>          prv->unit_migr_delay =3D MICROSECS(params->vcpu_migr_delay_us);
> +        prv->load_balance_ratelimit =3D
> MICROSECS(params->load_balance_ratelimit_us);
>          spin_unlock_irqrestore(&prv->lock, flags);
>
>          /* FALLTHRU */
> @@ -1285,6 +1292,7 @@ csched_sys_cntl(const struct scheduler *ops,
>          params->tslice_ms =3D prv->tslice / MILLISECS(1);
>          params->ratelimit_us =3D prv->ratelimit / MICROSECS(1);
>          params->vcpu_migr_delay_us =3D prv->unit_migr_delay / MICROSECS(=
1);
> +        params->load_balance_ratelimit_us =3D prv->load_balance_ratelimi=
t /
> MICROSECS(1);
>          rc =3D 0;
>          break;
>      }
> @@ -1676,9 +1684,17 @@ csched_runq_steal(int peer_cpu, int cpu, int pri,
> int balance_step)
>      return NULL;
>  }
>
> +/*
> + * Minimum delay, in microseconds, between load balance operations.
> + * This prevents spending too much time doing load balancing, particular=
ly
> + * when the system has a high number of YIELDs due to spinlock priority
> inversion.
> + */
> +static unsigned int __read_mostly load_balance_ratelimit_us =3D
> CSCHED_DEFAULT_LOAD_BALANCE_RATELIMIT_US;
> +integer_param("load-balance-ratelimit", load_balance_ratelimit_us);
> +
>  static struct csched_unit *
>  csched_load_balance(struct csched_private *prv, int cpu,
> -    struct csched_unit *snext, bool *stolen)
> +                    struct csched_unit *snext, bool *stolen)
>  {
>      const struct cpupool *c =3D get_sched_res(cpu)->cpupool;
>      struct csched_unit *speer;
> @@ -1963,10 +1979,12 @@ static void cf_check csched_schedule(
>           * urgent work... If not, csched_load_balance() will return
> snext, but
>           * already removed from the runq.
>           */
> -        if ( snext->pri > CSCHED_PRI_TS_OVER )
> -            __runq_remove(snext);
> -        else
> +        if ( snext->pri <=3D CSCHED_PRI_TS_OVER
> +             && now - spc->last_load_balance >
> prv->load_balance_ratelimit) {
> +            spc->last_load_balance =3D now;
>              snext =3D csched_load_balance(prv, sched_cpu, snext, &migrat=
ed);
> +        } else
> +            __runq_remove(snext);
>
>      } while ( !unit_runnable_state(snext->unit) );
>
> @@ -2181,6 +2199,14 @@ csched_global_init(void)
>                 XEN_SYSCTL_CSCHED_MGR_DLY_MAX_US, vcpu_migration_delay_us=
);
>      }
>
> +    if ( load_balance_ratelimit_us > XEN_SYSCTL_CSCHED_LB_RATE_MAX_US )
> +    {
> +        load_balance_ratelimit_us =3D
> CSCHED_DEFAULT_LOAD_BALANCE_RATELIMIT_US;
> +        printk("WARNING: load-balance-ratelimit outside of valid range
> [0,%d]us.\n"
> +               "Resetting to default: %u\n",
> +               XEN_SYSCTL_CSCHED_LB_RATE_MAX_US,
> load_balance_ratelimit_us);
> +    }
> +
>      return 0;
>  }
>
> @@ -2223,6 +2249,8 @@ csched_init(struct scheduler *ops)
>
>      prv->unit_migr_delay =3D MICROSECS(vcpu_migration_delay_us);
>
> +    prv->load_balance_ratelimit =3D MICROSECS(load_balance_ratelimit_us)=
;
> +
>      return 0;
>  }
>
> diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
> index 2b24d6bfd0..192458d635 100644
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -637,6 +637,12 @@ struct xen_sysctl_credit_schedule {
>      */
>  #define XEN_SYSCTL_CSCHED_MGR_DLY_MAX_US (100 * 1000)
>      uint32_t vcpu_migr_delay_us;
> +    /*
> +     * Minimum delay, in microseconds, between load balance
> +     * operations; max 1 second.
> +     */
> +#define XEN_SYSCTL_CSCHED_LB_RATE_MAX_US (1000000)
> +    uint32_t load_balance_ratelimit_us;
>  };
>
>  struct xen_sysctl_credit2_schedule {
> --
> 2.25.1
>
>

--0000000000007066f505fa6101ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please ignore patches 1-4 of this series...<div><br></div>=
<div>=C2=A0-George</div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Apr 28, 2023 at 9:08=E2=80=AFAM George Dunl=
ap &lt;<a href=3D"mailto:george.dunlap@cloud.com">george.dunlap@cloud.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Th=
e credit scheduler tries as hard as it can to ensure that it always<br>
runs scheduling units with positive credit (PRI_TS_UNDER) before<br>
running those with negative credit (PRI_TS_OVER).=C2=A0 If the next<br>
runnable scheduling unit is of priority OVER, it will always run the<br>
load balancer, which will scour the system looking for another<br>
scheduling unit of the UNDER priority.<br>
<br>
Unfortunately, as the number of cores on a system has grown, the cost<br>
of the work-stealing algorithm has dramatically increased; a recent<br>
trace on a system with 128 cores showed this taking over 50<br>
microseconds.<br>
<br>
Add a parameter, load_balance_ratelimit, to limit the frequency of<br>
load balance operations on a given pcpu.=C2=A0 Default this to 1<br>
millisecond.<br>
<br>
Invert the load balancing conditional to make it more clear, and line<br>
up more closely with the comment above it.<br>
<br>
Overall it might be cleaner to have the last_load_balance checking<br>
happen inside csched_load_balance(), but that would require either<br>
passing both now and spc into the function, or looking them up again;<br>
both of which seemed to be worse than simply checking and setting the<br>
values before calling it.<br>
<br>
Signed-off-by: George Dunlap &lt;<a href=3D"mailto:george.dunlap@cloud.com"=
 target=3D"_blank">george.dunlap@cloud.com</a>&gt;<br>
---<br>
=C2=A0docs/misc/xen-command-line.pandoc |=C2=A0 6 +++++<br>
=C2=A0xen/common/sched/credit.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 40 +++++=
+++++++++++++++++++++-----<br>
=C2=A0xen/include/public/sysctl.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++++=
<br>
=C2=A03 files changed, 46 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line=
.pandoc<br>
index e0b89b7d33..ae51a8cfa2 100644<br>
--- a/docs/misc/xen-command-line.pandoc<br>
+++ b/docs/misc/xen-command-line.pandoc<br>
@@ -1840,6 +1840,12 @@ By default, Xen will use the INVPCID instruction for=
 TLB management if<br>
=C2=A0it is available.=C2=A0 This option can be used to cause Xen to fall b=
ack to<br>
=C2=A0older mechanisms, which are generally slower.<br>
<br>
+### load-balance-ratelimit<br>
+&gt; `=3D &lt;integer&gt;`<br>
+<br>
+The minimum interval between load balancing events on a given pcpu.<br>
+At the moment only credit honors this parameter.<br>
+<br>
=C2=A0### noirqbalance (x86)<br>
=C2=A0&gt; `=3D &lt;boolean&gt;`<br>
<br>
diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c<br>
index f2cd3d9da3..b8bdfd5f6a 100644<br>
--- a/xen/common/sched/credit.c<br>
+++ b/xen/common/sched/credit.c<br>
@@ -50,6 +50,8 @@<br>
=C2=A0#define CSCHED_TICKS_PER_TSLICE=C2=A0 =C2=A0 =C2=A03<br>
=C2=A0/* Default timeslice: 30ms */<br>
=C2=A0#define CSCHED_DEFAULT_TSLICE_MS=C2=A0 =C2=A0 30<br>
+/* Default load balancing ratelimit: 1ms */<br>
+#define CSCHED_DEFAULT_LOAD_BALANCE_RATELIMIT_US 1000<br>
=C2=A0#define CSCHED_CREDITS_PER_MSEC=C2=A0 =C2=A0 =C2=A010<br>
=C2=A0/* Never set a timer shorter than this value. */<br>
=C2=A0#define CSCHED_MIN_TIMER=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 XEN=
_SYSCTL_SCHED_RATELIMIT_MIN<br>
@@ -153,6 +155,7 @@ struct csched_pcpu {<br>
<br>
=C2=A0 =C2=A0 =C2=A0unsigned int idle_bias;<br>
=C2=A0 =C2=A0 =C2=A0unsigned int nr_runnable;<br>
+=C2=A0 =C2=A0 s_time_t last_load_balance;<br>
<br>
=C2=A0 =C2=A0 =C2=A0unsigned int tick;<br>
=C2=A0 =C2=A0 =C2=A0struct timer ticker;<br>
@@ -218,7 +221,7 @@ struct csched_private {<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Period of master and tick in milliseconds */<br>
=C2=A0 =C2=A0 =C2=A0unsigned int tick_period_us, ticks_per_tslice;<br>
-=C2=A0 =C2=A0 s_time_t ratelimit, tslice, unit_migr_delay;<br>
+=C2=A0 =C2=A0 s_time_t ratelimit, tslice, unit_migr_delay, load_balance_ra=
telimit;<br>
<br>
=C2=A0 =C2=A0 =C2=A0struct list_head active_sdom;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t weight;<br>
@@ -612,6 +615,8 @@ init_pdata(struct csched_private *prv, struct csched_pc=
pu *spc, int cpu)<br>
=C2=A0 =C2=A0 =C2=A0BUG_ON(!is_idle_unit(curr_on_cpu(cpu)));<br>
=C2=A0 =C2=A0 =C2=A0cpumask_set_cpu(cpu, prv-&gt;idlers);<br>
=C2=A0 =C2=A0 =C2=A0spc-&gt;nr_runnable =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 spc-&gt;last_load_balance =3D NOW();<br>
=C2=A0}<br>
<br>
=C2=A0static void cf_check<br>
@@ -1267,7 +1272,8 @@ csched_sys_cntl(const struct scheduler *ops,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (=
params-&gt;ratelimit_us &gt; XEN_SYSCTL_SCHED_RATELIMIT_MAX<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 || params-&gt;ratelimit_us &lt; XEN_SYSCTL_SCHED_RATELIMIT_MIN))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || MICROSECS(params-&gt;ra=
telimit_us) &gt; MILLISECS(params-&gt;tslice_ms)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| params-&gt;vcpu_migr_de=
lay_us &gt; XEN_SYSCTL_CSCHED_MGR_DLY_MAX_US )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| params-&gt;vcpu_migr_de=
lay_us &gt; XEN_SYSCTL_CSCHED_MGR_DLY_MAX_US<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| params-&gt;load_balance=
_ratelimit_us &gt; XEN_SYSCTL_CSCHED_LB_RATE_MAX_US)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock_irqsave(&amp;prv-&gt;lock, flag=
s);<br>
@@ -1278,6 +1284,7 @@ csched_sys_cntl(const struct scheduler *ops,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printk(XENLOG_INFO &quot;Di=
sabling context switch rate limiting\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prv-&gt;ratelimit =3D MICROSECS(params-&g=
t;ratelimit_us);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prv-&gt;unit_migr_delay =3D MICROSECS(par=
ams-&gt;vcpu_migr_delay_us);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 prv-&gt;load_balance_ratelimit =3D MICROSECS(p=
arams-&gt;load_balance_ratelimit_us);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock_irqrestore(&amp;prv-&gt;lock,=
 flags);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* FALLTHRU */<br>
@@ -1285,6 +1292,7 @@ csched_sys_cntl(const struct scheduler *ops,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0params-&gt;tslice_ms =3D prv-&gt;tslice /=
 MILLISECS(1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0params-&gt;ratelimit_us =3D prv-&gt;ratel=
imit / MICROSECS(1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0params-&gt;vcpu_migr_delay_us =3D prv-&gt=
;unit_migr_delay / MICROSECS(1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 params-&gt;load_balance_ratelimit_us =3D prv-&=
gt;load_balance_ratelimit / MICROSECS(1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -1676,9 +1684,17 @@ csched_runq_steal(int peer_cpu, int cpu, int pri, in=
t balance_step)<br>
=C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0}<br>
<br>
+/*<br>
+ * Minimum delay, in microseconds, between load balance operations.<br>
+ * This prevents spending too much time doing load balancing, particularly=
<br>
+ * when the system has a high number of YIELDs due to spinlock priority in=
version.<br>
+ */<br>
+static unsigned int __read_mostly load_balance_ratelimit_us =3D CSCHED_DEF=
AULT_LOAD_BALANCE_RATELIMIT_US;<br>
+integer_param(&quot;load-balance-ratelimit&quot;, load_balance_ratelimit_u=
s);<br>
+<br>
=C2=A0static struct csched_unit *<br>
=C2=A0csched_load_balance(struct csched_private *prv, int cpu,<br>
-=C2=A0 =C2=A0 struct csched_unit *snext, bool *stolen)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stru=
ct csched_unit *snext, bool *stolen)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const struct cpupool *c =3D get_sched_res(cpu)-&gt;cpup=
ool;<br>
=C2=A0 =C2=A0 =C2=A0struct csched_unit *speer;<br>
@@ -1963,10 +1979,12 @@ static void cf_check csched_schedule(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * urgent work... If not, csched_load_bal=
ance() will return snext, but<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * already removed from the runq.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( snext-&gt;pri &gt; CSCHED_PRI_TS_OVER )<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __runq_remove(snext);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( snext-&gt;pri &lt;=3D CSCHED_PRI_TS_OVER<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; now - spc-&gt;l=
ast_load_balance &gt; prv-&gt;load_balance_ratelimit) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spc-&gt;last_load_balance =3D no=
w;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snext =3D csched_load_balan=
ce(prv, sched_cpu, snext, &amp;migrated);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __runq_remove(snext);<br>
<br>
=C2=A0 =C2=A0 =C2=A0} while ( !unit_runnable_state(snext-&gt;unit) );<br>
<br>
@@ -2181,6 +2199,14 @@ csched_global_init(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 XEN_SYSCTL_CSCHED_M=
GR_DLY_MAX_US, vcpu_migration_delay_us);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 if ( load_balance_ratelimit_us &gt; XEN_SYSCTL_CSCHED_LB_RAT=
E_MAX_US )<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 load_balance_ratelimit_us =3D CSCHED_DEFAULT_L=
OAD_BALANCE_RATELIMIT_US;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(&quot;WARNING: load-balance-ratelimit o=
utside of valid range [0,%d]us.\n&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Resetting to =
default: %u\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0XEN_SYSCTL_CSCHED_L=
B_RATE_MAX_US, load_balance_ratelimit_us);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
@@ -2223,6 +2249,8 @@ csched_init(struct scheduler *ops)<br>
<br>
=C2=A0 =C2=A0 =C2=A0prv-&gt;unit_migr_delay =3D MICROSECS(vcpu_migration_de=
lay_us);<br>
<br>
+=C2=A0 =C2=A0 prv-&gt;load_balance_ratelimit =3D MICROSECS(load_balance_ra=
telimit_us);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h<br>
index 2b24d6bfd0..192458d635 100644<br>
--- a/xen/include/public/sysctl.h<br>
+++ b/xen/include/public/sysctl.h<br>
@@ -637,6 +637,12 @@ struct xen_sysctl_credit_schedule {<br>
=C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0#define XEN_SYSCTL_CSCHED_MGR_DLY_MAX_US (100 * 1000)<br>
=C2=A0 =C2=A0 =C2=A0uint32_t vcpu_migr_delay_us;<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Minimum delay, in microseconds, between load balance=
<br>
+=C2=A0 =C2=A0 =C2=A0* operations; max 1 second.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+#define XEN_SYSCTL_CSCHED_LB_RATE_MAX_US (1000000)<br>
+=C2=A0 =C2=A0 uint32_t load_balance_ratelimit_us;<br>
=C2=A0};<br>
<br>
=C2=A0struct xen_sysctl_credit2_schedule {<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--0000000000007066f505fa6101ee--

