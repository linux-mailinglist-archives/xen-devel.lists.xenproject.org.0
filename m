Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5848A7384C0
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 15:19:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552758.863040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBxjX-0006JX-Jt; Wed, 21 Jun 2023 13:18:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552758.863040; Wed, 21 Jun 2023 13:18:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBxjX-0006G9-GG; Wed, 21 Jun 2023 13:18:51 +0000
Received: by outflank-mailman (input) for mailman id 552758;
 Wed, 21 Jun 2023 13:18:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VkdJ=CJ=bugseng.com=roberto.bagnara@srs-se1.protection.inumbo.net>)
 id 1qBxjW-0005TW-4T
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 13:18:50 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 281f8ab4-1036-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 15:18:48 +0200 (CEST)
Received: from [192.168.1.143] (unknown [151.44.212.241])
 by support.bugseng.com (Postfix) with ESMTPSA id AEEA94EE0737;
 Wed, 21 Jun 2023 15:18:46 +0200 (CEST)
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
X-Inumbo-ID: 281f8ab4-1036-11ee-8611-37d641c3527e
Message-ID: <1e348612-16ff-1446-72fa-9a350d3e99ca@bugseng.com>
Date: Wed, 21 Jun 2023 15:18:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.12) Gecko/20050929
 Thunderbird/1.0.7 Fedora/1.0.7-1.1.fc4 Mnenhy/0.7.3.0
Subject: Re: [XEN PATCH v2] docs/misra: document the C dialect and translation
 toolchain assumptions.
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: roger.pau@citrix.com, bertrand.marquis@arm.com, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <b3f85e78bc1d044e6ed97eab28ee61548a353da1.1687261909.git.roberto.bagnara@bugseng.com>
 <4a06234a-d9ee-4359-3260-eaf18dc83f86@suse.com>
From: Roberto Bagnara <roberto.bagnara@bugseng.com>
In-Reply-To: <4a06234a-d9ee-4359-3260-eaf18dc83f86@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/06/23 16:56, Jan Beulich wrote:
> On 20.06.2023 14:10, Roberto Bagnara wrote:
>> +   * - Arithmetic operator on void type
>> +     - ARM64, X86_64
>> +     - See Section "6.24 Arithmetic on void- and Function-Pointers" of GCC_MANUAL."
> 
> The first line is misleading - we don't (and can't) do arithmetic on void.
> What we do is arithmetic on pointers to void (like the gcc section title
> properly says).

You are right: corrected now.
Thanks,

    Roberto


