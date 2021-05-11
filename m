Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3E237AB0A
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 17:46:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125803.236805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgUaI-0002L3-U1; Tue, 11 May 2021 15:46:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125803.236805; Tue, 11 May 2021 15:46:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgUaI-0002Is-Qj; Tue, 11 May 2021 15:46:10 +0000
Received: by outflank-mailman (input) for mailman id 125803;
 Tue, 11 May 2021 15:46:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiF3=KG=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lgUaH-0002Im-F6
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 15:46:09 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e4a8ec25-81c0-4a8e-a370-cf1568eb2f9e;
 Tue, 11 May 2021 15:46:08 +0000 (UTC)
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
X-Inumbo-ID: e4a8ec25-81c0-4a8e-a370-cf1568eb2f9e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620747968;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V8fn6TqoQExzpifWiHwkN0EtjFDdty7np472LGpGsck=;
  b=U6WS516doaWXDMoK2shPXTFuG5MV4AEFVMiaGmtXF5XYWHrPYO4UOhR5
   YLXsm3Qz/GeQwyVjDGap4wAQ4NJMOWuDpoVnwe7MTI7QnE0/A1nVD/nDe
   2/cuzw1lRwZnyA1f4D5rqJXv9clETCqMSMnd8RyGoiY80aZ2XXvciO6PU
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 0Vm+3RgCcX1GTvoz669DkBeiZmbA6rbzmSJgLHRgkUcN4hCFVpqQm4XB/BTQWhXzGSIQhHQqBF
 gajVUHTBRzZdWzOFRMrWImSXyROvjyt0x52oEBkCnZaZWmFSZO5yOf/J8c33EvANMWeVqv6EB1
 hdtFH6534k6xd2igpJCvREPBB+nYrwvPdFtnVBZ3K+7eaNNibEoSJIV0jsT7jRPuQgn0iz4pUE
 uTziQaqNjtoededmqZ0rM6F8/aI/TGXGHLVXkespZX4EVBskDAzD9vq1zsA2Mup2cVd2KeMzjf
 Sko=
X-SBRS: 5.1
X-MesageID: 43350723
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:95EH3KrANCyAMtaAs6bRfuEaV5oreYIsimQD101hICG8cqSj+f
 xGuM5rsSMc6QxhPU3I9ursBEDtex/hHNtOkO4s1NSZLWvbUQmTTL2KhLGKq1aLJ8S9zJ8/6U
 4JSdkZNDSaNzlHZKjBjzWFLw==
X-IronPort-AV: E=Sophos;i="5.82,291,1613451600"; 
   d="scan'208";a="43350723"
Date: Tue, 11 May 2021 16:46:04 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <jgrall@amazon.com>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 12/14] tools/top: The string parameter in set_prompt()
 and set_delay() should be const
Message-ID: <YJqmvN2sIhd+benU@perard>
References: <20210405155713.29754-1-julien@xen.org>
 <20210405155713.29754-13-julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210405155713.29754-13-julien@xen.org>

On Mon, Apr 05, 2021 at 04:57:11PM +0100, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Neither string parameter in set_prompt() and set_delay() are meant to
> be modified. In particular, new_prompt can point to a literal string.
> 
> So mark the two parameters as const and propagate it.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

