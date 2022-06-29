Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FCF55FDB8
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 12:47:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357800.586616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6VDe-0006u3-6z; Wed, 29 Jun 2022 10:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357800.586616; Wed, 29 Jun 2022 10:46:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6VDe-0006qb-3w; Wed, 29 Jun 2022 10:46:50 +0000
Received: by outflank-mailman (input) for mailman id 357800;
 Wed, 29 Jun 2022 10:46:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fVKq=XE=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1o6VDc-0006qR-Dp
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 10:46:48 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id c556acd6-f798-11ec-b725-ed86ccbb4733;
 Wed, 29 Jun 2022 12:46:46 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C83E152B;
 Wed, 29 Jun 2022 03:46:46 -0700 (PDT)
Received: from [10.57.39.201] (unknown [10.57.39.201])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1480A3F792;
 Wed, 29 Jun 2022 03:46:43 -0700 (PDT)
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
X-Inumbo-ID: c556acd6-f798-11ec-b725-ed86ccbb4733
Message-ID: <4ee1fbaf-9d31-d28e-cb8d-f330c6a1923f@arm.com>
Date: Wed, 29 Jun 2022 12:46:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/7] xen/common: Use unsigned int instead of plain
 unsigned
Content-Language: en-US
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
References: <20220627131543.410971-1-michal.orzel@arm.com>
 <20220627131543.410971-4-michal.orzel@arm.com>
In-Reply-To: <20220627131543.410971-4-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.06.2022 15:15, Michal Orzel wrote:
> This is just for the style and consistency reasons as the former is
> being used more often than the latter.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

It looks like this change was forgotten when merging other patches from the series.

