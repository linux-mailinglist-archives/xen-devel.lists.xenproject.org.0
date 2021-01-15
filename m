Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1812F7CE2
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 14:40:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68118.121867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0PKq-0004nA-UT; Fri, 15 Jan 2021 13:40:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68118.121867; Fri, 15 Jan 2021 13:40:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0PKq-0004ml-RH; Fri, 15 Jan 2021 13:40:16 +0000
Received: by outflank-mailman (input) for mailman id 68118;
 Fri, 15 Jan 2021 13:40:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zoJO=GS=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1l0PKp-0004mg-1U
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 13:40:15 +0000
Received: from mail-lf1-x130.google.com (unknown [2a00:1450:4864:20::130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e0eb8e1b-65ca-4d24-91d3-6f868c012c5f;
 Fri, 15 Jan 2021 13:40:14 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id o17so13186997lfg.4
 for <xen-devel@lists.xenproject.org>; Fri, 15 Jan 2021 05:40:13 -0800 (PST)
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
X-Inumbo-ID: e0eb8e1b-65ca-4d24-91d3-6f868c012c5f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nD1xq7BxfbRlevjRRnxl34IKRFBLoVKY5Ub5r6yTzTw=;
        b=nIX8g7LhWXdhbCMNmqZjj2bQ1CRpavKlDtfGdAhpxlFSW4Z3TTbCnajONpDVJ0MWhW
         itWs1+wIgbEe6A/0ss+dlC1VXzPGtPwXEZvE9oUv/YbUAYLRsVtGp3RKD+LQ7uGbnYrL
         5yhzKIE9B+WLwnnGZJQwQTt7Y+vM+DGvAercyMprDmrU2zVajFsIZiULGY3mKKFgsmW1
         MJikLlaLtPaZukcWO+m5g8z6tRbF8/1Or9mrYWstFwQmIz+3V8W2ier44z+n3UNPvSki
         qMBif8B3mxo5q4miYOwTtSg8e5z6yrgq6Pf8Px5lNr3PHCSmS2D8t6W21cJg5OijCyT1
         mVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nD1xq7BxfbRlevjRRnxl34IKRFBLoVKY5Ub5r6yTzTw=;
        b=Gx/nOH9EG5iwcAcBze37S2hsN5Dlhz6EnIx0UuxOuaGTVhdM+6vQ3coA0ocKAIZ0Hf
         VhNnIPzX8gmFera+oWoYmbn9pqlXVRuRJtq3wrzCaVnDIRQ+OfqcZ9GQoOzsBpRcl+1M
         l9NTUjcN7kY0/+eEHxpAp297njNpY4vDLSjM4xDkrxWEYYHzHIgJpVYdr5hvQae5u2FV
         986tztezhDFADl4THgWY7VNNG76gIUS0hJpHJViCpiOubrjtkDs+Xp6cjm8IQFIoS//k
         9mouVJ74UP8oE0E/kqpyMOb1d5mptUqr1cXI3ziWXTU3b7n460wyMWLzvWMoQH27x6pu
         NVUA==
X-Gm-Message-State: AOAM531tEoZRu7hs7jXwlGjo+Mx8GJPb52T2APqwMoIQ0fiw/Buh3p/O
	xoyjiaSbiqfTDheXylm6FJG1OR9/ubfQcwCy8QQ=
X-Google-Smtp-Source: ABdhPJw2saOB81+yBk1xqGriZw7pSET70rXhL5TYSp2CRsHufqM3smNx68s7Way5cTXkVgcR2PO+UM45xzHSzqeC3yQ=
X-Received: by 2002:a19:675d:: with SMTP id e29mr5190994lfj.491.1610718012821;
 Fri, 15 Jan 2021 05:40:12 -0800 (PST)
MIME-Version: 1.0
References: <20210112173248.28646-1-roger.pau@citrix.com> <MWHPR11MB1886695BC900030C025DD09A8CA90@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210113131100.p5xiyfgtp5s5rktz@Air-de-Roger> <CAKf6xps-GOMSsYzDHf9wgyjDes0X4hnaq9vBsn02rCv-DadW8A@mail.gmail.com>
 <20210113180558.do2xq4iaur6kyuy4@Air-de-Roger> <CAKf6xptFiFdh=Uwbia-6BOpB4_qO7h1PCST4WT-0BXTygssFaA@mail.gmail.com>
 <CAKf6xpuTgdpqBx7AR8QUA8nJgn64X9ttZns2aSEcwjjvzqw_fA@mail.gmail.com> <20210114102205.ferwl6y7idooqy3y@Air-de-Roger>
In-Reply-To: <20210114102205.ferwl6y7idooqy3y@Air-de-Roger>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 15 Jan 2021 08:40:01 -0500
Message-ID: <CAKf6xpt+XA36HUxv_8WZi_2N7gGP4GhG=_X+o-fd4_jVRdezCg@mail.gmail.com>
Subject: Re: [PATCH] x86/dpci: remove the dpci EOI timer
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	Paul Durrant <paul@xen.org>, "Cooper, Andrew" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2021 at 5:22 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> On Wed, Jan 13, 2021 at 04:31:33PM -0500, Jason Andryuk wrote:
> > On Wed, Jan 13, 2021 at 1:34 PM Jason Andryuk <jandryuk@gmail.com> wrot=
e:
> > >
> > > On Wed, Jan 13, 2021 at 1:06 PM Roger Pau Monn=C3=A9 <roger.pau@citri=
x.com> wrote:
> > > >
> > > > On Wed, Jan 13, 2021 at 10:48:52AM -0500, Jason Andryuk wrote:
> >
> > <snip>
> >
> > > > > I have some laptops running OpenXT where the USB controller and N=
IC
> > > > > share an interrupt, and I assign them to different domains.  Qube=
s
> > > > > would hit this as well.
> > > >
> > > > Is there any chance you could try the patch and see if you can hit =
the
> > > > issue it was trying to fix?
> > >
> > > Would testing a backport to 4.12 be useful?  There were some file
> > > renames, but it looks to apply.  The only difference is the 4.12
> > > hvm_pirq_eoi hunk still has `(ent && ent->fields.mask) || `.  Maybe
> > > backport commit eb298f32fac5ac "x86/dpci: EOI interrupt regardless of
> > > its masking status" as well?
>
> Yes, backporting that one should be harmless.
>
> > Ok, I added these two patches to OpenXT with Xen 4.12.
>
> Thanks!
>
> > > Testing staging would take a little longer to make a machine availabl=
e.
> > >
> > > I guess I'd also need to disable MSI for the two devices to ensure
> > > they are both using the GSI?
> >
> > lspci in dom0 shows the USB xhci controller, iwlwifi, and e1000e
> > devices all with IRQ 16 and all with MSI disabled ("MSI: Enabled-").
> > The two linux HVMs run with (PV) linux stubdoms, and the HVM kernels
> > were started with pci=3Dnosmi.  Networking through the iwlwifi device

Jan, the VM kernel command lines had pci=3Dnomsi and the typo was only
in the email.

> > works for that VM while a mouse attached to the xhci controller is
> > also working in the second VM.  Is there something else I should test?
>
> Not really, I think that test should be good enough, the issue is that
> we don't know which OS was seeing the issues noted by Kevin.
>
> To make sure you trigger the right scenario, could you start the
> iwlwifi HVM guest first, and then stress test the network device
> (using iperf for example) while you bring up the second VM that uses
> the xhci device?

I ran `cat /dev/zero | ssh server 'cat > /dev/null'` which generates
~1000 interrupts per second.

The second VM starts up ok.  Both are Linux 5.4.x, so not a version
Kevin would have tested :)

Regards,
Jason

