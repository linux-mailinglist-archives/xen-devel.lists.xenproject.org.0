Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3177098CC
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 15:55:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537099.835892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q00Zx-0003mO-HO; Fri, 19 May 2023 13:55:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537099.835892; Fri, 19 May 2023 13:55:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q00Zx-0003kH-EO; Fri, 19 May 2023 13:55:33 +0000
Received: by outflank-mailman (input) for mailman id 537099;
 Fri, 19 May 2023 13:55:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h1HX=BI=citrix.com=prvs=496750f7c=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q00Zv-0003jx-93
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 13:55:31 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ceb16f2e-f64c-11ed-8611-37d641c3527e;
 Fri, 19 May 2023 15:55:28 +0200 (CEST)
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
X-Inumbo-ID: ceb16f2e-f64c-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684504528;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Uuu4LSxqVICmUg6LyP4Utj+sprKIwwLKqyqTjZYhcnM=;
  b=HkpcduDQzrW6eznXZSCx4VvRM2WUIz+hLJtKl6Q7xP7e1gCJLMcfd/kr
   Q0IkNGwLaPaT+TbCduJ8fcO5CYrjvfFjz5d5fVJq8HNu6EajqVc7VKK5K
   nJ5nzfo6hsgvsQH274lErHPejwvBMaCvRw815EyxDohSIJU4tETTAl66N
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 109674701
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Naoxq6NjUC2e2c7vrR2Ul8FynXyQoLVcMsEvi/4bfWQNrUoi3mcOx
 zROD2DSbP+JNjf1ft1+PY+3oUJT75+Dydc3TQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tF5w1mPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0v1HDjF1q
 MwaFAsmfwndrrzxxZ6QGtA506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUoXSFJsKwhnA/
 woq+UzGPjNABNrY0AaHqGuF2OPFoyTDBaYdQejQGvlC3wTImz175ActfVmyp/Wjm1O9c91aI
 k0QvCEpqMAa5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAbShZRZdpgs9U5LRQo2
 UWOhMjBHiF0vfueTnf13r6MoCm7IyQ9MW4IbihCRgwAi+QPu6lq0EiJFIw6Vvfo0JusQ2qYL
 y22QDYWnIUc3fVW56eHxnvWmmyF+N/MYiVl31CCNo661T9RaImgbo2uzFHU6/dcMYqUJmW8U
 Gg4d9u2t75XU8zU/MCZaKBURezyua7ZWNHJqQQ3d6TN4QhB7JJKkWp4xDhlbHlkPc8fEdMCS
 B+C4FgBjHO/0ZbDUEOWX25TI55ypUQDPY6/PhwxUjapSsYZSeN/1HsyDXN8Jki0+KTWrYkxO
 I2AbeGnBmsABKJswVKeHrlNjeNwmnBinj2NFPgXKihLNpLHPhaopUotagPSPojVEovfyOkqz
 zqvH5TTkEgOOAEPSiLW7ZQSPTg3EJTPPriv85Y/XrfacmJb9JQJV6e5LUUJJ9Y0wMy4V47go
 hmAZ6Ov4Aan1CSecV3WOi8LhXGGdc8XkE/X9BcEZT6As0XPq672tM/zq7NfkWEbydFe
IronPort-HdrOrdr: A9a23:x1s49q8Vyooo2YJzXhVuk+DYI+orL9Y04lQ7vn2YSXRuHPBws/
 re+MjztCWE7Qr5N0tMpTntAsW9qDbnhPlICOoqTNWftWvd2FdARbsKheCJ/9SjIVycygc079
 YHT0EUMrzN5DZB4vrH3A==
X-Talos-CUID: =?us-ascii?q?9a23=3Awa9d/2svkHhurIKf3APVQhLq6Is+QnKN9yrgIXO?=
 =?us-ascii?q?DIndwFpTLDlq80/Ndxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AKkAvEwzlOhCFlHf2LWB/ISweS4KaqJuSKho9l9I?=
 =?us-ascii?q?fh8veLAUuNz2jiwzqZoByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,176,1681185600"; 
   d="scan'208";a="109674701"
Date: Fri, 19 May 2023 14:55:01 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [PATCH v3 11/14 RESEND] libxc: Add xc_set_cpufreq_hwp
Message-ID: <683eb8e5-91eb-43a5-a23a-17ba837da204@perard>
References: <20230501193034.88575-1-jandryuk@gmail.com>
 <20230501193034.88575-12-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230501193034.88575-12-jandryuk@gmail.com>

On Mon, May 01, 2023 at 03:30:31PM -0400, Jason Andryuk wrote:
> Add xc_set_cpufreq_hwp to allow calling xen_systctl_pm_op
> SET_CPUFREQ_HWP.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

