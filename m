Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 668F042C1C4
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 15:52:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208511.364657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maeg4-0001Pf-Fo; Wed, 13 Oct 2021 13:52:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208511.364657; Wed, 13 Oct 2021 13:52:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maeg4-0001NU-CQ; Wed, 13 Oct 2021 13:52:16 +0000
Received: by outflank-mailman (input) for mailman id 208511;
 Wed, 13 Oct 2021 13:52:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EFKL=PB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1maeg2-0001NO-NE
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 13:52:14 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c445a604-2c2c-11ec-8171-12813bfff9fa;
 Wed, 13 Oct 2021 13:52:13 +0000 (UTC)
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
X-Inumbo-ID: c445a604-2c2c-11ec-8171-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634133132;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=qMEyeyi2uAwQCL5PyU4dXpnf9gqe9XEjVYdD7fEJQb8=;
  b=PciBmR6hKwvX9Wg1uvN3/cjybFnQ6ItcaFvE8WOAT14OGBdugsOyK0Lb
   cojJzbR0V97vNq2h6V9oq92nRCcP30PDvuSZUSsoNKjtDPu2agE95vJnG
   N5DOCE5wUykOoyO7JqXp0ayw90VcWmjDkWXcsDIuATm3g8MAxnw4M/toK
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: KNDd8LRWFeTJSxstTAsw0ADtxOlLfRUfZPR/4Cgr1P6nuuCFJsTM38LQVI7pyTGl03DHAqUIcK
 BSY2RtxJjVg5wbGTrqnRQMyXrNPW3B1o8/uGycf8xIG8NQzkMnHW4NOF/gQBVzVUmMZN5d66dr
 yUYDoVEkZ/NKvVHyl03cyoBIgPeyHSdd7p6OVzxZaX0TUIZzNMkp2p8CKn4lqRPSoRq3KZlSzu
 edtJKNUPX1pB69xJfkE01aCOMNsSwQPPOBYqg6jmoBp4d1tjsLwQkztydVcinJgc2QOVr7lBSg
 AWhd4GHpxlR60gnuqY319EfA
X-SBRS: 5.1
X-MesageID: 55121596
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:c+86J6p9N4JDdzFYVQCcNgxbM7ZeBmIhYxIvgKrLsJaIsI4StFCzt
 garIBmPb66LMGr9e98gaN6x9ktS75HXz9Q2QVdqrCBhHi4b9JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd84f5fs7Rh2Ncx2YHiW1jlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZH3dT0gAPLmor8AD0hhInFAJJxg6paSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp0TRKyHO
 ptHAdZpRDf5WEYIM34VMoMRpriFglfbaw1jonvA8MLb5ECMlVcsgdABKuH9eNaHWMFUlUawv
 X/d8iLyBRRyHPWF1TeAxVe9iebOkD3TVZobEfuz8fsCqFee3HAJARsaE16yu+Cki1WWUshab
 UcT/0IGqqw/91eiSNXnaBS+rGSZpR4XW9dWEOoS5RmEz+zf5APxLnINTiNFLscnssA2bTUw0
 xmCmNaBLSJotLqZWHeM7ICepDm5OTUWBWIabCpCRgwAi/HzrYd2gh/RQ9JLFK+uksazCTz22
 yqNriU1m/MUl8Fj/6y98Uqd22r0jpfMRw8xoA7QWwqN7B59ZYOjT5yl7x7c9/koBIGdQ1qat
 X4Igf+C/fsOBpGAki+KaOgVFbTv7PGAWBXHmkJmFZQl8zWr+lagcJpW7TU4I11mWvvoYhewP
 hWV41kIosYOYj36Nsebfr5dFewnipTaHOq6fMqPc4YfW6khSha22jNHMBv4M3/WrGAglqQ2O
 JG+eMmqDGoHBakP8AdaV9vxwpdwmXhgnTK7qYTTik39i+LHNSH9paItaQPWNogEALW4TBI5G
 jq1H/CBzAlDS6XAay3T/J97wbsifCVjW86eRyC6cIe+zuta9IMJV6G5LVAJIdUNc0FpegHgp
 S7VtqhwkguXuJE/AV/WAk2Pko/HU5dltm4cNicxJ1uu0HVLSd/xt/tHKcdtJeN7r7ALIRtIo
 x8tIJro7hNnEGWvxtjgRcOl8NwKmOqD1GpiwBZJkBBgJsU9FmQlC/fvfxf19TlmM8ZEnZBWn
 lFU7SuCGcBrb107VK7+Mavzp3vs7Sl1sL8jBCPgf4gMEHgABaA3ckTZlOEsGcgQJH3rn33Cv
 +pgKUxD/relTk5c2IShuJ1oWK/wS7EgQREAQzWChVt0XAGDlleeLUZ7eL/gVRjWVX/u+bXkY
 uNQzvrmN+YAkkoMuI15e4uHB4pnurMDfpdWkVZpGmvldVOuBu8yK3WKx5AX5KZM2qVYqU29X
 UfWootWPrCAOcXEFl8NJVV6MrTfhK9MwjSCv+4oJEja5TNs+ObVW0tlIBTR2jdWK6F4Md15z
 L556tIW8QG2ljEjLs2C0nJP722JI3FZC/cnu5gWDZXFkA0uzl0eM5XQBjWvuMOEaslWM1lsK
 TiR3fKQi7NZz0vEUnwyCXmSgrYN2cVQ4EhHlQZQKU6Il9zJgu4M8CdQqTlnHB5Iyhhn0v5oP
 jQ5PUNCOqjTrSxjg9JOXj7wFlgZVgGZ4EH413AAiHbdExuzTmXIIWAwZbSN8UQe/z4OdzRX5
 ujFmmPsUDKsd8DtxCoiH0VirqW7H9B28wTDnuGhHtiEQMZmMWa03Pf2aDpasQbjDOMwmFbD9
 Ltj8+tHYKHmMTId/v8gAI6A2LVMEB2JKQSumx26EH/lyY0ERAyP5A==
