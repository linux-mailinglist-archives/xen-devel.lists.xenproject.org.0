Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF824AA301
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 23:18:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265830.459385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nG6u7-0005ZG-1U; Fri, 04 Feb 2022 22:18:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265830.459385; Fri, 04 Feb 2022 22:18:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nG6u6-0005Wz-UH; Fri, 04 Feb 2022 22:18:06 +0000
Received: by outflank-mailman (input) for mailman id 265830;
 Fri, 04 Feb 2022 22:18:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lKAq=ST=gmail.com=dunlapg@srs-se1.protection.inumbo.net>)
 id 1nG6u5-0005Wt-Pl
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 22:18:05 +0000
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [2607:f8b0:4864:20::b31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52711dca-8608-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 23:18:04 +0100 (CET)
Received: by mail-yb1-xb31.google.com with SMTP id g14so22645937ybs.8
 for <xen-devel@lists.xenproject.org>; Fri, 04 Feb 2022 14:18:04 -0800 (PST)
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
X-Inumbo-ID: 52711dca-8608-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y1bJBBVbm1YpSOhnZE/fGej23yp2rZRAXlTCOAJ3+z8=;
        b=VvOgdrgAu+oT9UXd3PsebvLBGe9svXs7LdNybcwQ6XkmIIgOMT2nhYxRw3v7Xh5Uji
         4U6UmEQsUb27upNdaOxkZ3D2Zn1lZDwePTtYgiI61/bNvifh3A8CENaMiLvqv4g92MwG
         0jeq7MdmaS6OwOMsMPoHxFoPkRYJ95942ufwold/IOXCDMzySawam2Lak4RDrW9FjDMW
         noqwB5GHEsSpUF4zy10YqYXQb/rAMdpEKedJZbCjn1MDRIfhWPhQs715lwZaCAUHvIbR
         u1KuglQUojlen4ujS6NQORN7Pg0j/HPe15T4nf19J5N/CpFSQptKdFWp7/FSWsUSffyC
         yZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y1bJBBVbm1YpSOhnZE/fGej23yp2rZRAXlTCOAJ3+z8=;
        b=gNW8vEWAuCW0zuiFG4U2TBr/ZMAzFOrUgk7aED9WBAzJkUkuHplz5/Hy+sJA+fSCwS
         4NYFk7G6p/oXdu+ejshFX9FocYlEIb639WEKDtB2YJcq5WoW0OHk3mBpd06geTZzNFmn
         LmoA3ol0sUCMJBAJTU5FpX0a/XQ3wSXpTImN3WNbmbQ4RrwoA8BrASI5ySEMU1PNe6Ec
         CjGcLRwKm+piRn3NGyV+MuwxPHVb0deoPi3aG/u+EkHB8VCkhpqmxa/OiYsN3FOZxkkc
         a4A/i23dvsO3dLsWCxzfKNFM/R0b7l0T9MzcESqP+xdCTpMqzl/xJQnvC7yUxGzzgj9t
         A1vw==
X-Gm-Message-State: AOAM533IxCXvYAHIGuE/rAwwsMUdPaOy79vJ+/H04lNglCHApxIteZ9N
	/RfGmZ8by2KCy34/8eshJwBBWZvRW/aACDppl5g=
X-Google-Smtp-Source: ABdhPJyArfg+AyCAJIOIjuqMk4dhl2cHzzGGn6Qz92uNL2HAU87Hs6JuJ1hkVZhaN5I+rmuCcL48t46iiH1RlcmJUP4=
X-Received: by 2002:a81:b04f:: with SMTP id x15mr1144684ywk.282.1644013083847;
 Fri, 04 Feb 2022 14:18:03 -0800 (PST)
MIME-Version: 1.0
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com> <2b9d4562-1d44-d038-ea43-fe8b067c6070@suse.com>
In-Reply-To: <2b9d4562-1d44-d038-ea43-fe8b067c6070@suse.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Fri, 4 Feb 2022 22:17:53 +0000
Message-ID: <CAFLBxZbFHPiFLrkYBTvv3WrF56tvqM49h2sTAOgc165vTv1=Vw@mail.gmail.com>
Subject: Re: [PATCH 04/16] x86/P2M: move map_domain_gfn() (again)
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000de709005d7389fb4"

--000000000000de709005d7389fb4
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 5, 2021 at 5:07 PM Jan Beulich <jbeulich@suse.com> wrote:

> The main user is the guest walking code, so move it back there; commit
> 9a6787cc3809 ("x86/mm: build map_domain_gfn() just once") would perhaps
> better have kept it there in the first place. This way it'll only get
> built when it's actually needed (and still only once).
>
> This also eliminates one more CONFIG_HVM conditional from p2m.c.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>

Reviewed-by: George Dunlap <george.dunlap@citrix.com>

--000000000000de709005d7389fb4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 5, 2021 at 5:07 PM Jan Be=
ulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The main us=
er is the guest walking code, so move it back there; commit<br>
9a6787cc3809 (&quot;x86/mm: build map_domain_gfn() just once&quot;) would p=
erhaps<br>
better have kept it there in the first place. This way it&#39;ll only get<b=
r>
built when it&#39;s actually needed (and still only once).<br>
<br>
This also eliminates one more CONFIG_HVM conditional from p2m.c.<br>
<br>
Signed-off-by: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=
=3D"_blank">jbeulich@suse.com</a>&gt;<br></blockquote><div><br></div><div>R=
eviewed-by: George Dunlap &lt;<a href=3D"mailto:george.dunlap@citrix.com">g=
eorge.dunlap@citrix.com</a>&gt;<br></div><div>=C2=A0</div></div></div>

--000000000000de709005d7389fb4--

