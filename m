Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8434185F33C
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 09:42:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684246.1063969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd4eg-0004gy-Co; Thu, 22 Feb 2024 08:42:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684246.1063969; Thu, 22 Feb 2024 08:42:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd4eg-0004en-A3; Thu, 22 Feb 2024 08:42:10 +0000
Received: by outflank-mailman (input) for mailman id 684246;
 Thu, 22 Feb 2024 08:42:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6628=J7=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rd4ee-0004ef-TM
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 08:42:08 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42a51df9-d15e-11ee-8a55-1f161083a0e0;
 Thu, 22 Feb 2024 09:42:07 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id A0E8D4EE0737;
 Thu, 22 Feb 2024 09:42:06 +0100 (CET)
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
X-Inumbo-ID: 42a51df9-d15e-11ee-8a55-1f161083a0e0
MIME-Version: 1.0
Date: Thu, 22 Feb 2024 09:42:06 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, jbeulich@suse.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, Simone Ballarin <simone.ballarin@bugseng.com>, Doug
 Goldstein <cardoe@cardoe.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>
Subject: Re: [XEN PATCH v2] automation/eclair_analysis: deviate certain macros
 for Rule 20.12
In-Reply-To: <7bc72f6ccd858e0405d62d49c32449e3b5abd790.1707996317.git.nicola.vetrini@bugseng.com>
References: <7bc72f6ccd858e0405d62d49c32449e3b5abd790.1707996317.git.nicola.vetrini@bugseng.com>
Message-ID: <d31f6e4cb46de29898f8869991d3cbad@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-02-15 14:06, Nicola Vetrini wrote:
> Certain macros are allowed to violate the Rule, since their meaning and
> intended use is well-known to all Xen developers.
> 
> Variadic macros that rely on the GCC extension for removing a trailing
> comma when token pasting the variable argument are similarly
> well-understood and therefore allowed.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> Changes in v2:
> - Restrict deviation for GENERATE_CASE to vcpreg.c.
> - Improve deviation justifications.
> ---
>  .../eclair_analysis/ECLAIR/deviations.ecl     | 20 +++++++++++++++++
>  docs/misra/deviations.rst                     | 22 +++++++++++++++++++
>  2 files changed, 42 insertions(+)
> 

Ping?

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

