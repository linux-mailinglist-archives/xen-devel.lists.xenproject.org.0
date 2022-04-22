Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A9250B984
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 16:08:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310960.527940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhtxg-0001Qi-Kg; Fri, 22 Apr 2022 14:08:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310960.527940; Fri, 22 Apr 2022 14:08:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhtxg-0001Or-H3; Fri, 22 Apr 2022 14:08:40 +0000
Received: by outflank-mailman (input) for mailman id 310960;
 Fri, 22 Apr 2022 14:08:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xOna=VA=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1nhtxf-0001Of-3n
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 14:08:39 +0000
Received: from MTA-11-3.privateemail.com (mta-11-3.privateemail.com
 [198.54.122.105]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3959133-c245-11ec-a405-831a346695d4;
 Fri, 22 Apr 2022 16:08:37 +0200 (CEST)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
 by mta-11.privateemail.com (Postfix) with ESMTP id B448C18000A8
 for <xen-devel@lists.xenproject.org>; Fri, 22 Apr 2022 10:08:35 -0400 (EDT)
Received: from mail-oa1-f42.google.com (unknown [10.20.151.172])
 by mta-11.privateemail.com (Postfix) with ESMTPA id 8ECD818000A4
 for <xen-devel@lists.xenproject.org>; Fri, 22 Apr 2022 10:08:35 -0400 (EDT)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-e9027efe6aso1415334fac.10
 for <xen-devel@lists.xenproject.org>; Fri, 22 Apr 2022 07:08:35 -0700 (PDT)
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
X-Inumbo-ID: b3959133-c245-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1650636515;
	bh=OMA+z+3k2e//Y/lXEpdmlZ0wVc06E/JWCiNcnB0aSR8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SFC5Vsi22zjX89hNoIXR0SwKcjZ40x8bsJ0sl0XS3sNyXBLQ31fC+N39CPx5LUtDZ
	 NJgaAH+BaymH/AcwkXClefYvAeIZpjuRJwU/DUNrbY7ScaQP6KCKMIxOI4nfJd21ZR
	 O9WwrR5LHegIpCMIKcIptl94i8JBWTEU2IK80+t8BRyb1QvYyBT3tNhGx/RYYs08Wd
	 No9dbl8gLGlomqAgsUyvMTY0PwwSog6NzAgOJGfduMZfg3YXUjBfbv3ImdodKrEBnC
	 pUJAlE/m+BqAOFHZNl8sxUD7uA/447+nx243B1KTUBu80HR0n5jqt62Pq80v7awhnc
	 NgcVCjwJfuYUA==
X-Gm-Message-State: AOAM5314Z4SFTzDoryb1n6vcdwEvSUKFgQ83wK4XEeFJHn+c8k6WJLp9
	+dgmV67ASXHXcpUZlohI71EjbUfsbuXRLpCQMhA=
X-Google-Smtp-Source: ABdhPJwllCKWXdw6Nf+F2hLnA7TAU87HBeVHYEZ4AD5VtaaIfT5MA3s6SMQmj0NMNLAJx1dRBhLDo9xgNRnNBBDCUeg=
X-Received: by 2002:a05:6870:ea8d:b0:e6:135c:1a2e with SMTP id
 s13-20020a056870ea8d00b000e6135c1a2emr6054557oap.9.1650636514944; Fri, 22 Apr
 2022 07:08:34 -0700 (PDT)
MIME-Version: 1.0
References: <bc13e07cdb651afc2c8a97dde1be9c2158160307.1649857162.git.tamas.lengyel@intel.com>
In-Reply-To: <bc13e07cdb651afc2c8a97dde1be9c2158160307.1649857162.git.tamas.lengyel@intel.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 22 Apr 2022 10:07:58 -0400
X-Gmail-Original-Message-ID: <CABfawhki8YVxycv_zdDqDuOYvBdobdskXnjjdjiF7UND3784cg@mail.gmail.com>
Message-ID: <CABfawhki8YVxycv_zdDqDuOYvBdobdskXnjjdjiF7UND3784cg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] x86/mem_sharing: make fork_reset more configurable
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Wed, Apr 13, 2022 at 9:43 AM Tamas K Lengyel <tamas.lengyel@intel.com> wrote:
>
> Allow specify distinct parts of the fork VM to be reset. This is useful when a
> fuzzing operation involves mapping in only a handful of pages that are known
> ahead of time. Throwing these pages away just to be re-copied immediately is
> expensive, thus allowing to specify partial resets can speed things up.
>
> Also allow resetting to be initiated from vm_event responses as an
> optimization.
>
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>

Patch ping. Could I get a Reviewed-by if there are no objections?

Thanks,
Tamas

