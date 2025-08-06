Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 550D0B1C1F5
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 10:16:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071394.1434859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujZK1-00012J-51; Wed, 06 Aug 2025 08:16:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071394.1434859; Wed, 06 Aug 2025 08:16:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujZK1-000103-0t; Wed, 06 Aug 2025 08:16:29 +0000
Received: by outflank-mailman (input) for mailman id 1071394;
 Wed, 06 Aug 2025 08:16:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1ujZJz-0000zX-6T
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 08:16:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ujZJy-004MLN-2F;
 Wed, 06 Aug 2025 08:16:26 +0000
Received: from [2a01:cb15:80df:da00:780b:80d6:89ae:cd4d] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ujZJy-006fUE-16;
 Wed, 06 Aug 2025 08:16:26 +0000
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
	bh=DunmOPknlULrykY12F/SXCDD6v08oltn7onGcW3sDM0=; b=PiyAYAUTKbZl0PmrHmvsmXfbpb
	sbOditSKN3dVU14e6MM5x7sJFF56tAjRBXZiRcC56s/pxkJ5nwu4LxDlW7PvGuOnbZ+cDpPt4aGzl
	+v8mKhhfLzncaDOfO828suM3LF+6J0mjcR4ytLAxSF73lp0oMLmBVH4X15DMZ2iJ4+qs=;
Date: Wed, 6 Aug 2025 10:16:24 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 5/8] test/pdx: add PDX compression unit tests
Message-ID: <aJMPWINjKj9ektNl@l14>
References: <20250805095257.74975-1-roger.pau@citrix.com>
 <20250805095257.74975-6-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250805095257.74975-6-roger.pau@citrix.com>

On Tue, Aug 05, 2025 at 11:52:54AM +0200, Roger Pau Monne wrote:
> Introduce a set of unit tests for PDX compression.  The unit tests contains
> both real and crafted memory maps that are then compressed using the
> selected PDX algorithm.  Note the build system for the unit tests has been
> done in a way to support adding new compression algorithms easily.  That
> requires generating a new test-pdx-<compress> executable that's build with
> the selected PDX compression enabled.
> 
> Currently the only generated executable is test-pdx-mask that tests PDX
> mask compression.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

