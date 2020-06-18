Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9511FEB7B
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 08:35:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlo8U-00018o-T4; Thu, 18 Jun 2020 06:34:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fT7M=77=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jlo8T-00018j-6k
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 06:34:53 +0000
X-Inumbo-ID: d000fb36-b12d-11ea-ba4c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d000fb36-b12d-11ea-ba4c-12813bfff9fa;
 Thu, 18 Jun 2020 06:34:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 52BDAAC7F;
 Thu, 18 Jun 2020 06:34:54 +0000 (UTC)
Subject: Re: [RFC PATCH v1 2/6] sched: track time spent in hypervisor tasks
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
 <20200612002205.174295-3-volodymyr_babchuk@epam.com>
 <7d3e1741-b8bc-b522-8d64-20ca9c14744b@suse.com> <871rmd3x4m.fsf@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <66826d88-00e6-c618-1f8d-1ca80b247c43@suse.com>
Date: Thu, 18 Jun 2020 08:34:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <871rmd3x4m.fsf@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18.06.2020 04:50, Volodymyr Babchuk wrote:
> Anyways, are you okay with the general approach? We will work out the
> details, but I want to be sure that I'm moving in the right direction.

I'm certainly okay with the goal; I didn't look closely enough to say
I'm okay with the approach - I trust Dario there.

Jan

