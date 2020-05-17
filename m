Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBEC1D683B
	for <lists+xen-devel@lfdr.de>; Sun, 17 May 2020 15:16:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaJ8g-0005Yc-09; Sun, 17 May 2020 13:15:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VT2+=67=yahoo.com=hack3rcon@srs-us1.protection.inumbo.net>)
 id 1jaJ8e-0005X0-7y
 for xen-devel@lists.xenproject.org; Sun, 17 May 2020 13:15:32 +0000
X-Inumbo-ID: 7bd56d2c-9840-11ea-9887-bc764e2007e4
Received: from sonic303-2.consmr.mail.bf2.yahoo.com (unknown [74.6.131.41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7bd56d2c-9840-11ea-9887-bc764e2007e4;
 Sun, 17 May 2020 13:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1589721330; bh=Ge/gHFIJDjB0LKhj6EBAtyXhKyAm2rHwT8NJxRHHmgM=;
 h=Date:From:Reply-To:To:Subject:References:From:Subject;
 b=rmIV3wkJl5uoQjG+H/453VPRHzxcswOy1FYBOjFupsbKEe8tvL4SDJT90LucGwpxQGoD0o9x/Tw963FawkQuS1PJiPyCMyy8tbQKYfGGvCZflAzc5+DO3Kg9yPNdHmp2zWWI6oQeF66rDgCYtjTUlbbJJJ0D8lTD9ENFN1iBg2rFynOcPhSFvZJFmCtJobRqBj9aX2dw2mB2PewV6nfSovuUGNAokWCIRtPhQNtTumiLYA3GAMXylZbLtvOd67Ow5xTH5oh5l9tf4XE+rG7LnDgFqK9oFnZJB0L49e/8qojQrXTiGdqnsE7gWBNgyTGgJ9wu6ZevE11Q3V5eKhmn7g==
X-YMail-OSG: fdu9jOoVM1l0psyy2KlVRaKFt152dRQRz2ANDSdJNBj8gsYfwLSrkcZdBkRZ1wL
 _DPo2RNArfnzGAGu1qKR8DZVxC1TWYX6YLLzSfIbEB5Yr6_9F4e.KVVUGIlvsOOTtACkdbqqbftZ
 NBOz6HvZeDL2nmkZXF0vHmAZUaoWUrMGg9k5SK61zdX8_1ny9.IWcwtec0_ntPRUgLoqA8A8d2LC
 qy1TKcURhxwUAjHeKkPJ5O2Z4mc9r0KC4VzjypELPuPDVbgdKrGG4R79XPxiUxK9VRYlSNo2ndwf
 PBQLEQTS0H5JV6Fib3kKEzA2xTchTeSr_xLbLGFfzRip3AykmxJpXUwrsZUo6h8IgqXSGOC5pddY
 1oOyyz38pbcwxnIDdFLsfo4AjdJMKGAo5duVIbP1oKVn2kaDuHtlxmAoWwWf8w5PG9A7ICYyEOyh
 VH2ng8DQ9.0Kgl6GszTyYff6Sb.NA5ZXHguAwQOp6cIgmZ3YYjBNgQx6ScRZFyHXv_CgcXynJhtw
 wMeL2R6HCqLsc8vektjvgu0aC.wQLm9_rryaW15VLQJrNG44IfkGmLwrWWZw2aNFd5_9v0iho7F_
 1PyMOzmq8BFKwbT8uK_xUsj.7bDPQSEZbNX.XrNfry7wH2ubgcaBemPLA0ulRnNOVaqz.tl9MVkd
 _zxntuxcd81expxhg165y_txoLJnl59icLTTFYyeCe0El94Ra_3b8t3O8.ZbaZa5FN7L_wICk.vD
 VQBvDk30tJUH7Qr4OTs9U803tiAwcUR0HjDez6.PhP4HoL9Hwv054q5deE5ULPA5zHW_pWAItgo2
 lVcq2ETftiEbLmKdK0czVNJvxll1M975rfVF2UNkGmb4B86oXTmF4q4o7wp3eI1WXc5XbXlEVZ_h
 zZ9UJEiy.ih3OG6NM9he6L96RPAqX_CPGqrZV5l.30ywxqMcCm.2wXi3wgHf7xfPTCWmI6m.dXeR
 LgHU3xO0qAUHwYJSibDaQGQWniLU4JFQJr45UAUKu1rG1al4CZ21L3tHH_zXRAgM1avgiGpfVeki
 SbwhvEuzC4DsWnSjQkgRubjZ0Ht94JLjNsMKb5ViHfdAtZWttT2s4JjM2_Th3v2yShXvOHfCiovA
 JupIXnjQRA6._mUDmBPEajMewg5_2DstiTKLRQDCKHWE0.T_gjG5kC2xOOJRI8ZxBFYqaGh7QojA
 ScA7ytf3uGRm4Cf.cLJX1c8OjHDFN4dgWCqAZNJCAFS1mgn_MWrA_W0dDsdyks1d0BNSHB_4rI15
 y9oOFO_XwOqlk1jUqgEzwjT_Y3Ze.ehvU3qiWAtZfOl4kR8RQJL4sYRQbXPg7OEp1O4t3GgQl8D2
 7A8.Ms2DCkGJ8OfL1zavBafnGHf9ibYvortsfgC9EKA--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic303.consmr.mail.bf2.yahoo.com with HTTP; Sun, 17 May 2020 13:15:30 +0000
Date: Sun, 17 May 2020 13:15:29 +0000 (UTC)
From: Jason Long <hack3rcon@yahoo.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <1478987168.271548.1589721329818@mail.yahoo.com>
Subject: RoCE adapters and Xen.
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_271547_1740513832.1589721329817"
References: <1478987168.271548.1589721329818.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15960 YahooMailAndroidMobile YMobile/1.0
 (com.yahoo.mobile.client.android.mail/6.7.1; Android/7.1.1; NMF26F; bbc100;
 BlackBerry; BBC100-1; 5.16; 1184x720; )
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
Reply-To: "hack3rcon@yahoo.com" <hack3rcon@yahoo.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

------=_Part_271547_1740513832.1589721329817
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,The Xen hypervisor doesn't support the RoCE adapters? The Oracle migrates to the KVM because of it.Why not add this feature?
Cheers.
------=_Part_271547_1740513832.1589721329817
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,<div id="yMail_cursorElementTracker_1589721184566">The Xen hypervisor doesn't support the RoCE adapters? The Oracle migrates to the KVM because of it.</div><div id="yMail_cursorElementTracker_1589721247290">Why not add this feature?</div><div id="yMail_cursorElementTracker_1589721258410"><br></div><div id="yMail_cursorElementTracker_1589721258680">Cheers.</div>
------=_Part_271547_1740513832.1589721329817--

