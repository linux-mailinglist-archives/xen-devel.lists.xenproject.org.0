Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3843260B171
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 18:25:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429261.680181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on0Fc-0002lJ-J9; Mon, 24 Oct 2022 16:24:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429261.680181; Mon, 24 Oct 2022 16:24:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on0Fc-0002jO-F8; Mon, 24 Oct 2022 16:24:32 +0000
Received: by outflank-mailman (input) for mailman id 429261;
 Mon, 24 Oct 2022 16:24:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kmwR=2Z=citrix.com=prvs=289ef416b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1on0Fa-0002jI-VP
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 16:24:31 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 543aa7f6-53b8-11ed-91b5-6bf2151ebd3b;
 Mon, 24 Oct 2022 18:24:28 +0200 (CEST)
Received: from mail-mw2nam12lp2047.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Oct 2022 12:24:26 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB6358.namprd03.prod.outlook.com (2603:10b6:a03:390::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.27; Mon, 24 Oct
 2022 16:24:23 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5746.028; Mon, 24 Oct 2022
 16:24:22 +0000
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
X-Inumbo-ID: 543aa7f6-53b8-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666628669;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=l5fo4k8VEPzwarmaqxdMubm97VniYkAyd3tFpyG7L+I=;
  b=NoW2MZbBetZFsM8l+GZaA5q2etTHZyTL9e9tJeqGxP9DIpyHxAj+VCHH
   Suup+AupCI3O8r0e0T/dGQlqGwRgGmt7B2l0K8+g/LrX95cEHFRsq9IZ7
   MoH2ipSpTOMx9JbPs25uslQVKRZn+gkJWyTTISalwIJUBg6abhDhF0eu3
   s=;
X-IronPort-RemoteIP: 104.47.66.47
X-IronPort-MID: 83814002
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ZshDnqlOvQp3IuO4/EjzrWLo5gybJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWXGHVb/6CYWX1Kop+aYm+pxxUupSGndMwSFBr/y81QyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6UqicUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9XuDgNyo4GlC5wRkOagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfAWdxr
 NhbDTc0ZAGPiNqz+ZiWUfJ+r5F2RCXrFNt3VnBI6xj8VKxjZK+ZBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxpvS6Pk2Sd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iL31raTxXuhMG4UPKTg2qNGkV6O/WhQJU0dclLlo/mfkHfrDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O/037kSBx7TZ5y6dB3MYVXhRZdo+rsg0SDc2k
 FiTkLvBHTVytJWFRHTb8a2bxQ5eIgAQJG4GICobFw0M5oC5pJlp1k6QCNF+DKSyk9v5Xynqx
 CyHpzQ/gLNVitMX06K8/hbMhDfESoX1czPZLz7/BgqNhj6Vrqb/D2B0wTA3Ncp9Ebs=
IronPort-HdrOrdr: A9a23:jyxq/KBhS4g3ozPlHeg3sceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ/OxoHJPwOU80kqQFmrX5XI3SJTUO3VHFEGgM1+vfKlHbak7DH6tmpN
 1dmstFeaLN5DpB/KHHCWCDer5PoeVvsprY49s2p00dMT2CAJsQizuRZDzrcHGfE2J9dOcE/d
 enl7x6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr18jegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKvS/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kda11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtZqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bW/HAbgcYa
 dT5fznlbdrmQvwVQGYgoAv+q3nYp0LJGbIfqBY0fblkAS/nxhCvjklLYIk7zU9HakGOul5Dt
 T/Q9pVfY51P74rhIJGdZM8qJiMexvwaCOJFl6uCnLaM4xCE07xivfMkcYIDaeRCdc18Kc=
X-IronPort-AV: E=Sophos;i="5.95,209,1661832000"; 
   d="scan'208";a="83814002"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bEDCm000oDcd8jeBJUXuhJZg15pweHbaneceIMqAqgA0zl7lxAubxiqbFXcDZv+ac7aEWFu3mERa12dpuPerwHo3qSDwCE5Xcxz7woqr0u0vaTn03sImSa9jKjozDZlmSrLotHKOA4f8YYJBcxm+iFVgC8QILhqzwt/798o7jqtA03UUBdNej7pJHaoZRuktoHSGkYNsDImo2I1XA8ktsM1gVFtnr+5ughD+jpzxjTVYDEleMFNcnB16D0p82ZEvcYDZnTTt5WcZUwnQMJ/HOcYJtT+zMrANnBfm05eskuMoDravBKMcoIo3ABXM5I5nzwma+hVLqYMo3/yDgWh0+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZigO/gQjqVWEg8aaqoQcxIujc0MZwkn33D5jwnxXdxY=;
 b=aXNK6XDUx5es8UYhEcb8WGtJ3mJPAObX/nrWtmRT6twDwPh8/qNmaoNPEl6EcuZRCABALJ/RGHcvIJZElRWIb0qlIXm1LfITgDBX+RbCPTEl+/vRFfBAEIz/zEPYVbRGuRXl0Kbxu4q1yl1hr+bo2mPWnySvegtoKnwYjDICfwykrNeZFHeGPiaavyrUEVbgXCoyMkZ8n6Q4qiNAkjhCFwHxLOl60x3gzws0qpDkD6oRWLTyh5HRtz1pBBrD2X6vfGxIdeMhkRYwOmaILwflnCG7weT8+XmpBpZQTWumJ12YYgcQMwnnnE6r3MQbr+mj29INnwEo941d2ODVyHoYRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZigO/gQjqVWEg8aaqoQcxIujc0MZwkn33D5jwnxXdxY=;
 b=WP9HWTu/3TwaeWsgmjDKF+KgA91V6Ao2MlS52mr/B2y99X27L2OLYS0dQr7QamG7RtA4GE8cf4WJoLr+O+z9tzjCxxvagOekQax/0zRh0hJEXl/hCC6h8DcMbiJx4TiF0r/xKxIaHkKOkzqvbsdAUnWL/h5sTgrFeR1eiBYsrmQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 24 Oct 2022 18:24:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH for-4.17 5/6] pci: do not disable memory decoding for
 devices
