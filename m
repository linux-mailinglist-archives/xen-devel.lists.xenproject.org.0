Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AF960BE2A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 01:06:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429441.680407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on6VC-00032A-OL; Mon, 24 Oct 2022 23:05:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429441.680407; Mon, 24 Oct 2022 23:05:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on6VC-0002zl-KJ; Mon, 24 Oct 2022 23:05:02 +0000
Received: by outflank-mailman (input) for mailman id 429441;
 Mon, 24 Oct 2022 23:05:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8/mz=2Z=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1on6VA-0002zf-SQ
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 23:05:01 +0000
Received: from MTA-11-3.privateemail.com (mta-11-3.privateemail.com
 [198.54.122.105]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 466db457-53f0-11ed-8fd0-01056ac49cbb;
 Tue, 25 Oct 2022 01:04:59 +0200 (CEST)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
 by mta-11.privateemail.com (Postfix) with ESMTP id C849018000A4
 for <xen-devel@lists.xenproject.org>; Mon, 24 Oct 2022 19:04:54 -0400 (EDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by mta-11.privateemail.com (Postfix) with ESMTPA id A37C518000A2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Oct 2022 19:04:54 -0400 (EDT)
Received: by mail-yb1-f174.google.com with SMTP id o70so12655113yba.7
 for <xen-devel@lists.xenproject.org>; Mon, 24 Oct 2022 16:04:54 -0700 (PDT)
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
X-Inumbo-ID: 466db457-53f0-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1666652694;
	bh=pC7Rl/r4SDQt5avi2u9wQXNDCm/wER4FHrGcJDmY8Is=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oCTN8UcixYyyRUtFAQs0LK0aD+Liu49tXLU+Cg+WAVC7A/UILwBy/KPBc39LDjchu
	 FgJfEFHmBqK8IkZEktKP3FW+T9awhp5GePkotz4glh+YmjQ+ew9YTSHYxgyD5wWnDx
	 AkRGzekb6Ki10+H1Bf2kMvqAiI0hlvaapgi6ovfHQwlZbsHSnpCNG6N+UTGtD8Zs9Q
	 rVGPt4/Qf8x5NXJoiVBtqa9BW3zba3MhcqRxiZnQDSxG+Jtet4G7NzKZgenHhuFAuq
	 aReDuDPC9trtTPYSMXk0BgKAkqYbq6awSdx1vKyzhcia5gvIA8qaDBJkwqv1xDbPqG
	 jgMOzWCmU47rQ==
X-Gm-Message-State: ACrzQf2soumT5XizAbSDbcvc49jmLpGdFlZkJ4F6/rHxk7R2zk7b73jo
	LbX6N5MwWbcx+MhyxGAigMt5aK379hvozekBt6g=
X-Google-Smtp-Source: AMsMyM570MzfEHG+h6//NTCAyCssTuVZ33kcVRI8jBPeUBf66hJktS6hWXxssnPRAxN1/K8iLQWj7FGo5PMNC7Y8Szs=
X-Received: by 2002:a5b:2ce:0:b0:6c9:b257:5229 with SMTP id
 h14-20020a5b02ce000000b006c9b2575229mr27373640ybp.136.1666652693856; Mon, 24
 Oct 2022 16:04:53 -0700 (PDT)
MIME-Version: 1.0
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com> <bb3be891-1dad-43db-da69-f20a471ccdb7@suse.com>
In-Reply-To: <bb3be891-1dad-43db-da69-f20a471ccdb7@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 24 Oct 2022 19:04:17 -0400
X-Gmail-Original-Message-ID: <CABfawhm-YHwO08f_tgN_-X1=2+U4krtaVv3UUoaFm6NJEhzVMA@mail.gmail.com>
Message-ID: <CABfawhm-YHwO08f_tgN_-X1=2+U4krtaVv3UUoaFm6NJEhzVMA@mail.gmail.com>
Subject: Re: [PATCH 06/10] x86/mem-sharing: copy GADDR based shared guest areas
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000c816b805ebcfd1f2"
X-Virus-Scanned: ClamAV using ClamSMTP

--000000000000c816b805ebcfd1f2
Content-Type: text/plain; charset="UTF-8"

> @@ -1987,7 +2056,10 @@ int mem_sharing_fork_reset(struct domain
>
>   state:
>      if ( reset_state )
> +    {
>          rc = copy_settings(d, pd);
> +        /* TBD: What to do here with -ERESTART? */

Generally speaking the fork reset operation does not support "restarting".
While in the memory op path the error can be propagated back to the
toolstack and have it re-issue it, on the monitor reply path that's not
possible. But the important question is where does the -ERESTART come
from?  What I think would happen here though is that -ERESTART may happen
during the initial fork op and that can fail, but if it succeeded, then
during reset it can't happen since everything would be already allocated
and mapped, the only thing during reset that would be done is the page
copying.

Tamas

--000000000000c816b805ebcfd1f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><br>&gt; @@ -1987,7 +2056,10 @@ int mem_sharing_fo=
rk_reset(struct domain<br>&gt;<br>&gt; =C2=A0 state:<br>&gt; =C2=A0 =C2=A0 =
=C2=A0if ( reset_state )<br>&gt; + =C2=A0 =C2=A0{<br>&gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0rc =3D copy_settings(d, pd);<br><div>&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* TBD: What to do here with -ERESTART? */</div><div><br></div=
><div>Generally speaking the fork reset operation does not support &quot;re=
starting&quot;. While in the memory op path the error can be propagated bac=
k to the toolstack and have it re-issue it, on the monitor reply path that&=
#39;s not possible. But the important question is where does the -ERESTART =
come from?=C2=A0 What I think would happen here though is that -ERESTART ma=
y happen during the initial fork op and that can fail, but if it succeeded,=
 then during reset it can&#39;t happen since everything would be already al=
located and mapped, the only thing during reset that would be done is the p=
age copying.</div><div><br></div><div>Tamas<br></div></div>

--000000000000c816b805ebcfd1f2--

