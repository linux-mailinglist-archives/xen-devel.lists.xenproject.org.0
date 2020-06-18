Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 966BA1FF185
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 14:23:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jltYk-00069j-9e; Thu, 18 Jun 2020 12:22:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FPuN=77=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jltYi-00069e-Jz
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 12:22:20 +0000
X-Inumbo-ID: 5a73fa86-b15e-11ea-b7bb-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a73fa86-b15e-11ea-b7bb-bc764e2007e4;
 Thu, 18 Jun 2020 12:22:19 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id q11so5854114wrp.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2020 05:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NkLr5bWTwqZ1psD1HxctrB7WPqTEgw2PgcH6ag0UVxE=;
 b=P0C8R0cYYiUuB0nwpvtuNXPb9/YWUDE81t2J/aZa2eFgdzV6u9TFmPGI5c28F9Un+9
 EYNZiAUbAtrZpnZnQ3/6mtVNH88m+VAvVzlrZhOmQVgYPwfzCP1DiQNtFJcZXGJwf2wU
 MaAAIqwBGI8Z+qu1D+kvSAB+2bfhx6Fqr95FuWz0VwbO1EBM8ohPl2KQmd1VVnqH6IV+
 aTQ98MKRmCHs1H+xZr8t3nYDbiHRMYtP+lZv3ncJoqf7cFtW5pGSwXGEBmmqmkZIfh80
 8OCsVWRVFlRwzuUPoE+GP1aNV1vPSecNUEMh2w1wgXxXNhrfFrB/PFl4dW1BQDSPDtw6
 A7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NkLr5bWTwqZ1psD1HxctrB7WPqTEgw2PgcH6ag0UVxE=;
 b=FVoJPGCa+3e55rOydqtI0AFB3XvOgmq58w1wVlA5b4mEgp6tzrzb9kyH/c+7+/U81A
 I3A31IvvfTbbZskobmWIleh+7I4ZyYr57wXb7r+dF+IHH6hJvEYZWZTGEg3k8qhksy/X
 Fb43zZy+2G76p2kZR6bh1sQ2CvhaQJ9zkk9WEJvI1H64SyWMWqn7uv5aSldOQbST4J/C
 bXXxq84c2sFEzMr3Ec/G0xsJSyBNzTVhYdGR8loXBlIC6eJ9yW4r+RMOXwq/QHl6Fxq8
 d/JHN2MHXUSU3sllKoks4U6lGFzzdtsCUBENKzB8pvBBh5WAKdj/E2DrlBd+sn1exzZ/
 Yijw==
X-Gm-Message-State: AOAM533htgTRcC95bQd6mjS8fPFvf0p4lJUNbd2TYxDUPkQKiSQQc/Xs
 H9UcwK6d+zp6LbGPRDqPWDLFvgIKSLpH1XcGCNo=
X-Google-Smtp-Source: ABdhPJzRhZbnXOowItpqnFl5MQXBbxtVMcMFozsnqb8GQz4eUHEruvH0x8rQpPc/MS6Hx05hwAAwQyv4kvzcQlb6BfI=
X-Received: by 2002:adf:e648:: with SMTP id b8mr4501628wrn.386.1592482938644; 
 Thu, 18 Jun 2020 05:22:18 -0700 (PDT)
MIME-Version: 1.0
References: <3555e16baa9e1909dbefaaab04330694135c9021.1592410065.git.tamas.lengyel@intel.com>
 <d63e00e0-0097-c37e-ba9d-ac9340192dfb@suse.com>
 <20200618094014.GH735@Air-de-Roger>
In-Reply-To: <20200618094014.GH735@Air-de-Roger>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Thu, 18 Jun 2020 06:21:42 -0600
Message-ID: <CABfawhmsBijg=EA2=J3DOTZHByrcOYk5NOQGUrwv24o8nEptTw@mail.gmail.com>
Subject: Re: [PATCH v2 for-4.14] x86/vmx: use P2M_ALLOC in vmx_load_pdptrs
 instead of P2M_UNSHARE
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jun 18, 2020 at 3:42 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> On Thu, Jun 18, 2020 at 08:30:08AM +0200, Jan Beulich wrote:
> > On 17.06.2020 18:19, Tamas K Lengyel wrote:
> > > While forking VMs running a small RTOS system (Zephyr) a Xen crash ha=
s been
> > > observed due to a mm-lock order violation while copying the HVM CPU c=
ontext
> > > from the parent. This issue has been identified to be due to
> > > hap_update_paging_modes first getting a lock on the gfn using get_gfn=
. This
> > > call also creates a shared entry in the fork's memory map for the cr3=
 gfn. The
> > > function later calls hap_update_cr3 while holding the paging_lock, wh=
ich
> > > results in the lock-order violation in vmx_load_pdptrs when it tries =
to unshare
> > > the above entry when it grabs the page with the P2M_UNSHARE flag set.
> > >
> > > Since vmx_load_pdptrs only reads from the page its usage of P2M_UNSHA=
RE was
> > > unnecessary to start with. Using P2M_ALLOC is the appropriate flag to=
 ensure
> > > the p2m is properly populated and to avoid the lock-order violation w=
e
> > > observed.
> >
> > Using P2M_ALLOC is not going to address the original problem though
> > afaict: You may hit the mem_sharing_fork_page() path that way, and
> > via nominate_page() =3D> __grab_shared_page() =3D> mem_sharing_page_loc=
k()
> > you'd run into a lock order violation again.
>
> Well, I guess Tamas avoids this because of the get_gfn call in
> hap_update_paging_modes will have already populated the entry, so it's
> never going to hit the p2m_is_hole check in __get_gfn_type_access.
>
> > The change is an improvement, so I'd be fine with it going in this
> > way, but only as long as the description mentions that there's still
> > an open issue here (which may be non-trivial to address). Or perhaps
> > combining with your v1 change is the way to go (for now or even
> > permanently)?
>
> If vmx_load_pdptrs only requires P2M_ALLOC then this is already
> covered by the call to get_gfn performed in hap_update_paging_modes,
> so I don't think there's much point in merging with v1, as forcing
> hap_update_paging_modes to unshare the entry won't affect
> vmx_load_pdptrs anymore.
>
> I'm however worried about other code paths that can call into
> vmx_load_pdptrs with mm locks taken, and I agree it would be safer to
> assert that all the higher layers make sure the cr3 loaded is
> correctly populated for a query without P2M_ALLOC to succeed.

Using P2M_ALLOC is always safe if 1) the entry is already populated
like in this case but also in 2) in case the gfn is a hole and gets
forked. In mem_sharing the paging lock order is only applicable when
an already present entry is getting converted to a shared type or a
shared typed is getting unshared. It does not apply when a hole is
being plugged. So this is safe in other paths as well where the entry
is not yet present.

Tamas

