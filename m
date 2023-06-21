Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B7D738838
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 16:59:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552804.863080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBzHy-000264-DJ; Wed, 21 Jun 2023 14:58:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552804.863080; Wed, 21 Jun 2023 14:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBzHy-00022m-AQ; Wed, 21 Jun 2023 14:58:30 +0000
Received: by outflank-mailman (input) for mailman id 552804;
 Wed, 21 Jun 2023 14:58:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VkdJ=CJ=bugseng.com=roberto.bagnara@srs-se1.protection.inumbo.net>)
 id 1qBzHw-00022g-Hk
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 14:58:28 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 132fda72-1044-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 16:58:26 +0200 (CEST)
Received: from [192.168.1.143] (unknown [151.46.220.87])
 by support.bugseng.com (Postfix) with ESMTPSA id DC3CC4EE0737;
 Wed, 21 Jun 2023 16:58:23 +0200 (CEST)
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
X-Inumbo-ID: 132fda72-1044-11ee-8611-37d641c3527e
Message-ID: <a2840389-1868-84fa-0ef4-bb278164119b@bugseng.com>
Date: Wed, 21 Jun 2023 16:58:22 +0200
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
 <9a03d5d3-71d5-e3ed-235c-554931fa485a@suse.com>
From: Roberto Bagnara <roberto.bagnara@bugseng.com>
In-Reply-To: <9a03d5d3-71d5-e3ed-235c-554931fa485a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/06/23 17:05, Jan Beulich wrote:
> On 20.06.2023 14:10, Roberto Bagnara wrote:
>> +   * - Token pasting of ',' and __VA_ARGS__
>> +     - ARM64, X86_64
>> +     - See Section "6.21 Macros with a Variable Number of Arguments" of GCC_MANUAL.
>> +
>> +   * - No arguments for '...' parameter of variadic macro
>> +     - ARM64, X86_64
>> +     - See Section "6.21 Macros with a Variable Number of Arguments" of GCC_MANUAL.
> 
> Seeing these I think you want to also mention our extensive use of
> the pre-C99 way of variadic macros, which also includes pasting of
> ',' with something.

Good catch.  Added

    * - Named variadic macro arguments
      - ARM64, X86_64
      - See Section "6.21 Macros with a Variable Number of Arguments" of GCC_MANUAL.

Thanks,

    Roberto

