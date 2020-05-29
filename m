Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A411E80D2
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 16:48:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jegJL-0001Ep-Ex; Fri, 29 May 2020 14:48:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pRu7=7L=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jegJK-0001ES-I2
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 14:48:38 +0000
X-Inumbo-ID: 7a6880c6-a1bb-11ea-9947-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a6880c6-a1bb-11ea-9947-bc764e2007e4;
 Fri, 29 May 2020 14:48:37 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r7so4004929wro.1
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2020 07:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yji15Dwy1ioHCVgZaGRdOYf8jrZqOi3UMj7qITADuIg=;
 b=GuwFkxhVmfXqc2+4L47AfCKkwBNT6UY7H0LjMUjIVsc/T8r2B6Eh46hOSWSfpKkMaz
 SneUiD7a6D+pvZ5Y3MDduKnA6IPEPiSVAh/s7XC2V445snXHQ3BdhmRcvj85bju3FzX7
 VQqTd8IlDd6q2Yz3tOo//LHXuvj6BpP7Fz05vRTyuawzYqcXkAKT/gjfyD92wZsH72e0
 NLDCC4r8//wH2a/PHTv8utNBirtwoESyiPflGUR9m9iE2fyza/l1YyoAi3Y/qu79imGZ
 fnmIsGNslE2knDk4VcRmEnMnkLf4ZIMFYlwqj1FWN4dbs/Qt++dFJFm5m6IG4QZ/jxDv
 +tYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yji15Dwy1ioHCVgZaGRdOYf8jrZqOi3UMj7qITADuIg=;
 b=iP8ZDuQuzVB79F00sB4/6Etb9KfmOEN1SxUzi3J+hMGLTu4V5U4G4mr/HDRr+0BjNR
 An4ELEprwlR9bs2L8o5DyiHF+9leveogSC3RkPsySr6JC/+vEhkWKZyQyMGtAbrxifAF
 zJqjSjMjXCqIdLFf2L/YNCKBUZwRe1cg0uZYF+EI5HBFgeo05LKCcGxFhzqu7Vs+XdYL
 sOF5gaNlTkLIcD88eSuvh8J5Qvw4rECnGohqkbrcL9g/ERnOIzSZVRi4llywsXoouaBn
 b0jc94f85R8b9oha6o33paf7Pc3jiuJcu41J1gfIP7uj3gUa+duCuhX+jnJ5a6laWB2S
 Uw/g==
X-Gm-Message-State: AOAM530261VahvUUnQSJUr66yzVqaMhAqdAfB+Co3j9e8bwQP/VtxDvB
 XOVtIdhbhv7eU9uuyBULibvbFsLye4ghP6GESO0=
X-Google-Smtp-Source: ABdhPJwILZEwPCb4JSLXYblLNRzV+9xrKbcPbR8YvqWlVFU2zvvYL5zy21aqZQhgiCg0PnDGZrbOdVZjmtZLFrlw8fI=
X-Received: by 2002:a5d:490f:: with SMTP id x15mr8957789wrq.259.1590763716778; 
 Fri, 29 May 2020 07:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <1317891616.59673956.1590755403816.JavaMail.zimbra@cert.pl>
 <57d213df-9edb-8f31-59e4-13f5cc07b543@suse.com>
 <1150720994.59695220.1590756705329.JavaMail.zimbra@cert.pl>
 <1f68a02a-3472-1bb0-90b9-6f3ccefca0b3@suse.com>
 <1623831291.59734817.1590760249321.JavaMail.zimbra@cert.pl>
