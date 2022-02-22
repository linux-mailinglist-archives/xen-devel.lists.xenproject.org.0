Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A58E74BFA0C
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 14:59:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276790.473083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMVh0-0001qA-9e; Tue, 22 Feb 2022 13:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276790.473083; Tue, 22 Feb 2022 13:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMVh0-0001nq-5k; Tue, 22 Feb 2022 13:59:02 +0000
Received: by outflank-mailman (input) for mailman id 276790;
 Tue, 22 Feb 2022 13:59:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ghSa=TF=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1nMVgy-0001ng-DH
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 13:59:00 +0000
Received: from ppsw-41.csi.cam.ac.uk (ppsw-41.csi.cam.ac.uk [131.111.8.141])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 943a44cb-93e7-11ec-8539-5f4723681683;
 Tue, 22 Feb 2022 14:58:58 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:32862)
 by ppsw-41.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1nMVgn-000bFs-RB (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 22 Feb 2022 13:58:49 +0000
Received: from [192.168.1.10] (host-92-12-45-187.as13285.net [92.12.45.187])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 23BF11FB82;
 Tue, 22 Feb 2022 13:58:49 +0000 (GMT)
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
X-Inumbo-ID: 943a44cb-93e7-11ec-8539-5f4723681683
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <405b80b3-2f9f-f6a1-1776-ca198f9fdc98@srcf.net>
Date: Tue, 22 Feb 2022 13:58:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] cirrus: update FreeBSD to 12.3
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20220222135629.68769-1-roger.pau@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <20220222135629.68769-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/02/2022 13:56, Roger Pau Monne wrote:
> Switch from using a FreeBSD 12.2 to a 12.3 image.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

I presume you've got a private run showing that this is fine?

