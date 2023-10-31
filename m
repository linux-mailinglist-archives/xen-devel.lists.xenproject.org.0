Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 942B07DC7FC
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 09:15:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625496.974815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxju3-0008Eb-LF; Tue, 31 Oct 2023 08:15:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625496.974815; Tue, 31 Oct 2023 08:15:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxju3-0008CV-If; Tue, 31 Oct 2023 08:15:11 +0000
Received: by outflank-mailman (input) for mailman id 625496;
 Tue, 31 Oct 2023 08:15:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TgTD=GN=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qxju1-0008CP-TB
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 08:15:09 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b07bc3c-77c5-11ee-98d6-6d05b1d4d9a1;
 Tue, 31 Oct 2023 09:15:09 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 770754EE073A;
 Tue, 31 Oct 2023 09:15:08 +0100 (CET)
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
X-Inumbo-ID: 9b07bc3c-77c5-11ee-98d6-6d05b1d4d9a1
MIME-Version: 1.0
Date: Tue, 31 Oct 2023 09:15:08 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, Simone Ballarin <simone.ballarin@bugseng.com>, Doug
 Goldstein <cardoe@cardoe.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
 <kevin.tian@intel.com>
Subject: Re: [XEN PATCH][for-4.19 v5 2/8] x86: add deviation for asm-only
 functions
In-Reply-To: <alpine.DEB.2.22.394.2310301553280.1625118@ubuntu-linux-20-04-desktop>
References: <cover.1698655374.git.nicola.vetrini@bugseng.com>
 <79091a4e450b522aedfdd903ad671e705a933c49.1698655374.git.nicola.vetrini@bugseng.com>
 <4c5db3e9-cf77-43aa-be7b-df5734104fea@xen.org>
 <alpine.DEB.2.22.394.2310301553280.1625118@ubuntu-linux-20-04-desktop>
Message-ID: <f246ee1adabdee7abd53f3bcd737fc2b@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-10-30 23:54, Stefano Stabellini wrote:
> On Mon, 30 Oct 2023, Julien Grall wrote:
>> Hi Nicola,
>> 
>> On 30/10/2023 09:11, Nicola Vetrini wrote:
>> > As stated in rules.rst, functions used only in asm modules
>> > are allowed to have no prior declaration visible when being
>> > defined, hence these functions are marked with an
>> > 'asmlinkage' macro, which is then deviated for MISRA C:2012
>> > Rule 8.4.
>> 
>> AFAIU, this is a replacement of SAF-1. If so, I would like a 
>> consistent way to
>> address Rule 8.4. So can you write a patch to replace all the use of 
>> SAF-1
>> with asmlinkage and remove SAF-1?
> 
> +1

Ok, no problem

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