IronPort-HdrOrdr: A9a23:XqL/66prpDORU8F+9ynnUQAaV5vNL9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossREb+expOMG7MBXhHLpOkPQs1NaZLXPbUQ6TTb2KgrGSpgEIdxeOktK1kJ
 0QD5SWa+eAfGSS7/yKmDVQeuxIqLLsndHK9IWuv0uFDzsaEJ2Ihz0JdDpzeXcGPTWua6BJc6
 Z1saF81kWdkDksH46GL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 T4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmRsXue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqrneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpn1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY/hDc5tABCnhk3izytSKITGZAV3Iv7GeDlMhiWt6UkXoJgjpHFogPD2nR87heQAotd/lq
 P5259T5cNzp/ktHNVA7dc6MLiK41P2MGfx2UKpUBza/fI8SjnwQ6Ce2sRA2AjtQu1P8KcP
X-IronPort-AV: E=Sophos;i="5.85,371,1624334400"; 
   d="scan'208";a="55121596"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/qfGyglmEfZT2H/28720Iy6WnnDs5i59pZezPDGwlB7FV77chE8iK7FO6KP0TxbQ1brQIXoM8lhZ2+2dysF0Vics+1OLwRcePlYYtgJ5MTlq+mzPacrLhCE+eQ3Vq70m1FnS7njliXy20raCN7THgghTqCKA+WYYeaGYFjsfBk7wXxs0deVDrXE/QT+z+4gXofQXN6egYX5auUShK3zlM/A6K/OYMNCC2FZdSn46D7W0pAQ6vjqK5TiwCiKI4jM+HbL4sRIvZRlZFMPCDtRVkPMpSwgyx5IERNDC+/qeH/rKnhNcQMf+IHXkWH5yVnoiEEkC7kpWrV8nUbSjeJkLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znmL2VsZyswrFXo+HvBQ3H9BhIB3br/XyfI/1dG6drc=;
 b=iDNk6DIBinD8rjD0rnISProp39A6t/TzBKPe5YmlYSHMX7UxFSftdUJzjRh9Ns8MIgTk5Rqk9Q1PryAVMkHu1drsZ0tUMGdErxlZa0uWqoJk3W/5o0kxPZJXkLm6M8CD181cdGiiYlfSToEE8OMiEthajeozcckamdVhFW9hZ/ebzHdbWiR9Dsqj+D8NH0crfqS5iF/XNR0Xj2qgrVpTLlooIhLBV8QDOtdiJATx+oDLJafMLdZE4VD6Bqoq01ldTcPTfZVl3sZkiL+nFGYa10U5oWUBtG5bCT/0k0cP2RiWx84QoHafHtgpWcSoweAV5v3OToawLgQbS5LO5+SEBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znmL2VsZyswrFXo+HvBQ3H9BhIB3br/XyfI/1dG6drc=;
 b=xXZGgqbMJKffZ304P+biu0O/IlPFv6aOWqpflrHcRUqZkMW2UvQSFANuPeKArdwWLEWoDD0iQITUVbOkwhKwp+vmXqQFsDAQrpWCothjKUgBU6YLgnezqDlkOOe+7m/Y//qPo73wjc1VEI7BDu/bXSW0I83TBY1ssaxpRtMYfmE=
