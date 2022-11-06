Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A490461E550
	for <lists+xen-devel@lfdr.de>; Sun,  6 Nov 2022 19:31:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.438654.692717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orkQs-0000W7-0o; Sun, 06 Nov 2022 18:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 438654.692717; Sun, 06 Nov 2022 18:31:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orkQr-0000Tp-UF; Sun, 06 Nov 2022 18:31:45 +0000
Received: by outflank-mailman (input) for mailman id 438654;
 Sun, 06 Nov 2022 18:31:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1orkQq-0000Tf-QO
 for xen-devel@lists.xenproject.org; Sun, 06 Nov 2022 18:31:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1orkQq-0005kZ-Dm; Sun, 06 Nov 2022 18:31:44 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1orkQq-00012W-6b; Sun, 06 Nov 2022 18:31:44 +0000
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
	bh=kjlQIYLPKFvgq01FsQRgFN1JRg4kQpjKU+vDEsPXWik=; b=Y4Izfe7KYpdF/C6LKHr2Xj9i4h
	lu11Bg0MMo6oeS9avqiDudhwh7Ki1yKvBb2vN3LVgwF7nfr9lmWXmxARaagd42cRiii7f4ekJ2kJG
	aS6/fp1oCLCLi6nvEEUWNFXNkTbvjMJlKEVqci8Rii9te4XyPAyaDCAccNlEBUNc3odQ=;
Message-ID: <1c016830-59d9-0d3c-331f-1874c41bae40@xen.org>
Date: Sun, 6 Nov 2022 18:31:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [XEN v2 09/12] xen/Arm: GICv3: Define GIC registers for AArch32
To: Ayan Kumar Halder <ayankuma@amd.com>, Michal Orzel
 <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, burzalodowa@gmail.com
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-10-ayankuma@amd.com>
 <dfdc0cfa-70ee-d591-bbb4-1b8426bafaab@amd.com>
 <b446b12f-4497-6ad4-551c-a60f1062e282@amd.com>
 <c1f3fee4-9262-d69e-9496-77581da6871a@amd.com>
 <825bf5e3-1d74-3fc1-370d-71a09d0e0ccc@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <825bf5e3-1d74-3fc1-370d-71a09d0e0ccc@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 04/11/2022 10:04, Ayan Kumar Halder wrote:
> These registers are not used by Xen.
> Should I define these registers for the sake of completeness (to be in 
> parity with AArch64) ?

Yes. I would at least expect the MISR might end up to be used if we were 
supporting some interrupts controlled (e.g. the Apple Interrupt Controller).

Cheers,

-- 
Julien Grall

