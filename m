Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5E8BF6E6C
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 15:54:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147263.1479602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBCoZ-0001QC-DF; Tue, 21 Oct 2025 13:54:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147263.1479602; Tue, 21 Oct 2025 13:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBCoZ-0001Ok-8A; Tue, 21 Oct 2025 13:54:15 +0000
Received: by outflank-mailman (input) for mailman id 1147263;
 Tue, 21 Oct 2025 13:54:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1vBCoX-0001OO-Dq
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 13:54:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vBCoW-00CjtE-2k;
 Tue, 21 Oct 2025 13:54:13 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vBCoW-005snB-2W;
 Tue, 21 Oct 2025 13:54:12 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=l2IVI7vUwLs4FZ1p4ZwhBuBVdK4Anyz5K0UIMWO+32w=; b=cRDEWvambPTr29Bw8Z6j2ziMnE
	od55XYyguG4nGTSYFfcQp4UgAkthhDGtpeD84+czBKLKheoS3kH5Qz6XteTVuuF9B1U2cGXdcR4y5
	hjgKobucG/XSJW10H+XfeOCwGrYSp/qaTatbMzDbbq8KTqw7epzV4r1JwuZ9fbM+545E=;
Date: Tue, 21 Oct 2025 15:54:10 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, oleksii.kurochko@gmail.com,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.21 v2] tools/libxc: fix xc_physdev_map_pirq_msi()
 with PCI segments != 0
Message-ID: <aPeQgsShSIWNDEEI@l14>
References: <20251020105613.53636-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251020105613.53636-1-roger.pau@citrix.com>

On Mon, Oct 20, 2025 at 11:56:13AM +0100, Roger Pau Monne wrote:
> Otherwise it's not possible for device models to map IRQs of devices on
> segments different than 0.  Keep the same function prototype and pass the
> segment in the high 16bits of the bus parameter, like it's done for the
> hypercall itself.
> 
> Amends: 7620c0cf9a4d ("PCI multi-seg: add new physdevop-s")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