Date: Wed, 13 Oct 2021 15:51:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <Artem_Mygaiev@epam.com>, <jbeulich@suse.com>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v3 03/11] vpci/header: Move register assignments from
 init_bars
Message-ID: <YWbkZ216FbV8lBns@MacBook-Air-de-Roger.local>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-4-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210930075223.860329-4-andr2000@gmail.com>
X-ClientProxiedBy: LNXP123CA0014.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c34bf8a-b6eb-48d2-8719-08d98e509509
X-MS-TrafficTypeDiagnostic: DM6PR03MB4476:
X-Microsoft-Antispam-PRVS: <DM6PR03MB44763D5AC8E8DDE88678AA658FB79@DM6PR03MB4476.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l2z/6x9IUhkz7qzNQ8nxhcOmWZcvlFVZ+dDBf6ljDzgFKf2uqS0Lz4UMk+APvoyGeaG0YGeZ1YrZKdgt7pmZ30WPv89QYnIJRzqpo9Np2DF0wDEFC8teBx3H36rdZAd62y44QsKS5hGcr/zpIUOCpcM6Sx3UCadl8nyi8EW3Y1IZuWTL6WQ+xNqLHXbvDzE462tEPLoKqOFuke3Zowc5znOARAhO8wcvAqtd6/aAyKSmVHp6NX03msm7TO/T3GCGP0mO2EHr/vWqD4QCzdxOg3R2OPHVQon0Mhg8DyQtcnD9qeerm3UDRmeoyaD5AsXINnFCgQaQhrY2C0c4nTKwaLXWPANmPvZT7lORcCRbW70tH97oo/dcdkoTJfdrkRyJXYrvP/ukh0BePyxLyLQSGgsw1pe8crfXH4YF64xV78wx7+D5ROOYdVZ1r1PUhqN9zGGKfidyFF9ZSxwdV1LhfQoewzcUeOz7f3xtceHzUEqu+yiqulg2H4nCSVA8CHbSahlHorhlqDowVbrn+MJvujaMcpt5d0H6Hu2Dknkf66x5XdfcfoRqkCoczsGOPkK3PDJTO+q/aupdK7x3LGIXlDt9ym/eDRfJlcsB9xGHap9aLcHmESA65PgLiXowJNniwRQfU6a0mIRst3TaTbIdVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(82960400001)(186003)(7416002)(8676002)(5660300002)(4326008)(6486002)(26005)(8936002)(9686003)(83380400001)(956004)(85182001)(6916009)(66946007)(66556008)(86362001)(508600001)(66476007)(6496006)(2906002)(316002)(6666004)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cG1VSEx3WWNZbzBTcTBLcGUwNGxHeGxOSG94WDhhTnFtWlVZUDh2eEJvSnNU?=
 =?utf-8?B?bXNCaXNQRmQvaGFOQzFFSStUWWNkZEZWV1ljcitzVTVuTlpsUW5hVmRtTS8r?=
 =?utf-8?B?WGFqblBWMHVFenFnZk4wNExzT01CN2dyaTVKanRaSkVING1uLzFzUk8vVWVr?=
 =?utf-8?B?UXNtMStRU0hYQjZlSHI1dW5GTXd0OW5VaWRjNHpvWndMWlQyUVZjcFFFTmFn?=
 =?utf-8?B?d2g2VnJlV2hRbW5oWG8wa1hhQVNJenFKSnhFem5wRitLNnJrckJWd2pvUDNN?=
 =?utf-8?B?ZmpEN0JYRzNSdnNzSXRrUWVCQmV0R2VHK2NWYnUrWVB0amVrYVJkUUZqOUJ6?=
 =?utf-8?B?WVI2OWNzbUlPWGNaTm5HWFRSR1ZjY3hCckJtOVBjWWNpQlZTMHIxWGVrbHhR?=
 =?utf-8?B?L2d4TGs5aG9sdy9TYURJNHc5QVM5c0h5R2hHY3ErOXEvbmEyNG5lYSsybFN4?=
 =?utf-8?B?UHNiaGNpNXpKK09rUWpJb3poZVlyRjZ2VDA4K29rS0hhTnBYTlN2eEd4VWFM?=
 =?utf-8?B?Tmp3OHhHRW1kdHZPMitBRFZFUGE3YlpML05lQk42TGVRUGx1K09Ea2YvNGlm?=
 =?utf-8?B?azVUdGl1MndGcUcvemFQTWhON25hWUtYWHVESkl2UERyc0h5c3ltZG9NM1RJ?=
 =?utf-8?B?MlV2Z2IwTnU5RmZobmtSNXVVWnhZTjNDUTJFa0Y5aXA2RmhDdTd6bGdoNHRw?=
 =?utf-8?B?dlVWZi8zeGt6UWN0dE1WOU1HOHQ5azgzVHVhRGZPWVFsNVhvcnVGMUFMcW5M?=
 =?utf-8?B?MVRRY1RmakNETUpWdjJjY3IrU0lqSk9PM2xGQ2JpL3JWY0JkaVEyNWQ1R2xX?=
 =?utf-8?B?aEFxUjArdlpaTGpaclR5TzNGMXlsMU1YUlp4SFJUR2kxVjBTTXFJMDJGdFZi?=
 =?utf-8?B?bkVZaUpveE54RWt1T0tHbHhEQ3ZXOVZ3YVdiMEtKN1lJaS93YXI2WWlxbkVV?=
 =?utf-8?B?L1pxMWM5Q0hvUEREeXI0aFg4MFpXTUg5bEhaU3g0SUtCRVVXbGxjWHFWaFN2?=
 =?utf-8?B?VHdJWUJIUUhTa1Byc2xsQlpFVGUrdUZHNG5oMGFvYnl5ekJiQzBpYWpRSTUw?=
 =?utf-8?B?VVFKYUxReTBINTdhMnZ5SXIySGxKcTVWcXo3WXZoeEVzYXJub2loWXZCYlJz?=
 =?utf-8?B?aVVMN3VVMTBFMXlnOVQ2Z3dValVLckhJUyt4SG5IbVBlVU1GTldrTE1aUDJs?=
 =?utf-8?B?WlF1NUtFckRvMWp2NnlER3lrNmU1TTlNaTYyaXFnWVVpVFBxdlhSRE1aTHJE?=
 =?utf-8?B?Z2F6K3BpcG0yUExJYmpWVXBwSXRTMFdyOFo1TTgxWDYzS05NWmliU00yNDdk?=
 =?utf-8?B?UmFtcG1uay9JZjJUbzdKZGhiWkVzeG9ndUd6VFVQSDZ5WTZmNGZxYU43VCsy?=
 =?utf-8?B?YUo0cG8rTk1aMk5yNExNTlBhMzFhV0JrZmlqcHRpZzZ2eElpallvMXBXS0NT?=
 =?utf-8?B?bTNYclMvREF0endyMXJRa2dyeXBZVkhITmQ2djd4V2Y0S1VYekt6aFFVQWRW?=
 =?utf-8?B?WDBZT04xSHlrNmxzOXpWZjNubFYvc2gxeTByakxuWGdQaStMeGpUeHlzOFlS?=
 =?utf-8?B?ZzBPT21rT1g0QWtoelA0SHBCOGdxVC9ITnIvQ3dENytiSkozUFRSVFZGRnhj?=
 =?utf-8?B?OGpkcDJVWVVRbm90U20xNUNJaXhTcUVjZ093MGF3QTRtcUVGM0I0STZxYWUr?=
 =?utf-8?B?RmpSQWRROEVMOTROT1laZzVzajZSSHMyeUpvaWxUUS9CSElZQ1RkaWlpTnlD?=
 =?utf-8?Q?9sLZBaDMfWIfr2vO/V54Q69rI1zGHv2mVvvpmGs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c34bf8a-b6eb-48d2-8719-08d98e509509
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 13:51:39.9648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fwuhb0HR7XSZS14h9N5pzTP8x4IRRI6YxE0IznmoJrWQCnOaN9w//ONBB2skV3XgUR82wgkNUirRplRrlutcjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4476
X-OriginatorOrg: citrix.com

