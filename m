Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 313317CF1F5
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 10:05:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618969.963361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtO1T-0005NX-P1; Thu, 19 Oct 2023 08:04:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618969.963361; Thu, 19 Oct 2023 08:04:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtO1T-0005Kp-Ls; Thu, 19 Oct 2023 08:04:51 +0000
Received: by outflank-mailman (input) for mailman id 618969;
 Thu, 19 Oct 2023 08:04:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cQIi=GB=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qtO1S-0005KT-JE
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 08:04:50 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2bb3d506-6e56-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 10:04:47 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id EBC2C4EE0739;
 Thu, 19 Oct 2023 10:04:47 +0200 (CEST)
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
X-Inumbo-ID: 2bb3d506-6e56-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Thu, 19 Oct 2023 10:04:47 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 3/7] x86: add deviation comments for asm-only
 functions
In-Reply-To: <94f59896-5182-c711-98d7-dcecf6073201@suse.com>
References: <cover.1696833629.git.nicola.vetrini@bugseng.com>
 <6476706490cc15406bcf3377a57b7c4a303c4901.1696833629.git.nicola.vetrini@bugseng.com>
 <741e81bc-050c-a773-e622-997b6c0b8335@suse.com>
 <alpine.DEB.2.22.394.2310161520180.965337@ubuntu-linux-20-04-desktop>
 <dd3534dd-29b0-129d-9f34-b542ed3ffabc@suse.com>
 <alpine.DEB.2.22.394.2310181703170.965337@ubuntu-linux-20-04-desktop>
 <94f59896-5182-c711-98d7-dcecf6073201@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <e723c1aad066436f701f284ada836f1f@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit


>> - vmx_asm_vmexit_handler
>> 

Isn't this just a declaration:

void nocall vmx_asm_vmexit_handler(void);

while the function to be deviated is this:

void vmx_vmexit_handler(struct cpu_user_regs *regs)

Am I correct?

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

