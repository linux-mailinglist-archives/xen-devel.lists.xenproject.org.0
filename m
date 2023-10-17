Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DBD7CC76F
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 17:27:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618293.961754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qslyA-0003qi-GQ; Tue, 17 Oct 2023 15:26:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618293.961754; Tue, 17 Oct 2023 15:26:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qslyA-0003oE-Dm; Tue, 17 Oct 2023 15:26:54 +0000
Received: by outflank-mailman (input) for mailman id 618293;
 Tue, 17 Oct 2023 15:26:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tHSl=F7=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qsly8-0003o6-Df
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 15:26:52 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97cd06a0-6d01-11ee-9b0e-b553b5be7939;
 Tue, 17 Oct 2023 17:26:50 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 4425A4EE0738;
 Tue, 17 Oct 2023 17:26:50 +0200 (CEST)
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
X-Inumbo-ID: 97cd06a0-6d01-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Tue, 17 Oct 2023 17:26:50 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 3/7] x86: add deviation comments for asm-only
 functions
In-Reply-To: <alpine.DEB.2.22.394.2310161520180.965337@ubuntu-linux-20-04-desktop>
References: <cover.1696833629.git.nicola.vetrini@bugseng.com>
 <6476706490cc15406bcf3377a57b7c4a303c4901.1696833629.git.nicola.vetrini@bugseng.com>
 <741e81bc-050c-a773-e622-997b6c0b8335@suse.com>
 <alpine.DEB.2.22.394.2310161520180.965337@ubuntu-linux-20-04-desktop>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <d9532d49fe43e4f8c9e6a3c44287d9b3@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit


> Now, concrete action items. Nicola, I think we should look into having 
> a
> larger-than-usual ECLAIR scan every week which includes all of Intel
> files and in general as much as possible of the codebase.
> 

This can be arranged. I'll keep you posted about this.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

