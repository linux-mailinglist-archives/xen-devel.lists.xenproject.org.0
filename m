Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E7C28F2F0
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 15:11:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7360.19207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT31x-0005aC-FE; Thu, 15 Oct 2020 13:10:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7360.19207; Thu, 15 Oct 2020 13:10:53 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT31x-0005Zq-Bj; Thu, 15 Oct 2020 13:10:53 +0000
Received: by outflank-mailman (input) for mailman id 7360;
 Thu, 15 Oct 2020 13:10:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LoCs=DW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kT31v-0005Zl-FB
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 13:10:51 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5abb5e33-7b0f-437a-a9aa-8e1ca1174325;
 Thu, 15 Oct 2020 13:10:50 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=LoCs=DW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kT31v-0005Zl-FB
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 13:10:51 +0000
X-Inumbo-ID: 5abb5e33-7b0f-437a-a9aa-8e1ca1174325
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5abb5e33-7b0f-437a-a9aa-8e1ca1174325;
	Thu, 15 Oct 2020 13:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602767450;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=f6Kamy1C8O875JTu/vLF90Ddc8FWBrVKHooa1uTjaeQ=;
  b=c2vt4C6rqNUF9VdfyCuMKsk1juKOixPSz7EXwnsSpnrpuSppcgHO2Guf
   IyHizkMxUZHf+wKiv0b202dp3KcKGCBdfepdGOhfYhP1SK8pDO2CLd+cP
   gq580Wo6KOPHskrPXZc2XVdCcJZZXPz8HnDFD2SomiekpYUwz19qqTRLw
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: TsNzbLxMsk384nJy5Ma5vOQoKEjgU+ipNL1nJSmtDZ6qs87H2v+vbvQIN4MbbD72V2Ey2BJWzK
 DJ2By9UKxVmig34H8L3MwHOYlSQxz2DBF8RnLL026OOdZRjfNPY566lXkCEMWpefwuzoeGsvFt
 SnTPGz44+AtTSC4bBi08uZqWHQKJcn+DFJ+74bUEgEdXNlB7yWOUEr2CPons5/qNhxHYKojNNA
 H5bJ7MetpyQXJ0vK5ZCl6jO/6csbfhHTojPmAvbq5tYkHveVjp4yyTrmmaBCv2pnjkGKD8M7ZL
 4Bg=
X-SBRS: 2.5
X-MesageID: 29078535
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,379,1596513600"; 
   d="scan'208";a="29078535"
Subject: Re: [PATCH 2/2] xen: Kconfig: nest Xen guest options
To: <boris.ostrovsky@oracle.com>, Jason Andryuk <jandryuk@gmail.com>, "Juergen
 Gross" <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
References: <20201014175342.152712-1-jandryuk@gmail.com>
 <20201014175342.152712-3-jandryuk@gmail.com>
 <6cd9363c-ac0c-ea68-c8e7-9fd3cd30a89b@oracle.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <4e31301b-0e57-ac89-cd71-6ad5e1a66628@citrix.com>
Date: Thu, 15 Oct 2020 14:10:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6cd9363c-ac0c-ea68-c8e7-9fd3cd30a89b@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 15/10/2020 13:37, boris.ostrovsky@oracle.com wrote:
> On 10/14/20 1:53 PM, Jason Andryuk wrote:
>> +config XEN_512GB
>> +	bool "Limit Xen pv-domain memory to 512GB"
>> +	depends on XEN_PV && X86_64
>
> Why is X86_64 needed here?

>512G support was implemented using a direct-mapped P2M, and is rather
beyond the virtual address capabilities of 32bit.

~Andrew

