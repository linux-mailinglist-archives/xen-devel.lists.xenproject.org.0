Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC117336F9
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 19:00:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550324.859327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qACo1-00058K-F1; Fri, 16 Jun 2023 17:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550324.859327; Fri, 16 Jun 2023 17:00:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qACo1-00055t-Bs; Fri, 16 Jun 2023 17:00:13 +0000
Received: by outflank-mailman (input) for mailman id 550324;
 Fri, 16 Jun 2023 17:00:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gfOj=CE=anastas.io=shawn@srs-se1.protection.inumbo.net>)
 id 1qACnz-00055n-8B
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 17:00:11 +0000
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3dd2ba64-0c67-11ee-8611-37d641c3527e;
 Fri, 16 Jun 2023 19:00:06 +0200 (CEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id A5B383F08F;
 Fri, 16 Jun 2023 10:00:01 -0700 (PDT)
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
X-Inumbo-ID: 3dd2ba64-0c67-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=anastas.io; s=mail;
	t=1686934802; bh=LJ7TkF4paZu1zK/75CCOJysOK+Vbd3Lkw6/uJNFf+NM=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=G4k8m5lVV4oyjgs6MpMqCgK3YQ4QL/rxMQ/dowYxuToUzP898xXaAXO/7C3dLTQMh
	 rK6/K34EvGDVjH2nxXYcamQiZJmCWcIeOL6wsG3rBBWuEW35LYp+OpUib979k1tUDA
	 htCoR8kcBd6nCOkhPMwdGydQdTSPt6y0g5baqyWc6aF/DE5Vj5p+wBnalRskEGSkRB
	 XcCWOMXC0sHTvo1oh1KxNO8JqAQFzYtGerU9GGJW02EQgF0IbHXCy2D87Gh325M6sZ
	 beaZD+65IxOtNUEdEkw+RdDB74SiD+UJ+MrCeFzyAXkuPCeBEM50wCRqztuhDq73xP
	 qq7tR0XIRC9zQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jun 2023 12:00:00 -0500
Message-Id: <CTE8H8RIBMJK.19QQNYR024YZ@Shawns-Mac-mini.lan>
Cc: <tpearson@raptorengineering.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "George Dunlap" <george.dunlap@citrix.com>,
 "Julien Grall" <julien@xen.org>, "Stefano Stabellini"
 <sstabellini@kernel.org>, "Wei Liu" <wl@xen.org>, "Shawn Anastasio"
 <sanastasio@raptorengineering.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/4] xen: Add files needed for minimal ppc64le build
From: "Shawn Anastasio" <shawn@anastas.io>
To: "Jan Beulich" <jbeulich@suse.com>
References: <cover.1686667191.git.shawn@anastas.io>
 <d45855963671225b5e20cb0f26da1e7ec64427f2.1686667191.git.shawn@anastas.io>
 <e04c4cc2-21b4-d508-94d2-5fb786df37b7@suse.com>
 <CTCIQ2OTB80O.2W5D3HEB8OWLZ@Shawns-Mac-mini.lan>
 <b874b1bb-f1c4-47c3-fe65-1070d263cf90@suse.com>
In-Reply-To: <b874b1bb-f1c4-47c3-fe65-1070d263cf90@suse.com>

On Thu Jun 15, 2023 at 1:47 AM CDT, Jan Beulich wrote:
> On 14.06.2023 18:36, Shawn Anastasio wrote:
> > On Wed Jun 14, 2023 at 10:51 AM CDT, Jan Beulich wrote:
> >> On 13.06.2023 16:50, Shawn Anastasio wrote:
> >>> +    DECL_SECTION(.bss) {                     /* BSS */
> >>> +        __bss_start =3D .;
> >>> +        *(.bss.stack_aligned)
> >>> +        . =3D ALIGN(PAGE_SIZE);
> >>> +        *(.bss.page_aligned)
> >>
> >> ... the one between the two .bss parts looks unmotivated. Within
> >> a section definition ALIGN() typically only makes sense when followed
> >> by a label definition, like ...
> >=20
> > Correct me if I'm wrong, but wouldn't the ALIGN here serve to ensure
> > that the subsequent '.bss.page_aligned' section has the correct alignme=
nt
> > that its name implies?
>
> Yes and no. Thing is that every contribution to .bss.page_aligned already
> needs to specify page alignment itself, or else it may break if any earli=
er
> contribution was page-aligned, but not a full page in size (which I think
> the compiler wouldn't allow to happen, but assembly code can result in
> such). Note how this very ALIGN() was recently dropped from RISC-V code,
> and my respective Arm side patch is also about to go in.

That makes sense, thanks. I'll get rid of the ALIGN here in v4.

> Jan

Thanks,
Shawn


