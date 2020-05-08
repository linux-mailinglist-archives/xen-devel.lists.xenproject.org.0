Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3F41CA96F
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 13:21:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jX13O-0004Xl-K4; Fri, 08 May 2020 11:20:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t3Kb=6W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jX13N-0004Xf-Lr
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 11:20:29 +0000
X-Inumbo-ID: eb6de648-911d-11ea-9fe0-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb6de648-911d-11ea-9fe0-12813bfff9fa;
 Fri, 08 May 2020 11:20:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 97044AF3B;
 Fri,  8 May 2020 11:20:29 +0000 (UTC)
Subject: Re: Xen Coding style
To: Julien Grall <julien@xen.org>
References: <ad26bbdc-5209-ce0c-7956-f8b08e6c2492@amazon.com>
 <8771c424-6340-10e5-1c1f-d72271ab8c1b@suse.com>
 <38926d4e-3429-58bc-f43c-514aed253a8e@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3b55f045-c6a0-af62-c607-3a85d38cea25@suse.com>
Date: Fri, 8 May 2020 13:20:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <38926d4e-3429-58bc-f43c-514aed253a8e@xen.org>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>,
 "committers@xenproject.org" <committers@xenproject.org>, "Woodhouse,
 David" <dwmw@amazon.co.uk>, "paul@xen.org" <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08.05.2020 12:00, Julien Grall wrote:
> You seem to be the maintainer with the most unwritten rules. Would
> you mind to have a try at writing a coding style based on it?

On the basis that even small, single aspect patches to CODING_STYLE
have been ignored [1], I don't think this would be a good use of my
time. If I was promised (reasonable) feedback, I could take what I
have and try to add at least a few more things based on what I find
myself commenting on more frequently. But really I'd prefer it to
be done the other way around - for people to look at the patches
already sent, and for me to only subsequently send more. After all,
if already those adjustments are controversial, I don't think we
could settle on others.

Jan

[1] https://lists.xenproject.org/archives/html/xen-devel/2019-07/msg01234.html

