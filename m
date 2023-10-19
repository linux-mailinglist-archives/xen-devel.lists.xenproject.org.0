Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAE97D0394
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 23:17:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619578.964892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtaO1-0000xl-BX; Thu, 19 Oct 2023 21:16:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619578.964892; Thu, 19 Oct 2023 21:16:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtaO1-0000vp-8h; Thu, 19 Oct 2023 21:16:57 +0000
Received: by outflank-mailman (input) for mailman id 619578;
 Thu, 19 Oct 2023 21:16:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZCy=GB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qtaNz-0000vd-78
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 21:16:55 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d36d06dc-6ec4-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 23:16:54 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1A4E761D9E;
 Thu, 19 Oct 2023 21:16:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29433C433C8;
 Thu, 19 Oct 2023 21:16:51 +0000 (UTC)
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
X-Inumbo-ID: d36d06dc-6ec4-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697750212;
	bh=u6lO4uXsmi+Gt34ypzu37AZTHCKKULzb19pqUwphpBk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GS04/vGfC2dJ8GncvnuTB0FYNsL2uWk6SXMaPkRWgGMeexJsmKDeHUzSZLymm1vvp
	 sP7JrC9rmtxQNJx57EKJ2P+nfN8xYSL/7lzGwyDKglmVh2ZylK1z4AKutT0ZftkzqL
	 DsVwS2Ej+Ee1guiHMUsXbsE8Owi4YTfeUgU26id6zJWhlQaBmn7QL/6egfi1A0nVVY
	 5LhA8/B+wTuraNTwIs7cERky/9WxW2RnfoNdTb2JTNF2BqmmAP6x7ZBDUUGexHsz/U
	 YMnN3/zH9QbK6I4aFPbT5rm0/p3ZMEG7AxkhhRlrPjGpC7fe+ak9ZDwN4Km1tUB0ZC
	 MQgm4IiiZJuTw==
Date: Thu, 19 Oct 2023 14:16:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 v3 6/8] xen/console: remove stub definition
 in consoled.h
In-Reply-To: <d354aad8c58fd97058ed84751266562c12feb622.1697722648.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310191416430.2099202@ubuntu-linux-20-04-desktop>
References: <cover.1697722648.git.nicola.vetrini@bugseng.com> <d354aad8c58fd97058ed84751266562c12feb622.1697722648.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Oct 2023, Nicola Vetrini wrote:
> The stub  definition of 'consoled_guest_tx' can be removed, since its
> its single caller uses the implementation built with PV_SHIM enabled.
> 
> Fixes: 5ef49f185c2d ("x86/pv-shim: shadow PV console's page for L2 DomU")
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


