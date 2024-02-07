Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 725AC84C91F
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 12:00:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677432.1054008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXffG-0001s6-1f; Wed, 07 Feb 2024 11:00:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677432.1054008; Wed, 07 Feb 2024 11:00:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXffF-0001pJ-UF; Wed, 07 Feb 2024 11:00:25 +0000
Received: by outflank-mailman (input) for mailman id 677432;
 Wed, 07 Feb 2024 11:00:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CAtM=JQ=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1rXffD-0001nR-Va
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 11:00:23 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16abafeb-c5a8-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 12:00:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id D8BAFA02E8;
 Wed,  7 Feb 2024 12:00:21 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L-0MvcTTUOE9; Wed,  7 Feb 2024 12:00:21 +0100 (CET)
Received: from begin (nat-inria-interne-52-gw-01-bso.bordeaux.inria.fr
 [194.199.1.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id B1A25A02D4;
 Wed,  7 Feb 2024 12:00:21 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1rXffB-00000008jiV-1XA6; Wed, 07 Feb 2024 12:00:21 +0100
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
X-Inumbo-ID: 16abafeb-c5a8-11ee-8a49-1f161083a0e0
Date: Wed, 7 Feb 2024 12:00:21 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH] Mini-OS: x86: zero out .bss segment at boot
Message-ID: <20240207110021.hhlbkpx3vv3p7o4j@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
References: <20240207103138.26901-1-jgross@suse.com>
 <20240207103831.dtvlyjtbmgz7kmll@begin>
 <d51d842e-5609-4c98-9a31-8d6a0b237c31@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d51d842e-5609-4c98-9a31-8d6a0b237c31@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Jürgen Groß, le mer. 07 févr. 2024 11:42:20 +0100, a ecrit:
> while implementing kexec in Mini-OS.

Oh, nice :D

> For that I need it for sure.

It needs to be done by kexec itself then.

Samuel

