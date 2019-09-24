Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF01BD00B
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 19:03:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCo9X-0000fK-OR; Tue, 24 Sep 2019 16:59:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JTJ1=XT=posteo.de=hfp@srs-us1.protection.inumbo.net>)
 id 1iCo9V-0000fD-LJ
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 16:59:01 +0000
X-Inumbo-ID: 99e7d4ac-deec-11e9-9625-12813bfff9fa
Received: from mout01.posteo.de (unknown [185.67.36.65])
 by localhost (Halon) with ESMTPS
 id 99e7d4ac-deec-11e9-9625-12813bfff9fa;
 Tue, 24 Sep 2019 16:58:59 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 0906C160061
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2019 18:58:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1569344338; bh=lZ+Xlpfmj1RAHR5IYN2ylqEKbL2aJi0MKVyHqC8jIVo=;
 h=Subject:To:Cc:From:Date:From;
 b=ciP6xwXP36fZV0h3LcOqTyADxaFqywiMV+WQDQp8b2EcwIL9Rp8PuGIaYywlLhr42
 OMcQMktvXRFhPC6QpqIBO51Dqq0TYjPtsCr30t4X3GZf1wim3WWsXY2Ll/pNmuBBk/
 phnE3qmbgmsSoB5A/eArReItXiu8DNE1VqZbU12haMalb8A3OKDS8mngD638OV6iQc
 jWTtS/CR4OEKNGqO2QwGgmYpTzOp5PDYOZflPeG8KgQrnaxAayVHhDuyMQfYpq+4FG
 /byg3QAQI3J9m/mA8EkUt9Hx7+9dO5cau7NAe7n9e3mas/OvD4mLp5iGmaG82/9cly
 +F3Hx6dFTeLZQ==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 46d6pl6qWKz6tm9;
 Tue, 24 Sep 2019 18:58:55 +0200 (CEST)
To: Jan Beulich <jbeulich@suse.com>
References: <51bd31f9-4fb1-84b5-7b9b-983b53133148@posteo.de>
 <a2fecd7b-a035-48b4-ed18-cd3234be8d58@citrix.com>
 <53c70f32-9ae6-a9f8-6472-5e49d01ce2b0@posteo.de>
 <5d406fbf-d057-a515-5364-6f0e2f6955c7@suse.com>
From: Andreas Kinzler <hfp@posteo.de>
Message-ID: <b5df65da-38a6-f7ce-b7ec-3ab6af5e4c44@posteo.de>
Date: Tue, 24 Sep 2019 18:58:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5d406fbf-d057-a515-5364-6f0e2f6955c7@suse.com>
Content-Type: multipart/mixed; boundary="------------2A3990B388BE4E5065D60691"
Content-Language: en-US
Subject: Re: [Xen-devel] Windows HVM no longer boots with AMD Ryzen 3700X
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul.Durrant@citrix.com,
 Steven Haigh <netwiz@crc.id.au>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.
--------------2A3990B388BE4E5065D60691
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.09.2019 10:17, Jan Beulich wrote:
>>> Does booting with a single vCPU work?
>> Number of vCPUs make no difference
> Well, according to Steven it does, with viridian=0. Could you
> re-check this?

I can confirm that viridian=0 AND vcpus=1 makes the system bootable 
(with long delay though)

> at least the viridian=0 case? As to Linux, did you check that PVH
> (or HVM, which you don't mention) guests actually start all their vCPU-s
> successfully?

I just tried PVH and HVM with 8 vcpus. Everything works, tested with 
make -j9 on a kernel tree.

 > 8-core chip, I wonder whether
 > 
https://lists.xenproject.org/archives/html/xen-devel/2019-09/msg01954.html
 > still affects this configuration as well. Could you give this a try in

Does it still make sense to try the patch given the cpuid I posted?
Also I have an AMD 7302P in my lab (cpuid dump attached). No change in 
behavior from 3700X - cpuid is nearly the same.

Regards Andreas

--------------2A3990B388BE4E5065D60691
Content-Type: application/octet-stream;
 name="cpuid-amd7302p.tar.xz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="cpuid-amd7302p.tar.xz"

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
yT+AkD8AAZBXnrHEZ/sCAAAAAARZWg==
--------------2A3990B388BE4E5065D60691
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------2A3990B388BE4E5065D60691--

