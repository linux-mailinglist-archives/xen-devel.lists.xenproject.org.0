Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3119B8AFF
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2024 07:09:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828943.1244051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6kpi-0004C2-Cp; Fri, 01 Nov 2024 06:08:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828943.1244051; Fri, 01 Nov 2024 06:08:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6kpi-00048o-67; Fri, 01 Nov 2024 06:08:30 +0000
Received: by outflank-mailman (input) for mailman id 828943;
 Fri, 01 Nov 2024 06:08:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c1/v=R4=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1t6kpg-00048i-7O
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2024 06:08:28 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20620.outbound.protection.outlook.com
 [2a01:111:f403:2412::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2df4f2f-9817-11ef-a0c5-8be0dac302b0;
 Fri, 01 Nov 2024 07:08:24 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CY8PR12MB7587.namprd12.prod.outlook.com (2603:10b6:930:9a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.23; Fri, 1 Nov
 2024 06:08:19 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.8093.024; Fri, 1 Nov 2024
 06:08:18 +0000
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
X-Inumbo-ID: b2df4f2f-9817-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxMjo6NjIwIiwiaGVsbyI6Ik5BTTEwLU1XMi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImIyZGY0ZjJmLTk4MTctMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNDQxMzA0LjA2ODQ4MSwic2VuZGVyIjoiamlxaWFuLmNoZW5AYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iQJ6doz47XHcEGzwOjozvT2cF3GRu8NsAlXkUwuhclz2ojXQt9874XeZ0QseNpsPvGQ/tqM7bJ7KojQVMRbfgeJZ4KViwrDZ59NwVpX3fR2XYVMiNJJFWq8ClhGaHJi+e2iG7Z72BXRUpj6iQTAk3TeeexKgGrGZ3c0sTs10xAl+WBK/TbM+vCdods4RCXbKrJOxIVhWqUKjK1/WGVUfv2cHKlfvJsDgCoMU6+NVPBVOMEGMTFCa65ohsjMj5hmtU/CqqcWfenhwTdp8P4Yuh0T4Il6pt9mBjE+0SRa3NuakoLB0rDlYVGNzJ0ro1Nu+tzv2sBquZ7+lPvhGE5/9kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mB+CCuO9z+tSzByb45CoBKZn40wR2Y0/kgVxZLzKC5c=;
 b=lg7n4/4S5d5UyqqpVfmvmf7EIN9ItU6atW3GfO0lmLKUZDO5Mf2XrwN/4SD3QuBjcrdy/dzrBf48BcJvhZJJxG1opdtc/cfGelx7hYRgrhm7iAUX5EURT1e4udkWUxH1tV3J+i43p9I8Q1o2/r+8xH3KXLQ1UfKlhSXHkwfbczOTHtHAAM94sLvpaFma/xN7Xz6d6C50HV61b1PbZrKLQhrJa0lKdRobG0rl5vQOglQ7KgRU5xHs1wUdcm1ScQssub+FLA4HR3+nqbuFGQyh8sntGZf87jckBkU0B39nDHAzEVTdx9bbFj3ARRYm5HHiqjORWHSCT5VhZ8U2Wb+/bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mB+CCuO9z+tSzByb45CoBKZn40wR2Y0/kgVxZLzKC5c=;
 b=RiaiW9iNt+nyV5RjbZbVH50/256ne1+viVEIjgFAL7SKUz0enGqezepaaSVTdsw2EJBk1TAjku03ll8KPd3RGN5KM2J8tQ0wqWaUCKGrPYxo1CpUWY1c60ZEwba1u19I5W6Ueegsl+ZTbeqJNNQuD+iSd/YXkyHttMg6kYx61b8=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Paul Durrant <paul@xen.org>, "Edgar E . Iglesias"
	<edgar.iglesias@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [QEMU PATCH v9] xen/passthrough: use gsi to map pirq when dom0 is
 PVH
Thread-Topic: [QEMU PATCH v9] xen/passthrough: use gsi to map pirq when dom0
 is PVH
Thread-Index: AQHbJfQPdMv3M7YW802ZtCXuQqWNubKiglqA
Date: Fri, 1 Nov 2024 06:08:18 +0000
Message-ID:
 <BL1PR12MB58495196556DF24385D71E8BE7562@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20241024090629.1944820-1-Jiqian.Chen@amd.com>
In-Reply-To: <20241024090629.1944820-1-Jiqian.Chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8093.023)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CY8PR12MB7587:EE_
x-ms-office365-filtering-correlation-id: dec72d18-2e99-4883-4c71-08dcfa3b94ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MzdLdll5SDZTVERHVzdGZ200VVlXR2c3bDBmajZqajgvS2tNVTZ0dmZqWk9r?=
 =?utf-8?B?UHVSRm83RFpDcnpXeW1TaGkwVHd6QlVPMUVnR1VxcXVodFdnYldlZ2Z3REV2?=
 =?utf-8?B?TVVDc29PRjhWcW1LdnFuWEw3c2xzN084R25BdVN2cmtSTXlFdEppbkczRlQ1?=
 =?utf-8?B?QkttcmtUMTJOdkQrWThGZzdvNTdGWjFIVEV5Q1ZERS9iaTQ1eGErVUEwOHFs?=
 =?utf-8?B?VWFkQVM3eEQ2M2FiS0dzVFBKbDBaWnVOYWRycUU4Y2NqV0wvYkZwL3FQdTBr?=
 =?utf-8?B?cno3eDFvNTBHSzZaRWJiLzhvZDA2alMzMmdHSHVBd1dxMkZCWW0yOTMyVHow?=
 =?utf-8?B?cFRJVjVDZHQ4dUdrZW9SSWZyRUlxYzZxMDNWYlBINjNSZlpNbzdOa1FML0lM?=
 =?utf-8?B?d05VMVZ3Z2pERDl0T2Z4UWp5RGc1bXd4aWtDNEVVZ0MvQjVmOU9BTDRvdUp6?=
 =?utf-8?B?QUJmK2pkZEdTcFV6ZzRNbEk4bVBFVkVwVG5VRnprL2l3RGNzSCticXVHcGwz?=
 =?utf-8?B?amlqR1I4OWxIU0hxUTNsN05kbWlpbmlqZ0NNS0hUSllLV3JvMVpuSmVFS3NG?=
 =?utf-8?B?TlNaYXZaNm1uK2d6M1VmZ3cxakZlNENpL0ZRNHV0N2VDNnl0ZWdkWUhRRDNy?=
 =?utf-8?B?MjI2STA0dERaczRrUlNibFYvUjczc2xETHhVN3U1QzNlWTVtNTF5c3VSajg3?=
 =?utf-8?B?ZDdDUFUrYlFOVitKS1lQNmRoNHdxUWJZaWsvVE95Si9SWEpadVFLOWtERmxr?=
 =?utf-8?B?eXgwWU5jWkltR2JIa3BQR0F6a0RCaWxYYTNsYkQwZ3RiUjNlTktWSmhoUHQz?=
 =?utf-8?B?WnFuK1VJTjhUN0FMUEp5a2dFYVdTS0sxRjUyRXdlYjJZTUU5NVZuR3FpNVRN?=
 =?utf-8?B?dHVYS0o5NjB3c1VqUnlYNVhNSnYxMnZvWmhhQzgvbTliVncvT2R2U2RDeG1M?=
 =?utf-8?B?dTRQdlFBd0VleStzQ1hoWjJCTlVPWkdIM1BNZjZxNTdtVnRwVEVjS1Jka2l6?=
 =?utf-8?B?WklBMUhDaGJ1Y2RSaWl4cFBsT3dnVmVtOEI2UTNmeEJiT2N6NGZHR1Nvc0hI?=
 =?utf-8?B?U2ZEaXYzTFBhSWVEeHRLT3IzSUJ1RXd6K09udmZlZEdzeklzYlZlMm9keW9m?=
 =?utf-8?B?eVIveVk3WW1GeXlnYU5FSy82NGdsekxOQ1FUTUNMVFRqUE4wMSthSE41eXpy?=
 =?utf-8?B?aUJSemFaUjVEUWp0ZXQ5MHZSSGdVTTJKaThFQzg5cG9La1BhaDk0UVpqRHFz?=
 =?utf-8?B?SWNWWEhYZG1rN0NoWVNiQjBieXRFYzlwKzd6NTllUU4rVHJCZ2RUWnEwN0Z1?=
 =?utf-8?B?UmpLUzd0UFJjQmVObnI2RmtUZjhMQXJJWE54VzBvMVV6NnJzVW5PbjRnSFRz?=
 =?utf-8?B?aDZiU1hjUFZjdTcrSlg1U3gwTVhyWkE1ZzdzMmZUMTVTa0dRYkZOM25HMVhq?=
 =?utf-8?B?VHRIc1NZSFQzdlVJUmJvMFFYcVdFREV5M3QvUFQrRk1MRWFNSVY5UDRMSnQv?=
 =?utf-8?B?dWk3Z0Z4S2daLzY5bkQ0QXdWREtWbi90UUp1NHRKS0dpUjRTaE4rZ2ZnSWVR?=
 =?utf-8?B?bUdxZjFWOFR5M0xwdXB4a1VZdkNuRVZVbGQ1WEN4UDNleTNZZXltbHh2NEl3?=
 =?utf-8?B?VmxVckVneVVBOUhYZkd3VGRZQ2dvbk13SENOVnlhT0xyQWx1MHc0aVdkd0RT?=
 =?utf-8?B?c3JHQWdBck5mY0NBOCs5eWEwUXRqVThJS2ZLNkM1Tmt3YmVRZHFGOFl1ZjJw?=
 =?utf-8?B?NC9SemlQakU4QTdGbkFmcVp3M3puU3UzMC82QThldjgxNHRMdEM1UllEb09H?=
 =?utf-8?Q?Hi0mUite33uPngzIbbjndReOJ0QCrzlpHXZi0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WXV6SjZ4T1NQRUR6b01kUzlvUUljRVJiVEp4MUJIRzNGOE4xQTRTd1krZEZX?=
 =?utf-8?B?dFpVL2JPZFV2SVRUZDg1V1lqMElQZnB5YjY2czNGcHNvSW5OTmpGOU9yT3N5?=
 =?utf-8?B?ZGlEYUtsL01Mb3NBWWh2TmI5L3JlZEFzNnB6TU1DbUgycEtEeFl4T2FDenV1?=
 =?utf-8?B?SHd4TXlMbSs3OTRlclFleUJxczF6aTdWYUh5ZVFmV0pTM2luL3hFUnVWaVVz?=
 =?utf-8?B?c3hvcGFEbGJiN0VNRVRTQld1YXB3QjZ5d1BQVlYvRlZFakZzbmF3bHdFY0dY?=
 =?utf-8?B?Q1hSSkpuaTk0aThVMXNhWHhYUUJYK3NheVFRZ3piQ09GYStQYnhPeWNaaUVF?=
 =?utf-8?B?VFhyV3R4My9MaTVDNzJmRCtwc1czZUNsWDdMSEdQbW5sSUNEZlZmMjMwVGwz?=
 =?utf-8?B?UEhYcnBuanNrV09mMDlPcDFuMi9GOXFCL3ZjWTU3SUgzcGhDbzZLNlFjdzJx?=
 =?utf-8?B?TjBLVXZiZUVndmxFSlJJN3BTdnJyN0trMWN6azlQMmJpaVdsNWxVbEtldVBh?=
 =?utf-8?B?VWVoNWNrQ2cxTVBMbUcrK0xMMFdpbEtrRWFZRm1sclpGMVZ4SCtka2VnNzNq?=
 =?utf-8?B?ekdHNnJFcHVSNGNsdmxqOUs5clN4NWg1aExFbGxWdk1Wc05teHUrVEJYa0RK?=
 =?utf-8?B?RFpQS1M5ajNQQ290R2tHaW1RMi9SYkxXaldEYzRmbE5DK2JibFVjaUtldGpY?=
 =?utf-8?B?U2pkeXBlSngwcmpiMFNtNC9zVUlZdFNjaUlWZzVqRFB4UGV4SDdKLzQrVzli?=
 =?utf-8?B?bEVGd0ZwQU5mb2tWVEVQZzFlOW1iUFJiYjd5cUFId29pVnh1VjJFamFPbkJy?=
 =?utf-8?B?VUh5TWVRVXR4NTJVbzREMC9hcXhFemxQWXpzV2pYVXFFb1pXRUQzLzk3UHZl?=
 =?utf-8?B?SEk5VUlIK2NPSnkzeTZSMXlFY0FrNTlZL2dXY3oxTG1yY1U3YnFkY0t2b0xX?=
 =?utf-8?B?cGZFcXZneENINmxsa1NGQ0JPRWo0d3VsQWdIeDJTbWMzL0NlSXo2c0gwRVpL?=
 =?utf-8?B?YVBneTdSUEg5SGlxUzNYWkZHSEpGZkRKUzlCZC82SjVEQ3h1QVc0cXY3Q0p6?=
 =?utf-8?B?aVJ5SGxrQ1BXTndyOTQ5WmpkQnJwOFp4aEZDWDY1TFlsOGdrcGFZYWJ5ZHdq?=
 =?utf-8?B?bW8zSmJLcldXdk9KQ2hlMWRVTzZRdlRzZUozM3dTZzV5eEZpNTdTSVc2TUJW?=
 =?utf-8?B?TktYZ1ZFVlZLOHRPdUxFYmd4cXdueHJ1SEU5RTNRZnhDeVliNTl0MVE0a0F4?=
 =?utf-8?B?UUxUVE53VFhFR2x3UnNQcUpVWVlWcmZxSGVIYlRGVFdqT3l4cFZiNEVNUHV2?=
 =?utf-8?B?RVcwdTJQVlk5dTBPaUg2dVJOOXRQV3BHWlFONHpKby9kZHVzNWlCT016K2FJ?=
 =?utf-8?B?NjY0VFoxSkZYd3lIQUFxeTJOUmNRV3VnSklIVUhjajI0ZmtBMStLOEp4Uytu?=
 =?utf-8?B?cllITFYycjFVclhzWGlXd1pYQlpjS3FLZmYrVW5HUlc4ckFHNkNPTkprdUFK?=
 =?utf-8?B?cENwa3gwWitMdVBCRkhCSUo3d0hNcFg1azMzUFp0SFU2cVEzRWI4b0Z4U05Z?=
 =?utf-8?B?MXJsejR6OE1hcmlnZ3NTT1NUemVES1JhdWw1akFta1V6dzQwTldSSFBwVVZI?=
 =?utf-8?B?UHBmN1V6K0tMRlFIWFMzWXN2VEdxRGlqZGNqaGRxOXUxa1JBZ29xUVVZUU5q?=
 =?utf-8?B?UTVpOG1IK3JUajZMNjJTVG55aUJHbm1pNUJ4REYvSE1XWm1PR0toZ04wVk9y?=
 =?utf-8?B?aXhFSUprU3VqMzJUZHhTTXowRXRFdXQxYlBFQ3VYVVJ0NWQwNTdTSFRhN1Ez?=
 =?utf-8?B?NElNRWxBajh4QXVuckhkd20xdkVxcWJpY1RlMHlaSnBjVGhVRmRhelBydlEx?=
 =?utf-8?B?Wk96emhlM3VObjg3cFZqUzJYM2tYTXJSTkhWU1kxSlNUcmFTbXA3REZBcWxh?=
 =?utf-8?B?VmQ0a0hVTVBRclRkenN5TVBrd1V4dUowMC9NeWFZNDU0VHBta1lJL05DTXhY?=
 =?utf-8?B?Nm1oUGJTK3FqWGlkYnI4UkdzNVhmVHc5UGdHRDBwZFh3MnluZERzR2svZ3V4?=
 =?utf-8?B?VWF2cm9HdDZZd0U5UjVCVzV3NlZydWFnRnBGd2lsdUk0QjJhNnM5bng5TWZz?=
 =?utf-8?Q?qGe0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4296088B35BE354AA288EE949BF63EC2@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dec72d18-2e99-4883-4c71-08dcfa3b94ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2024 06:08:18.9402
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cKqAhZs/V1MxXS50yaubPV3xrIY9dw91vZJxBQa6f0iOp1GELa7/2Bk/jcEmYaVUMxwa50//fy+n89CckkWoAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7587

SGksDQoNCk9uIDIwMjQvMTAvMjQgMTc6MDYsIEppcWlhbiBDaGVuIHdyb3RlOg0KPiBJbiBQVkgg
ZG9tMCwgd2hlbiBwYXNzdGhyb3VnaCBhIGRldmljZSB0byBkb21VLCBRRU1VIGNvZGUNCj4geGVu
X3B0X3JlYWxpemUtPnhjX3BoeXNkZXZfbWFwX3BpcnEgd2FudHMgdG8gdXNlIGdzaSwgYnV0IGlu
IGN1cnJlbnQgY29kZXMNCj4gdGhlIGdzaSBudW1iZXIgaXMgZ290IGZyb20gZmlsZSAvc3lzL2J1
cy9wY2kvZGV2aWNlcy88c2JkZj4vaXJxLCB0aGF0IGlzDQo+IHdyb25nLCBiZWNhdXNlIGlycSBp
cyBub3QgZXF1YWwgd2l0aCBnc2ksIHRoZXkgYXJlIGluIGRpZmZlcmVudCBzcGFjZXMsIHNvDQo+
IHBpcnEgbWFwcGluZyBmYWlscy4NCj4gDQo+IFRvIHNvbHZlIGFib3ZlIHByb2JsZW0sIHVzZSBu
ZXcgaW50ZXJmYWNlIG9mIFhlbiwgeGNfcGNpZGV2X2dldF9nc2kgdG8gZ2V0DQo+IGdzaSBhbmQg
dXNlIHhjX3BoeXNkZXZfbWFwX3BpcnFfZ3NpIHRvIG1hcCBwaXJxIHdoZW4gZG9tMCBpcyBQVkgu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKaXFpYW4gQ2hlbiA8SmlxaWFuLkNoZW5AYW1kLmNvbT4N
Cj4gU2lnbmVkLW9mZi1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4NCj4gU2lnbmVk
LW9mZi1ieTogSmlxaWFuIENoZW4gPEppcWlhbi5DaGVuQGFtZC5jb20+DQo+IC0tLQ0KPiBIaSBB
bGwsDQo+IFRoaXMgaXMgdjkgdG8gc3VwcG9ydCBwYXNzdGhyb3VnaCBvbiBYZW4gd2hlbiBkb20w
IGlzIFBWSC4NCj4gdjgtPnY5IGNoYW5nZXM6DQo+ICogTW92ZWQgdGhlIGRlZmluaXRpb24gb2Yg
UENJX1NCREYgZnJvbSAvaHcveGVuL3hlbl9wdC5jIHRvIC9pbmNsdWRlL2h3L3BjaS9wY2kuaC4N
Cj4gKiBSZW5hbWVkIHhlbl9ydW5fcWVtdV9vbl9odm0gdG8geGVuX3B0X25lZWRfZ3NpLg0KPiAq
IFJlbmFtZWQgeGVuX21hcF9waXJxX2Zvcl9nc2kgdG8geGVuX3B0X21hcF9waXJxX2Zvcl9nc2ku
DQo+ICogVGhyb3VnaCByZWFkaW5nIC9zeXMvaHlwZXJ2aXNvci9ndWVzdF90eXBlIHRvIGdldCBk
b20gdHlwZSBpbnN0ZWFkIG9mIHVzaW5nIHhjX2RvbWFpbl9nZXRpbmZvX3NpbmdsZS4NCj4gDQo+
IEJlc3QgcmVnYXJkcywNCj4gSmlxaWFuIENoZW4NCj4gDQo+IHY3LT52OCBjaGFuZ2VzOg0KPiAq
IFNpbmNlIHhjX3BoeXNkZXZfZ3NpX2Zyb21fZGV2IHdhcyByZW5hbWVkIHRvIHhjX3BjaWRldl9n
ZXRfZ3NpLCBjaGFuZ2VkIGl0Lg0KPiAqIEFkZGVkIHhlbl9ydW5fcWVtdV9vbl9odm0gdG8gY2hl
Y2sgaWYgUWVtdSBydW4gb24gUFYgZG9tMCwgaWYgbm90IHVzZSB4Y19waHlzZGV2X21hcF9waXJx
X2dzaSB0byBtYXAgcGlycS4NCj4gKiBVc2VkIENPTkZJR19YRU5fQ1RSTF9JTlRFUkZBQ0VfVkVS
U0lPTiB0byB3cmFwIHRoZSBuZXcgcGFydCBmb3IgY29tcGF0aWJpbGl0eS4NCj4gKiBBZGRlZCAi
I2RlZmluZSBET01JRF9SVU5fUUVNVSAwIiB0byByZXByZXNlbnQgdGhlIGlkIG9mIGRvbWFpbiB0
aGF0IFFlbXUgcnVuIG9uLg0KPiANCj4gdjYtPnY3IGNoYW5nZXM6DQo+ICogQmVjYXVzZSB0aGUg
ZnVuY3Rpb24gb2Ygb2J0YWluaW5nIGdzaSB3YXMgY2hhbmdlZCBvbiB0aGUga2VybmVsIGFuZCBY
ZW4gc2lkZS4gQ2hhbmdlZCB0byB1c2UNCj4gICB4Y19waHlzZGV2X2dzaV9mcm9tX2RldiwgdGhh
dCByZXF1aXJlcyBwYXNzaW5nIGluIHNiZGYgaW5zdGVhZCBvZiBpcnEuDQo+IA0KPiB2NS0+djYg
Y2hhbmdlczoNCj4gKiBCZWNhdXNlIHRoZSBmdW5jdGlvbiBvZiBvYnRhaW5pbmcgZ3NpIHdhcyBj
aGFuZ2VkIG9uIHRoZSBrZXJuZWwgYW5kIFhlbiBzaWRlLiBDaGFuZ2VkIHRvIHVzZQ0KPiAgIHhj
X3BoeXNkZXZfZ3NpX2Zyb21faXJxLCBpbnN0ZWFkIG9mIGdzaSBzeXNmcy4NCj4gKiBTaW5jZSBm
dW5jdGlvbiBjaGFuZ2VkLCByZW1vdmVkIHRoZSBSZXZpZXctYnkgb2YgU3RlZmFuby4NCj4gDQo+
IHY0LT52NSBjaGFuZ2VzOg0KPiAqIEFkZGVkIFJldmlldy1ieSBTdGVmYW5vLg0KPiANCj4gdjMt
PnY0IGNoYW5nZXM6DQo+ICogQWRkZWQgZ3NpIGludG8gc3RydWN0IFhlbkhvc3RQQ0lEZXZpY2Ug
YW5kIHVzZWQgZ3NpIG51bWJlciB0aGF0IHJlYWQgZnJvbSBnc2kgc3lzZnMNCj4gICBpZiBpdCBl
eGlzdHMsIGlmIHRoZXJlIGlzIG5vIGdzaSBzeXNmcywgc3RpbGwgdXNlIGlycS4NCj4gDQo+IHYy
LT52MyBjaGFuZ2VzOg0KPiAqIER1ZSB0byBjaGFuZ2VzIGluIHRoZSBpbXBsZW1lbnRhdGlvbiBv
ZiB0aGUgc2Vjb25kIHBhdGNoIG9uIGtlcm5lbCBzaWRlKHRoYXQgYWRkcw0KPiAgIGEgbmV3IHN5
c2ZzIGZvciBnc2kgaW5zdGVhZCBvZiBhIG5ldyBzeXNjYWxsKSwgc28gcmVhZCBnc2kgbnVtYmVy
IGZyb20gdGhlIHN5c2ZzIG9mIGdzaS4NCj4gDQo+IHYxIGFuZCB2MjoNCj4gV2UgY2FuIHJlY29y
ZCB0aGUgcmVsYXRpb24gYmV0d2VlbiBnc2kgYW5kIGlycSwgdGhlbiB3aGVuIHVzZXJzcGFjZShx
ZW11KSB3YW50DQo+IHRvIHVzZSBnc2ksIHdlIGNhbiBkbyBhIHRyYW5zbGF0aW9uLiBUaGUgdGhp
cmQgcGF0Y2ggb2Yga2VybmVsKHhlbi9wcml2Y21kOiBBZGQgbmV3IHN5c2NhbGwNCj4gdG8gZ2V0
IGdzaSBmcm9tIGlycSkgcmVjb3JkcyBhbGwgdGhlIHJlbGF0aW9ucyBpbiBhY3BpX3JlZ2lzdGVy
X2dzaV94ZW5fcHZoKCkgd2hlbiBkb20wDQo+IGluaXRpYWxpemUgcGNpIGRldmljZXMsIGFuZCBw
cm92aWRlIGEgc3lzY2FsbCBmb3IgdXNlcnNwYWNlIHRvIGdldCB0aGUgZ3NpIGZyb20gaXJxLiBU
aGUNCj4gdGhpcmQgcGF0Y2ggb2YgeGVuKHRvb2xzOiBBZGQgbmV3IGZ1bmN0aW9uIHRvIGdldCBn
c2kgZnJvbSBpcnEpIGFkZCBhIG5ldyBmdW5jdGlvbg0KPiB4Y19waHlzZGV2X2dzaV9mcm9tX2ly
cSgpIHRvIGNhbGwgdGhlIG5ldyBzeXNjYWxsIGFkZGVkIG9uIGtlcm5lbCBzaWRlLg0KPiBBbmQg
dGhlbiB1c2Vyc3BhY2UgY2FuIHVzZSB0aGF0IGZ1bmN0aW9uIHRvIGdldCBnc2kuIFRoZW4geGNf
cGh5c2Rldl9tYXBfcGlycSgpIHdpbGwgc3VjY2Vzcy4NCj4gDQo+IElzc3VlcyB3ZSBlbmNvdW50
ZXJlZDoNCj4gMS4gZmFpbGVkIHRvIG1hcCBwaXJxIGZvciBnc2kNCj4gUHJvYmxlbTogcWVtdSB3
aWxsIGNhbGwgeGNfcGh5c2Rldl9tYXBfcGlycSgpIHRvIG1hcCBhIHBhc3N0aHJvdWdoIGRldmlj
ZSdzIGdzaSB0byBwaXJxIGluDQo+IGZ1bmN0aW9uIHhlbl9wdF9yZWFsaXplKCkuIEJ1dCBmYWls
ZWQuDQo+IA0KPiBSZWFzb246IEFjY29yZGluZyB0byB0aGUgaW1wbGVtZW50IG9mIHhjX3BoeXNk
ZXZfbWFwX3BpcnEoKSwgaXQgbmVlZHMgZ3NpIGluc3RlYWQgb2YgaXJxLA0KPiBidXQgcWVtdSBw
YXNzIGlycSB0byBpdCBhbmQgdHJlYXQgaXJxIGFzIGdzaSwgaXQgaXMgZ290IGZyb20gZmlsZQ0K
PiAvc3lzL2J1cy9wY2kvZGV2aWNlcy94eHh4Onh4Onh4LngvaXJxIGluIGZ1bmN0aW9uIHhlbl9o
b3N0X3BjaV9kZXZpY2VfZ2V0KCkuIEJ1dCBhY3R1YWxseQ0KPiB0aGUgZ3NpIG51bWJlciBpcyBu
b3QgZXF1YWwgd2l0aCBpcnEuIFRoZXkgYXJlIGluIGRpZmZlcmVudCBzcGFjZS4NCj4gLS0tDQo+
ICBody94ZW4veGVuX3B0LmMgICAgICB8IDUzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrDQo+ICBpbmNsdWRlL2h3L3BjaS9wY2kuaCB8ICA0ICsrKysNCj4gIDIg
ZmlsZXMgY2hhbmdlZCwgNTcgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2h3L3hl
bi94ZW5fcHQuYyBiL2h3L3hlbi94ZW5fcHQuYw0KPiBpbmRleCAzNjM1ZDFiMzlmNzkuLjViMTBk
NTAxZDU2NiAxMDA2NDQNCj4gLS0tIGEvaHcveGVuL3hlbl9wdC5jDQo+ICsrKyBiL2h3L3hlbi94
ZW5fcHQuYw0KPiBAQCAtNzY2LDYgKzc2Niw1MCBAQCBzdGF0aWMgdm9pZCB4ZW5fcHRfZGVzdHJv
eShQQ0lEZXZpY2UgKmQpIHsNCj4gIH0NCj4gIC8qIGluaXQgKi8NCj4gIA0KPiArI2lmIENPTkZJ
R19YRU5fQ1RSTF9JTlRFUkZBQ0VfVkVSU0lPTiA+PSA0MjAwMA0KPiArc3RhdGljIGJvb2wgeGVu
X3B0X25lZWRfZ3NpKHZvaWQpDQo+ICt7DQo+ICsgICAgRklMRSAqZnA7DQo+ICsgICAgaW50IGxl
bjsNCj4gKyAgICBjaGFyIHR5cGVbMTBdOw0KPiArICAgIGNvbnN0IGNoYXIgKmd1ZXN0X3R5cGUg
PSAiL3N5cy9oeXBlcnZpc29yL2d1ZXN0X3R5cGUiOw0KPiArDQo+ICsgICAgZnAgPSBmb3Blbihn
dWVzdF90eXBlLCAiciIpOw0KPiArICAgIGlmIChmcCA9PSBOVUxMKSB7DQo+ICsgICAgICAgIGVy
cm9yX3JlcG9ydCgiQ2Fubm90IG9wZW4gJXM6ICVzIiwgZ3Vlc3RfdHlwZSwgc3RyZXJyb3IoZXJy
bm8pKTsNCj4gKyAgICAgICAgcmV0dXJuIGZhbHNlOw0KPiArICAgIH0NCj4gKyAgICBmZ2V0cyh0
eXBlLCBzaXplb2YodHlwZSksIGZwKTsNCj4gKyAgICBmY2xvc2UoZnApOw0KPiArDQo+ICsgICAg
bGVuID0gc3RybGVuKHR5cGUpOw0KPiArICAgIGlmIChsZW4pIHsNCj4gKyAgICAgICAgdHlwZVts
ZW4gLSAxXSA9ICdcMCc7DQo+ICsgICAgICAgIGlmICghc3RyY21wKHR5cGUsICJQVkgiKSkgew0K
PiArICAgICAgICAgICAgcmV0dXJuIHRydWU7DQo+ICsgICAgICAgIH0NCj4gKyAgICB9DQo+ICsg
ICAgcmV0dXJuIGZhbHNlOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW50IHhlbl9wdF9tYXBfcGly
cV9mb3JfZ3NpKFBDSURldmljZSAqZCwgaW50ICpwaXJxKQ0KPiArew0KPiArICAgIGludCBnc2k7
DQo+ICsgICAgWGVuUENJUGFzc3Rocm91Z2hTdGF0ZSAqcyA9IFhFTl9QVF9ERVZJQ0UoZCk7DQo+
ICsNCj4gKyAgICBnc2kgPSB4Y19wY2lkZXZfZ2V0X2dzaSh4ZW5feGMsDQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgUENJX1NCREYocy0+cmVhbF9kZXZpY2UuZG9tYWluLA0KPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHMtPnJlYWxfZGV2aWNlLmJ1cywNCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzLT5yZWFsX2RldmljZS5kZXYs
DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcy0+cmVhbF9kZXZpY2Uu
ZnVuYykpOw0KPiArICAgIGlmIChnc2kgPj0gMCkgew0KPiArICAgICAgICByZXR1cm4geGNfcGh5
c2Rldl9tYXBfcGlycV9nc2koeGVuX3hjLCB4ZW5fZG9taWQsIGdzaSwgcGlycSk7DQo+ICsgICAg
fQ0KPiArDQo+ICsgICAgcmV0dXJuIGdzaTsNCj4gK30NCj4gKyNlbmRpZg0KPiArDQo+ICBzdGF0
aWMgdm9pZCB4ZW5fcHRfcmVhbGl6ZShQQ0lEZXZpY2UgKmQsIEVycm9yICoqZXJycCkNCj4gIHsN
Cj4gICAgICBFUlJQX0dVQVJEKCk7DQo+IEBAIC04NDcsNyArODkxLDE2IEBAIHN0YXRpYyB2b2lk
IHhlbl9wdF9yZWFsaXplKFBDSURldmljZSAqZCwgRXJyb3IgKiplcnJwKQ0KPiAgICAgICAgICBn
b3RvIG91dDsNCj4gICAgICB9DQo+ICANCj4gKyNpZiBDT05GSUdfWEVOX0NUUkxfSU5URVJGQUNF
X1ZFUlNJT04gPj0gNDIwMDANCj4gKyAgICBpZiAoeGVuX3B0X25lZWRfZ3NpKCkpIHsNCj4gKyAg
ICAgICAgcmMgPSB4ZW5fcHRfbWFwX3BpcnFfZm9yX2dzaShkLCAmcGlycSk7DQo+ICsgICAgfSBl
bHNlIHsNCj4gKyAgICAgICAgcmMgPSB4Y19waHlzZGV2X21hcF9waXJxKHhlbl94YywgeGVuX2Rv
bWlkLCBtYWNoaW5lX2lycSwgJnBpcnEpOw0KPiArICAgIH0NCj4gKyNlbHNlDQo+ICAgICAgcmMg
PSB4Y19waHlzZGV2X21hcF9waXJxKHhlbl94YywgeGVuX2RvbWlkLCBtYWNoaW5lX2lycSwgJnBp
cnEpOw0KPiArI2VuZGlmDQo+ICsNCj4gICAgICBpZiAocmMgPCAwKSB7DQo+ICAgICAgICAgIFhF
Tl9QVF9FUlIoZCwgIk1hcHBpbmcgbWFjaGluZSBpcnEgJXUgdG8gcGlycSAlaSBmYWlsZWQsIChl
cnI6ICVkKVxuIiwNCj4gICAgICAgICAgICAgICAgICAgICBtYWNoaW5lX2lycSwgcGlycSwgZXJy
bm8pOw0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody9wY2kvcGNpLmggYi9pbmNsdWRlL2h3L3Bj
aS9wY2kuaA0KPiBpbmRleCBlYjI2Y2FjODEwOTguLjA3ODA1YWE4YTVmMyAxMDA2NDQNCj4gLS0t
IGEvaW5jbHVkZS9ody9wY2kvcGNpLmgNCj4gKysrIGIvaW5jbHVkZS9ody9wY2kvcGNpLmgNCj4g
QEAgLTIzLDYgKzIzLDEwIEBAIGV4dGVybiBib29sIHBjaV9hdmFpbGFibGU7DQo+ICAjZGVmaW5l
IFBDSV9TTE9UX01BWCAgICAgICAgICAgIDMyDQo+ICAjZGVmaW5lIFBDSV9GVU5DX01BWCAgICAg
ICAgICAgIDgNCj4gIA0KPiArI2RlZmluZSBQQ0lfU0JERihzZWcsIGJ1cywgZGV2LCBmdW5jKSBc
DQo+ICsgICAgICAgICAgICAoKCgodWludDMyX3QpKHNlZykpIDw8IDE2KSB8IFwNCj4gKyAgICAg
ICAgICAgIChQQ0lfQlVJTERfQkRGKGJ1cywgUENJX0RFVkZOKGRldiwgZnVuYykpKSkNCj4gKw0K
PiAgLyogQ2xhc3MsIFZlbmRvciBhbmQgRGV2aWNlIElEcyBmcm9tIExpbnV4J3MgcGNpX2lkcy5o
ICovDQo+ICAjaW5jbHVkZSAiaHcvcGNpL3BjaV9pZHMuaCINCj4gIA0KRG8geW91IGhhdmUgYW55
IGNvbW1lbnRzPw0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

