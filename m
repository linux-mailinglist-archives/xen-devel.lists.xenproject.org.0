Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E0E313951
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 17:26:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82958.153503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l99MQ-0004fo-VG; Mon, 08 Feb 2021 16:26:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82958.153503; Mon, 08 Feb 2021 16:26:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l99MQ-0004fP-RY; Mon, 08 Feb 2021 16:26:02 +0000
Received: by outflank-mailman (input) for mailman id 82958;
 Mon, 08 Feb 2021 16:26:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l99MO-0004fK-Lx
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 16:26:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l99MO-0007w1-LB
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 16:26:00 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l99MO-0008DC-K3
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 16:26:00 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l99MJ-0002yM-VU; Mon, 08 Feb 2021 16:25:56 +0000
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
	bh=BeQIAPdWUoOefYkXdb494vmAilqs/09bNczhP+UUqWs=; b=TEB12VpwpuGD8qZkfiXHzQ1Goa
	ld4Ozu1mRFrvhzGWcQP28TJgamgeDobauRc9ZOsL4z8Blt+ZY96rm4V2vwB9i7QMUumpSetx7BVYK
	Zpof7AAQk4Xy5pO4DKbaHPlcUAQRCzxYEB03Y9aQbbTGFbLQ1ze82m1mneHf4q+BoNZc=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24609.26131.733756.369535@mariner.uk.xensource.com>
Date: Mon, 8 Feb 2021 16:25:55 +0000
To: Olaf Hering <olaf@aepfle.de>,
    Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v20210111 08/39] xl: fix description of migrate --debug
In-Reply-To: <20210111174224.24714-9-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
	<20210111174224.24714-9-olaf@aepfle.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Olaf Hering writes ("[PATCH v20210111 08/39] xl: fix description of migrate --debug"):
> xl migrate --debug used to track every pfn in every batch of pages.
> But these times are gone. Adjust the help text to tell what --debug
> is supposed to do today.
...
> -Display huge (!) amount of debug information during the migration process.
> +Verify transferred domU page data. All memory will be transferred one more
> +time to the destination host while the domU is paused, and compared with
> +the result of the inital transfer while the domU was still running.

Andy, as our expert on migration, can you confirm whether this is
accurate ?

Docs (including usage message) so

Release-Acked-by: Ian Jackson <iwj@xenproject.org>


Thanks,
Ian.

