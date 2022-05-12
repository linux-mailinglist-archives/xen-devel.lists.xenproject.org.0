Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11051524E9B
	for <lists+xen-devel@lfdr.de>; Thu, 12 May 2022 15:47:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327668.550504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np99U-0003DI-UD; Thu, 12 May 2022 13:46:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327668.550504; Thu, 12 May 2022 13:46:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np99U-0003B6-R4; Thu, 12 May 2022 13:46:48 +0000
Received: by outflank-mailman (input) for mailman id 327668;
 Thu, 12 May 2022 13:46:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KIj3=VU=gmail.com=tamas.k.lengyel@srs-se1.protection.inumbo.net>)
 id 1np99T-0003B0-2Y
 for xen-devel@lists.xenproject.org; Thu, 12 May 2022 13:46:47 +0000
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [2001:4860:4864:20::34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efc8706c-d1f9-11ec-8fc4-03012f2f19d4;
 Thu, 12 May 2022 15:46:35 +0200 (CEST)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-e2fa360f6dso6700675fac.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 May 2022 06:46:45 -0700 (PDT)
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
X-Inumbo-ID: efc8706c-d1f9-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BObhUF4sbYVjHtDgr3XjfW9tIycHPCdCa3lUWOjiOh0=;
        b=kUUwf7kcHwy7WxPQ9OAADFyUnw9uI4EOnQjhxy7fpgGxzHTu/9oaWDopuyvEfLw+Mr
         ZqX8DcBXZ4tVx2nx18Y3ynAa/VysUodxlTow1TeckKVycZEBlTru4eCn4U0apRq2x9Ck
         3NdRSjtWkzt6HbUqbtcQ28tUG5q0T6J06D+2IAb+qRMzMBrFPpSHpIr7kdCoOd1mmRA9
         Fq2tSJEuN1PgWR92uOSdpDtZcsNZzUhoajVOslZSR0bkYf2qefgo2cHmdsAO40/hXOkV
         CeN6AsQAVuYcLJg3GQ7GfNE79kmSDJ7uKAE+rLvEDMC+kmJ2vUlXuszYyCFYZG5BXjX5
         xEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BObhUF4sbYVjHtDgr3XjfW9tIycHPCdCa3lUWOjiOh0=;
        b=wHVLbQnI03OVLSzDgoYy0qBKy1S5/Afgkomkw7K5M5/ufiXSDl43iR37Uikerx0OIR
         GwikFzFhOSC001tU1i5t6APMX3x/may6YMIgIElTEXykaGT+7/FDuaJmXdPfanzzRyrm
         LKT8UYAavXTJAM8s/+8jLtfu5g+3eFD1A8zgeypTiOhRj1AzY87HKh4uWgxim5yESp8H
         Wg3prMMWLwwCn/hB6onUub7sfwneYGj7NVsgx9fRes4qu4HXa6UoJ7yw8jRXyeedLQTr
         WRqis4JsRwWfy2iDYfnatTxilrNu5Xk08gUSCTOMq+/w9sNV9M0zKrlh8yaUYl/7hU/9
         eSVg==
X-Gm-Message-State: AOAM532EEdnTbJHhnbL5xxDFuF5kqCxm+Qw2YCOmZTNT6nGL9FRTaQzL
	9PFsmOmW/gL46tsuJv5UMK2jb6+b/6cMBPy+VRA=
X-Google-Smtp-Source: ABdhPJztdCMCW3M77X0avIJWbQl1kLpCJUVxLMFXsmka+4WbPCyd3agKAYCwi7dTYvpcnDA6MLCOQjARa69YsU1tOD4=
X-Received: by 2002:a05:6870:ea8d:b0:e6:135c:1a2e with SMTP id
 s13-20020a056870ea8d00b000e6135c1a2emr5484345oap.9.1652363204700; Thu, 12 May
 2022 06:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <7f03387eebf9de474f404ef661f80133e3725365.1651073086.git.tamas.lengyel@intel.com>
 <f3fdd4e99892549dc68e7511f2d84f51af446e86.1651073086.git.tamas.lengyel@intel.com>
 <YnOIEb9sNfshZwtZ@Air-de-Roger>
In-Reply-To: <YnOIEb9sNfshZwtZ@Air-de-Roger>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Thu, 12 May 2022 09:46:09 -0400
Message-ID: <CABfawh=WnQtGehg2mX4Lnz9y3AyAnaUjUyc4FNxjGvoc_YcOBg@mail.gmail.com>
Subject: Re: [PATCH 2/3] tools/libxc: change xc_memshr_fork_reset API to match hypervisor
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, xen-devel@lists.xenproject.org, 
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 5, 2022 at 4:27 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com> =
wrote:
>
> On Wed, Apr 27, 2022 at 11:34:19AM -0400, Tamas K Lengyel wrote:
> > Need to separately specify if the reset is for the memory or for the VM=
 state,
> > or both.
> >
> > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
>
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Patch ping. Can this patch be merged please?

Thanks,
Tamas

