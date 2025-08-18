Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1976EB2AC74
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 17:19:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086166.1444383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uo1dv-0002yB-3M; Mon, 18 Aug 2025 15:19:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086166.1444383; Mon, 18 Aug 2025 15:19:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uo1dv-0002wR-0q; Mon, 18 Aug 2025 15:19:27 +0000
Received: by outflank-mailman (input) for mailman id 1086166;
 Mon, 18 Aug 2025 15:19:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/WGh=26=net-space.pl=dkiper@srs-se1.protection.inumbo.net>)
 id 1uo1du-0002wL-Jp
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 15:19:26 +0000
Received: from dibed.net-space.pl (dibed.net-space.pl [84.10.22.86])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6fcecb5-7c46-11f0-b898-0df219b8e170;
 Mon, 18 Aug 2025 17:19:21 +0200 (CEST)
Received: from router-fw.i.net-space.pl ([192.168.52.1]:52594 "EHLO
 tomti.i.net-space.pl") by router-fw-old.i.net-space.pl with ESMTP
 id S2273171AblHRPTT (ORCPT <rfc822;xen-devel@lists.xenproject.org>);
 Mon, 18 Aug 2025 17:19:19 +0200
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
X-Inumbo-ID: b6fcecb5-7c46-11f0-b898-0df219b8e170
X-Comment: RFC 2476 MSA function at dibed.net-space.pl logged sender identity as: dkiper
Date:	Mon, 18 Aug 2025 17:19:17 +0200
From:	Daniel Kiper <dkiper@net-space.pl>
To:	arraybolt3@gmail.com
Cc:	grub-devel@gnu.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 2/3] include/xen: Add warning comment for cmd_line
Message-ID: <20250818151917.66iwgczi5t3ildrs@tomti.i.net-space.pl>
References: <20250814013645.2488043-1-arraybolt3@gmail.com>
 <20250814013645.2488043-3-arraybolt3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814013645.2488043-3-arraybolt3@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Wed, Aug 13, 2025 at 08:36:44PM -0500, arraybolt3@gmail.com wrote:
> From: Aaron Rainbolt <arraybolt3@gmail.com>
>
> The cmd_line field of the start_info struct is not guaranteed to be
> NUL-terminated, even though it is intended to contain a NUL-terminated
> string. Add a warning about this in a comment so future consumers of
> this field know to check it for a NUL terminator before using it.
>
> Signed-off-by: Aaron Rainbolt <arraybolt3@gmail.com>

Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>

Daniel

