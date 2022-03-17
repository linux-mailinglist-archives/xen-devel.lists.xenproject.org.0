Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1DD4DC4E2
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 12:34:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291525.494843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUoOW-0005Sl-CO; Thu, 17 Mar 2022 11:34:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291525.494843; Thu, 17 Mar 2022 11:34:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUoOW-0005Q6-8s; Thu, 17 Mar 2022 11:34:16 +0000
Received: by outflank-mailman (input) for mailman id 291525;
 Thu, 17 Mar 2022 11:34:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u299=T4=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nUoOU-0005Q0-Jw
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 11:34:14 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 2b0240fe-a5e6-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 12:34:13 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04E701FB;
 Thu, 17 Mar 2022 04:34:12 -0700 (PDT)
Received: from [10.57.72.159] (unknown [10.57.72.159])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 74C733F766;
 Thu, 17 Mar 2022 04:34:10 -0700 (PDT)
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
X-Inumbo-ID: 2b0240fe-a5e6-11ec-8eba-a37418f5ba1a
Message-ID: <e56f8a28-83ad-849f-46c6-36b676bb6bc4@arm.com>
Date: Thu, 17 Mar 2022 12:33:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, christopher.w.clark@gmail.com,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
From: Michal Orzel <michal.orzel@arm.com>
Subject: v2: XTF on arm
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

Following up a discussion from the v1 of "XTF on arm" patch series(it's been almost a year),
I created a new version with the following major changes:
-fixed comments from v1
-no non-MMU environment for arm64
-no PL011 driver
-no test-naming/xtf-runner modifications to make OSSTEST happy

Please review, comment, ask questions.

Link to the v2:
https://github.com/andyhhp/xtf/pull/6

Cheers,
Michal

