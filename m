Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E582741A8FC
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 08:30:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197580.350710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV6dU-0005Jr-LX; Tue, 28 Sep 2021 06:30:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197580.350710; Tue, 28 Sep 2021 06:30:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV6dU-0005Hh-IY; Tue, 28 Sep 2021 06:30:40 +0000
Received: by outflank-mailman (input) for mailman id 197580;
 Tue, 28 Sep 2021 06:30:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WhrI=OS=gmail.com=stefanha@srs-us1.protection.inumbo.net>)
 id 1mV6dS-0005HZ-R4
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 06:30:38 +0000
Received: from mail-pl1-x634.google.com (unknown [2607:f8b0:4864:20::634])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e744136-7d11-4867-a4e8-d0c934905db7;
 Tue, 28 Sep 2021 06:30:38 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id j15so12035165plh.7
 for <xen-devel@lists.xenproject.org>; Mon, 27 Sep 2021 23:30:37 -0700 (PDT)
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
X-Inumbo-ID: 0e744136-7d11-4867-a4e8-d0c934905db7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7paCFUAiHOVANRBvVJ8Dzn9prsSI+D+TV8goUlnl8H0=;
        b=cqmEXjJ/pN29AERRFrZmGjvummNeZ2WhXHeKAcWY2J19ZE+1YeSPmMosWZ6/e83Pna
         p/SirQxGH1imDUljaWzxlNR1+ULAluNEJ6TRA/+vEvLBV66NnyzOvjfaElD0P49Bcg8h
         csoy0y5zArd1+WWpX/ScKA5ZpYjVrFuTVnOCL32vHKMeMkkmGIkVYJZAVCx8urQ7x90/
         dSrGjoZAkbWSIzojIFqwdqauHqbNLft4sKWBE0eeZUso0P63OfGejQLlL+9+x++qruYC
         1qBgXEX0QrswomEIX95j6xWdmUUyDQRHp163ti376VGPQ8kUzV36z3SB04kPNgt9N20t
         lSzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7paCFUAiHOVANRBvVJ8Dzn9prsSI+D+TV8goUlnl8H0=;
        b=j7qmHRubJoWQxOaEJjd4/S6MeLQ8Zg931KfAcuqTpgXWElvvy4HKomUu1uq6Xl5sil
         XhbWBsinj/1Ut2Lz3oSn2qwtryxxpDL2gf3xiBmdBnKBUb8Ua39P3X91+7kCMd45ouov
         b7rYjdlnRHHl1QoSY6+ltEu/bNbLPg1266IprHG8uIvfxSCW4aZhXru6tn3stJzYr1Ez
         Wod1vmKKdJvcVQkRHdwGiRNGDIfcofOSVkNZkmXrCzHISg8cAxLBeOqsQliGOHleETDJ
         64pEQWbADEivI9Vx11EAkrz19PXg/W+G79DKOx91l7SbsIMrH+UXlAqF/67ZnrzKiGLE
         DpBA==
X-Gm-Message-State: AOAM533jJHyMd/VKji2jGMG9Iq7cAgDICaGZvBPToMyhH5lqXMm2VC3J
	cH/rbhus5trDQjY65uM6qcqaJNdA26DAznnRx3k=
X-Google-Smtp-Source: ABdhPJyTsxEYyKeFE9bsfXTF/sDV2g/48iIyKGGYqy5xpl0rYR45zmt9OenEsDfV18jz5KNyTnitE3scwpJtxTU6tRE=
X-Received: by 2002:a17:902:dac2:b0:13d:1db4:dcc2 with SMTP id
 q2-20020a170902dac200b0013d1db4dcc2mr3537039plx.77.1632810637182; Mon, 27 Sep
 2021 23:30:37 -0700 (PDT)
MIME-Version: 1.0
References: <87pmsylywy.fsf@linaro.org> <YU5mW396S04IsCBr@mail-itl>
 <874ka68h96.fsf@linaro.org> <CACMJ4GbgnQVQbH1N3Duxmx10n-Qv+zzncqarNyuhmKhE-wqdqA@mail.gmail.com>
In-Reply-To: <CACMJ4GbgnQVQbH1N3Duxmx10n-Qv+zzncqarNyuhmKhE-wqdqA@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 28 Sep 2021 08:30:26 +0200
Message-ID: <CAJSP0QW-CqiUwzzoaoBHXs+xWObFbRduPvPeugjoCN2vb40Ohg@mail.gmail.com>
Subject: Re: [Stratos-dev] Xen Rust VirtIO demos work breakdown for Project Stratos
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Artem Mygaiev <Artem_Mygaiev@epam.com>, Oleksandr Tyshchenko <olekstysh@gmail.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Sergio Lopez <slp@redhat.com>, Wei Liu <wl@xen.org>, 
	Rust-VMM Mailing List <rust-vmm@lists.opendev.org>, Doug Goldstein <cardoe@cardoe.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, 
	Arnd Bergmann <arnd.bergmann@linaro.org>, David Woodhouse <dwmw2@infradead.org>, 
	Stratos Mailing List <stratos-dev@op-lists.linaro.org>, Rich Persaud <persaur@gmail.com>, 
	Daniel Smith <dpsmith@apertussolutions.com>, Paul Durrant <paul@xen.org>, 
	openxt <openxt@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 28, 2021 at 7:55 AM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> On Mon, Sep 27, 2021 at 3:06 AM Alex Benn=C3=A9e via Stratos-dev <stratos=
-dev@op-lists.linaro.org> wrote:
>>
>>
>> Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com> writes=
:
>>
>> > [[PGP Signed Part:Undecided]]
>> > On Fri, Sep 24, 2021 at 05:02:46PM +0100, Alex Benn=C3=A9e wrote:
>> > That is a significant regression in terms of security model Xen
>> > provides. It would give the backend domain _a lot more_ control over t=
he
>> > system that it normally has with Xen PV drivers - negating significant
>> > part of security benefits of using driver domains.
>>
>> It's part of the continual trade off between security and speed. For
>> things like block and network backends there is a penalty if data has to
>> be bounce buffered before it ends up in the guest address space.
>
>
> I think we have significant flexibility in being able to modify several l=
ayers of the stack here to make this efficient, and it would be beneficial =
to avoid bounce buffering if possible without sacrificing the ability to en=
force isolation. I wonder if there's a viable approach possible with some i=
mplementation of a virtual IOMMU (which enforces access control) that would=
 allow a backend to commission I/O on a physical device on behalf of a gues=
t, where the data buffers do not need to be mapped into the backend and so =
avoid the need for a bounce?

This may not require much modification for Linux guest drivers.
Although the VIRTIO drivers traditionally assumed devices can DMA to
any memory location, there are already constraints in other situations
like Confidential Computing, where swiotlb is used for bounce
buffering.

Stefan

