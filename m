Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C60F17739FF
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 14:03:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579713.907798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTLPn-000084-0T; Tue, 08 Aug 2023 12:02:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579713.907798; Tue, 08 Aug 2023 12:02:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTLPm-00005E-TS; Tue, 08 Aug 2023 12:02:18 +0000
Received: by outflank-mailman (input) for mailman id 579713;
 Tue, 08 Aug 2023 12:02:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aYul=DZ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qTLPk-00004t-Rh
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 12:02:16 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a0d092e-35e3-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 14:02:15 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 6B9DC4EE0737;
 Tue,  8 Aug 2023 14:02:14 +0200 (CEST)
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
X-Inumbo-ID: 6a0d092e-35e3-11ee-8613-37d641c3527e
MIME-Version: 1.0
Date: Tue, 08 Aug 2023 14:02:14 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>
Subject: Re: [XEN PATCH v2 5/5] x86: refactor macros in 'xen-mca.h'
In-Reply-To: <8df1af6384606d8176525fbffb364ec814d48db1.1691492441.git.nicola.vetrini@bugseng.com>
References: <cover.1691492441.git.nicola.vetrini@bugseng.com>
 <8df1af6384606d8176525fbffb364ec814d48db1.1691492441.git.nicola.vetrini@bugseng.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <9eea3e6039a72d0502ed1416449e041a@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2023 13:08, Nicola Vetrini wrote:
> The macros defined 'xen/include/public/arch-x86/xen-mca.h' are revised
> to address the following concerns:
> - needless underscore prefixes for parameter names;
> - the variable 'i' in function 'mce_action' that is shadowed
>   by the local variable in the macro.
> 
> Therefore, the refactoring aims to resolve present shadowing
> issues, which violate MISRA C:2012 Rule 5.3, and lessen the
> probability of future ones with some renames.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> Changes in v2:
> - Added missing parentheses.
> - Clarified commit message.
> ---

Missing a
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
from the other version, since nothing changed code-wise.
-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

