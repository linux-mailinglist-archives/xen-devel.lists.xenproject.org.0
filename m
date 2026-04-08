Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8O1QJukj1mklBQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 11:46:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CD03BA150
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 11:46:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275554.1561340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAPU9-00015w-Nf; Wed, 08 Apr 2026 09:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275554.1561340; Wed, 08 Apr 2026 09:46:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAPU9-00013r-KB; Wed, 08 Apr 2026 09:46:09 +0000
Received: by outflank-mailman (input) for mailman id 1275554;
 Wed, 08 Apr 2026 09:46:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1wAPU8-00012V-7m
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 09:46:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAPU7-004ggW-Ii
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 11:46:07 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 69d623dd-5cb7-0a2a0a5109dd-0a2a4504a398-8
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 11:46:07 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 69d623df-bb33-0a2a45040019-a237832f9b02-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 11:46:07 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 14C154EE3C0D;
 Wed,  8 Apr 2026 11:46:07 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1775641567;
	b=JGjmYZyOAsbwuiMD6FjKmlW9mfxp0Xd5VNrZ2Ehc+hZJX81lpWJHN47hzBf1btyS28KF
	 35zzqMAohzPTt2kUbMY+KIF55ygDPJm4j+ACyXnby1ZEQsC8EfO0NJ4b6I8pNdV+HzGJZ
	 aEbSrkUTbsLe6VSXm4iSv7HW11juSu493f9oApy/KXiip+djaHFk86KqNcenqVfo+DhEP
	 hPR3Hv9uYmew/sZbQLt9J17mUos3z1n3nX1NfOuQKa3yS6TqnBFAT3M4XVNrMA3tpneMl
	 imw8dCG3xDkIyqXPJTOyYbD7Ch5PZkxc7qifDdMzM44T+Zrg2T665LNQnRmq8E6FIq25g
	 2qxD0/PIdx6QysWeoZI1W0BBV0EWqqmjIwX1IR1sZYhUwMdaUwgwgTyra9Ng90qqBzuil
	 ccapBQeu2HGAJdulVU26bn/s8tgpWgaulOg8GwHqBm5d1qyqicObtU3JRkFGMhTz20W9P
	 0CHPPEhhmthZEBXTETayArgVfit42/iL6XZZq2p5hy0lX4QwproFtdjYktI2AoHXnf/aB
	 pGsigGGqcFK0qCpRJ7yyek7J0o9ofBw3cssCDHnI2iKbFNvH7drzD0iXA4ddaY5wBXVIG
	 nHech8r348uFvGojvBFG+TkW/AC/pUBuVS/mZuLn+crS+lolJvV/xzKKJcB8pr4=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1775641567;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=o8pjVGQOPOGXPvv25UbA6zDoKtK4aRmloMG823Xxr4U=;
	b=WI0IRWj82rjflsWEmcNDF/GDafBVAhBkCM51CwGy49S4crzcy7tJbX/juT+tgHHaSDSf
	 RgHzcqQr1cR6+X2Ax3LXNVHDiVgUW7JpIXDHTnTajPVEZoBUdLjaqrE+IV/dJraP/R9Bq
	 KWB0tCLJSCzwyk4/xIbmZgJpGHWwbdr2g7qCSAVuAcFN1bwYU2M8cVHsk2f3WIGbTawP6
	 IWMbzMxzWg2cfZLUUmqrJ6GVtmA9xHhTJcUl9qF6bBL+C9rHUbHNz9sg3mzSNvuQdaOk4
	 YvMQpoF9nbbf4xOux/zOOeinxaHTr2iC0OkS6C13TyHEOL8lBCVEcNJ2tIqB6Afu4t+Ld
	 mAddu0scRYd1Mn+Q0eBM2A4atUbtdkqzbVZbCxeASE00he4MV34/WTcsr3X5fsyW6UII9
	 rflSJtoSZ+/8+cupLoWQHL0Z4rQ4VzPRhyuHDhmFcxY2OUhHXGfWsM9NOJNsYTcGlo48T
	 V7ksOkv0EwxTEtouIdmj/lW0kmd2vh2GE4pWCk7l1R5vDOwjR871p+rv1w3Tqr9WXsz0O
	 +DK3oc3ZrD2VyjBQpUYHpsWmeECXNuzEJ+pn5FjQOJWJL1etppF1tE8kU2v1zB/uq7Z6b
	 WwEyhyR2zW0nd0s4IqEy8Qs67dr+1gKUC13adtcJn5JNT0omBiloe5pZ41qXfAU=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Wed, 08 Apr 2026 11:46:07 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Michal Orzel
 <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>, Rahul
 Singh <rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 0/2] Final series to make Arm MISRA allcode green
In-Reply-To: <68cea196-efdc-4481-9e4b-bb450bcd2071@citrix.com>
References: <20260407103434.90838-1-michal.orzel@amd.com>
 <68cea196-efdc-4481-9e4b-bb450bcd2071@citrix.com>
Message-ID: <bdb8e991bbd200de2f0af5991304dffb@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1775641567-3172251B-88AE9EBC/0/0
X-purgate-type: clean
X-purgate-size: 896
X-Spamd-Result: default: False [-1.39 / 15.00];
	ARC_ALLOW(-1.00)[bugseng.com:s=openarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[bugseng.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,linkedin.com:url,b.sc:url,gitlab.com:url];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.084];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 47CD03BA150
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-04-08 11:22, Andrew Cooper wrote:
> On 07/04/2026 11:34 am, Michal Orzel wrote:
>> No more regressions for clean guidelines:
>> https://gitlab.com/xen-project/people/morzel/xen/-/pipelines/2433943072
>> 
>> Michal Orzel (2):
>>   iommu/arm: smmu: Fix variable shadowing
>>   iommu/arm: ipmmu-vmsa: Fix variable shadowing
>> 
>>  xen/drivers/passthrough/arm/ipmmu-vmsa.c | 6 ++----
>>  xen/drivers/passthrough/arm/smmu.c       | 7 +++----
>>  2 files changed, 5 insertions(+), 8 deletions(-)
> 
> If all the violations are fixed, should this test be made blocking?
> 
> ~Andrew

Only if they are also clean on x86; otherwise an arm-specific list of 
clean rules should be made (probably better). @Michal what do you 
prefer?

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

