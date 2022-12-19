Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A97F650CE7
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 14:59:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466118.724968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7Get-0000FY-Ew; Mon, 19 Dec 2022 13:58:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466118.724968; Mon, 19 Dec 2022 13:58:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7Get-0000CA-Bt; Mon, 19 Dec 2022 13:58:23 +0000
Received: by outflank-mailman (input) for mailman id 466118;
 Mon, 19 Dec 2022 13:58:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mr6H=4R=bugseng.com=roberto.bagnara@srs-se1.protection.inumbo.net>)
 id 1p7Ger-0000C1-SS
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 13:58:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c888e47-7fa5-11ed-8fd4-01056ac49cbb;
 Mon, 19 Dec 2022 14:58:11 +0100 (CET)
Received: from [192.168.1.219] (unknown [151.29.129.19])
 by support.bugseng.com (Postfix) with ESMTPSA id 27FDB4EE078B;
 Mon, 19 Dec 2022 14:58:19 +0100 (CET)
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
X-Inumbo-ID: 2c888e47-7fa5-11ed-8fd4-01056ac49cbb
Message-ID: <42b72946-760f-3582-2f30-18a5e54c261a@bugseng.com>
Date: Mon, 19 Dec 2022 14:58:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.12) Gecko/20050929
 Thunderbird/1.0.7 Fedora/1.0.7-1.1.fc4 Mnenhy/0.7.3.0
Subject: Re: MISRA C Rule 20.7 disambiguation
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>, roberto.bagnara@bugseng.com
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, julien@xen.org, roger.pau@citrix.com,
 burzalodowa@gmail.com, michal.orzel@amd.com
References: <alpine.DEB.2.22.394.2212081619310.3075842@ubuntu-linux-20-04-desktop>
 <eb35b7bf-3a49-4faa-3ea6-a6076f032fd6@suse.com>
 <alpine.DEB.2.22.394.2212091427180.3075842@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Roberto Bagnara <roberto.bagnara@bugseng.com>
In-Reply-To: <alpine.DEB.2.22.394.2212091427180.3075842@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022-12-09 23:46, Stefano Stabellini wrote:
> Eclair marks it as a violation too. Eclair thinks "nr" needs
> parenthesis. Roberto, we have already discussed how the comma operator
> "," being the lower precedence doesn't require extra parenthesis.
> Roberto, what's your take on the [] square brakets?

Yes, we agreed upon the fact that square brackets are as good as
parentheses, but the ECLAIR configuration on eclairit.com was not
updated consequently: now it should be OK.

