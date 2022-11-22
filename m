Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93612634833
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 21:30:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447298.703376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxZun-00077K-FQ; Tue, 22 Nov 2022 20:30:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447298.703376; Tue, 22 Nov 2022 20:30:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxZun-00075B-C5; Tue, 22 Nov 2022 20:30:45 +0000
Received: by outflank-mailman (input) for mailman id 447298;
 Tue, 22 Nov 2022 20:30:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oxZul-00074r-ID
 for xen-devel@lists.xenproject.org; Tue, 22 Nov 2022 20:30:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oxZul-00080J-5z; Tue, 22 Nov 2022 20:30:43 +0000
Received: from [54.239.6.190] (helo=[192.168.0.48])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oxZul-00042Q-0P; Tue, 22 Nov 2022 20:30:43 +0000
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
	bh=9wpPxlQhqGUZjrAVNVC194QPMgHHiJ94+8I+E3EePYQ=; b=oISMxJoNd8F242UAce25QSKb31
	IcFMVBReIJPqjAlVz/lUtqheHSO2nAu9drnV58o3NMuTaQphIu5Iy2dsOpgTdJP3hoWm59kjNPoZ6
	2JguuVu65YoHwFai0lGcWyDAp0nuJD0qiJ+izZqCiW5pGePmrEu06TT2/1uokeABYNro=;
Message-ID: <5bd1cef5-c466-caba-2b4b-24728e223ff6@xen.org>
Date: Tue, 22 Nov 2022 21:30:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [XEN v3 01/12] xen/Arm: vGICv3: Sysreg emulation is applicable
 for AArch64 only
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, jgrall@amazon.com, burzalodowa@gmail.com
References: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
 <20221111141739.2872-2-ayan.kumar.halder@amd.com>
 <c402e773-b8fe-ae40-4a5f-b8f1326baed1@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c402e773-b8fe-ae40-4a5f-b8f1326baed1@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 17/11/2022 13:05, Michal Orzel wrote:
> Hi Ayan,
> 
> On 11/11/2022 15:17, Ayan Kumar Halder wrote:
>> Sysreg emulation is 64-bit specific, so guard the calls to
>> vgic_v3_emulate_sysreg() as well as the function itself with
>> "#ifdef CONFIG_ARM_64".
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Julien Grall <julien@xen.org>

Cheers,

> 
> ~Michal

-- 
Julien Grall

