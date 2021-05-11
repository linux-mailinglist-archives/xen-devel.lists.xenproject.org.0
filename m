Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B40C37AB80
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 18:08:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125810.236818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgUvk-0005TA-OF; Tue, 11 May 2021 16:08:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125810.236818; Tue, 11 May 2021 16:08:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgUvk-0005QF-Kq; Tue, 11 May 2021 16:08:20 +0000
Received: by outflank-mailman (input) for mailman id 125810;
 Tue, 11 May 2021 16:08:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiF3=KG=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lgUvj-0005Q9-1e
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 16:08:19 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f8b0f73-7636-49fd-b1ee-168d3004a6ff;
 Tue, 11 May 2021 16:08:17 +0000 (UTC)
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
X-Inumbo-ID: 7f8b0f73-7636-49fd-b1ee-168d3004a6ff
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620749297;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J+jei1tDOwEjJHXoH3QKMABLnE7yv5zL+AmXQXrxrjs=;
  b=ZGLjIc2Uv2QyWGkKhZ61iCL1VoKTd7R/00mIqDMrVwUrvYrsk/24gZ/i
   H2Ndqufz/0WYL2rvTYAe5mwygSGTz8g5GCxYbAK6D0yltgR8KYON8fQrf
   sM6ad9SOoB8oHNIw+sk+/Z/MQ1bQgjj8LR91Ugv1C3bV1/HpZ+wOCPMFr
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: kJGEdoc+Vyi45IScvXdSAb2d8Ykjr36AhAkSfOqwp0z86vfTqj3MBXFoWYds+W5WhEmPL3sPM9
 R8iypIiGWFNNV2bQBHvMfc9F2nuoKfP28LeOHGJf70XnZG/VsBx4Bk86/D1Qz7a7WFGZkrdDC8
 K6NQ9Si0nyI4v36eW9X2S+3o6H9nT7ItcQftwZdcapW0L2BukRpOqOkUNt2rCMZGS2C/wOcmsp
 l0t9G33BVyKbA/26o8QD0HKvs1PkuwDfr1M6H4m4fwi0y1k6wHB5z+IdxnyfsSObQ2Y3eb4zsu
 vtM=
X-SBRS: 5.1
X-MesageID: 43942879
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:PYFpc636sGwh1k3nOoPMiwqjBNEkLtp133Aq2lEZdPU1SK2lfq
 +V98jzuSWftN9zYh8dcLK7VJVoKEm0naKdibNwAV7IZmbbUQWTQb1f0Q==
X-IronPort-AV: E=Sophos;i="5.82,291,1613451600"; 
   d="scan'208";a="43942879"
Date: Tue, 11 May 2021 17:08:13 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <jgrall@amazon.com>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 13/14] tools/xenmon: xenbaked: Mark const the field text
 in stat_map_t
Message-ID: <YJqr7dCNUQhEiI/B@perard>
References: <20210405155713.29754-1-julien@xen.org>
 <20210405155713.29754-14-julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210405155713.29754-14-julien@xen.org>

On Mon, Apr 05, 2021 at 04:57:12PM +0100, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The field text in stat_map_t will point to string literals. So mark it
> as const to allow the compiler to catch any modified of the string.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

