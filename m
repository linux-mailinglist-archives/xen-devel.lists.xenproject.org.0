Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F92C45359E
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 16:20:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226370.391171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn0GF-0004nV-7Q; Tue, 16 Nov 2021 15:20:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226370.391171; Tue, 16 Nov 2021 15:20:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn0GF-0004kg-4A; Tue, 16 Nov 2021 15:20:39 +0000
Received: by outflank-mailman (input) for mailman id 226370;
 Tue, 16 Nov 2021 15:20:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mn0GD-0004kW-G4
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 15:20:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mn0GD-0006EU-FB
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 15:20:37 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mn0GD-0004KW-EI
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 15:20:37 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mn0G9-0000N9-GC; Tue, 16 Nov 2021 15:20:33 +0000
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
	bh=NxEy6/FCiY88TWeKG0GT90Kf0KOr1KIWwBZ/V23zrb0=; b=I44pRp0zSKT1toUAoKDI6eP6WM
	0SpF3fv4A75LNDm5IwwCMfwpAIDRu11h8GCKCu6fjuouwddBpFpvivK2j1EolnYKA/cy+PkeWtMty
	xGKuhSW03DnURKUChmS64Qj+aG5AH0RmVg19tApFcI8EiW6JHzSP9szQ/U37rHEXnn3I=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24979.52288.972030.824961@mariner.uk.xensource.com>
Date: Tue, 16 Nov 2021 15:20:32 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Community Manager <community.manager@xenproject.org>
Subject: Re: [PATCH for-4.16] CHANGELOG: set Xen 4.15 release date
In-Reply-To: <20211116140344.10766-1-roger.pau@citrix.com>
References: <20211116140344.10766-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH for-4.16] CHANGELOG: set Xen 4.15 release date"):
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