Message-ID: <Y1a8L3CEOgfKScqj@Air-de-Roger>
References: <20221020094649.28667-1-roger.pau@citrix.com>
 <20221020094649.28667-6-roger.pau@citrix.com>
 <4c960f12-6561-d8e9-c1bf-8da18243ca6b@suse.com>
 <Y1aI5Lbi3sysIZVv@Air-de-Roger>
 <730158ce-d168-5dbf-38cc-78cdedcfe33e@suse.com>
 <Y1ay/zIPSpODqsNY@Air-de-Roger>
 <82a69c5c-3174-cee0-932b-3141df6454a2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <82a69c5c-3174-cee0-932b-3141df6454a2@suse.com>
X-ClientProxiedBy: LO4P123CA0445.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::18) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB6358:EE_
X-MS-Office365-Filtering-Correlation-Id: c9b73d12-b863-492d-67d4-08dab5dc3513
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e38EptzmDpgSwr7JmGGN5nj3NhSF/ubG2hBekvHPrLJCt0ldugHgwg6eDf/Vaom5EbHGdnnoRE4nku+Ria1WZqxYXtXxiFI2+SO2G4FGpyfoTd+gcnh4xdaGEDRhgwj5OjpkDOtngGaXo8ZPQXnfX0duK1Fw6fivhN/ly3pXlE+Ls8gwHolp6k8lLNZERVauvzu2Bqms8mHkI1WKhkDZuDg/e0CnLAA8U6Ui4DbcnN8gXqTxFOkCdpSkR3l6ygGts8cQkRMIIfaFr6nubCfDKnl20CDqi16p7grVargzg4XXDKtAkXp2R0iP2r5k0clUohnYVSbsKG+Dxx6rEVcDUTQ9JjUXp3Pd4pvT2oGIPsIzM8sGjSnqhKI2n1kMjRPzDlyvhwi8AvdwDLPq2wbMJPQ5P34OwhsQix3wg544jPcTMn9/p7nkdcJV5E8ZEXIaq2EE1bEwspJ/7nWKDL8+T41KMYsWHW8jeaqUU8NVBZ7wvU6BDRDQvOPN56MiQWwVNxQIaoj6j9Q68sfYrRRkGD8SBD01Ikg4MbpxwE2tDXqgCcKK7hD8kNWdvcRKD9aH0endQ9sPUyfIueRWMRcxmjFLTc9xWtL2xi5r2JQ8AXeTlcRz1K8icqB70WQtMa4dw9QA3VEwdLyMnMxhM3emj9aKx8GaHF0m5CKqEfNknAOqWaDgcRoN8E+41hRFVRgFQmlPZrbpsGTj/qTJTb7WkA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(396003)(346002)(136003)(376002)(39860400002)(366004)(451199015)(85182001)(66899015)(38100700002)(82960400001)(5660300002)(66476007)(66556008)(66946007)(8936002)(83380400001)(86362001)(6916009)(9686003)(26005)(6512007)(186003)(316002)(6486002)(478600001)(2906002)(33716001)(6666004)(53546011)(8676002)(41300700001)(4326008)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEpRVWw5THBPSXVMWUVwYzFVeklPbkRTTXVRcUduT2hoMkJFaG9CQlBXUUNC?=
 =?utf-8?B?KzdsbXA5RDF6YVlzQjBaU0tGMWtGOUZkTGRxT2gwQW13eEM1bHR0eVVMNmNq?=
 =?utf-8?B?QkhJQkcyWTJ6V3pVM0tXNHJ3NkVydlNqVVgzUDQ3L09PQjNXUDZydHhMb1JQ?=
 =?utf-8?B?aWJrNGpJU2F4ZnByd2J0NFFVeDhSQXMzbXRhNjMySCtaMUo2UUxZcTNzR0tt?=
 =?utf-8?B?TjllT0JCQkh3VUFHY1BHNldIc0NmYWxCR1lGeTk3cmY3elR3dHNwWmU3QTA5?=
 =?utf-8?B?cjMzbTZ4cXZRejU4OXNUWm5QRW05QThUL0puZHRmSDBMUlNoY0xsRzBKOVBJ?=
 =?utf-8?B?SFkraElndldZUzFPOHI2bVhHU0FvY2RIQWl0K2xjZS9FNFBWcitmMkRIeUtm?=
 =?utf-8?B?Ym8wc0x5WlpFU0NIVjVqTWxVSjN2UkdxdVhKY2Yrb0RoU3NPWTVMM21ySk9h?=
 =?utf-8?B?ZFpwNXBlSEN3RUZQY01WRmdHMUhaSmpzaGMxU2ZIY09GczFoOEFZVEhiMTJq?=
 =?utf-8?B?Y3QyL0g2eWlSQ014LzNvNHJIT1BkR0s1QmVFMGZCSmlpaldRdVU4cHJOZjNp?=
 =?utf-8?B?Qm9IYkM4MnlkRUhweFlrVU5OZlBKaVF0RGprWlJGbmxWY090aUdVbWl1WGRU?=
 =?utf-8?B?blNFU0lNTFNUWG1Ec2hiMXpMM01odDZRZjJ4VjhBdTVXQmQvaEN4Y2loYmFE?=
 =?utf-8?B?Sjl4R1dWUVNmQlhkWFEvbU1OSkdiSVZuRnliMk9qR2lYbS96SjlYQ3J2OFVm?=
 =?utf-8?B?ajdud0xCMjBtdi9yMFVMSTNORGptMmxEQmlLRm96SWdReGNKVnZaQXUyKzN3?=
 =?utf-8?B?bkIxVHNqcXJNd1h6dzlYUFJTdWNyYWdwZU5RN3FkQjdaenJkRTg2ZUYyWFJW?=
 =?utf-8?B?dUo5OGZQUTB1WVpLTmFyVE8vb2l3R2VtRTQwR21LUmVKdGlYTVFhMHZZK2R2?=
 =?utf-8?B?RVB4NXU2Z3NYcU1IdW44Q0pTRUZTQnkrNzhaMXNSdWptRFlxdm1Ia3ppZlpk?=
 =?utf-8?B?L21wRzF5djhsVGZETzlHVEhrUmtuYVBSQjZEcHFLT2tkSTFoUzlGejYrZFBx?=
 =?utf-8?B?SXdib3dwa1BCaVhhbldKd3FDR1M5WUt6VTA5Y2lkcnFGdXdsM1RpK3ZOZ3d0?=
 =?utf-8?B?UVAzOEhUQ2hQdlpSV0NrQU9BaG9lZWVUMlc1WFMxVWtWQzZzQ2ZFV05wdWl1?=
 =?utf-8?B?RjBCY24yMm5YaThoV3dxd2tTaU5VUDNvS0Q2eTdCTDh2ejRsVzh5c2Zpd1pQ?=
 =?utf-8?B?RXFkbFIwcHB4V0sxTlExcFNGZjRUUitmWHdOKy9iMWJwekVvOTM0V3pnTmtl?=
 =?utf-8?B?WG9MUUdBWi9QeWRDMUNudTZwYzY2Wmt2R3h5ZmR2MFExWFdVZGh0djhqZUhR?=
 =?utf-8?B?WVhsc2tMcEgwUkkwaWxZbWEyNEx0bjdSWHRIcjBlcTRxMlJPM1FSdENEN1ZK?=
 =?utf-8?B?M2VwOUJab1hBUU4vZENwK2ZMMW9VVzhHTURzZXRXSzkvYWZudnBQbmMvWlhk?=
 =?utf-8?B?NzhBR0VPUVJsMFFYS3dNTnI3QTkxVlpGVWNiMWNXeHZhcDFTU2pmSENiU3BN?=
 =?utf-8?B?VzkvMnVTeTJ2Y3E1bGQxaUY0aXFKSlZmOFRVOSt1dmlKaFYxQ1BMTDhFVW95?=
 =?utf-8?B?OXVrS0pNQVJKc2pNYmhxQmxkS01RSUN4cG5lTWw2Qzgyc1hLYzR1ZWlXL3Vi?=
 =?utf-8?B?RnpRM2Uxc1E5ZU5DRVNzUlZldkdDVENZVHYwR1FLUnllcStWeSsrYUVhSkJ1?=
 =?utf-8?B?TlArODlqRDloT2RxUkdPckUxTW44b0hKQUlwd0d4QjE5R0ZlY3g4M2VDVjRM?=
 =?utf-8?B?TnZOaGJnVC96bkl2ZmZtaFhJVXd0TStzdW9zWko0clI1ZUhibUNIMlM4RFVh?=
 =?utf-8?B?NG4xY0VYdVlNRzJxOGljcFJOOCtGTzR1Zy8zMzJSOEVZUDBXQ2FZSnJ4M1Qx?=
 =?utf-8?B?c1NRZ2Vjb3UxclZ6QTVaWDBHNTBQUXEyM0pudWRNL0l3TFZuY1dtby8waVNY?=
 =?utf-8?B?d2RuT3I4WFMvem1zZDlPWU1KN3M2dmt5NklHcmg4eWRnczJ2SVcycUFQSGRW?=
 =?utf-8?B?YjhkbHdqUy9oNEp1cEplbThNZlhXaVJoNEZZWHJKaUNmTEFyeUM1RDRtcXpH?=
 =?utf-8?B?Qk16ZDNRcC9hcEZmWnVaUDl4WlNIMm9WNElSZE9vN2toU2gxRUVKK1JvSmNp?=
 =?utf-8?B?TkE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b73d12-b863-492d-67d4-08dab5dc3513
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 16:24:22.5973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VlHg3uD2qh31F6mCddAjPxVRcdRXmPt3pbcFwqtKtVqTIDclCjAodw5v8TsFZ/GvHpPdN9jKs6kqbdcR3P8y5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6358

