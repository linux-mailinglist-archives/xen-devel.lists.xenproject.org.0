Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 147CF54EA2A
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jun 2022 21:32:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350851.577273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1vE4-0007RH-99; Thu, 16 Jun 2022 19:32:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350851.577273; Thu, 16 Jun 2022 19:32:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1vE4-0007Np-5f; Thu, 16 Jun 2022 19:32:20 +0000
Received: by outflank-mailman (input) for mailman id 350851;
 Thu, 16 Jun 2022 19:32:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/+X/=WX=gmail.com=dmitry.semenets@srs-se1.protection.inumbo.net>)
 id 1o1vE3-0007Nj-3Y
 for xen-devel@lists.xenproject.org; Thu, 16 Jun 2022 19:32:19 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08092ade-edab-11ec-bd2c-47488cf2e6aa;
 Thu, 16 Jun 2022 21:32:17 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id hj18so3992050ejb.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jun 2022 12:32:17 -0700 (PDT)
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
X-Inumbo-ID: 08092ade-edab-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Pg2as9lsR4oc1g+5FUfqlZ+95jwroKMZ2q0lTQ4egZY=;
        b=mEwaWbPyjwNQYYmpQhkZidR8tylworINZrxrX+w6qx6sqFG6eGxCQO2IR2ec1g3dDB
         BFTLs27xn+vrhAl3GuFrlSUQXFenotYvbP4EbEcgZrGlcqtQ8elgB+kRXcn2MLv3zfOz
         FiZhs8UPRe0kZVhs5K6KkpmHEooskW0WT4iJ3+NzFoqFMeBjNqlN+5dVK75uB9SS1j0n
         sA/WPG9hSi91v5wnHAQJc2fqaUL3/61i8jlwHPyAFUiRLj2vrY/cYF3vAGIjuF0B3F6w
         +wgcUKx135IdpK5d0TL9/qGDJc8sL0ntlkn287ybwE/hSjcoiaCyh4uBepH7mj/70Ae3
         NnjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Pg2as9lsR4oc1g+5FUfqlZ+95jwroKMZ2q0lTQ4egZY=;
        b=1+KnOzWeJZ0GV2kFv2xEEcwQVeYOJNmq036MIW8FvCIFXmpxGoAIQxrGW6ktnpnKnl
         nkuCUy0B+kIUy21ilEOnvFNwBfi1RhJurRsqWkILpNQihz+uQqQSKwSs/JN4mA2ZeKZs
         nsC87eEteg2Fyoh4w6XfEQJDXnX5054qQbwyhZFFyXtFUBPMb3CUkMBliaRTjC/f5juY
         A37lRJrbvMDZKDkCXI6NsqQbdwA/l9JFMWpNnj+2RNd4BFtVclIfsjDwJvGs0KHld567
         hxhS08nLsV59sGtJMiGA+/8MFkSXfidW5y8PIk5pCMEMdDWmZIhwA/Gn7bA2CiRC7cav
         qdnA==
X-Gm-Message-State: AJIora/pPKST+56/WuMqg/40CYPbGCSSFRXE0YcJzA1OUoigbmwXEyiq
	+pMTRMcnqOfpeXHWdJB/LHpehflylxwCCrBkbPI=
X-Google-Smtp-Source: AGRyM1tuwDYvgqDBDLZ4rbNZIQ0GjDgNdVfw39RZxTGQegYfJcS/8gKJosD5BmB/vggfMKCaLiCPTSBmO7mIlU2Fwv8=
X-Received: by 2002:a17:906:e2d2:b0:704:81fe:3152 with SMTP id
 gr18-20020a170906e2d200b0070481fe3152mr5772183ejb.411.1655407936848; Thu, 16
 Jun 2022 12:32:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220616135541.3333760-1-dmitry.semenets@gmail.com>
 <cf7660da-0bde-865e-7c22-a2e21e31fae5@xen.org> <87wndgh2og.fsf@epam.com> <67f56cdd-531b-72fc-1257-214d078f6bb6@xen.org>