In-Reply-To: <1623831291.59734817.1590760249321.JavaMail.zimbra@cert.pl>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Fri, 29 May 2020 08:48:01 -0600
Message-ID: <CABfawhmjeoVpRgAbDAA_T6rMiqPjQUvLPEn5t1-1JwZFJicNKQ@mail.gmail.com>
Subject: Re: [BUG] Core scheduling patches causing deadlock in some situations
To: =?UTF-8?B?TWljaGHFgiBMZXN6Y3p5xYRza2k=?= <michal.leszczynski@cert.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, chivay@cert.pl, bonus@cert.pl
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 29, 2020 at 7:51 AM Micha=C5=82 Leszczy=C5=84ski
<michal.leszczynski@cert.pl> wrote:
>
> ----- 29 maj 2020 o 15:15, J=C3=BCrgen Gro=C3=9F jgross@suse.com napisa=
=C5=82(a):
>
> > On 29.05.20 14:51, Micha=C5=82 Leszczy=C5=84ski wrote:
> >> ----- 29 maj 2020 o 14:44, J=C3=BCrgen Gro=C3=9F jgross@suse.com napis=
a=C5=82(a):
> >>
> >>> On 29.05.20 14:30, Micha=C5=82 Leszczy=C5=84ski wrote:
> >>>> Hello,
> >>>>
> >>>> I'm running DRAKVUF on Dell Inc. PowerEdge R640/08HT8T server with I=
ntel(R)
> >>>> Xeon(R) Gold 6132 CPU @ 2.60GHz CPU.
> >>>> When upgrading from Xen RELEASE 4.12 to 4.13, we have noticed some s=
tability
> >>>> problems concerning freezes of Dom0 (Debian Buster):
> >>>>
> >>>> ---
> >>>>
> >>>> maj 27 23:17:02 debian kernel: rcu: INFO: rcu_sched self-detected st=
all on CPU
> >>>> maj 27 23:17:02 debian kernel: rcu: 0-....: (5250 ticks this GP)
> >>>> idle=3Dcee/1/0x4000000000000002 softirq=3D11964/11964 fqs=3D2515
> >>>> maj 27 23:17:02 debian kernel: rcu: (t=3D5251 jiffies g=3D27237 q=3D=
799)
> >>>> maj 27 23:17:02 debian kernel: NMI backtrace for cpu 0
> >>>> maj 27 23:17:02 debian kernel: CPU: 0 PID: 643 Comm: z_rd_int_1 Tain=
ted: P OE
> >>>> 4.19.0-6-amd64 #1 Debian 4.19.67-2+deb10u2
> >>>> maj 27 23:17:02 debian kernel: Hardware name: Dell Inc. PowerEdge R6=
40/08HT8T,
> >>>> BIOS 2.1.8 04/30/2019
> >>>> maj 27 23:17:02 debian kernel: Call Trace:
> >>>> maj 27 23:17:02 debian kernel: <IRQ>
> >>>> maj 27 23:17:02 debian kernel: dump_stack+0x5c/0x80
> >>>> maj 27 23:17:02 debian kernel: nmi_cpu_backtrace.cold.4+0x13/0x50
> >>>> maj 27 23:17:02 debian kernel: ? lapic_can_unplug_cpu.cold.29+0x3b/0=
x3b
> >>>> maj 27 23:17:02 debian kernel: nmi_trigger_cpumask_backtrace+0xf9/0x=
fb
> >>>> maj 27 23:17:02 debian kernel: rcu_dump_cpu_stacks+0x9b/0xcb
> >>>> maj 27 23:17:02 debian kernel: rcu_check_callbacks.cold.81+0x1db/0x3=
35
> >>>> maj 27 23:17:02 debian kernel: ? tick_sched_do_timer+0x60/0x60
> >>>> maj 27 23:17:02 debian kernel: update_process_times+0x28/0x60
> >>>> maj 27 23:17:02 debian kernel: tick_sched_handle+0x22/0x60
> >>>>
> >>>> ---
> >>>>
> >>>> This usually results in machine being completely unresponsive and pe=
rforming an
> >>>> automated reboot after some time.
> >>>>
> >>>> I've bisected commits between 4.12 and 4.13 and it seems like this i=
s the patch
> >>>> which introduced a bug:
> >>>> https://github.com/xen-project/xen/commit/7c7b407e77724f37c4b4489307=
77a59a479feb21
> >>>>
> >>>> Enclosed you can find the `xl dmesg` log (attachment: dmesg.txt) fro=
m the fresh
> >>>> boot of the machine on which the bug was reproduced.
> >>>>
> >>>> I'm also attaching the `xl info` output from this machine:
> >>>>
> >>>> ---
> >>>>
> >>>> release : 4.19.0-6-amd64
> >>>> version : #1 SMP Debian 4.19.67-2+deb10u2 (2019-11-11)
> >>>> machine : x86_64
> >>>> nr_cpus : 14
> >>>> max_cpu_id : 223
> >>>> nr_nodes : 1
> >>>> cores_per_socket : 14
> >>>> threads_per_core : 1
> >>>> cpu_mhz : 2593.930
> >>>> hw_caps :
> >>>> bfebfbff:77fef3ff:2c100800:00000121:0000000f:d19ffffb:00000008:00000=
100
> >>>> virt_caps : pv hvm hvm_directio pv_directio hap shadow
> >>>> total_memory : 130541
> >>>> free_memory : 63591
> >>>> sharing_freed_memory : 0
> >>>> sharing_used_memory : 0
> >>>> outstanding_claims : 0
> >>>> free_cpus : 0
> >>>> xen_major : 4
> >>>> xen_minor : 13
> >>>> xen_extra : -unstable
> >>>> xen_version : 4.13-unstable
> >>>> xen_caps : xen-3.0-x86_64 xen-3.0-x86_32p hvm-3.0-x86_32 hvm-3.0-x86=
_32p
> >>>> hvm-3.0-x86_64
> >>>> xen_scheduler : credit2
> >>>> xen_pagesize : 4096
> >>>> platform_params : virt_start=3D0xffff800000000000
> >>>> xen_changeset : Wed Oct 2 09:27:27 2019 +0200 git:7c7b407e77-dirty
> >>>
> >>> Which is your original Xen base? This output is clearly obtained at t=
he
> >>> end of the bisect process.
> >>>
> >>> There have been quite some corrections since the release of Xen 4.13,=
 so
> >>> please make sure you are running the most actual version (4.13.1).
> >>>
> >>>
> >>> Juergen
> >>
> >> Sure, we have tested both RELEASE 4.13 and RELEASE 4.13.1. Unfortunate=
ly these
> >> corrections didn't help and the bug is still reproducible.
> >>
> >>  From our testing it turns out that:
> >>
> >> Known working revision: 997d6248a9ae932d0dbaac8d8755c2b15fec25dc
> >> Broken revision: 6278553325a9f76d37811923221b21db3882e017
> >> First bad commit: 7c7b407e77724f37c4b448930777a59a479feb21
> >
> > Would it be possible to test xen unstable, too?
> >
> > I could imagine e.g. commit b492c65da5ec5ed or 99266e31832fb4a4 to have
> > an impact here.
> >
> >
> > Juergen
>
>
> I've tried b492c65da5ec5ed revision but it seems that there is some probl=
em with ALTP2M support, so I can't launch anything at all.
>
> maj 29 15:45:32 debian drakrun[1223]: Failed to set HVM_PARAM_ALTP2M, RC:=
 -1
> maj 29 15:45:32 debian drakrun[1223]: VMI_ERROR: xc_altp2m_switch_to_view=
 returned rc: -1

Ough, great, that's another regression in 4.14-unstable. I ran into it
myself but couldn't spend time to figure out whether its just
something in my configuration or not so I reverted to 4.13.1. Now we
know it's a real bug.

Tamas

