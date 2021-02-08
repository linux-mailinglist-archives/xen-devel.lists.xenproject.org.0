Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36105313844
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 16:43:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82925.153409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l98gn-000897-Qo; Mon, 08 Feb 2021 15:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82925.153409; Mon, 08 Feb 2021 15:43:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l98gn-00088i-NW; Mon, 08 Feb 2021 15:43:01 +0000
Received: by outflank-mailman (input) for mailman id 82925;
 Mon, 08 Feb 2021 15:43:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l98gm-00088c-Ja
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 15:43:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l98gm-0006gk-In
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 15:43:00 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l98gm-0004HK-I4
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 15:43:00 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l98gj-0002nM-DG; Mon, 08 Feb 2021 15:42:57 +0000
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=AOgDrJ4yZDGO1gSnfIGl4OLht4SgwhC2pSgrvoIietM=; b=OdewOEWAjTZQ6CvPFcHKK99Q76
	3A5ZPJN7EW3NWeaLcyqsqhbUdvETONqekHa+eQxDnRHSwO2jWBHpPdopxXQMedpqBLQTJb3WTuGeB
	c6c0FWj+nVlVFAMBKiNo5JJ3gAtZA4FoscWTZOftuLYMPOJ+suLXoc4Y8rgXpqhhWXCU=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24609.23552.778672.924224@mariner.uk.xensource.com>
Date: Mon, 8 Feb 2021 15:42:56 +0000
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v20210111 03/39] docs: remove stale create example from xl.1
In-Reply-To: <20210111174224.24714-4-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
	<20210111174224.24714-4-olaf@aepfle.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Olaf Hering writes ("[PATCH v20210111 03/39] docs: remove stale create example from xl.1"):
> Maybe xm create had a feature to create a domU based on a configuration
> file. xl create requires the '-f' option to refer to a file.
> There is no code to look into XEN_CONFIG_DIR, so remove the example.

Reviewed-by: Ian Jackson <iwj@xenproject.org>

This is docs so

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

I'm queueing it now.

Ian.

