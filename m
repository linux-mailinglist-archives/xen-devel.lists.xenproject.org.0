Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D86373408F4
	for <lists+xen-devel@lfdr.de>; Thu, 18 Mar 2021 16:34:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99042.188113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMueR-00062C-Ov; Thu, 18 Mar 2021 15:33:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99042.188113; Thu, 18 Mar 2021 15:33:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMueR-00061n-Lb; Thu, 18 Mar 2021 15:33:31 +0000
Received: by outflank-mailman (input) for mailman id 99042;
 Thu, 18 Mar 2021 15:33:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mu28=IQ=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1lMueP-00061i-Et
 for xen-devel@lists.xen.org; Thu, 18 Mar 2021 15:33:29 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 653412d4-31d9-4555-816c-12e24945a30b;
 Thu, 18 Mar 2021 15:33:28 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1616081591390133.4538303262699;
 Thu, 18 Mar 2021 08:33:11 -0700 (PDT)
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
X-Inumbo-ID: 653412d4-31d9-4555-816c-12e24945a30b
ARC-Seal: i=1; a=rsa-sha256; t=1616081596; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lHqhF+8TXg92tG6VYPqEUIdiRPFJ6o4XCFfGa8ekIEMiqeSAJh6fBEbUN2xfafb6la5IHlamKMtur7LtWVhPdCgVfbIi0GY4b813P7A2SCnjHDTtyS1VBD9t5z+SVn9D8k5vbb14S1WvoGw2UJfIHu7v6FnobGu8o24QkJ+V2/c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1616081596; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=JSTC0KlpqwRZ1Y9KG7KnEJ+ZMXT8qVqzatoEKhnUWOk=; 
	b=jMzakG7h+OEHWahYufdBb+gTX/tRNtEKMyGIOB4NZhBZcl2zgTeJr+xZsQg6IYwFPAfihRrfS6y6n7vT9/4/efKNNqUdl0emyM9tR5q31UUN25OCyaqe9kv6ihHj4LARc1flla5c57SfTWU5pZjJD8Vt42QfHao/bgkE4vHbcis=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com> header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1616081596;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=JSTC0KlpqwRZ1Y9KG7KnEJ+ZMXT8qVqzatoEKhnUWOk=;
	b=qM95uCTC2F2WMlcpKyq4yQG4kn6x89M0E+f1r0bEX6Z7xzJetiQIl+BBbNMH3bs3
	4quR9fIJwz6s7/x5xbmmrmhj416D0GJ5eQGDV6SFZr5zHGr3PjQJ/vL9nC42j9duWVp
	vtj8eji4zgzJHP8f4vhZ8QO9/IJTtsNdYv3DjIEE=
Subject: Re: Working Group Meeting for hyperlaunch
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: christopher.w.clark@gmail.com, stefano.stabellini@xilinx.com,
 jgrall@amazon.com, iwj@xenproject.org, wl@xen.org, george.dunlap@citrix.com,
 jbeulich@suse.com, persaur@gmail.com, bertrand.marquis@arm.com,
 roger.pau@citrix.com, luca.fancellu@arm.com, adam.schwalm@starlab.io,
 Andrew Cooper <andrew.cooper3@citrix.com>, paul@xen.org
References: <2e7213c1-e01c-9d9d-3ac1-3086eb6889e5@apertussolutions.com>
Message-ID: <c3a60e96-3179-f377-5c8b-3e6941d055ae@apertussolutions.com>
Date: Thu, 18 Mar 2021 11:33:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <2e7213c1-e01c-9d9d-3ac1-3086eb6889e5@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 3/16/21 12:09 AM, Daniel P. Smith wrote:
> All,
> 
> We have posted[1][2] the design documents for hyperlaunch and would
> invite attendance at a working group call to discuss two agenda items.
> The first item is a review of the documents and the second is a
> discussion about bringing production-ready revisions of our previous
> prototype in as patches to provide a near-term implementation of the
> design. If possible please join us this Thursday 3/18 at
> 1700CET/1600GMT/1200EDT/0900PDT. Below are the call details.
> 
> [1]
> https://lists.xenproject.org/archives/html/xen-devel/2021-03/msg00939.html
> [2]
> https://lists.xenproject.org/archives/html/xen-devel/2021-03/pdfCV4LaWCrTN.pdf


Agenda link,
https://cryptpad.fr/pad/#/2/pad/edit/+MJgJ0EkalH81-YVOlsp1bEo/

> Call Details:
> 
> Daniel Smith's Meeting
> 
> 
> Please join my meeting from your computer, tablet or smartphone.
> 
> https://www.gotomeet.me/apertussolutions
> 
> You can also dial in using your phone.
> (For supported devices, tap a one-touch number below to join instantly.)
> 
> United States (Toll Free): 1 877 568 4106
> - One-touch: tel:+18775684106,,691818141#
> 
> Access Code: 691-818-141
> 


