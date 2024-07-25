Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A27893C8BB
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 21:34:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765117.1175705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sX4DR-0002H7-9D; Thu, 25 Jul 2024 19:33:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765117.1175705; Thu, 25 Jul 2024 19:33:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sX4DR-0002FS-6f; Thu, 25 Jul 2024 19:33:29 +0000
Received: by outflank-mailman (input) for mailman id 765117;
 Thu, 25 Jul 2024 19:33:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l8vd=OZ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sX4DP-0002FM-P7
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 19:33:27 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2b6ec26-4abc-11ef-8776-851b0ebba9a2;
 Thu, 25 Jul 2024 21:33:25 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id A0CA54EE073C;
 Thu, 25 Jul 2024 21:33:24 +0200 (CEST)
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
X-Inumbo-ID: c2b6ec26-4abc-11ef-8776-851b0ebba9a2
MIME-Version: 1.0
Date: Thu, 25 Jul 2024 21:33:24 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: "Lira, Victor M" <VictorM.Lira@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, roberto.bagnara@bugseng.com,
 consulting@bugseng.com, simone.ballarin@bugseng.com
Subject: Re: [RFC PATCH v3] automation: add linker symbol name script
In-Reply-To: <662924ab-18fb-4b15-b3e3-4f09ef770aca@amd.com>
References: <29c7f6cd166d5d3c0e9f64dc937e29dc7ecf3f2d.1721933988.git.victorm.lira@amd.com>
 <662924ab-18fb-4b15-b3e3-4f09ef770aca@amd.com>
Message-ID: <32a3b30c59be4adeef594a2d4a4b963b@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-07-25 21:06, Lira, Victor M wrote:
> Thanks all for suggestions in v2.
> 
> Do we need to worry about duplicates or alphabetically 
> sorting/filtering the output here? As it stands there are no duplicates 
> but I think it can happen with linker syntax.
> 
> Victor

Hi,

for the specific task it will carry out that's not a particular concern, 
as each symbol will be used to construct a single regex, but for 
readability that might be appreciated by the maintainers.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

