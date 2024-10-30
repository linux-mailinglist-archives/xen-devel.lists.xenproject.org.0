Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1AF9B649D
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 14:49:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828232.1243081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t694H-0000lf-8r; Wed, 30 Oct 2024 13:49:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828232.1243081; Wed, 30 Oct 2024 13:49:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t694H-0000kE-4T; Wed, 30 Oct 2024 13:49:01 +0000
Received: by outflank-mailman (input) for mailman id 828232;
 Wed, 30 Oct 2024 13:48:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2nRj=R2=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1t694F-0000k8-E2
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 13:48:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b42f83ef-96c5-11ef-a0c3-8be0dac302b0;
 Wed, 30 Oct 2024 14:48:55 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2A19C5C5A6C
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 13:48:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5C2CC4CED0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 13:48:53 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-539eb97f26aso6962792e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 06:48:53 -0700 (PDT)
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
X-Inumbo-ID: b42f83ef-96c5-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6ImI0MmY4M2VmLTk2YzUtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjk2MTM1Ljg2MDIyLCJzZW5kZXIiOiJhcmRiQGtlcm5lbC5vcmciLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730296133;
	bh=l29xjMvWd5IzFEym1SdeJT/5uE5SzAyDVBZM5T+wfow=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ECSgIwLR13qCsQcxcgWKx7mLKaXwrrDJdUvpmzsgGQ4t9HeIcU5CDu02sQfbIMAmx
	 YVW2lrpSs8NnRQrjA0dscfJgAK3ZozIP40i3SGrpMiJoAnoACZbltghK8IlGpMEhPK
	 I9RUmm5zX6UqFjN6G8wtNAWtIS2XIGF+2sJDY739CoZegLmk9T0ZwYOe9DdQxqxg1+
	 0WChpy3Zm9s5Z4jik6W2sK8R4y5T136x/A4bUz3c3pXFYrb312+OBNxUcWzDD/pcgK
	 OFHU3R9pcJJMLguit0l6o/4GqvYxvd3r6mcScMZMr45abDPCpFTBQh44Iyqp3JDAZb
	 LmH4a62aIcPWg==
X-Forwarded-Encrypted: i=1; AJvYcCVYhKfW2eZmAWWmgaU/VTuycg3P7NzYWMOqImP3rFDllrIEIJjPYj5Ecff6d4tDssVOSTBS6t98E2s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyoQScNM6ueemqxaZbb8lO+VQuDFhKpHiAkXQIywhHCCc3zXdPY
	RuDVJkIamasfeCnNKJ1RAs4swyh2V4D/Any+fw02NizVFvRSyld2vc8/ptRYHSJD9ZLt5Lrd1A3
	Z6V2OpuwR42QAxwpm+mHeDSdS5qc=
X-Google-Smtp-Source: AGHT+IFtq4EtnqrroYItyFo72u+yn8LxIyPbI0vN4T1+ioELAZ476zVUyFG3o8hJBQBfVrJOI3bVhga2K4K/hCe5Hag=
X-Received: by 2002:a05:6512:1047:b0:53a:40e:d547 with SMTP id
 2adb3069b0e04-53b7ecd58damr2272034e87.5.1730296132256; Wed, 30 Oct 2024
 06:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <20241009160438.3884381-7-ardb+git@google.com> <CAMj1kXHzahaLRH_0nSQaS7L+so0WRwh4R6SLdb1R+Hm3s-o1dA@mail.gmail.com>
 <1dea1f19-c247-435b-9c73-a0181914024d@suse.com>
In-Reply-To: <1dea1f19-c247-435b-9c73-a0181914024d@suse.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 30 Oct 2024 14:48:40 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFgoEk65bJBU=eZccYUdZCqF3Bk2pMAZCA4TviC3U9ExQ@mail.gmail.com>
Message-ID: <CAMj1kXFgoEk65bJBU=eZccYUdZCqF3Bk2pMAZCA4TviC3U9ExQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] x86/xen: Drop absolute references from startup code
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	Jason Andryuk <jason.andryuk@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 29 Oct 2024 at 13:54, J=C3=BCrgen Gro=C3=9F <jgross@suse.com> wrote=
:
>
> On 29.10.24 13:50, Ard Biesheuvel wrote:
> > On Wed, 9 Oct 2024 at 18:09, Ard Biesheuvel <ardb+git@google.com> wrote=
:
> >>
..
> >
> > Ping?
>
> I have queued this series for 6.13.
>

Thanks!

