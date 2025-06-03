Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CB7ACC7CF
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 15:29:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004463.1384190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMRi1-00069H-Rm; Tue, 03 Jun 2025 13:29:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004463.1384190; Tue, 03 Jun 2025 13:29:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMRi1-00067E-Os; Tue, 03 Jun 2025 13:29:41 +0000
Received: by outflank-mailman (input) for mailman id 1004463;
 Tue, 03 Jun 2025 13:29:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uMRhz-00066y-T2
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 13:29:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uMRhz-000DEh-0k;
 Tue, 03 Jun 2025 13:29:39 +0000
Received: from [15.248.2.27] (helo=[10.24.67.31])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uMRhz-005iUa-1Y;
 Tue, 03 Jun 2025 13:29:39 +0000
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
	bh=fKOBxPwvsV5O3YyvKP9MdoeOn8IMuvFKRGJ4P9M1W9E=; b=yW2mS0eAKb2LTvFfpJ8xXks51A
	tzTOEGkpaPn9syhoutk2qURSUcoMOBR9RXDURsRqiM4C0sOgMuJ608Miqv2KXfxWFikS6x98xSzvx
	cJzh7kxmywYhe4mxhUeZSN44mz39m/y+dj9PVBB12hq/UtGVECrudSf0dOyG3QGNE0HY=;
Message-ID: <f5ebcffd-2d46-40c6-95a1-62bc940d0422@xen.org>
Date: Tue, 3 Jun 2025 14:29:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] device-tree: Move Arm's static-shmem feature to
 common
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250603100329.149851-1-michal.orzel@amd.com>
 <20250603100329.149851-5-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250603100329.149851-5-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 03/06/2025 11:03, Michal Orzel wrote:
> This feature is arch agnostic, thus move it to common.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


