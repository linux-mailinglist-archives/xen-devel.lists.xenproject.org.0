Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 104B427C0D0
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 11:17:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNBkz-0004Hn-Ku; Tue, 29 Sep 2020 09:17:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wdp7=DG=panix.com=marcotte@srs-us1.protection.inumbo.net>)
 id 1kNBky-0004Hi-1p
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 09:17:08 +0000
X-Inumbo-ID: 2faa5065-2155-4fde-b453-505ec5eeffae
Received: from mailbackend.panix.com (unknown [166.84.1.89])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2faa5065-2155-4fde-b453-505ec5eeffae;
 Tue, 29 Sep 2020 09:17:07 +0000 (UTC)
Received: from panix5.panix.com (panix5.panix.com [166.84.1.5])
 by mailbackend.panix.com (Postfix) with ESMTP id 4C0v0f31YQz1p5d;
 Tue, 29 Sep 2020 05:17:06 -0400 (EDT)
Received: by panix5.panix.com (Postfix, from userid 13564)
 id 4C0v0f26hbzfYm; Tue, 29 Sep 2020 05:17:06 -0400 (EDT)
Date: Tue, 29 Sep 2020 05:17:06 -0400
From: Brian Marcotte <marcotte@panix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: paul@xen.org, 'Paul Durrant' <xadimgnik@gmail.com>,
 'Jules' <jules@ispire.me>, xen-devel@lists.xenproject.org,
 oleksandr_grytsov@epam.com, wl@xen.org
Subject: Re: [EXTERNAL] [Xen-devel] XEN Qdisk Ceph rbd support broken?
Message-ID: <20200929091706.GA10243@panix.com>
References: <AC8105C4-6DAD-4AB0-AC3F-B4CDD151CDEB@ispire.me>
 <763e69df40604c51bb72477c706ec24b@EX13D32EUC003.ant.amazon.com>
 <20200715191705.GA20643@panix.com>
 <000b01d65b40$ab7fead0$027fc070$@xen.org>
 <20200716202331.GA9471@panix.com>
 <003401d65c0e$995bb4f0$cc131ed0$@xen.org>
 <20200928142757.GA2006946@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200928142757.GA2006946@perard.uk.xensource.com>
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

> Jules, Brian, could you maybe try the attach QEMU patch and see if that
> works?

I applied the patch to the latest release QEMU (5.1.0), and successfully
ran these types of guests:

   PVHVM Linux
   PVHVM FreeBSD
   PV NetBSD
   PVH NetBSD

--
- Brian

