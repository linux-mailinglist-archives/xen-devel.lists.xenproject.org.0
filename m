Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B9F36843B
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 17:54:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115691.220788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZbei-0006Kn-RA; Thu, 22 Apr 2021 15:54:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115691.220788; Thu, 22 Apr 2021 15:54:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZbei-0006KQ-Na; Thu, 22 Apr 2021 15:54:16 +0000
Received: by outflank-mailman (input) for mailman id 115691;
 Thu, 22 Apr 2021 15:54:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=96sM=JT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZbeh-0006KL-Nn
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 15:54:15 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a76f54f0-f004-4a9c-9360-0ea36076da0a;
 Thu, 22 Apr 2021 15:54:14 +0000 (UTC)
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
X-Inumbo-ID: a76f54f0-f004-4a9c-9360-0ea36076da0a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619106854;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=sogHPNfO5rwY4l+oGuFPxj7C0tlmCI0eXYbyYohpueQ=;
  b=QXxaynBvlG7Ld2s7OHiULV9WL66S0m20Os3eOW+nLHPT0z3vhDT2J0qT
   zURFMF4UcCPPRPzJyfmYUPtjCjZgJcGnZvZnbtETQH4MoSBPXEq5a7EXR
   LchzBwNfG5qYYKyNXdxDuMC83k8EijWS9TwYNyWZzD7cP7nNgae8Vplqd
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: dx5rzOVbQp0e8dKhJT14ArpqKO0xFCilmTG9aGxQXJwR89yhYk7bowa6KHM3GVGDgQb1Ux65dn
 Y6S6EKr1dfEQVWNqztd6ZBZE21qHFFvSAMvfrjFQvR8k8koj14TB7mnDfjilExb4/MYInn8IpW
 bEmNB59RKmVHbbUExETLoMu8ElAXytfA0XWvOV0AdVoHF2ODxOEnIHInUXJewqwjUIam3R1t57
 ajnfw2Nl68dE0FTLtGkj7vR7vHoYIwhdXHlWQTkQtkdoIo49f2Xi+W8+4wbFPsl5jFU0DgI+ST
 +Wg=
X-SBRS: 5.2
X-MesageID: 42197479
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Td/qiKy7EGPaSPHYMlCHKrPxp+4kLtp033Aq2lEZdDV8Sebdv9
 yynfgdyB//gCsQXnZlotybJKycWxrnm6JdybI6eZOvRhPvtmftFoFt6oP+3ybtcheQysd07o
 0lSaR3DbTLYWRSpdrm4QW+DtYryMSG9qftvuvF03JxV2hRC51IxS0RMHf+LmRdQg5aCZ0lUL
 +V4cRarzStEE5nEPiTLH8DQuTFupn3j5rgexELHFoK7wOJgDOu5tfBYmel9z0ZVC5CxqpnzH
 jdn2XCl9memtyY6juZ7W/c6JxKhMDso+EjOOWggtUYQw+c8TqAS59mX9S5zVYIicGprG0nid
 zd5yonVv4Dlk/5WkGQjV/T1xL70DAogkWSu2OwpXf4u8T2SHYbJqN69PpkWyDU4UYho91wuZ
 gjtwny2us1fHGw6BjV3NTGWwpnkUC5uxMZ4IkupkdSTJcEb/tppZEflXklY6soJj7w64wsDY
 BVfbjhzctRGGnqCkzxgnNi25iFUHg1A369MzI/k/3Q+T1XkHdl9lAf1cwSk1wRnahNO6Vs1q
 DqNL9lm6pJSdJTRaVhBP0ZSc/yMWDVRwnQWVjibmjPJeUiATbgupT36LI66KWDf4EJ9oI7nN
 DkXElDvWA/VkryAaS1rdN22yGIZF/4cSXmy8lY6ZQ8kKb7XqDXPSqKT01ru9e8ot0Ea/erGM
 qbCdZzObvOPGHuEYFG00nVQJ9JM0QTV8UTp5ISR0+OmMTWMYfn39arMMr7Ff7IK3IJS2n/Cn
 wMUHzYP8Nb9H2mXXf+nVz/QHXoVkvj/Y9hMaTT8uQJobJ9c7Fkg0wwsxCU98uLITpNvugdZ0
 1lOo7qlau9uC2X8A/zniFUEysYKnwQzKTrUntMqwNPGVjza6w/t9KWfn0X+HOGIxR4Xv7HCQ
 I3nSUxxYuHa7irgQwyAdOuNWyXy1EJomiRcpsakqqfoeDoZ40/FZRjfKBqDw3EG1hUlG9R2S
 Z+QT5BYnWaOiLliK2jgpBRLvrYbcNAjACiJtMRj2neu0WarcQGXWAaQDaqbM6SjW8VNnhpr2
 w015VarKuLmD6pJ2d6qv8/KkdwZGOeB68DMB6If7xOmrfgeBh5SECDgTDysWB0RkPas2Epwk
 DxJyydfv/GRn5QoGpR3KrR/FRoTWmFZE5rZndmsYpyKHTeth9IoJq2T5v291HURkoJw+kbPj
 2AWzcULw907/2c1RKeml+5ZD8b76RrGtaYIKUocrnV1H/oFZaBkrseGeRIuLx/Msr1j+MNWe
 WDWgOcIT/iEdk10wiNqntNAlgslFAU1dfTnDvr42iz0CRhXb78IFF6S6oaJN/ZxW7+XPqM2I
 h4i9VwnebYCBSGVve2jYXsKxhEIVfvhETzaccCg5Vdp7gzu7t+BIOza0qC6Fh3mDEFaP7pn0
 YfSplh6L/POoVTb9UfEhgpiWYBpZCqFg8XqQT4De81QEE1g1LaN92P5aDUqbBHODzJmCLAfX
 2e+TZa5fHLQm+q0qMbEbs5JQ1tGQUBwUUn2OOJbIvLDgq2M8lF4VqhK3e4NJtQUrKMF7lVjh
 F05biz7qOqXhu9/ADbpj1gJK1St06hXMOpGQqJXddyzObSAyXFvoKapOipjDn2TjOna0MXwa
 19HHZgH/hru30Fl4040i+7V6rthFkq+mEuuQ1aqg==
