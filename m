Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B9C52F12A
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 18:58:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.334447.558465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns5wk-0006yV-Lh; Fri, 20 May 2022 16:57:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 334447.558465; Fri, 20 May 2022 16:57:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns5wk-0006wG-In; Fri, 20 May 2022 16:57:50 +0000
Received: by outflank-mailman (input) for mailman id 334447;
 Fri, 20 May 2022 16:57:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=60ZO=V4=chiark.greenend.org.uk=ijackson@srs-se1.protection.inumbo.net>)
 id 1ns5wi-0006wA-8X
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 16:57:48 +0000
Received: from chiark.greenend.org.uk (v6.chiark.greenend.org.uk
 [2001:ba8:1e3::]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7dcc39a-d85d-11ec-837e-e5687231ffcc;
 Fri, 20 May 2022 18:57:47 +0200 (CEST)
Received: by chiark.greenend.org.uk (Debian Exim 4.89 #1) with local
 (return-path ijackson@chiark.greenend.org.uk)
 id 1ns5we-0005j9-0t; Fri, 20 May 2022 17:57:44 +0100
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
X-Inumbo-ID: f7dcc39a-d85d-11ec-837e-e5687231ffcc
From: Ian Jackson <ijackson@chiark.greenend.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <25223.51335.932439.379210@chiark.greenend.org.uk>
Date: Fri, 20 May 2022 17:57:43 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [OSSTEST PATCH v2] ts-xen-build-prep: Install newer NASM version, to build OVMF
In-Reply-To: <20220519105525.211344-1-anthony.perard@citrix.com>
References: <20220519105525.211344-1-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.4.1 (i586-pc-linux-gnu)

Anthony PERARD writes ("[OSSTEST PATCH v2] ts-xen-build-prep: Install newer NASM version, to build OVMF"):
> Recent versions of OVMF now need a version of NASM that is newer
> than the one available on Debian oldstable/buster. They want to use
> NASM 2.15.05 [1], which is available in Debian stable/bullseye. The
> need to use a newer version started with d3febfd9ade3 ("MdePkg:
> Replace Opcode with the corresponding instructions.").
> 
> There is no backport package available but the nasm package from
> Debian Bullseye can easily be installed on Buster as it has few
> dependencies and are already satisfied.
> 
> [1] https://github.com/tianocore/edk2/commit/6a890db161cd6d378bec3499a1e774db3f5a27a7
>     ("BaseTools: Upgrade the version of NASM tool")

LGTM assuming Roger is also happy...

Acked-by: Ian Jackson <ijackson@chiark.greenend.org.uk>

-- 
Ian Jackson <ijackson@chiark.greenend.org.uk>   These opinions are my own.  

Pronouns: they/he.  If I emailed you from @fyvzl.net or @evade.org.uk,
that is a private address which bypasses my fierce spamfilter.

