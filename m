Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A2E811065
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 12:44:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653958.1020597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDNfB-0006qF-89; Wed, 13 Dec 2023 11:44:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653958.1020597; Wed, 13 Dec 2023 11:44:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDNfB-0006nx-5S; Wed, 13 Dec 2023 11:44:29 +0000
Received: by outflank-mailman (input) for mailman id 653958;
 Wed, 13 Dec 2023 11:44:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jVlV=HY=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rDNfA-0006nr-8G
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 11:44:28 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f777e563-99ac-11ee-9b0f-b553b5be7939;
 Wed, 13 Dec 2023 12:44:26 +0100 (CET)
Received: from [192.168.1.15] (host-82-60-45-193.retail.telecomitalia.it
 [82.60.45.193])
 by support.bugseng.com (Postfix) with ESMTPSA id 9C0B44EE0737;
 Wed, 13 Dec 2023 12:44:25 +0100 (CET)
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
X-Inumbo-ID: f777e563-99ac-11ee-9b0f-b553b5be7939
Message-ID: <9de5ec9d-1ebd-4fa9-89d4-e962d7c377e0@bugseng.com>
Date: Wed, 13 Dec 2023 12:44:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, it
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org,
 "consulting@bugseng.com" <consulting@bugseng.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Subject: X86: MISRA C:2012 Rule 5.6
Organization: BUGSENG srl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello everyone,

I have another question regarding Rule 5.6 ("A `typedef' name shall be
a unique identifier"), this time for X86:
the violations left [1] involve guest_intpte_t, guest_l1e_t and
guest_l2e_t, which seem to be deliberately defined differently depending
on the number of guest paging levels.
I would like to propose a deviation for these types, do you agree?

[1]
https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/staging/X86_64-2023/446/PROJECT.ecd;/by_service/MC3R1.R5.6.html

Regards
-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

