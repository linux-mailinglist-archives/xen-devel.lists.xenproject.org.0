Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E51D630AA84
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 16:09:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79956.145893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6apk-00048z-Rf; Mon, 01 Feb 2021 15:09:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79956.145893; Mon, 01 Feb 2021 15:09:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6apk-00048W-Nw; Mon, 01 Feb 2021 15:09:44 +0000
Received: by outflank-mailman (input) for mailman id 79956;
 Mon, 01 Feb 2021 15:09:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6apj-00048D-Ch
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 15:09:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6apj-0004KD-Bj
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 15:09:43 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6apj-0004TP-9u
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 15:09:43 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l6apg-0007kO-5D; Mon, 01 Feb 2021 15:09:40 +0000
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
	bh=HV79K8JazcK1uQVJzyPbSIA4SSZtI828CihczDwLmQ4=; b=Coz+RlLRgb+2FLsZ0Esyr9EaCp
	Ehy+6lgp9XD+BJai1W0glUvGPcNfwupmj4dyaYaD3zfAAZPrMdIXw3L9KImgQwc9MItQHTwU0Zy1k
	9PKYhFh7Lw0WRj7aSBr3s39Fw3dEVMpTLLPe2J0OCSv7rpY+Q3AvKjmiJFtS/2KHP9mA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24600.6579.879861.695018@mariner.uk.xensource.com>
Date: Mon, 1 Feb 2021 15:09:39 +0000
To: Manuel Bouyer <bouyer@netbsd.org>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 2/2] define GNU_SOURCE for asprintf()
In-Reply-To: <20210130182711.2473-2-bouyer@netbsd.org>
References: <20210130182711.2473-1-bouyer@netbsd.org>
	<20210130182711.2473-2-bouyer@netbsd.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Manuel Bouyer writes ("[PATCH v3 2/2] define GNU_SOURCE for asprintf()"):
> #define _GNU_SOURCE to get for asprintf() prototype on Linux.
> Harmless on NetBSD.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

This needs to be folded into the previous patch so I will do so.

Ian.

