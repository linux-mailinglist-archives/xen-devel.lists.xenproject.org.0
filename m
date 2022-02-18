Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BDE4BBD8A
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 17:31:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275577.471515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL6AO-0000E1-Is; Fri, 18 Feb 2022 16:31:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275577.471515; Fri, 18 Feb 2022 16:31:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL6AO-0000BO-Fl; Fri, 18 Feb 2022 16:31:32 +0000
Received: by outflank-mailman (input) for mailman id 275577;
 Fri, 18 Feb 2022 16:31:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N23X=TB=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1nL6AM-0000BI-TY
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 16:31:30 +0000
Received: from ppsw-30.csi.cam.ac.uk (ppsw-30.csi.cam.ac.uk [131.111.8.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38bb1627-90d8-11ec-8eb8-a37418f5ba1a;
 Fri, 18 Feb 2022 17:31:29 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:57668)
 by ppsw-30.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1nL6AF-000sOE-dI (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 18 Feb 2022 16:31:23 +0000
Received: from [192.168.1.10] (host-92-12-45-187.as13285.net [92.12.45.187])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id EC1771FACB;
 Fri, 18 Feb 2022 16:31:22 +0000 (GMT)
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
X-Inumbo-ID: 38bb1627-90d8-11ec-8eb8-a37418f5ba1a
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <7ad6214b-f4d0-ea06-fa3e-3778bb8bc25a@srcf.net>
Date: Fri, 18 Feb 2022 16:31:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] CI: Add gnu grep to alpine containers
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <JBeulich@suse.com>
References: <20220218131740.30922-1-andrew.cooper3@citrix.com>
 <Yg+vmEsWzurilMNy@perard.uk.xensource.com>
 <alpine.DEB.2.22.394.2202180826310.239973@ubuntu-linux-20-04-desktop>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <alpine.DEB.2.22.394.2202180826310.239973@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/02/2022 16:28, Stefano Stabellini wrote:
> On Fri, 18 Feb 2022, Anthony PERARD wrote:
>> On Fri, Feb 18, 2022 at 01:17:40PM +0000, Andrew Cooper wrote:
>>> A forthcoming change is going to want more support than busybox's grep can
>>> provide.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Doug Goldstein <cardoe@cardoe.com>
>>> CC: Wei Liu <wl@xen.org>
>>> CC: Anthony PERARD <anthony.perard@citrix.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>> CC: Jan Beulich <JBeulich@suse.com>
>>>
>>> I've already rebuilt the containers and confirmed that the build is still fine.
>> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
> Good for me too. Out of curiousity, what is that is not working with
> busybox's grep? Is it regex?

No.  Binary searching, which we want to use in a build-time check for
CET-IBT.

https://lore.kernel.org/xen-devel/8c6d9714-7e45-1603-a5ad-d49fc060304e@srcf.net/

~Andrew