On Mon, Oct 24, 2022 at 05:56:25PM +0200, Jan Beulich wrote:
> On 24.10.2022 17:45, Roger Pau Monné wrote:
> > On Mon, Oct 24, 2022 at 03:59:18PM +0200, Jan Beulich wrote:
> >> On 24.10.2022 14:45, Roger Pau Monné wrote:
> >>> On Mon, Oct 24, 2022 at 01:19:22PM +0200, Jan Beulich wrote:
> >>>> On 20.10.2022 11:46, Roger Pau Monne wrote:
> >>>>> Commit 75cc460a1b added checks to ensure the position of the BARs from
> >>>>> PCI devices don't overlap with regions defined on the memory map.
> >>>>> When there's a collision memory decoding is left disabled for the
> >>>>> device, assuming that dom0 will reposition the BAR if necessary and
> >>>>> enable memory decoding.
> >>>>>
> >>>>> While this would be the case for devices being used by dom0, devices
> >>>>> being used by the firmware itself that have no driver would usually be
> >>>>> left with memory decoding disabled by dom0 if that's the state dom0
> >>>>> found them in, and thus firmware trying to make use of them will not
> >>>>> function correctly.
> >>>>>
> >>>>> The initial intent of 75cc460a1b was to prevent vPCI from creating
> >>>>> MMIO mappings on the dom0 p2m over regions that would otherwise
> >>>>> already have mappings established.  It's my view now that we likely
> >>>>> went too far with 75cc460a1b, and Xen disabling memory decoding of
> >>>>> devices (as buggy as they might be) is harmful, and reduces the set of
> >>>>> hardware on which Xen works.
> >>>>>
> >>>>> This commits reverts most of 75cc460a1b, and instead adds checks to
> >>>>> vPCI in order to prevent misplaced BARs from being added to the
> >>>>> hardware domain p2m.
> >>>>
> >>>> Which makes me wonder: How do things work then? Dom0 then still can't
> >>>> access the BAR address range, can it?
> >>>
> >>> It does allow access on some situations where the previous arrangement
> >>> didn't work because it wholesale disabled memory decoding for the
> >>> device.
> >>>
> >>> So if it's only one BAR that's misplaced the rest will still get added
> >>> to the dom0 p2m and be accessible, because memory decoding won't be
> >>> turned off for the device.
> >>
> >> Right - without a per-BAR disable there can only be all or nothing. In
> >> the end if things work with this adjustment, the problem BAR cannot
> >> really be in use aiui. I wonder what you would propose we do if on
> >> another system such a BAR is actually in use.
> > 
> > dom0 would have to change the position of the BAR to a suitable place
> > and then use it.  Linux dom0 does already reposition bogus BARs of
> > devices.
> 
> Yet that still can't realistically work if the firmware expects the
> BAR at the address recorded in the EFI memory map entry.

