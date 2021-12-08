Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAFD46D0FC
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 11:28:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242120.418793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muuAj-0008FN-A7; Wed, 08 Dec 2021 10:27:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242120.418793; Wed, 08 Dec 2021 10:27:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muuAj-0008Cu-6u; Wed, 08 Dec 2021 10:27:37 +0000
Received: by outflank-mailman (input) for mailman id 242120;
 Wed, 08 Dec 2021 10:27:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Njo=QZ=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muuAh-0008Cn-LW
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 10:27:35 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73620e39-5811-11ec-9d12-4777fae47e2b;
 Wed, 08 Dec 2021 11:27:33 +0100 (CET)
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
X-Inumbo-ID: 73620e39-5811-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638959253;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X/Ex4ED97g+7rU6xAg+N3XAsw9+w8e2m3q43uKD/p7Y=;
  b=UgWvpCOIyksDk7uFltypd4B5XbCHmx5I8JHkAhPtXbuOv013hboycD+Q
   T6s4ox2ukDWzyPEFNPM+0HQ/FdW81OjZ+IXGt3wW8WzN/+PQdnIqzl7lo
   a51Kd2ENHwj+T2/vE5dQAeV0OsabCoMHkTvjnXB2oujhKc9VGLOoEEGDb
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: nYgjo5KYdaHSfwgU8/CxuLfz9384nJItdEBIV/X1diqq/sGa4ZYGusOPspkcJAmSdm1XI8U+oR
 Xl/8yRMBOrAlbT8Os2fIxIWZRILRuUic7SxZfqUsE8/cG2BB+VwGiiMerThyGhzBOiO+kYpSV5
 RAVRV4WHeqRMPoReeHJ+nQWBGBfbZe6ZfnXT5miDmNz+20S30rxrHZgulJJ+Je21Lr65Q4A/qn
 /oiZawLCNs7ET4a8CvtiU7nd9DvI00165sQo5CmUZBEjxk5k1jRtIC/jekBbYJE+cxzDgxADlT
 4YW3n+MzN3Ji181E3O6bW8WH
X-SBRS: None
X-MesageID: 59924594
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:2uKBOK98zrAj8fcPTg12DrUDiX6TJUtcMsCJ2f8bNWPcYEJGY0x3x
 mFJXTqHaauMNGD1ftogOori9R4OsJ7Uy4QxHQc9/yg8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGmeIdA970Ug6wrRh0tYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhDk
 tsQjt+AFj4PO5Lsgvo0UwBoNxtXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp0fTKyCO
 ptFAdZpRE/dexNXNgk3MpIdrPiC2CjFXGx99mvA8MLb5ECWlmSdyoPFMcXXUsyHQ91PmUSVr
 X6A+H72ajkFMPSPxDzD9Wij7sfNkjn8Q5k6D6Cj+7hhh1j77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHAswaQ+SDe+ERGApwJTrN8uFrlJrfo3jt1z1MsFlZpAOHKfudtLdDz/
 lPWzd7vGxJ1t7iZFSCU+ruO9GvgMikJN24SIyQDSFJdsdXkpYgyiDPJT8piT/Hp3oGkR2moz
 mDYtjU6ipUSkdUPi/ex82fYjm/+vZPOVAM0uFnaBzr38gNjaYe5TIW08lyHv+1YJYOUQwDZ7
 ngJksST9s4UCpSJmHDfSekBBujxtf2ELCfdkRhkGJx4r2ah/HuqfIZx5jBiJRg2bpZYKGGxO
 EKK4FFf/p5eOneufJRbWYPpBpR417XkGPTkSuvQMohEbK9ueVLV5yppf0ORgTzgyRB+jaElN
 J6HWs+wFnJGW79/xT+7SupBg78mwicymTHaSZzhlkn11LOfYDieSKsfMUvIZec8tfvWrALQ+
 tdZFs2L1xQAD7GuPniJqdYefQIQMHw2JZHqsMgGJOeMLz1vFHwlF/KMk6gqfJZonvgNm+rFl
 p1ntpS0FLYraaX7FDi3
IronPort-HdrOrdr: A9a23:XKi6p6myWxsS5V6WJIR+yhY+xOfpDfIu3DAbv31ZSRFFG/Fxl6
 iV/cjz8SWE7wr5OUtQ/exoV5PtfZqxz/FICMwqTNGftWrdyQ6VxeNZnOjfKlTbckWUnINgPO
 VbAspD4bXLfCFHZK3BgDVQfexP/OW6
X-IronPort-AV: E=Sophos;i="5.87,297,1631592000"; 
   d="scan'208";a="59924594"
Date: Wed, 8 Dec 2021 10:27:18 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, "Wei
 Liu" <wl@xen.org>
Subject: Re: [PATCH] tools/libs/light: set video_mem for PVH guests
Message-ID: <YbCIhtVieJhncfm7@perard>
References: <20211203073058.10980-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211203073058.10980-1-jgross@suse.com>

On Fri, Dec 03, 2021 at 08:30:58AM +0100, Juergen Gross wrote:
> The size of the video memory of PVH guests should be set to 0 in case
> no value has been specified.
> 
> Doing not so will leave it to be -1, resulting in an additional 1 kB
> of RAM being advertised in the memory map (here the output of a PVH
> Mini-OS boot with 16 MB of RAM assigned):
> 
> Memory map:
> 000000000000-0000010003ff: RAM
> 0000feff8000-0000feffffff: Reserved
> 0000fc008000-0000fc00803f: ACPI
> 0000fc000000-0000fc000fff: ACPI
> 0000fc001000-0000fc007fff: ACPI
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

