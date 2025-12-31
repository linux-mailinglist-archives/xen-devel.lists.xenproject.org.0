Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BB3CEB03B
	for <lists+xen-devel@lfdr.de>; Wed, 31 Dec 2025 02:52:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194487.1512887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1valMS-0007CV-Kg; Wed, 31 Dec 2025 01:50:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194487.1512887; Wed, 31 Dec 2025 01:50:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1valMS-00079p-F2; Wed, 31 Dec 2025 01:50:52 +0000
Received: by outflank-mailman (input) for mailman id 1194487;
 Wed, 31 Dec 2025 01:50:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tfgF=7F=proton.me=milky_way_303030@srs-se1.protection.inumbo.net>)
 id 1valMQ-00079j-Bw
 for xen-devel@lists.xenproject.org; Wed, 31 Dec 2025 01:50:51 +0000
Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1fff253f-e5eb-11f0-b15d-2bf370ae4941;
 Wed, 31 Dec 2025 02:50:47 +0100 (CET)
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
X-Inumbo-ID: 1fff253f-e5eb-11f0-b15d-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1767145845; x=1767405045;
	bh=c8OhEN6OvNXg3IwRpCyrEZiVCXT4kE1DBspJ95sgUnI=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=TcGFZG+8ZuQeJniN8WJaJDb1MtRWTCXyMMn0uPQS/D480j5saXD7X03NIHlYz249P
	 NMOQHAH6+uUiJCa2uhqbeI4PnlaecxJ4eVkEQwHfvzTOiORTihdKxFOWnY5T0K59WO
	 zrsptC/ZAVZVcJmxTB+N5yIAHozx+t+FOv9EuF4h9QmIDvp/o/5r5KZ8S54KNsF0/3
	 wAIaYI1wKsqcBFNqQralSnaVcd/q6GCunzruX+h/Hulz8EePqJMphFplf4rI1UwsRP
	 vwHkPOKSItyGLHEnGyGYEKJPc5DG9kw91gjlMM82xick1BGLERGoKVLfvVotMp21cl
	 fz1QXWUQQLtOg==
Date: Wed, 31 Dec 2025 01:50:42 +0000
To: Jason Andryuk <jandryuk@gmail.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Milky <milky_way_303030@proton.me>
Subject: Re: Cpufreq drivers not working on T480S
Message-ID: <DkXw78UBxXYCLNKCoThGPM1kde5JwARo3NhWtlBBrrFtLFVTnwNlwDlZYzuNlSdAs9XzE0aDPqgt9dri9YKJULULBXwJLEcEgbLOgzkVSVU=@proton.me>
In-Reply-To: <CAKf6xpvtF_cE7vMb9JfsVLkYH1XRXZG3nj+QO_72-zKJ3Cxh9w@mail.gmail.com>
References: <dg8zeLW4X3RWRJt-1jas5pAqHft5GbxYxS5mNwc4ONE8tDEruL1-5a_e-vQu1RdOUWsMXxKe_Igcewy2zcbnOfkaGVG7y6hXLcLd78HI1po=@proton.me> <CAKf6xpsN_RnY2dHnXKj_-UySf1z0auye2qy=KHOEhcBbZ1un9A@mail.gmail.com> <NqFx_tXl0Zmx2ft7YVNGodkDcUFK7nA8KWUQMjOmD0y4T5W3-sTcGxCt7ViSRObUeJog3069xTY0ODZIG5hrX-Th2MvE95dSze13MGQ2tOY=@proton.me> <CAKf6xpvtF_cE7vMb9JfsVLkYH1XRXZG3nj+QO_72-zKJ3Cxh9w@mail.gmail.com>
Feedback-ID: 171106842:user:proton
X-Pm-Message-ID: f45af63a56353d4c263f9805d817633c75e3d638
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

(Re-CC'ing the ML because I forgot by accident. Hopefully the quoted
sections provide sufficient context)

On Tuesday, December 30th, 2025 at 10:44 AM, Jason Andryuk <jandryuk@gmail.=
com> wrote:
>=20
>=20
> On Mon, Dec 29, 2025 at 6:59=E2=80=AFPM Milky milky_way_303030@proton.me =
wrote:
> > I've tried the command you suggested. Like `xenpm get-cpufreq-states`, =
it returns no output. I am pasting it below anyway, for completeness.
> >
> > ```=20
> > [root@dom0 username] xenpm get-cpufreq-average
> > <no output>
> > ```
> >
> > For the record, I tracked the original [thread](https://lists.xen.org/a=
rchives/html/xen-devel/2024-01/msg00787.html) where you posted that suggest=
ion.

[...]

> > > HWP enabled
> >
> > Indeed I noticed that in the `xl dmesg` logs too, which seemed reassuri=
ng, however I didn't want to jump to conclusions and the "HW_FEEDBACK not s=
upported" line raised some concerns (although I was unable to find out what=
 it means).
