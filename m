Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5831FA385
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 00:29:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkxbN-0002Jb-GN; Mon, 15 Jun 2020 22:29:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G3SG=74=huskydog.org.uk=xen@srs-us1.protection.inumbo.net>)
 id 1jkxbL-0002JW-6X
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 22:29:11 +0000
X-Inumbo-ID: a18958fc-af57-11ea-b853-12813bfff9fa
Received: from gordon.huskydog.org.uk (unknown [81.187.95.156])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a18958fc-af57-11ea-b853-12813bfff9fa;
 Mon, 15 Jun 2020 22:29:09 +0000 (UTC)
Received: from [10.137.3.12] (percyq.huskydog.org.uk [10.42.42.111])
 by gordon.huskydog.org.uk (Postfix) with ESMTP id 19EABDA796
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2020 23:29:08 +0100 (BST)
To: xen-devel@lists.xenproject.org
From: Richard Simpson <xen@huskydog.org.uk>
Subject: ARM - Successful install on RockPro64
Message-ID: <46497134-fb7c-3d1f-6414-539138856480@huskydog.org.uk>
Date: Mon, 15 Jun 2020 23:29:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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

Hello,

Just to report that I have successfully installed Xen on a Pine 
RockPro64 ARM SBC.

I am using Xen 4.13 booting directly from u-boot on an SD card and my 
dom0 distribution is Gentoo.

I haven't tried to create a domU yet and I am doing everything via the 
serial console so I can't say anything about the graphics.

My biggest hurdle (apart from understanding u-boot) was needing to apply 
the vgic-v3: fix GICD_ISACTIVER patch.

I will be happy to provide more details when I have got a bit further, 
but after two weeks of effort I was so delighted to finally be able to 
log into dom0 that I thought I'd better let somebody know.

Richard Simpson


