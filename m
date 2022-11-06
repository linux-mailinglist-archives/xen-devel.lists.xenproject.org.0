Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF5061E539
	for <lists+xen-devel@lfdr.de>; Sun,  6 Nov 2022 19:06:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.438615.692650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ork2F-0001ns-KZ; Sun, 06 Nov 2022 18:06:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 438615.692650; Sun, 06 Nov 2022 18:06:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ork2F-0001lE-HK; Sun, 06 Nov 2022 18:06:19 +0000
Received: by outflank-mailman (input) for mailman id 438615;
 Sun, 06 Nov 2022 18:06:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ork2E-0001l2-0E
 for xen-devel@lists.xenproject.org; Sun, 06 Nov 2022 18:06:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ork2D-00059E-Ll; Sun, 06 Nov 2022 18:06:17 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ork2D-0000F4-Fr; Sun, 06 Nov 2022 18:06:17 +0000
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
	bh=lQwMZSmmrAxYBDoi9ykyFwS3TPPWUboE4oCUWzi1Bfc=; b=23cJfuLI3zou4jAowhU5lBS3JO
	VV8Fh+3vsetNtn8x/mNmL4ph5Dwbhd9HKAICCcJKLaIm/Ym+LmncFCLTzwCjJXt3Lvo0+E5RgvVJz
	WfiEwVNfw5kSLE4OQShDZ4ztzjX16EGOblO0//VGbXCoqWpDuxnf38kVwkB2WpWdMtjQ=;
Message-ID: <eb1c388e-bb92-14a4-5f83-7fc856f52649@xen.org>
Date: Sun, 6 Nov 2022 18:06:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [XEN v2 06/12] xen/Arm: vGICv3: Fix emulation of ICC_SGI1R on
 AArch32
To: Michal Orzel <michal.orzel@amd.com>, Ayan Kumar Halder
 <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, burzalodowa@gmail.com
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-7-ayankuma@amd.com>
 <2cd6324e-71eb-f489-15ac-8c7438e03b0a@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2cd6324e-71eb-f489-15ac-8c7438e03b0a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02/11/2022 10:41, Michal Orzel wrote:
> Hi Ayan,
> 
> On 31/10/2022 16:13, Ayan Kumar Halder wrote:
>>
>>
>> Refer Arm IHI 0069H ID020922, 12.5.23, ICC_SGI1R is a 64 bit register on
>> Aarch32 systems. Thus, the prototype needs to change to reflect this.
> NIT: prototype means function declaration.
> vgic_v3_to_sgi is a function that has no prototype.
> 
> Apart from that:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

