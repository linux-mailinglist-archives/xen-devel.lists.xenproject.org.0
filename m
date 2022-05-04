Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8375F51A07F
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 15:13:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320728.541606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmEoo-0002cH-I0; Wed, 04 May 2022 13:13:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320728.541606; Wed, 04 May 2022 13:13:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmEoo-0002Zb-DW; Wed, 04 May 2022 13:13:26 +0000
Received: by outflank-mailman (input) for mailman id 320728;
 Wed, 04 May 2022 13:13:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YDN0=VM=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1nmEom-0002ZT-AO
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 13:13:24 +0000
Received: from MTA-10-4.privateemail.com (mta-10-4.privateemail.com
 [198.54.122.149]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8c4e847-cbab-11ec-a406-831a346695d4;
 Wed, 04 May 2022 15:13:23 +0200 (CEST)
Received: from mta-10.privateemail.com (localhost [127.0.0.1])
 by mta-10.privateemail.com (Postfix) with ESMTP id CC525180020A
 for <xen-devel@lists.xenproject.org>; Wed,  4 May 2022 09:13:20 -0400 (EDT)
Received: from mail-oi1-f180.google.com (unknown [10.20.151.157])
 by mta-10.privateemail.com (Postfix) with ESMTPA id A5E1B18000BE
 for <xen-devel@lists.xenproject.org>; Wed,  4 May 2022 09:13:20 -0400 (EDT)
Received: by mail-oi1-f180.google.com with SMTP id e189so1113399oia.8
 for <xen-devel@lists.xenproject.org>; Wed, 04 May 2022 06:13:20 -0700 (PDT)
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
X-Inumbo-ID: f8c4e847-cbab-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1651670000;
	bh=KClxr9FPaKgZE6KxjQcm7KgpN2gKPuncy9nYaqWpkQY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f75Es7b6xuG2+AFq5SGj5X33iRV1uqYqWfSB6+Uplx0Zw5umuRGeWLVnbHRw77kox
	 VBTaiV559B66BWpMp6j/7V1wLzH9crCl8xRROfCvhfrVgKqKSWqSIfoj7xxk0v5wF9
	 7wE8OhAXboteZyHzDd3wT8SSTZjxbxFEwGb1BE8O9//AZW7uZYnx/ItykbATPvJ3jh
	 ztj+QfUxwu9wwxhKUkBAHwH+akkWyWuag2xojVPYyOJUyh1YS4Kpyb2bCnVH+eEIHZ
	 DtcNN4E+fuTsaIKamNnM1cSdlwviuTQela214j6bxLYHELfdintsrX8nloFHdShA0T
	 pK44hAGfKMuzA==
X-Gm-Message-State: AOAM530b7bHkicBXedH5n/bQ7kK/Mgf+G3ywvb57ygEFhOYJBXGiOlQR
	PUt1kmGDAfZALBbLLKlz6SIY2x01Kg2cp/Voc3M=
X-Google-Smtp-Source: ABdhPJz7H/A8xF27/Ct7j3sc2wBz72O5tpWBNCv4VAQ/Rq+h5NwgbV2piYxP8FkOhHlaGMMMebzOrCBJO13IB2rUGGg=
X-Received: by 2002:a05:6808:302b:b0:2f9:eeef:f03 with SMTP id
 ay43-20020a056808302b00b002f9eeef0f03mr3816600oib.128.1651670000010; Wed, 04
 May 2022 06:13:20 -0700 (PDT)
MIME-Version: 1.0
References: <7f03387eebf9de474f404ef661f80133e3725365.1651073086.git.tamas.lengyel@intel.com>
 <65645a9d2ada525c9ffc07dce594eeff5891b5a7.1651073086.git.tamas.lengyel@intel.com>
In-Reply-To: <65645a9d2ada525c9ffc07dce594eeff5891b5a7.1651073086.git.tamas.lengyel@intel.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 4 May 2022 09:12:44 -0400
X-Gmail-Original-Message-ID: <CABfawhmqnCXBBMsjJ1OUsiZQ2S+bAHXq_cuhi5GqKw8qKMBtGw@mail.gmail.com>
Message-ID: <CABfawhmqnCXBBMsjJ1OUsiZQ2S+bAHXq_cuhi5GqKw8qKMBtGw@mail.gmail.com>
Subject: Re: [PATCH 3/3] x86/monitor: Add new monitor event to catch all vmexits
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

On Wed, Apr 27, 2022 at 11:51 AM Tamas K Lengyel
<tamas.lengyel@intel.com> wrote:
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
> v5: wrap vmexit fields in arch.vmx structures in the public vm_event ABI

Patch ping. Could a toolstack maintainer please take a look at this?
The hypervisor side already has a Reviewed-by.

Thanks,
Tamas

