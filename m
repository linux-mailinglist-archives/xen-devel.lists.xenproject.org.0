Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 037903A67DB
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 15:29:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141482.261328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsmeU-0006rN-0U; Mon, 14 Jun 2021 13:29:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141482.261328; Mon, 14 Jun 2021 13:29:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsmeT-0006o8-TY; Mon, 14 Jun 2021 13:29:17 +0000
Received: by outflank-mailman (input) for mailman id 141482;
 Mon, 14 Jun 2021 13:29:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DfkY=LI=arm.com=robin.murphy@srs-us1.protection.inumbo.net>)
 id 1lsmeS-0006o0-Ga
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 13:29:16 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f37c60d6-52d8-43ec-8134-16a3df064ad9;
 Mon, 14 Jun 2021 13:29:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 259ED6D;
 Mon, 14 Jun 2021 06:29:15 -0700 (PDT)
Received: from [10.57.9.136] (unknown [10.57.9.136])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A18ED3F719;
 Mon, 14 Jun 2021 06:29:13 -0700 (PDT)
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
X-Inumbo-ID: f37c60d6-52d8-43ec-8134-16a3df064ad9
Subject: Re: Regression in at least 5.10.y and mainline: Firewire audio
 interface fails to work properly (when booted under Xen)
To: Salvatore Bonaccorso <carnil@debian.org>, =?UTF-8?B?5bCP5aSq?=
 <nospam@kota.moe>, Jianxiong Gao <jxgao@google.com>,
 Christoph Hellwig <hch@lst.de>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Marek Szyprowski <m.szyprowski@samsung.com>, xen-devel@lists.xenproject.org
Cc: 989778-maintonly@bugs.debian.org
References: <162352833546.2353.230557992597997974.reportbug@home.kota.moe>
 <YMWl4UnFBAVRDnys@eldamar.lan>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <2f7c7d36-b6f4-f8ab-756e-a563fa03b9e4@arm.com>
Date: Mon, 14 Jun 2021 14:29:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YMWl4UnFBAVRDnys@eldamar.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2021-06-13 07:29, Salvatore Bonaccorso wrote:
> A user in Debian reported the above issue, which was reproducible with
> 5.13-rc5 and 5.10.y as packaged in Debian and found that 85a5a6875ca9
> ("swiotlb: don't modify orig_addr in swiotlb_tbl_sync_single") that
> introduced the issue.

Sounds like it's probably the same thing as being discussed over here:

https://lore.kernel.org/linux-iommu/2e899de2-4b69-c4b6-33a6-09fb8949d2fd@nxp.com/

Robin.

