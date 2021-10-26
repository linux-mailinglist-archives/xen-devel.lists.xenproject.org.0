Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB2943AF9E
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 11:59:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216330.375892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfJEH-0006fe-SQ; Tue, 26 Oct 2021 09:58:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216330.375892; Tue, 26 Oct 2021 09:58:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfJEH-0006cg-P1; Tue, 26 Oct 2021 09:58:49 +0000
Received: by outflank-mailman (input) for mailman id 216330;
 Tue, 26 Oct 2021 09:58:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mfJEG-0006cV-M5
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 09:58:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mfJEG-0005mi-Ht
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 09:58:48 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mfJEG-0002iN-H6
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 09:58:48 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mfJE4-00042y-UU; Tue, 26 Oct 2021 10:58:37 +0100
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
	bh=o5AvDmKyZ6xTmY3nA7yLFA84JXwYikWcTf1UXXE98mo=; b=51IsbEX5xmEVjldA+cHaJ2GZD/
	E4lTGfqmAt9iTruAWTq0RcMjJCvWcyO0GgvM05lAYNDTj9uYOV9864E4ye1J6tOMaI4QLldel+QUa
	yrsGRvaeeUxNS8wys5A7CxrEJ6XGd6h2gplCs6Hs3aKdTxrPawIzSHNDXbgrh25rZ5Gg=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24951.53580.84970.956218@mariner.uk.xensource.com>
Date: Tue, 26 Oct 2021 10:58:36 +0100
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: George.Dunlap@citrix.com,
    dunlapg@umich.edu,
    roger.pau@citrix.com,
    jbeulich@suse.com,
    committers@xenproject.org,
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] governance: communication channels
In-Reply-To: <alpine.DEB.2.21.2110251845500.4586@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2110251845500.4586@sstabellini-ThinkPad-T480s>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Stefano Stabellini writes ("[PATCH v2] governance: communication channels"):
> Clarify that xen-devel is the only official communication channel.

Reviewed-by: Ian Jackson <iwj@xenproject.org>

