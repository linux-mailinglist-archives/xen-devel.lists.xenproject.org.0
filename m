Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92146194B39
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 23:06:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHabH-00070d-40; Thu, 26 Mar 2020 22:03:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wygb=5L=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1jHabE-00070Y-Ug
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 22:03:40 +0000
X-Inumbo-ID: a694f782-6fad-11ea-b34e-bc764e2007e4
Received: from mail-qt1-x844.google.com (unknown [2607:f8b0:4864:20::844])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a694f782-6fad-11ea-b34e-bc764e2007e4;
 Thu, 26 Mar 2020 22:03:40 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id t17so6943085qtn.12
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2020 15:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2ATbTVRNh9gXaku7ZuM3hIYbGx3eiFFd9YLrTG2izHs=;
 b=FRT1gAJc/5akzs10IOgcFJjyKYpFb7tZ9wcz/Iqhgab3L/0VgtEQnd24bq7hrcskPA
 hnNTUY5MJR9RCTdnhtzzgRAZqNIXL9ypVc08vUaAEo/G14XpX+ufLjJXH3jt0R3+Bvrx
 D6j/0VG1RIaGe0HpBNa6EKqFP9OuebqEo9TcOzxwwqT8Xw+jMuefM4G46N8qj4/9mZUR
 uPnDXWnvnw7TG9m7APWlaqN/y/srtF53WkwNNRdqE21bhZ3vm42VQWaOLMnZpfQtXqo1
 cO4qJ9/Uc943hkfqzSEQwiIP67g9ebVzz00z3PZHadZY45t0YJOf0n1jnVEsXZlhjNzU
 fu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2ATbTVRNh9gXaku7ZuM3hIYbGx3eiFFd9YLrTG2izHs=;
 b=pqWz4M6PkoaPsWC14roYC1cPHiMYNYvwWOekhAt8ORir3Filj2IVq/81q+kbI7ZAdD
 J496+PNcQgUXpkHPXJFI28mnF77ND4m0AlKCYajhUdv9HYU/mh0JHrPzV8hQGg2RVd3y
 uCBrLtDnXLaa5nDD8w8dT47VtVw7HFRz7byQSMwCVKAmM4lUJrR6nWq0fJDs4GqCTmpx
 2IkL6CeAiDfaIgeNG1VdpzrIuyhtcWjORCBddL5bHBWOkRgKkWEMGmIN5VUyLrSEKE4q
 ybl4ZFIkz9x0Cl4/k2e+IqUpeBf4B9jxm6bxtxXj5bBPkcBjksb1ffJRDWQv6WaSxu7A
 zvYQ==
X-Gm-Message-State: ANhLgQ0tEQxVs6BrzFV+0sUQ2SbGSm2Z2m+E3d3DAI66T8IWwSRIVOXe
 josqweo36+ZMNT1g31Eb/rtKPD6dNa+RFCi4mR9Djg==
X-Google-Smtp-Source: ADFU+vvbQAJRnIofmi2uz38wx7ProZNxRPYc/6gP6ajugdFFiY2GvUzStv4GndA38tUoaBe+qA6gXegnFQyMsQiivj0=
X-Received: by 2002:ac8:41cd:: with SMTP id o13mr11147788qtm.266.1585260219884; 
 Thu, 26 Mar 2020 15:03:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy861_4VXrpC1S0LU8M7ut3ZWErtjqT2vvx8nqnHkrXmYQ@mail.gmail.com>
 <20200325110533.GC28601@Air-de-Roger>
In-Reply-To: <20200325110533.GC28601@Air-de-Roger>
From: Roman Shaposhnik <roman@zededa.com>
Date: Thu, 26 Mar 2020 15:03:28 -0700
Message-ID: <CAMmSBy_oX34t5388xYUxUE_jE56bpy=wKAfujZvR1-zaehDs3g@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] PCIe IOMMU ACS support
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Mar 25, 2020 at 4:05 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> Adding the PCI and IOMMU maintainers.
>
> On Mon, Mar 23, 2020 at 01:55:01PM -0700, Roman Shaposhnik wrote:
> > Hi!
> >
> > I was going through how Xen support PCIe IOMMU ACS and
> > all I could find is this:
> >     https://github.com/xen-project/xen/blob/master/xen/drivers/passthro=
ugh/pci.c#L608
> > which looks to me as an attempt of enabling ACS opportunistically,
> > but still proceeding forward even if it fails.
>
> That's correct AFAICT. Xen will try to enable some features, but will
> proceed normally if ACS is not available, or if some of the features
> are not implemented.
>
> Are you looking to ensure that all devices on the system have a
> certain feature enabled?

My primary objective was to get some visibility into how Xen would
prevent two PCIe devices behind a common bridge from doing p2p
transactions (thus violating VM boundaries if those devices are
assigned to different domains).

It looks like Xen simply trusts the hardware.

> Can you provide some more details about what you expect of ACS
> handling?

I was actually surprised not to see IOMMU groups in the style of what
VFIO https://www.kernel.org/doc/Documentation/vfio.txt

Thanks,
Roman.

