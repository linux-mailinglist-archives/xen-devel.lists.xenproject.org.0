Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1BA3AD093
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 18:36:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144872.266603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luHTY-0007Wt-3t; Fri, 18 Jun 2021 16:36:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144872.266603; Fri, 18 Jun 2021 16:36:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luHTY-0007V0-0D; Fri, 18 Jun 2021 16:36:12 +0000
Received: by outflank-mailman (input) for mailman id 144872;
 Fri, 18 Jun 2021 16:36:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UjTI=LM=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1luHTW-0007Uq-F5
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 16:36:10 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5b0bc74-a6ec-41a5-9928-a60b8f77da7b;
 Fri, 18 Jun 2021 16:36:09 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1624034153434589.5185837456162;
 Fri, 18 Jun 2021 09:35:53 -0700 (PDT)
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
X-Inumbo-ID: a5b0bc74-a6ec-41a5-9928-a60b8f77da7b
ARC-Seal: i=1; a=rsa-sha256; t=1624034155; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YR+uAMLbJUT11rFLVyCpG0GfOQvqt/17jTPwkRwGaKPAJp+4AZRp1kPLzqoCkBKlCrGJ2R+of03eWvh7CgRPuxbmPpURFUcKs7pjEb/733arpPPq2m8rz76HeqMteuw1qx251yRfEhge6XghL4oizKiJvI33sZdPPDf2Bd//OEU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1624034155; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=69IpwWXK3mWUm2Wmb9lSHteuSzYc/bj0Wh2e6z959Z8=; 
	b=F7BEjOPuG5C4cLwhyPn6ImL5no1O6gduLNftFzSYIVOkxpTjPJS51/XOoUtaUaXR13Rhs3A2qwJja0e8FxJixPJcPF+y7zlRSl/wMwMlEogCjuWyXjTtIWLcEm/nE4qKGopJsDETOkET/eJHUh7o5kJTApNMVeYIcu7O4LsXL5I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1624034155;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=69IpwWXK3mWUm2Wmb9lSHteuSzYc/bj0Wh2e6z959Z8=;
	b=XurGKqVlinI2AvHAE7rKaD41qxC0jJmHDVnyktE/ORrd0hzEdFnr+VT55rMhM5YC
	d4JfWcLfaeEdXp1030CTkyAA96RK79Nm2CKrAceyCXRjI0pFCZ9Yc/PHz0O8dUY4axc
	J/CMoNSF4m2jY+2th0POMW/BNv5C5Xwd9oq1au+E=
Subject: Re: [PATCH 4/6] xsm: remove xen_defualt_t from hook definitions
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Tim Deegan <tim@xen.org>,
 Juergen Gross <jgross@suse.com>, Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Dario Faggioli <dfaggioli@suse.com>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, persaur@gmail.com,
 christopher.w.clark@gmail.com, adam.schwalm@starlab.io,
 scott.davis@starlab.io
References: <20210617233918.10095-1-dpsmith@apertussolutions.com>
 <20210617233918.10095-5-dpsmith@apertussolutions.com>
 <f18aa77f-e2ed-aa10-37d3-2cdbcd5645eb@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <b976ff05-14a2-1c7c-5f16-40e9d4324afd@apertussolutions.com>
Date: Fri, 18 Jun 2021 12:35:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <f18aa77f-e2ed-aa10-37d3-2cdbcd5645eb@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 6/18/21 7:56 AM, Andrew Cooper wrote:
> On 18/06/2021 00:39, Daniel P. Smith wrote:
>> With the conversion of making XSM always enabled even the dummy XSM module is
>> being invoked through the xsm_ops dispatch which does not use passing of the
>> default privilege. This commit removes the xen_default_t parameter from the hook
>> definitions and all the respective call sites.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> I'm struggling to parse the first sentence.  Also, there's a typo in the
> subject.

I will rewrite.

v/r,
dps


