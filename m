Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A6973E349
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 17:28:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555584.867474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDo8o-0003Gd-3r; Mon, 26 Jun 2023 15:28:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555584.867474; Mon, 26 Jun 2023 15:28:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDo8o-0003EK-0X; Mon, 26 Jun 2023 15:28:34 +0000
Received: by outflank-mailman (input) for mailman id 555584;
 Mon, 26 Jun 2023 15:28:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dpUb=CO=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qDo8n-0003EC-7O
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 15:28:33 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bd8d44c-1436-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 17:28:32 +0200 (CEST)
Received: from [192.168.1.198] (unknown [151.35.129.1])
 by support.bugseng.com (Postfix) with ESMTPSA id A04964EE0738;
 Mon, 26 Jun 2023 17:28:29 +0200 (CEST)
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
X-Inumbo-ID: 1bd8d44c-1436-11ee-b237-6b7b168915f2
Message-ID: <7224e5c3-fd82-bc2a-7278-73b9adb44955@bugseng.com>
Date: Mon, 26 Jun 2023 17:28:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN PATCH v5] xen/include: avoid using a compiler extension for
 BUILD_BUG_ON_ZERO
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, jbeulich@suse.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>
References: <10f8685626fa4a9d131186a23b293479cb92da38.1687791626.git.nicola.vetrini@bugseng.com>
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
In-Reply-To: <10f8685626fa4a9d131186a23b293479cb92da38.1687791626.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Sorry, this patch was not meant to be sent.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

