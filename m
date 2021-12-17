Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C2E478DE5
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 15:35:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248685.428948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myEKG-0003Cw-LI; Fri, 17 Dec 2021 14:35:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248685.428948; Fri, 17 Dec 2021 14:35:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myEKG-0003Ah-IB; Fri, 17 Dec 2021 14:35:12 +0000
Received: by outflank-mailman (input) for mailman id 248685;
 Fri, 17 Dec 2021 14:35:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6k1w=RC=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1myEKE-0003Ab-AN
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 14:35:10 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88f8dda6-5f46-11ec-9e60-abaf8a552007;
 Fri, 17 Dec 2021 15:35:09 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:44266)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1myEKD-000L8n-fz (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 17 Dec 2021 14:35:09 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id B86191FC34;
 Fri, 17 Dec 2021 14:35:08 +0000 (GMT)
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
X-Inumbo-ID: 88f8dda6-5f46-11ec-9e60-abaf8a552007
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <50374739-2051-1b9b-b2e7-30eef69e0673@srcf.net>
Date: Fri, 17 Dec 2021 14:35:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/5] x86/perfc: conditionalize HVM and shadow counters
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <57038a1c-671b-f0f9-1bf1-0ff9bae6e2dc@suse.com>
 <ea513864-58c0-fb90-cee6-f668309fcc38@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <ea513864-58c0-fb90-cee6-f668309fcc38@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/12/2021 12:04, Jan Beulich wrote:
> There's no point including them when the respective functionality isn't
> enabled in the build. Note that this covers only larger groups; more
> fine grained exclusion may want to be done later on.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

