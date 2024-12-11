Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A769EC11B
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 01:52:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.853511.1266946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLAx3-0003kr-Ba; Wed, 11 Dec 2024 00:51:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 853511.1266946; Wed, 11 Dec 2024 00:51:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLAx3-0003jM-7m; Wed, 11 Dec 2024 00:51:41 +0000
Received: by outflank-mailman (input) for mailman id 853511;
 Wed, 11 Dec 2024 00:51:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wq+n=TE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tLAx2-0003fX-7b
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 00:51:40 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11ac933c-b75a-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 01:51:37 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8325EA41BC0;
 Wed, 11 Dec 2024 00:49:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD4C4C4CED6;
 Wed, 11 Dec 2024 00:51:32 +0000 (UTC)
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
X-Inumbo-ID: 11ac933c-b75a-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733878293;
	bh=vVNYVpyCDSlCfdj17iInh8wKbOxm59Gi8/qHAVwiUwo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=T3Re0M939BY6+8omsCLUtd/Dfg/EDrwpR12e3gHHmOc/7vcHGQw+7RAneLtS3uje3
	 TFdHjQ29sV1FgAbJ0XmMx/SX1GlzTjhjn+CL5gK97oFS+xsHkBb5/p60mjsSTg/dPg
	 UkVHcIOJuyvF4cGw6DxlkHJSU5IK6D2ehMApuEuZw2XabgzJlgmCJHmQXpiPgo3XJw
	 f1SkoiFyGsfNQ6SyhIsSfCkFT9vwj6Ew+ZH1byZXCGNkvRovNzaGYsVlkMbHNrKxws
	 y+N7G9u5UGLbBFqZTmzWjlu8fgq093jfCFLNkIc+Er7V4CXAxS/zAspW1z7Y5mnh6B
	 rI9lW41WVj3gw==
Date: Tue, 10 Dec 2024 16:51:31 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "=?UTF-8?Q?YUICHI_KUSAKABE_=28=E6=97=A5=E4=B8=8B=E9=83=A8_=E9=9B=84?=
 =?UTF-8?Q?=E4=B8=80=29?=" <yuichi_kusakabe@jp.honda>
cc: Kelly Choi <kelly.choi@cloud.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    "xen-announce@lists.xenproject.org" <xen-announce@lists.xenproject.org>, 
    "committers @ xenproject . org" <committers@xenproject.org>, 
    Xen Project Advisory Board <advisory-board@lists.xenproject.org>
Subject: RE: Welcome Honda to the Xen Project Board
In-Reply-To: <TYWP301MB04835A3401AA61594113EA29FB3D2@TYWP301MB0483.JPNP301.PROD.OUTLOOK.COM>
Message-ID: <alpine.DEB.2.22.394.2412101518040.463523@ubuntu-linux-20-04-desktop>
References: <CAO-mL=xGGvJSyh2u8pv4ORtuB2mkCZzWrJ=02WUnZUsHSX4cPg@mail.gmail.com> <TYWP301MB04835A3401AA61594113EA29FB3D2@TYWP301MB0483.JPNP301.PROD.OUTLOOK.COM>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-977437683-1733872775=:463523"
Content-ID: <alpine.DEB.2.22.394.2412101520090.463523@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-977437683-1733872775=:463523
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2412101520091.463523@ubuntu-linux-20-04-desktop>

Hi Yuichi,

Welcome onboard! It is great to have you as part of our community, and
we are looking forward to working together to enhance Xen in automotive.

Cheers,

Stefano


On Tue, 10 Dec 2024, YUICHI KUSAKABE (日下部 雄一) wrote:
> Hello All
> 
>  
> 
> We are happy to be able to join the member of Xen Project.
> 
> To help us achieve what we consider to be SDV,
> 
> https://static.sched.com/hosted_files/aglammsummer2024/f2/keynote-240718AGL_AMM-Honda.pdf?_gl=1*187coac*_gcl_au*MTk1NjQ4MjE2NS4xNzMxNzYzOD
> M3*FPAU*MTk1NjQ4MjE2NS4xNzMxNzYzODM3
> 
> Xen is the best option to achieve our SDV vision.
> 
>  
> 
> I look forward to seeing you all.
> 
>  
> 
> BR.
> 
> Yuichi Kusakabe.
> 
> Chief Architect - IVI software PF/OSPO Tech Lead
> 
> Honda Motor Co., Ltd.
> 
>  
> 
> From: Kelly Choi <kelly.choi@cloud.com>
> Sent: Monday, December 9, 2024 11:35 PM
> To: xen-devel <xen-devel@lists.xenproject.org>; xen-announce@lists.xenproject.org; committers @ xenproject . org
> <committers@xenproject.org>; Xen Project Advisory Board <advisory-board@lists.xenproject.org>
> Subject: Welcome Honda to the Xen Project Board
> 
>  
> 
> Hi all,
> 
>  
> 
> We're excited to announce our newest Advisory Board Member Honda, to the Xen Project.
> 
> Since its foundation, Honda has been committed to "creating a society that is useful to people" by utilizing its technologies and ideas.
> Honda also focuses on environmental responsiveness and traffic safety, and continue to take on the challenge of realizing a sustainable
> future.
> 
> I am sure that the community will agree that this is a huge step and achievement for our open source project. Honda's investment into
> supporting Xen means we are expanding our efforts to create a more secure and versatile hypervisor, with real world applications. Their
> commitment and partnership with Xen only increase the capabilities that our virtualization technology has achieved so far.
> 
> With Honda joining, their insights will help us navigate new challenges, expand our outreach to new contributors and enhance policies
> surrounding our community.
> 
> Their unique perspective will be invaluable as we tackle goals for the future, and we’re thrilled to have their voice guiding our strategy
> and vision.
> 
> Please join us in giving a warm welcome to Honda! We’re eager to see how their leadership and technical teams will help shape the future of
> the Xen Project. 
> 
>  
> 
> Together, we’ll continue building a strong, inclusive, and innovative community.
> 
>  
> 
> Kelly Choi
> 
> Community Manager
> 
> Xen Project
> 
> 
> 
--8323329-977437683-1733872775=:463523--