On Thu, Sep 30, 2021 at 10:52:15AM +0300, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> This is in preparation for dynamic assignment of the vPCI register
> handlers depending on the domain: hwdom or guest.
> The need for this step is that it is easier to have all related functionality
> put at one place. When the subsequent patches add decisions on which
> handlers to install, e.g. hwdom or guest handlers, then this is easily
> achievable.

Won't it be possible to select the handlers to install in init_bars
itself?

Splitting it like that means you need to iterate over the numbers of
BARs twice (one in add_bar_handlers and one in init_bars), which makes
it more likely to introduce errors or divergences.

Decoupling the filling of vpci_bar data with setting the handlers
seems slightly confusing.

> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> ---
> Since v1:
>  - constify struct pci_dev where possible
>  - extend patch description
> ---
>  xen/drivers/vpci/header.c | 83 ++++++++++++++++++++++++++-------------
>  1 file changed, 56 insertions(+), 27 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index f8cd55e7c024..3d571356397a 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -445,6 +445,55 @@ static void rom_write(const struct pci_dev *pdev, unsigned int reg,
>          rom->addr = val & PCI_ROM_ADDRESS_MASK;
>  }
>  
> +static int add_bar_handlers(const struct pci_dev *pdev)

Making this const is again misleading IMO, as you end up modifying
fields inside the pdev, you get away with it because vpci data is
stored in a pointer.