>
>
> HW_FEEDBACK support doesn't matter.

[...]

> > > > The following commands were also checked:
> > > >
> > > > ```
> > > > $ xenpm get-cpufreq-para
> > > > [CPU0] failed to get cpufreq parameter
>
>
> We want this to work to get info on how HWP is configured. It could
> be set to a power save mode, and xenpm set-cpufreq-para would let you
> set it to be more performant. It's bizarre that it is not working.

[...]

> You need xen-acpi-processor to upload ACPI CPU data to Xen. That lets
> Xen know how to run cpufreq for the CPUs. cpufreq will not be enabled
> without the ACPI CPU data upload. If you add to dom0's command line:
> loglevel=3D9 dyndbg=3D"module xen_acpi_processor +p"
> xen_acpi_processor.dyndbg=3D"func * +p"
>
> You'll hopefully enable the dynamic debugging.
>
> And do:
> sudo dmesg | grep xen.acpi
> maybe you'd get some info?
>
> Or `modprobe xen-acpi-processor dyndbg=3D=3Dpmf`
>
> You want to see messages like:
> ACPI CPU%u - P-states uploaded
> https://elixir.bootlin.com/linux/v6.18.2/source/drivers/xen/xen-acpi-proc=
essor.c#L248
>
> If you see this one:
> pr_warn("ACPI CPU%u missing some P-state data (%x), skipping\n",
> _pr->acpi_id, dst_perf->flags);
>
> Then that may be why it's not working.


As suggested, I added the debug parameters to the dom0 kernel. Before or
after `modprobe xen-acpi-processor dyndbg=3D=3Dpmf`, there is no useful
debug information that I could find, apart from the
`xen_acpi_processor:get_max_acpi_id` message as seen below.

```
# sudo dmesg | grep xen.acpi
[    2.282851] Kernel command line: placeholder root=3D/dev/mapper/qubes_do=
m0-root ro rd.luks.uuid=3D<...> rd.lvm.lv=3Dqubes_dom0/root rd.lvm.lv=3Dqub=
es_dom0/swap plymouth.ignore-serial-consoles 6.6.77-1.qubes.fc37.x86_64 x86=
_64 rhgb loglevel=3D9 "dyndbg=3Dmodule xen_acpi_processor +p" "xen_acpi_pro=
cessor.dyndbg=3Dfunc * +p" rd.qubes.hide_all_usb
[    5.224092] xen_acpi_processor: Max ACPI ID: 6

# sudo lsmod | grep xen_acpi
<no output>

# sudo modprobe xen-acpi-processor dyndbg=3D=3Dpmf
modprobe: ERROR: could not insert 'xen_acpi_processor': No such device
```


> You flashed the T480s with Coreboot? Maybe the Coreboot ACPI data
> lacks something?


I flased it with Coreboot, yes; more specifically, I executed manually
the build steps of Libreboot. It's possible I've made a mistake
somewhere. However, as I mentioned in my first message, scaling actually
works correctly when booting with vanilla Debian.


> Maybe also with Xen's command line try cpufreq=3Dxen:no-hwp to disable
> HWP and see if the regular ACPI cpufreq driver works better.
>
> I'm thinking it's something where xen-acpi-processor didn't upload
> ACPI CPU data, which means cpufreq isn't running. That may also be
> why you see that bogus CPU frequency.

After booting with `xen:no-hwp`, I wasn't sure how to check if the
regular ACPI cpufreq driver is operational. Is `xenpm` still the
correct way to query for CPU info? I've tried the following:

```
# sudo xl dmesg | grep -i hwp
(XEN) Command line: placeholder cpufreq=3Dxen:no-hwp,verbose loglvl=3Dall d=
om0_mem=3Dmin:1024M dom0_mem=3Dmax:4096M ucode=3Dscan smt=3Doff gnttab_max_=
frames=3D2048 gnttab_max_maptrack_frames=3D4096 no-real-mode edd=3Doff
(XEN) HWP: 1 notify: 1 act-window: 1 energy-perf: 1 pkg-level: 0 peci: 0
(XEN) HWP: Hardware Duty Cycling (HDC) supported, enabled
(XEN) HWP: HW_FEEDBACK not supported

# sudo xenpm get-cpufreq-para
[CPU0] failed to get cpufreq parameter
[CPU1] failed to get cpufreq parameter
[CPU2] failed to get cpufreq parameter
[CPU3] failed to get cpufreq parameter

# sudo xenpm get-cpufreq-average
<no output>

# sudo xenpm start 10 | grep 'Avg freq'
Avg freq 884114144 KHz
Avg freq 884114144 KHz
Avg freq 884114144 KHz
Avg freq 884114144 KHz
```


