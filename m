Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A86A71D8E11
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 05:10:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jascz-0008BR-Pj; Tue, 19 May 2020 03:09:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TpIb=7B=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jascx-0008BI-CZ
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 03:09:11 +0000
X-Inumbo-ID: 1bf0357e-997e-11ea-ae69-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1bf0357e-997e-11ea-ae69-bc764e2007e4;
 Tue, 19 May 2020 03:09:10 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id y3so14150987wrt.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 20:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u2EBXx7DlSGXsMywMu3hJISzU5hgPlWEH9dqjMZDjGU=;
 b=W9n9BXw3t6AQK2PYEVetOerPW9kf0cmuLW8j9DKk4oGJAHvN7iMb7rUAbcy2jmCGDX
 7IlhvpE3DZuAsnstOgOtK41jWwaPqvM21JPx8LYbuRCnhhVJRsiLmp9JjefiUaxOEraz
 HLAcDi0YtBiCnmzV5uzqbpP+gaVkRgny6B3RRDWMzpmYKTYLjl1xFDAbSlu67crOGFb8
 cfPB9w9rdTGFvmfHVqa+ckueNin6cqGOQv2RHfkPPTsFnl/EIt8WFuGavT5760HfB8hB
 Kr4oJ0u08VyvG4zNzYENeROLFsrHhggc7oU6vqASU/R67IhxBrGdA9GEzPl53eXYNaPv
 Jfbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u2EBXx7DlSGXsMywMu3hJISzU5hgPlWEH9dqjMZDjGU=;
 b=F0QPucgp2RUtXGmssqSEBYO/R52aKqFZgLOY4y4umuAY4Kzw2ruH23aNdpo7LZMEH5
 N4EV2qn9IPsGkK5mCyapNAJQxdmq9RgI6ih3INcPhDbLh0jr2wI3O3pd6Fu8LwT7LXcJ
 vvzo+ZH7UqQJo1fhyta5iWhkhwVzNGWD6vWYSTpViJZTpc20CZtY7f+CNk6N2a1IaZmj
 /EvnJPNQSu6PcOCIppC+h5UiRR0GXZJRCvkFHe9u2D2hp56Rh8uoO0rjzdQhlNX9E6+Y
 OFRMYjMSewxVjq6PzgsPZQ2SmZ+rWkS/JYbUpNBtYrK46q+/6k3Gvme2L6nA4KzOyYsF
 gvqA==
X-Gm-Message-State: AOAM531vuUp7DH3zxUShCVWrOtlNkowBaOvlMSifpfKMJ2n0/B6uGduU
 p0TMCpDKYQjencPDRqCKJV2hCRRs5JN4ZKcbV2Q=
X-Google-Smtp-Source: ABdhPJzIuz5yE2AFGwwLNyK1jTBd+NcZ4ELuTTRJ1BeOMDyfiiM5/j9a523fdCKWBQWQDBdXEDJA9HPmbbTX+5AW4gs=
X-Received: by 2002:adf:a3c5:: with SMTP id m5mr24539624wrb.390.1589857749732; 
 Mon, 18 May 2020 20:09:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200518113008.15422-1-julien@xen.org>
In-Reply-To: <20200518113008.15422-1-julien@xen.org>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Mon, 18 May 2020 21:08:33 -0600
Message-ID: <CABfawh=-XVaRxQ+WyM9ZV7jO5hEO=jAWa4m=b_1bQ41NgEB-2A@mail.gmail.com>
Subject: Re: [PATCH for-4.14 0/3] Remove the 1GB limitation on Rasberry Pi 4
To: Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, minyard@acm.org,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, roman@zededa.com,
 George Dunlap <george.dunlap@citrix.com>,
 Jeff Kubascik <jeff.kubascik@dornerworks.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, May 18, 2020 at 5:32 AM Julien Grall <julien@xen.org> wrote:
>
> From: Julien Grall <jgrall@amazon.com>
>
> Hi all,
>
> At the moment, a user who wants to boot Xen on the Raspberry Pi 4 can
> only use the first GB of memory.
>
> This is because several devices cannot DMA above 1GB but Xen doesn't
> necessarily allocate memory for Dom0 below 1GB.
>
> This small series is trying to address the problem by allowing a
> platform to restrict where Dom0 banks are allocated.
>
> This is also a candidate for Xen 4.14. Without it, a user will not be
> able to use all the RAM on the Raspberry Pi 4.
>
> This series has only be slighlty tested. I would appreciate more test on
> the Rasbperry Pi 4 to confirm this removing the restriction.

Hi Julien,
could you post a git branch somewhere? I can try this on my rpi4 that
already runs 4.13.

Thanks,
Tamas

