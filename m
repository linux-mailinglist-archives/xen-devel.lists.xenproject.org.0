Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 224DC2345C3
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:24:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1U5I-0005zK-7B; Fri, 31 Jul 2020 12:24:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oG5j=BK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k1U5H-0005zF-Gj
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:24:23 +0000
X-Inumbo-ID: c394fa1a-d328-11ea-abaa-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c394fa1a-d328-11ea-abaa-12813bfff9fa;
 Fri, 31 Jul 2020 12:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596198262;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ShpmB52Fr8d3Ksv94IPuEB5CRkYdnM/BGBhq/DKWbls=;
 b=icdLm2J3GxCIm6yZVkFi8HHbak9fahNuscMR+b+7cRZaRFx1BCGhymap
 TO0mDEn2pJf/DpFJ/UYpxcJtgfKEm9WfqgxeKkzhkoRf1W5Ee0Zw0JdZP
 w1Cu6r/oeDDkc9NlKPtovGTt7mL+SR2KX7jReGZv+69QFV+/cJA5f3IFU I=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: LqdMT3hqVq9SSVy5QExw9Q72tIyAQoLDIw9n7kJgmKacj1kSdRG2H+Qz1I0a2z58mS6TTUb0Uj
 Unc4hGAbFvq7usUnjPoIYdRViUkew/QXKIp2Ihw/+7rFNK9+R0x2lpFIVVPKcyIIVKdFmF9IDW
 C9rSWI/DkP5ZJmqxs8axNZFqyM9aJ0b+MIXcxsQvi2Og5a85wIWNiNENZmOOY5a835jCtcxtxG
 dZEGaSg7SaL3Wxgu0MaLl1iZ3nNp03vLSpPku5+jDdJj5Qxh3HgqIuH4bXi2RqPeNHF/Vz5A4S
 xIo=
X-SBRS: 3.7
X-MesageID: 23803642
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,418,1589256000"; d="scan'208";a="23803642"
Subject: Re: [PATCH v1] tools/xen-cpuid: show enqcmd
To: Olaf Hering <olaf@aepfle.de>
References: <20200730163406.31020-1-olaf@aepfle.de>
 <65317ac2-0dd0-b453-caec-e5529b423d95@suse.com>
 <6e467a8f-d727-8511-da56-69901b6ada85@citrix.com>
 <20200731141549.476fa255.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <11ecaa2d-22a4-8b9f-d994-133e934e27c7@citrix.com>
Date: Fri, 31 Jul 2020 13:24:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200731141549.476fa255.olaf@aepfle.de>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: xen-devel@lists.xenproject.org, Ian
 Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31/07/2020 13:15, Olaf Hering wrote:
> Am Fri, 31 Jul 2020 13:04:35 +0100
> schrieb Andrew Cooper <andrew.cooper3@citrix.com>:
>
>> And in particular, probably missing from libxl_cpuid.c, which I was
>> meaning to check when I've got a free moment.
> Will a ever domU see this flag? I just spotted the <29> when comparing =
'xen-cpuid' output between recent Xen releases. It shows up just in the '=
Known' section at this point.

For future platforms supporting Compute eXpress Link, PCIPassthrough
will be able to give various accelerators to VMs, and the ENQCMD{,S}
instructions is what the guest will use to talk to hardware.

As a set of functionality, think DPDK but with with userspace (or the
guest) able to submit work to hardware directly, through an interface
designed to be safe for this kind of thing.

~Andrew


