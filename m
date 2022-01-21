Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5154961D8
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jan 2022 16:13:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259385.447677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAvbS-0001v3-Ou; Fri, 21 Jan 2022 15:13:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259385.447677; Fri, 21 Jan 2022 15:13:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAvbS-0001sj-Ku; Fri, 21 Jan 2022 15:13:26 +0000
Received: by outflank-mailman (input) for mailman id 259385;
 Fri, 21 Jan 2022 15:13:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QdbK=SF=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nAvbQ-0001sd-OW
 for xen-devel@lists.xenproject.org; Fri, 21 Jan 2022 15:13:24 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abcac533-7acc-11ec-8fa7-f31e035a9116;
 Fri, 21 Jan 2022 16:13:23 +0100 (CET)
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
X-Inumbo-ID: abcac533-7acc-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642778003;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wwD2cD1MXelD4ZY0eWiPIT8rbg8F8/3Cm62N3gbEFeE=;
  b=RfqxuJSSdH+9p0r2am9A7o+mY+9hAnU2EKtxTpxC44JFHYUOeFqHOGX7
   p+tagbmyN7UiEXnJpI6QdaE2+Eg2LQliYHeYHsvViPJoeFhuSCTQCzwGv
   Rau8M5+kmO3v1+HImb53+l2G6CbxdbRqMcmn/0/p8FRhsrobqm8I5c+D5
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: QEdJUKUN8ELEYNvSs+6ChGmgd7cjfDjeDQQG+Lt6/j0s2TPLmFbUtol2rwxcTyv7AvDm4y5/Fc
 1FlY5rx6AEkIgmmBhXar6dUjWR965lsVMBXnY+oVNeNRdoGf2WSFyuYiJ26xQm8zidm09bl/bm
 TTFSkMEikATSOU63Xr3n9teaHHd9qm5HZV5C6YoyI5MiFX1popR55g7xExwlxE5a0G5fH64Vu5
 4rlIqtLBJPWoZqR61h14epbhOpAsZ4psAWzFU/ZzQf6gkaFOhQvBWwtwPumyEtY18qn+cmoCwv
 a6rP8iAeQcPI9EEto59AmhYq
X-SBRS: 5.2
X-MesageID: 62497026
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:PXgX4q88AEF89FQNZ9mlDrUDZXmTJUtcMsCJ2f8bNWPcYEJGY0x3x
 jQbCG2Ab/aKM2XyeYxxbIqy8hsHuMDTzYBhSVdpris8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7dj29Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPggk
 stXjL7tWD4WL7He3+QcVDZYHWJhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp4UQaeBP
 5BHAdZpRDP5QhkIGFkLMY4Vmv+thCjUUTZx+WvA8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru/Xn9AxwcHMySz3yC6H3Eru3AhyTgQ6oJCaa1sPVthTW71mEVTREbS1a/if24kVKlHcJSL
 VQO/SgjprR081akJuQRRDXh/iTC5ERFHYMNTatqs2lh15Y4/S7IXHYedxwceeUZpdMkAjwr0
 XCJkZD2UGkHXKKudVqR8bKdrDWXMCcTLHMfaSJscTbp8+UPs6lo0EuRE48L/Lqdy4SsRGqum
 2ziQD0W3u1L1aY2O7OHEUcrat5GjrzAVUYL6wreRQpJBSspNdf+N+REBbU2hMuszbp1rHHc5
 BDoeODEtYji6K1hcgTXEY3h+5nztp643MX02wIHInXY323FF4SfVY5R+ipiA0xiL9wJfzTkC
 GeK518Lu8cIbSrzMfEvC25UNyjM5fO4fTgCfquMBuein7ArLFPXlM2QTRP4M5/RfLgEzvhkZ
 MbznTeEBncGE6V3pAdatM9GuYLHMhsWnDuJLbiilkzP+ePHOBa9FOlZWHPTMLFRxP7U8W39r
 ocEX+PXmko3bQELSnSNmWLlBQpUfSFT6FGfg5E/S9Nv1SI/SDh+UKeAmO14E2Gn9owM/tr1E
 riGchcw4DLCabfvcG1ms1hvN+HiW4hRt3U+MXB+NFqkwSF7M42u8L0eZ908erx+rL5vyvt9T
 v8kfcScA6sQFmSbqmpFNZSt/pZ/cBmLhB6VO3b3ajYIYJM9FRfC/cXpf1Wz+XBWXDa3r8Y3v
 5apyhjfHcgYXw1nAcuPMKCvwlq9sGIzguV3W0eUcNBfdF+1qNphKjDrj+9xKMYJcE2Ryjyf3
 geQIBEZueiS/NNlrIiX3fiJ9t77HfF/E0xWG3jgwYy3bSSKrHC+xYJgUfqTeWyPXm3D56j/N
 /5eyOvxMaNbkQ8S4ZZ8Cbti0Yk3+8Dr++1B1g1hEXjGMwarB7dnLiXU1MVDrPQQlLpQuA/wU
 UOT4NhKf76OPZq9QlIWIQMkaMWF1O0VxWaOvahkfh2i6X8l5qeDXGVTIwKI2X5UI7ZCOY84x
 fss5ZwN4Aulhxt2atuLg0i4LYhXwqDsh0n/iqwnPQ==
IronPort-HdrOrdr: A9a23:lP5ZN6k8nz8YWV+/cJ+dg0W00wnpDfIo3DAbv31ZSRFFG/Fw8P
 re+8jztCWE7Ar5PUtKpTnuAsW9qB/nmqKdgrNwAV7BZmfbUQKTRekJgLcKqAeAJwTOssJbyK
 d8Y+xfJbTLfD1HZB/BkWqF+gAbsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.88,304,1635220800"; 
   d="scan'208";a="62497026"
Date: Fri, 21 Jan 2022 15:13:16 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: Re: [PATCH 3/3] tools/xenstore: drop DEFINE_HASHTABLE_* macros and
 usage intro
Message-ID: <YerNjEld2pe9hSoI@perard>
References: <20220120120236.13826-1-jgross@suse.com>
 <20220120120236.13826-4-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220120120236.13826-4-jgross@suse.com>

On Thu, Jan 20, 2022 at 01:02:36PM +0100, Juergen Gross wrote:
> The DEFINE_HASHTABLE_* macros are used nowhere, so drop them. The usage
> intro isn't needed either with those macros dropped.

The first part of the intro "Example of use:" doesn't speak about the
macro, so removing the macro part doesn't mean that the first part
should be removed. But it is probably not necessary as the documentation
for the functions are probably good enough to figure out how to use
hashtable. Can you reword that last sentence?

Thanks,

-- 
Anthony PERARD