X-IronPort-AV: E=Sophos;i="5.82,242,1613451600"; 
   d="scan'208";a="42197479"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQt1Q6EgpH7eVmPZEzVbLI16dtqN5iVo8qFqUygwBKhuPkS0imUDq+5KYvgDl3+wv/q3WD1cvDlyvJoI/R4VvMCJjJ0EBN2uLYuR8OOVbDpSz/0tU58RMqSv5pXq/aFnqIYNG2hIUssJPfYAcEw2NzcRvkOBPc3RDveTqZMFdinyKvmZojOj8Zn7WSGOtR7F9hdzDt08Y7LtjO3zuaERzDVbM7ITLZFn9mMNetxW+hVq24wqEvi5/92QCkMXbEuTw5/9S3IVxPWLQ6vMD4jGmxsOuoQ2PsrfCdl2AUZ4UE5Rp28Uv+8uXcknDzWjEvKhp1o8RDtD0Bce2AERQXZkjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFk+Sehe0HA3BISWSwKE02bFaKvvBPZobt+rvXku52c=;
 b=go/aYicpsqWF4TflM5/c07TzKFs1SADbUj0ux03lPsJl4SGbF/TXbsbbdI+mNL3qO8VW5M18QTJ2B1wy4ml7bCNq8OsGS1WJQ6f9KFxmAkz9oZll1dKEOyIbb+Qb/oiF8ZTvq5IpZsq29yxKP3eZAGYpZz0iWCXLpp34hSNGb36bqwyZpNMw7hXbNIyiixGquTS9Gko993S7EqeSZGakGcI0o03yj2RC+ILfImQOv/6yEa5g9LNEDyD8L4wFp79I1kXyCUeB5ZhMFSZYTykuqoSPMsxBJmK7vxefGalOtZ+TDqLPCw28RqJyXGpAIaBC4/xohdnNafXSPc5nRavR3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFk+Sehe0HA3BISWSwKE02bFaKvvBPZobt+rvXku52c=;
 b=HH3tZwTWT1zgQOLCp5n/3ZYl3f+igi+6mF/D3HKF4rabuaAGkfCZn/KOTbV+e22siWs0F8Sf1SNAM/bm+jBcIYsAnyRVI2eYsf/mSPgRCqJM4OOd6h09Ev0eAhSIf0X8Fp2mHDPOi2X4HnCXZWfyO9FPylkBUfmNO7EERoCZb4w=
