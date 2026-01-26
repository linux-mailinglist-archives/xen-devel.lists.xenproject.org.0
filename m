Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBuzJdQUd2mHbwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 08:16:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D77B484BFA
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 08:16:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213319.1523807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkGpj-0005WP-65; Mon, 26 Jan 2026 07:16:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213319.1523807; Mon, 26 Jan 2026 07:16:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkGpj-0005Tr-3O; Mon, 26 Jan 2026 07:16:23 +0000
Received: by outflank-mailman (input) for mailman id 1213319;
 Mon, 26 Jan 2026 07:16:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I0MJ=77=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vkGph-0005Ti-Rn
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 07:16:21 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e75349cc-fa86-11f0-9ccf-f158ae23cfc8;
 Mon, 26 Jan 2026 08:16:17 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 DM4PR12MB6543.namprd12.prod.outlook.com (2603:10b6:8:8c::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.11; Mon, 26 Jan 2026 07:16:13 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2%2]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 07:16:13 +0000
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
X-Inumbo-ID: e75349cc-fa86-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cl5QAU4Vf1ue79bGf/sa4OTH3JqUyGIj44N93G7hc1h6rOtUtbksqEivpQuMbOAawwwokaUwoXBJN2vXblZzLrtgCd5qTYeAzXHYwOj/nouSzNrsMv1uxhdtVDHJS/V6HJDmuKAxMLCAHj/PSAR2ATIPXyZ6dWIAU5zUys+rpoNvplO764x382KYd2JmuRLHNaA+M886yKmEvazJXYHwp1a92DPLY3u0iz+wrcit/ZwYCIrCNAC2Xex8jY5EVy7Qu6YjCW2Lr2lAzrwPzLJw8XhaXlmiFdip4p3+y69LuxrmoPvLHvlfrT0fbVJbf+LBJnCfUB66Rba1fSc1m7t+iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwgyqd+lH+cfCzFk+ov4iAD3iv/TFfNAbBtfRsbuSvM=;
 b=x+H0FbnLPafzbFtZ4sjaS8Q/9eccCVCBDIS0DoEz/QXrV0JrpLvwEC6bFADm2pVHHm6Kb+PaIpo3BUEq7P+l2qBXrKXjFj5y2It+rfaKIi0sKYyL1brjsUfUiuDfU2ehDNPqN3fr6iafeofa8UU8BD9cVLhkCN54P+NeyxE2XZe7JBUoQxGi+Pi/dGIbXuMugc9fJMBSrtb9g9D99kXy01YeMPgU+vHXzeq+gLQIngDpFiiCYGrVFoDP+MIbjQes7h3+EQqpqFBlSE06d2Fp/5NyVjxw4eJOE2uiys3tMe3GbWlUhaNQzoOw2cJPUsgK5dNbItAg73DqQPVbkCNE9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwgyqd+lH+cfCzFk+ov4iAD3iv/TFfNAbBtfRsbuSvM=;
 b=gjd1oEk/plOB3QQpjuALiVuDmswDRB3buHGWMZxIB1OEWMUJmt/H2OWEyeLrJDmWJm9JjfHUu7g5tgBTdboxfFc0JaH8rBRrtfH6fbKjvGwhzPXT6I5HqFi5biemvriujYkiP5/2wF0/PQwVK5HDPlHV5mEPeUavNyjR4/8OMv4=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: RE: [PATCH 3/5] cpufreq/amd-cppc: move driver data into policy
Thread-Topic: [PATCH 3/5] cpufreq/amd-cppc: move driver data into policy
Thread-Index: AQHci4OE/XB6ICRJE06j5TZK0wfV/LVkD9kQ
Date: Mon, 26 Jan 2026 07:16:12 +0000
Message-ID:
 <DM4PR12MB8451B7E9E59CFD4865F0BC89E193A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <ac56e199-7c03-4e97-8238-91d23b0391e2@suse.com>
 <519e16df-150a-4336-95dc-b26b8332a884@suse.com>
