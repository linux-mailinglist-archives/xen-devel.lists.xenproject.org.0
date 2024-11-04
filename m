Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF12C9BAC50
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2024 07:05:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829810.1244708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7qC6-0007lJ-F9; Mon, 04 Nov 2024 06:04:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829810.1244708; Mon, 04 Nov 2024 06:04:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7qC6-0007jU-BB; Mon, 04 Nov 2024 06:04:06 +0000
Received: by outflank-mailman (input) for mailman id 829810;
 Mon, 04 Nov 2024 06:04:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mkdM=R7=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1t7qC4-0007jO-I2
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2024 06:04:04 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20627.outbound.protection.outlook.com
 [2a01:111:f403:2415::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94cb4a17-9a72-11ef-a0c5-8be0dac302b0;
 Mon, 04 Nov 2024 07:03:59 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by LV8PR12MB9449.namprd12.prod.outlook.com (2603:10b6:408:204::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 06:03:55 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 06:03:55 +0000
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
X-Inumbo-ID: 94cb4a17-9a72-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNTo6NjI3IiwiaGVsbyI6Ik5BTTExLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6Ijk0Y2I0YTE3LTlhNzItMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNzAwMjM5LjgzNjg5Nywic2VuZGVyIjoiamlxaWFuLmNoZW5AYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mXCMJ05lu39Rxwk824QJxBqfmPDToJkPeoO0UMeN+UK51MvHr0Vg5j3h8qcrLgFDmQcL++okjlUf0/zFm1cIonQt7DSmeMI6qXCN022EHshm7B6Q6qSdDdfjlHCvuBScIXexVxhrTqAjCmrzGrSSct6aVLdegCQwUPPfdGtvsptNnXa4hR5LBWjwjSeRR1EBppnT4wdFRioNwElCQAjF0nps4QCdFcJCyOLrkJy8JvvFni2ziCoRKpbbuRqQj6zjcPu76XDE/d03iLfhja0dNGq/4Et6iwRf6xTtgcTdK2F6TqBriiLCXCBwNPTRKTGoCGQX3OWAVwDJ5OY5jpi2VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2Hr+8gyUpiKqgP5pTX0yvlWPuKT4QFcdrQGcMEPrOo=;
 b=e7bJr4836dGkudu2Qf0KopnTgaTgLqsyzluW5avQdQzSAXjSkT82PUrV0RlvEjwDypckSocifVk3N3xgutPVh+UXyBQsJ/rSc6xpEaMNMz8W0P48UVD+q7zB2T2aZEzAG7ydPmvcUp5VGZJEbDOcZo9HMe9oAE3TlpFPLeUpp482+SidBW3aqKYnL0nyqDC9s7/rKIVgKOUG3k99CD+H1hE5M9jcSvo9Qm+nGIHhtG7QhwvoSummZShvgvjoaP9CBngYi7120cu+vuaWXjP2i0gUW5IkFEzyHT50plRxUwJG2EGB9Xde2uX5q6LJ1jlGbAw0W0vmzY76gMvWpXnzDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2Hr+8gyUpiKqgP5pTX0yvlWPuKT4QFcdrQGcMEPrOo=;
 b=KDrXaTrW+oBKp7QagD5qN9w05FsdBo+2SnF5yDUmmPdf3VLe6lN3fVXP3piSto/FKq6DldRqq1VYv/lbAfaFsvZSZPqAfmz6zNcz/WkDD39HnTvWcGx8TaYmF1z/RAMUVHW645clAzQXgk4FYQkSn+tYRHOqmWEhA8uP5YIN8t0=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Paul Durrant <paul@xen.org>, "Edgar E . Iglesias"
	<edgar.iglesias@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Huang, Ray" <Ray.Huang@amd.com>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [QEMU PATCH v9] xen/passthrough: use gsi to map pirq when dom0 is
 PVH
Thread-Topic: [QEMU PATCH v9] xen/passthrough: use gsi to map pirq when dom0
 is PVH
Thread-Index: AQHbJfQPdMv3M7YW802ZtCXuQqWNubKicokAgATEWwA=
Date: Mon, 4 Nov 2024 06:03:55 +0000
Message-ID:
 <BL1PR12MB584985EF3C4F3D482A3F8E95E7512@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20241024090629.1944820-1-Jiqian.Chen@amd.com>
 <356652df-b5b4-4c28-9c5c-4bfc4f36813f@amd.com>
In-Reply-To: <356652df-b5b4-4c28-9c5c-4bfc4f36813f@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8114.023)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|LV8PR12MB9449:EE_
x-ms-office365-filtering-correlation-id: 0036de59-f790-4d05-6ca9-08dcfc96774f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Tm55NmRaMDM1ZXNVYjFETzJCN2I0eUg3MUZVRnhUSTRlVG5SQUhNbzVCYnVr?=
 =?utf-8?B?d0oyRVpnVnlXOGhIWVRwTTdGc3ZXMFJIMURIcGRpbTV6bXRHb0kvU1lYdExm?=
 =?utf-8?B?TWl4cU1HdmpDT0VKOGN1SUVROVlTVFA2UVRmUDFzS2Nlc0NHcnpZREVZWEVv?=
 =?utf-8?B?dC9xZ1hUa1R4UmdLRnc3bEY0Q0phVjArakR1b3FhUU5wSThyUGg0T3hLTW1m?=
 =?utf-8?B?VmY5c01ya2RmaGhndm1RaHpTWU41aXpJUzMwb3dFbmpXbGE4SnBYcCt5azds?=
 =?utf-8?B?OXMzZkdHVFY5U1ZVSkgxc3Z5MURSVE1PaWdPb09yRU1uSXl1NUpjWlZsYmxv?=
 =?utf-8?B?RWVCRW1ocnAwNG1Ya3FPRTFBZTRUd2IzMFJXRHdNK1FHVDl1aGNqWkRoL0pF?=
 =?utf-8?B?NDVMeE9Fc29OSFNRNjQ2QzlzbkZuUlBoYzJJTFBIOFBBeTMrVjU3UHl1VVhK?=
 =?utf-8?B?QnlnZEM5R3FOR0VTeEExajE0ZWsyV21hL3RyMkVDL2ZXMEQyOTVjOEVMOHdZ?=
 =?utf-8?B?NnkzUUZ5WlBRQ0NEZWdLeVBicmNMdVd3NWpIVnpSZU5vd3RTbW9vUlJ0QTdu?=
 =?utf-8?B?czlMcnlibllSOWpMdkkxOGhJRzZOT056K2h3Y2xJSVFmWklYN013aGxwNXIv?=
 =?utf-8?B?aU1YUm83WU1TS2lHajJMMFNnYUthazhoZElBbGd5TkRqdWJQdkh5blRBR2Nk?=
 =?utf-8?B?RllQbWFPWmtpNTlWSUdhbk1XSzBWcnNldkxPb1hpTDFkbFlGUUVIbFJKeUxu?=
 =?utf-8?B?Y3BFTngzNFVwa3JjRHZFRHg4ZFB2dy9ZMVR6RnNJTXhTNVgvdXI4WEVKQThp?=
 =?utf-8?B?ZWRYMmFTeVhzS083bEU2ZUU3MlloZHdVQmt0UUZiME0zazMwZkgrVUtiVmdJ?=
 =?utf-8?B?TUxnbFJEcDhTQXY4cEZxSk9uRjhFck9nN3EwZlBieXdEU3Qwb3ZmQUV5cEc2?=
 =?utf-8?B?ZHQ5UUdURTZHWHl4N3BwTUR5dzFPbm9uRDl3Vkl3QkUyRjRlV3ZkcnlLbkxh?=
 =?utf-8?B?bHhiV3dhRnZ1Ti94aUYrRWRZRFVLa1VvSHBlY1ZlcU5FdVkxUTN4ZnZ6VE5x?=
 =?utf-8?B?cWIya2RDTXJIM2FRVTZ4a2UwbUZYM1pMcnZlVDJ1UjNJR1Fqc09DNEZPVjVV?=
 =?utf-8?B?K1lhOUV2YWxkZHlWZmo5Q2JNdzJNQlJsREsrWkRycHoxaCswQWlsRkh3NHFy?=
 =?utf-8?B?L0F1bFMyMXZaa2xBbUZDeDB6S1JVTXFmYjlFWXhKM1VZQ29sR1MzTWtzcExX?=
 =?utf-8?B?L2d2WGk3aWlqbHJkdjBOVkpScG5rNGUvNXBGWXNVR1FvQVkwb1RBVDdiaGZQ?=
 =?utf-8?B?UUhDaDJKbCt3TzlYcERVb3AySElGRGQ2amJ4MnFFaXJUZXMwLzBjK1pQRXpP?=
 =?utf-8?B?OXp6VUViSDRqWFZxZk03S3U2R20rQVJvR0pwRWhKa1o1SStEaVI4bEFsMjZp?=
 =?utf-8?B?cDh6M1VPT1lYSG9UUk1tWWMyTzdpcmlUR0tOcU52b01FbHRIcEpYUnZSY1Vr?=
 =?utf-8?B?NG43cW5EUytZbFJQV2prb2NvRGFYR1RPN2hOQUNmSkw0THkwcWlONUFjTUZY?=
 =?utf-8?B?bS9pNnFiQmZJcGtDa2RMYU5vV1RNNzMyY1pFUC9KSStzM1NEU0xFK3dLcGND?=
 =?utf-8?B?VFIzS2NvSHpoVHNvT1pUNEdhRFRzQWtNVTdUYUFrTHJkbFlzMTFJWTFXWUdQ?=
 =?utf-8?B?SzBOS096TFJzMGFqSVVDMEdCZ25RWGRxUDI4MGkwMG01UmUwZ3RyUU45Z0Ru?=
 =?utf-8?B?UE5iNG5JMWQ3ME9lYjFnUnBHdG9lVVpFZXVGVy93Y1A5dk9YWHJxMnRCd2s0?=
 =?utf-8?Q?MZoZdFB4kkA68nFd8A/jzSByOPW64SVROL9KM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L1FBeTRIVzRlZFUrQnNWaXdQaVM4WVBXajU2cFVmVUlBY2tVcVZJMVJaZldB?=
 =?utf-8?B?VGNMRGhIT3hzZktWNWYxQnF1cnBpaUFpL2xiQmtVZmxHYzF2SlZ1dUFUZmxE?=
 =?utf-8?B?ejNIaFo4VlVGWkVnRGRuZTRiNTdDL04xdUQxdnltVEdWMHpWUnU0MVl2bHZ1?=
 =?utf-8?B?eEdBckZJT2ZVd3lhUEQ2ZXBUOXJOQTYrbytWV3o4UjJIMDlKRk5QbGdsMTkw?=
 =?utf-8?B?L243dCtnb0x1OVB3bUZ6R2ZMbHQ0RmwvUUNLaTU1ZnJXYTRET01oMWFXL1E4?=
 =?utf-8?B?VHBPWUF4WjhVeGtoWlZoWENFc0NkVDBzaEY5WE91anJvbkc4cnFGNlIzSlNy?=
 =?utf-8?B?TFkyVEt1dmorbUdqdGxyS09OUmx4MXdqZFhCbElGN3dWcXJ1VTh1NEVaWUJj?=
 =?utf-8?B?ay9HUWdXbFlUVk1mUWNVQ3BLelNWSVB4Nmcyd0U4dlpYL0k0L3pkazJTNVc2?=
 =?utf-8?B?eVdBZEo5QlVsNVRsdXFMWWx3TlBpdmhTTnZkMHFZVEQvVDA2T3JMbUhUUUhE?=
 =?utf-8?B?TW1PQXdsNm9nRERTeWVDQXo5dnF2eUdKbVpHTzhkdXplZ2JVUzY2TVlJYmJ5?=
 =?utf-8?B?N0dmV0N4dXFaandOMU5hMFVUd3hlY1hXU29LaEc1N095T2tzQ1JlLzFXZDg4?=
 =?utf-8?B?OEFnYlVSdmF0aENwa205Y0FlaytJVXQ0YWx2anIrMm5yajJoQjBzQmlMcHV1?=
 =?utf-8?B?eUhnWkZIek1KcWZURzA5cC9Cc1RoRWR5R243ZiswbFRjcnZGSjd3NzF6Q3ZV?=
 =?utf-8?B?djhDM095THVJNlJoUHVVdmFUNFViaVV6R2VDa2dScjNKVXRmQTgrelozNHJE?=
 =?utf-8?B?NTEzWlk2b2FEYWdEVUJpcm1rUTZ5NlFWZFJlSHlSNklNeDd4aHJvZmMwQ3Vp?=
 =?utf-8?B?a1UwV0RnNkZHZlMvRXJVZXJ3ZmdnSkkxbUQ1NnFHR251NVVrdmlzQ1BrUm1R?=
 =?utf-8?B?WTVlUFllTnNScEFzaG1QdW50MlRiY0VlUllTaEszUWo5Y0JDRFkvQkJZNndD?=
 =?utf-8?B?UUxacWk4anFRRTFqVVgwYTlydWtUUWVLQ0JSRW5rVWNyYWNTL2ZxTmRlSFZM?=
 =?utf-8?B?eXRNOE9pWmJWRElBR2VMcVBsS0t3S3l2U2FkZEw3b3VKQWVZbWV1SEU0SkRW?=
 =?utf-8?B?VWhLektJN0xueXdEZXN5Vk8xeWNKV21uM0RGVVN3aUx1RWJjeElrbzQzQjBp?=
 =?utf-8?B?QTE4eGNLNHo0c1lydWhKbktSV2N4Z2lnR1pOQ2JnU3VIeWhDSVRldFVyaUtD?=
 =?utf-8?B?MlFnMmdMS0lXM2lWeUFvSDIzbnIvQnB6RXFtNmpkT1dNRWJRdDhkQWJ6QllM?=
 =?utf-8?B?Z3hWMU1ycVRiZFVObDJaempQekVnclBDdGx6L0VBVXVXZFE5T1N1d1ErMHFI?=
 =?utf-8?B?UzFWYVNMVUZBV1hDNHA2WUZJa2RIUlZMUVNhTXFDZW9vWHV6bWtPUW8vRlp4?=
 =?utf-8?B?YlhuL0pkZzcyZENrYm5QUW85UktWNjcreTFIMGhKZ1FzWDRNeHQ2ZWtjdWhX?=
 =?utf-8?B?Z0xuVytyZ25Ld1JjT21mcG9wMjRQSDdZSkxEZ3paMkcwVk0wVC9renBFZ3pp?=
 =?utf-8?B?WTU4NHpuQS9nWWs4bGRjemxmcm5HODUzN2RRZURPbEtDaW40a2JCSmdsVnl5?=
 =?utf-8?B?WGxNT0RHbnEzazJjeEpWM21nZ1YzZEh4OUVxUW1MNG1JdHdJOStlVkNvUWUw?=
 =?utf-8?B?SHBsU0xueXoyejdBbEt3TnBuQVJTeWFGdlJoTDNOa2FIKy9JUVkzWXdMeGVo?=
 =?utf-8?B?eE4xcmdlY2d1MUJTMU8wdWpIeFFaYkZxbFpSTE1qTnpKSXMrckM4NUlVQlVY?=
 =?utf-8?B?SDhwRDR0RDVzalZNNUJKdjdtSDM5WU1SVWp1TWdIeHoyQk1NSjFnRXRVNEU4?=
 =?utf-8?B?OGFJWFdYZnpPdEpPUllVNFcwYWVTVlBaSUpHc0QrUUpoTithY2RiQTVvaXZh?=
 =?utf-8?B?Vi96aVVXcFhoVWxFbGRNeSt4ZW5rbXpvYzFkTE85WTlOMFU5SndiOTVaeWtt?=
 =?utf-8?B?ZC9lNlNtejFHQ1VwU1hjOWRFTEpCRmt6NVU1ZzVxalI0dks4NlpPSXozY0Fi?=
 =?utf-8?B?TzBOL1RqekJlQWtaNGlZNW5tRDBhTWM4dlZDaEZsZkNPMEtTRWFkZjRUWGVI?=
 =?utf-8?Q?IRYU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <325A37A1EE1AA34D91BDE5EA2A45D256@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0036de59-f790-4d05-6ca9-08dcfc96774f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2024 06:03:55.6342
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yll9nF5M8B7xabCUGymB77qfWSdXmbMQSSnMX1Ea54GghdC4V/Hi7H+uqKKvDyVm8a+uoMVn/D0FE+HbRxZDwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9449

T24gMjAyNC8xMS8xIDIxOjA5LCBTdGV3YXJ0IEhpbGRlYnJhbmQgd3JvdGU6DQo+IE9uIDEwLzI0
LzI0IDA1OjA2LCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IGRpZmYgLS1naXQgYS9ody94ZW4veGVu
X3B0LmMgYi9ody94ZW4veGVuX3B0LmMNCj4+IGluZGV4IDM2MzVkMWIzOWY3OS4uNWIxMGQ1MDFk
NTY2IDEwMDY0NA0KPj4gLS0tIGEvaHcveGVuL3hlbl9wdC5jDQo+PiArKysgYi9ody94ZW4veGVu
X3B0LmMNCj4+IEBAIC03NjYsNiArNzY2LDUwIEBAIHN0YXRpYyB2b2lkIHhlbl9wdF9kZXN0cm95
KFBDSURldmljZSAqZCkgew0KPj4gIH0NCj4+ICAvKiBpbml0ICovDQo+PiAgDQo+PiArI2lmIENP
TkZJR19YRU5fQ1RSTF9JTlRFUkZBQ0VfVkVSU0lPTiA+PSA0MjAwMA0KPj4gK3N0YXRpYyBib29s
IHhlbl9wdF9uZWVkX2dzaSh2b2lkKQ0KPj4gK3sNCj4+ICsgICAgRklMRSAqZnA7DQo+PiArICAg
IGludCBsZW47DQo+PiArICAgIGNoYXIgdHlwZVsxMF07DQo+IA0KPiBBIGJyaWVmIGluLWNvZGUg
Y29tbWVudCB0byBleHBsYWluIGhvdyB5b3UgYXJyaXZlZCBhdCAxMCB3b3VsZCBiZQ0KPiBhcHBy
ZWNpYXRlZC4NClRoZSBtYXggbnVtYmVyIG9mIGNoYXJhY3RlcnMgaW4gdGhlIGRlc2NyaXB0aW9u
IG9mIHRoZSAiZ3Vlc3RfdHlwZSIgaXMgNCAoIlBWSCIgcGx1cyBsaW5lIGJyZWFrKS4NCkkgc2V0
IGl0IHRvIDEwIHRvIHByZXZlbnQgbG9uZ2VyIGRlc2NyaXB0aW9uIHR5cGVzIGluIHRoZSBmdXR1
cmUuDQpEbyB5b3UgaGF2ZSBhbm90aGVyIHN1Z2dlc3QgbnVtYmVyPw0KDQo+IA0KPj4gKyAgICBj
b25zdCBjaGFyICpndWVzdF90eXBlID0gIi9zeXMvaHlwZXJ2aXNvci9ndWVzdF90eXBlIjsNCj4+
ICsNCj4+ICsgICAgZnAgPSBmb3BlbihndWVzdF90eXBlLCAiciIpOw0KPj4gKyAgICBpZiAoZnAg
PT0gTlVMTCkgew0KPj4gKyAgICAgICAgZXJyb3JfcmVwb3J0KCJDYW5ub3Qgb3BlbiAlczogJXMi
LCBndWVzdF90eXBlLCBzdHJlcnJvcihlcnJubykpOw0KPj4gKyAgICAgICAgcmV0dXJuIGZhbHNl
Ow0KPj4gKyAgICB9DQo+PiArICAgIGZnZXRzKHR5cGUsIHNpemVvZih0eXBlKSwgZnApOw0KPiAN
Cj4gUGxlYXNlIGNoZWNrIHRoZSByZXR1cm4gdmFsdWUgb2YgZmdldHMuDQpXaWxsIGNoYW5nZSBp
biBuZXh0IHZlcnNpb24uDQoNCj4gDQo+PiArICAgIGZjbG9zZShmcCk7DQo+PiArDQo+PiArICAg
IGxlbiA9IHN0cmxlbih0eXBlKTsNCj4gDQo+IEJlZm9yZSBwYXNzaW5nIHRvIHN0cmxlbiwgaXMg
InR5cGUiIGFsd2F5cyBndWFyYW50ZWVkIHRvIGhhdmUgYQ0KPiB0ZXJtaW5hdGluZyAnXDAnIGNo
YXJhY3Rlcj8NClllcywgImZnZXRzIiB3aWxsIGd1YXJhbnRlZSB0aGF0LCBhbmQgSSB3aWxsIGFk
ZCBjaGVjayBmb3IgImZnZXRzIiB3aGVuIGl0IHJldHVybnMgTlVMTCBpbiBuZXh0IHZlcnNpb24u
DQoNCj4gDQo+PiArICAgIGlmIChsZW4pIHsNCj4+ICsgICAgICAgIHR5cGVbbGVuIC0gMV0gPSAn
XDAnOw0KPj4gKyAgICAgICAgaWYgKCFzdHJjbXAodHlwZSwgIlBWSCIpKSB7DQo+PiArICAgICAg
ICAgICAgcmV0dXJuIHRydWU7DQo+PiArICAgICAgICB9DQo+PiArICAgIH0NCj4+ICsgICAgcmV0
dXJuIGZhbHNlOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgaW50IHhlbl9wdF9tYXBfcGlycV9m
b3JfZ3NpKFBDSURldmljZSAqZCwgaW50ICpwaXJxKQ0KPj4gK3sNCj4+ICsgICAgaW50IGdzaTsN
Cj4+ICsgICAgWGVuUENJUGFzc3Rocm91Z2hTdGF0ZSAqcyA9IFhFTl9QVF9ERVZJQ0UoZCk7DQo+
PiArDQo+PiArICAgIGdzaSA9IHhjX3BjaWRldl9nZXRfZ3NpKHhlbl94YywNCj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgUENJX1NCREYocy0+cmVhbF9kZXZpY2UuZG9tYWluLA0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzLT5yZWFsX2RldmljZS5idXMs
DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHMtPnJlYWxfZGV2aWNl
LmRldiwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcy0+cmVhbF9k
ZXZpY2UuZnVuYykpOw0KPj4gKyAgICBpZiAoZ3NpID49IDApIHsNCj4+ICsgICAgICAgIHJldHVy
biB4Y19waHlzZGV2X21hcF9waXJxX2dzaSh4ZW5feGMsIHhlbl9kb21pZCwgZ3NpLCBwaXJxKTsN
Cj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICByZXR1cm4gZ3NpOw0KPj4gK30NCj4+ICsjZW5kaWYN
Cj4+ICsNCj4+ICBzdGF0aWMgdm9pZCB4ZW5fcHRfcmVhbGl6ZShQQ0lEZXZpY2UgKmQsIEVycm9y
ICoqZXJycCkNCj4+ICB7DQo+PiAgICAgIEVSUlBfR1VBUkQoKTsNCj4+IEBAIC04NDcsNyArODkx
LDE2IEBAIHN0YXRpYyB2b2lkIHhlbl9wdF9yZWFsaXplKFBDSURldmljZSAqZCwgRXJyb3IgKipl
cnJwKQ0KPj4gICAgICAgICAgZ290byBvdXQ7DQo+PiAgICAgIH0NCj4+ICANCj4+ICsjaWYgQ09O
RklHX1hFTl9DVFJMX0lOVEVSRkFDRV9WRVJTSU9OID49IDQyMDAwDQo+PiArICAgIGlmICh4ZW5f
cHRfbmVlZF9nc2koKSkgew0KPj4gKyAgICAgICAgcmMgPSB4ZW5fcHRfbWFwX3BpcnFfZm9yX2dz
aShkLCAmcGlycSk7DQo+PiArICAgIH0gZWxzZSB7DQo+PiArICAgICAgICByYyA9IHhjX3BoeXNk
ZXZfbWFwX3BpcnEoeGVuX3hjLCB4ZW5fZG9taWQsIG1hY2hpbmVfaXJxLCAmcGlycSk7DQo+PiAr
ICAgIH0NCj4+ICsjZWxzZQ0KPj4gICAgICByYyA9IHhjX3BoeXNkZXZfbWFwX3BpcnEoeGVuX3hj
LCB4ZW5fZG9taWQsIG1hY2hpbmVfaXJxLCAmcGlycSk7DQo+PiArI2VuZGlmDQo+PiArDQo+PiAg
ICAgIGlmIChyYyA8IDApIHsNCj4+ICAgICAgICAgIFhFTl9QVF9FUlIoZCwgIk1hcHBpbmcgbWFj
aGluZSBpcnEgJXUgdG8gcGlycSAlaSBmYWlsZWQsIChlcnI6ICVkKVxuIiwNCj4+ICAgICAgICAg
ICAgICAgICAgICAgbWFjaGluZV9pcnEsIHBpcnEsIGVycm5vKTsNCj4+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2h3L3BjaS9wY2kuaCBiL2luY2x1ZGUvaHcvcGNpL3BjaS5oDQo+PiBpbmRleCBlYjI2
Y2FjODEwOTguLjA3ODA1YWE4YTVmMyAxMDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUvaHcvcGNpL3Bj
aS5oDQo+PiArKysgYi9pbmNsdWRlL2h3L3BjaS9wY2kuaA0KPj4gQEAgLTIzLDYgKzIzLDEwIEBA
IGV4dGVybiBib29sIHBjaV9hdmFpbGFibGU7DQo+PiAgI2RlZmluZSBQQ0lfU0xPVF9NQVggICAg
ICAgICAgICAzMg0KPj4gICNkZWZpbmUgUENJX0ZVTkNfTUFYICAgICAgICAgICAgOA0KPj4gIA0K
Pj4gKyNkZWZpbmUgUENJX1NCREYoc2VnLCBidXMsIGRldiwgZnVuYykgXA0KPj4gKyAgICAgICAg
ICAgICgoKCh1aW50MzJfdCkoc2VnKSkgPDwgMTYpIHwgXA0KPj4gKyAgICAgICAgICAgIChQQ0lf
QlVJTERfQkRGKGJ1cywgUENJX0RFVkZOKGRldiwgZnVuYykpKSkNCj4+ICsNCj4+ICAvKiBDbGFz
cywgVmVuZG9yIGFuZCBEZXZpY2UgSURzIGZyb20gTGludXgncyBwY2lfaWRzLmggKi8NCj4+ICAj
aW5jbHVkZSAiaHcvcGNpL3BjaV9pZHMuaCINCj4+ICANCj4gDQoNCi0tIA0KQmVzdCByZWdhcmRz
LA0KSmlxaWFuIENoZW4uDQo=

