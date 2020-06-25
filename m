Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E95F209A6F
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2020 09:28:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joMIJ-00063u-OH; Thu, 25 Jun 2020 07:27:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HW/K=AG=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1joMII-00063p-P8
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2020 07:27:34 +0000
X-Inumbo-ID: 5638fa82-b6b5-11ea-8496-bc764e2007e4
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5638fa82-b6b5-11ea-8496-bc764e2007e4;
 Thu, 25 Jun 2020 07:27:34 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id d27so3901141qtg.4
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2020 00:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=eEZh0tTaT8zh5LL7N/hn9RvEV8NMH79zD1VRD/2Jbbw=;
 b=a7UwVx7WYGVzQyi5Hhk8M4DYU2kStSPTaeFf3iil0fkV5B6MyjeeVVYX9BlmbojEcc
 n/aRI0cHRhjpxZS1EagCkhDj2uS5ZisK6k/xg3ineSMdK6o6ScqR89yOTpVEpauhhOBd
 KGwpSIsEn2IBrXEPM5dEAGt4eMvX9GSh+XxdMHh3AW7fpQLZU0REmV3+TkNSkKWIgnN0
 VB8QID3QcpuC3OkdD+2KhC/c2Fb9G425sqltJ/Tdm+faX/cNnKDshgTiGnjwlDSh0hoT
 DQbNndO7UlcrSvp+uK4D0QqnaV/4Wp0ye+9CTcKat7lRL+Lv8cFxcgF3PTG7EQuXgO/J
 g1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=eEZh0tTaT8zh5LL7N/hn9RvEV8NMH79zD1VRD/2Jbbw=;
 b=aeq/sRyIaTydk7pCy4/jW8Pe1cxAcmgDR3RGkABkiBwQY70bN8g+ZEAt4BkhtSYgBS
 3MDmLWvXxJ7Rye7TNOrplTpGgyb44EQixcwAPidBMd1yK7HXgpPKu+/joraEE1g7ozCH
 mdt6RMVlHDa/t7s/Uj5oMI9d3+Rv1mruZB1FLN+0qnHzBWok3oLkb5Swq8X5AAqPyP9N
 d0Jrf4eIrWlaRTrJ4oNHTwhW8YFxgOZHJbH1ikgycNfqf6KlkSSXqprhZEXDYfWTNLLS
 jMXyEjI/UCL8lYJ+v9zdsrq+H1TsV30uhvKv1W9YyT8dO5ujMsPvzqEpk9wZ9YOS69Hl
 zEyA==
X-Gm-Message-State: AOAM5330cIxUkvdzFUfnoN+YVATbLNb9dmuejo2jhRvfHGzo7AxGVNO+
 aqkwYUYH3f198wZA4aTWpmY=
X-Google-Smtp-Source: ABdhPJyJyAn/vGNlypE6poVXGWQBftOZ9JkatcsvllRbhBckUmpXv1zurNoWnMAGiQzC/suVNhrBHA==
X-Received: by 2002:ac8:8a4:: with SMTP id v33mr21911252qth.392.1593070053657; 
 Thu, 25 Jun 2020 00:27:33 -0700 (PDT)
Received: from ?IPv6:2607:fb90:e854:3fa:dec:cecd:b019:e1d1?
 ([2607:fb90:e854:3fa:dec:cecd:b019:e1d1])
 by smtp.gmail.com with ESMTPSA id n63sm5326271qkn.104.2020.06.25.00.27.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2020 00:27:32 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [XEN RFC for-4.14] Re: use of "stat -"
Date: Thu, 25 Jun 2020 03:27:31 -0400
Message-Id: <D79E1F1A-AB75-40F4-A6B3-AF985E6458BB@gmail.com>
References: <CAKf6xpvLrXkBR6okFQ9u=9GfN-h_XHeLtwQV9pBRRAFXmbwVsQ@mail.gmail.com>
In-Reply-To: <CAKf6xpvLrXkBR6okFQ9u=9GfN-h_XHeLtwQV9pBRRAFXmbwVsQ@mail.gmail.com>
To: Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@citrix.com>,
 =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
 Jan Beulich <JBeulich@suse.com>