> +{
> +    unsigned int i;
> +    struct vpci_header *header = &pdev->vpci->header;
> +    struct vpci_bar *bars = header->bars;
> +    int rc;
> +
> +    /* Setup a handler for the command register. */
> +    rc = vpci_add_register(pdev->vpci, vpci_hw_read16, cmd_write, PCI_COMMAND,
> +                           2, header);
> +    if ( rc )
> +        return rc;
> +
> +    if ( pdev->ignore_bars )
> +        return 0;

You can join both ifs above:

if ( rc || pdev->ignore_bars )
    return rc;

> +
> +    for ( i = 0; i < PCI_HEADER_NORMAL_NR_BARS + 1; i++ )

init_bars deals with both TYPE_NORMAL and TYPE_BRIDGE classes, yet you
seem to unconditionally assume PCI_HEADER_NORMAL_NR_BARS here (even
when below you take into account the different ROM BAR position).

> +    {
> +        if ( (bars[i].type == VPCI_BAR_IO) || (bars[i].type == VPCI_BAR_EMPTY) )
> +            continue;
> +
> +        if ( bars[i].type == VPCI_BAR_ROM )
> +        {
> +            unsigned int rom_reg;
> +            uint8_t header_type = pci_conf_read8(pdev->sbdf,
> +                                                 PCI_HEADER_TYPE) & 0x7f;

Missing newline, and unsigned int preferably for header_type.

> +            if ( header_type == PCI_HEADER_TYPE_NORMAL )
> +                rom_reg = PCI_ROM_ADDRESS;
> +            else
> +                rom_reg = PCI_ROM_ADDRESS1;
> +            rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rom_write,
> +                                   rom_reg, 4, &bars[i]);
> +            if ( rc )
> +                return rc;
> +        }
> +        else
> +        {
> +            uint8_t reg = PCI_BASE_ADDRESS_0 + i * 4;

unsigned int please, we try to avoid using explicitly sized types
unless strictly necessary (ie: when dealing with hardware values for
example).

> +
> +            /* This is either VPCI_BAR_MEM32 or VPCI_BAR_MEM64_{LO|HI}. */
> +            rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg,
> +                                   4, &bars[i]);
> +            if ( rc )
> +                return rc;
> +        }
> +    }
> +    return 0;
> +}
> +
>  static int init_bars(struct pci_dev *pdev)
>  {
>      uint16_t cmd;
> @@ -470,14 +519,8 @@ static int init_bars(struct pci_dev *pdev)
>          return -EOPNOTSUPP;
>      }
>  
> -    /* Setup a handler for the command register. */
> -    rc = vpci_add_register(pdev->vpci, vpci_hw_read16, cmd_write, PCI_COMMAND,
> -                           2, header);
> -    if ( rc )
> -        return rc;

I don't think you need to move the handler for the command register
inside add_bar_handlers: for once it makes the function name not
reflect what it actually does (as it then deals with both BARs and the
command register), and it would also prevent you from having to call
add_bar_handlers in if ignore_bars is set.

Thanks, Roger.

