Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0400747F433
	for <lists+xen-devel@lfdr.de>; Sat, 25 Dec 2021 19:08:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.251777.432850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n1BRn-0007oG-16; Sat, 25 Dec 2021 18:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 251777.432850; Sat, 25 Dec 2021 18:07:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n1BRm-0007mM-TP; Sat, 25 Dec 2021 18:07:10 +0000
Received: by outflank-mailman (input) for mailman id 251777;
 Sat, 25 Dec 2021 18:07:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EicR=RK=gmail.com=firemeteor.guo@srs-se1.protection.inumbo.net>)
 id 1n1BRl-0007mG-Lo
 for xen-devel@lists.xen.org; Sat, 25 Dec 2021 18:07:09 +0000
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78be14a3-65ad-11ec-9e60-abaf8a552007;
 Sat, 25 Dec 2021 19:07:08 +0100 (CET)
Received: by mail-il1-f180.google.com with SMTP id y16so8832599ilq.8
 for <xen-devel@lists.xen.org>; Sat, 25 Dec 2021 10:07:07 -0800 (PST)
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
X-Inumbo-ID: 78be14a3-65ad-11ec-9e60-abaf8a552007
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rj5bw5Fvs3Zezd4r+FVV2J+bmd2uBeaFMey7QaPzfL8=;
        b=yhJvT4tsuxkodReprhC7liHqNV+iuOdwC581h8UhJ8MaBRJVY4YzS+7wPqClix3/hd
         MX+x3ZOtDD5Y0+bq5bCEoyLLcbzgBzyBPc1n79h26jjOVsUjZ6NxxljQbO9RVm3vgt0u
         Hl12ipDlk9BfTk0G7fKZMBpKEaPDQsFKa9H8AGnY5SWR3FNfBUmwdKR8Fq7qBZBLRmb7
         vropPoHqtH/ySheSxD+t/EdYVGKmTKBz09Rdrze1IdFmthwSTzBSrV/GXlN5tFwMxm3n
         l/1VXKFH3fYZTmg8GDr0uuCmbuFbVrNp0wrJSaGO/RR/gLeE57B+5r/JHHUfNcFVq/AI
         Fkyg==
X-Gm-Message-State: AOAM532V0FTWMgMDRKp3PO+AzMiCZh6lveVG781etXVi2fse7XsYMA8p
	LpXCiIwiviRtvfstyDmFwN7cc2S08TR3JqaaLf8=
X-Google-Smtp-Source: ABdhPJybD0l/SDAy35f5XcSQfr4j0iStDl87V+y7k+EfbCC9pjtUxh5sijiv4OA+a7PJTuFeCWoUdIR+RDCQfRp/0AU=
X-Received: by 2002:a92:c10e:: with SMTP id p14mr4719204ile.24.1640455626680;
 Sat, 25 Dec 2021 10:07:06 -0800 (PST)
MIME-Version: 1.0
References: <CAKhsbWZ5KCrwJqbchx31LWfaJeS=khP9sgoo4y8ZZqOexsUUdA@mail.gmail.com>
 <CAKhsbWYLC+cEuaJefi4Zy1ZcZaOtM6_2WV+9uq8=pTdi5NYLJA@mail.gmail.com>
 <CAKhsbWbv-Poscajj=Hwe3g6WO9b8VaZm39ygFnsbEfHTpRzrfA@mail.gmail.com>
 <YcHbuug9AECvKXm9@Air-de-Roger> <CAKhsbWZkSoM-N=HXfb_OeSGLqYMdtcxRph+=_vqp6tjHgikYVQ@mail.gmail.com>
 <YcInKtCNgA9v0k+c@Air-de-Roger> <CAKhsbWZMRMfrsWDcZLSS7q4ciR0UbyGE2sO-tN1dr+9juuEfsQ@mail.gmail.com>
 <YcWuCgYWestnlDSH@Air-de-Roger> <CAKhsbWZ4Xyy_7Xp4F3YWNsrBXdh4AkiQx4__7qUTd4AJiu-6bg@mail.gmail.com>
In-Reply-To: <CAKhsbWZ4Xyy_7Xp4F3YWNsrBXdh4AkiQx4__7qUTd4AJiu-6bg@mail.gmail.com>
From: "G.R." <firemeteor@users.sourceforge.net>
Date: Sun, 26 Dec 2021 02:06:55 +0800
Message-ID: <CAKhsbWarxwi_n3NAr81op_apyN69itUrv7f1k1ZJ6=gXuFXtGA@mail.gmail.com>
Subject: Re: Possible bug? DOM-U network stopped working after fatal error
 reported in DOM0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="UTF-8"

> > Thanks. I've raised this on freensd-net for advice [0]. IMO netfront
> > shouldn't receive an mbuf that crosses a page boundary, but if that's
> > indeed a legit mbuf I will figure out the best way to handle it.
> >
> > I have a clumsy patch (below) that might solve this, if you want to
> > give it a try.
>
> Applied the patch and it worked like a charm!
> Thank you so much for your quick help!
> Wish you a wonderful holiday!

I may have said too quickly...
With the patch I can attach the iscsi disk and neither the dom0 nor
the NAS domU complains this time.
But when I attempt to mount the attached disk it reports I/O errors randomly.
By randomly I mean different disks behave differently...
I don't see any error logs from kernels this time.
(most of the iscsi disks are NTFS FS and mounted through the user mode
fuse library)
But since I have a local backup copy of the image, I can confirm that
mounting that backup image does not result in any I/O error.
Looks like something is still broken here...

