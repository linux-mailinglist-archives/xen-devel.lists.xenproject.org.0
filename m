Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B784F7DC8A8
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 09:52:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625532.974892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxkSj-0000OB-Ro; Tue, 31 Oct 2023 08:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625532.974892; Tue, 31 Oct 2023 08:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxkSj-0000Lt-Nz; Tue, 31 Oct 2023 08:51:01 +0000
Received: by outflank-mailman (input) for mailman id 625532;
 Tue, 31 Oct 2023 08:51:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TgTD=GN=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qxkSi-0000LU-A8
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 08:51:00 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b68120a-77ca-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 09:50:57 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id B4C424EE073A;
 Tue, 31 Oct 2023 09:50:56 +0100 (CET)
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
X-Inumbo-ID: 9b68120a-77ca-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Tue, 31 Oct 2023 09:50:56 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu
 <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 v4 6/8] x86/mce: Move MC_NCLASSES into the
 enum mctelem_class
In-Reply-To: <alpine.DEB.2.22.394.2310271349340.271731@ubuntu-linux-20-04-desktop>
References: <cover.1698410970.git.nicola.vetrini@bugseng.com>
 <6efab48e9340916f23c94baf5c189d1d1c6ab7e6.1698410970.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2310271349340.271731@ubuntu-linux-20-04-desktop>
Message-ID: <14bee5d8d86a067e63b71aefb0461221@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-10-27 22:50, Stefano Stabellini wrote:
> On Fri, 27 Oct 2023, Nicola Vetrini wrote:
>> The definition of MC_NCLASSES contained a violation of MISRA C:2012
>> Rule 10.1, therefore by moving it as an enumeration constant resolves 
>> the
>> violation and makes it more resilient to possible additions to that 
>> enum.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

I appreciate your review here, but I forgot to put Andrew's A-by;
he already included this patch in its own for-next tree.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

