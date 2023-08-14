Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F9F77B2CD
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 09:44:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583292.913419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSF3-0000Np-8u; Mon, 14 Aug 2023 07:43:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583292.913419; Mon, 14 Aug 2023 07:43:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSF3-0000M4-67; Mon, 14 Aug 2023 07:43:57 +0000
Received: by outflank-mailman (input) for mailman id 583292;
 Mon, 14 Aug 2023 07:43:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DK7P=D7=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qVSF1-0000Lw-OE
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 07:43:55 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50d58270-3a76-11ee-8613-37d641c3527e;
 Mon, 14 Aug 2023 09:43:53 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 1326F4EE0737;
 Mon, 14 Aug 2023 09:43:53 +0200 (CEST)
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
X-Inumbo-ID: 50d58270-3a76-11ee-8613-37d641c3527e
MIME-Version: 1.0
Date: Mon, 14 Aug 2023 09:43:53 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Stefano Stabellini
 <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 2/6] x86/setup: add missing headers
In-Reply-To: <e621f307-f83c-044a-cd9b-6592f452454f@suse.com>
References: <cover.1691676251.git.nicola.vetrini@bugseng.com>
 <c4fbf7b2a763f1b8e700e2ed36628c047231cb46.1691676251.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2308111557590.2127516@ubuntu-linux-20-04-desktop>
 <e621f307-f83c-044a-cd9b-6592f452454f@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <a881f91d78befa8ee8b61101eeb65913@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit


>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> Fixes: 3eab82196b02 ("x86: PIT broadcast to fix local APIC timer stop 
>>> issue for Deep C state")
>>> Fixes: 63dc135aeaf9 ("x86: invpcid support")
> 
> One request: Please can you get used to putting the Fixes: tags first,
> so one doesn't need to (try to) remember to move them in the course of
> committing?
> 

Sure. Sorry, I didn't notice the ordering in other commits.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