I was thinking about the BAR at address 0, rather than the BAR in the
EfiMemoryMappedIO region.

dom0 OS would need to avoid moving it, but that would also apply when
running natively on the platform.  The behavior when running as a dom0
won't change vs the native behavior, which is what we should aim for.

> >>>>> Fixes: 75cc460a1b ('xen/pci: detect when BARs are not suitably positioned')
> >>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>>>> ---
> >>>>> AT Citrix we have a system with a device with the following BARs:
> >>>>>
> >>>>> BAR [0xfe010, 0xfe010] -> in a EfiMemoryMappedIO region
> >>>>> BAR [0, 0x1fff] -> not positioned, outside host bridge window
> >>>>>
> >>>>> And memory decoding enabled by the firmware.  With the current code
> >>>>> (or any of the previous fix proposals), Xen would still disable memory
> >>>>> decoding for the device, and the system will freeze when attempting to
> >>>>> set EFI vars.
> >>>>
> >>>> Isn't the latter (BAR at address 0) yet another problem?
> >>>
> >>> It's a BAR that hasn't been positioned by the firmware AFAICT.  Which
> >>> is a bug in the firmware but shouldn't prevent Xen from booting.
> >>>
> >>> In the above system address 0 is outside of the PCI host bridge
> >>> window, so even if we mapped the BAR and memory decoding for the
> >>> device was enabled accessing such BAR wouldn't work.
> >>
> >> It's mere luck I would say that in this case the BAR is outside the
> >> bridge's window. What if this was a device integrated in the root
> >> complex?
> > 
> > I would expect dom0 to reposition the BAR, but doesn't a root complex
> > also have a set of windows in decodes accesses from (as listed in ACPI
> > _CRS method for the device), and hence still need BARs to be
> > positioned at certain ranges in order to be accessible?
> 
> Possibly; I guess I haven't learned enough of how this works at the
> root complex. Yet still an unassigned BAR might end up overlapping a
> valid window.

