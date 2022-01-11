Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DA148AC15
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 12:02:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255682.438175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Eun-00058K-GS; Tue, 11 Jan 2022 11:02:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255682.438175; Tue, 11 Jan 2022 11:02:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Eun-00055o-DF; Tue, 11 Jan 2022 11:02:09 +0000
Received: by outflank-mailman (input) for mailman id 255682;
 Tue, 11 Jan 2022 11:02:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Oth=R3=cantab.net=dvrabel@srs-se1.protection.inumbo.net>)
 id 1n7Eul-00055i-RF
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 11:02:07 +0000
Received: from smarthost01c.sbp.mail.zen.net.uk
 (smarthost01c.sbp.mail.zen.net.uk [212.23.1.5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9ea95a9-72cd-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 12:02:06 +0100 (CET)
Received: from [82.70.146.41] (helo=pear.davidvrabel.org.UK)
 by smarthost01c.sbp.mail.zen.net.uk with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 (envelope-from <dvrabel@cantab.net>)
 id 1n7Euj-0005Al-C4; Tue, 11 Jan 2022 11:02:05 +0000
Received: from apple.davidvrabel.org.uk ([82.70.146.43])
 by pear.davidvrabel.org.uk with esmtp (Exim 4.92)
 (envelope-from <dvrabel@cantab.net>)
 id 1n7Eua-0001xq-VD; Tue, 11 Jan 2022 11:02:04 +0000
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
X-Inumbo-ID: e9ea95a9-72cd-11ec-9ce5-af14b9085ebd
Message-ID: <e54f914d-a683-1855-1eeb-635df86f0d94@cantab.net>
Date: Tue, 11 Jan 2022 11:01:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
References: <alpine.DEB.2.22.394.2201071614090.2060010@ubuntu-linux-20-04-desktop>
 <20220108004912.3820176-1-sstabellini@kernel.org>
 <580a888e-24c4-5d16-8c70-f3d7b34ac2c9@xen.org>
 <alpine.DEB.2.22.394.2201101340550.2060010@ubuntu-linux-20-04-desktop>
From: David Vrabel <dvrabel@cantab.net>
In-Reply-To: <alpine.DEB.2.22.394.2201101340550.2060010@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 82.70.146.43
X-SA-Exim-Mail-From: dvrabel@cantab.net
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	pear.davidvrabel.org.uk
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,SPF_NEUTRAL,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.2
Subject: Re: [XEN PATCH 1/7] xen: introduce XENFEAT_xenstore_late_init
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on pear.davidvrabel.org.uk)
X-Originating-smarthost01c-IP: [82.70.146.41]
Feedback-ID: 82.70.146.41



On 10/01/2022 22:55, Stefano Stabellini wrote:
> 
> I have a patch for Linux that if XENFEAT_xenstore_late_init is present
> makes Linux wait for an event notification before initializing xenstore:
> https://marc.info/?l=xen-devel&m=164160299315589
> 
> So with v1 of the Xen and Linux patches series:
> - Xen allocates the event channel at domain creation
> - Linux boots, sees XENFEAT_xenstore_late_init and wait for an event
> - init-dom0less later allocates the xenstore page
> - init-dom0less triggers the xenstore event channel
> - Linux receives the event and finishes the initialization, including
>    mapping the xenstore page

You can get this behaviour without the new feature.

- Xen allocates the event channel at domain creation
- Linux boots, sees HVM_PARAM_STORE_PFN is invalid and there's a 
xenstore event channel and waits for an event
- init-dom0less later allocates the xenstore page
- init-dom0less triggers the xenstore event channel
- Linux receives the event and finishes the initialization, including
    mapping the xenstore page-

David

