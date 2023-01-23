Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D38467759C
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 08:31:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482634.748238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJrHg-0000OJ-AJ; Mon, 23 Jan 2023 07:30:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482634.748238; Mon, 23 Jan 2023 07:30:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJrHg-0000MW-7O; Mon, 23 Jan 2023 07:30:28 +0000
Received: by outflank-mailman (input) for mailman id 482634;
 Mon, 23 Jan 2023 07:30:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vc9q=5U=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1pJrHe-0000MQ-Sf
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 07:30:26 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd316f06-9aef-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 08:30:25 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6832DB80C7B
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jan 2023 07:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B00C4339C
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jan 2023 07:30:23 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id b3so16870693lfv.2
 for <xen-devel@lists.xenproject.org>; Sun, 22 Jan 2023 23:30:22 -0800 (PST)
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
X-Inumbo-ID: cd316f06-9aef-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674459023;
	bh=yqHRmBM/5HKjzaBie8odadDl/b5Q4ya5gnQh2zFliW0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iGq5+eY5tyMw6oahuiHN28IBRDzPcwah1Tj6QMnoc1/Er+SEnF1kUj3FyEewGhNAL
	 2oNaeTuCjq9wQ3S3cN+Qi8Ti9iMARl2TUxhxKLUgDjaq0Ips8RY8Rvz4gPVCo155uX
	 DxdsLaADc4afozv2jPJRMwYKItIWNsUWIoia9NUqTKLnegidJJXvHDXSchAiqXvk5a
	 3tuFLLfahb1o891CjD83Y6UCad/u+SmZyAfnsBOyFjiVOfUMZE39xhev/Zpcjye+ze
	 b09krGV86uoDA0XlqIxHr35Y2sao3CduQgPq6gK6B39SY9wjZbdPIsVbZrDHvqbhvd
	 2eWEn/ASR54ug==
X-Gm-Message-State: AFqh2krzWypcmQDUFe7Oi3g7ZviLvkg5uZwcMuk6/g7Z9FGAf32CLTLU
	h1oDnR8RsGfpooeNGo+O3wt8b16HL9zsrh0S9L8=
X-Google-Smtp-Source: AMrXdXvLGWnD0SLJx80UTiS66Ijd6HhijiZdhKVE7te2RkGIhVL2UPwS2V4brcBlC75bspAFezet9YOtuuT2k/ow/ZA=
X-Received: by 2002:a19:675e:0:b0:4b6:f37c:c123 with SMTP id
 e30-20020a19675e000000b004b6f37cc123mr1643063lfj.539.1674459021083; Sun, 22
 Jan 2023 23:30:21 -0800 (PST)
MIME-Version: 1.0
References: <20221003112625.972646-1-ardb@kernel.org> <b18879e0329c785d35f2aa2164413bb56419c684.1674153153.git.demi@invisiblethingslab.com>
In-Reply-To: <b18879e0329c785d35f2aa2164413bb56419c684.1674153153.git.demi@invisiblethingslab.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 23 Jan 2023 08:30:09 +0100
X-Gmail-Original-Message-ID: <CAMj1kXELH7+d5141yhBudrA0vtOOkCfVucwGBpag9u4mU4Q0iA@mail.gmail.com>
Message-ID: <CAMj1kXELH7+d5141yhBudrA0vtOOkCfVucwGBpag9u4mU4Q0iA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] efi: Support ESRT under Xen
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Jan 2023 at 20:04, Demi Marie Obenour
<demi@invisiblethingslab.com> wrote:
>
> This patch series fixes handling of EFI tables when running under Xen.
> These fixes allow the ESRT to be loaded when running paravirtualized in
> dom0, making the use of EFI capsule updates possible.
>
> Demi Marie Obenour (5):
>   efi: memmap: Disregard bogus entries instead of returning them
>   efi: xen: Implement memory descriptor lookup based on hypercall
>   efi: Apply allowlist to EFI configuration tables when running under
>     Xen
>   efi: Actually enable the ESRT under Xen
>   efi: Warn if trying to reserve memory under Xen
>

I have given these a spin on a system with a dodgy ESRT (the region in
question is not covered by the memory map at all), and things are
exactly as broken before, which is good.

I have queued these up in efi/next now, they should appear in -next tomorrow.


>  drivers/firmware/efi/efi.c  | 22 ++++++++++++-
>  drivers/firmware/efi/esrt.c | 15 +++------
>  drivers/xen/efi.c           | 61 +++++++++++++++++++++++++++++++++++++
>  include/linux/efi.h         |  3 ++
>  4 files changed, 90 insertions(+), 11 deletions(-)
>
> --
> Sincerely,
> Demi Marie Obenour (she/her/hers)
> Invisible Things Lab