Right, but if the BAR overlaps a valid window it could be seen as
correctly positioned, and in any case that would be for dom0 to deal
with.

What we care about is BARs no overlapping regions on the memory map,
so that we can setup a valid p2m for dom0.

> >>>> I have to admit
> >>>> that I'm uncertain in how far it is a good idea to try to make Xen look
> >>>> to work on such a system ...
> >>>
> >>> PV dom0 works on a system like the above prior to c/s 75cc460a1b, so I
> >>> would consider 75cc460a1b to be a regression for PV dom0 setups.
> >>
> >> Agreed, in a way it is a regression. In another way it is deliberate
> >> behavior to not accept bogus configurations. The difficulty is to
> >> find a reasonable balance between allowing Xen to work in such cases
> >> and guarding Xen from suffering follow-on issues resulting from such
> >> misconfiguration. After all if this system later was impacted by the
> >> bad BAR(s), connecting the misbehavior to the root cause might end
> >> up quite a bit more difficult.
> > 
> > IMO we should strive to boot (almost?) everywhere Linux (or your
> > chosen dom0 OS) also boots, since that's what users expect.
> > 
> > I would assume if the system was impacted by the bad BARs, it would
> > also affect the dom0 OS when booting natively on such platform.
> > 
> > What we do right now with memory decoding already leads to a very
> > difficult to diagnose issue, as on the above example calling an UEFI
> > runtime method completely freezes the box (no debug keys, no watchdog
> > worked).
> > 
> > So I think leaving the system PCI devices as-is and letting dom0 deal
> > with the conflicts is likely a better option than playing with the
> > memory decoding bits.
> 
> Maybe. None of the workarounds really feel very good.

Hence this last suggestion which limits the workarounds to PVH dom0
only, thus limiting the interaction of Xen with PCI devices as much as
possible.  I think it's an appropriate compromise between being able
to boot as PVH dom0 and not playing with the PCI device memory
decoding bits.

Thanks, Roger.