In-Reply-To: <67f56cdd-531b-72fc-1257-214d078f6bb6@xen.org>
From: Dmytro Semenets <dmitry.semenets@gmail.com>
Date: Thu, 16 Jun 2022 22:32:05 +0300
Message-ID: <CACM97VUFBVGGYkXqrL-iLkU_jrQj+-KLveTdHk-H9F3UECSxKQ@mail.gmail.com>
Subject: Re: [PATCH] xen: Don't call panic if ARM TF cpu off returns DENIED
To: Julien Grall <julien@xen.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Dmytro Semenets <Dmytro_Semenets@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="00000000000008c5f005e195b29e"

--00000000000008c5f005e195b29e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 16 =D0=B8=D1=8E=D0=BD. 2022 =D0=B3. =D0=B2 22:09, Julien Gral=
l <julien@xen.org>:

>
>
> On 16/06/2022 19:40, Volodymyr Babchuk wrote:
> >
> > Hi Julien,
>
> Hi Volodymyr,
>
> >
> > Julien Grall <julien@xen.org> writes:
> >
> >> Hi,
> >>
> >> On 16/06/2022 14:55, dmitry.semenets@gmail.com wrote:
> >>> From: Dmytro Semenets <dmytro_semenets@epam.com>
> >>> According to PSCI specification ARM TF can return DENIED on CPU OFF.
> >>
> >> I am confused. The spec is talking about Trusted OS and not
> >> firmware. The docummentation is also not specific to ARM Trusted
> >> Firmware. So did you mean "Trusted OS"?
> >
> > It should be "firmware", I believe.
>
> Hmmm... I couldn't find a reference in the spec suggesting that CPU_OFF
> could return DENIED because of the firmware. Do you have a pointer to
> the spec?
>
Actually CPU_OFF performed by Trusted OS. But Trusted OS is called by the
ARM TF.
ARM TF for our platform doesn't call Trusted OS for CPU0 and returns DENIED
instead.

>
> >
> >>
> >> Also, did you reproduce on HW? If so, on which CPU this will fail?
> >>
> >
> > Yes, we reproduced this on HW. In our case it failed on CPU0. To be
> > fair, in our case it had nothing to do with Trusted OS. It is just
> > platform limitation - it can't turn off CPU0. But from Xen perspective
> > there is no difference - CPU_OFF call returns DENIED.
>
> Thanks for the clarification. I think I have seen that in the wild also
> but it never got on top of my queue. It is good that we are fixing it.
>
> >
> >>> This patch brings the hypervisor into compliance with the PSCI
> >>> specification.
> >>
> >> Now it means CPU off will never be turned off using PSCI. Instead, we
> >> would end up to spin in Xen. This would be a problem because we could
> >> save less power.
> >
> > Agreed.
> >
> >>
> >>> Refer to "Arm Power State Coordination Interface (DEN0022D.b)"
> >>> section 5.5.2
> >>
> >> Reading both 5.5.2 and 5.9.1 together, DENIED would be returned when
> >> the trusted OS can only run on one core.
> >>
> >> Some of the trusted OS are migratable. So I think we should first
> >> attempt to migrate the CPU. Then if it doesn't work, we should prevent
> >> the CPU to go offline.
> >>
> >> That said, upstream doesn't support cpu offlining (I don't know for
> >> your use case). In case of shutdown, it is not necessary to offline
> >> the CPU, so we could avoid to call CPU_OFF on all CPUs but
> >> one. Something like:
> >>
> >
> > This is even better approach yes. But you mentioned CPU_OFF. Did you
> > mean SYSTEM_RESET?
>
> By CPU_OFF I was referring to the fact that Xen will issue the call all
> CPUs but one. The remaining CPU will issue the command to reset/shutdown
> the system.
>
> >>   void machine_halt(void)
> >> @@ -21,10 +23,6 @@ void machine_halt(void)
> >>       smp_call_function(halt_this_cpu, NULL, 0);
> >>       local_irq_disable();
> >>
> >> -    /* Wait at most another 10ms for all other CPUs to go offline. */
> >> -    while ( (num_online_cpus() > 1) && (timeout-- > 0) )
> >> -        mdelay(1);
> >> -
> >>       /* This is mainly for PSCI-0.2, which does not return if success=
.
> */
> >>       call_psci_system_off();
> >>
> >>> Signed-off-by: Dmytro Semenets <dmytro_semenets@epam.com>
> >>> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> >>
> >> I don't recall to see patch on the ML recently for this. So is this an
> >> internal review?
> >
> > Yeah, sorry about that. Dmytro is a new member in our team and he is no=
t
> > yet familiar with differences in internal reviews and reviews in ML.
>
> No worries. I usually classify internal review anything that was done
> privately. This looks to be a public review, althought not on xen-devel.
>
> I understand that not all some of the patches are still in PoC stage and
> doing the review on your github is a good idea. But for those are meant
> to be for upstream (e.g. bug fixes, small patches), I would suggest to
> do the review on xen-devel directly
>
Sorry about that

