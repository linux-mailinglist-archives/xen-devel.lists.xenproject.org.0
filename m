Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDFDA1D0D2
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 07:16:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877403.1287542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcIOd-00089K-RH; Mon, 27 Jan 2025 06:14:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877403.1287542; Mon, 27 Jan 2025 06:14:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcIOd-00087F-Mq; Mon, 27 Jan 2025 06:14:55 +0000
Received: by outflank-mailman (input) for mailman id 877403;
 Mon, 27 Jan 2025 06:14:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=50Ot=UT=eviden.com=clement.mathieu--drif@srs-se1.protection.inumbo.net>)
 id 1tcIOb-000872-76
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 06:14:53 +0000
Received: from smarthost1.eviden.com (smarthost1.eviden.com [80.78.11.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 040a6f6f-dc76-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 07:14:50 +0100 (CET)
Received: from mail-westeuropeazlp17011024.outbound.protection.outlook.com
 (HELO AS8PR04CU009.outbound.protection.outlook.com) ([40.93.65.24])
 by smarthost1.eviden.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 27 Jan 2025 07:14:48 +0100
Received: from AM8PR07MB7602.eurprd07.prod.outlook.com (2603:10a6:20b:24b::7)
 by PA4PR07MB8792.eurprd07.prod.outlook.com (2603:10a6:102:266::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 06:14:46 +0000
Received: from AM8PR07MB7602.eurprd07.prod.outlook.com
 ([fe80::fbd7:ca71:b636:6f9d]) by AM8PR07MB7602.eurprd07.prod.outlook.com
 ([fe80::fbd7:ca71:b636:6f9d%7]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 06:14:46 +0000
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
X-Inumbo-ID: 040a6f6f-dc76-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=eviden.com; i=@eviden.com; q=dns/txt; s=mail;
  t=1737958491; x=1769494491;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=CAQbx6bVUkOqbYZAAavrHDY9le2cUdZVdJsvPtn/D4o=;
  b=kB2ao8DlIOvZ4hBQRlY/OCXakfY93qR8Lng+56/OSRDthGfcEgfHUzjy
   KN3kh7kuvL2Tm1FaHmWKEipUZsABD67cvgvAm4Kf7St+XViei5qNZ9evo
   XFvS5EN6/Rtpw114yRCQNWMe/S+9SfZykgRJn1ugmvQF+ZxJ+qeRPgaok
   GM+AcgCE1HCiIOUATapSjjTMo7Y6FSVoJ8J+Mi/czVoFLVn9II2FJYS6S
   efliZzHNJhg13NnN1m+nE5w5d5CpjQU34MDl+bg2ziFxxUw4JwGAcjUqh
   mxCx50r6xMfhOWPheI3JkWgTUQ+nshrHF2VKHne80Mp1y6gZw9R6dGQlP
   g==;
X-CSE-ConnectionGUID: shTfnFYfR6eLUQvpLlTfdw==
X-CSE-MsgGUID: cH5UVHijSi6kXONTYd1W8w==
X-IronPort-AV: E=Sophos;i="6.13,237,1732575600"; 
   d="scan'208";a="29566783"
X-MGA-submission: =?us-ascii?q?MDHYPTJJUQEwGh3DCAkM8lnmAAdvGqGRQJQPfB?=
 =?us-ascii?q?Oams2qflgMvrESholn7IHoPmarYjVx4sOELZJSaypGrDwLk9gqKeifIc?=
 =?us-ascii?q?nyavAerdNf/2qcIyWKHPQj6vTpObcpehdGymhxS7MTUwoCvcGmjSBr+u?=
 =?us-ascii?q?mN+nSdoINgLz0Zha+cs26APw=3D=3D?=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vz7irmhebvmJIdFEupMlP6sI9fFeG6uuRnj1pkcX+KIZLfLlOkuIoHTYxVocULQSJpELaizRv5tp9hvG4AOChpE2G0voaTi/GtUKNYV05iwfHJJMBxldooJbXr+gS7xtSv5JPKX3yJfcYnMA8s+7vGvoJmfLv0U1TzSGHCmQYnEudD1u0eibl/BQVCEq2xARdnc2yMjyx5TQ+JVb8ikOxTbXHTR74Y9DECcCK1wqeOzNvpFAfnyRzzWqT9Hd9M/B4bFLAd5FZDYh99JfwsTTIAzzCc63SG7Ns7rGaDBpwQiWPbeSmar2ArhlZiEAm5mL0gnssJKajekXU0BClLUkCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CAQbx6bVUkOqbYZAAavrHDY9le2cUdZVdJsvPtn/D4o=;
 b=nK0Ucq9+Zn610pfTOLHtfLdAIwBoR9qdMZ0+A0PT7No/l7+E4VCdrrOYE1jUQnVbc0ina4mnCBrwrfqSThJ2k0odBsDydg4L7c0QKNmbb3JlWtWTG08ExydX0y8dqzwze7ih7Dv5AJIr6e0EQPgAcszn+sUtxImK5nOKtRF7RFg+YpfHIUTyXWBMpnpzrgnv7uU+wuc5o53mHHOuBetEfTsG6ehym3oYirpYSIHYqKNwCpBs5mOdl5gV9pPQo6T8sPoBJvDj0eod+sg+lA07PELeYMAjxPUVYVrXUdD8KO6wU7grFaub4HPeAUyyAfjTCt7f0CSOv8xGDSL98WKgKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eviden.com; dmarc=pass action=none header.from=eviden.com;
 dkim=pass header.d=eviden.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Eviden.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CAQbx6bVUkOqbYZAAavrHDY9le2cUdZVdJsvPtn/D4o=;
 b=mB3TEOiVqOKR7l/JgM1TtJPqGl/oy/vtHVnvaS+/mUbN33VbWtdxOPXOY0nwhMoswGV4q8FNVja9CB0svygHPrRut6Uz9WBrj292cRZZv+fq5O7PIe0SrHkp1Iff7DIQduwFuAskrAt2lD+VHmu/Zo0vA+P3Id4aKX0cFedI8ShqV1KjUMX4BEk9Nxyzi4wkslaBQ164xttWIhVOZU5bS6EQVoWpo8JOcYETWCSlmVKIXeR4ovevf+hLqYrHajI4mueY7DfPDThk4JUl45wnXtmZgHQ9nWE92/pPWD8ArnE9THGknOUhhlx6TdCxwhy4PizUkPGlcSqeGJRUjHozZA==
From: CLEMENT MATHIEU--DRIF <clement.mathieu--drif@eviden.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Yi Liu <yi.l.liu@intel.com>, Markus Armbruster <armbru@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>, Anthony PERARD
	<anthony@xenproject.org>, Gustavo Romero <gustavo.romero@linaro.org>, Jason
 Wang <jasowang@redhat.com>, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Alexander Graf <graf@amazon.com>, Richard Henderson
	<richard.henderson@linaro.org>, Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Bernhard Beschow <shentey@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
	=?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>, "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Marcel Apfelbaum
	<marcel.apfelbaum@gmail.com>, Alex Williamson <alex.williamson@redhat.com>,
	Paul Durrant <paul@xen.org>, =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?=
	<clg@redhat.com>
Subject: Re: [PATCH 6/9] hw/i386: Have X86_IOMMU devices inherit from
 DYNAMIC_SYS_BUS_DEVICE
Thread-Topic: [PATCH 6/9] hw/i386: Have X86_IOMMU devices inherit from
 DYNAMIC_SYS_BUS_DEVICE
Thread-Index: AQHbb1T1v1PK9knjfUCFEoU3xo3CqLMqJsYA
Date: Mon, 27 Jan 2025 06:14:46 +0000
Message-ID: <34e2ee31-2b06-4e8e-ab94-d9aa3f12e909@eviden.com>
References: <20250125181343.59151-1-philmd@linaro.org>
 <20250125181343.59151-7-philmd@linaro.org>
In-Reply-To: <20250125181343.59151-7-philmd@linaro.org>
Accept-Language: en-GB, fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eviden.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR07MB7602:EE_|PA4PR07MB8792:EE_
x-ms-office365-filtering-correlation-id: 569286dd-ee53-438d-1aae-08dd3e99e5d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aW9UblBwZ2R5RW1tb29OMFhzWlhyUkowN0JzdUNLcTlDRGxVamlrOTVrRGVB?=
 =?utf-8?B?cDdjSS9SWGRSdU5pUzBRT2VFK2hyNmdoZUczWWlpYjFJYlY1ZHc4eks1S2pL?=
 =?utf-8?B?SW1ZMGJLTmNJT1BTTTgwencxbjdER3NVbkNRSXlCc1dFMGVLQXlHdFlPYnVY?=
 =?utf-8?B?OENLMUFPNWFvTWE3UzRlTEx0bFpMZzk1Ym1tYzQwRDcwYTJYODhuM2FDdGlB?=
 =?utf-8?B?T2Z2amRzY3lOZmgxaUxkMElreXpsaGk0dHpjaXRzT1YzejViUC9BRVFvRndJ?=
 =?utf-8?B?YmJhSnY3OTlWZnh5RUZ1M3VSN0U3Y2kzTGx5aFNKeXFOODhTTFNGT1VNWEJk?=
 =?utf-8?B?WWJiaGcxUEgwaVFaRHJZRncrWGQ0dWgxczhyek9aU2hZL2owRUFiWjN2MW1h?=
 =?utf-8?B?MXZaM1RuNTJJVDloRjlDSzZicUc0VlRrSmNuMmlOZ2N3UkQ2UFFOeVhKYjZh?=
 =?utf-8?B?Y0o0QnBRTlpXTmhyVUVIdGQ3OHZRTGJFWnRyUmtyUCtidTB1YmU2NjkzaW8v?=
 =?utf-8?B?U1dOMHhyYTdBdEl1WEtNcmk0Q2liQWhSc0xZdjdwdG0vQkcrTFp3YVJBZTUz?=
 =?utf-8?B?Z0tXdERhVU84MXR1U2k3NmtFYy9rSlBKSU0ySWMvc3ZNRWtrYUFkMjY3bkJp?=
 =?utf-8?B?Z0dmNVBxRDlWZWNQM2pGZ2h3REN3M29yZEhKemdpMjBFT1VBRU1oN0JxRDl6?=
 =?utf-8?B?ellvWXJzSFR4ODY4c3d5dFlnbFRSR2ZyMXR2NytMU0F2cUFXVi9YMlI3elJk?=
 =?utf-8?B?d0ZCdW4vQ01ReVhwSDQvbHIrSVNiejFxOUVFL2k4WmFhSjg0ZnhuanpQRWZK?=
 =?utf-8?B?T2IyTzR4UzBEaHZvVUhqc0tDOTNjMnNXZlAyUi85d1RkRm1qOUpDYU9aSFUy?=
 =?utf-8?B?Tm5PVkJvRThXeU92ZDVCcUMxZGdnc1U3eUtkK1RPNjZQakw3UlVhN2xXVU14?=
 =?utf-8?B?ZnMxQ2NheVFUQ0xPNlpwcm5Eb0JJVWpOYXQ4bzQwcVRKcUZIeUVSUHhvRi8r?=
 =?utf-8?B?TWcra2RKOVZFbXczMFlCOFV6Q1pjMGFxckl0alhObXpYWHNiSkg1V2lUTWVJ?=
 =?utf-8?B?SkhLZnY0dFNIaG1sRS9Ka1ZIM2xNcjc1V2xtMGIyZk5vQXF6ZWVrekd3ai8r?=
 =?utf-8?B?QU5ySG5ESFR4Zmh2R1p1YWZ4QUpSVVlHMENvdDQ5R25LRGhmT3pLWS9HZVVW?=
 =?utf-8?B?SW5TOGNFemlRdmw4UFJrZ2d2S1FXS0ttcmhRK0hLcUlzeCtWS1VYR3JYWE51?=
 =?utf-8?B?aVhBVG9STy9WaGtRaG03TDZ4T1BRZ1pJRTRhNS9reXgxK2g4cE8yU2tSMm9B?=
 =?utf-8?B?ZnZmaE1SY0Ezb0xFNERFcThuaEREWEF3ZW9pNVNWUzZObnFwemRSRGp2S3E5?=
 =?utf-8?B?TWZEaHZ4TlJFS1p4VWJ2cVFIMWNLSWUrZ25DOUZKTjc2STZ4Ylh2b0VieTVH?=
 =?utf-8?B?NzgveUJxeVJSRUtsU2YvMUlLUlJCUGZuNG1UZXk3UG5mV0tOdDJVZjRmaGZO?=
 =?utf-8?B?L0JDVXk3aDN2R2hYL0hVc0ptY2V3b0hPaERnU2tNQVI3RlZNZzlXd2QrSVJJ?=
 =?utf-8?B?VkpqWEZDVGJJUkE2RWlVOHRNNWhHcWRsL1pGdjFTbFp6djFNTGxTSEVtN05V?=
 =?utf-8?B?WXZXcnJLNnEwSkN4T05hS2NiOWt6K3prSmNzOVczajI5cUZac1BWcG5PS3F2?=
 =?utf-8?B?Nmw5d0VLOUM4YUhtOEhKY0krVE9NRGJTd2dEWVBXMmFHaW9uWWcrVXk4M3Jy?=
 =?utf-8?B?ZXV3OEJOeEpHL1Fjbjljc0dBcmthM24zMjhTRm9QQ29ocGpuYTJOS0lHcE5Y?=
 =?utf-8?B?Q2I5d283eVNndEVFWlUyZjVwbHR3Tm5jWlpsK2hkLzZSU0pFcmlCTzlYZFVj?=
 =?utf-8?B?TDdJczh2UnZrZHB3aG9Yc0lXeVo3bWJPb09nc0FXQndvR3VTdlpJT0szMXJi?=
 =?utf-8?Q?Q6UTWsnXOvXdPlZCQcSnQ++Q0LUQ5OvI?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR07MB7602.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WWtHRmhZWFlJZm52MVhGNHZwQ1BpenJrSVhMdmZVQ2FJS3k3ei91TjBCMVRw?=
 =?utf-8?B?K1VTN09qVWNGTy80SU5LMXdoSGQyVytTS3dBeTBkQ1B0dXhEMCt2QTBSNjN6?=
 =?utf-8?B?bTByaUlLSXNxV0lnaFZlSitNakpQRmhrWHI5Z3hNb2NoSldZbUhUcUhXWlNr?=
 =?utf-8?B?UDNsamJjMGV6ZXdUcm1maGtLZlpwOWgxbXhPZlRweitZSzhoQnFJdG1FeXRG?=
 =?utf-8?B?VlJIY1p0VmVJbmt0THlTR1QzZ3dFK1RGZVgwaG96WmpuSnVPNDhOU0p0MlVx?=
 =?utf-8?B?M1lvOWd0RFdvb2d0TTJVK2xvK05Uc3B3MS9rL25hQ1ZRUFArN1NhMzVEU3VQ?=
 =?utf-8?B?VzdKL25QbmFyZmMvL1labE9nVGFjTjkwUTRXYWFIaCs0S1NsMWRHc0tqODFP?=
 =?utf-8?B?YnpROHdhd3JXZlBDang5VFBHcXhwSExZNFQ2bWM5QnhmME0rRDhNb285VUda?=
 =?utf-8?B?Ymx1cVJBL1JUczBFRjM1NkF0WnByMWkvT0N5NFRHNlBpWDBCZlFxdVQyQXJl?=
 =?utf-8?B?UnNSdS8rSWZmZEgrM2lCL3J3azc0VFRYcG84bGJpSmozZjloa0VtL3BDT0kz?=
 =?utf-8?B?MFN6M2pMNDBkVkJ3bjlWd0FVc2IzanpNUVp1anJRV2tUd05jekJqUk93R1pv?=
 =?utf-8?B?RHQxcENoTG1nVzNUQ2VONUlodW1OU2ZlSW5UWjVXMWFqNy9YaWlUR21Mby9P?=
 =?utf-8?B?cGhPUDhIc3oxNy9IcTVvNG5pOTZObElQVSt1RmM5T1UrTTJKalNoZzlGekJl?=
 =?utf-8?B?dVZ4L0x5Ni9hVFRvTXdEdWRFMW4rc25aNmJldlY1T2NjRlpQL3JoZkNGTFpV?=
 =?utf-8?B?QjNuOGZkNkV6VmRqdkN0YnBnbkxIZTg1d0ZNUC9Nbmw1WjVzM3ZzUVlXZEoy?=
 =?utf-8?B?dWZGRG1DcjVXdnMrekxLVWF4QVF0Ny9lWVlqcUFiTXRaQ1VmdkZZRU5PZnkv?=
 =?utf-8?B?QjVyVzdtZFNibHhkWVRrd3FEdnEzUklCNGNsdmZyOW13MDFPZHJzT0Uvc0xK?=
 =?utf-8?B?eXdkZ2Q0VUVVUjVDTUJ5T01FZXZhL3V6NnQxR09YLzJhdHJqdUpkSWFYRWwr?=
 =?utf-8?B?K2lNVkpDWVJIVE11aU9sTWNPejZucDJEWVVnb3BZS2QwVFFpQ053ODNZUjNE?=
 =?utf-8?B?NHRpRURuOXgyb0JlaDhFZGFCMEcvYlR3T2NmUVEzWWFkVnozZEFtek4xL1pz?=
 =?utf-8?B?Mmtpek1rZ0MyTXhCd0Zka3pJM3hLWGdYYVdNSmtFMmJITUxIMmZHaS9LUjk2?=
 =?utf-8?B?UEYySlIxaUYyMUFnTTFsQmF0YXNiay9oNWpFd1J3bGluZXZrcjc4V29FTVha?=
 =?utf-8?B?REczbytCVFVWZWQyU0ZMOTQ5dUJqblVNMEZSUElUeTJrZGhIZG9nSHVuaUx0?=
 =?utf-8?B?VlI2M1c4eVMzblhwM3R1UFNGa3JPck10K21Gd08zNkZnVThRalJiZnB3YmFD?=
 =?utf-8?B?WTI1YURWaUxKd0hvM2U4c21DdjdPV0NhV1gvV1NSY2RIcy91elhXdDBHa2NX?=
 =?utf-8?B?c2VtUFNhM2w2a2lTQnpuMmR0Y2g0UHFPekRnNUpZMEhQOThyY0prWUZtZkZ5?=
 =?utf-8?B?RTc3aXpXbHN5VW8zV1FDekJ6WjF4NzZ6byt5YUV0RGtSSVpFTUNibGJFSGQ0?=
 =?utf-8?B?OFZ3VGI2YWVKMFdadGYvZmgvWGZ6Qk9ZVmtWNklSczFZUURyRzhMVHdQQU0w?=
 =?utf-8?B?NlFUNjRXODFhdWFqdVN0d2NFSzZUYTJEOEYrMHBDRkdzQ2pMc25ZT3Q5Q0dt?=
 =?utf-8?B?MVI2elZ6Q2ZmaTB2dWxzb1lUNVAwTTdEUCthWDdnMkpOdE4vOTlCRnVXcllG?=
 =?utf-8?B?VUVPeFdKRk9uSVczRFlPSytpZytQNDYxYXNyRXFucmlmWE8ySGY5dUpYUzNJ?=
 =?utf-8?B?STNIQlFDMTZHMTNXUi9DekVXOTllei95ektjdFRvbVA5TWNLY0hLMGljbWov?=
 =?utf-8?B?NnUrY3JMT2NWZVc2TjMveGxvNlNieW4xaHhSejRaejFlSkE1WitoNEVjSVdV?=
 =?utf-8?B?QWR5Ti9FK3hpR1hZU29PNDRzNkhUSEcrREFlMy9uU0N2bUFMMUh3cTlmdVMr?=
 =?utf-8?B?QWJvMGtSQmh5cTdJdFJkQ3lRTWVhbzdzZUJDWUQxL2Zxc0lkVmdQMW1acmFn?=
 =?utf-8?B?RGI5a3BBRi9KMXBJZ2Y5TXNmclRueld6Z1NxZ3hKSG94M3JabllmejZCOU5q?=
 =?utf-8?Q?ANH2TrEfaQ5IIa+MgJRPvh4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <45BFD4205F14614EA1B9DBA735457DEA@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eviden.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR07MB7602.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 569286dd-ee53-438d-1aae-08dd3e99e5d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2025 06:14:46.2746
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7d1c7785-2d8a-437d-b842-1ed5d8fbe00a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r+Iqv3HvT5WQ9j2V3PogI2DXM3v5+9AK2QzYmwGtS63IAxLrZtom2VrbQubvsmBtv2R+WzQLO22H40DDvR27QjRzV/fc+Zidv9v8AEa35UMSGbSZpaBIoID61DSKGNdX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB8792

UmV2aWV3ZWQtYnk6IENsw6ltZW50IE1hdGhpZXUtLURyaWY8Y2xlbWVudC5tYXRoaWV1LS1kcmlm
QGV2aWRlbi5jb20+DQoNClRoYW5rcyBwaGlsDQoNCk9uIDI1LzAxLzIwMjUgMTk6MTMsIFBoaWxp
cHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOg0KPiBDYXV0aW9uOiBFeHRlcm5hbCBlbWFpbC4gRG8g
bm90IG9wZW4gYXR0YWNobWVudHMgb3IgY2xpY2sgbGlua3MsIHVubGVzcyB0aGlzIGVtYWlsIGNv
bWVzIGZyb20gYSBrbm93biBzZW5kZXIgYW5kIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUu
DQo+IA0KPiANCj4gRG8gbm90IGV4cGxhaW4gd2h5IF9YODZfSU9NTVUgZGV2aWNlcyBhcmUgdXNl
cl9jcmVhdGFibGUsDQo+IGhhdmUgdGhlbSBpbmhlcml0IFRZUEVfRFlOQU1JQ19TWVNfQlVTX0RF
VklDRSwgdG8gZXhwbGljaXQNCj4gdGhleSBjYW4gb3B0aW9uYWxseSBiZSBwbHVnZ2VkIG9uIFRZ
UEVfUExBVEZPUk1fQlVTX0RFVklDRS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1h
dGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4NCj4gLS0tDQo+ICAgaHcvaTM4Ni9hbWRf
aW9tbXUuYyAgIHwgMiAtLQ0KPiAgIGh3L2kzODYvaW50ZWxfaW9tbXUuYyB8IDIgLS0NCj4gICBo
dy9pMzg2L3g4Ni1pb21tdS5jICAgfCAyICstDQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9ody9pMzg2L2FtZF9p
b21tdS5jIGIvaHcvaTM4Ni9hbWRfaW9tbXUuYw0KPiBpbmRleCA2YjEzY2U4OTRiMS4uZThlMDg0
YzdjZjggMTAwNjQ0DQo+IC0tLSBhL2h3L2kzODYvYW1kX2lvbW11LmMNCj4gKysrIGIvaHcvaTM4
Ni9hbWRfaW9tbXUuYw0KPiBAQCAtMTY4Nyw4ICsxNjg3LDYgQEAgc3RhdGljIHZvaWQgYW1kdmlf
c3lzYnVzX2NsYXNzX2luaXQoT2JqZWN0Q2xhc3MgKmtsYXNzLCB2b2lkICpkYXRhKQ0KPiAgICAg
ICBkYy0+aG90cGx1Z2dhYmxlID0gZmFsc2U7DQo+ICAgICAgIGRjX2NsYXNzLT5yZWFsaXplID0g
YW1kdmlfc3lzYnVzX3JlYWxpemU7DQo+ICAgICAgIGRjX2NsYXNzLT5pbnRfcmVtYXAgPSBhbWR2
aV9pbnRfcmVtYXA7DQo+IC0gICAgLyogU3VwcG9ydGVkIGJ5IHRoZSBwYy1xMzUtKiBtYWNoaW5l
IHR5cGVzICovDQo+IC0gICAgZGMtPnVzZXJfY3JlYXRhYmxlID0gdHJ1ZTsNCj4gICAgICAgc2V0
X2JpdChERVZJQ0VfQ0FURUdPUllfTUlTQywgZGMtPmNhdGVnb3JpZXMpOw0KPiAgICAgICBkYy0+
ZGVzYyA9ICJBTUQgSU9NTVUgKEFNRC1WaSkgRE1BIFJlbWFwcGluZyBkZXZpY2UiOw0KPiAgICAg
ICBkZXZpY2VfY2xhc3Nfc2V0X3Byb3BzKGRjLCBhbWR2aV9wcm9wZXJ0aWVzKTsNCj4gZGlmZiAt
LWdpdCBhL2h3L2kzODYvaW50ZWxfaW9tbXUuYyBiL2h3L2kzODYvaW50ZWxfaW9tbXUuYw0KPiBp
bmRleCBmMzY2YzIyM2QwZS4uN2ZkZTA2MDNiZmUgMTAwNjQ0DQo+IC0tLSBhL2h3L2kzODYvaW50
ZWxfaW9tbXUuYw0KPiArKysgYi9ody9pMzg2L2ludGVsX2lvbW11LmMNCj4gQEAgLTQ4NzEsOCAr
NDg3MSw2IEBAIHN0YXRpYyB2b2lkIHZ0ZF9jbGFzc19pbml0KE9iamVjdENsYXNzICprbGFzcywg
dm9pZCAqZGF0YSkNCj4gICAgICAgZGMtPmhvdHBsdWdnYWJsZSA9IGZhbHNlOw0KPiAgICAgICB4
ODZfY2xhc3MtPnJlYWxpemUgPSB2dGRfcmVhbGl6ZTsNCj4gICAgICAgeDg2X2NsYXNzLT5pbnRf
cmVtYXAgPSB2dGRfaW50X3JlbWFwOw0KPiAtICAgIC8qIFN1cHBvcnRlZCBieSB0aGUgcGMtcTM1
LSogbWFjaGluZSB0eXBlcyAqLw0KPiAtICAgIGRjLT51c2VyX2NyZWF0YWJsZSA9IHRydWU7DQo+
ICAgICAgIHNldF9iaXQoREVWSUNFX0NBVEVHT1JZX01JU0MsIGRjLT5jYXRlZ29yaWVzKTsNCj4g
ICAgICAgZGMtPmRlc2MgPSAiSW50ZWwgSU9NTVUgKFZULWQpIERNQSBSZW1hcHBpbmcgZGV2aWNl
IjsNCj4gICB9DQo+IGRpZmYgLS1naXQgYS9ody9pMzg2L3g4Ni1pb21tdS5jIGIvaHcvaTM4Ni94
ODYtaW9tbXUuYw0KPiBpbmRleCBmZWQzNGIyZmNmYS4uNWNkZDE2NWFmMGQgMTAwNjQ0DQo+IC0t
LSBhL2h3L2kzODYveDg2LWlvbW11LmMNCj4gKysrIGIvaHcvaTM4Ni94ODYtaW9tbXUuYw0KPiBA
QCAtMTQ2LDcgKzE0Niw3IEBAIGJvb2wgeDg2X2lvbW11X2lyX3N1cHBvcnRlZChYODZJT01NVVN0
YXRlICpzKQ0KPiANCj4gICBzdGF0aWMgY29uc3QgVHlwZUluZm8geDg2X2lvbW11X2luZm8gPSB7
DQo+ICAgICAgIC5uYW1lICAgICAgICAgID0gVFlQRV9YODZfSU9NTVVfREVWSUNFLA0KPiAtICAg
IC5wYXJlbnQgICAgICAgID0gVFlQRV9TWVNfQlVTX0RFVklDRSwNCj4gKyAgICAucGFyZW50ICAg
ICAgICA9IFRZUEVfRFlOQU1JQ19TWVNfQlVTX0RFVklDRSwNCj4gICAgICAgLmluc3RhbmNlX3Np
emUgPSBzaXplb2YoWDg2SU9NTVVTdGF0ZSksDQo+ICAgICAgIC5jbGFzc19pbml0ICAgID0geDg2
X2lvbW11X2NsYXNzX2luaXQsDQo+ICAgICAgIC5jbGFzc19zaXplICAgID0gc2l6ZW9mKFg4NklP
TU1VQ2xhc3MpLA0KPiAtLQ0KPiAyLjQ3LjENCj4gDQo=

