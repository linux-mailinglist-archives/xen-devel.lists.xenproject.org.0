Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0574A2490AF
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 00:21:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k89yF-0005eW-Cf; Tue, 18 Aug 2020 22:20:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gypu=B4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k89yD-0005eR-NV
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 22:20:41 +0000
X-Inumbo-ID: 9a80155d-e455-46f3-a84d-00a043275101
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a80155d-e455-46f3-a84d-00a043275101;
 Tue, 18 Aug 2020 22:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597789239;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=34jllqC+Ml2YxyZbvdiyOdEub04Mdifm0TBdS6ks3dM=;
 b=SEOkJM7UG8xR0cptFBLuonNUGLZTRZLTN/+WAUIH9RGp4H82+Za7n4VX
 enDka9ErlefJN5xz2TYaMhmgnWe4X40r4r1h7rv/x3a/WCH5jiiynx+Oa
 01rY6GrVeScCT+rAhfQGGj6MqMgdvuOzmy6tlVcfYB49RCvOZ9QWjNHlG s=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: tNZtKOsAolqqtPgqZ5nUdBRue51QbzHjmCx0kfQm/wMyUWIPCBdj1loy4b4+/k8LqaOiCv82Qz
 lEfpZIw8y4x5RKA4RQf0sdr8dso8IvGcf0cfh7OkFdj/DXzlUoASwNxjY0lwQA1or7Pign1vD5
 dKmoJP7w4TTPAfW/n/Z8+fHgq0EhDlvOw1912CzvjVIk606U/eAsm3kUmSZS88HpRWyhrAxXig
 MFcJlQ0GYIuiCb21DfQCus6DyfXuqHxmPMlWM+v53bYOxS6Y1kVL+eCeM4QTr/jr60MxWJ7VsU
 7oI=
X-SBRS: 2.7
X-MesageID: 25742155
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,329,1592884800"; d="scan'208";a="25742155"
Subject: Re: Xen 4.14.0 is busted on Dell 300x IoT Gateways
To: Roman Shaposhnik <roman@zededa.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Paul Durrant
 <paul@xen.org>, Jan Beulich <jbeulich@suse.com>, Juergen Gross
 <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <CAMmSBy9-cJuxC0jLPh6O-UCraThzg2wvNO29ZvxrBmVkatt_sg@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0f6b9a9d-e25f-c2ae-ea2b-fd13107a3b06@citrix.com>
Date: Tue, 18 Aug 2020 23:20:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy9-cJuxC0jLPh6O-UCraThzg2wvNO29ZvxrBmVkatt_sg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18/08/2020 23:09, Roman Shaposhnik wrote:
> Hi!
>
> first things first -- booting on those devices have always
> required efi=no-rs

That is a bug.  Please start a separate thread about it.  EFI Runtime
Services are de-facto mandatory on modern systems, and it is totally
unacceptable (from a users perspective) that Xen just doesn't work by
default.

It needs fixing.

> -- but it seems that Xen 4.14 is now 
> busted at a more fundamental level. I'm attaching two
> boot sequences (one with kernel 4.19.5 and one with 5.4.51)
> in the hopes that this may provide some clues right away.

As a note, from your logs:

Kernel command line: console=hvc0 root=(hd0,gpt1)/rootfs.img
dom0_mem=1024M,max:1024M dom0_max_vcpus=1 dom0_vcpus_pin
eve_mem=650M,max:650M eve_max_vcpus=1 ctrd_mem=300M,max:300M
ctrd_max_vcpus=1 rootdelay=3 setup_loops eve_installer

You've got some Xen command line parameters on the Kernel command line,
which won't be helping matters.

>
> Any help would be greatly appreciated!
>
> Oh, and finally it appears that this is NOT a regression from
> Xen 4.13 -- it fails the same way. I haven't tried Xen's earlier
> than that.

This is a Linux issue, not a Xen issue.

It is hitting a BUG_ON() while setting up interrupts.

Interestingly, they are both in byt_gpio_runtime_resume() which I guess
is BayTrail as the Intel platform, which probably means that something
pertaining to GPIO interrupts isn't being initialised normally.

~Andrew

