Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 548E3A6CD53
	for <lists+xen-devel@lfdr.de>; Sun, 23 Mar 2025 00:55:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.924824.1327809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tw8fP-0005b2-3G; Sat, 22 Mar 2025 23:54:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 924824.1327809; Sat, 22 Mar 2025 23:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tw8fO-0005Yt-T6; Sat, 22 Mar 2025 23:54:14 +0000
Received: by outflank-mailman (input) for mailman id 924824;
 Sat, 22 Mar 2025 23:54:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PFde=WJ=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1tw8fM-0005X4-So
 for xen-devel@lists.xenproject.org; Sat, 22 Mar 2025 23:54:12 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f10864fd-0778-11f0-9ffa-bf95429c2676;
 Sun, 23 Mar 2025 00:54:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id DCFAFA1D52;
 Sun, 23 Mar 2025 00:54:06 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gyg923ibEq6p; Sun, 23 Mar 2025 00:54:06 +0100 (CET)
Received: from begin (aamiens-653-1-40-48.w83-192.abo.wanadoo.fr
 [83.192.199.48])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id A5796A1C52;
 Sun, 23 Mar 2025 00:54:06 +0100 (CET)
Received: from samy by begin with local (Exim 4.98)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1tw8fG-0000000FFWH-0vFQ; Sun, 23 Mar 2025 00:54:06 +0100
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
X-Inumbo-ID: f10864fd-0778-11f0-9ffa-bf95429c2676
Date: Sun, 23 Mar 2025 00:54:06 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Subject: Re: [MINI-OS PATCH 00/12] kexec: add kexec support to Mini-OS
Message-ID: <Z99NnhfppCVOP_7C@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
References: <20250321092451.17309-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321092451.17309-1-jgross@suse.com>
Organization: I am not organized

Hello,

Juergen Gross, le ven. 21 mars 2025 10:24:39 +0100, a ecrit:
> Add basic kexec support to Mini-OS for running in x86 PVH mode.

I am wondering if you had considered using libxc to implement this?
The original pv-grub1 is doing it (xen/stubdom/grub/kexec.c)

Samuel

