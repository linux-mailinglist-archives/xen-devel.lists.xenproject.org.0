Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 673AB46BE9C
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 16:06:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.241251.418148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muc2L-0007T6-Sl; Tue, 07 Dec 2021 15:05:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 241251.418148; Tue, 07 Dec 2021 15:05:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muc2L-0007R6-Pj; Tue, 07 Dec 2021 15:05:45 +0000
Received: by outflank-mailman (input) for mailman id 241251;
 Tue, 07 Dec 2021 15:05:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1muc2K-0007R0-Ar
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 15:05:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1muc2D-0004TY-MI; Tue, 07 Dec 2021 15:05:37 +0000
Received: from [54.239.6.187] (helo=[10.95.81.235])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1muc2D-0004lC-Dk; Tue, 07 Dec 2021 15:05:37 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=YroXCPuf1AqdBV+koAfORzRqbBIc7GtCrWVldlQ+0hk=; b=IB8HdLsf+BMwNXVS+nh6aYG+pQ
	KH4arJQiOlTZtnokvtfhpEZNLdgTxBd7/Tlsr/7+N8pV3ZxZjbqSfYRcwby21X6TjFlvjQR/iLNVf
	8CYET3/FSbbJ33pafgr5DXqk15M/4AK/T7POeDnifyuFTlhAMzKWER63jr9TMfNkNdPs=;
Message-ID: <15e7d01f-14b7-e661-65da-993ec2f9cbfe@xen.org>
Date: Tue, 7 Dec 2021 15:05:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: Call for agenda items for December 7th Community Call @ 1500 UTC
To: Ashley Weltz <aweltz@linuxfoundation.org>,
 xen-devel@lists.xenproject.org, amit@infradead.org,
 andrew.cooper3@citrix.com, Artem_Mygaiev@epam.com, ash.j.wilding@gmail.com,
 ben@exotanium.io, bobby.eshleman@gmail.com, brendank310@gmail.com,
 brian.woods@xilinx.com, cardoe@cardoe.com, christopher.w.clark@gmail.com,
 Corey Minyard <cminyard@mvista.com>, daniel.kiper@oracle.com,
 deepthi.m@ltts.com, dpsmith@apertussolutions.com, dwmw@amazon.co.uk,
 edgar.iglesias@xilinx.com, Ian.Jackson@citrix.com, insurgo@riseup.net,
 intel-xen@intel.com, Jarvis.Roach@dornerworks.com,
 Jeff.Kubascik@dornerworks.com, jgross@suse.com, john.ji@intel.com,
 kevin.pearson@ortmanconsulting.com, Matt.Spencer@arm.com,
 =?UTF-8?Q?Mirela_Simonovi=c4=87?= <mirela.simonovic@aggios.com>,
 oleksandr_andrushchenko@epam.com, oleksandr_tyshchenko@epam.com,
 olivier.lambert@vates.fr, pdurrant@amazon.com, persaur@gmail.com,
 piotr.krol@3mdeb.com, Rahul.Singh@arm.com, rianquinn@gmail.com,
 rob.townley@gmail.com, robin.randhawa@arm.com, roger.pau@citrix.com,
 scottwd@gmail.com, sergey.dyasli@citrix.com, sstabellini@kernel.org,
 Stewart.Hildebrand@dornerworks.com, tamas.k.lengyel@gmail.com,
 varadgautam@gmail.com, volodymyr_babchuk@epam.com, wl@xen.org
References: <CADT4066W=fGoiyCTATSM3fZozrS1NYh3aFNtw7BM044ui_RL8Q@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CADT4066W=fGoiyCTATSM3fZozrS1NYh3aFNtw7BM044ui_RL8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02/12/2021 20:24, Ashley Weltz wrote:
> Hi everyone,

Hi Ahsley,


> Our next meeting is on Tuesday, December 7th at 1500 UTC.

The calendar invitation is for 4PM UTC. Can you clarify which time is it?

Cheers,

-- 
Julien Grall