Date: Thu, 22 Apr 2021 17:53:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 7/8] x86/EFI: keep debug info in xen.efi
Message-ID: <YIGcE5Cr+xK4K6gw@Air-de-Roger>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
 <96cb4039-5f43-8eac-d855-c9f1587ed2d0@suse.com>
 <YIAJP0SCq0nOKZVL@Air-de-Roger>
 <6023c1d3-4f50-d207-1ea1-30dd1d5f68d2@suse.com>
 <YIBFD4i6bLaeaXdE@Air-de-Roger>
 <3cda296d-e88e-5fe0-4924-4cf974c4f909@suse.com>
 <YIEwW3HQuTtgWH5M@Air-de-Roger>
 <a00cfe95-06bd-4999-05ab-cae737ab6f4c@suse.com>
 <YIGOrOL+pKGaHqwX@Air-de-Roger>
 <8fabc56b-8e2d-96cd-e9b2-81bf38777d52@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8fabc56b-8e2d-96cd-e9b2-81bf38777d52@suse.com>
X-ClientProxiedBy: MR2P264CA0054.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e55b813-0d59-4c94-f0d7-08d905a6ddce
X-MS-TrafficTypeDiagnostic: DM8PR03MB6232:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM8PR03MB6232E1792C631DCB2F7DC0378F469@DM8PR03MB6232.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: idti7izNrP+nu7albzg2C2hX3BqIciXtkTaTntdrde989Bpd5gNyTa1hlpzqx92nnSskP+9ycCWv7L2/zHw/IXb3ASXtdtzOKfynigdzCxUja2fGh4tvjARJHNy0pm/KebqD6jZr4JEl5VTYzxc0OkcdCpxomYlaiVuUv/rY2rYWS5BPq27FxH/d4HnB2+XtkovNVKCK7bro5ihhSDlvBMTBY2i+HSS5yaWTqcfr89I8hMH0l33qSlZS74biWWdhLFfDqr6k7EtITJFU7fyVwja3XfoQjuOtuKR4f1lmlWd+FdI/v1nYnQjUeSFDf9KTh1cZdToOhwXWEBvEm3CMWhEeCzV6FUflR2KLNvzHVDTYA9oSilBUVMWHThkIfQF/eoFEpy5JtarrK+EnMN+dO7ZRlsXfwi83bxFp26SWKxDuf/RTcCXXxpKAlx0xEuVsVB+SVLOTt/IRRek5xay3UxDQjWPUfOHja//+/tWYd+iGvdVOGtQEkhMrwqxyLIHLumky+Snn52TDsMRTuqZ6ATTiWkygkKRan4xZLG/IAS7TjMH3MoPTY91MZJW5UDOF0W10X+9IkXyAjz+PHmKy8Og7FRuEZKf8UiXZhUcaKO5VoH6BMGJR1d7ZgN0sU6ZwwbnUKdB+ska/jd3jTc6jQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(186003)(54906003)(26005)(478600001)(53546011)(8676002)(6486002)(4326008)(6496006)(316002)(6916009)(956004)(6666004)(5660300002)(16526019)(86362001)(83380400001)(2906002)(38100700002)(85182001)(9686003)(66476007)(66946007)(66556008)(33716001)(8936002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q0F2MDNqRXh2QVlRQUZIbjNLZWhFbDNwZXo2NDdOaEZUNWw4QVpWa2FoN2xM?=
 =?utf-8?B?THJiVjg0NGpPNkl3cmlyemJqejFnZG9mZkhoOU9tWDFEOVhjaC96ckdTRFNk?=
 =?utf-8?B?dkpBVk9hZFRhM0M2NmZtZ01ScjRrM2hUV0JaYXBHbzJydlpkSFNnZDg2Mll6?=
 =?utf-8?B?T01QNUdoU1JGb2dDOHZWSktxSUlFWmNjam5GcGQxZGJWdkc1Y2IrZUxQSXo3?=
 =?utf-8?B?SlNTaldRWERWOVpSaElTUS8rVU0vbElJckhkdDg0Wlg2K0ZjV1g5cDVKRFFl?=
 =?utf-8?B?bGpkaUxKNDl6K25kcklad0YwaE1qWW12ZVZIUXpRbmhQNUxGamtTNHM4V3Z0?=
 =?utf-8?B?OWd6SjZCYXVreUZXODFvU1pmTStzSFlaTHYvdzhVMHB0ZmtFTjVPZUhRR3lm?=
 =?utf-8?B?WkxJNlVlSzFnRkh1MmZ6akFpM0hQRndub1NDRFB4aDVqbmNLQkVRMmNXSHh5?=
 =?utf-8?B?NGhZREpkeFRKZ3B6YjBidW95WnFkTDFQV3hXVCsySkJ2QWd4SHp6bVd2eEp1?=
 =?utf-8?B?czBYcyt6V3daRE1PTVphZkNXbURCaExTU0oxSVpmcW9wMkFrbVFZNi9meTc2?=
 =?utf-8?B?YUh3ZGtrNzh1dG9ZWmhzNWF1OXUyV2IzUGlhb1h0UEdEYmFNUlFZSFFLQ3Br?=
 =?utf-8?B?UTMvQW52Zm1ZNjNlazIwb0htL0hWQUhYeFZ5b1NPZWJwOFNlSGVOa1pGalk0?=
 =?utf-8?B?RVVhTmpXeSt3bFh6Zk5HcFpLeE93UlloT0tlQ2QwcCtKNU1wd2ppOURrZEJ0?=
 =?utf-8?B?azRnMWU4QjZPbkh2eVNtSkkzclFadTV5ZVB5aWU0eVphTnp5U0RTMld4OFMv?=
 =?utf-8?B?R1o1R2NxRmp1enZET2VkUklMSS9wUUlBSnNHSkxUSi9SSEZIT3VORWhlcmlq?=
 =?utf-8?B?TnpiUzRKd3J0dytlbmNldktRMkRyMUo5bWRLcWdQSGZBbG5ON25sYXpqQ2JF?=
 =?utf-8?B?Q2J3eFdnSFFvWENKbFk5NTFUK2E3bncxN0lzbXllQlVZYXBqdi94UStXYzBH?=
 =?utf-8?B?VnBuZFpXQzYxT0pMeUloSGs4UzA5ZnUrSVhkQkJMTmFSNVBzRVpNOTM0a3hT?=
 =?utf-8?B?Qm5rbzhoRThYbCtjWXdZbkJPRVY2Z2dzSktMRVBkZEZFdThkbFhJZDJsZld5?=
 =?utf-8?B?MnFnYjZZdU9QRWJHOXE1MEFtcjUvOEFNeWxidGJha0RYVVdaMnJLWGdaQU5X?=
 =?utf-8?B?RW94bGZZMVNHQ1pyZGI2QnMvSUt3UU5OalV3ZU5KbVJnMzFyMkRlb3FLZTRt?=
 =?utf-8?B?Ni9WcVRSL3kyWlFiYWtvZEliVm1ZbG1hUVNBMTQ3blBPVXpBQytxUkdQbHBG?=
 =?utf-8?B?WkcxN1NKN1pyRXBhOVVQTkJqbjYrczl3NlVoYkxRV3ROU1Naa0JKVmowVDZl?=
 =?utf-8?B?dTE1OUUycXBHRDF1WTlKSUFWTnFSaDF5VDUwelozbGtaU1BNTHBFRGdxUjBa?=
 =?utf-8?B?cjNwbHFSVHM3RmJDUVh3UWtXUTB2VmJNaTFUdktCRXp1UnJBd21KdEZBOENV?=
 =?utf-8?B?OG92NHZRTUViS1o5aldESmt2MjF4b1QrdVU5SWVneGZpU0tGZVZ1b2RUSUN5?=
 =?utf-8?B?eGJaNkxsbjcxZ0Jqb0RlYjJkNjRxU0EzMWxmdG9Hc2ZhbTgyWG5VUVBqV2xQ?=
 =?utf-8?B?Z05nRGlOWDE3TGZuMTJIZFg0ckpUaVVobXZkQUZYUHI2YTBHa0FzR1g1aWxJ?=
 =?utf-8?B?UkI4T3pBblluM1FJMTlselQ4VFE4TVpIbFlCa29QVS9uMzhHWk9jMGhudy9J?=
 =?utf-8?Q?PxjMuV6gF8Zxobig0vT48QOgcMJ8ndrnaTPHfBk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e55b813-0d59-4c94-f0d7-08d905a6ddce
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 15:54:09.5355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FcYYiUgnTyCMokJgtL/lbKBjwI3rh+BinrsngpqF2FqT4QTT5Qfo4RtSNiPm407ZNKlEd8Rlaml17O1tGLlgFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6232
X-OriginatorOrg: citrix.com

