Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0173F2B0BD0
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 18:57:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26003.54120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdGqi-0002Kc-FJ; Thu, 12 Nov 2020 17:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26003.54120; Thu, 12 Nov 2020 17:57:32 +0000
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
	id 1kdGqi-0002KD-Bs; Thu, 12 Nov 2020 17:57:32 +0000
Received: by outflank-mailman (input) for mailman id 26003;
 Thu, 12 Nov 2020 17:57:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rCOj=ES=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kdGqh-0002K8-FW
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 17:57:31 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d9b9b46-641d-43bd-b33e-121819da6dc3;
 Thu, 12 Nov 2020 17:57:30 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rCOj=ES=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kdGqh-0002K8-FW
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 17:57:31 +0000
X-Inumbo-ID: 9d9b9b46-641d-43bd-b33e-121819da6dc3
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 9d9b9b46-641d-43bd-b33e-121819da6dc3;
	Thu, 12 Nov 2020 17:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605203850;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=O8dSFYATXX2/0rtv+0vpyswT6N2eKHkMas7fUESBDQA=;
  b=GRNmge6jJi+uCniJTbcxyRlwnTnE/KKb7pvBHFPwQbW7GfM8+njR5VwA
   +syzthVQmB+jjGzi7FaHjPNjyS2mgyX+74Ema/XFdqtyTMUUOtCaR3G0t
   fLhr+azCChtiZkhals1k2lfweitSHDJLmHW5oUTyyQj3mrf/GmRd/wx+2
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 3vWL9XZGgiTZLWbfUf8OjRUmPowL2Tu1NgRlwjmOkLZSDQ+ahdxleXzus6XQKiHhi4iWnwOQf2
 BF/RBbjM8zQo8aqmOAvvUTysFDIXbeZ9puIIo2X2MNxWWCWRWrGZxcEujPll4divYiL5j7v0SJ
 O/Npv4gYAaK/mGY2WNOpM8YOGqovr0sC80AFsV0PovW2haIZF5f0J5uib1aWUB2aIcoN0NTuIz
 9+HcJN/08+mH1ZxdzTBZ4xQ6KfCaWRGII/P0PMXBl4Q/gcjRUdbLrYB8jr77mQiXxPh2RE9OLC
 Fok=
X-SBRS: None
X-MesageID: 31056687
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,472,1596513600"; 
   d="scan'208";a="31056687"
Subject: Re: dom0 PVH: 'entry->arch.pirq != INVALID_PIRQ' failed at vmsi.c:843
To: Manuel Bouyer <bouyer@antioche.eu.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>
References: <20201112155715.GA5003@antioche.eu.org>
 <20201112163240.6xswol2iswikdzef@Air-de-Roger>
 <20201112172704.GA5899@antioche.eu.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f5fd0199-698b-5bb9-87bb-4365855b0e27@citrix.com>
Date: Thu, 12 Nov 2020 17:57:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201112172704.GA5899@antioche.eu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 12/11/2020 17:27, Manuel Bouyer wrote:
> On Thu, Nov 12, 2020 at 05:32:40PM +0100, Roger Pau Monné wrote:
>> On Thu, Nov 12, 2020 at 04:57:15PM +0100, Manuel Bouyer wrote:
>>> Hello,
>>> I'm trying to add dom0 PVH support to NetBSD. I'm tesing with Xen 4.13
>>> on a brand new Intel x86 server (Dell R440).
>> I would recommend using 4.14, PVH dom0 is still very much in
>> progress, and while I don't recall any specific fix going in 4.14 that
>> could be related to this there have been changes.
> packaging Xen on NetBSD requires quite a bit of work; so I don't package
> every releases. I still need to get NetBSD patches in shape to contribute
> back ...

For issues like this, you don't need to package all of Xen.  You can
just build the hypervisor locally and boot that.  (It doesn't matter if
the dom0 userspace doesn't come up cleanly if you're debugging a general
issue between the kernel and Xen.)

~Andrew