>
> Cheers,
>
> --
> Julien Grall
>

--00000000000008c5f005e195b29e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">=D1=87=D1=82, 16 =D0=B8=D1=8E=D0=BD. =
2022 =D0=B3. =D0=B2 22:09, Julien Grall &lt;<a href=3D"mailto:julien@xen.or=
g">julien@xen.org</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
<br>
On 16/06/2022 19:40, Volodymyr Babchuk wrote:<br>
&gt; <br>
&gt; Hi Julien,<br>
<br>
Hi Volodymyr,<br>
<br>
&gt; <br>
&gt; Julien Grall &lt;<a href=3D"mailto:julien@xen.org" target=3D"_blank">j=
ulien@xen.org</a>&gt; writes:<br>
&gt; <br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt; On 16/06/2022 14:55, <a href=3D"mailto:dmitry.semenets@gmail.com" =
target=3D"_blank">dmitry.semenets@gmail.com</a> wrote:<br>
&gt;&gt;&gt; From: Dmytro Semenets &lt;<a href=3D"mailto:dmytro_semenets@ep=
am.com" target=3D"_blank">dmytro_semenets@epam.com</a>&gt;<br>
&gt;&gt;&gt; According to PSCI specification ARM TF can return DENIED on CP=
U OFF.<br>
&gt;&gt;<br>
&gt;&gt; I am confused. The spec is talking about Trusted OS and not<br>
&gt;&gt; firmware. The docummentation is also not specific to ARM Trusted<b=
r>
&gt;&gt; Firmware. So did you mean &quot;Trusted OS&quot;?<br>
&gt; <br>
&gt; It should be &quot;firmware&quot;, I believe.<br>
<br>
Hmmm... I couldn&#39;t find a reference in the spec suggesting that CPU_OFF=
 <br>
could return DENIED because of the firmware. Do you have a pointer to <br>
the spec?<br></blockquote><div>Actually CPU_OFF performed by Trusted OS. Bu=
t Trusted OS is called by the ARM TF.</div><div>ARM TF for our platform doe=
sn&#39;t call Trusted OS for CPU0 and returns DENIED instead.</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; Also, did you reproduce on HW? If so, on which CPU this will fail?=
<br>
&gt;&gt;<br>
&gt; <br>
&gt; Yes, we reproduced this on HW. In our case it failed on CPU0. To be<br=
>
&gt; fair, in our case it had nothing to do with Trusted OS. It is just<br>
&gt; platform limitation - it can&#39;t turn off CPU0. But from Xen perspec=
tive<br>
&gt; there is no difference - CPU_OFF call returns DENIED.<br>
<br>
Thanks for the clarification. I think I have seen that in the wild also <br=
>
but it never got on top of my queue. It is good that we are fixing it.<br>
<br>
&gt; <br>
&gt;&gt;&gt; This patch brings the hypervisor into compliance with the PSCI=
<br>
&gt;&gt;&gt; specification.<br>
&gt;&gt;<br>
&gt;&gt; Now it means CPU off will never be turned off using PSCI. Instead,=
 we<br>
