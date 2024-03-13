Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 085A587AAC4
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 16:53:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692589.1079902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQv2-0004BR-51; Wed, 13 Mar 2024 15:53:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692589.1079902; Wed, 13 Mar 2024 15:53:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQv2-00049F-25; Wed, 13 Mar 2024 15:53:28 +0000
Received: by outflank-mailman (input) for mailman id 692589;
 Wed, 13 Mar 2024 15:53:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ov8A=KT=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rkQv1-000499-Ai
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 15:53:27 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2f91c53-e151-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 16:53:25 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id D24314EE0738;
 Wed, 13 Mar 2024 16:53:23 +0100 (CET)
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
X-Inumbo-ID: d2f91c53-e151-11ee-a1ee-f123f15fe8a2
MIME-Version: 1.0
Date: Wed, 13 Mar 2024 16:53:23 +0100
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
Message-ID: <265e5e357db58916774f42265f39ce4a@bugseng.com>
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

Hi,

this patch has an R-by from Stefano. Is there something preventing this 
from being committed?

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

