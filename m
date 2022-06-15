Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED2E54C571
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 12:07:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349865.576058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1Pv7-0006rz-KT; Wed, 15 Jun 2022 10:06:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349865.576058; Wed, 15 Jun 2022 10:06:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1Pv7-0006ob-HB; Wed, 15 Jun 2022 10:06:41 +0000
Received: by outflank-mailman (input) for mailman id 349865;
 Wed, 15 Jun 2022 10:06:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qil0=WW=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1o1Pv6-0006oV-BP
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 10:06:40 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id d81d7da8-ec92-11ec-bd2c-47488cf2e6aa;
 Wed, 15 Jun 2022 12:06:38 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61055153B;
 Wed, 15 Jun 2022 03:06:37 -0700 (PDT)
Received: from [10.57.11.80] (unknown [10.57.11.80])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 533F03F792;
 Wed, 15 Jun 2022 03:06:35 -0700 (PDT)
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
X-Inumbo-ID: d81d7da8-ec92-11ec-bd2c-47488cf2e6aa
Message-ID: <8d608c16-b325-d849-1e10-ba40c88d0f5b@arm.com>
Date: Wed, 15 Jun 2022 12:06:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3] xen: Add MISRA support to cppcheck make rule
Content-Language: en-US
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <82a29dff7a0da97cc6ad9d247a97372bcf71f17c.1654850751.git.bertrand.marquis@arm.com>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <82a29dff7a0da97cc6ad9d247a97372bcf71f17c.1654850751.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.06.2022 11:13, Bertrand Marquis wrote:
> cppcheck MISRA addon can be used to check for non compliance to some of
> the MISRA standard rules.
> 
> Add a CPPCHECK_MISRA variable that can be set to "y" using make command
> line to generate a cppcheck report including cppcheck misra checks.
> 
> When MISRA checking is enabled, a file with a text description suitable
> for cppcheck misra addon is generated out of Xen documentation file
> which lists the rules followed by Xen (docs/misra/rules.rst).
> 
> By default MISRA checking is turned off.
> 
> While adding cppcheck-misra files to gitignore, also fix the missing /
> for htmlreport gitignore
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
The validation was successful so:
Reviewed-by: Michal Orzel <michal.orzel@arm.com>
Tested-by: Michal Orzel <michal.orzel@arm.com>

Cheers