&gt;&gt; would end up to spin in Xen. This would be a problem because we co=
uld<br>
&gt;&gt; save less power.<br>
&gt; <br>
&gt; Agreed.<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt;&gt; Refer to &quot;Arm Power State Coordination Interface (DEN0022=
D.b)&quot;<br>
&gt;&gt;&gt; section 5.5.2<br>
&gt;&gt;<br>
&gt;&gt; Reading both 5.5.2 and 5.9.1 together, DENIED would be returned wh=
en<br>
&gt;&gt; the trusted OS can only run on one core.<br>
&gt;&gt;<br>
&gt;&gt; Some of the trusted OS are migratable. So I think we should first<=
br>
&gt;&gt; attempt to migrate the CPU. Then if it doesn&#39;t work, we should=
 prevent<br>
&gt;&gt; the CPU to go offline.<br>
&gt;&gt;<br>
&gt;&gt; That said, upstream doesn&#39;t support cpu offlining (I don&#39;t=
 know for<br>
&gt;&gt; your use case). In case of shutdown, it is not necessary to offlin=
e<br>
&gt;&gt; the CPU, so we could avoid to call CPU_OFF on all CPUs but<br>
&gt;&gt; one. Something like:<br>
&gt;&gt;<br>
&gt; <br>
&gt; This is even better approach yes. But you mentioned CPU_OFF. Did you<b=
r>
&gt; mean SYSTEM_RESET?<br>
<br>
By CPU_OFF I was referring to the fact that Xen will issue the call all <br=
>
CPUs but one. The remaining CPU will issue the command to reset/shutdown <b=
r>
the system.<br>
<br>
&gt;&gt;=C2=A0 =C2=A0void machine_halt(void)<br>
&gt;&gt; @@ -21,10 +23,6 @@ void machine_halt(void)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0smp_call_function(halt_this_cpu, NULL, 0=
);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0local_irq_disable();<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 /* Wait at most another 10ms for all other CPUs to =
go offline. */<br>
&gt;&gt; -=C2=A0 =C2=A0 while ( (num_online_cpus() &gt; 1) &amp;&amp; (time=
out-- &gt; 0) )<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 mdelay(1);<br>
&gt;&gt; -<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* This is mainly for PSCI-0.2, which do=
es not return if success. */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0call_psci_system_off();<br>
&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Dmytro Semenets &lt;<a href=3D"mailto:dmytro_se=
menets@epam.com" target=3D"_blank">dmytro_semenets@epam.com</a>&gt;<br>
&gt;&gt;&gt; Reviewed-by: Volodymyr Babchuk &lt;<a href=3D"mailto:volodymyr=
_babchuk@epam.com" target=3D"_blank">volodymyr_babchuk@epam.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; I don&#39;t recall to see patch on the ML recently for this. So is=
 this an<br>
&gt;&gt; internal review?<br>
&gt; <br>
&gt; Yeah, sorry about that. Dmytro is a new member in our team and he is n=
ot<br>
&gt; yet familiar with differences in internal reviews and reviews in ML.<b=
r>
<br>
No worries. I usually classify internal review anything that was done <br>
privately. This looks to be a public review, althought not on xen-devel.<br=
>
<br>
I understand that not all some of the patches are still in PoC stage and <b=
r>
doing the review on your github is a good idea. But for those are meant <br=
>
to be for upstream (e.g. bug fixes, small patches), I would suggest to <br>
do the review on xen-devel directly<br></blockquote><div>Sorry about that=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
-- <br>
Julien Grall<br>
</blockquote></div></div>

--00000000000008c5f005e195b29e--

