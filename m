Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7570ACCF61
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 23:51:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004901.1384571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMZY0-0007SN-Bn; Tue, 03 Jun 2025 21:51:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004901.1384571; Tue, 03 Jun 2025 21:51:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMZY0-0007Pd-98; Tue, 03 Jun 2025 21:51:52 +0000
Received: by outflank-mailman (input) for mailman id 1004901;
 Tue, 03 Jun 2025 21:51:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uMZXy-0007PB-Cc
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 21:51:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uMZXx-000PVm-21;
 Tue, 03 Jun 2025 21:51:49 +0000
Received: from [2a02:8012:3a1:0:7807:532b:1d1d:b850]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uMZXx-009HNV-2n;
 Tue, 03 Jun 2025 21:51:49 +0000
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
	bh=/zCMXzXitlxIkhkPk26k31uDHOdETnhHZJief7dFn4s=; b=rszt4uV/QZ9bAnPlMUOD72IwHU
	UmYZ5zg5k7JTok6aZNknbJ0QMGaq90aV0uEbEG44KYLNViIrAlTce19uhXYjpFZ5Ht/EyB+/McMDa
	MKgv8R+Qm06O5GZFyztLscQHaxthd1K1EPQ+M5kyAP99LqW0/pgRPKSi4pkIt8CVJCb4=;
Message-ID: <33786bb2-9c4f-47f3-8962-83662f658392@xen.org>
Date: Tue, 3 Jun 2025 22:51:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] xen/arm: Add way to disable traps on accesses to
 unmapped addresses
Content-Language: en-GB
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com, michal.orzel@amd.com,
 Volodymyr_Babchuk@epam.com, andrew.cooper3@citrix.com,
 edgar.iglesias@amd.com, Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250603144948.1685047-1-edgar.iglesias@gmail.com>
 <20250603144948.1685047-2-edgar.iglesias@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250603144948.1685047-2-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Edgar,

On 03/06/2025 15:49, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Add a per-domain way to optionally disable traps for accesses
> to unmapped addresses.
> 
> The domain flag is general but it's only implemented for Arm for now.
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

For the future, tags should be ordered chronogically. So the 
Signed-off-by should be first, then reviewed-by...

Cheers,

-- 
Julien Grall


