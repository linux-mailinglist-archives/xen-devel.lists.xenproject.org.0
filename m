Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8BCB22788
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 14:57:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078766.1439818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uloYK-0007Gq-Qz; Tue, 12 Aug 2025 12:56:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078766.1439818; Tue, 12 Aug 2025 12:56:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uloYK-0007Er-O6; Tue, 12 Aug 2025 12:56:32 +0000
Received: by outflank-mailman (input) for mailman id 1078766;
 Tue, 12 Aug 2025 12:56:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qHa6=2Y=net-space.pl=dkiper@srs-se1.protection.inumbo.net>)
 id 1uloYJ-0007El-Nd
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 12:56:31 +0000
Received: from dibed.net-space.pl (dibed.net-space.pl [84.10.22.86])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3b27156-777b-11f0-a327-13f23c93f187;
 Tue, 12 Aug 2025 14:56:30 +0200 (CEST)
Received: from router-fw.i.net-space.pl ([192.168.52.1]:37208 "EHLO
 tomti.i.net-space.pl") by router-fw-old.i.net-space.pl with ESMTP
 id S1948803AblHLM41 (ORCPT <rfc822;xen-devel@lists.xenproject.org>);
 Tue, 12 Aug 2025 14:56:27 +0200
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
X-Inumbo-ID: c3b27156-777b-11f0-a327-13f23c93f187
X-Comment: RFC 2476 MSA function at dibed.net-space.pl logged sender identity as: dkiper
Date:	Tue, 12 Aug 2025 14:56:26 +0200
From:	Daniel Kiper <dkiper@net-space.pl>
To:	Aaron Rainbolt <arraybolt3@gmail.com>
Cc:	grub-devel@gnu.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 1/2] include/xen: Rename MAX_GUEST_CMDLINE to
 GRUB_XEN_MAX_GUEST_CMDLINE
Message-ID: <20250812125626.ljpldcevarcmgiyb@tomti.i.net-space.pl>
References: <20250804234816.3d14f53f@kf-m2g5>
 <20250804234911.3cc3997c@kf-m2g5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250804234911.3cc3997c@kf-m2g5>
User-Agent: NeoMutt/20170113 (1.7.2)

On Mon, Aug 04, 2025 at 11:49:11PM -0500, Aaron Rainbolt wrote:
> The xen.h header was using an overly generic name to refer to the
> maximum length of the command line passed from Xen to a guest. Rename it
> to avoid confusion or conflicts in the future.
>
> Signed-off-by: Aaron Rainbolt <arraybolt3@gmail.com>

Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>

Daniel