In-Reply-To: <519e16df-150a-4336-95dc-b26b8332a884@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2026-01-26T07:15:33.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|DM4PR12MB6543:EE_
x-ms-office365-filtering-correlation-id: b390457d-b560-4ff6-ed69-08de5caac99a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?TyswM2t6N3RZa2JNZmhWMjVJUm1hTzNoU3Bwd3BjVkFteHdSNDd3dWZYdmhX?=
 =?utf-8?B?djZyRWw4c25pM3JiMVdaZEdLWjMzZyt6eVdDM1c1bUhvU09vWUpsNWp1a3g0?=
 =?utf-8?B?UHc2dkFxTjZMUlFOYnVDZUlqbit4ZTN0bi9DQy9EbDBZQXIvQjdqQXE4NEJ5?=
 =?utf-8?B?NzRhczdPeVdDSThTdHllUXJ0ZFFLeG9yOVZpRGtoaGdSTU9SYWRzalFaNWJ4?=
 =?utf-8?B?cVNpUWpkN2lTelhCS1Q4YVgyUDhGOC9HQnZIWEQ4K0VWZ2dvazduaE90Y0xt?=
 =?utf-8?B?RU1rdmFEdVdaZ3Rjb0hlc1VianFRRlBJajhoL25tQ3duRXNOSkRueUw2OXht?=
 =?utf-8?B?eEMzV1ZvRWZrNklLRzFncUo2OTExSDBZelJ1bFdxczdwTWY0Ui9zRnR3MDFI?=
 =?utf-8?B?UThqUThXelNGeUhYRXdKTVgySjFDTWpleFhBR1BIUTEwcmNvKzFzK0ErcnMz?=
 =?utf-8?B?MVBuOFVUTFFiSDh2MTRnMDJVMUUvMFNDYXFncTM3U3cxQ3hpeUd3SmVRdUk5?=
 =?utf-8?B?U0s4YTQ5RFZaVnZWMjNjdkhpVFQ2Z2NqN0k3RWdtY3JWZ3dRYjZwMGVWSStX?=
 =?utf-8?B?aGFpQytNZEN6S3h4dzVRZXF4NXhxcU50VUZWRzJjeFhXMVlOWURiWTFaUkxo?=
 =?utf-8?B?M0VyZEhYUlNONGdmSVl2aWZWckdTQWRBRklDZCtkZzYwbTNXWFRRT052VWJ6?=
 =?utf-8?B?aU5HNmw3ZFM5d015UDFrZWNoaXNuSWlMYTJlTUcyQVZkc3dXcmJCYWExczRa?=
 =?utf-8?B?OEVyMzJMUW1veHVXRVVVc3dyUzZNRGRCNGpUWTNrOHArTzcvRUNlUEVBbVds?=
 =?utf-8?B?UVB3VTU2aWRzUGpmTWI4c0MyRUVNeHNnVENoQUg1bXo0U3RUSTVIeFFjT0FQ?=
 =?utf-8?B?dGtvU2JrakQxT1FML2ZTVU9VaWtHc2txMm1pejdHNWJDYXRhWWttZndLQi9x?=
 =?utf-8?B?RUErT3diKzliZ3YrTFpHMnBadzZsdVdTeHNNOHptSGFkWGppakl0WlFpcWhV?=
 =?utf-8?B?TzZ6dUw1d3ViT1NNTzlIWWhRTnlIelZzWUpSdllyTnU5d0NEeU8yR2lOS1BG?=
 =?utf-8?B?RHNxeTJPUFFkc3lTdFpJVmRpOVY2cW43Zk5DeVYvU01sbUk4bFcyRmJTVmhO?=
 =?utf-8?B?ZThEMHN1VDhHSXlLTGVBL2JLSXNMV0FxdjRHYXlHemErRDhueENiTmJpaEpB?=
 =?utf-8?B?UXdBM3VqY0p6dytNc1dLQUN6SDVhYk54ZjQyOC9rV1MrSFFsWDNkY1poVmd1?=
 =?utf-8?B?RjlqcVc0dDV6MGtUYjNvRW5OQ2ZkMmJYKzBieHE5L3Zjc2hGZUl6R2VkZVpk?=
 =?utf-8?B?WENhV0Q2UGxaL202UkRZbUoycWp3V0p2d0VtNk43YmR1YlFjY2UwNVNyUkNL?=
 =?utf-8?B?ZEYzWHhKQ0FlQlVZL3N5eXdXWEJrWXJ1V291VDVxQURzR05DQUtZbjd2aFEy?=
 =?utf-8?B?Z0Y2Mkc2dVhTT1JkK2FqemgvVDkwVXU1dld6R21YQUVBYTRxU09ESzJmRWk0?=
 =?utf-8?B?bmQ4N3BQejlGY0gxUzM2QWdmQTBrU1RVcDNIYXFSa2JYbUh6UVR3Z1lacWJG?=
 =?utf-8?B?cU9WZ2J3YlkzemNaZXZmS0p3NzFZQmw0b3U0Um8wSkxsYitWaTZ3YnBpYmYv?=
 =?utf-8?B?MjY3bkRqRWhtZGMzR0V5WmtHMW8ySTBaM0RMeVpQVGJNNS9aYWZMTVdHTkg2?=
 =?utf-8?B?cVNLU2gxYzdkbWxUajZScVRWUUMvdXhQQUFmM3BoRGlKTnR4czVtT1NQb3VD?=
 =?utf-8?B?Qnp4S1NCTGNwTjV5b3RmcVByeGxoZXIrTkVwZCtId2I0aFpBS2JCSG5uWkJI?=
 =?utf-8?B?TlRuT0JrNXgyWWdBTVh4Z0Zhc3psV3Q2M2I4akRxVTVJM3E0cVB2TjNwT0VV?=
 =?utf-8?B?Q2E0TlA1bGNQNU9ES1E5QXRtbUEvVHBSRlZ5cXdKM0Y3eVlNM0RkeFo3VktR?=
 =?utf-8?B?K0oxWWZTZldGUFdETVEycVl2NHVONnh4dXFzRkVueTdkM3pWOWNlZFRveVNl?=
 =?utf-8?B?MFFVUS9WeTRYTUJKN3orS2tObXZjekticHVkV2UzZ1R5VGhSTWk1TStNb3Zi?=
 =?utf-8?B?SUo3dHJSVC9GT0tFTUFzS0dPWEQxZ1pINE1xTlJXSURrOGNJbWhhalc5TlRW?=
 =?utf-8?B?THZYSDZsM3Y4cy9KRFk0VFpNbzMrbk9OUStRRXptaWhMSlpacGJMZE14bjN4?=
 =?utf-8?Q?dZI0L+9gDtlfpzvgvEXxKw8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YTVudlVOSjNoL3pKK2xqSkh4V254WEowSmppM1loT3c1VnNJbHJPSzAwUTBU?=
 =?utf-8?B?eXlPdU9WMEJxTGNNN3VLOWMwN3YrWHZwZ1Zac2Y0VGpVZzJXUDBTbkJVWkE5?=
 =?utf-8?B?Qm5jTkRObEs0cTRpMjBSUFhrUVVtbXFUWkVWcHNDK1M5eVhPZk56WGxnWWJv?=
 =?utf-8?B?U3ArZlI5NFpMenpoeG1iZU44K3M0NVJJampybzhoUWRhUWVhdnBGQzNkZ09M?=
 =?utf-8?B?QVNuVWJhZWYrQnpVZ2RsSVMrMkNFQldkTU1LVEZrRE01VHJkZVVMclplcFZI?=
 =?utf-8?B?bEVSZlNjRHlnUVM5c2FLNlYxWWRpSU5XOHk4cmpENk9pVXZtb2twaFJ0UVg2?=
 =?utf-8?B?aDVNMXJoZUJoQmFWaDMvOEJaTEU4RGFSZ01oak1XOHl5T0NsMWRoUWpDSGFz?=
 =?utf-8?B?cWJjOThlZy8zV3QrdVZzTTB5SWtaandFR1Z4S1JJanh0L0pOOHpRVys2RGNJ?=
 =?utf-8?B?MndkbE5wZi9MSXp4blRqSWJRRHhKZUFHTG5nenVuSUJRanltWFNnOXRIS25p?=
 =?utf-8?B?bzJFSWI2S291Y3k3OUMwWGtDL05BQ2dUakluRHVhdEc0QVNDYVhkT3ZZUGJl?=
 =?utf-8?B?bDdRbFRJRldqUEJ5Y3laamMxOFh0b0hJcHZ5L3ZXdFZJelVTNzJ3cFpKelV3?=
 =?utf-8?B?bm5uZmorNmFTWHhid1RlZWRsU1FqcUF6OEJSLyt3RWJ2Vm5mYUNycVVVaGJG?=
 =?utf-8?B?RzNwQ0d1aGNBeGtLY3VyMTVWUy92Smp1Y3R3WERMRGVmY0tsbHRQNHpQNU15?=
 =?utf-8?B?eWJnY0pyYjJJcGkvdzE4dEJjOHpvZ3l1QlBTWUVTSnhGcVdIbXR2Z3FMSm01?=
 =?utf-8?B?NjBjaUw3L2xSbDFnSnJraFBoL2k5UkJ2NjAxajcwejV4Q2E1ZitNc3FQUHQ4?=
 =?utf-8?B?c2oxeWpBZ1RCc05IcWllakpmOEVOMTV2THU5MTZKN2dnNHlCUytZREZzVVU2?=
 =?utf-8?B?a3ZQdFB5dzZjZFVjcDFDN3BBSVhoZmtlQUdHME1BcGVmbDJhYkZiMkpLbW51?=
 =?utf-8?B?STlzdGZHVDErWC9TWjAvempObk9jWE56Ly9STHAvMTFDdyt2eVQ1VmM4SjVH?=
 =?utf-8?B?K2VXUnlXR0VCSXVNbFdBWHB0ZU5TdUMxSE1ERHgyWXBVQzFWQ1FPYkJXc21Q?=
 =?utf-8?B?Y2d2V0k2TjBlWm1taUZpaEY4MVBVeU0yQzRrdGowTDlGUXRZcVpja0Nsd3ZY?=
 =?utf-8?B?WmxSMHJEYUg1blFVeGtZTEhva0FubGxJVzN3ZGkxdnM4VTNGZ043TnBkUW5J?=
 =?utf-8?B?MUhBdGxqMDZXNmxUblo4aCt2eXJSOWhZVkllQTdrMHBsVmtpVVY5SCtsVVVD?=
 =?utf-8?B?UlhHT3FCdVRCUC9rWEgwZFRqTHM1UUJuYkJ0SnNOc2IvZkJxNXhINFpKTnhY?=
 =?utf-8?B?Z3ZJZUVucWlXWFBYank0ZTM1NTRSN1Z1dGlsOE5oRW1KQ2w2SjNjLzAvQTVG?=
 =?utf-8?B?bDkzTDlRSHMrM1ZDd202bzhKNzVMZnRFV0dCMDVneUN3NWQrcHZGUERWY0ts?=
 =?utf-8?B?WFF4SDJJTWszWUNtWnRZcTZKaHNFNCs4aE5JUHpSWXFVM3NuVUdWQU1VMU5O?=
 =?utf-8?B?MHFUNitjUFFLL3F0Zk8rT25LTTlvUElyWHZmNi8yMGF4a0VkRXBEMVNiOXYx?=
 =?utf-8?B?dHJGZDJmZ3hvMmRGcW9RK00rV1RwU1ZpZm5QL3dvSUxGb1dUclVweEJRaVlK?=
 =?utf-8?B?aFBrcGRWY2hXTDFLRjR3QWRuNG9lanZnTklGSk0wU2x5MHdReS81SzhidXAv?=
 =?utf-8?B?OExpK2diRUwrOGJtR3g4a1JiQUpkcXNIQ3lVeDdFM0JSMTRVRmZiN2NWdmpj?=
 =?utf-8?B?bm1XSS9UU3lIcDZtbGlVWThuTzA3cXhQdWdpRDZaa0szQnBzOFVxS1k4R3Uz?=
 =?utf-8?B?TjRQNFBtNG9oamorQzM5REJ3RVRvWTk0UTNoRExvSkk4SmV1bWhOcEFldnpF?=
 =?utf-8?B?bG5rR3NsbnA3elowaHRveTBHU0tTdWtPdjJNbU41d3dtZFcrMmFWdVI4OTJH?=
 =?utf-8?B?cndrcnd2dk9CMXVMVWhVTDVmMWFwSTVHMEQ5cUx0cEJTS2hFVEtBYXArV2Ri?=
 =?utf-8?B?bXJKaThnMllubVdnVmNkNjJsQ3lzRWxuNHlkaVg2Q2Jnd2hMU3FybjM0dHg0?=
 =?utf-8?B?UmIwK0lQb0t1NHd1eS9ZUEFLVENNK28zaUk2K1hsMy90bTBBNnJ6aXFlblE3?=
 =?utf-8?B?ZVRVSEk4ejgrbDg0ekFqckl6M1VDeUhrejRRT1RsN1pYaDhCc3BOYkV5Y2U1?=
 =?utf-8?B?aVprZjNoVHRrZXhmdHNyb2JLbVU0VmFzdWEzTEp0M2lyd0gwbkZiYVl5dkJo?=
 =?utf-8?Q?CXibh/waA0C2REUnyT?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b390457d-b560-4ff6-ed69-08de5caac99a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2026 07:16:12.9368
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: siPtAZj7TJpaZvfxfMUggqMkTa5g8y1YVgISGRRiVAZDfv4LagDcOhcsOaC1DQzCr6eVZWra1s9X6coHW7d74w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6543
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xenproject.org:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[penny.zheng@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[penny.zheng@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D77B484BFA
X-Rspamd-Action: no action

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBKYW51YXJ5IDIyLCAy
MDI2IDU6NDMgUE0NCj4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25u
w6kNCj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0Bh
bWQuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggMy81XSBjcHVmcmVxL2FtZC1jcHBjOiBtb3ZlIGRy
aXZlciBkYXRhIGludG8gcG9saWN5DQo+DQo+IFNoYXJlIHNwYWNlIHdpdGggdGhlIEFDUEksIHBv
d2Vybm93LCBhbmQgSFdQIGRyaXZlcnMsIGF2b2lkaW5nIGEgc2VwYXJhdGUNCj4gYWxsb2NhdGlv
biBmb3IgZWFjaCBDUFUuDQo+DQo+IFRoaXMgdGhlbiBhbHNvIHJlZHVjZXMgdGhlIGNvbmNlcm4g
b3ZlciBhbWRfY3BwY19jcHVmcmVxX2NwdV9pbml0KCkgYmVpbmcgY2FsbGVkDQo+IGZvciBhbGwg
Q1BVcywgb3IgYSBDUFUgZ29pbmcgb2ZmbGluZSB0aGF0J3MgcmVjb3JkZWQgaW4gcG9saWN5LT5j
cHUgKHdoaWNoIHdvdWxkDQo+IHJlc3VsdCBpbiBhY2Nlc3NlcyBvZiBwZXItQ1BVIGRhdGEgb2Yg
b2ZmbGluZSBDUFVzKS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPg0KDQpSZXZpZXdlZC1ieTogUGVubnkgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5j
b20+DQoNCk1hbnkgdGhhbmtzLA0KUGVubnkgWmhlbmcNCg==

