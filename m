Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CbfFShCd2mMdQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 11:30:00 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E4D86F24
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 11:29:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213516.1523986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkJqr-0004W9-F1; Mon, 26 Jan 2026 10:29:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213516.1523986; Mon, 26 Jan 2026 10:29:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkJqr-0004Tu-Bi; Mon, 26 Jan 2026 10:29:45 +0000
Received: by outflank-mailman (input) for mailman id 1213516;
 Mon, 26 Jan 2026 10:29:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dxSt=77=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1vkJqp-0004To-B2
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 10:29:43 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec28efb7-faa1-11f0-9ccf-f158ae23cfc8;
 Mon, 26 Jan 2026 11:29:41 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by GV1PR03MB8454.eurprd03.prod.outlook.com (2603:10a6:150:59::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 10:29:19 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%5]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 10:29:19 +0000
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
X-Inumbo-ID: ec28efb7-faa1-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=slkPaQklSPR84VGBfJUoExRClUEea1iSlQCMXn76EgRIhE9gP3taSVJfUjHajM/+YmOPK6v62CnOJmuf9d98K3SA/d6nrwQYGE2vpQaR3cvEGkK7gdhPzJ5wOhuPGG1OrwAvJ/y0hTdlOdf9qawwIaLsHpct0cn3OIR1DIoN36eExhZSxsnYcnXRB1WYhXe31RUVh45W0ULzBe4nUAj7ME+YVmbPVNf4KeoqclnCDBOgqseXToa9naymu0GdyetrFEG7DXhpjmfBGIRm5VdIPU8rcwfUH/Tvu3ihAUAKJercMnJQu0SOquW1iI17MrDxp71ptRBkCQxAiYOUmNrXOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FOJQlmYftUpOLxBvJJzfYXA+AmoluQ/gJMUGEVHS6l4=;
 b=PUi+VrMAM8gYQEr2ljocQxM8G2/fzmfkdpySyHg17DDyTwusRUl6Ktd2orH1LOh2TewePKKqBzWxbv8ohUHPuQ03H51NoBNJkS2h07yuaohx7QbVSRP1o/sr88S51VKEvaIdGwxhfBRrio3fYGTAypPosUo6xlsbH1h1+i/59rw0093eRlFWrBEkPCDSAXiI35m/CmL1pJesG/3iM7BI+QdQKjMv7zpq5lhWOOsVmS4Z9WwbkjZg7dM7916GGhIqvFZiyB+ADJqgZNXVyhDo1x2K23KelIKEycdcOMMttlJmcKYAs++fOIfojMiZ3f2VKg8hpCcnKGjlLvfl3Sxrng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FOJQlmYftUpOLxBvJJzfYXA+AmoluQ/gJMUGEVHS6l4=;
 b=uWkAlPddD0RkP0fa1Ge/E3VgiYt+LjdXvbWblK4dMSKas7DO/zs60qAZXy2fB2/Wsyb8KLUcrcEDziZCdiBu7/UZg+RU5IoPG0zMiGwulmZFImRb/R9dbcMpQ7vOmn6SmVGLznRFR2KYJ60Ig68Hpa/zgFYps9bgwk4g2KsxHAT8xsFFAAvFiaDl8jEVaYPrfyEJhRBJBwdrxeZA1wjHv/rkNKvRj9XBh8VsHu/mC627tDirQ8znsmCbA0BZ852Vs693GXGwUkALqK1XwpyoI7xi+MilcgrC4b6Z11PuBaUv43VNIe2w5ICBxfF2mOUjoCatPRfh6nfKGTtQ/UF59w==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v8 1/5] xen/domctl: chain SCI handling before IOMMU in
 assign_device domctl
Thread-Topic: [PATCH v8 1/5] xen/domctl: chain SCI handling before IOMMU in
 assign_device domctl
Thread-Index: AQHciwXk/uoXY0zPp0qUEySvGl6zVLVd0bMAgAZ1k4A=
Date: Mon, 26 Jan 2026 10:29:18 +0000
Message-ID: <0df180b2-1e9b-4dfd-b2a9-cbe9b805d114@epam.com>
References: <cover.1769020872.git.oleksii_moisieiev@epam.com>
 <8482f823e945060d1a36469f14f94aa6251e3f71.1769020872.git.oleksii_moisieiev@epam.com>
 <114d2326-112b-41ea-8c32-12b785f8e7a0@suse.com>
