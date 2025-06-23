Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 006B3AE37B3
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 10:03:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022121.1397843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTc8r-0001Xo-K7; Mon, 23 Jun 2025 08:03:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022121.1397843; Mon, 23 Jun 2025 08:03:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTc8r-0001Vd-HO; Mon, 23 Jun 2025 08:03:01 +0000
Received: by outflank-mailman (input) for mailman id 1022121;
 Mon, 23 Jun 2025 08:02:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uTc8p-0001VX-Mg
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 08:02:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uTc8o-00G9Iz-2N;
 Mon, 23 Jun 2025 08:02:58 +0000
Received: from [2a02:8012:3a1:0:bd17:6d03:6e6c:1c7e]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uTc8o-00EPUt-1a;
 Mon, 23 Jun 2025 08:02:58 +0000
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
	bh=P07+I6otFC4SHhPg8wKtFmmoRpUD0ra2oZ4NPG/04C4=; b=sxD9u3FQPG5Yrby0ufy7T7FmGY
	zmsaG0XpAZC12blNSoQJPGaF5cGNsgj7d6xM8us3wIGH3J39LJz3An5VTmTcjzXB4rv/3WVu7oqCI
	vxqc3NxC+BJnUCRMSjaBAE2swSdmnaf7a3s3m4N4OpkWr8Cgrig/ymgZ35ziEFZ8Zr0o=;
Message-ID: <3468bb57-3178-460b-8fb2-3ce106475319@xen.org>
Date: Mon, 23 Jun 2025 09:02:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 8/8] docs: armproposa: l to add separate SCMI node
 for Xen agent
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com>
 <3f7e1e99f5d1018064f3c4825aff16bd487cf558.1747669845.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2505231309090.147219@ubuntu-linux-20-04-desktop>
 <e5e8b7b3-a9c3-4e1a-9241-6776990b6e11@epam.com>
 <alpine.DEB.2.22.394.2506171720390.1780597@ubuntu-linux-20-04-desktop>
 <e4bf11e1-5bf5-4428-bd73-4fd2cb2029fb@epam.com>
 <alpine.DEB.2.22.394.2506221451440.8066@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2506221451440.8066@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefano and Oleksii,

Let me start with a bit of process. This is discussion is getting fairly 
difficult to follow.... Can you please trim unrelevant bits when replying?

On 22/06/2025 22:57, Stefano Stabellini wrote:
> On Thu, 19 Jun 2025, Oleksii Moisieiev wrote:
>> On 18/06/2025 03:35, Stefano Stabellini wrote:
>>> On Thu, 12 Jun 2025, Oleksii Moisieiev wrote:
>>>> On 23/05/2025 23:19, Stefano Stabellini wrote:
>>>>> On Mon, 19 May 2025, Oleksii Moisieiev wrote:
>>>>>> From: Grygorii Strashko<grygorii_strashko@epam.com>
>> the same (smc-id and shmem) for both the BSP case (no Xen) and the Xen
>> case (Dom0 domain).
>>
>> Meanwhile, the Xen management agent's SCMI node and configuration are
>> expected to be placed under /chosen.
>>
>> This approach ensures that the Host DT remains as unchanged as possible.
> 
> Yes, my main point is that all the device tree information, except for
> what is under /chosen, should be left unchanged between the BSP case (no
> Xen) and the Xen case.
> 
> We have freedom to decide:
> - the information we put under /chosen and how to interpret it
> - how to use the information under /firmware/scmi when Xen is present
> 
> 
>> Currently:
>>
>> The Host DT /firmware/scmi node requires modification to point to the
>> Xen management agent by changing
>>
>> the smc-id and shmem values.
> 
> I don't think we should require changes to /firmware/scmi in the host DT
> when Xen is present.
> 
> Often, people don't know when or if Xen is present at the time the
> Device Tree is generated. So it is best to avoid modification (outside
> of /chosen).

I am probably missing something. But it looks like TF-A requires to 
suport multi-agent so Xen can use it. Am I correct?

Furthermore, I can't tell why the multi-agent support is Xen specific. 
Surely, you may want something similar with other hypervisors? If not, 
then my next question is why does Xen needs to do things differently?

Cheers,

-- 
Julien Grall


