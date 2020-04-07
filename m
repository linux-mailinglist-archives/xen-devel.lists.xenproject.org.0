Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3AA1A173B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 23:12:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLvVj-0002Vx-UR; Tue, 07 Apr 2020 21:11:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8HNH=5X=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1jLvVi-0002Vr-KG
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 21:11:54 +0000
X-Inumbo-ID: 67c1155c-7914-11ea-b4f4-bc764e2007e4
Received: from mail-ot1-x32f.google.com (unknown [2607:f8b0:4864:20::32f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67c1155c-7914-11ea-b4f4-bc764e2007e4;
 Tue, 07 Apr 2020 21:11:53 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id n25so2052715otr.10
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2020 14:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZF78cAxWWyzqoXTU57AUohvpqTrNrT5K78HteKJY98g=;
 b=Abpe3g/XjHufKxAYzAHWMa2yguPVjhOXtPxlarHEZwrc4Ceihfvccx2aYmQCbktruP
 32YSqkqrLSCBy6t7um29EcfPP654DmlBoW6B0zFTAfcy0C+P6mHIL0OBDbykPwe/0bO9
 PEOyesXhHpMO36MaOSp99yE3Nu8d1fkFRxV50RmUL8S0Ve++VCylWKGQESECLF//E5dE
 JCLht8f16xE3mgOqfCgR+h4Icg1W/GsNlbkQGlmTism8/1q85iwjLf/Nk9kjbWhDbqoR
 mkYPUlkUNXGhajvbmJE+meWbMxx/xmumuMuSAKA1pvThyVBRp2+6jgdlnKBjMrh2BGiw
 X3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZF78cAxWWyzqoXTU57AUohvpqTrNrT5K78HteKJY98g=;
 b=oos1x8nptau3M6rpbBxrKZX64Rg4FOhfrHDW8MPPUzi3F81Wj84oVF7qoqGrXafZIz
 67LpO+dWF8jWQcW0Z7mXM9vKyjJgJGwAnFvI4g+HWALRNx5DwS/zi5QEok8BlF7pqvtr
 d3mqG95DFlFhj/97j4+RtYsoHp/7m2FqZ6tUnyVZRc+O8E1x+/ReYFjnzbJEDmDrb6ss
 ZmHY9yYPYLHbNtEuBpGx3/BOnRkKr7OPaGKg78KMRNCO6Sw6xl3feZqlaAR3QyRjwHQv
 F7YQ6Vn7KKbUn3GLesumXs2MRUMY3zVCc7l170SuKU5VOW4oDCavmNPGYMkF3CKtZTOI
 C9Sg==
X-Gm-Message-State: AGi0Pub6mrNl8qKzSvaIDKVODbWvaqCzZjaihQhq0VluhJwFam4jYrlw
 VIDPXek4S09srLE7Qv6hwuYFyefRUREUY9oiVorNgjc3Ejw=
X-Google-Smtp-Source: APiQypK8p6e6oM4bpyu/uq9uLFkMMODhc7LrF7Sg8rUqfqaF21YfXZCCzSxtcqu/buWJ1G7TPmlNVgUf2sPmml9fEKo=
X-Received: by 2002:a05:6830:11d5:: with SMTP id
 v21mr3289337otq.91.1586293913150; 
 Tue, 07 Apr 2020 14:11:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200407152237.1468704-1-anthony.perard@citrix.com>
In-Reply-To: <20200407152237.1468704-1-anthony.perard@citrix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Apr 2020 22:11:42 +0100
Message-ID: <CAFEAcA_q7hN90Y4FgnmzJvvc=pmyb-Fi-zCHz-Z7phu1KOsW=w@mail.gmail.com>
Subject: Re: [PULL 0/3] xen queue for 5.0
To: Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "open list:X86" <xen-devel@lists.xenproject.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 7 Apr 2020 at 16:22, Anthony PERARD <anthony.perard@citrix.com> wrote:
>
> The following changes since commit 8f0d25c464a1989d606f7b988d07b1147dfcde33:
>
>   Merge remote-tracking branch 'remotes/philmd-gitlab/tags/acceptance-fixes-20200407' into staging (2020-04-07 15:10:11 +0100)
>
> are available in the Git repository at:
>
>   https://xenbits.xen.org/git-http/people/aperard/qemu-dm.git tags/pull-xen-20200407
>
> for you to fetch changes up to 758af9cfabfb000eb00e42b9738e655b18fdd812:
>
>   MAINTAINERS: Add xen-usb.c to Xen section (2020-04-07 16:13:26 +0100)
>
> ----------------------------------------------------------------
> Xen queue for QEMU 5.0
>
> - Fix for xen-block.
> - A fix for a Coverity false positive in xen-usb.
> - Update MAINTAINERS to add xen-usb.c to Xen section.
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

