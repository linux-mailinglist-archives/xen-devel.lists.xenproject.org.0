Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D794845505D
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 23:23:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227017.392507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnTK4-0004DO-8z; Wed, 17 Nov 2021 22:22:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227017.392507; Wed, 17 Nov 2021 22:22:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnTK4-0004AQ-4d; Wed, 17 Nov 2021 22:22:32 +0000
Received: by outflank-mailman (input) for mailman id 227017;
 Wed, 17 Nov 2021 22:22:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tBek=QE=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mnTK2-0004AK-E4
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 22:22:30 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d888dd6e-47f4-11ec-9787-a32c541c8605;
 Wed, 17 Nov 2021 23:22:28 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:37148)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mnTJq-000fc0-ma (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 17 Nov 2021 22:22:18 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id BC5491FBFC;
 Wed, 17 Nov 2021 22:22:17 +0000 (GMT)
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
X-Inumbo-ID: d888dd6e-47f4-11ec-9787-a32c541c8605
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <fe2fc17e-540b-b900-4f93-ab87a89725ad@srcf.net>
Date: Wed, 17 Nov 2021 22:22:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/5] xen/xsm: Complete altcall conversion of xsm interface
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211105135555.24261-1-andrew.cooper3@citrix.com>
 <20211105135555.24261-3-andrew.cooper3@citrix.com>
 <41f3c740-dcb3-c58f-a937-8326d59002a5@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <41f3c740-dcb3-c58f-a937-8326d59002a5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08/11/2021 09:11, Jan Beulich wrote:
> On 05.11.2021 14:55, Andrew Cooper wrote:
>> With alternative_call() capable of handling compound types, the three
>> remaining hooks can be optimised at boot time too.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
>> CC: Daniel Smith <dpsmith@apertussolutions.com>
>>
>> I'm on the fence as to whether to declare this as fixing "xsm: convert xsm_ops
>> hook calls to alternative call"
> Forgot to say a word on this: I'd consider Fixes: appropriate, as the
> commit's description says nothing about these having been left out,
> nor why.

Ok.  I'll insert one.

~Andrew

