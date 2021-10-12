Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0547A42A51B
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 15:08:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207170.362911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maHVT-0003CK-KT; Tue, 12 Oct 2021 13:07:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207170.362911; Tue, 12 Oct 2021 13:07:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maHVT-00039U-GS; Tue, 12 Oct 2021 13:07:47 +0000
Received: by outflank-mailman (input) for mailman id 207170;
 Tue, 12 Oct 2021 13:07:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/L4W=PA=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1maHVR-00038a-A1
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 13:07:45 +0000
Received: from mail-lf1-x131.google.com (unknown [2a00:1450:4864:20::131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1fa1a7b2-bd31-4b19-ba9a-5178f89003e2;
 Tue, 12 Oct 2021 13:07:44 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id j21so69921848lfe.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Oct 2021 06:07:44 -0700 (PDT)
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
X-Inumbo-ID: 1fa1a7b2-bd31-4b19-ba9a-5178f89003e2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rYG56F/pmgMHv1mArUcA8EEq00+Sgti/K9FJa+oQWXk=;
        b=M9NkcejAIFMD9Vvc5kH26nk2yLKGRqy48zBmflcT4XDcmuPtHMkFigWJykHZGApZMz
         Rttt21COCUYuUewkdNzceE0E1cZRcP/I/h/jk9Z5N0Kt0wxFe62o1brCdWPBjot0/dfh
         HZyA92CLwzWKsdJHcJsJERPPlRLvQrp8cd4+Lonjq8MU/PbI7gg6Mb2+1gF3NqVn10M+
         tCPNLBDxFH6bxB2LOSouw8rn6om3JPZdKlhDfgvQZP8CEDZyrvS3xbSqVzHboJdRATkZ
         +bAaEvn+ifst8AyUGQPhfb5/ntK+cPpCrSs1f6VRJoO7c5PDY0+LL5MqT4R5YeChV07B
         t/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rYG56F/pmgMHv1mArUcA8EEq00+Sgti/K9FJa+oQWXk=;
        b=cLbfozmgJp30mad1hNTRSqE3x+V3WEQJCYLeEo8qAkTt9cuv8U39ZnPLnwlMxsse7G
         7+OiTdooIGMA0TEoQS5rb9PQdWYAU4w4jfiP38wenMVkMQdcRwVlf6IcbutqQTEXm/lu
         2WnOvpjqCagzUQss4GJz82U8P0hWsLil2vHvNZ6+YrPIWrdoYXZhVJPVuO8gaP75HOsi
         xU+Qr6RWbKi8JhQnJjNSmxvr9jQX/dwHswjSn1Hd/gk/nLynecR3kzVw/0Gd4lQFscrE
         1JMsrg6QkrHGt57Pn0ubdws8Dn2E/p/uUrKvqSG30nhI9MaOUP5s+tc3YfIqJnzmUePR
         /6XQ==
X-Gm-Message-State: AOAM530M68rZ1uLqd8yQlj9CwmQPCSpYzbR2NL0lWaMiiqlQyd458gGl
	uRgilveWOv5jsz8lNZgBHu5ntcz1unxUXJ8fyI8=
X-Google-Smtp-Source: ABdhPJz61t07almgu0IAokxTxZ7zlkSBd1avA5oFDY7xmLI1j3ABt4rWihEiEMk01DF+Cr5t5BcjWjuAZsMbGht60Es=
X-Received: by 2002:a2e:89cd:: with SMTP id c13mr28669547ljk.168.1634044063520;
 Tue, 12 Oct 2021 06:07:43 -0700 (PDT)
MIME-Version: 1.0
References: <CALjTZvbzYfBuLB+H=fj2J+9=DxjQ2Uqcy0if_PvmJ-nU-qEgkg@mail.gmail.com>
 <b023adf9-e21c-59ac-de49-57915c8cede8@oderland.se> <c9218eb4-9fc1-28f4-d053-895bab0473d4@oderland.se>
 <ef163327-f965-09f8-4396-2c1c4e689a6d@oderland.se>
In-Reply-To: <ef163327-f965-09f8-4396-2c1c4e689a6d@oderland.se>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 12 Oct 2021 09:07:31 -0400
Message-ID: <CAKf6xpvGyCKVHsvauP54=0j10fxis4XiiqBNWH+1cpkbtt_QJw@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] 5.15-rc1: Broken AHCI on NVIDIA ION (MCP79)
To: Josef Johansson <josef@oderland.se>
Cc: Thomas Gleixner <tglx@linutronix.de>, maz@kernel.org, linux-pci@vger.kernel.org, 
	open list <linux-kernel@vger.kernel.org>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 12, 2021 at 2:09 AM Josef Johansson <josef@oderland.se> wrote:
>
> On 10/11/21 21:34, Josef Johansson wrote:
> > On 10/11/21 20:47, Josef Johansson wrote:
> >> More can be read over at freedesktop:
> >> https://gitlab.freedesktop.org/drm/amd/-/issues/1715

Hi, Josef,

If you compare
commit fcacdfbef5a1633211ebfac1b669a7739f5b553e "PCI/MSI: Provide a
new set of mask and unmask functions"
and
commit 446a98b19fd6da97a1fb148abb1766ad89c9b767 "PCI/MSI: Use new
mask/unmask functions" some of the replacement functions in 446198b1
no longer exit early for the pci_msi_ignore_mask flag.

Josef, I'd recommend you try adding pci_msi_ignore_mask checks to the
new functions in fcacdfbef5a to see if that helps.

There was already a pci_msi_ignore_mask fixup in commit
1a519dc7a73c977547d8b5108d98c6e769c89f4b "PCI/MSI: Skip masking MSI-X
on Xen PV" though the kernel was crashing in that case.

Regards,
Jason

