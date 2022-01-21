Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21986496143
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jan 2022 15:41:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259371.447633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAv5i-0005Cm-4i; Fri, 21 Jan 2022 14:40:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259371.447633; Fri, 21 Jan 2022 14:40:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAv5i-00059i-1R; Fri, 21 Jan 2022 14:40:38 +0000
Received: by outflank-mailman (input) for mailman id 259371;
 Fri, 21 Jan 2022 14:40:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QdbK=SF=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nAv5h-00059c-1M
 for xen-devel@lists.xenproject.org; Fri, 21 Jan 2022 14:40:37 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1652ca90-7ac8-11ec-8fa7-f31e035a9116;
 Fri, 21 Jan 2022 15:40:35 +0100 (CET)
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
X-Inumbo-ID: 1652ca90-7ac8-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642776035;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0X30hjGugfCEngfgDFITRcV42NHDlcPfKyUe3ZrodtI=;
  b=czCas+mnuBkTutQ2pPR9grvGL+5+nALMeolfGa8RncBAYUseQf/73vKC
   mQd9qdxxfHRmi6hLcLRZTgSYRxFQKQpeQ768qmdIkgGkOI2105ZA1g3Vf
   tKJpywLjcakE+CytTAuVauFm0pOm/OxrRBdsUss/rfcs26yY4mKBzni9Y
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 1WnuiTHsD+HhLBmJVJLfgacGmxRNdcsDj2rL64TKihe9gwH9cdxOE4ArXq/U6LDB70UdBHwjQl
 AmXPB+UGDfoemMTyzQigFWB16gvyaYlOcPKdOJLFT8YNBQKKacZgxOcl9wQttIO9OzJirxmMh6
 X+IFgYPwjjGPiqxczJASoqTMVazRZcJaj82tNoYs+iu5Uy3r96wUloEeKZz1hS4laE/EMFRSvh
 cdNZwm4+W/YPJa1XOYq7zaPXi3w9vwWm/YrpSlYY4FNKK8m5ETExeIDgVGXJh8w7U4ef6Es4ka
 CVTVdznc7+/PFMX5YEujwSSI
X-SBRS: 5.2
X-MesageID: 62413375
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:II2Usa+KJjDw5Q5vBt0MDrUDZXmTJUtcMsCJ2f8bNWPcYEJGY0x3z
 mJNCzqAO/aMa2b9L4wgOoS3/UkO68fRyNZhSwVppXw8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7dj29Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh01
 MVx7r27TD12N6rtmu0wbhpiPBNxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp4UQa+FP
 JVEAdZpRBPqUgxwZWdKNMlgh9yMtEGlIwJHoV3A8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru/Xn9AxwcHMySz3yC6H3Eru3AhyTgQ6oJCaa1sPVthTW71mEVTREbS1a/if24kVKlHcJSL
 VQO/SgjprR081akJuQRRDXh/iTC5ERFHYMNTatqs2lh15Y4/S6cGng4FR9KbeZ5vcgXRzUH6
 1yzsOHmUGkHXKKudVqR8bKdrDWXMCcTLHMfaSJscTbp8+UPs6lo0EuRE48L/Lqdy4SsRGqum
 2ziQD0W3u1L1aY2O7OHEUcrat5GjrzAVUYL6wreRQpJBSspNdf+N+REBbU2hMuszbp1rHHc5
 BDoeODEtYji6K1hcgTXEY3h+5nztp643MX02wIHInXY323FF4SfVY5R+ipiA0xiL9wJfzTkC
 GeK518Lu8cIbSrzMfEvC25UNyjM5fO4fTgCfquMBuein7ArLFPXlM2QTRP4M5/RfLgEzvhkZ
 MbznTeEBncGE6V3pAdatM9GuYLHMhsWnDuJLbiilkzP+ePHOBa9FOlZWHPTMLFRxP7U8W39r
 ocEX+PXmko3bQELSnSNmWLlBQpUfSFT6FGfg5E/S9Nv1SI/SDh+UKeAmO14E2Gn9owM/tr1E
 riGchcw4DLCabfvc21ms1hvN+HiW4hRt3U+MXB+NFqkwSF7M42u8L0eZ908erx+rL5vyvt9T
 v8kfcScA6sQFmSbqmpFNZSt/pZ/cBmLhB6VO3b3ajYIYJM9FRfC/cXpf1Wz+XBWXDa3r8Y3v
 5apyhjfHcgYXw1nAcuPMKCvwlq9sGIzguV3W0eUcNBfdF+1qNphKjDrj+9xKMYJcE2Ryjyf3
 geQIBEZueiS/NNlrIiX3fiJ9t77HfF/E0xWG3jgwYy3bSSKrHC+xYJgUfqTeWyPXm3D56j/N
 /5eyOvxMaNbkQ8S4ZZ8Cbti0Yk3+8Dr++1B1g1hEXjGMwarB7dnLiXU1MVDrPQQlLpQuA/wU
 UOT4NhKf76OPZq9QlIWIQMkaMWF1O0VxWaOvahkfh2i6X8l5qeDXGVTIwKI2X5UI7ZCOY84x
 fss5ZwN4Aulhxt2atuLg0i4LYhXwqDsh0n/iqwnPQ==
IronPort-HdrOrdr: A9a23:SPKAc6sjHRXFN9OnRg+9ySXa7skDjNV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd0ZJhEo7q90ca7Lk80maQa3WBzB8bGYOCFghrKEGgK1+KLrwEIcxeUygc379
 YDT0ERMrzN5VgRt7eG3OG7eexQvOVuJsqT9JjjJ3QGd3AVV0l5hT0JbTpyiidNNXJ77ZxSLu
 v72uN34wCOVF4wdcqBCnwMT4H41qf2fMKPW29+O/Y/gjP+9Q+V1A==
X-IronPort-AV: E=Sophos;i="5.88,304,1635220800"; 
   d="scan'208";a="62413375"
Date: Fri, 21 Jan 2022 14:40:26 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: Re: [PATCH 1/3] tools/xenstore: merge hashtable_private.h into
 hashtable.c
Message-ID: <YerF2iVhtXGXE504@perard>
References: <20220120120236.13826-1-jgross@suse.com>
 <20220120120236.13826-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220120120236.13826-2-jgross@suse.com>

On Thu, Jan 20, 2022 at 01:02:34PM +0100, Juergen Gross wrote:
> hashtable_private.h is used in hashtable.c only.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

