Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C35C47FF793
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 17:58:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645084.1006917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8kN2-0006Fu-5B; Thu, 30 Nov 2023 16:58:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645084.1006917; Thu, 30 Nov 2023 16:58:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8kN2-0006E9-1p; Thu, 30 Nov 2023 16:58:36 +0000
Received: by outflank-mailman (input) for mailman id 645084;
 Thu, 30 Nov 2023 16:58:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J4Nc=HL=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r8kN1-0006Cl-A9
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 16:58:35 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b24fa7b2-8fa1-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 17:58:34 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 8B8274EE0739;
 Thu, 30 Nov 2023 17:58:33 +0100 (CET)
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
X-Inumbo-ID: b24fa7b2-8fa1-11ee-98e4-6d05b1d4d9a1
MIME-Version: 1.0
Date: Thu, 30 Nov 2023 17:58:33 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?R?=
 =?UTF-8?Q?oger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 2/7] x86/i8259: add missing header for init_IRQ
 declaration
In-Reply-To: <d81a16f5-98e5-467f-8aed-0cb4a84e854e@suse.com>
References: <cover.1701270983.git.nicola.vetrini@bugseng.com>
 <3443c1a877c63f1c6213e0c184e89b20aaa29ffb.1701270983.git.nicola.vetrini@bugseng.com>
 <d81a16f5-98e5-467f-8aed-0cb4a84e854e@suse.com>
Message-ID: <3d4a73182bcdda4951a3e77ab8f42fe2@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-30 17:48, Jan Beulich wrote:
> On 29.11.2023 16:24, Nicola Vetrini wrote:
>> --- a/xen/arch/x86/i8259.c
>> +++ b/xen/arch/x86/i8259.c
>> @@ -19,6 +19,7 @@
>>  #include <xen/delay.h>
>>  #include <asm/apic.h>
>>  #include <asm/asm_defns.h>
>> +#include <asm/setup.h>
>>  #include <io_ports.h>
>>  #include <irq_vectors.h>
> 
> A patch doing this (among other things) is already pending: "x86: 
> detect
> PIC aliasing on ports other than 0x[2A][01]".
> 

Ok

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

