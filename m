Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A4B4F810B
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 15:54:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300815.513196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncSaX-0003Hk-CG; Thu, 07 Apr 2022 13:54:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300815.513196; Thu, 07 Apr 2022 13:54:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncSaX-0003F6-8n; Thu, 07 Apr 2022 13:54:17 +0000
Received: by outflank-mailman (input) for mailman id 300815;
 Thu, 07 Apr 2022 13:54:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uF1Z=UR=chiark.greenend.org.uk=ijackson@srs-se1.protection.inumbo.net>)
 id 1ncSaW-0003F0-6k
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 13:54:16 +0000
Received: from chiark.greenend.org.uk (v6.chiark.greenend.org.uk
 [2001:ba8:1e3::]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30af1f4e-b67a-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 15:54:07 +0200 (CEST)
Received: by chiark.greenend.org.uk (Debian Exim 4.89 #1) with local
 (return-path ijackson@chiark.greenend.org.uk)
 id 1ncSaT-0003pM-L2; Thu, 07 Apr 2022 14:54:13 +0100
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
X-Inumbo-ID: 30af1f4e-b67a-11ec-8fbc-03012f2f19d4
From: Ian Jackson <ijackson@chiark.greenend.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <25166.60677.416016.20030@chiark.greenend.org.uk>
Date: Thu, 7 Apr 2022 14:54:13 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] osstest: stop anacron service
In-Reply-To: <20220407095104.39545-1-roger.pau@citrix.com>
References: <20220407095104.39545-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.4.1 (i586-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH v2] osstest: stop anacron service"):
> Just disabling cron in rc.d is not enough. There's also anacron which
> will get invoked during startup, and since apt-compat has a delay of
> up to 30min it can be picked up by the leak detector if the test
> finishes fast enough:

Well done for tracking that down.

Acked-by: Ian Jackson <ijackson@chiark.greenend.org.uk>

Ian.

