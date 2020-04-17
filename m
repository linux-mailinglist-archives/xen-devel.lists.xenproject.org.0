Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 792191ADA1F
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 11:38:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPNSA-00077S-LA; Fri, 17 Apr 2020 09:38:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=x8HM=6B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jPNS9-00077N-P5
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 09:38:29 +0000
X-Inumbo-ID: 31374ccc-808f-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31374ccc-808f-11ea-b58d-bc764e2007e4;
 Fri, 17 Apr 2020 09:38:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 47E5FAD03;
 Fri, 17 Apr 2020 09:38:27 +0000 (UTC)
Subject: Re: [ANNOUNCE] Xen 4.14 Development Update
To: pdurrant@amazon.com, andrew.cooper3@citrix.com
References: <20200417091057.136-1-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <15ddf257-adb3-9384-0b38-d5ecd568746b@suse.com>
Date: Fri, 17 Apr 2020 11:38:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417091057.136-1-paul@xen.org>
Content-Type: text/plain; charset=utf-8
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
Cc: xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17.04.2020 11:10, Paul Durrant wrote:
> *  Memory read caching in emulation (v5)
>   -  Jan Beulich

I'd like to take this as an opportunity to ask on the disposition
of this series: Under the new rules in principle I could have put
this in with Paul's R-b, but given the prior discussions I didn't
want to do so without at least an informal okay from you, Andrew.
Now that the sending of v5 as well as Paul's reviewing of it is 6
weeks back, I guess unless I hear otherwise pretty soon I'm going
to commit the remaining 3 patches some time next week.

Jan

