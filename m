Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 162717BD41F
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 09:15:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614199.955172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpkU4-0004iD-44; Mon, 09 Oct 2023 07:15:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614199.955172; Mon, 09 Oct 2023 07:15:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpkU4-0004gJ-1F; Mon, 09 Oct 2023 07:15:20 +0000
Received: by outflank-mailman (input) for mailman id 614199;
 Mon, 09 Oct 2023 07:15:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o9Np=FX=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qpkU2-0004fT-PQ
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 07:15:18 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99ad3c20-6673-11ee-98d3-6d05b1d4d9a1;
 Mon, 09 Oct 2023 09:15:18 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id B58E14EE073F;
 Mon,  9 Oct 2023 09:15:17 +0200 (CEST)
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
X-Inumbo-ID: 99ad3c20-6673-11ee-98d3-6d05b1d4d9a1
MIME-Version: 1.0
Date: Mon, 09 Oct 2023 09:15:17 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: andrew.cooper3@citrix.com
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, jbeulich@suse.com, roger.pau@citrix.com, Wei Liu
 <wl@xen.org>
Subject: Re: [XEN PATCH 7/9] x86/mce: Move MC_NCLASSES into the enum
 mctelem_class
In-Reply-To: <85bd4923-a710-43eb-a8e1-04d757b0ee78@citrix.com>
References: <cover.1696514677.git.nicola.vetrini@bugseng.com>
 <08293d72e236a7a6aec0305bc3f901a6636747ab.1696514677.git.nicola.vetrini@bugseng.com>
 <85bd4923-a710-43eb-a8e1-04d757b0ee78@citrix.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <4f1cdfe65520bd732e5d2029bbe302a3@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 06/10/2023 21:11, andrew.cooper3@citrix.com wrote:
> On 06/10/2023 9:26 am, Nicola Vetrini wrote:
>> The definition of MC_NCLASSES contained a violation of MISRA C:2012
>> Rule 10.1, therefore by moving it as an enumeration constant resolves 
>> the
>> violation and makes it more resilient to possible additions to that 
>> enum.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> I've started my normal for-next branch around releases, and included
> this patch.
> 
> https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen.git;a=shortlog;h=refs/heads/for-next
> 
> I'll keep the rebased and add it to 4.19 when the tree re-opens.
> 
> ~Andrew

Thanks, this helps a lot. I'll tag patches intended for this tree with 
[for-next].

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

