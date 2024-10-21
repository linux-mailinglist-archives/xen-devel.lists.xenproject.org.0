Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E72A9A688E
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 14:33:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823481.1237483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2raV-0006JX-H2; Mon, 21 Oct 2024 12:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823481.1237483; Mon, 21 Oct 2024 12:32:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2raV-0006I1-E2; Mon, 21 Oct 2024 12:32:43 +0000
Received: by outflank-mailman (input) for mailman id 823481;
 Mon, 21 Oct 2024 12:32:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>)
 id 1t2raT-0006Hr-Sr; Mon, 21 Oct 2024 12:32:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>)
 id 1t2raT-0008JB-Rd; Mon, 21 Oct 2024 12:32:41 +0000
Received: from lfbn-gre-1-248-145.w90-112.abo.wanadoo.fr ([90.112.205.145]
 helo=l14) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <anthony@xenproject.org>)
 id 1t2raT-0000Zn-IN; Mon, 21 Oct 2024 12:32:41 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Type:MIME-Version:Message-ID:
	Subject:To:From:Date; bh=OFJ51rIGTDPK9KfZwWZAUjyzzCoowdHjvJO0LaHNgVs=; b=RgTv
	FXJeMREh3UvqEQJdheLGkRMwZbvthoBFxBHexPR+/qzkbyzJBbPQrvGf7YvwyB2Jo4g9cFK9Gf7cS
	mvBpnoSEhEm48bRT4vETdmkiQo5iznIb6Il4K5hBQt4UWisr8uRpDLNj5VPJcW0jba05Re7t4LtRq
	8K3PbjBcoPbu0=;
Date: Mon, 21 Oct 2024 14:32:39 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: xen-announce@lists.xenproject.org, xen-devel@lists.xenproject.org
Subject: Scheduled Maintenance of xenbits, wiki, mail
Message-ID: <ZxZJ542OmZTlGmXQ@l14>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello everyone,

We planned to upgrade a few host of xenproject.org in the coming week.

This will affect access to git repository (on xenbits), download of Xen
release tarballs (on mail), access to the wiki, and email delivery
delayed for some.

The upgrade will start at 09:00 European Time (so 07:00 then 08:00 UTC)
and will take a few hours on those dates:

- 2024-10-23: mail.xenproject.org
- 2024-10-24: wiki.xenproject.org
- 2024-10-28: xenbits.xenproject.org

Cheers,

-- 
Anthony PERARD

