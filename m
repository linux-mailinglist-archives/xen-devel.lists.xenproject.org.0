Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3EB46D87F
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 17:35:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242489.419390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muzuK-0001HZ-1M; Wed, 08 Dec 2021 16:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242489.419390; Wed, 08 Dec 2021 16:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muzuJ-0001F6-Tp; Wed, 08 Dec 2021 16:35:03 +0000
Received: by outflank-mailman (input) for mailman id 242489;
 Wed, 08 Dec 2021 16:35:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Njo=QZ=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muzuJ-0001Ew-AL
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 16:35:03 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c84643b9-5844-11ec-a831-37629979565c;
 Wed, 08 Dec 2021 17:35:00 +0100 (CET)
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
X-Inumbo-ID: c84643b9-5844-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638981300;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=SAEcRaJ2kdxmwIYhezUPLi814xJYgNKU1n+cDfUokiM=;
  b=a0rzSo589vjzRAYS8WPBh7FBLbKbjmKFmYfquJavfd2ixO0sRLBCZ9Kw
   eTHiiAJmiHo/9zd2VfTz+k5UiJZ4LyvzLSNgCYnlyz2dIfkw0BvTzTsze
   wBWyhiaBP3Z6NYKCHrhSRdrTLhxj5fJZC716Kf7pfCt9qwGkUfNdDutNS
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: bziSwNgHQBBIIDuagTTJZMFJwYyY76GJ2QJiduOBEXconJrcS5OcZYDHmyQGB6lLpqoI70ng67
 ShS6x7IJomsZdOhvWC6cs6fTNhvV4eCn/yhsyypsMaD6mcP7MT8zWXN/h0cYtL/niP6+cLT15n
 6z53EnF64OnuyEujbhf91wbiLstQzjxiELa9DszphJMP6u2tTHn0lDE4GU9WhKBtqyJprnOyAw
 eXFmttC0zpR+85zVald4hITS0ClL+bmaVcd24xfCXJ9p6+ZJsMASLeF3nPfgZlbUMcIKTpy+5j
 V9ZqDgUJmlu8sxWA59hP0Y/U
X-SBRS: 5.1
X-MesageID: 59957912
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:/+Yslak1bUKWgwk+zXO3Oojo5gxtIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeXmvUb/yDa2qmKdlwbYzgo0wP75WHnNNrHgY/pCwwRiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbdg2NY42YTR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PhJnJiSQiMYBY6Wgb8aQURJSxtYDaITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQKePO
 pVIMGAHgBLoWid1YWgdMMIHzMCy32b7aA9HuXONnP9ii4TU5FMoi+W8WDbPQfSLWsd9jkuev
 njB/WnyHlcdLtP34SWB2mKhgKnIhyyTcJIfEvi0++BnhHWXx3cPE1sGWF2ju/67h0WiHdVFJ
 CQ88y8l/PYa71agQJ/7UgHQiHyLpBkHQPJLDvY3rgqKz8LpDx2xXzZeCGQbMZp/6ZFwFWdCO
 kK1c83BKDhGtJ+ebUOm1e2N9jSgZDlNF0kyanpRJeca2OXLrIY2hxPJa99sFq+pk9H4cQ3NL
 yC2QDsW3OtK05NSv0mv1RWe2m/3+MCVJuIgzliPBgqYAhVFiJlJjmBCwXzS9r5+IYmQVTFtV
 1BUypHFvIji4Xxg/RFhodnh/pn1t55p0xWG2DaD+qXNERz0qhZPmqgKv1lDyL9BaJpsRNMQS
 Ba7VfltzJFSJmC2SqR8fpi8Dc8npYC5S4+1B6iPNoQQPskvHONiwM2ITRfBt4wKuBJz+ZzTx
 L/BKZr8ZZrkIfoPIMWKqxc1juZwm3FWKZL7TpHn1RW3uYdyl1bOIYrpxGCmN7hjhIvd+V292
 48Ga6OilkUOOMWjM3K/2dNCcjg3wY0TWMmeRzp/LbXYfGKL2QgJVpfs/F/WU9A/wvkOyL6Xp
 irVt40x4AOXuEAr4D6iMhhLAI4Dl74mxZ7iFSBzb1uuxVY5ZoOjsPUWe5ctJOF1/+1/1/9kC
 fICfpzYUPhITz3G/RUbbIX889M+JEj621rWMnr3eiU7cr5hWxfNpo3ucDzw+XRcFSGwr8Y//
 eGtj1uJXZoZSg1+J8/Kc/bznUiptH0QlbsqDUvFK9VeYmv2941uJ3Cjh/M7OZhUex7C2iGbx
 0CdBhJB/bvBpIo88d/og6GYrtj2T7siTxQCR2SCtOS4LyjX+Gan0LRsaufQcGCPTn7w9YWje
 f5Rk6P2PsoYkQsYqIF7Cbtqk/4zvoO9u79Aww14N3zXdFD3WKh4K3yL0MQT5K1AwrhV5Vm/V
 k6Vo4QIPLyIPIXuEUILJRpjZeOGjKlGlj7X5PUzAUP7+C4oo+bXDRQMZ0GB2H5HMb94EII52
 uNw6scZ5ju2hgcuLtvb3Dtf8H6BLyBYXqgq3n3A7FQHVub/Jol+XKHh
