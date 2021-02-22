Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D04F6321F82
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 20:00:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88352.166093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEGRW-0007Xp-3u; Mon, 22 Feb 2021 19:00:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88352.166093; Mon, 22 Feb 2021 19:00:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEGRW-0007XQ-0o; Mon, 22 Feb 2021 19:00:26 +0000
Received: by outflank-mailman (input) for mailman id 88352;
 Mon, 22 Feb 2021 19:00:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NRjd=HY=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1lEGRU-0007XL-4w
 for xen-devel@lists.xen.org; Mon, 22 Feb 2021 19:00:24 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c139c3c-4d09-4f0d-89a8-f90678af1187;
 Mon, 22 Feb 2021 19:00:23 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 161402040932016.64447211319191;
 Mon, 22 Feb 2021 11:00:09 -0800 (PST)
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
X-Inumbo-ID: 4c139c3c-4d09-4f0d-89a8-f90678af1187
ARC-Seal: i=1; a=rsa-sha256; t=1614020415; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mRB2FRsysLflKMTYK8Z6+7ex5pijr4ZEshrObNKPaAynQ61TL/WwMHyqlP2zzH1RPewaRAYrxBJncYqji+nr3sh6BVYrQzjiOw6T8/ODjIj9ol0oINh1M+zqfemVS4ARuh0i53HgbgJHTldHPiysuDx9C0q4qkXP5MihZcrhqHw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1614020415; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=WaT7MlNB652JgJQRnrZ0dkEP9j85MD51klliJzSmi0w=; 
	b=EAlF9CsqQkybHVp4Z9d7EDR+qT5lG4z4nEDhk1rALGTENyHg3bzBgtv0E4T7/9lusFdDnonpzrLpsTyvHXvw9RRFF+eVGEkJZS74mnzbLQgbn1IZb0iHGzqcnyfuoxUqmb8HzceUXM5wxCruH/RnaImsGQKohQs88bWDWlWuPLE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com> header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1614020415;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=WaT7MlNB652JgJQRnrZ0dkEP9j85MD51klliJzSmi0w=;
	b=qN8i2MTmRc5creVnav+dME6b+d8QkuzIowpX1Jl3WHmX6zXhYl+6setoxWui/VvP
	oWKiiqVGjv0byjGzz9oxlf3/BqWaRWNe/31ZGhSQDh5hqNpc9EeA+UMIgzF1eds8V5+
	oprLvnfKz45p1PDFyL77+92hiQl/GYdU1ssiQGLU=
Subject: Re: DomB Working Group
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, bertrand.marquis@arm.com, roger.pau@citrix.com,
 julien@xen.org, Stefano Stabellini <sstabellini@kernel.org>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Rich Persaud <persaur@gmail.com>, adam.schwalm@starlab.io
References: <d0b1a7d1-2260-567b-fd8d-04e32a3504f2@apertussolutions.com>
Message-ID: <5d6bef74-8030-0058-85cd-a764bf31e196@apertussolutions.com>
Date: Mon, 22 Feb 2021 14:00:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <d0b1a7d1-2260-567b-fd8d-04e32a3504f2@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 2/5/21 2:12 PM, Daniel P. Smith wrote:
> Greetings,
> 
> Per the community call on Feb. 4 I would like to get the working group
> started that will be reviewing the major design decisions for the DomB
> implementation. A summary of the discussion around the two primary
> decisions we are seeking to get resolved are as follows,
> 
> 
> Topic: DomB: Adoption of Device Tree as the format for the Launch
> Control Module
> * Consensus approval from x86 and Arm maintainers and members of the Xen
> community on the call to proceed with Device Tree as the format for the
> DomB LCM (described in the previous mailing list posts).
> 
> - a working group will follow up on the work for handling migration of
> device tree handling code within the hypervisor, previously imported
> from outside the project, from the Arm hypervisor code into Common.
> 
> Topic: DomB: Surfacing configuration data to guests: ACPI tables, Device
> Tree
> * Recommendation was that both will be needed, and OK to proceed with
> just implementing one but plan and design for the second to be added.
> First is likely to be ACPI; to be determined as development progress is
> made.
> 
> 
> To continue the discussion from there, I would like to propose a call on
> Thursday February 11th at 1700UTC, 0900PST/1200EST/1800CEST. I have
> provided call details below for those who are able to attend. The agenda
> is available on CryptPad. If you are not able to attend, please reach
> out directly. Thanks and hope to see everyone on the call!
> 
> 
> Agenda
> ======
> https://cryptpad.fr/pad/#/2/pad/edit/iVEku8zImQg320a3D4IBAKQh/

In case any who was not able to attend and would like some to see what
was discussed, you can find the meeting minutes at the link below.

https://cryptpad.fr/pad/#/2/pad/view/SVV9D9eA90bRT9Lwb-nycaw4ugKcpLJhN+odyFspd-0/

V/r,
dps

