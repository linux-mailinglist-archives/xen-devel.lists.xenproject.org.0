Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F13BB73849A
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 15:13:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552715.862930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBxd4-0000km-9w; Wed, 21 Jun 2023 13:12:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552715.862930; Wed, 21 Jun 2023 13:12:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBxd4-0000i1-6C; Wed, 21 Jun 2023 13:12:10 +0000
Received: by outflank-mailman (input) for mailman id 552715;
 Wed, 21 Jun 2023 13:12:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VkdJ=CJ=bugseng.com=roberto.bagnara@srs-se1.protection.inumbo.net>)
 id 1qBxd2-0000hv-Ej
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 13:12:08 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 384813a0-1035-11ee-b236-6b7b168915f2;
 Wed, 21 Jun 2023 15:12:06 +0200 (CEST)
Received: from [192.168.1.143] (unknown [151.44.212.241])
 by support.bugseng.com (Postfix) with ESMTPSA id 9A60C4EE0737;
 Wed, 21 Jun 2023 15:12:02 +0200 (CEST)
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
X-Inumbo-ID: 384813a0-1035-11ee-b236-6b7b168915f2
Message-ID: <a0c3f69d-055c-4ebe-45cc-da44d96d6b1e@bugseng.com>
Date: Wed, 21 Jun 2023 15:11:58 +0200
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
 <807743af-c1fe-45d0-1919-a7eb4d244a21@suse.com>
From: Roberto Bagnara <roberto.bagnara@bugseng.com>
In-Reply-To: <807743af-c1fe-45d0-1919-a7eb4d244a21@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/06/23 16:52, Jan Beulich wrote:
> On 20.06.2023 14:10, Roberto Bagnara wrote:
>> +   * - Non-standard tokens
>> +     - ARM64, X86_64
>> +     - _Static_assert:
>> +          see Section "2.1 C Language" of GCC_MANUAL.
>> +       asm, __asm__:
>> +          see Sections "6.48 Alternate Keywords" and "6.47 How to Use Inline Assembly Language in C Code" of GCC_MANUAL.
>> +       __volatile__:
>> +          see Sections "6.48 Alternate Keywords" and "6.47.2.1 Volatile" of GCC_MANUAL.
>> +       __const__, __inline__, __inline:
>> +          see Section "6.48 Alternate Keywords" of GCC_MANUAL.
>> +       typeof, __typeof__:
>> +          see Section "6.7 Referring to a Type with typeof" of GCC_MANUAL.
>> +       __alignof__, __alignof:
>> +          see Sections "6.48 Alternate Keywords" and "6.44 Determining the Alignment of Functions, Types or Variables" of GCC_MANUAL.
>> +       __attribute__:
>> +          see Section "6.39 Attribute Syntax" of GCC_MANUAL.
>> +       __builtin_types_compatible_p:
>> +          see Section "6.59 Other Built-in Functions Provided by GCC" of GCC_MANUAL.
>> +       __builtin_va_arg:
>> +          non-documented GCC extension.
>> +       __builtin_offsetof:
>> +          see Section "6.53 Support for offsetof" of GCC_MANUAL.
>> +       __signed__:
>> +          non-documented GCC extension.
> 
> I'd like to note that there is a patch [1] pending which removes all uses
> of this extension. Hopefully in Prague we can settle on how to progress
> this ...
> 
> Jan
> 
> [1] https://lists.xen.org/archives/html/xen-devel/2023-02/msg00445.html

Ok, removed from the document and from the tool configuration.

