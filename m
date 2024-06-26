Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1301A9178D6
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 08:22:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748382.1156084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMM2c-0000HS-02; Wed, 26 Jun 2024 06:22:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748382.1156084; Wed, 26 Jun 2024 06:22:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMM2b-0000EN-TQ; Wed, 26 Jun 2024 06:22:01 +0000
Received: by outflank-mailman (input) for mailman id 748382;
 Wed, 26 Jun 2024 06:22:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P08s=N4=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sMM2b-0000EH-Be
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 06:22:01 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64f43833-3384-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 08:21:59 +0200 (CEST)
Received: from [10.176.134.80] (unknown [160.78.253.181])
 by support.bugseng.com (Postfix) with ESMTPSA id C04D24EE0738;
 Wed, 26 Jun 2024 08:21:58 +0200 (CEST)
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
X-Inumbo-ID: 64f43833-3384-11ef-b4bb-af5377834399
Message-ID: <16db53f9-144b-4cdb-a22d-837b4dae15ef@bugseng.com>
Date: Wed, 26 Jun 2024 08:21:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH for 4.19] automation/eclair: add deviations agreed in
 MISRA meetings
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <4a65e064768ad5ddce96d749f24f0bdae2c3b9da.1719328656.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2406251850281.3635@ubuntu-linux-20-04-desktop>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <alpine.DEB.2.22.394.2406251850281.3635@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/06/24 03:59, Stefano Stabellini wrote:
> On Tue, 25 Jun 2024, Federico Serafini wrote:
>> Update ECLAIR configuration to take into account the deviations
>> agreed during the MISRA meetings.
>>
>> While doing this, remove the obsolete "Set [123]" comments.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Thank you! Many of these deviations are really important!
> 
> I double-checked everything and it looks good. I have 2 requests for
> changes below to keep deviations.rst updated. I made few comments about
> some deviations that could potentially done with SAF in-code comments
> but given the state of the release I think it is OK.
> 
> I would like to ask a release-ack, especially for all the deviations
> about conversions because those are critical. I think the rest is OK
> too.

The new version of the patch:
https://lists.xenproject.org/archives/html/xen-devel/2024-06/msg01471.html

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

