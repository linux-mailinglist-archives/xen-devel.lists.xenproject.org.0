Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB89733D49F
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 14:13:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98287.186350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lM9Vv-00017t-34; Tue, 16 Mar 2021 13:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98287.186350; Tue, 16 Mar 2021 13:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lM9Vu-00017U-Ve; Tue, 16 Mar 2021 13:13:34 +0000
Received: by outflank-mailman (input) for mailman id 98287;
 Tue, 16 Mar 2021 13:13:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Go/K=IO=protonmail.com=dylangerdaly@srs-us1.protection.inumbo.net>)
 id 1lM9Vt-00017P-J3
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 13:13:33 +0000
Received: from mail-40136.protonmail.ch (unknown [185.70.40.136])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f0b7db35-a875-4801-80a5-08dc145a344c;
 Tue, 16 Mar 2021 13:13:31 +0000 (UTC)
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
X-Inumbo-ID: f0b7db35-a875-4801-80a5-08dc145a344c
Date: Tue, 16 Mar 2021 13:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail; t=1615900409;
	bh=Hh7Ith+yQfLnkaPjGf1TlqppumOt5t6STJJkMB4hbhI=;
	h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
	b=OJQazPY7Zj0hvDqp7Fxl+g349yyjgfaD1v5sQJ/qW/rXO0tbMA2WMHD9hMwOselZI
	 jad4h3T0UoOzV3wNQJ66UTjUchz0gB/ILaI1iXdKdoeb0FMIqwU2EJTdNJl1yfehGA
	 VawzzYz4mCnChWqDLcvzns44vYpgSJSJg0fCefJ8=
To: Jason Andryuk <jandryuk@gmail.com>
From: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Reply-To: Dylanger Daly <dylangerdaly@protonmail.com>
Subject: Re: AMD Ryzen 4000 (Mobile) cpufreq issues
Message-ID: <8cr1SEPLgE6uLkQ9wBv-f6z3cZ976RBeSAQ17VJpcwIzBiaMpNJQzbEK5vv5p4exI9bEoArBP-rohjxU0ayurdJrSEvFgF3AyRW6yDv0hHU=@protonmail.com>
In-Reply-To: <CAKf6xpsfh_w2TnJWH1wYSOcRhBETRxU61paovoMN+O2Mz4UEWw@mail.gmail.com>
References: <s6DNE-pStgBNMxxe8WkUZJbkqMyjdifBDHA_3gMGdC6oE1rweg8Au8ZPHaDFkvT0ETGykePtDj02LphVIWtdfyFQ9ZBFMjKJq6UNzY4BiAc=@protonmail.com> <CAKf6xpsfh_w2TnJWH1wYSOcRhBETRxU61paovoMN+O2Mz4UEWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
	mailout.protonmail.ch

On Tuesday, March 16th, 2021 at 10:57 PM, Jason Andryuk <jandryuk@gmail.com=
> wrote:

> On Mon, Mar 15, 2021 at 11:03 PM Dylanger Daly
>
> dylangerdaly@protonmail.com wrote:
>
> > Hi Xen Developers,
> >
> > It appears AMD Ryzen 4000 based CPUs are not supported by `xenpm`, runn=
ing `xenpm get-cpufreq-states` returns nothing and `get-cpufreq-para` retur=
ns `failed to get cpufreq parameter`
>
> In dom0, do `modprobe xen-acpi-processor` and see if `xenpm get-cpufreq-p=
ara` works. Xen needs Dom0 to load some ACPI info before
>
> xenpm can work.

Thanks for your reply Jason :)

Nice, indeed modprobing produces the following:

```
[   84.055724] xen_acpi_processor: Uploading Xen processor PM info
```

