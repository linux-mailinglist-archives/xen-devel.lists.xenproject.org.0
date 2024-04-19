Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B438AA980
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 09:49:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708835.1108000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxizX-0003lT-GR; Fri, 19 Apr 2024 07:49:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708835.1108000; Fri, 19 Apr 2024 07:49:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxizX-0003il-Dg; Fri, 19 Apr 2024 07:49:03 +0000
Received: by outflank-mailman (input) for mailman id 708835;
 Fri, 19 Apr 2024 07:49:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pund=LY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rxizV-0003if-Hi
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 07:49:01 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48beb0bb-fe21-11ee-b909-491648fe20b8;
 Fri, 19 Apr 2024 09:49:00 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 081824EE0742;
 Fri, 19 Apr 2024 09:49:00 +0200 (CEST)
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
X-Inumbo-ID: 48beb0bb-fe21-11ee-b909-491648fe20b8
MIME-Version: 1.0
Date: Fri, 19 Apr 2024 09:49:00 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Simone Ballarin <simone.ballarin@bugseng.com>, Doug
 Goldstein <cardoe@cardoe.com>, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2] automation/eclair_analysis: substitute deprecated
 service STD.emptrecd
In-Reply-To: <c94d739e-0517-487f-8ba9-d9b19fe8f916@suse.com>
References: <7b60faa6e627b3a4df298f2ef4d9ba4d72e5e206.1713510915.git.nicola.vetrini@bugseng.com>
 <c94d739e-0517-487f-8ba9-d9b19fe8f916@suse.com>
Message-ID: <58ed38830469a027b9cedd9d5f68cfae@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-04-19 09:35, Jan Beulich wrote:
> On 19.04.2024 09:16, Nicola Vetrini wrote:
>> The ECLAIR service STD.emptrecd is being deprecated; hence, as a 
>> preventive
>> measure, STD.anonstct is used here, which for Xen's purposes has 
>> equivalent
>> functionality.
> 
> I'm sorry, but no, this still does not clarify things enough. It is 
> still
> entirely unclear how "empty record" can reasonably be substituted by
> "anonymous struct". Even the expansion of the respective abbreviations
> continues to be just a guess.
> 
> Jan

anonstct checks for structs with no named members, hence also empty 
structs, but only the former is an undefined behaviour for C99.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

