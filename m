Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 152524F850B
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 18:32:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300962.513539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncV3G-0006hO-Jm; Thu, 07 Apr 2022 16:32:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300962.513539; Thu, 07 Apr 2022 16:32:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncV3G-0006en-G3; Thu, 07 Apr 2022 16:32:06 +0000
Received: by outflank-mailman (input) for mailman id 300962;
 Thu, 07 Apr 2022 16:32:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yv5T=UR=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ncV3E-0006eh-S9
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 16:32:04 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41bfae7d-b690-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 18:32:03 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id h11so8182018ljb.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Apr 2022 09:32:03 -0700 (PDT)
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
X-Inumbo-ID: 41bfae7d-b690-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6oZEohghZh/tDrW7Cu3Ag2GmsIuQIYAvbXvbKsDroRA=;
        b=JLMM6USeNMgl+jwcgl5Wb2Op0AexP/0LUpGqbQAsqvDvyYQR8e39VL2cIbdZoRWXZd
         6I8eWxdWQhSOMnwrKmWeZJM2kxvr4TSS9iZgw8rMWiFn9/KgkgpXm3EULHn+KeU0E5U7
         w4bHXaA8MKU2503Yt18YSXWsARDb/+xHFeZ6750yNo0SrlyG24OXabTYjdWOoA9NeLd9
         R65sxh1IqIko2lv8G0iZX8ShMzpjZ9mBf6l625YkQW+YbchFPdjUe/BKofSCqBZk4aOg
         1C6tFa0rKDpfOd2Z9hYz4+uDXVMUOpoXKyITXq7a5797b8J4pOzoU3QDaXyANpYIw6mX
         nJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6oZEohghZh/tDrW7Cu3Ag2GmsIuQIYAvbXvbKsDroRA=;
        b=AcfldYKDQs+cpfny/0hT1tIYgbv/y1KtE6+UeeQexUDxKkm/IizKOws8iNd/tMy/ck
         J7r2z8BtpgN2ffqtsdVayJLBu6I6/73bIp3HjQ+xxdSBJf9P9U9j3Br8iH9eZrOMpcqZ
         G+pf+r922nI1hNS7VrCWtNA0a7CFz3s1f2q6DnjGnVNS0P3MHFrvIrSt1TKZCzTQ+t6o
         B4uUkfTT1YU1DmcrWtMiSwmL0IifQ7b4lk/mU0wAHUlgWUS+lW1OQk3kkAhMFEseUfss
         jf2ewgDtS4p39/YCwVebgb2fxzvm1vCxACITmyxaQuQL7nO3PNQn9oO9TvI2inhynzYT
         GBfg==
X-Gm-Message-State: AOAM533HRBAUsrJULqOj3brkggTwLUJz1QA6Al58KsuP1zvnnS7aFTDg
	/9juQ/42VylPfJ6OjxbxIjkafzJvfJvYaplg+Oo=
X-Google-Smtp-Source: ABdhPJxnjCmFa/NbUN2f3fSFbTy7/tVfXqOoAafA9+pQxOGriUiJ/DHCctyqBVRrCzu3Y/f+elu97vNtSHJJui/fVcY=
X-Received: by 2002:a2e:b0c9:0:b0:24a:fb55:8661 with SMTP id
 g9-20020a2eb0c9000000b0024afb558661mr9347577ljl.168.1649349123259; Thu, 07
 Apr 2022 09:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <6e1c7faf-d1ea-1a61-5452-9dec5b8fd221@suse.com>
 <6739cf19-a74a-208d-82e8-28dfde7710f5@suse.com> <Yk6VvXJHWxJZTgeF@Air-de-Roger>
 <15a53720-4dd1-3139-5d78-5b8a5704a953@suse.com>
In-Reply-To: <15a53720-4dd1-3139-5d78-5b8a5704a953@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 7 Apr 2022 12:31:51 -0400
Message-ID: <CAKf6xps+VAvi1QcDGG=mB2pVt3frWFj=6pYrDMVKH+KgE6qaEw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] VT-d: avoid NULL deref on domain_context_mapping_one()
 error paths
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Apr 7, 2022 at 3:50 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 07.04.2022 09:41, Roger Pau Monn=C3=A9 wrote:
> > On Thu, Apr 07, 2022 at 08:11:06AM +0200, Jan Beulich wrote:
> >> First there's a printk() which actually wrongly uses pdev in the first
> >> place: We want to log the coordinates of the (perhaps fake) device
> >> acted upon, which may not be pdev.
> >>
> >> Then it was quite pointless for eb19326a328d ("VT-d: prepare for per-
> >> device quarantine page tables (part I)") to add a domid_t parameter to
> >> domain_context_unmap_one(): It's only used to pass back here via
> >> me_wifi_quirk() -> map_me_phantom_function(). Drop the parameter again=
.
> >>
> >> Finally there's the invocation of domain_context_mapping_one(), which
> >> needs to be passed the correct domain ID. Avoid taking that path when
> >> pdev is NULL and the quarantine state is what would need restoring to.
> >> This means we can't security-support PCI devices with RMRRs (if such
> >> exist in practice) any longer.
> >
> > The sentence:
> >
> > "This means we can't security-support PCI devices with RMRRs"
> >
> > Seems too broad and could lead to confusion. So I would maybe use:
> > "legacy PCI devices" or "non PCI Express devices".
>
> Right. I did actually forget to either drop or edit that sentence. I've
> now extended this to
>
> "This means we can't security-support non-PCI-Express devices with RMRRs
>  (if such exist in practice) any longer; note that as of trhe 1st of the
>  two commits referenced below assigning them to DomU-s is unsupported
>  anyway."

Mentioning "Express" makes the support statement clearer.  However,
I'm not clear on what unsupported means in "assigning them to DomU-s
is unsupported anyway".  They can't be assigned?  I'm testing with
staging-4.16, so with XSA-400, but not this patch.  I seemingly have a
legacy PCI device still being assigned to a domU.

It is an 8th Gen Intel laptop with:
00:14.0 USB controller: Intel Corporation Cannon Point-LP USB 3.1 xHCI
Controller (rev 30) (prog-if 30 [XHCI]).

lspci output for 00:14.0 does *not* have capability "Express (v2)",
but it does have an RMRR:
(XEN) [VT-D]found ACPI_DMAR_RMRR:
(XEN) [VT-D] endpoint: 0000:00:14.0

It looks like it is PCI compared to 39:00.0 which does have Express (v2):
(XEN) [VT-D]d1:PCI: map 0000:00:14.0
(XEN) [VT-D]d1:PCIe: map 0000:39:00.0

As I understand it, an RMRR is common with USB controllers for
implementing legacy mouse & keyboard support.  The Cannon Point PCH is
fairly modern, so I'd expect it to use PCI Express.  Xen seems to
identify it as DEV_TYPE_PCI given "PCI" above.  It is an integrated
PCI device, so it has no upstream bridge.  Maybe that is why it can
still be assigned?  The "unsupported assignment" is a legacy PCI
device, behind a bridge, with an RMRR?

Thanks,
Jason

