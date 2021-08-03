Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFE53DE9E0
	for <lists+xen-devel@lfdr.de>; Tue,  3 Aug 2021 11:43:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163340.299226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAqx1-00074k-3H; Tue, 03 Aug 2021 09:43:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163340.299226; Tue, 03 Aug 2021 09:43:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAqx0-00072w-VV; Tue, 03 Aug 2021 09:43:06 +0000
Received: by outflank-mailman (input) for mailman id 163340;
 Tue, 03 Aug 2021 09:43:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mAqx0-00072q-4q
 for xen-devel@lists.xenproject.org; Tue, 03 Aug 2021 09:43:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mAqwy-0000rM-Lj; Tue, 03 Aug 2021 09:43:04 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mAqwy-0000NX-F3; Tue, 03 Aug 2021 09:43:04 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=4i/8UVePwLBMk7MiLl7Jc7VRi9M3r0/hcL8tyoidL6c=; b=aMu9k+b539LOtCuiy31nsilD/8
	br8cCq7YL0ydb/TYkk6xgZMuPszV1Us4ATPyltNigmbNXQsy2eZOBmcbe43b4Jdwv5HmNcmxumBRL
	00TyWO3REiIMCjbry7NiAh96msjiw2Et5A6fu8v3T0X72+5sCTWppJ4TjurJot/7liKc=;
Subject: Re: [PATCH v6 0/4] Generic SMMU Bindings
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 rahul.singh@arm.com, brian.woods@xilinx.com
References: <alpine.DEB.2.21.2108021720560.10122@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <767fa224-d385-7d89-552a-eb57d1ceea84@xen.org>
Date: Tue, 3 Aug 2021 10:43:02 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2108021720560.10122@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 03/08/2021 01:23, Stefano Stabellini wrote:
> Hi all,

Hi Stefano,

> This series introduces support for the generic SMMU bindings to
> xen/drivers/passthrough/arm/smmu.c.

Committed.

Cheers,

-- 
Julien Grall

