Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIhAMtYnj2kvKgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 14:32:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AED136681
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 14:32:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230919.1536284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqtGL-0000dx-GR; Fri, 13 Feb 2026 13:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230919.1536284; Fri, 13 Feb 2026 13:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqtGL-0000c1-Dh; Fri, 13 Feb 2026 13:31:13 +0000
Received: by outflank-mailman (input) for mailman id 1230919;
 Fri, 13 Feb 2026 13:31:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VfN9=AR=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1vqtGJ-0000bv-Lb
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 13:31:11 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41e4382f-08e0-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 14:31:09 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by DU5PR03MB10357.eurprd03.prod.outlook.com (2603:10a6:10:51c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 13:31:07 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::98:900e:f8e2:716f]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::98:900e:f8e2:716f%5]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 13:31:07 +0000
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
X-Inumbo-ID: 41e4382f-08e0-11f1-b163-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fY2xefEZgViHDGeFoYAbJg+0TgCs/WiHTG+hujh1LD+pQWZyh+JHFqQrsYwrCQMrleERX8fSSbApTL/wjMZrrFBWzw8cBHsy8/BUjoY6jrSX/YaoCN6j/LySlo9c4yr62kgg5/97AeBCRYLCRMjJ5yAgG51Yw6KtMbnmF1SIX3k4QuBop94qkU9iO7CfnJgnoLWBP4hUUg9UeRO74wf3FFVtgX/wbnNOJCvD5KHia2SdjKAd/B4wOMwZ78W7BalFjSzu+7hN5FQapx/eslI0rtU0muZRUhbAKwbiIOAVOek9hNd8J3REiQab71WWusMt43eefpmJHSDz1d3IPLirRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4T6cb6vWFA6yEHoMdtiibbUpHbFJNfNV1Fc4K2rpetI=;
 b=n2Soa7sKWT1nibOGr1qtbFm9tR0KDbm5lWPvpFQpR3/ePOaNbHGfiDtxBSP1tSQpLZEdf9vgTXWBO6bEJgukhCOFbhAWMcEjEJEffC1qp1p+zbOdREpWBTn22UEKhVZhNBiJ1ogCw6fjaC0T6y2e5czdJ8Wp7wmj+TXCrFH/xvAzP0DKZXQqtEQPDYtzNaoI9MNOTQRPdjD+cN0PUaCRVtYv5K4lYs9lGYTpLKCLneAkiGPSgKrbv6G8oIsGDVyPm+zZvTNkB5sqm9VwheHvcL3OkZn//HiG/sM0C5hSQvMBwfKU1zJAG+SazYA/+OK+M6LkPiprQseDVJFN1P+W8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4T6cb6vWFA6yEHoMdtiibbUpHbFJNfNV1Fc4K2rpetI=;
 b=rfoWpmrBUPm/Apr95KFtAbb6Pw1Sx7u88nHJAB9+wtYXqYqqmF6wGdTdJnEoqNQdDWkWqI2Za9Cfj9xn3EoiSAlEa+bVZSVB+05QOSwNycilwtIbWSutb8nAaKcojt954GuuSzKvaVnZM3EsTueSSMmvJpgIUn6wueIqMOdzmgEYYRyYbSyoLSeBD+yTFgC+xwGRGktVcRMNK1q24cFuK+x5Ze/7lJlhOHe0j2GAvTbIuAI6qse2VkFbrgJYgMdXmPPJND1j1pPAo7Jdmsug01mBsj3taue8uE/b8LDcWzOATqv2CKatZRVRDM+3bQWq+iNeOIi0pj28tGSdZ3eZYg==
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
Subject: Re: [PATCH v10 1/6] xen/domctl: chain SCI handling before IOMMU in
 assign_device domctl
Thread-Topic: [PATCH v10 1/6] xen/domctl: chain SCI handling before IOMMU in
 assign_device domctl
