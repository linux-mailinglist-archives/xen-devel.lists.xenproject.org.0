Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 754F14FE183
	for <lists+xen-devel@lfdr.de>; Tue, 12 Apr 2022 15:03:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303659.518078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neGB4-0008M7-Na; Tue, 12 Apr 2022 13:03:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303659.518078; Tue, 12 Apr 2022 13:03:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neGB4-0008KH-Jj; Tue, 12 Apr 2022 13:03:26 +0000
Received: by outflank-mailman (input) for mailman id 303659;
 Tue, 12 Apr 2022 13:03:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=STjZ=UW=citrix.com=prvs=0948eeb7d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1neGB3-0008KB-4a
 for xen-devel@lists.xenproject.org; Tue, 12 Apr 2022 13:03:25 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee394c75-ba60-11ec-a405-831a346695d4;
 Tue, 12 Apr 2022 15:03:23 +0200 (CEST)
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
X-Inumbo-ID: ee394c75-ba60-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649768603;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZdxWGk9LDezXWFQKKUr3RfB5DrzVD5Cn5rosDt6PUno=;
  b=giangBCgLwZJ93Rxav65DvCMnN8CzzcCbylCf59xDq2fzkirfe71DeYz
   vA3ddpqQ0CicY9GIJIwHl5b0RstQHP909WOR/X3c4y2AIITRXkgCzZ96+
   FFYKndX5pabZsNjU4zvkDdEiz7xuQ4DpqP7IXL56GWO4DNk+h/VkFu9jf
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 71077468
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:pRTezaN1uc+OGs/vrR2vl8FynXyQoLVcMsEvi/4bfWQNrUp31TQFm
 DQdDWGCMq3eMGH1L41yOtngpkgEuJ6AzIA3Swto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl29Qw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z8
 8gKiKWreBkVN5LXqOQdbhlaHiRcFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gRRK6BO
 JZHOVKDajzmfAVjAF0SGasSxuv0vFvaXi9doW+s8P9fD2/7k1UqjemF3MDuUsSGWN9Pl0CEj
 mvD9nb+BFcRM9n34SqI9Degi/HCmQv/WZkOD/uo+/hymlqRy2cPThoMWjOTo/C8h1X7S99ZA
 0AV/CUxpKw2skmmCMT+NyBUu1bd4ERaAYAJVbRntkfdkcI4/jp1GEA/U3l8UccXqvM/eica1
 l+0n9HkAB5G5ej9pW2myp+Yqja7OC4wJGAEZDMZQQZt3+QPsL3fnTqUEI89TffdYsndXGipn
 mvU9HRWa6A715Zj6kmtwbzQb9tATLDtRxV92AjYV3nNAuhRNN/8PNzABbQ2AJ99wGelorup4
 SBsdyu2trlm4XSxeMqlGrtl8FaBvavtDdEkqQQzd6TNDhz0k5JZQahe4StlOGBiOdsedDnib
 Sf74F0NtcALbSv6NPItPupd7vjGK4C6SrwJsdiOMLJzjmVZLlfbrEmCm2bNt4wSrKTcuf5mY
 srKGSpdJX0bFb5m3FKLqxQ1itcWKtQF7TqLH/jTlk3/uZLHPSL9YepVYTOmM7FihIvZ8Vq9z
 jqqH5bTo/mpeLalOXe/HE96BQ1iEEXX8riq85cHKbPZelMO9aNII6a5/I7NsrdNx8x9/tokN
 FnkMqOE4DITXUH6FDg=
IronPort-HdrOrdr: A9a23:bqOYkqtagIVe7T7VYmndbVvA7skDdNV00zEX/kB9WHVpmszxra
 GTddAgpHjJYVcqKRUdcL+7VJVoLUmyyXcx2/h2AV7AZniChILLFvAA0WKK+VSJcEeSygce79
 YDT0EXMqyIMbEQt6bHCWeDfeod/A==
X-IronPort-AV: E=Sophos;i="5.90,253,1643691600"; 
   d="scan'208";a="71077468"
Date: Tue, 12 Apr 2022 14:03:17 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: James Dingwall <james-xen@dingwall.me.uk>
CC: <xen-devel@lists.xenproject.org>, <pdurrant@amazon.com>
Subject: Re: [PATCH] fix invalid frontend path for set_mtu
Message-ID: <YlV4lXZHz52xPBzt@perard.uk.xensource.com>
References: <20220301093513.GA3187840@dingwall.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220301093513.GA3187840@dingwall.me.uk>

Hi James,

On Tue, Mar 01, 2022 at 09:35:13AM +0000, James Dingwall wrote:
> The set_mtu() function of xen-network-common.sh currently has this code:
> 
>         if [ ${type_if} = vif ]
>         then
>             local dev_=${dev#vif}
>             local domid=${dev_%.*}
>             local devid=${dev_#*.}
> 
>             local FRONTEND_PATH="/local/domain/$domid/device/vif/$devid"
> 
>             xenstore_write "$FRONTEND_PATH/mtu" ${mtu}
>         fi
> 
> This works fine if the device has its default name but if the xen config
> defines the vifname parameter the FRONTEND_PATH is incorrectly constructed.
> Learn the frontend path by reading the appropriate value from the backend.

The patch looks fine, thanks. It is only missing a line
"Signed-off-by: your_name <your_email>" at the end of the description.
The meaning of this line is described in the file CONTRIBUTING, section
"Developer's Certificate of Origin".

Thanks,

-- 
Anthony PERARD

