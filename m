Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D5479E835
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 14:41:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601265.937247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgPBV-0002vH-6M; Wed, 13 Sep 2023 12:41:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601265.937247; Wed, 13 Sep 2023 12:41:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgPBV-0002tN-3W; Wed, 13 Sep 2023 12:41:33 +0000
Received: by outflank-mailman (input) for mailman id 601265;
 Wed, 13 Sep 2023 12:41:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XHSA=E5=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qgPBT-0002tH-RE
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 12:41:31 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dcfdcaca-5232-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 14:41:30 +0200 (CEST)
Received: from [192.168.1.15] (host-87-19-206-190.retail.telecomitalia.it
 [87.19.206.190])
 by support.bugseng.com (Postfix) with ESMTPSA id E462F4EE074D;
 Wed, 13 Sep 2023 14:41:29 +0200 (CEST)
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
X-Inumbo-ID: dcfdcaca-5232-11ee-8786-cb3800f73035
Message-ID: <9acf798a-9d08-4940-d8e0-20b423294d2e@bugseng.com>
Date: Wed, 13 Sep 2023 14:41:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH] xen/libelf: address violations of MISRA C:2012 RUles
 8.2 and 8.3
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <e4d28b9b78e84260feea6bdbcb4ecdd815af5db3.1694591513.git.federico.serafini@bugseng.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <e4d28b9b78e84260feea6bdbcb4ecdd815af5db3.1694591513.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/09/23 14:29, Federico Serafini wrote:
> Add missing parameter names and make function declarations and
> definitions consistent. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

There is a typo in the patch title (RUles), please correct on commit.

Reviewed-by: Federico Serafini <federico.serafini@bugseng.com>

