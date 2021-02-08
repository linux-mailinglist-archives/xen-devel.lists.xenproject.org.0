Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66766313962
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 17:28:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82961.153514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l99Ok-0004p3-Bt; Mon, 08 Feb 2021 16:28:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82961.153514; Mon, 08 Feb 2021 16:28:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l99Ok-0004oi-8Q; Mon, 08 Feb 2021 16:28:26 +0000
Received: by outflank-mailman (input) for mailman id 82961;
 Mon, 08 Feb 2021 16:28:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l99Oj-0004od-6w
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 16:28:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l99Oj-0007zg-3c
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 16:28:25 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l99Oj-0008Mt-2S
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 16:28:25 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l99Of-0002zQ-QR; Mon, 08 Feb 2021 16:28:21 +0000
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=5K2ndahwpF8pR9I8HDBgw7p9a+OU6Usg6qzOnE7hlL4=; b=f+xxwRaQO589PXHjXZhYWudkga
	vZp2RXQMRzQxBXhYM6oGUj60wucvv8gODudVy4KqncYXvLAUFrRzad2PjiVYpZl8fkv5jovwz56iJ
	FCXqoMqogROAcO9KF3eY9mEQ6vA0pBeR3n7MxvlUnMGulDvp2K0Pb2AkGks3D5Tr7CcM=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24609.26277.574330.875381@mariner.uk.xensource.com>
Date: Mon, 8 Feb 2021 16:28:21 +0000
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v20210111 32/39] tools: remove tabs from code produced by libxl_save_msgs_gen.pl
In-Reply-To: <20210111174224.24714-33-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
	<20210111174224.24714-33-olaf@aepfle.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Olaf Hering writes ("[PATCH v20210111 32/39] tools: remove tabs from code produced by libxl_save_msgs_gen.pl"):
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Personally I think this is busywork but I am happy to take the patch.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>
Acked-by: Ian Jackson <iwj@xenproject.org>

Release risk is clearly negligible since it's a whitespace change.