X-Mailer: iPhone Mail (17F75)
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Elliott Mitchell <ehem+xen@m5p.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Jun 24, 2020, at 22:39, Jason Andryuk <jandryuk@gmail.com> wrote:
>=20
> =EF=BB=BFOn Wed, Jun 24, 2020 at 12:19 PM Ian Jackson <ian.jackson@citrix.=
com> wrote:
>>=20
>> Jan Beulich writes ("Re: use of "stat -""):
>>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachment=
s unless you have verified the sender and know the content is safe.
>>>> On 14.05.2020 13:02, Ian Jackson wrote:
>>>>> I've read this thread.  Jan, I'm sorry that this causes you
>>>>> inconvenience.  I'm hoping it won't come down to a choice between
>>>>> supporting people who want to ship a dom0 without perl, and people who=

>>>>> want a dom0 using more-than-a-decade-old coreutils.
>>>>>=20
>>>>> Jan, can you tell me what the output is of this on your ancient
>>>>> system:
>>>>>=20
>>>>>  $ rm -f t
>>>>>  $ >t
>>>>>  $ exec 3<t
>>>>>  $ stat -L -c '%F %i' /dev/stdin <&3
>>>>>  regular empty file 393549
>>>>>  $ rm t
>>>>>  $ stat -L -c '%F %i' /dev/stdin <&3
>>>>>  regular empty file 393549
>>>>>  $ strace -ou stat -L -c '%F %i' /dev/stdin <&3
>>>>>  $
>>>=20
>>> $ rm -f t
>>> $ >t
>>> $ exec 3<t
>>> $ stat -L -c '%F %i' /dev/stdin <&3
>>> regular empty file 3380369
>>> $ rm t
>>> $ stat -L -c '%F %i' /dev/stdin <&3
>>> regular empty file 3380369
>>> $ strace -ou stat -L -c '%F %i' /dev/stdin <&3
>>> regular empty file 3380369
>>>=20
>>>> Also, the contents of the file "u" afterwards, please.
>>>=20
>>> Attached.
>>=20
>> Thanks.
>>=20
>> I think this means that `stat -' can be replaced by `stat /dev/stdin'.
>>=20
>> This script is only run on Linux where /dev/stdin has existed
>> basically forever.  The strace output shows
>>  stat("/dev/stdin", {st_mode=3DS_IFREG|0644, st_size=3D0, ...}) =3D 0
>> and the transcript shows that your stat(1) behaves as I hope.
>>=20
>> Jan, will you send a patch ?  It is best if someone else but me writes
>> it and tests it because then I am a "clean" reviewer.
>>=20
>> Paul, supposing I review such a patch and say it is low risk, and we
>> commit it by Friday, can it have a release-ack ?
>=20
> I was going to just write a patch to replace - with /dev/stdin and ask
> Jan to test it.  When I opened the script, this comment was staring at
> me:
>        # We can't just stat /dev/stdin or /proc/self/fd/$_lockfd or
>        # use bash's test -ef because those all go through what is
>        # actually a synthetic symlink in /proc and we aren't
>        # guaranteed that our stat(2) won't lose the race with an
>        # rm(1) between reading the synthetic link and traversing the
>        # file system to find the inum.
>=20
> On my system:
> $ ls -l /dev/stdin
> lrwxrwxrwx 1 root root 15 Jun 24 21:13 /dev/stdin -> /proc/self/fd/0
> $ ls -l /proc/self/fd/0 0<lockfile
> lrwx------ 1 jason jason 64 Jun 24 21:26 /proc/self/fd/0 -> /home/jason/lo=
ckfile
>=20
> stat /dev/stdin will work around the lack of `stat -` support, but it
> doesn't address the race in the comment.  Is the comment valid?  How
> would we prove there is no race for /dev/stdin?  And as a refresher,
> `stat -` does an fstat(0), so there is no symlink lookup.  Or is there
> no race since `stat /proc/self/fd/0` isn't a symlink lookup but just
> accessing the already open fd via the proc special file? i.e.
> equivalent to fstat.
>=20
> I've mentioned it before, but maybe we should just use the Qubes
> patch.  It leaves the lockfile even when no-one is holding the lock,
> but it simplifies the code and sidesteps the issues we are discussing
> here.
> https://github.com/QubesOS/qubes-vmm-xen/blob/xen-4.13/patch-tools-hotplug=
-drop-perl-usage-in-locking-mechanism.patch

Is there any practical downside to the Qubes patch, which is already deploye=
d on production systems?  The complexity of other approaches has been reflec=
ted in code and prior discussion.  If needed, the comments in the Qubes patc=
h could be expanded, when merging that well-tested code into 4.14.

Rich=

