Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A50B23D891
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 11:25:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3c9U-0002Lg-MS; Thu, 06 Aug 2020 09:25:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gxiU=BQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3c9S-0002LU-In
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 09:25:30 +0000
X-Inumbo-ID: 17ea8c05-211c-4fd0-ba8f-6cf1a8fcaace
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 17ea8c05-211c-4fd0-ba8f-6cf1a8fcaace;
 Thu, 06 Aug 2020 09:25:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 619E1ADE2;
 Thu,  6 Aug 2020 09:25:46 +0000 (UTC)
Subject: Re: [PATCH 1/4] build: work around bash issue
To: Julien Grall <julien@xen.org>
References: <305c2532-408a-9f78-61fe-c90a2e86eb8e@suse.com>
 <b427e8e6-b9ff-65d2-074b-19439a2e3d02@suse.com>
 <e8006147-31e5-d4c5-8c13-74250f267c0c@xen.org>
 <df45f8af-a32b-67cf-2f56-4761ce263a28@suse.com>
 <1a3325a8-a59a-7759-b7a9-9263652b429c@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0f853234-3f62-de82-d083-3c0cfc285c20@suse.com>
Date: Thu, 6 Aug 2020 11:25:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1a3325a8-a59a-7759-b7a9-9263652b429c@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06.08.2020 11:20, Julien Grall wrote:
> On 06/08/2020 10:14, Jan Beulich wrote:
>> I've observed it with 3.2.57(2).
> 
> Thank you. Please mention it in the commit message.

Well, added. If I had seen any use of the precise version, I would
have done so right away. Would you mind educating me how knowing
the precise version is useful, without knowing up to which version
the issue exists?

Jan

