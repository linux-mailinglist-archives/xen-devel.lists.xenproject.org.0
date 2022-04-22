Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B65950B988
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 16:09:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310965.527951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhtyQ-000214-U5; Fri, 22 Apr 2022 14:09:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310965.527951; Fri, 22 Apr 2022 14:09:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhtyQ-0001yK-Pt; Fri, 22 Apr 2022 14:09:26 +0000
Received: by outflank-mailman (input) for mailman id 310965;
 Fri, 22 Apr 2022 14:09:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xOna=VA=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1nhtyP-0001y5-SU
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 14:09:25 +0000
Received: from MTA-07-4.privateemail.com (mta-07-4.privateemail.com
 [68.65.122.27]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf8aac34-c245-11ec-8fc2-03012f2f19d4;
 Fri, 22 Apr 2022 16:09:24 +0200 (CEST)
Received: from mta-07.privateemail.com (localhost [127.0.0.1])
 by mta-07.privateemail.com (Postfix) with ESMTP id DAF8C18000AF
 for <xen-devel@lists.xenproject.org>; Fri, 22 Apr 2022 10:09:22 -0400 (EDT)
Received: from mail-ot1-f43.google.com (unknown [10.20.151.169])
 by mta-07.privateemail.com (Postfix) with ESMTPA id C041A18000B0
 for <xen-devel@lists.xenproject.org>; Fri, 22 Apr 2022 10:09:22 -0400 (EDT)
Received: by mail-ot1-f43.google.com with SMTP id
 w27-20020a056830061b00b00604cde931a0so5557586oti.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 Apr 2022 07:09:22 -0700 (PDT)
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
X-Inumbo-ID: cf8aac34-c245-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1650636562;
	bh=2eXVCjwgHglJAz5KN98RN6CFN4kBTy/rUtR5rB7L1Vw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Lpn++jEkxaZ4SyiZFVIJH825XZWNEdCBRrxnWLj2JY9oXqWqR352vTySEGeylHVHI
	 iHQ13L/HbMwkLdUZPVdZnxJlBdsTQNBDZpHboBuoYbRCGBoJxSpn6KcK0CEeIGDqI7
	 npli0fm1lP96myX8GtJx4VZvdNjB+JQuzwAEacDvlcQ/Ji2r7oE1W94BofEeG5RPwA
	 /a+6ZSfSYKRFpQRdmNtfUnMLqZwrfyKSKB9pQaq2JARy0bM8f5245yQ173wgBU7xQS
	 46VgaaMlfPqITBBAjVPKflzwjBXCd1g3N629Sh5jPavvnQGL1YmmFjoTKy/Aqxkkxj
	 +OQ5No6lUZH8g==
X-Gm-Message-State: AOAM531+dBaNDiBZwnqJ1WTn8Gd+b7tLHbyjre8oyquELOG1TFo23RIO
	CAP0oXrrM+oftliQHDqA0U5glUGi13BzIRnJyAU=
X-Google-Smtp-Source: ABdhPJzqIc/S0MYgJUnayLLT9ALrEp7pr3wFMABs5TcYLfcZuukrsBq6mXmVL8EzauubZoin78BlJfYOWp7DHJU5VhQ=
X-Received: by 2002:a05:6830:2b29:b0:605:7cdb:f10b with SMTP id
 l41-20020a0568302b2900b006057cdbf10bmr1763872otv.157.1650636562086; Fri, 22
 Apr 2022 07:09:22 -0700 (PDT)
MIME-Version: 1.0
References: <bc13e07cdb651afc2c8a97dde1be9c2158160307.1649857162.git.tamas.lengyel@intel.com>
 <4b456c15829c11914b698654937c28e313d2d522.1649857162.git.tamas.lengyel@intel.com>
In-Reply-To: <4b456c15829c11914b698654937c28e313d2d522.1649857162.git.tamas.lengyel@intel.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 22 Apr 2022 10:08:45 -0400
X-Gmail-Original-Message-ID: <CABfawhmYsXFofoe9QSrM_FrBcQ7d5VY9XYQQ5mwEvYW1w8Fg3A@mail.gmail.com>
Message-ID: <CABfawhmYsXFofoe9QSrM_FrBcQ7d5VY9XYQQ5mwEvYW1w8Fg3A@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] x86/monitor: Add new monitor event to catch all vmexits
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Wed, Apr 13, 2022 at 9:43 AM Tamas K Lengyel <tamas.lengyel@intel.com> wrote:
>
> Add monitor event that hooks the vmexit handler allowing for both sync and
> async monitoring of events. With async monitoring an event is placed on the
> monitor ring for each exit and the rest of the vmexit handler resumes normally.
> If there are additional monitor events configured those will also place their
> respective events on the monitor ring.
>
> With the sync version an event is placed on the monitor ring but the handler
> does not get resumed, thus the sync version is only useful when the VM is not
> expected to resume normally after the vmexit. Our use-case is primarily with
> the sync version with VM forks where the fork gets reset after sync vmexit
> event, thus the rest of the vmexit handler can be safely skipped. This is
> very useful when we want to avoid Xen crashing the VM under any circumstance,
> for example during fuzzing. Collecting all vmexit information regardless of
> the root cause makes it easier to reason about the state of the VM on the
> monitor side, hence we opt to receive all events, even for external interrupt
> and NMI exits and let the monitor agent decide how to proceed.
>
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> ---
> v4: Minor tweaks and more verbose patch description.
>
> Note: making the sync version resume-friendly is specifically out-of-scope as
> it would require significant rearrangement of the vmexit handler. As this
> feature is not required for our use-case we opt for the version that minimizes
> impact on the existing code.

Patch ping.

