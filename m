Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBCB1ABBE0
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 10:58:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP0LM-00011q-OE; Thu, 16 Apr 2020 08:57:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fNsn=6A=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jP0LL-00011l-CR
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 08:57:55 +0000
X-Inumbo-ID: 5ba42716-7fc0-11ea-8b69-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ba42716-7fc0-11ea-8b69-12813bfff9fa;
 Thu, 16 Apr 2020 08:57:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6ED2AAD60;
 Thu, 16 Apr 2020 08:57:52 +0000 (UTC)
Subject: Re: [PATCH] sched: print information about scheduler granularity
To: Sergey Dyasli <sergey.dyasli@citrix.com>, xen-devel@lists.xenproject.org
References: <20200416083341.21122-1-sergey.dyasli@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <996ed66e-3782-5187-a804-9291741a2241@suse.com>
Date: Thu, 16 Apr 2020 10:57:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200416083341.21122-1-sergey.dyasli@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16.04.20 10:33, Sergey Dyasli wrote:
> Currently it might be not obvious which scheduling mode is being used
> by the scheduler. Alleviate this by printing additional information
> about the selected granularity. Messages now look like these:
> 
> 1. boot
> (XEN) [00089808f0ea7496] Using scheduler: SMP Credit Scheduler (credit) in core-scheduling mode
> 
> 2. xl debug-keys r
> (XEN) [   45.914314] Scheduler: SMP Credit Scheduler (credit) in 2-way core-scheduling mode
> 
> Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>

Hmm, do we need that?

The xen commandline ins part of the boot messages and is contained
in the "xl info" output.


Juergen

