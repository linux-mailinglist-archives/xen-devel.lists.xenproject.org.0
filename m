Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F5C339101
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 16:18:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97184.184467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKjYS-0006QY-Hy; Fri, 12 Mar 2021 15:18:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97184.184467; Fri, 12 Mar 2021 15:18:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKjYS-0006QC-Ef; Fri, 12 Mar 2021 15:18:20 +0000
Received: by outflank-mailman (input) for mailman id 97184;
 Fri, 12 Mar 2021 15:18:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=msqr=IK=amazon.com=prvs=69800c1f5=andyhsu@srs-us1.protection.inumbo.net>)
 id 1lKjYQ-0006Q7-TM
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 15:18:18 +0000
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51a1c8db-385e-4e34-85ae-1cdc7be4577a;
 Fri, 12 Mar 2021 15:18:18 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-859fe132.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 12 Mar 2021 15:18:11 +0000
Received: from EX13D12EUA002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2b-859fe132.us-west-2.amazon.com (Postfix) with ESMTPS
 id CF1DD220186; Fri, 12 Mar 2021 15:18:09 +0000 (UTC)
Received: from 147dda3ee008.ant.amazon.com (10.43.162.213) by
 EX13D12EUA002.ant.amazon.com (10.43.165.103) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 12 Mar 2021 15:18:06 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 51a1c8db-385e-4e34-85ae-1cdc7be4577a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1615562299; x=1647098299;
  h=to:cc:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding:subject;
  bh=fXChBcwn3i8+I8FRgnwJ2UacpPT+Q/2Jk1d/TX9xTNU=;
  b=bZyNTpJOkd/ZxN1TLhFvDaZLq7+fAsfqUcRG+5CshWZUk4bcLmW9O8ML
   0uNMAYsNRVV7p0Bhv1fAsUP9sx5DgJ04UE8/zTh9H+Ie3QuuvTjx70rOo
   wGeMoHtXeDz7HmjoaNzAtsVMCAU3o/Uo72mwkq5GHxHOTSJ6Lh7y17dkk
   o=;
IronPort-HdrOrdr: A9a23:jABeqaDMkSulc2PlHekZ55DYdL4zR+YMi2QD/UoZc20zTuWzkc
 eykPMHkSLlkTp5YgBHpfmsGomlBUnd+5l8/JULMd6ZNjXOlWO0IOhZnOjf6hL6HSmWzI5g/I
 NBV4Q7N9HqF1h9iq/BgTWQN9o72tGI/OSJqI7lvhVQZDpnYa1h8At1YzzzeiZLbTNbDpk0Ho
 f03LsjmxOcfx0sH6CGL0hAceyGg9HQjprpbVo9GhY75GC14Q+A2frVFR6X2xtbfhFu5fMZ8W
 bDmxHk/anLiZyG4y6Z+WnU4ZFb3OHk18IGPsqRkcIYQw+Cti+YIL9sUbGDozw5ydvA1GoX
X-IronPort-AV: E=Sophos;i="5.81,243,1610409600"; 
   d="scan'208";a="92520097"
Subject: Re: [net-next 1/2] xen-netback: add module parameter to disable ctrl-ring
To: Andrew Lunn <andrew@lunn.ch>
CC: <netdev@vger.kernel.org>, <wei.liu@kernel.org>, <paul@xen.org>,
	<davem@davemloft.net>, <kuba@kernel.org>, <xen-devel@lists.xenproject.org>
References: <20210311225944.24198-1-andyhsu@amazon.com>
 <YEuAKNyU6Hma39dN@lunn.ch>
From: "Hsu, Chiahao" <andyhsu@amazon.com>
Message-ID: <ec5baac1-1410-86e4-a0d1-7c7f982a0810@amazon.com>
Date: Fri, 12 Mar 2021 16:18:02 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YEuAKNyU6Hma39dN@lunn.ch>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.43.162.213]
X-ClientProxiedBy: EX13D04UWB002.ant.amazon.com (10.43.161.133) To
 EX13D12EUA002.ant.amazon.com (10.43.165.103)
Precedence: Bulk


Andrew Lunn 於 2021/3/12 15:52 寫道:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
>
>
>
> On Thu, Mar 11, 2021 at 10:59:44PM +0000, ChiaHao Hsu wrote:
>> In order to support live migration of guests between kernels
>> that do and do not support 'feature-ctrl-ring', we add a
>> module parameter that allows the feature to be disabled
>> at run time, instead of using hardcode value.
>> The default value is enable.
> Hi ChiaHao
>
> There is a general dislike for module parameters. What other mechanisms
> have you looked at? Would an ethtool private flag work?
>
>       Andrew


Hi Andrew,

I can survey other mechanisms, however before I start doing that,

could you share more details about what the problem is with using module 
parameters? thanks.

ChiaHao


