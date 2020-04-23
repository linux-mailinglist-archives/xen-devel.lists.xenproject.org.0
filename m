Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 525C71B5A0C
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 13:08:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRZij-0005k7-4B; Thu, 23 Apr 2020 11:08:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0dw1=6H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jRZii-0005k2-G7
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 11:08:40 +0000
X-Inumbo-ID: c8339c8b-8552-11ea-9344-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8339c8b-8552-11ea-9344-12813bfff9fa;
 Thu, 23 Apr 2020 11:08:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7B619B11F;
 Thu, 23 Apr 2020 11:08:37 +0000 (UTC)
Subject: Re: [PATCH v4] x86: irq: Do not BUG_ON multiple unbind calls for
 shared pirqs
To: paul@xen.org, 'Varad Gautam' <vrd@amazon.de>
References: <20200306160254.8465-1-paul@xen.org>
 <58f00871-2fff-be69-299e-e2b9911e0723@suse.com>
 <000301d5f63a$df5f04a0$9e1d0de0$@xen.org>
 <0648e7ac-f5d7-4207-e2c6-8418681cca13@suse.com>
 <004201d5fc70$128cc610$37a65230$@xen.org>
 <8590eadc-b561-ba7c-c474-141102ec76bd@suse.com>
 <005f01d60752$aa090980$fe1b1c80$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ca063a1c-d328-153c-ae9f-b91d496dfaa9@suse.com>
Date: Thu, 23 Apr 2020 13:08:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <005f01d60752$aa090980$fe1b1c80$@xen.org>
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
Cc: xen-devel@lists.xenproject.org, 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Julien Grall' <julien@xen.org>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31.03.2020 13:51, Paul Durrant wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 31 March 2020 08:41
>>
>> On 17.03.2020 16:23, Paul Durrant wrote:
>>> That looks like it will do the job. I'll see if I can get it tested.
>>
>> Any luck with this, yet?
> 
> I have asked Varad to test it. He hopes to get to it this week.

Any news here?

Jan

