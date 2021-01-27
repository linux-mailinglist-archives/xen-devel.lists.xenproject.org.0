Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5DA3065E9
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 22:25:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76462.138009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4sJO-0007C5-H5; Wed, 27 Jan 2021 21:25:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76462.138009; Wed, 27 Jan 2021 21:25:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4sJO-0007Bg-Da; Wed, 27 Jan 2021 21:25:14 +0000
Received: by outflank-mailman (input) for mailman id 76462;
 Wed, 27 Jan 2021 21:25:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cJtY=G6=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1l4sJN-0007Bb-C9
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 21:25:13 +0000
Received: from mail-ed1-x52b.google.com (unknown [2a00:1450:4864:20::52b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b780cc79-877b-4770-9b29-a31728059831;
 Wed, 27 Jan 2021 21:25:12 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id g1so4224594edu.4
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jan 2021 13:25:12 -0800 (PST)
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
X-Inumbo-ID: b780cc79-877b-4770-9b29-a31728059831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L2QfXbp79y2KmkmXNbfilSxUaBTfl4VutcN4nwMk9Z0=;
        b=Xo4kNCyLFqWNP/8zEG0SPcXWiTqRpbUiQBmKVsdgteS16bi6ukqBGyVCwexeNn85Ye
         NczujUJFmO+ZX65n/DgNUIAZEVag/TTIRzgrBI+fwNaPGX+ECE/R47etX5+9iibezAb2
         vDHXgf0Rs0roRELTuc4BgbRZSv6q9qbOB2HtRtGUgHF+zYZB608DHAWczxd3PahK2Svr
         yz3UZRFnjZm6jrXPybflvBXQ/DYEMoFx/d/U6qNvhOYzXV04O7H9ozIdu/6Hozlbuhls
         Al4UN1sg5llTiuyO70BBq/QmoKUzwDv0uK+Aw+pOJDAW+T/4QogbUSDYfvAr+CYbopgJ
         5+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L2QfXbp79y2KmkmXNbfilSxUaBTfl4VutcN4nwMk9Z0=;
        b=NxbQf95hbQoIvxB30FQv/1l8lO6a2e6Vv3wbf3ZGaTQxKwbG6lSb5+049SliJzYBZd
         C8iD+y9CN2T1Ei+azOQtbfghV0dBrj77Vnw6Q4pi9KPs7uLbz4/uSsvGHOr+sCMYf17Q
         WZ6TQcQC6E/xjeLGU92pUHqPJzfrkEh7h1q/8HxLxTQ7k8dvSziy5LEWHOO1XmyM8Kd/
         AJLCHAYDnQRXB3osGIWg4wt7eXMhlNXMb27lG0NO7CGOTLPkrBVRHyiyUe1KeSDVCZgm
         Idp/imDwH/Q3JI8AXZhwli6ZqLzqnNViLW91I5gJ/rTbWruC5CS0OEGDYugMrOsN8hIl
         VYiw==
X-Gm-Message-State: AOAM531uZluP0YnptXsKmtgFfLbpBqDuxYVRPOhNx7v5N+9z2qle+mvQ
	s3pZiD6zr6IIS8xrO4Judz1iwhDPR51TPFLBcoo=
X-Google-Smtp-Source: ABdhPJxr5XmTBWz/B/9JAAfTbczeSqN3kxgoIOYRHm94dunv6YJJ2JKB8CP/QFBShf3yqEgvJd+upxxecqdPqA6QiiE=
X-Received: by 2002:a50:bc15:: with SMTP id j21mr10714875edh.187.1611782711830;
 Wed, 27 Jan 2021 13:25:11 -0800 (PST)
MIME-Version: 1.0
References: <alpine.DEB.2.21.2101271311470.9684@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2101271311470.9684@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Wed, 27 Jan 2021 21:25:00 +0000
Message-ID: <CAJ=z9a1_33h+jQrtoWnpH7hhkYjHaKLrh+s-5H+W0r1R=jWO8Q@mail.gmail.com>
Subject: Re: more randconfig failures
To: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	Rahul Singh <rahul.singh@arm.com>
Cc: Doug Goldstein <cardoe@cardoe.com>, "fam@euphon.net" <fam@euphon.net>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, famzheng@amazon.com, Wei Liu <wl@xen.org>, 
	Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, 27 Jan 2021 at 21:16, Stefano Stabellini <sstabellini@kernel.org> wrote:
>
> Hi all,
>
> These are two recent randconfig build failures reported by gitlab (the
> two patches that triggered the CI-loop are two patches to the
> MAINTAINERS file -- certainly not the cause of the build issues):
>
> x86 randconfig failure:
> https://gitlab.com/xen-project/patchew/xen/-/jobs/990347647
>
> arm randconfig failure:
> https://gitlab.com/xen-project/patchew/xen/-/jobs/990335472

make[5]: Leaving directory '/builds/xen-project/patchew/xen/xen/common/libfdt'
smmu-v3.c: In function 'acpi_smmu_get_options':
smmu-v3.c:3017:7: error: 'ACPI_IORT_SMMU_V3_CAVIUM_CN99XX' undeclared
(first use in this function)
 3017 |  case ACPI_IORT_SMMU_V3_CAVIUM_CN99XX:
      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
smmu-v3.c:3017:7: note: each undeclared identifier is reported only
once for each function it appears in
smmu-v3.c:3020:7: error: 'ACPI_IORT_SMMU_V3_HISILICON_HI161X'
undeclared (first use in this function)
 3020 |  case ACPI_IORT_SMMU_V3_HISILICON_HI161X:
      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  INIT_O  efi-dom0.init.o
smmu-v3.c: In function 'arm_smmu_device_acpi_probe':
smmu-v3.c:3035:36: error: implicit declaration of function
'dev_get_platdata' [-Werror=implicit-function-declaration]
 3035 |  node = *(struct acpi_iort_node **)dev_get_platdata(dev);
      |                                    ^~~~~~~~~~~~~~~~
smmu-v3.c:3035:36: error: nested extern declaration of
'dev_get_platdata' [-Werror=nested-externs]
smmu-v3.c:3035:10: error: cast to pointer from integer of different
size [-Werror=int-to-pointer-cast]
 3035 |  node = *(struct acpi_iort_node **)dev_get_platdata(dev);
      |          ^
ld    -EL  -r -o built_in.o memcpy.o memcmp.o memmove.o memset.o
memchr.o clear_page.o bitops.o find_next_bit.o strchr.o strcmp.o
strlen.o strncmp.o strnlen.o strrchr.o
cc1: all warnings being treated as errors

It looks like the SMMUv3 driver has not been built tested with
CONFIG_ACPI=y.  Bertrand, Rahul, can you take a look?

Cheers,

