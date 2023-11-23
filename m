Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BD57F5DDD
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 12:31:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639640.997192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r67ur-00050A-9T; Thu, 23 Nov 2023 11:30:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639640.997192; Thu, 23 Nov 2023 11:30:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r67ur-0004y6-6r; Thu, 23 Nov 2023 11:30:41 +0000
Received: by outflank-mailman (input) for mailman id 639640;
 Thu, 23 Nov 2023 11:30:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FfzT=HE=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r67uq-0004y0-96
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 11:30:40 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9ada8a5-89f3-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 12:30:38 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id C63064EE073C;
 Thu, 23 Nov 2023 12:30:37 +0100 (CET)
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
X-Inumbo-ID: b9ada8a5-89f3-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Thu, 23 Nov 2023 12:30:37 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>, Wei Liu
 <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v3] xen: replace occurrences of SAF-1-safe with
 asmlinkage attribute
In-Reply-To: <23575a74-2a8d-41d3-a71a-420f6a6007c8@suse.com>
References: <b193825385eae75ae320ab7d8c7f63b61c8c8786.1700125246.git.nicola.vetrini@bugseng.com>
 <23575a74-2a8d-41d3-a71a-420f6a6007c8@suse.com>
Message-ID: <6d89d2e3cb2ac28f7f40285f213c74ef@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

I guess this one as well should remain as is. Can you confirm?

void asmlinkage __stdcall cmdline_parse_early(const char *cmdline,
                                               early_boot_opts_t *ebo)

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

