Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC22D2EC808
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jan 2021 03:20:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62745.111251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxKtr-0000PV-Vv; Thu, 07 Jan 2021 02:19:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62745.111251; Thu, 07 Jan 2021 02:19:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxKtr-0000PD-RK; Thu, 07 Jan 2021 02:19:43 +0000
Received: by outflank-mailman (input) for mailman id 62745;
 Thu, 07 Jan 2021 02:19:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KhZe=GK=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kxKtq-0000P8-DR
 for xen-devel@lists.xenproject.org; Thu, 07 Jan 2021 02:19:42 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0221bc5c-9ba1-4639-a789-2ac849729a96;
 Thu, 07 Jan 2021 02:19:40 +0000 (UTC)
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
X-Inumbo-ID: 0221bc5c-9ba1-4639-a789-2ac849729a96
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609985980;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=nyfcfAS056NcdPsADziwgemYZo6rRQZnXGnZyshwFW0=;
  b=D0SZf6lrfCbweJJq/au1439WIwpVPcxG6WPItqw3B6sGIgCd7GF8Go3B
   UB5n3xPTYbRRH2bixcUX6H8RQ0Xl4tJV8BXnT+L3XEadfoahgPxkzQB/w
   U+tRolW2AwSeuxdXlbnRwWqyLnYCXKVu19DUK+zd1dJh9f9CJCZgt/Axt
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ax20HMEPj7xda3wmfqwQrszgKx9NiYJF6e2lFS3yBd0kfLollWR/bxJVVDEJkW/2JxGX15QwKu
 a4pDxq6xsw+mJk3dAiLUl4S++9HKaeoRAaTmZ9TMb51KiGz5wvnmhOnnb5GkyzYM/TYSHpmSpQ
 hL/oTFg5gjau86Z6V4CinUvIXJW/PFt9GcgMHG3HVjE332nLKLlVTXNj30XY10+1BRMqqvUKi6
 UCMr4v6Te0fXFrzaA4Y2/ot9XcyVEoBF87u1dvh/KI6pkOGBk8EoS8TXzonrloq+LHqhOxhCdg
 fqY=
X-SBRS: 5.2
X-MesageID: 34772676
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,328,1602561600"; 
   d="scan'208";a="34772676"
Subject: Re: [PATCH v3] x86/intel: insert Ice Lake-X (server) and Ice Lake-D
 model numbers
To: Jan Beulich <jbeulich@suse.com>
CC: <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>, <wl@xen.org>,
	<jun.nakajima@intel.com>, <kevin.tian@intel.com>,
	<xen-devel@lists.xenproject.org>
References: <1608755520-1277-1-git-send-email-igor.druzhinin@citrix.com>
 <b0c7ccb7-32b8-a022-72ad-274e0a0c6dca@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <f33f0756-12a3-f20d-52b6-871ba2238b64@citrix.com>
Date: Thu, 7 Jan 2021 02:17:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b0c7ccb7-32b8-a022-72ad-274e0a0c6dca@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06/01/2021 11:04, Jan Beulich wrote:
> On 23.12.2020 21:32, Igor Druzhinin wrote:
>> LBR, C-state MSRs should correspond to Ice Lake desktop according to
>> External Design Specification vol.2 for both models.
>>
>> Ice Lake-X is known to expose IF_PSCHANGE_MC_NO in IA32_ARCH_CAPABILITIES MSR
>> (confirmed on Whitley SDP) which means the erratum is fixed in hardware for
>> that model and therefore it shouldn't be present in has_if_pschange_mc list.
>> Provisionally assume the same to be the case for Ice Lake-D.
> 
> I did find Ice Lake D EDS, and it confirms the respective additions.
> In the course I also found the "plain" Ice Lake EDS, and it seems to
> contradict SDM vol 4 in that it doesn't list CC3_RESIDENCY (0x3FC).
> For now I guess we can consider this a doc error.
> 
> I didn't find Ice Lake-X EDS, though.

You may search "Ice Lake server eds volume 2".

Igor