Thread-Index: AQHcnN0TIpWAusmvHEWrF5RBUFLqU7WAlR4AgAALKgA=
Date: Fri, 13 Feb 2026 13:31:07 +0000
Message-ID: <7b60047e-13a6-4550-bb3a-968969ab033e@epam.com>
References: <cover.1770982468.git.oleksii_moisieiev@epam.com>
 <53251361b05028f4875d4fccec7270749786c54b.1770982468.git.oleksii_moisieiev@epam.com>
 <37cb7d83-9651-4bb8-833f-4d85f8231c6b@suse.com>
In-Reply-To: <37cb7d83-9651-4bb8-833f-4d85f8231c6b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|DU5PR03MB10357:EE_
x-ms-office365-filtering-correlation-id: bc680a3c-a403-4598-f0bb-08de6b04249c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?QWR4OGptTE1kNjJIMDBuSU54bm5DNC9jVXBXVEZHbUNYZXl4SVhRS2RZRUky?=
 =?utf-8?B?RG5RbFlkUjdxYVNadlNhcXQ5dC94dzdrYmRsa2ZReWV4cisvcXJJSW54ZXBF?=
 =?utf-8?B?MW02dXZOQzRhbVhLTWhaQThOQXhzQ3NibWhTVERZRnF4N3hjbUFpc0ZmdEpK?=
 =?utf-8?B?RnR5L0wrYlE0TU1ldDRRQk1KdjcrRmE4cjRTQnhoVzduZUg5T2paa2tVSzY4?=
 =?utf-8?B?R241bWRnaXp5bE9pK0JtaTQ2cWNYV3RZbjhxb0lzS1RIUHd6cEs0VjVXbnlM?=
 =?utf-8?B?bkpieXpXd1pTRitneXVqaURyQ1VmRVRJcFl2Vkwwa1E3QlBzaUlEaXZEWVFY?=
 =?utf-8?B?MlZkQUFEb05ESGVmSUFseGo4N2xRY3U5Q09aYTJOb09WMDVSVUgyMGl1ei9r?=
 =?utf-8?B?eDRHYXR2RWswMkc5ekxKNFUwb0E2d01yTFdXVGtUdCsvbldiOWF1bjBCWDFC?=
 =?utf-8?B?Z3ZXN3JxRUhiVnZvTWhqZGtCVjROWmlENUZjNHJsOSt6ZGJHcjN2MWZFTHc3?=
 =?utf-8?B?RVFpSlVYQzJOeGlmZHZBVzdTdmM4NHFVSlB5eXo3QzVFZXp0SnpnZXFmeEhn?=
 =?utf-8?B?RDdxQ3lOVCtTOUpGMzF6YzhkRFMrVFpuNUhiUm1XRStHaHFwNEJyMEdGSHBJ?=
 =?utf-8?B?b0pTVUxPQm5UeHdWamtBZW11ME1zRlZyWC9leXY5bXlSM3JsaUlGRGQ3MHIw?=
 =?utf-8?B?YTY1eTdCS0xpVTVqb3BQdmI3SVNKMUI4YkN1K2VFajNodHF6RFBaRmRHajlG?=
 =?utf-8?B?eUtyOVRQdEMyVXhzLzBUeFk2dGN3NE84TmZ3b1RNeGl3UTZjUmVCZzRZaG5q?=
 =?utf-8?B?Ty93amJkUDFidlJyaUZWZ2M5V0RucFVTK1Z3ajc1SUJrRTJWb2ptYmswbnJP?=
 =?utf-8?B?dzRWb3VWaFRxc1N0UkxROGhuTUV4cDBWNFNJTWNWL3dubkhvZFBEdUgzUkNq?=
 =?utf-8?B?VmhpbnRqUDN4SWZWcVlBNnRaVlFBd1FhMW04ZUNXcGExZW9KMzlPMTBWR3Bw?=
 =?utf-8?B?WHRjZjA0Z1kxMkZ0UjlhTkFaT05SbkFvelJoblRJZkpGYmRQVHh3UDJwR0FC?=
 =?utf-8?B?WU04MFNJbWtNWHlDRUg1RGlyQVZvc3NmSC9HVVpOTTdLc1dZQTNCbUtWbzNx?=
 =?utf-8?B?UUFuL0hKVlBzd09DSUlKWGU0RCttb2gvK0lXbmJhOEYwMEpxNTU0Vmo1L2g2?=
 =?utf-8?B?eXRrWmxsRUUrTytrU2pRcDFWUEJ3ZlhnOWNhcHJnSmRScjFYS3ZPaG9NZzdj?=
 =?utf-8?B?M3NyYzJNMm5BaE9vM2FVeVMvQjJaQWh3SFNHeWZnVVBjRXZzdDVDT0FxZEFa?=
 =?utf-8?B?UGtXTWNoWmE4ZFBGdFBQUnZFRnpGc0Vlb2oyYWxpVE1TT3U1N2djUCszaVlJ?=
 =?utf-8?B?cHp0VzJ0Z3NWRjBSVytGdGNHc3NiWlVzeTVDNldYU0xOSmdLbWVxTHdLdXUy?=
 =?utf-8?B?ZEwya29mQmVUZTQwUXExOFBHRXUrNzluajJWMTM4WGRJb3lLVHhmSGZkN2c5?=
 =?utf-8?B?cFE4clB4SlBqM2VpZ2tSaXd4VFhIY2tFbFg2eUlZRFU2TlBmdEZ5SGJPVm43?=
 =?utf-8?B?bnliWnYyWXE5M2dRTHZXQ0NLOXBFMnlrRFNvbjlhdXdvMXQ2cGUydkJ5OHJQ?=
 =?utf-8?B?TDU3d1dPMHBRc09WQjRnT1FFaDJUODZnT0M0eS94OStjQmY5OVZmM1ZBZ0k0?=
 =?utf-8?B?bWdnWjErZmQwcytyVDVOeHlBNHhCcmRZSWVkYk5IOW1iUHAwZ2Vxa2pzQXg5?=
 =?utf-8?B?OFdTbnZzOXI5ZEczS2NMdGplUzkwVEdqRWpscVZMSkIra0Y4b0ltVUtDZEFx?=
 =?utf-8?B?T1BhTUxkVW5ISTF5eGdHVVJOYWlHQVdTOVUzU3o0cjgwNlhuMFJreTRoSHd3?=
 =?utf-8?B?UGpxUWh1b0pkenpRNDhRa0hHZ2FBSXRidHdWZnNUVmVFenhjam1DajMzamZF?=
 =?utf-8?B?UWJlZkZwa0p3UEgydmZzaWNENlFLd0tBOUJZbDJtS3dYeklOV3FFLzlpbnBH?=
 =?utf-8?B?ODF2alRKR2xVS2djWGZidzhFTmRTQzBDakpqNWhiN0xaSGI0Rmwxa1NRSWFM?=
 =?utf-8?B?QTFDbi9WMmZLblB6ZlNTdk1qZ2pCVHBDQ3p3SWFkKzhvekUvUWJOVk5hUnFk?=
 =?utf-8?B?cWMxT3hqVEkzNG5NbXRaQXpsalo2K3VJVWRHVnpLOUhJWlpCQmZXYXlQV1Fs?=
 =?utf-8?Q?/CnKruHwnzOhwdXktAAcUQU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RkVyb3BqZEh5emxQTDdmQ2JnTUxyS0FOemFBTlZKOWNlb3k4NVZHTFg4TXJZ?=
 =?utf-8?B?T0JpWUFsZnJVL0d4UlRySkx4bEdlOGZEaVpwS0NuVjNmTEZGL2U2TWtnUVBV?=
 =?utf-8?B?THVxdFEyclJIQm1WSmw1cU9iVkthWFZldnpBYlZpcTJQSGJXM2RwRDI1U3pn?=
 =?utf-8?B?K2NNNmtUWmtEVDNlV0k5RWxYbytyR0lVZ2J0Y0dnR2lyZDMrTTRZRDVVMXFp?=
 =?utf-8?B?WVhpZmMzRVk3U3JxL1h5U0tFSEMyQ1BJeENxcForMUw1QzFuaWxBYnNyS2Uz?=
 =?utf-8?B?eGpib2d5TFFYUWJkQVVOUjFWWDNYczc4VEo3aitCOUppcFNxT2lEZ2RLdzV2?=
 =?utf-8?B?ZU9tU25INXZ3N0RUUWRoWFBUTWd1SUJTdFVOMUt0VTlYRlJEZUtQekdyU0lT?=
 =?utf-8?B?Z3U4OW1PNmR0NzVWeVpQOXYzOTZTckttcXNzZWE2QkdaVjNFcWsreExNMVJ1?=
 =?utf-8?B?ZFZEWFVWcWFCOE0wdTVFWmVIc1Q3Zks0Tnd1TS9aZjkxc0xsamVNVTBhSTlC?=
 =?utf-8?B?UDJjUk83TFdVV0dsZEg1a0k4dkFJbVBvbUU1dDNaSGF3ekVhSGlYdmRDQ29W?=
 =?utf-8?B?ekRnVzlYa0lwanVrOEpWUE1qeWRlTzJsUEV0UlVXVVNFNGJDZjdRUmwzQVoy?=
 =?utf-8?B?VEUvSklYMWhRMk9JdmNpTE5XOC9RQXltU3RuL3NpYnhhemcrbDdZTnJVaGlr?=
 =?utf-8?B?VVBjY0ZXRkdWSTdrczBsNGFHaEtkbEROYWVPR2pTbnpvaTBVQVd3ZWFOY25W?=
 =?utf-8?B?U0p6blRRb09HRjlNd2I5cEFGeGtyaW0xVk44ek9WbU1OL3haQVRyN3htRlFM?=
 =?utf-8?B?Z3QxM0pFVkh6NzdGT0ZvODlCQUxnVTQrM3RzaW4ra3VQWG5FU1JnN2haZmtX?=
 =?utf-8?B?alQvRzdNRnYrQjJOdkhQUE9ZMklnM2dvWkdpaGZTMkJYbmNGK0M2ZzkvQnBP?=
 =?utf-8?B?eUlBVzE1RVJDUDhRdjJNS2ppZ09uYnBLT1VOL0FlcUdERGlBekhyalhvMU5P?=
 =?utf-8?B?MjlIMkVlNkxCNDVqT2I2ZXI3eU8ydUE4bVhGTTNKOTZBTER6dXJQVE0rTVpK?=
 =?utf-8?B?U2hkTklDTHJZRWpKbU9zQXhQNzNvUWtYTHN1dk01eEFiSVQ3SU5PVUQyZkQy?=
 =?utf-8?B?cTVrbVV2Z1lvNXBwd2hTdzJnMEszRTFCcUJNY2diK0NXTWs3ZW1yU2ppMmNO?=
 =?utf-8?B?NDVYUnVadGJQa25nVm1XdG9JZkswVkVUaDIrVW1wRlhWbjhlK3dWZ0NYamN0?=
 =?utf-8?B?MHU2K2VVSXRqaHNiYnBCY0JmY0xKcEtXUU5mbElaRXc0ckE3WVI2KzdXcEkz?=
 =?utf-8?B?TGZNVWdENDlmY1p0ZlpPaStuajNIdlFpdkFCQWlVVk05bTdNNTk1azR4Q096?=
 =?utf-8?B?MkhoNDEwOGs2dmYyTzJoVlh0OVRMWkRRcW5YY3l0aGJjeXBHOTNVRkJYZU83?=
 =?utf-8?B?d05yK0RORkNJcHRmaVpTdmNicGtyc1JhdzFrWjNqeHBOTURKVTZQT25GWkxw?=
 =?utf-8?B?VGUrUmE4M2cyOHZ5VkdKczZGSWx2cXhTZDdmS2tpdnh6Y1E1ZmxrTzQ1dmQy?=
 =?utf-8?B?enNnYTU3Q0R5UEd3SjN5RXJhUlpSMkxjN2V0SHI4bHFhZURUQ2laTFhIb1Fj?=
 =?utf-8?B?d0N0eDZFdlB6OFNvWUt4SndNYzBHVVltK2ZCTm1mNWdWTDB2T1VKTjRrNEhQ?=
 =?utf-8?B?QkI0VEdJSzBab2UrZm5mb3ZuallyeDh5YUk5dkhmdVBqaTh6NHIrVHJpa3Zs?=
 =?utf-8?B?OEl4ZWdUM3ZVcU4rQ3BLWE93WjhtcFZuNkJsT2ViVHZKcG14dVdOYU1BQkd6?=
 =?utf-8?B?OHRyUjIwaC9yNGFxc2hiZHRlN2NrMnluRTdWL2NTSGtvUy9tTkxuZnRSMEVV?=
 =?utf-8?B?WFo0SFh5UDhrbDF3WmV6K1NTOHY4ZVAyUUtTdlN6RlJxT3NoUk5tczEvcUE5?=
 =?utf-8?B?bFovcmw2UzJIYXlWMEprQVlsaHVaVHNPT00vUmNaMDgvUWpDTnVHS1ByekZX?=
 =?utf-8?B?TWJoNGFJRWdkRWJSTmhzZjRmckZiSGZvUlZ1VFB0MTMrUVhUSGJXKzlSTmhq?=
 =?utf-8?B?RFBzRkp1NUVxWVV6V1lYcXBmVGJlK2V6Z243b0tFOGFYcGlqMFZmZ21tMGlQ?=
 =?utf-8?B?ZWI2bWtMSGJEZFF5Z2Z4aitRM01CQjhhTDdaNlljMiswWWRpQ3NRc0RFR0U0?=
 =?utf-8?B?b2hLUUFtRkRBRzE5M25wMmNCMGszcGhHdXZwc0FaSjFCUGlSc0NjZWEzNmxG?=
 =?utf-8?B?VlI0SnFiUE5VUldJYVhidUd6YTFETUU1YlRuU2ZUcURNTlo5VHp4SXFSM3hI?=
 =?utf-8?B?cEtJSWNiYklrelRlSEVKUVhQMEUxTU83cTc4aWJaNFlVK1BIRXJ4bDJJVkRu?=
 =?utf-8?Q?soBXh9i5aEHb4rXY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FD56BFE72D830B48AAA75EA9FAC603B4@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc680a3c-a403-4598-f0bb-08de6b04249c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2026 13:31:07.1245
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j5j1RpaRzYDEp2zA2Ji6oIc+O6OfVWjDlOZYyNcruoHaS2cseuTPdgwN2/QXF4ZBcrHg6eC7ASiKsS4UmEJ3qy8XAmVzPp0fTUzJy7C8QyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10357
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:bertrand.marquis@arm.com,m:jgross@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:grygorii_strashko@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[e6508000:email,epam.com:mid,epam.com:dkim,epam.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 19AED136681
X-Rspamd-Action: no action

DQoNCk9uIDEzLzAyLzIwMjYgMTQ6NTEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMy4wMi4y
MDI2IDEyOjM3LCBPbGVrc2lpIE1vaXNpZWlldiB3cm90ZToNCj4+IEZyb206IEdyeWdvcmlpIFN0
cmFzaGtvIDxncnlnb3JpaV9zdHJhc2hrb0BlcGFtLmNvbT4NCj4+DQo+PiBBZGQgY2hhaW5lZCBo
YW5kbGluZyBvZiBhc3NpZ25lZCBEVCBkZXZpY2VzIHRvIHN1cHBvcnQgYWNjZXNzLWNvbnRyb2xs
ZXINCj4+IGZ1bmN0aW9uYWxpdHkgdGhyb3VnaCBTQ0kgZnJhbWV3b3JrLCBzbyBhIERUIGRldmlj
ZSBhc3NpZ24gcmVxdWVzdCBjYW4gYmUNCj4+IHBhc3NlZCB0byBmaXJtd2FyZSBmb3IgcHJvY2Vz
c2luZyBhbmQgZW5hYmxpbmcgVk0gYWNjZXNzIHRvIHRoZSByZXF1ZXN0ZWQNCj4+IGRldmljZSAo
Zm9yIGV4YW1wbGUsIGRldmljZSBwb3dlciBtYW5hZ2VtZW50IHRocm91Z2ggU0NNSSkuDQo+Pg0K
Pj4gVGhlIFNDSSBhY2Nlc3MtY29udHJvbGxlciBEVCBkZXZpY2UgcHJvY2Vzc2luZyBpcyBjYWxs
ZWQgYmVmb3JlIHRoZSBJT01NVQ0KPj4gcGF0aC4gSXQgcnVucyBmb3IgYW55IERULWRlc2NyaWJl
ZCBkZXZpY2UgKHByb3RlY3RlZCBvciBub3QsIGFuZCBldmVuIHdoZW4NCj4+IHRoZSBJT01NVSBp
cyBkaXNhYmxlZCkuIFRoZSBJT01NVSBwYXRoIHJlbWFpbnMgdW5jaGFuZ2VkIGZvciBQQ0kgZGV2
aWNlczsNCj4+IG9ubHkgdGhlIERUIHBhdGggaXMgcmVsYXhlZCB0byBwZXJtaXQgbm9uLUlPTU1V
IGRldmljZXMuDQo+Pg0KPj4gVGhpcyBsZXRzIHhsLmNmZzoiZHRkZXYiIGxpc3QgYm90aCBJT01N
VS1wcm90ZWN0ZWQgYW5kIG5vbi1wcm90ZWN0ZWQgRFQNCj4+IGRldmljZXM6DQo+Pg0KPj4gZHRk
ZXYgPSBbDQo+PiAgICAgICIvc29jL3ZpZGVvQGU2ZWYwMDAwIiwgPC0gSU9NTVUgcHJvdGVjdGVk
IGRldmljZQ0KPj4gICAgICAiL3NvYy9pMmNAZTY1MDgwMDAiLCA8LSBub3QgSU9NTVUgcHJvdGVj
dGVkIGRldmljZQ0KPj4gXQ0KPj4NCj4+IFRoZSBjaGFuZ2UgaXMgZG9uZSBpbiB0d28gcGFydHM6
DQo+PiAxKSBjYWxsIHNjaV9kb19kb21jdGwoKSBpbiBkb19kb21jdGwoKSBiZWZvcmUgSU9NTVUg
cHJvY2Vzc2luZy4gSWYNCj4+IHNjaV9kb19kb21jdGwoKSByZXBvcnRzIGFuIGVycm9yIG90aGVy
IHRoYW4gLUVOWElPLCB0cmVhdCBpdCBhcw0KPj4gYXV0aG9yaXRhdGl2ZSBhbmQgc2tpcCB0aGUg
SU9NTVUgcGF0aC4gQSByZXR1cm4gb2YgLUVOWElPIGluZGljYXRlcw0KPj4gdGhhdCBTQ0kgZGlk
IG5vdCBoYW5kbGUgdGhlIHJlcXVlc3QgYW5kIGlzIGlnbm9yZWQsIGFsbG93aW5nIHRoZQ0KPj4g
ZXhpc3RpbmcgSU9NTVUgaGFuZGxpbmcgdG8gcnVuIHVuY2hhbmdlZDsNCj4+IDIpIHVwZGF0ZSBp
b21tdV9kb19kdF9kb21jdGwoKSB0byBjaGVjayBmb3IgZHRfZGV2aWNlX2lzX3Byb3RlY3RlZCgp
IGFuZA0KPj4gbm90IGZhaWwgaWYgRFQgZGV2aWNlIGlzIG5vdCBwcm90ZWN0ZWQgYnkgSU9NTVUu
IGlvbW11X2RvX3BjaV9kb21jdGwNCj4+IGRvZXNuJ3QgbmVlZCB0byBiZSB1cGRhdGVkIGJlY2F1
c2UgaW9tbXVfZG9fZG9tY3RsIGZpcnN0IHRyaWVzDQo+PiBpb21tdV9kb19wY2lfZG9tY3RsICh3
aGVuIENPTkZJR19IQVNfUENJKSBhbmQgZmFsbHMgYmFjayB0bw0KPj4gaW9tbXVfZG9fZHRfZG9t
Y3RsIG9ubHkgaWYgUENJIHJldHVybnMgLUVOT0RFVi4NCj4+DQo+PiBUaGUgbmV3IGR0X2Rldmlj
ZV9pc19wcm90ZWN0ZWQoKSBieXBhc3MgaW4gaW9tbXVfZG9fZHRfZG9tY3RsIG9ubHkNCj4+IGFw
cGxpZXMgdG8gRFQtZGVzY3JpYmVkIGRldmljZXM7IFNDSSBwYXJhbWV0ZXJzIGFyZSBjYXJyaWVk
IHZpYSBEVA0KPj4gbm9kZXMuIFBDSSBkZXZpY2VzIGhhbmRsZWQgYnkgaW9tbXVfZG9fcGNpX2Rv
bWN0bCBkbyBub3QgY2FycnkgRFQvU0NJDQo+PiBtZXRhZGF0YSBpbiB0aGlzIHBhdGgsIHNvIHRo
ZXJlIGlzIG5vIG5vdGlvbiBvZiDigJxTQ0kgcGFyYW1ldGVycyBvbiBhDQo+PiBub24tSU9NTVUt
cHJvdGVjdGVkIFBDSSBkZXZpY2XigJ0gZm9yIGl0IHRvIGludGVycHJldCBvciB0byBza2lwLiBU
aGUgUENJDQo+PiBwYXRoIHNob3VsZCBjb250aW51ZSB0byByZXBvcnQgZXJyb3JzIGlmIGFzc2ln
bm1lbnQgY2Fubm90IGJlIHBlcmZvcm1lZA0KPj4gYnkgdGhlIElPTU1VIGxheWVyLiBTbyB3ZSBz
aG91bGQgbGVhdmUgaW9tbXVfZG9fcGNpX2RvbWN0bCB1bmNoYW5nZWQ7IHRoZQ0KPj4gU0NJL0RU
LXNwZWNpZmljIHJlbGF4YXRpb25zIGJlbG9uZyBvbmx5IGluIHRoZSBEVCBwYXRoLiBBbHNvIFND
SSBoYW5kbGluZw0KPj4gb25seSBleGlzdHMgd2hlbiBEVCBpcyBwcmVzZW50Lg0KPj4NCj4+IFNp
Z25lZC1vZmYtYnk6IEdyeWdvcmlpIFN0cmFzaGtvIDxncnlnb3JpaV9zdHJhc2hrb0BlcGFtLmNv
bT4NCj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzaWkgTW9pc2llaWV2IDxvbGVrc2lpX21vaXNpZWll
dkBlcGFtLmNvbT4NCj4gTWluZCBtZSBhc2tpbmcgd2hlcmUgbXkgQS1iIHdlbnQ/DQo+DQo+IEph
bg0KU29ycnksIG1pc3NlZCB0aGF0Li4uIDooIFdpbGwgYWRkIGluIHRoZSBuZXh0IHBhdGNoIHNl
cmllcy4uLg0KDQotLS0NCk9sZWtzaWk=

