Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E05615DAD
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 09:31:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435617.689218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq998-0001CK-L0; Wed, 02 Nov 2022 08:30:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435617.689218; Wed, 02 Nov 2022 08:30:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq998-0001AV-I5; Wed, 02 Nov 2022 08:30:50 +0000
Received: by outflank-mailman (input) for mailman id 435617;
 Wed, 02 Nov 2022 08:30:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oq996-0001AP-PD
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 08:30:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oq98w-0005KG-5V; Wed, 02 Nov 2022 08:30:38 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oq98v-000727-U8; Wed, 02 Nov 2022 08:30:38 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=X7YYZ4rzCBfvxVCsi13grVypqhTEE+93bLHLzJMi/YQ=; b=3Mo15bwNeJenAVJDtqmFqs7UJY
	QX7G1zWlYT81ilr+s7qlJuabdiwOuQETYDpi1Dz2VVT3e01vrhel7nQr5sEjBbDuVAnO8HFSjccwU
	6eyaj0+dGLZ8vVeYNgthogvRMYV7cldRzIlA7g3xPxNmVHnoynrm2PNfExhFHnG3ArDI=;
Message-ID: <af704b53-c161-7b20-e0d8-1ec9e081fc3e@xen.org>
Date: Wed, 2 Nov 2022 08:30:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: Feedback for postponing the 4.17 release to a week later
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Henry Wang <Henry.Wang@arm.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
 "christopher.clark@starlab.io" <christopher.clark@starlab.io>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall
 <jgrall@amazon.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "jgross@suse.com" <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 "Wei Liu (LSG)" <liuwe@microsoft.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <AS8PR08MB79919CCB4F14F5FDE8929DF092329@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <e7c17d83-d9f2-bb9e-24ae-8bc44005deeb@xen.org>
 <b1312717-15c8-f90a-c84f-1bf8709007ee@suse.com>
 <AS8PR08MB7991F1F7CCC8AC6A56F9F0E492329@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <AS8PR08MB7991C642E1CDFA9B2B97E10392399@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <f2a40ec3-1891-90ef-421c-97febd221127@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f2a40ec3-1891-90ef-421c-97febd221127@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02/11/2022 07:27, Jan Beulich wrote:
> On 02.11.2022 04:00, Henry Wang wrote: >>
>> Also I think we need to submit a patch to make the default CONFIG_DEBUG
>> to n in Kconfig? Thanks!
> 
> Iirc what was done in 4.16 was to switch to non-debug immediately after
> branching, on the new branch only. That was specifically to keep debug
> enabled at all times (and no undue code churn) in staging. Debug
> intermediately off was (earlier on) observed to result in huge Coverity
> reports, because of the perceived differences in the pre-processed /
> produced code.

That's correct. I will send the patch once we agreed when to branch.

@Henry, From the previous discussion, it seems like we still have some 
blocker. Do we have any update on them?

Cheers,

-- 
Julien Grall