```
[user@dom0 ~]$ sudo xenpm get-cpufreq-states
cpu id               : 0
total P-states       : 3
usable P-states      : 3
current frequency    : 1400 MHz
P0         [1700 MHz]: transition [                 133]
                       residency  [                5350 ms]
P1         [1600 MHz]: transition [                  17]
                       residency  [                  98 ms]
*P2        [1400 MHz]: transition [                 130]
                       residency  [                4205 ms]

cpu id               : 2
total P-states       : 3
usable P-states      : 3
current frequency    : 1400 MHz
P0         [1700 MHz]: transition [                 128]
                       residency  [                4604 ms]
P1         [1600 MHz]: transition [                  13]
                       residency  [                 110 ms]
*P2        [1400 MHz]: transition [                 122]
                       residency  [                4030 ms]

cpu id               : 4
total P-states       : 3
usable P-states      : 3
current frequency    : 1400 MHz
P0         [1700 MHz]: transition [                 135]
                       residency  [                3785 ms]
P1         [1600 MHz]: transition [                  19]
                       residency  [                 124 ms]
*P2        [1400 MHz]: transition [                 131]
                       residency  [                4175 ms]

cpu id               : 6
total P-states       : 3
usable P-states      : 3
current frequency    : 1400 MHz
P0         [1700 MHz]: transition [                 131]
                       residency  [                4726 ms]
P1         [1600 MHz]: transition [                  11]
                       residency  [                  80 ms]
*P2        [1400 MHz]: transition [                 128]
                       residency  [                4125 ms]

cpu id               : 8
total P-states       : 3
usable P-states      : 3
current frequency    : 1400 MHz
P0         [1700 MHz]: transition [                 122]
                       residency  [                4237 ms]
P1         [1600 MHz]: transition [                  14]
                       residency  [                 151 ms]
*P2        [1400 MHz]: transition [                 115]
                       residency  [                4155 ms]

cpu id               : 10
total P-states       : 3
usable P-states      : 3
current frequency    : 1700 MHz
*P0        [1700 MHz]: transition [                 123]
                       residency  [                3897 ms]
P1         [1600 MHz]: transition [                  15]
                       residency  [                 125 ms]
P2         [1400 MHz]: transition [                 115]
                       residency  [                4146 ms]

cpu id               : 12
total P-states       : 3
usable P-states      : 3
current frequency    : 1400 MHz
P0         [1700 MHz]: transition [                 122]
                       residency  [                4625 ms]
P1         [1600 MHz]: transition [                  13]
                       residency  [                 127 ms]
*P2        [1400 MHz]: transition [                 116]
                       residency  [                4328 ms]

cpu id               : 14
total P-states       : 3
usable P-states      : 3
current frequency    : 1400 MHz
P0         [1700 MHz]: transition [                 119]
                       residency  [                3430 ms]
P1         [1600 MHz]: transition [                  11]
                       residency  [                 119 ms]
*P2        [1400 MHz]: transition [                 114]
                       residency  [                4065 ms]

[user@dom0 ~]$ sudo xenpm get-cpufreq-para
cpu id               : 0
affected_cpus        : 0
cpuinfo frequency    : max [1700000] min [1400000] cur [1400000]
scaling_driver       : powernow
scaling_avail_gov    : userspace performance powersave ondemand
current_governor     : ondemand
  ondemand specific  :
    sampling_rate    : max [10000000] min [10000] cur [20000]
    up_threshold     : 80
scaling_avail_freq   : 1700000 1600000 *1400000
scaling frequency    : max [1700000] min [1400000] cur [1400000]
turbo mode           : enabled

[CPU1] failed to get cpufreq parameter
cpu id               : 2
affected_cpus        : 2
cpuinfo frequency    : max [1700000] min [1400000] cur [1400000]
scaling_driver       : powernow
scaling_avail_gov    : userspace performance powersave ondemand
current_governor     : ondemand
  ondemand specific  :
    sampling_rate    : max [10000000] min [10000] cur [20000]
    up_threshold     : 80
scaling_avail_freq   : 1700000 1600000 *1400000
scaling frequency    : max [1700000] min [1400000] cur [1400000]
turbo mode           : enabled

[CPU3] failed to get cpufreq parameter
cpu id               : 4
affected_cpus        : 4
cpuinfo frequency    : max [1700000] min [1400000] cur [1400000]
scaling_driver       : powernow
scaling_avail_gov    : userspace performance powersave ondemand
current_governor     : ondemand
  ondemand specific  :
    sampling_rate    : max [10000000] min [10000] cur [20000]
    up_threshold     : 80
scaling_avail_freq   : 1700000 1600000 *1400000
scaling frequency    : max [1700000] min [1400000] cur [1400000]
turbo mode           : enabled

[CPU5] failed to get cpufreq parameter
cpu id               : 6
affected_cpus        : 6
cpuinfo frequency    : max [1700000] min [1400000] cur [1400000]
scaling_driver       : powernow
scaling_avail_gov    : userspace performance powersave ondemand
current_governor     : ondemand
  ondemand specific  :
    sampling_rate    : max [10000000] min [10000] cur [20000]
    up_threshold     : 80
scaling_avail_freq   : 1700000 1600000 *1400000
scaling frequency    : max [1700000] min [1400000] cur [1400000]
turbo mode           : enabled

[CPU7] failed to get cpufreq parameter
cpu id               : 8
affected_cpus        : 8
cpuinfo frequency    : max [1700000] min [1400000] cur [1400000]
scaling_driver       : powernow
scaling_avail_gov    : userspace performance powersave ondemand
current_governor     : ondemand
  ondemand specific  :
    sampling_rate    : max [10000000] min [10000] cur [20000]
    up_threshold     : 80
scaling_avail_freq   : 1700000 1600000 *1400000
scaling frequency    : max [1700000] min [1400000] cur [1400000]
turbo mode           : enabled

[CPU9] failed to get cpufreq parameter
cpu id               : 10
affected_cpus        : 10
cpuinfo frequency    : max [1700000] min [1400000] cur [1400000]
scaling_driver       : powernow
scaling_avail_gov    : userspace performance powersave ondemand
current_governor     : ondemand
  ondemand specific  :
    sampling_rate    : max [10000000] min [10000] cur [20000]
    up_threshold     : 80
scaling_avail_freq   : 1700000 1600000 *1400000
scaling frequency    : max [1700000] min [1400000] cur [1400000]
turbo mode           : enabled

[CPU11] failed to get cpufreq parameter
cpu id               : 12
affected_cpus        : 12
cpuinfo frequency    : max [1700000] min [1400000] cur [1700000]
scaling_driver       : powernow
scaling_avail_gov    : userspace performance powersave ondemand
current_governor     : ondemand
  ondemand specific  :
    sampling_rate    : max [10000000] min [10000] cur [20000]
    up_threshold     : 80
scaling_avail_freq   : *1700000 1600000 1400000
scaling frequency    : max [1700000] min [1400000] cur [1700000]
turbo mode           : enabled

[CPU13] failed to get cpufreq parameter
cpu id               : 14
affected_cpus        : 14
cpuinfo frequency    : max [1700000] min [1400000] cur [1400000]
scaling_driver       : powernow
scaling_avail_gov    : userspace performance powersave ondemand
current_governor     : ondemand
  ondemand specific  :
    sampling_rate    : max [10000000] min [10000] cur [20000]
    up_threshold     : 80
scaling_avail_freq   : 1700000 1600000 *1400000
scaling frequency    : max [1700000] min [1400000] cur [1400000]
turbo mode           : enabled

[CPU15] failed to get cpufreq parameter
```

