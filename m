Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9E9243F5B
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 21:38:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6J2j-00086t-2D; Thu, 13 Aug 2020 19:37:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fx8k=BX=infradead.org=rdunlap@srs-us1.protection.inumbo.net>)
 id 1k6J2g-00086o-O8
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 19:37:39 +0000
X-Inumbo-ID: 8e038559-e9e9-448a-9b93-3646ed795565
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e038559-e9e9-448a-9b93-3646ed795565;
 Thu, 13 Aug 2020 19:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=IODJshfpTM1XsW9BHVqe/s7asLOIvIqCZkJTIuAQFZs=; b=VG6q7s2F3otZwNLaM0WobbwFVk
 cCL/TBAJDfW7F35NMTmtJA39tF0AGKW91DUPJQWYxnminO7w6RDQTh7/AHGxuvrrBY9kGfGovSipJ
 ZsurcXEw/dcDiAqtg0155yA1n5I3+U8QOdL4ygLt+vcqyPyrT78fVu7hC0sAzcZrps/vyPZYNUwZl
 KJclcXnOlsjGONvcXU5H4QoZlzr5fWy2/dry0FvqYHmEZBS3ufk1S3ojZRG1Ke9QQmJ7x/q8XDAyg
 vMego03XF+/jM9FQ5aMLpEkZTaa0tSpUKdv7mQU4zU1zp5Ggq5NlDVAmW5GVlSMNvRUUcg0EYlI+6
 M/rwiu8w==;
Received: from [2601:1c0:6280:3f0::19c2]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6J2c-0005T8-4P; Thu, 13 Aug 2020 19:37:34 +0000
Subject: Re: linux-next: Tree for Aug 12 (x86: xen/pci)
From: Randy Dunlap <rdunlap@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <20200812142211.1fde2a46@canb.auug.org.au>
 <013ba445-7970-99c2-5639-44dcb5867340@infradead.org>
Message-ID: <7ff3c83c-81d7-9a06-b3ce-74e3f7098a4a@infradead.org>
Date: Thu, 13 Aug 2020 12:37:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <013ba445-7970-99c2-5639-44dcb5867340@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 8/12/20 7:57 AM, Randy Dunlap wrote:
> On 8/11/20 9:22 PM, Stephen Rothwell wrote:
>> Hi all,
>>
> 
> 
> on x86_64:
> 
> ../arch/x86/pci/xen.c: In function ‘pci_xen_init’:
> ../arch/x86/pci/xen.c:410:2: error: implicit declaration of function ‘acpi_noirq_set’; did you mean ‘acpi_irq_get’? [-Werror=implicit-function-declaration]
>   acpi_noirq_set();
>   ^~~~~~~~~~~~~~

(still seeing this one)

# CONFIG_ACPI is not set/enabled.

> 
> Full randconfig file is attached.
> 


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>

