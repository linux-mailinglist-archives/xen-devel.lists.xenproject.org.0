Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD716511438
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 11:18:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314595.532733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njdnV-000794-Vv; Wed, 27 Apr 2022 09:17:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314595.532733; Wed, 27 Apr 2022 09:17:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njdnV-00076f-SU; Wed, 27 Apr 2022 09:17:21 +0000
Received: by outflank-mailman (input) for mailman id 314595;
 Wed, 27 Apr 2022 09:17:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y66U=VF=citrix.com=prvs=1094d0c61=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1njdnU-00076Z-P1
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 09:17:20 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d512c2a9-c60a-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 11:17:18 +0200 (CEST)
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
X-Inumbo-ID: d512c2a9-c60a-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651051038;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kD9gd6yBs5xJbovJEpul4l2qlNLIMfUWkVJNVNBDV7E=;
  b=CDwjuOO+eO28S93QLwDcSfgoi4C2zTnOPW8mmtkiztAPU6kzdaISVoDp
   AX0IEBv+GwTQB6k2FMg3iqhOI9U3FAEBFYauO0HNr2ibaSNIzPuM51Vxe
   bFBUictttQFKnPVL2+GJAvLKSO50JK5QyYNnmF9Xa0lohgtaW+D3nOhrY
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 69422833
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:gAShyKJGHopCg9jHFE+R15UlxSXFcZb7ZxGr2PjKsXjdYENShTJWn
 2sZDWyOPPfZYmXzLdgjboq0pEsG7MDRyoM3S1FlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh3tQ22YPR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PNxn5npQgECB7HnxOkNczZeIXA5IqITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQ6eCP
 ZBJMmEHgBLoTTlPPHs5DtEEh+a13DqnIh9gmmOJnP9ii4TU5FMoi+W8WDbPQfSSSdhPhE+eu
 krP+m3rBRdcP9uaoRKV/3TpiuLRkCfTXIMJCKb+5vNsmEeUxGEYFFsRT1TTifuwj0OlHsJSL
 WQY+ywhsqE28AquQ5/gXHWFTGWs50BGHYAKSqtjtV/LmvG8Dxul6nYsaAJrbYUtsuQPWRd22
 0+psNXbVHtwv+jAIZ6CzYu8oTS3MCkTCGYNYy4YUAcIi+XeTJEPYgHnFYg6TvPs5jHhMXSpm
 m3R8nBi71kGpZRTv5hX62wrlN5FSnLhagcurjvaUWu+hu+STN70Ptf4gbQ3ABspEWp4crVjl
 CVc8yR9xLpXZX1oqMBqaL9QdIxFH97fbFXhbadHRvHNDQiF9X+5Zpx36zpjPkpvOctsUWa3P
 ReC4l8LvMAIZyHCgUpLj2WZUZpC8EQdPY69CqC8giRmP/CdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTCpfJS1yNEiT9xLvH711+eZynkgWnDqDLbimn0XP+efPPxa9FOZaWGZim8hktctoVi2Oq
 I0BXyZLoj0CONDDjt7/rNBDcAhWfSRqbX00wuQOHtO+zsNdMDlJI5fsLXkJIeSJQ4w9ej/0w
 0yA
IronPort-HdrOrdr: A9a23:DiLj2aOxuOnsZcBcTsGjsMiBIKoaSvp037Eqv3oedfVwSL39qy
 nOpoV/6faaslsssR0b9exofZPwJk80lqQFg7X5X43DYOCOggLBR+tfBMnZsl7d8kXFh4hgPM
 xbEpSWZueeMWRH
X-IronPort-AV: E=Sophos;i="5.90,292,1643691600"; 
   d="scan'208";a="69422833"
Date: Wed, 27 Apr 2022 10:17:13 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: James Dingwall <james-xen@dingwall.me.uk>
CC: <xen-devel@lists.xenproject.org>, <pdurrant@amazon.com>
Subject: Re: [PATCH] fix invalid frontend path for set_mtu
Message-ID: <YmkKGVa1NeKBQV9M@perard.uk.xensource.com>
References: <20220301093513.GA3187840@dingwall.me.uk>
 <YlV4lXZHz52xPBzt@perard.uk.xensource.com>
 <20220419120418.GA232637@dingwall.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220419120418.GA232637@dingwall.me.uk>

On Tue, Apr 19, 2022 at 01:04:18PM +0100, James Dingwall wrote:
> Thank you for your feedback.  I've updated the patch as suggested.  I've also
> incorporated two other changes, one is a simple style change for consistency,
> the other is to change a the test for a valid mtu from > 0 to >= 68.  I can
> resubmit the original patch if either of these are a problem.

The style change is fine, but I'd rather have the change to the
mtu check in a different patch.

Otherwise, the patch looks better, thanks.

-- 
Anthony PERARD

