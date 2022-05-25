Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A13D5336C4
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 08:34:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336859.561288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntkaI-0006DG-VD; Wed, 25 May 2022 06:33:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336859.561288; Wed, 25 May 2022 06:33:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntkaI-0006Ak-S0; Wed, 25 May 2022 06:33:30 +0000
Received: by outflank-mailman (input) for mailman id 336859;
 Wed, 25 May 2022 06:33:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sqnv=WB=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1ntkaH-0006Ae-Sy
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 06:33:29 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 9304c092-dbf4-11ec-837f-e5687231ffcc;
 Wed, 25 May 2022 08:33:23 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93DDB1FB;
 Tue, 24 May 2022 23:33:25 -0700 (PDT)
Received: from [10.57.7.249] (unknown [10.57.7.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9884A3F73D;
 Tue, 24 May 2022 23:33:23 -0700 (PDT)
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
X-Inumbo-ID: 9304c092-dbf4-11ec-837f-e5687231ffcc
Message-ID: <4d440f82-4583-4438-bf82-ca8bab5d1189@arm.com>
Date: Wed, 25 May 2022 08:33:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] init-dom0less: better snprintf checks
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, julien@xen.org, Volodymyr_Babchuk@epam.com,
 lucmiccio@gmail.com, anthony.perard@citrix.com, wl@xen.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20220524233544.245741-1-sstabellini@kernel.org>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <20220524233544.245741-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 25.05.2022 01:35, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> snprintf returns the number of characters printed.
snprintf does not print anything but instead stores a composed string into a buffer.
To be more correct, I would suggest to write:
"snprintf returns the number of characters that would have been written to the final
string if enough space had been available".

> 
> Add a check for that in init-dom0less.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Apart from that:
Reviewed-by: Michal Orzel <michal.orzel@arm.com>

Cheers,
Michal