IronPort-HdrOrdr: A9a23:ZYW7HaFK53lv7OXHpLqE7seALOsnbusQ8zAXP0AYc3Jom+ij5q
 STdZMgpHjJYVcqKRQdcL+7VZVoLUmxyXcx2/h2AV7AZniFhILLFuFfBOLZqlWKcREWtNQttp
 uIG5IOceEYZmIasS+V2maFL+o=
X-IronPort-AV: E=Sophos;i="5.88,190,1635220800"; 
   d="scan'208";a="59957912"
Date: Wed, 8 Dec 2021 16:34:54 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <amc96@srcf.net>
CC: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 2/2] tools: set event channel HVM parameters in
 libxenguest
Message-ID: <YbDerlN/E1wFrZKY@perard>
References: <20211208084745.31082-1-jgross@suse.com>
 <20211208084745.31082-3-jgross@suse.com>
 <83920ef7-ae82-01ad-e011-58f39a3b3e12@srcf.net>
 <ad570954-98f6-f345-d965-f664f28a6e7d@suse.com>
 <18497abb-7f3f-1479-636d-edc35b2861ad@srcf.net>
 <efaa6395-f52e-193f-dec7-fc2114e760a5@suse.com>
 <4d48cc2f-bea4-c1f4-95ec-4efa6d56b661@srcf.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d48cc2f-bea4-c1f4-95ec-4efa6d56b661@srcf.net>

On Wed, Dec 08, 2021 at 04:02:17PM +0000, Andrew Cooper wrote:
> On 08/12/2021 15:57, Juergen Gross wrote:
> > On 08.12.21 16:54, Andrew Cooper wrote:
> >> On 08/12/2021 14:22, Juergen Gross wrote:
> >>> On 08.12.21 14:43, Andrew Cooper wrote:
> >>>> On 08/12/2021 08:47, Juergen Gross wrote:
> >>>>> The HVM parameters for pre-allocated event channels should be set in
> >>>>> libxenguest, like it is done for PV guests and for the pre-allocated
> >>>>> ring pages.
> >>>>>
> >>>>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
> >>>>
> >>>> I'm not sure that we have the concept of pre-allocated ring pages.
> >>>>
> >>>> For PV, we have:
> >>>>
> >>>>       dom->console_pfn = xc_dom_alloc_page(dom, "console");
> >>>>       if ( dom->console_pfn == INVALID_PFN )
> >>>>           return -1;
> >>>>       xc_clear_domain_page(dom->xch, dom->guest_domid,
> >>>>                            xc_dom_p2m(dom, dom->console_pfn));
> >>>>
> >>>> and for HVM, we have:
> >>>>
> >>>>       dom->console_pfn = special_pfn(SPECIALPAGE_CONSOLE);
> >>>>       xc_clear_domain_page(dom->xch, dom->guest_domid,
> >>>> dom->console_pfn);
> >>>
> >>> Isn't that a pre-allocation? The PFNs are fixed at boot time of the
> >>> guest.
> >>
> >> Yeah, but "allocated in the library call we're making" is not the same
> >> as "caller has to allocate and pass details in".
> >>
> >> I would not class the frames as "pre-allocated" in this context.
> >> "allocated" sure, so perhaps "just like it is done for PV guests, and
> >> the ring pages that libxenguest allocates" ?
> >
> > Fine with me.
> >
> > Should I send another round, or can this be changed when committing?
> 
> Fixed on commit.  No need to resend just for this.
> 
> Question is whether Anthony has any view, or whether my R-by is good enough?

Patch looks good, so:
Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

