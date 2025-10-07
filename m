Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB25BC136F
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 13:30:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138691.1474318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v65sf-0007S4-09; Tue, 07 Oct 2025 11:29:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138691.1474318; Tue, 07 Oct 2025 11:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v65se-0007PZ-To; Tue, 07 Oct 2025 11:29:20 +0000
Received: by outflank-mailman (input) for mailman id 1138691;
 Tue, 07 Oct 2025 11:29:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1v65sd-0007PR-Gz
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 11:29:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1v65sd-00DS05-08;
 Tue, 07 Oct 2025 11:29:19 +0000
Received: from [2a02:8012:3a1:0:e89d:4c04:6995:ad43]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1v65sd-008QHi-0P;
 Tue, 07 Oct 2025 11:29:18 +0000
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
	bh=wOIkZRCRajrtqml2X0sw1q0IG2Nn1vG2sjfMo2E+m9w=; b=ih3CndFZ64AgMPOcuRL3aU0b6z
	O29+yEOqPQnPpb7ixMllvlzmUy5PKoxb7URRkrJKuZTDZrIdDhZfsncpQVxjMGWtpA/xnUgHrkkos
	07HMWuHWukNhn9vx2YZ5xxHDsrQO9NZI9M8w8GkJnnSjrFPwzrMJ4zKoGkgw6enuNbf0=;
Message-ID: <a040885d-9669-4ea3-92a0-e405ac3cdbdf@xen.org>
Date: Tue, 7 Oct 2025 12:29:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Config.mk: Pin QEMU_UPSTREAM_REVISION
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20251006200840.2171113-1-andrew.cooper3@citrix.com>
 <20251006200840.2171113-2-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20251006200840.2171113-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 06/10/2025 21:08, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