On Thu, Apr 22, 2021 at 05:46:28PM +0200, Jan Beulich wrote:
> On 22.04.2021 16:56, Roger Pau Monné wrote:
> > On Thu, Apr 22, 2021 at 01:03:13PM +0200, Jan Beulich wrote:
> >> On 22.04.2021 10:14, Roger Pau Monné wrote:
> >>> On Wed, Apr 21, 2021 at 05:38:42PM +0200, Jan Beulich wrote:
> >>>> On 21.04.2021 17:30, Roger Pau Monné wrote:
> >>>>> On Wed, Apr 21, 2021 at 03:06:36PM +0200, Jan Beulich wrote:
> >>>>>> On 21.04.2021 13:15, Roger Pau Monné wrote:
> >>>>>>> On Thu, Apr 01, 2021 at 11:47:03AM +0200, Jan Beulich wrote:
> >>>>>>>> --- a/xen/arch/x86/xen.lds.S
> >>>>>>>> +++ b/xen/arch/x86/xen.lds.S
> >>>>>>>> @@ -312,10 +312,60 @@ SECTIONS
> >>>>>>>>      *(.reloc)
> >>>>>>>>      __base_relocs_end = .;
> >>>>>>>>    }
> >>>>>>>> -  /* Trick the linker into setting the image size to exactly 16Mb. */
> >>>>>>>> -  . = ALIGN(__section_alignment__);
> >>>>>>>> -  DECL_SECTION(.pad) {
> >>>>>>>> -    . = ALIGN(MB(16));
> >>>>>>>> +  .debug_abbrev ALIGN(1) (NOLOAD) : {
> >>>>>>>> +     *(.debug_abbrev)
> >>>>>>>> +  }
> >>>>>>>> +  .debug_info ALIGN(1) (NOLOAD) : {
> >>>>>>>> +    *(.debug_info)
> >>>>>>>> +    *(.gnu.linkonce.wi.*)
> >>>>>>>> +  }
> >>>>>>>> +  .debug_types ALIGN(1) (NOLOAD) : {
> >>>>>>>> +    *(.debug_types)
> >>>>>>>> +  }
> >>>>>>>> +  .debug_str ALIGN(1) (NOLOAD) : {
> >>>>>>>> +    *(.debug_str)
> >>>>>>>> +  }
> >>>>>>>> +  .debug_line ALIGN(1) (NOLOAD) : {
> >>>>>>>> +    *(.debug_line)
> >>>>>>>> +    *(.debug_line.*)
> >>>>>>>> +  }
> >>>>>>>> +  .debug_line_str ALIGN(1) (NOLOAD) : {
> >>>>>>>> +    *(.debug_line_str)
> >>>>>>>> +  }
> >>>>>>>> +  .debug_names ALIGN(4) (NOLOAD) : {
> >>>>>>>> +    *(.debug_names)
> >>>>>>>> +  }
> >>>>>>>> +  .debug_frame ALIGN(4) (NOLOAD) : {
> >>>>>>>> +    *(.debug_frame)
> >>>>>>>> +  }
> >>>>>>>> +  .debug_loc ALIGN(1) (NOLOAD) : {
> >>>>>>>> +    *(.debug_loc)
> >>>>>>>> +  }
> >>>>>>>> +  .debug_loclists ALIGN(4) (NOLOAD) : {
> >>>>>>>> +    *(.debug_loclists)
> >>>>>>>> +  }
> >>>>>>>> +  .debug_ranges ALIGN(8) (NOLOAD) : {
> >>>>>>>> +    *(.debug_ranges)
> >>>>>>>> +  }
> >>>>>>>> +  .debug_rnglists ALIGN(4) (NOLOAD) : {
> >>>>>>>> +    *(.debug_rnglists)
> >>>>>>>> +  }
> >>>>>>>> +  .debug_addr ALIGN(8) (NOLOAD) : {
> >>>>>>>> +    *(.debug_addr)
> >>>>>>>> +  }
> >>>>>>>> +  .debug_aranges ALIGN(1) (NOLOAD) : {
> >>>>>>>> +    *(.debug_aranges)
> >>>>>>>> +  }
> >>>>>>>> +  .debug_pubnames ALIGN(1) (NOLOAD) : {
> >>>>>>>> +    *(.debug_pubnames)
> >>>>>>>> +  }
> >>>>>>>> +  .debug_pubtypes ALIGN(1) (NOLOAD) : {
> >>>>>>>> +    *(.debug_pubtypes)
> >>>>>>>> +  }
> >>>>>>>> +  /* Trick the linker into setting the image size to no less than 16Mb. */
> >>>>>>>> +  __image_end__ = .;
> >>>>>>>> +  .pad ALIGN(__section_alignment__) : {
> >>>>>>>> +    . = __image_end__ < __image_base__ + MB(16) ? ALIGN(MB(16)) : .;
> >>>>>>>
> >>>>>>> I think this is inside an ifdef EFI region, since this is DWARF info
> >>>>>>> couldn't it also be present when building with EFI disabled?
> >>>>>>
> >>>>>> Of course (and it's not just "could" but "will"), yet the linker will
> >>>>>> do fine (and perhaps even better) without when building ELF. Also
> >>>>>> note that we'll be responsible for keeping the list of sections up-to-
> >>>>>> date. The linker will recognize Dwarf sections by looking for a
> >>>>>> .debug_ prefix. We can't use such here (or at least I'm not aware of
> >>>>>> a suitable mechanism); .debug_* would mean munging together all the
> >>>>>> different kinds of Dwarf sections. Hence by limiting the explicit
> >>>>>> enumeration to PE, I'm trying to avoid anomalies in ELF down the road.
> >>>>>
> >>>>> Right, so we will have to keep this list of debug_ sections updated
> >>>>> manually if/when more of those appear as part of DWARF updates?
> >>>>
> >>>> Yes.
> >>>>
> >>>>> Do we have a way to get some kind of warning or error when a new
> >>>>> section not explicitly handled here appears?
> >>>>
> >>>> ld 2.37 will start warning about such sections, as they'd land at
> >>>> VA 0 and hence below image base.
> >>>
> >>> That seems like a bug in ld?
> >>>
> >>> The '--image-base' option description mentions: "This is the lowest
> >>> memory location that will be used when your program or dll is
> >>> loaded.", so I would expect that if the option is used the default VA
> >>> should be >= image-base, or else the description of the option is not
> >>> consistent, as ld will still place sections at addresses below
> >>> image-base.
> >>
> >> ld's "general" logic is pretty ELF-centric. Hence debugging sections
> >> get placed at VA 0 by default, not matter what the (PE-specific)
> >> --image-base says. Whether that's a bug though I'm not sure: There
> >> are no really good alternatives that could be used by default. Doing
> >> what we do here (and what e.g. Cygwin does) via linker script may not
> >> be appropriate in the common case. In particular it is not generally
> >> correct for debug info to be part of what gets loaded into memory.
> > 
> > So with this change here you placate the warnings from newer ld about
> > having a VA < image base,
> 
> It's not just about silencing the warnings. The resulting image is
> unusable when the sections don't get placed at a suitable VA.

And this wasn't an issue before because the linker won't even attempt
to place DWARF sections into a PE output.

> > but the end result is that now the debug
> > sections will also get loaded when booted from the EFI loader?
> > (because the NOLOAD doesn't have any effect with PE)
> 
> Yes. I currently see no other way to retain debug info in xen.efi.
> But to be clear, the memory debug info occupies isn't lost - we
> still free space from _end (or alike) onwards. .reloc, for example,
> also lives there. And I was wondering whether we shouldn't keep
> .comment this way as well.

Yes, I already realized all this is past _end.

I wonder however if the use of (NOLOAD) makes all this more confusing,
such sections should only be present on the linker script used for the
PE output, and then the (NOLOAD) doesn't make sense there?

If so, I think the (NOLOAD) directive should be dropped, and a comment
noting that the debug sections need to be manually added to the PE
output in order to avoid them being placed at VA 0 would be helpful
IMO, likely also mentioning that they would be loaded but discarded
afterwards by Xen because they are all past _end.

Thanks, Roger.

