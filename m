Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A894F4F9A15
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 18:07:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301668.514884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncr7X-0007DW-JZ; Fri, 08 Apr 2022 16:05:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301668.514884; Fri, 08 Apr 2022 16:05:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncr7X-0007Ad-GM; Fri, 08 Apr 2022 16:05:59 +0000
Received: by outflank-mailman (input) for mailman id 301668;
 Fri, 08 Apr 2022 16:05:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DXVu=US=citrix.com=prvs=090e341e7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ncr7W-0007AX-CC
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 16:05:58 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c51433db-b755-11ec-a405-831a346695d4;
 Fri, 08 Apr 2022 18:05:56 +0200 (CEST)
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
X-Inumbo-ID: c51433db-b755-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649433956;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=OnsSgoG8TneszAt4weG2faBw+7vVCykxV8DnvwCjI9k=;
  b=A7FUtbOiZlULSbSvO16y7Pg9UylwnuYyR5TV/EdYrnq/f9/sLDS0MxKJ
   Tc9gcO5+mg2D4lqTxzTQ7pTxfa2tJEJQpOlnAGRt7n4c/RsuT9mx5OlbB
   BVmlJt1ai7UlFNB140vUtGDio+SqFOlwCdwhaHzgUxEZ229AKpYxKcp0G
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 68274931
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:TXhMAqkclAyX33xhOKCYDh3o5gzoJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXDW+GP/aLZmujKth+YITg/BgAvpKDzNFqQVFr+CA1HiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DlW1PV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYQloiO/X+trohWDJ6Mxx9N6JPu4bZLi3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3s3d8zTbfHLA+TIrKWani7t5ExjYgwMtJGJ4yY
 uJHOWAwMEWbOnWjPH8nJrIbkOaCiEDHYhxqoVOemqY452bMmVkZPL/Fb4OOJ43iqd9utlmcj
 nLL+SL+GB5yHMySz3+J/2yhgsfLnDjnQ8QCGbug7PlojVaPgGsJB3UruUCT+KfjzBTkApQGd
 hJSqnFGQbUOGFKDRYT2WkWKjiC4tTU+e+dTGeIzqziTxf+Bi+qGPVQsQjlEYd0gkcY5Qz02y
 1OE9+/U6SxTXK69EizEqOrNxd+mEW1MdDJZO3dYJecQy4O7yLzfmC4jWTqK/ESdqtTuUQ/9z
 DmRxMTVr+VC1JVbv0lXEL2uvt5NmnQrZlNtjuk0djj8hu+cWGJDT9b1gbQ8xawdRLt1tnHb4
 BA5dzG2tYji962lmi2XW/kqF7q0/fuDOzC0qQcxQ8h7p2nwqyH8JNk4DNRCyKFBaJtsldjBO
 hG7hO+szMULYCvCgVFfPepd9PjGPYC/TI+4B5g4n/JFY4RrdR/vwc2dTRX44owZq2B1yftXE
 c7CKa6EVC9GYYw6nGveb7pMitcDm3FhrV4/sLimlnxLJ5LFPyXLIVrEWXPTBt0EAFSs/F2Oo
 4kCbZPTo/idOcWnChTqHUcoBQhiBRAG6Vre9KS7qsbrztJaJVwc
IronPort-HdrOrdr: A9a23:0YeH4KOQjj4Yv8BcTgujsMiBIKoaSvp037BL7TEVdfUxSKGlfq
 +V88jzuSWbtN9pYgBFpTnYAtjmfZq+z+8W3WByB9uftWDd0QPDEGgF1+rfKlXbcBEWndQttp
 uIHZIfNDUlZWIK9PoT/2GDYqgdKMjuytHPuQ/Bp00dNT2CYZsQkDuRcjzraXGfGWF9dOAE/I
 L13Ls7m9K6EU5nEviGOg==
X-IronPort-AV: E=Sophos;i="5.90,245,1643691600"; 
   d="scan'208";a="68274931"
Date: Fri, 8 Apr 2022 17:05:51 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/xl: fix vif and vcpupin parse tests
Message-ID: <YlBdX71RcEZ/IzwW@perard.uk.xensource.com>
References: <20220408133146.48117-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220408133146.48117-1-roger.pau@citrix.com>

On Fri, Apr 08, 2022 at 03:31:46PM +0200, Roger Pau Monne wrote:
> Current vif and vcpupin parse tests are out of sync.  First of all, xl
> returns 1 on failure, so replace the expected error code.
> 
> Secondly fix the expected output from some vif tests, as xl will no
> longer print the unpopulated fields.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

> ---
> We should find a way for those tests to be run as part of osstest, or
> else they will go stale again sooner or later.

I guess having those two tests case in "tools/tests/" would be better,
then having osstest runs all tests in "tools/tests/" might be the way to
go.

Thanks,

-- 
Anthony PERARD

