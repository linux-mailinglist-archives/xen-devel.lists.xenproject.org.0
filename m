Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9CA915E56
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 07:46:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747175.1154503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLz0P-0001FW-If; Tue, 25 Jun 2024 05:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747175.1154503; Tue, 25 Jun 2024 05:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLz0P-0001DO-Fw; Tue, 25 Jun 2024 05:46:13 +0000
Received: by outflank-mailman (input) for mailman id 747175;
 Tue, 25 Jun 2024 05:46:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sQf/=N3=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sLz0O-0001DC-DP
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 05:46:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3913276f-32b6-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 07:46:09 +0200 (CEST)
Received: from [10.176.134.80] (unknown [160.78.253.181])
 by support.bugseng.com (Postfix) with ESMTPSA id AEAD44EE0738;
 Tue, 25 Jun 2024 07:46:08 +0200 (CEST)
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
X-Inumbo-ID: 3913276f-32b6-11ef-b4bb-af5377834399
Message-ID: <097ad012-665f-4df8-89ee-e532fa403a5c@bugseng.com>
Date: Tue, 25 Jun 2024 07:46:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3] automation/eclair: extend existing deviations of
 MISRA C Rule 16.3
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 oleksii.kurochko@gmail.com
References: <71a69d25e7889ed6e8546b5cd18d423006d69ceb.1718356683.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2406191821310.2572888@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2406241736560.3870429@ubuntu-linux-20-04-desktop>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <alpine.DEB.2.22.394.2406241736560.3870429@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/06/24 02:38, Stefano Stabellini wrote:
> On Wed, 19 Jun 2024, Stefano Stabellini wrote:
>> On Fri, 14 Jun 2024, Federico Serafini wrote:
>>> Update ECLAIR configuration to deviate more cases where an
>>> unintentional fallthrough cannot happen.
>>>
>>> Add Rule 16.3 to the monitored set and tag it as clean for arm.
>>>
>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>
>> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Hi Oleksii,
> 
> I would like to ask for a release-ack as this patch only increases
> deviations, hence only affecting the static analysis jobs, for a rule
> that is non-blocking

A committed patch already added Rule 16.3 to the monitored set:
I will send a v4 rebasing against the current staging branch
with Oleksii in CC.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