In-Reply-To: <114d2326-112b-41ea-8c32-12b785f8e7a0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|GV1PR03MB8454:EE_
x-ms-office365-filtering-correlation-id: 7ccee2f1-681e-44a7-2f50-08de5cc5c362
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?eHdPdk1jbWg2d2trZTlIaW5HSWU3WndpcTA5OGltbFh2d1JGT1N0Z3gvbTRn?=
 =?utf-8?B?Yk9wYXNSNGZyQml1d2ZvOE8vVTBvVVVPc0NVOURhcEJ3WmJBVnVGS1Urd0Zu?=
 =?utf-8?B?ZVQ1ZWJFakRGS0NOd1oxNmxIQ1B6WHgvWE1vSm51YWVLejlXckRGY1o4Q1dZ?=
 =?utf-8?B?bmhNUUZCQnJQZlgvQ0x4cktVRXRZcks2TytZOVdBNTUrdnkrd0RIeEMvT1Z6?=
 =?utf-8?B?NmRlU3JoNG1XOU1tSUgyZWJMSGJGcUx2MERaZGZ6amVrT000VGsrYjlQWGR0?=
 =?utf-8?B?WFJIZkovckNQemJPWWFFU1A3WHYrQ2F5bGZ3NkRMRDNkOGcxMXNDaEduSzdM?=
 =?utf-8?B?dkIyTDM1MC9zb0pnTmxNZ1dnaTh6R0c2TytaT1RXRncwZ0dZL01RK2JhdWdn?=
 =?utf-8?B?elJrd1JMaXNCL2piSXRvRXlQVVRtOFhaaDZBWjliYzhiMGRhZ2hJaTJ0Y2ll?=
 =?utf-8?B?S3hPSUVvRDUrbzJYL0U0M3hONHYxbkNseFVPRkxLaDJJM3UrWU1XMWdqbjZn?=
 =?utf-8?B?TU5EVU5iNWtGS2hRc0FrQ1NTWGNWS0toK1RFNndDeWlETlpzY0lVdVA2Tjd4?=
 =?utf-8?B?aldZQ0xVWHJlVWYvVTNhU0lqNUtuTkJQZ0YwYlRKU3NHK1ViRkg0VWtGVjRL?=
 =?utf-8?B?cDAzMzh5MEQwYnNFWXdKZmdnSmQ2TmErRWhlNkk4Z2NBa1FGOXJTb0JxS1RT?=
 =?utf-8?B?N04zTy8vK2ZKY1pSc050Syt6RHFzbldITHhmUnJ2Q1BibkFWazBuV2xTNHhL?=
 =?utf-8?B?cHFFakN2ODZIcXp1UCt5WnNqaVhOYURJKzhzMHNmbHlqQ0p4VDJjaFdSY0Jj?=
 =?utf-8?B?V043Q2xQZm83MjdjVmwwdnlSUFU2dXowaVNzUHJTcjA5ajhzNVFRK1QxZEVz?=
 =?utf-8?B?WWViY1NNemxaUElBa25LYUZHNVRTMVBhdmlKRlpUOUYvb3pLamhmdFY5SDY4?=
 =?utf-8?B?dG12eEZFZVE2OFNqRUJ2OU9XWHRRVUJqMVpaMTRKRzZYRHRPQVFVSC91UHdT?=
 =?utf-8?B?QjZmT1hmMWUwZUY1ZFplSWVsaDdOanpSOXkybFZMaGJRMmlUKzFRazd5M3dy?=
 =?utf-8?B?VEt1d011a2trNU5zZlV4RjZwOFJCcGI4ZEJUeUtvY1F4T01mSnpFbFA1UU1r?=
 =?utf-8?B?NEswc2pWbTRPWEc0MEtMYnhmZ3ZIZWZNRzlrR3RNM2NNVXNxNHY5dWx0OTAz?=
 =?utf-8?B?QjVDRUtJcUxXd21vakVsdkEvajRCNzAyNFc1RW9XdEhuUjFmZXl5RkFjNTZD?=
 =?utf-8?B?UERjc1dBK3k2ZWxsb1JXWjUxazdLdW5BNVJ3U2JET05iRTNhQjVmOHh1WWZ5?=
 =?utf-8?B?QWhCeEQ5WGFtTW9MWWZiV3FkNG9KcVNHOEYxYy9iTXdRNDZkSG1yaWQ1eHZz?=
 =?utf-8?B?bFp1UFhGdUgyUEIxdTBTdyswQmVpUGxSY2NRanVNTXdFU3pXRjJ0aGNEZ0RM?=
 =?utf-8?B?Nnc5WDNEVEp4QlVPUzB3dTEza1RCcm40MXdXOWxEbkhZUzkwS01KQ0ZYUnV0?=
 =?utf-8?B?VTQ4SWpYeHNTaDk4bGc1ekVJcGhqM3hoekkzek5scUlvYWdjU2Noc0JNVk16?=
 =?utf-8?B?eTZJWWFZTitVNjlUOEgxMEVpOXBjRlFFU09XTDNHeVVoRkk3L3JQa3VlcVZr?=
 =?utf-8?B?MDJsQkpiOTJ0MGp0ZExZZXAzMEVPMEswRGtXN3BzeVkxcVdwQkZ4aTFBMHNm?=
 =?utf-8?B?aVJiN1dZR2tIVDVUb2hsTmtaZ21Cc3ppN01pQ01GQjNmOFUzK3Zmcll3c29v?=
 =?utf-8?B?ejlEUjFwclRYc01pL3AxbDJFbytaUEllanBldmIvdTdFMVpub3FaVlVzeVVt?=
 =?utf-8?B?eUFiSWxpdUV5c2JONzh6YTIxNUlzUERGTStQOGtZdVFrTTBYZ2Erc09ZcjZM?=
 =?utf-8?B?WVFaelBBWVk0T2JuV1JKR2FnSnk5SlU4a2hlSWYwRW02Q1diQXdJSnpPeVhx?=
 =?utf-8?B?b3EzNXlkRzRBSGhubzFCOFZOb2k0MjExeEcySWZEb096dldvbVhwaWs4UnRu?=
 =?utf-8?B?NXZJYzlkQUdscmlUWjI4OWJJdUd2SnRLMHhnSlVqMGxGVlQwVUNTWmpMTWhm?=
 =?utf-8?B?cGlVZmJyTHVhYnNVd0IvTWNHTExjdlNQRzBmZURRelZjMmxCcFo0SS80cHpB?=
 =?utf-8?B?dXM2YTRIWkY3MWh6NkFmdlRnTFFZWVh6QTdmY3ZKZ1JteVRxanpSS3l0bUdI?=
 =?utf-8?Q?Oh5mctMgVGf0PvNbPqv2gFQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MTh3cE52aThicUJTeEFDVGFHY1ZYQThiMkswSWFyc3o2R2hLVDhxVUFidWJQ?=
 =?utf-8?B?aHZtWkVlY3dSSmJCcDFPR3lKQnlsWkNFT1NUVkxIMUlDNGdVeGZwMDF1Zjdk?=
 =?utf-8?B?RWE3ZUN0R04zdnJROVdKWjRhSlpUaWVoMDBTSThQQ1dzMDVWWVptSlVJNk50?=
 =?utf-8?B?Vng0ZTJPOFE5d3loU2h6QTJTTktYMW9ZSDdJa1NQVmNvQ3VEYitzQllRWmFM?=
 =?utf-8?B?WjFZb0EwT1dvdnp4bEJoaDRiVkpZQ3BOU1hQVE81b29ENytjRlFLRENxZTY1?=
 =?utf-8?B?T3NuYnlkOFZBWVZ4Z2w0MmNGWmIvRi9VaXg2d3ROWGpPcGR5UUF4QnRqelkr?=
 =?utf-8?B?TWpFdTZKQndzLzNnWCs3RStPcm9IVUN4K3VKSU9HbWRQeThWOW1ON21ucUhS?=
 =?utf-8?B?Y1lIRzhQZGVBbDdLV0xibWQxRVoxdENWc0oxS09FWklRM0I0MDdMMU9FMnZm?=
 =?utf-8?B?bWozbytiK1owcm80a1lYaGN4akZjeWlhbjQ1WWRCSjE0WTVEUFBlNnRjMWpk?=
 =?utf-8?B?cU81S2xSbHdMUEp2N3pyU3FCTnpQdjdXaFVNdEdlam5oZjNzQTVweCtCUUxS?=
 =?utf-8?B?VERvQWZXSVM5NzkzVFFzQzM5aHZyeXFtYXNHc3RmcjJkd2VEOUNZWVBvUVF4?=
 =?utf-8?B?cUZNdkVXVXl4UU5KSDFHOEE1V0RwWmg2bFVyaXNRMkd4QkFBZC9sRkhvOWpo?=
 =?utf-8?B?UXd1ald2ZSt6ZmNqVVZtckU0dUVJQ1VYbFpKc0UzMFFtT3RVK0lKd0FwSHZT?=
 =?utf-8?B?RTluNmcvYjJPa2pnNDk5VXAwNjA4bmN4d3ZTdm5YVzJ3cUdPdXQ0VWd6N25t?=
 =?utf-8?B?cUt3aThyOGZEdng0M2Nlbm5sTnVuL2V5T3g3SytsQ01weU50S0t1Z0ZaZTMx?=
 =?utf-8?B?OEthdVB3QWJYY1Z5NXBrSWZHSzFNcllnd1d5YW9jU0J5S1dmbnJiWWlPYVMy?=
 =?utf-8?B?SDB5dTBaczJaOThaQ2dKc2t0ZGtmNjEycWlMMzY5L1oyc1JHWGE5eE1Lb05Q?=
 =?utf-8?B?Skk1YWwyRHBTSkJBck5yY0QvRWhpcVdBdnovWEd0dUxacjlOdXIyMEtDNjBa?=
 =?utf-8?B?aFNNaGFWOVo1UXVaMC9SUDRydjhncEgyZkdCMExnZG5idHRUZXB1ZlNBNmF4?=
 =?utf-8?B?aUU0eG56dlhrTDFpWDJhZmpDMXN5UWVuL2dpTll2Y0dyTmJ1dG5pUzJqUHBn?=
 =?utf-8?B?V2RBMUZpNWIzaDV5aStGbDJ4cWhVN25Cb2xvc2hjSzhKYmwwcWJNWnhxZU9n?=
 =?utf-8?B?NFBJTFdmbmJ4NnIybmlQZmZucVlnbTZmdEpSS3FRN1ZLejB2S2xJQmErako2?=
 =?utf-8?B?eHhIWHRsSy9sNjJhZFhNU3J0ekFMem1lcGpiSFpxVmxLc0Y1NGEyK2poU0VD?=
 =?utf-8?B?ZHVHTE9RbGVPclB1NXFZVEUzRXMyMlhWZGZaOUV6NmhOdTJCTVRHS1h4a2li?=
 =?utf-8?B?L1I5NGFXKzhmZG9RMzNTeWYvaDZOL0FMRXRIbHFWV2dxT1FjeWhicmpNTXZh?=
 =?utf-8?B?dlJuTWwxLzNlSTkyQ0U3NzJUZXViTUc2N1dWaUJZVU9JOHJtM0dodVkrd0J4?=
 =?utf-8?B?bk1NaXd1eXFxTDJTd3kxVUc4OTkzUmRSVEJ4dHQzL3prVXZaVkJTcnh3bWIx?=
 =?utf-8?B?dk1aNjhueHBzUGNSeTJ0alR5dUdZMjArU3JrOGkzMmVac2dLakpJS0ZOODhm?=
 =?utf-8?B?RHo5QW4xVFFiNjR0b2Noby9xK04wUW1uOTlrRXN1ZWtCZ2U0OHJHaGIzbHp0?=
 =?utf-8?B?Q09xLzJBNjMyOHZNa1o1M3YybndKSjRGakhuY3RZbHNjVVlyQ1B0MndVTmNx?=
 =?utf-8?B?OW14OWxJMmpnSTA3QTJwOHJOY2JmR2JjcFdxNWswTUVBMG4zV3FTalpzeDFB?=
 =?utf-8?B?SGJiRkIvWExQZSt4VnhrWU5zSWJSdlpoeDVhdjdkSFlOQUE4cld2N1p1a1BZ?=
 =?utf-8?B?N2pTbHYrQU4vd0NVMTVYeDBoMkpoTVV4OFlXZjQxQXBKNE8vRFl6ODBkYkRs?=
 =?utf-8?B?cTNqenVHT3hQdjJJNHlGcnhySXVXSTdzWDY2QzNMY0VPRjcwSkNMUEg2eEdu?=
 =?utf-8?B?RzNUdjh5MXdrN2NzSVZXYWgxbGMzMHZRaHY1VjkybjJEUzdmdFByUHVYcXNK?=
 =?utf-8?B?TUV0R2pSWU8ySkxRRnQ5WDYwbFdHOGVMelNMN0pPNWxhc2haOVdqSHh0ZXF0?=
 =?utf-8?B?YkRHTTRnOXpIWXhvY0FmOWZ5eWVzMzBzSWVhd1VOSFNkSWZjaTlncTM2WG9V?=
 =?utf-8?B?YlJSQVdzS1pXSzZPQXcvejJxcUNzRHJxM2Z0VmxIZWRlSzdMTUdXb3dRQlFn?=
 =?utf-8?B?eis5bDNlTzBNMXpGUlJ1QnlsN2ZSem93U0dERnNGWkNzNnVuRUp3NFFkaWxK?=
 =?utf-8?Q?RZMkRWXrfK1BkkeE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3C7973AB9C5CB46A0A4919B05B340FC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ccee2f1-681e-44a7-2f50-08de5cc5c362
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2026 10:29:18.9160
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hL2kZh7EbLFKkmn/1SdMVmbKe+wI/Dv9cerD0mg/9LFf8EsVqRr0ypbDfCeBhBPD1GwQuX1vDsIQTy3B/mg28OBVXPQIGtO1wt9YhND22Zc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8454
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:bertrand.marquis@arm.com,m:jgross@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:grygorii_strashko@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 91E4D86F24
X-Rspamd-Action: no action