There's a lot more going on there then before, I'm noticing I'm now boostin=
g ~3Ghz! :tada:

```
[user@dom0 ~]$ xenpm start 1|grep Avg freq
  Avg freq2975000KHz
  Avg freq2975000KHz
  Avg freq3009000KHz
  Avg freq3009000KHz
  Avg freq3179000KHz
  Avg freq3179000KHz
  Avg freq3179000KHz
  Avg freq3179000KHz
  Avg freq2771000KHz
  Avg freq2771000KHz
  Avg freq2839000KHz
  Avg freq2839000KHz
  Avg freq2873000KHz
  Avg freq2873000KHz
  Avg freq2924000KHz
  Avg freq2924000KHz
```

>
> Are you running Qubes? For some reason xen-acpi-processor doesn't
>
> load there automatically.

Yeah I'm running Qubes 4.1 (Xen 4.14), interesting it's not auto loading, I=
'll create an issue.

>
> > This was somewhat expected as Ryzen 4000 series CPUs are quite new, so =
as a workaround I tried putting `cpufreq=3Ddom0-kernel dom0_max_vcpus=3D8 d=
om0_vcpus_pin` onto CMDLINE, from what I've read this should essentially pa=
ss control for CPU frequency scaling down to dom0's kernel (5.11.4).
> >
> > However acpi-cpufreq doesn't load, when trying to insmod it I get the f=
ollowing error `insmod: ERROR: could not insert module acpi-cpufreq.ko: No =
such device`
> >
> > I can't seem to see anything related to Xen relinquishing control to do=
m0 in Xen's console, any help would be appreciated
>
> I haven't tried using cpufreq=3Ddom0-kernel, so I can't help here.

No worries, I think it maybe a depreciated option now.

>
> Regards,
>
> Jason

Cheers, Dylanger

