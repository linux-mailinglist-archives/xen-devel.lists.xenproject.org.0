Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D067478D45
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 15:20:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248667.428904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myE5P-0007Sa-KK; Fri, 17 Dec 2021 14:19:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248667.428904; Fri, 17 Dec 2021 14:19:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myE5P-0007Pn-HL; Fri, 17 Dec 2021 14:19:51 +0000
Received: by outflank-mailman (input) for mailman id 248667;
 Fri, 17 Dec 2021 14:19:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6k1w=RC=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1myE5O-0007Ph-Us
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 14:19:50 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63d5da0d-5f44-11ec-9e60-abaf8a552007;
 Fri, 17 Dec 2021 15:19:48 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:44794)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1myE59-000FQm-2e (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 17 Dec 2021 14:19:35 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 5CAB71FA77;
 Fri, 17 Dec 2021 14:19:35 +0000 (GMT)
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
X-Inumbo-ID: 63d5da0d-5f44-11ec-9e60-abaf8a552007
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <b49a9f16-a556-723f-5ec5-0642f919b7f1@srcf.net>
Date: Fri, 17 Dec 2021 14:19:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] MAINTAINERS: remove Josh from ARINC 653 maintainers
Content-Language: en-GB
To: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "joshua.c.whitehead@gmail.com" <joshua.c.whitehead@gmail.com>
References: <20211122141742.3075-1-stewart.hildebrand@dornerworks.com>
 <c0228394-2dfe-717d-e35e-7120621df27f@suse.com>
 <BN3P110MB0484716C62279B1525F351E88C9F9@BN3P110MB0484.NAMP110.PROD.OUTLOOK.COM>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <BN3P110MB0484716C62279B1525F351E88C9F9@BN3P110MB0484.NAMP110.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/11/2021 14:54, Stewart Hildebrand wrote:
> On Monday, November 22, 2021 9:39 AM, From: Jan Beulich wrote:
>> On 22.11.2021 15:17, Stewart Hildebrand wrote:
>>> Josh works at another company now
>> You don't happen to know his email there, do you? Else if would have been
>> good to Cc him so he could confirm.
>>
>> Jan
> I added Josh in CC. Josh - will you confirm?

Given the request was made by an existing maintainer and there's been no
reply for almost a month, I'm going to commit this patch now.

If further adjustments are wanted/needed in the future, we can accommodate.

~Andrew