SGkgSmFuLA0KVGhhbmsgeW91IGZvciB5b3VyIGNvbW1lbnRzLg0KDQpPbiAyMi8wMS8yMDI2IDA5
OjUxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjEuMDEuMjAyNiAxOTo0MywgT2xla3NpaSBN
b2lzaWVpZXYgd3JvdGU6DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vZmlybXdhcmUvc2NpLmMNCj4+
ICsrKyBiL3hlbi9hcmNoL2FybS9maXJtd2FyZS9zY2kuYw0KPj4gQEAgLTEyNiw2ICsxMjYsNDEg
QEAgaW50IHNjaV9hc3NpZ25fZHRfZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBkdF9k
ZXZpY2Vfbm9kZSAqZGV2KQ0KPj4gICAgICAgcmV0dXJuIDA7DQo+PiAgIH0NCj4+ICAgDQo+PiAr
aW50IHNjaV9kb19kb21jdGwoc3RydWN0IHhlbl9kb21jdGwgKmRvbWN0bCwgc3RydWN0IGRvbWFp
biAqZCwNCj4+ICsgICAgICAgICAgICAgICAgICBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9k
b21jdGxfdCkgdV9kb21jdGwpDQo+PiArew0KPj4gKyAgICBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUg
KmRldjsNCj4+ICsgICAgaW50IHJldCA9IDA7DQo+PiArDQo+PiArICAgIHN3aXRjaCAoIGRvbWN0
bC0+Y21kICkNCj4+ICsgICAgew0KPj4gKyAgICBjYXNlIFhFTl9ET01DVExfYXNzaWduX2Rldmlj
ZToNCj4+ICsgICAgICAgIHJldCA9IC1FTlhJTzsNCj4+ICsgICAgICAgIGlmICggZG9tY3RsLT51
LmFzc2lnbl9kZXZpY2UuZGV2ICE9IFhFTl9ET01DVExfREVWX0RUICkNCj4+ICsgICAgICAgICAg
ICBicmVhazsNCj4+ICsNCj4+ICsgICAgICAgIGlmICggIWN1cl9tZWRpYXRvciApDQo+PiArICAg
ICAgICAgICAgYnJlYWs7DQo+PiArDQo+PiArICAgICAgICBpZiAoICFjdXJfbWVkaWF0b3ItPmFz
c2lnbl9kdF9kZXZpY2UgKQ0KPj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4gKw0KPj4gKyAgICAg
ICAgcmV0ID0gZHRfZmluZF9ub2RlX2J5X2dwYXRoKGRvbWN0bC0+dS5hc3NpZ25fZGV2aWNlLnUu
ZHQucGF0aCwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkb21jdGwt
PnUuYXNzaWduX2RldmljZS51LmR0LnNpemUsICZkZXYpOw0KPj4gKyAgICAgICAgaWYgKCByZXQg
KQ0KPj4gKyAgICAgICAgICAgIHJldHVybiByZXQ7DQo+PiArDQo+PiArICAgICAgICByZXQgPSBz
Y2lfYXNzaWduX2R0X2RldmljZShkLCBkZXYpOw0KPj4gKw0KPj4gKyAgICAgICAgYnJlYWs7DQo+
PiArICAgIGRlZmF1bHQ6DQo+IE5pdDogQmxhbmsgbGluZSBhYm92ZSBoZXJlIHBsZWFzZS4NCj4N
Cj4+IEBAIC0yNzQsNyArMjc3LDcgQEAgc3RhdGljIGJvb2wgaXNfc3RhYmxlX2RvbWN0bCh1aW50
MzJfdCBjbWQpDQo+PiAgIA0KPj4gICBsb25nIGRvX2RvbWN0bChYRU5fR1VFU1RfSEFORExFX1BB
UkFNKHhlbl9kb21jdGxfdCkgdV9kb21jdGwpDQo+PiAgIHsNCj4+IC0gICAgbG9uZyByZXQgPSAw
Ow0KPj4gKyAgICBsb25nIHJldCA9IDAsIHJldDEgPSAwOw0KPiBUaGlzIGluaXRpYWxpemVyIGlz
bid0IHJlYWxseSBuZWVkZWQsIHdpdGggLi4uDQo+DQo+PiBAQCAtODMzLDcgKzgzNiwyOCBAQCBs
b25nIGRvX2RvbWN0bChYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9kb21jdGxfdCkgdV9kb21j
dGwpDQo+PiAgICAgICBjYXNlIFhFTl9ET01DVExfdGVzdF9hc3NpZ25fZGV2aWNlOg0KPj4gICAg
ICAgY2FzZSBYRU5fRE9NQ1RMX2RlYXNzaWduX2RldmljZToNCj4+ICAgICAgIGNhc2UgWEVOX0RP
TUNUTF9nZXRfZGV2aWNlX2dyb3VwOg0KPj4gKyAgICAgICAgLyoNCj4+ICsgICAgICAgICAqIENo
YWluIFNDSSBEVCBoYW5kbGluZyBhaGVhZCBvZiB0aGUgSU9NTVUgcGF0aCBzbyBhbiBTQ0kgbWVk
aWF0b3INCj4+ICsgICAgICAgICAqIGNhbiBhdXRob3Jpc2UgYWNjZXNzLWNvbnRyb2xsZWQgRFQg
ZGV2aWNlcy4gVW5oYW5kbGVkIGNhc2VzIHJlcG9ydA0KPj4gKyAgICAgICAgICogLUVOWElPLCB3
aGljaCBpcyBpZ25vcmVkLg0KPj4gKyAgICAgICAgICovDQo+PiArICAgICAgICByZXQxID0gLUVO
WElPOw0KPiAuLi4gdGhpcywgaXMgaXQ/IEluIGZhY3QsIHdoeSBub3QgdXNlIC1FTlhJTyBhcyBp
bml0aWFsaXplcj8NCj4NCj4+ICsgICAgI2lmIElTX0VOQUJMRUQoQ09ORklHX0FSTV9TQ0kpDQo+
PiArICAgICAgICByZXQxID0gc2NpX2RvX2RvbWN0bChvcCwgZCwgdV9kb21jdGwpOw0KPj4gKyAg
ICAjZW5kaWYNCj4gV2h5IHRoZSBpbmRlbnRhdGlvbiBvZiB0aGUgcHJlLXByb2Nlc3NvciBkaXJl
Y3RpdmVzPyBBdCB0aGUgdmVyeSBsZWFzdCB0aGUgIy1lcw0KPiB3YW50IHRvIGJlIGluIHRoZSBm
aXJzdCBjb2x1bW4sIGJ1dCBJIHNlZSBubyByZWFzb24gZm9yIHRoZSBpbmRlbnRhdGlvbiBhdCBh
bGwuDQo+DQo+PiAgICAgICAgICAgcmV0ID0gaW9tbXVfZG9fZG9tY3RsKG9wLCBkLCB1X2RvbWN0
bCk7DQo+PiArICAgICAgICBpZiAoIHJldCA8IDAgKQ0KPj4gKyAgICAgICAgICAgIHJldHVybiBy
ZXQ7DQo+IFlvdSBjYW4ndCBzaW1wbHkgcmV0dXJuIGhlcmUsIGFzIHdlIG1heSBiZSBob2xkaW5n
IGFuIFJDVSBsb2NrIG9uIHRoZSBkb21haW4uDQo+DQo+PiArICAgICAgICAvKg0KPj4gKyAgICAg
ICAgICogSWYgSU9NTVUgcHJvY2Vzc2luZyB3YXMgc3VjY2Vzc2Z1bCwgY2hlY2sgZm9yIFNDSSBw
cm9jZXNzaW5nIHJldHVybg0KPj4gKyAgICAgICAgICogY29kZSBhbmQgaWYgaXQgZmFpbGVkIHRo
ZW4gb3ZlcndyaXRlIHRoZSByZXR1cm4gY29kZSB0byBwcm9wYWdhdGUNCj4+ICsgICAgICAgICAq
IFNDSSBmYWlsdXJlIGJhY2sgdG8gY2FsbGVyLg0KPj4gKyAgICAgICAgICovDQo+PiArICAgICAg
ICBpZiAoIHJldDEgIT0gLUVOWElPICYmIHJldDEgPCAwICkNCj4+ICsgICAgICAgICAgICByZXQg
PSByZXQxOw0KPiBTbyBpZiBJT01NVSBwcm9jZXNzaW5nIHdhcyBzdWNjZXNzZnVsIGFuZCBiZWNh
dXNlIG9mIFNDSSB5b3UgcmV0dXJuIGFuIGVycm9yDQo+IGhlcmUsIHdoeSB3b3VsZCB0aGUgSU9N
TVUgcGFydCBub3QgbmVlZCB1bmRvaW5nPyBPciB0byBhc2sgZGlmZmVyZW50bHksIGlmDQo+IFND
SSBzYWlkICJubyIsIHdoeSBldmVuIHRyeSB0aGUgSU9NTVUgb3BlcmF0aW9uPw0KPg0KPiBKYW4N
Ck15IGludGVudGlvbiB3YXMgdG8gcHJlc2VydmUgdGhlIG9yaWdpbmFsIGJlaGF2aW9yIGFzIG11
Y2ggYXMgcG9zc2libGUuDQpUaGlzIG1lYW5zIHRoYXQgaWYgdGhlIFNDSSBhc3NpZ24gb3BlcmF0
aW9uIHJldHVybnMgYW4gZXJyb3IsIHdlIHN0aWxsDQphdHRlbXB0IHRoZSBJT01NVSBhc3NpZ25t
ZW50LCBidXQgZmlsdGVyIHRoZSByZXR1cm4gY29kZSBhbmQgdWx0aW1hdGVseQ0KcmV0dXJuIHRo
ZSBTQ0kgZXJyb3IgaWYgdGhlIElPTU1VIGFzc2lnbm1lbnQgd2FzIHN1Y2Nlc3NmdWwuDQpIb3dl
dmVyLCBpbiB0aGlzIHNjZW5hcmlvLCB3ZSB3b3VsZCBzdGlsbCByZXR1cm4gYW4gZXJyb3IgZnJv
bQ0KdGhlIGRvbWN0bCBjYWxsLCB3aGljaCBjb3VsZCBsZWFkIHRvIHVuZXhwZWN0ZWQgcmVzdWx0
cy4NCg0KSSBhZ3JlZSB3aXRoIHlvdXIgcG9pbnQuDQoNCldpdGggeW91ciBzdWdnZXN0aW9uLCB0
aGUgY29kZSBiZWNvbWVzIG11Y2ggY2xlYW5lcjoNCg0KI2lmIElTX0VOQUJMRUQoQ09ORklHX0FS
TV9TQ0kpDQogwqDCoMKgwqDCoMKgwqAgcmV0ID0gc2NpX2RvX2RvbWN0bChvcCwgZCwgdV9kb21j
dGwpOw0KIMKgwqDCoMKgwqDCoMKgIGlmICggcmV0IDwgMCAmJiByZXQgIT0gLUVOWElPICkNCiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOw0KI2VuZGlmDQoNCiDCoMKgwqDCoMKgwqDCoCBy
ZXQgPSBpb21tdV9kb19kb21jdGwob3AsIGQsIHVfZG9tY3RsKTsNCiDCoMKgwqDCoMKgwqDCoCBi
cmVhazsNCg0KV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgdGhpcyBhcHByb2FjaD8NCg0KT2xla3Np
aQ==

