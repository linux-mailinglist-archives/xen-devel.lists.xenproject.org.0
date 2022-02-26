Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FAF4C5896
	for <lists+xen-devel@lfdr.de>; Sat, 26 Feb 2022 23:57:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279861.477669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nO5yn-0004G5-H1; Sat, 26 Feb 2022 22:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279861.477669; Sat, 26 Feb 2022 22:55:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nO5yn-0004D1-CC; Sat, 26 Feb 2022 22:55:57 +0000
Received: by outflank-mailman (input) for mailman id 279861;
 Sat, 26 Feb 2022 22:55:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cBSf=TJ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nO5ym-0004Cv-3C
 for xen-devel@lists.xenproject.org; Sat, 26 Feb 2022 22:55:56 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 406563cf-9757-11ec-8539-5f4723681683;
 Sat, 26 Feb 2022 23:55:54 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id f37so15302955lfv.8
 for <xen-devel@lists.xenproject.org>; Sat, 26 Feb 2022 14:55:54 -0800 (PST)
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
X-Inumbo-ID: 406563cf-9757-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HKCcLUZhsUknh9j6JCzm6hJju6qrKH1+yPCUjtvcLaA=;
        b=StQAlHn89LtG+TKp4A7bKTtfqr5poZL4wMDblkY00A8CEkITtu4pQYirczcRi7BWvZ
         dl4QKe4bWXX3tOHJE0uAMRXOzgz5LCBVWxkTZfgx6cP62gH7lNoRnhIc/f7/EdgE/4lE
         WmrDxOg0ko9kGi1ybHIGF/YTgi64ugEyq/2Sy1I5OJuL/N20vHKCK+nnEOxUo28mQYRv
         1seI/1rHwoyCEjp2jOW9GRK8DYsPr1yn96xV3eOgIveB9m4LcXow9eKq70xC8JcR/ddg
         g1i5g6dPs8UHaq8HoXDf2mynbAGKUOgrLXhQLe6R6V7RwE2qA1/IOi83zmUiwz4ibebi
         PONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HKCcLUZhsUknh9j6JCzm6hJju6qrKH1+yPCUjtvcLaA=;
        b=KKpOfGO0VzHfjkJKEhc4PNcmKGIBaCFcCbdkluApeYXqkkveNLz4P+Jy7kNn9KN7I1
         gee2Gdf0py65L5t4brpR/a8KgOQg3Sqjxl0a1Brh0rndpYPz53Kpps7On5JT4JVFabWi
         1Ic8SFfpb27Yf41XQqrXBOOSi1RVCsNDnD3O4Wmj/HtpXe2vsE8J3JND5Ps9L8rHvLup
         xZ4pFQBr7uC7GNs0RRJrsohmhTfaDUn17cW9Utk4lUDPSPBSc1rhrfWKI0A/qaUY2AT5
         lGOlio82DsymY5u0NMoA5H0uGitsQ/ZZ4P4e1q/BAsnUZjbVoCl3BvM/Bd4BOMeSJCNt
         Ogng==
X-Gm-Message-State: AOAM53284mp8WmXQ2CFKtSFWyZKiHCWvNhQHogRPcfydKBLqoJObjSif
	fyhRhNOLH3kw9kZFfeyrQbMI1j6I0Hd39Fd0dxs=
X-Google-Smtp-Source: ABdhPJx7R3+65fgH5TPurDLicr5SRdQufFa4peGfsYLcOdx0mlAdmjqL7jjYezy5QkfOuq1DQfxn/PUEe4rhCDfSYgs=
X-Received: by 2002:a19:7503:0:b0:443:3d52:fde6 with SMTP id
 y3-20020a197503000000b004433d52fde6mr8716395lfe.250.1645916153567; Sat, 26
 Feb 2022 14:55:53 -0800 (PST)
MIME-Version: 1.0
References: <20220224194853.17774-1-andrew.cooper3@citrix.com>
 <20220224194853.17774-3-andrew.cooper3@citrix.com> <12d8b90b-15b0-c094-71e5-35cfdbfe72b4@suse.com>
 <51ef6bd1-bcd9-9a3a-e902-887d42d7dd7e@citrix.com> <bb4b4106-f49d-2b50-1eb9-eb450f6b24fa@suse.com>
 <965e91fa-1f1e-7c57-5a71-a09b170a7d9f@citrix.com>
In-Reply-To: <965e91fa-1f1e-7c57-5a71-a09b170a7d9f@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sat, 26 Feb 2022 17:55:40 -0500
Message-ID: <CAKf6xpsz8zLEkCFpqXrgUOEkwHxTHM41vijGoZTWdhhRSA2OrQ@mail.gmail.com>
Subject: Re: x86/vmx: Don't spuriously crash the domain when INIT is received
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	Thiner Logoer <logoerthiner1@163.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 25, 2022 at 12:12 PM Andrew Cooper
<Andrew.Cooper3@citrix.com> wrote:
>
> On 25/02/2022 13:19, Jan Beulich wrote:
> > But I don't think I see the full picture here yet, unless your
> > mentioning of TXT was actually implying that TXT was active at the
> > point of the crash (which I don't think was said anywhere).
>
> This did cause confusion during debugging.  As far as we can tell, TXT
> is not active, but the observed behaviour certainly looks like TXT is
> active.

It's curious since the CPU, i5-1135G7, is listed as *not* supporting
TXT.  However, it does support Boot Guard, and both Boot Guard and TXT
use Authenticated Code Modules (ACMs) to implement their
functionality.  There is the below quote from the Measured Launched
Environment Developer=E2=80=99s Guide:
http://kib.kiev.ua/x86docs/Intel/TXT/315168-014.pdf

"Both Server TXT and Boot Guard (BtG) technologies require Startup ACM to b=
e
executed at platform reset. Intel =C2=AE CPUs can support only single such =
ACM and
therefore combining of BtG ACM with a Startup ACM is inevitable for platfor=
ms
supporting both technologies. This combining requirement triggered the
whole set of
upgrades targeted to better alignment of both technologies, and their
mutual benefits."

So I'm just speculating, but it seems there is TXT-ish stuff going on
when it resumes.

Regards,
Jason

