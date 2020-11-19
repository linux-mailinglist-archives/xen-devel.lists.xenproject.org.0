Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD4F2B9776
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 17:13:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31093.61330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfmYW-0000Pr-Ih; Thu, 19 Nov 2020 16:13:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31093.61330; Thu, 19 Nov 2020 16:13:08 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfmYW-0000PR-FI; Thu, 19 Nov 2020 16:13:08 +0000
Received: by outflank-mailman (input) for mailman id 31093;
 Thu, 19 Nov 2020 16:13:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d/3C=EZ=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kfmYU-0000PI-Ri
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:13:06 +0000
Received: from mail-wm1-x335.google.com (unknown [2a00:1450:4864:20::335])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 940b0d52-f5ec-4d75-96a9-b94c4d500609;
 Thu, 19 Nov 2020 16:13:06 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id p19so6594939wmg.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2020 08:13:06 -0800 (PST)
Received: from CBGR90WXYV0
 (host109-146-187-185.range109-146.btcentralplus.com. [109.146.187.185])
 by smtp.gmail.com with ESMTPSA id d8sm493640wmb.11.2020.11.19.08.13.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Nov 2020 08:13:04 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=d/3C=EZ=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kfmYU-0000PI-Ri
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:13:06 +0000
X-Inumbo-ID: 940b0d52-f5ec-4d75-96a9-b94c4d500609
Received: from mail-wm1-x335.google.com (unknown [2a00:1450:4864:20::335])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 940b0d52-f5ec-4d75-96a9-b94c4d500609;
	Thu, 19 Nov 2020 16:13:06 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id p19so6594939wmg.0
        for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2020 08:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=+xEjrlXEqXr16s5hjRQWV9J4WDJ7kJeluYlT6tOBBkU=;
        b=ixBI+tjmSLW+nJrwJ6Mgnh7hhov8ZKvRdVwDcGIjkZM4rsgMzrT4jL9A4W+zBOl67y
         H8/eMEsbu7UJhAM1vic4LagCCbsrJ5zc18F8UMWk6pAbiHWBSmEvwSsaw+mRCBlXX4hd
         0O0E+60ywoe3LT9z1nI9h7VJyBET0YRKKwKHLz/oCbVjB+9Df+aDP910J1GgT5ktByJS
         lP5vdDIej+20cevLWk3xTMp0dRSxxOC+NtW3DuKeo65V++xDUmL/W7ggl3a7cAES7vQm
         DFFFSVIMKtH0SD32rojoiy3syG0cHE/Nl0gtaNbdJDDZmF6LCoBJUi8I8RBRAiDhj3Ea
         poig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=+xEjrlXEqXr16s5hjRQWV9J4WDJ7kJeluYlT6tOBBkU=;
        b=qQYxSEgQ/DRs0XFFp/tR4tNoJZuAoWQfGrmTyHrzXYCdKImZu/kZ+YjMj+Z7PiaM2t
         Kz+k+2XUzq3D+/kBQZAUVBrkex/eDvviBHmWIohgaWdru5GFbDVrE5cPNuVqdUI3Jhnj
         eU28Zk4lcvdNz1XnIlT9URQvU4BLQq2/zSkSelNasi5IaDUGuowOE0R3fW+bmGIwrjaO
         LC8ZUJKI0vCJMIl2lO1q2Xe21bWqUcJu5irELXiM+kQnW/tedT1C7sk3Nh1WJ+JBOXJI
         hgQLw/RMybE7rtN7/sxTSdXeVKbe+HmGwCvFcVdPGH3tZ+8KHTj8tws7CEc6citXt/4T
         C6NQ==
X-Gm-Message-State: AOAM530f8mAs9lPf3OATHcj/ii5/3sWSR8CeCAnSW0aIE/brnkV37jNE
	bZSzLBuoPHDyV0YQyeqLVQ4=
X-Google-Smtp-Source: ABdhPJy8bm4JCybKxEdjfsIo9CWDm76eB+U9+vgSyzY4GdOx0TZrTHF8ktbKf/9SoR5bVECrelaVqg==
X-Received: by 2002:a1c:1d51:: with SMTP id d78mr5311515wmd.60.1605802385378;
        Thu, 19 Nov 2020 08:13:05 -0800 (PST)
Received: from CBGR90WXYV0 (host109-146-187-185.range109-146.btcentralplus.com. [109.146.187.185])
        by smtp.gmail.com with ESMTPSA id d8sm493640wmb.11.2020.11.19.08.13.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2020 08:13:04 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: "'Paul Durrant'" <pdurrant@amazon.com>,
	"'Wei Liu'" <wl@xen.org>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20201111200721.30551-1-paul@xen.org> <20201111200721.30551-9-paul@xen.org> <c9a9f41a-871c-65c3-74b6-e5063261210b@suse.com>
In-Reply-To: <c9a9f41a-871c-65c3-74b6-e5063261210b@suse.com>
Subject: RE: [PATCH 08/10] viridian: log initial invocation of each type of hypercall
Date: Thu, 19 Nov 2020 16:13:04 -0000
Message-ID: <00cd01d6be8e$dc83d8b0$958b8a10$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIKCyTUSJ7jm2WJ2nMqsy5EhijKogHSIwEYAfICsrypSuYeoA==

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 12 November 2020 09:23
> To: Paul Durrant <paul@xen.org>
> Cc: Paul Durrant <pdurrant@amazon.com>; Wei Liu <wl@xen.org>; Andrew =
Cooper
> <andrew.cooper3@citrix.com>; Roger Pau Monn=C3=A9 =
<roger.pau@citrix.com>; xen-devel@lists.xenproject.org
> Subject: Re: [PATCH 08/10] viridian: log initial invocation of each =
type of hypercall
>=20
> On 11.11.2020 21:07, Paul Durrant wrote:
> > --- a/xen/include/asm-x86/hvm/viridian.h
> > +++ b/xen/include/asm-x86/hvm/viridian.h
> > @@ -59,6 +59,14 @@ struct viridian_domain
> >  {
> >      union hv_guest_os_id guest_os_id;
> >      union hv_vp_assist_page_msr hypercall_gpa;
> > +    unsigned long hypercall_flags;
> > +
> > +#define _HCALL_spin_wait 0
> > +#define _HCALL_flush 1
> > +#define _HCALL_flush_ex 2
> > +#define _HCALL_ipi 3
> > +#define _HCALL_ipi_ex 4
>=20
> I'd like to suggest for this to either be unsigned int until
> more than 32 bits are needed, or be using DECLARE_BITMAP()
> right away.

Ok. I may just go straight for the bitmap then.

  Paul

>=20
> Jan


