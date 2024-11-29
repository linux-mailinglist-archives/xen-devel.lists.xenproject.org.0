Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD369DC12B
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2024 10:11:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845787.1261125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGx1v-0004LM-Sq; Fri, 29 Nov 2024 09:11:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845787.1261125; Fri, 29 Nov 2024 09:11:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGx1v-0004Jg-Ps; Fri, 29 Nov 2024 09:11:15 +0000
Received: by outflank-mailman (input) for mailman id 845787;
 Fri, 29 Nov 2024 09:11:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NNyS=SY=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tGx1t-0004JY-Ja
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2024 09:11:13 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2416::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd525480-ae31-11ef-99a3-01e77a169b0f;
 Fri, 29 Nov 2024 10:11:07 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CH3PR12MB7737.namprd12.prod.outlook.com (2603:10b6:610:14d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Fri, 29 Nov
 2024 09:11:02 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.8207.010; Fri, 29 Nov 2024
 09:11:02 +0000
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
X-Inumbo-ID: dd525480-ae31-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNjo6NjFmIiwiaGVsbyI6Ik5BTTExLUNPMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImRkNTI1NDgwLWFlMzEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyODcxNDY3LjcyNzIxMiwic2VuZGVyIjoiamlxaWFuLmNoZW5AYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EkZZkGiewAcLO2oIx6KXRfF9/uYpABvCI7ailLZ44xutGUL43HBxq+SVB9zpb0b9Qf65RBb4A5PrWAoZAOXisOYFGEuYkt+3i4oeeoTOcYl6gFgAbWmyLl0ecJiCkNMdnc1TU+gD1imcc8nHmXeFs4za6j1PCk9ZpywDfCaUEG2kK9B55X0DFBzcwwDCC/tSkLEzjrPWLCMdHaN62J1wt+wdQeRUSTPmf7WdE7KBOkmbyBtVe/L/9KJp+/Dtkj9aBkQhFwQE+X/rYCKvQ5ULj5+r9kp7uTGa8IraYtMEPmJmdJbcte+c7iuAZcg6Tvbzb3TnJzPBaHKn9MsLu84JEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XkypCtvj4fuEFCAWhn4mfK3b2hlonmzxLHtwleu+YpQ=;
 b=SQXfiVxcCVEx9zs+yPo3mFAI+hVc37i4FUITwvTe9NFrc+bJl5359X45saKsen0TwoW9P2bdNf60lNjs7dYYS5h/efydS4hesWomuVTLUcHMsZH0YORGMgtRFDGNpw2ryXBWB3VuaB2X3r74R0RwjXTJ223EQAfjRAiOnXm9f0HtB+s9FFTTP2eWqec51JmbTufwyPVwDZ7eOJ3YPGdZYGDPPqMNAjkUInnb3qGRHcAndHLjG2NJwG5tTfMx/Ief12B4aHCVijZVtnykvmMe+0ryHFA7DuB1T6FwKKCI2qUCM+R4aZTa3QLWc2H+W02xotRtVjoXpSS+90pywGVqlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XkypCtvj4fuEFCAWhn4mfK3b2hlonmzxLHtwleu+YpQ=;
 b=wvrQhEjFVNOcBAWmKO+NeiQUw+RVxmows3qiIkfIib89wH6HPKglOabnO/xfY7u+cc2wVv+abUpMMQnngSLVYhQUH7H7eGLRcaHX1q6Xk+WZ/Mxnpct2eEDLrGSvGqlsU4lRUxh8Z/8qjPgE3qB0OvSopysVaKs61Iwzp0JOCIU=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
	<marcel.apfelbaum@gmail.com>
CC: Anthony PERARD <anthony@xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, "Edgar E . Iglesias"
	<edgar.iglesias@gmail.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [QEMU PATCH v10] xen/passthrough: use gsi to map pirq when dom0
 is PVH
Thread-Topic: [QEMU PATCH v10] xen/passthrough: use gsi to map pirq when dom0
 is PVH
Thread-Index: AQHbMBN9zgKXu6QHp0mudGAMtCr+w7K9RysAgBFY+YA=
Date: Fri, 29 Nov 2024 09:11:02 +0000
Message-ID:
 <BL1PR12MB5849E753D856330CB02ACBADE72A2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20241106061418.3655304-1-Jiqian.Chen@amd.com>
 <Zztlvl0m-Oi2XGXq@l14>
In-Reply-To: <Zztlvl0m-Oi2XGXq@l14>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8207.007)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CH3PR12MB7737:EE_
x-ms-office365-filtering-correlation-id: f352c1c2-9cae-4d52-1092-08dd1055bf4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cXBTZWNOcmt3NjIvNTROVG82TW02Wno0NXB4L0g2OGpZYXEvMjNiaGh2N1Rn?=
 =?utf-8?B?YlJvNDNLZWQvK1lxVGt6MlVJdGEvYkRsc1ZEVTFQTnhreU1PNi9mVFNsTXc3?=
 =?utf-8?B?U0htOEJvVHRPeWVCWXVyVFowQlRMZG5qcGdGWGc3NGVDMU1RR0UwL2RHMDBu?=
 =?utf-8?B?YXl3bWN6Tk5jUUhGZmFYVzRhUVA4R21WUzJ2R0E2Q3d2cXl4akxRNXZkbTF2?=
 =?utf-8?B?QzRiZ05qdU9mdytYRWI2eUoyUEQvcFdtb1dvaHFQVkRUWHFyRkVYcUtkeVVV?=
 =?utf-8?B?enUzMDNYWElqOGl6a1lkTXE2RWEzQ2lSaTZubXFneThVUXBNNWZ1TzdlSTFS?=
 =?utf-8?B?UzIvUXF6L1ZZTHc1TGxGekRqWmd4VWFURTgrNko3bWx4WWZyRUo5SU9Ra1ox?=
 =?utf-8?B?eGplemtXMlVMZGJFYzVxNFBNbk1Ub0ZHZjM5UnVVRnU4TG5oT21aQnplbmx2?=
 =?utf-8?B?VmM3VVp4bWMzWHR4K2NFSHVrZENMRHlwbklJZmluR0QydFVnN09SVGNJcE5U?=
 =?utf-8?B?R3pBUlRtNmFTc0VSUUNHcXRDV2NZcmlOK2huZDVDZU90aWFkejAvTHhDUERl?=
 =?utf-8?B?d3pMdDVhRUlLZGdVV0pod3NUS1llWW5MR204R29rMUJoZU9ZOHRGTkhSb0Rr?=
 =?utf-8?B?dnlMam90dExlQXBQY010ZXRKL25Fbk9sWk85YXhIUTVOWExBeDVXeEFWcGZP?=
 =?utf-8?B?M2M0Qkw0SmROV0RNMkIrYzE1NjVFcDRiTEw2QVBZRVBlMEhXMjMzMEpPZWti?=
 =?utf-8?B?TWVYdkJ0Zmh3QWhUdEk1UjRPQ0dJSnkyNUd2dlpwWFdQc25zSk4waTFjMkl1?=
 =?utf-8?B?bFdwQStoM0ROa3Y4Nll6aFh3b3QvWG9lblBzN3EydmlrUEZyOFhoNExkZTZR?=
 =?utf-8?B?QmNGbms0bU5EOHQ2alE4cGFpTlNTYmZoS0phQ1JpSGNzWVUrMmExd2hWdUw0?=
 =?utf-8?B?SS9JNWJEUklzV055SWpnVDFoTW1jYmVyaGloZVpkVUNjSStQZTdlNFJLamx5?=
 =?utf-8?B?OVZMaUtTQkRNSUNiWkFHYkxUdmN2Ym1qcmE1OFVTSWZPN2lGTThFSWxaRkF6?=
 =?utf-8?B?alN6cTFWVzZyMkdpb2lkZHJTbXl5MkRCTHJLNTVXbXZoKzN6TWJWT2x2bjJo?=
 =?utf-8?B?NkJERm0xQW5OWmdUVlBtS2dOUGZBY0d0Wm5QMXRIMWxWSWtsd0ZUVDBZM1lY?=
 =?utf-8?B?UFdiS1JjYmZRdFNsUW93bmxjeG9VWkVFRmRoTUVWSGNmQW5QalJGRzM2cklG?=
 =?utf-8?B?L2tjN1pXNFpJMWNsUUgvODBia3l5V2pnbjZzWll4Wk1RRnhrVGFFQzYzc01s?=
 =?utf-8?B?cUU1UFlLc0lLdjZpNC9IOWpoNmFVY3hNdnVVUGhNMVRZTWJvd2FqdlVEYVg1?=
 =?utf-8?B?U2RPVmdxOWhDZUlEOG5YZnRoakkwL1ZWa3Y1cFE1YllxUUFMMWhxc2pabTd3?=
 =?utf-8?B?aTM4LzQ5TFdkTFBIdXlBNFFnZlVlMXh4NGkwQXg5N1hUbEFVMFBNbC9UanE2?=
 =?utf-8?B?dm5iWHJ4bzRBV1NId0ZTOVhzbk1uVyttTmYzK3UrWE04aUtHR3M1SkhtT0tF?=
 =?utf-8?B?WmxGS2hJaVBnWFpQcTZvd0tySnRhQnV5OVFOYnpGaDI0Z2lkVG04bVpUc3M2?=
 =?utf-8?B?dWNhUDljRjNwRGZOTEw3M2c0MVd6Mm9KQ1AxbUJrenN3bStEUS9jOFZDMWhZ?=
 =?utf-8?B?WmcxWW1qaDNNQW9TN0wzbjNZMUE5QUtVbDdXajR4dHRhRjFSU3hoWnZSeGQ2?=
 =?utf-8?B?Q3U1a1BQZ3pHbEJsVnBkZWZMT214OXB6dkZCTGVTdnVuTGJtNVczNTFwWmU0?=
 =?utf-8?B?NU0yaDU3VGI0ZDJHSlVuZnRpY1M4ay9EOEthUXhvS25sZjNXYW1PQURoc01G?=
 =?utf-8?B?TkNHbGdlKzVkRHhiRjdtWjN5T0ppYnpDR3hIZmdMd0V5S3c9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q0dBUm1IMnl2R0VMZ3E5ZzBaU0E4TmhrclJ6ZERMVzJwMVBXYWNzbmdkYmNv?=
 =?utf-8?B?VXY2bFNidHpZbUlidGhxN0IrVVNTRWxmNW4vajEwY2Jpa0RrbXpUSkVCM3Bq?=
 =?utf-8?B?OHZRSDZ5ZXQyWndtcmltZmFGTnptOG82VndpTEFwbC91S3N6OUNWY0ljdVU4?=
 =?utf-8?B?UUdJVzVBRHpEWTVJK2xzNmtBWW12VkFpNFdZRlREQmo1Ukg0K2tpRnB0M21I?=
 =?utf-8?B?QXpEZTV1UnNQMnJ1YWE5alpqMDF5bXFKRThTVzlPQ0VVckVBSzlYNm9hd1Bz?=
 =?utf-8?B?bXhsd3FqTUxwZlR4VDJ6UHNqZFF1OGNPMnh3REt0dlFBSWN3ZjdxS1lxYU96?=
 =?utf-8?B?M1BoRVdZeVo5UHkzK0Z4ZjBWaU9wSmxqWk9iRjg5VlJxelpLNFFrQUcvVldO?=
 =?utf-8?B?R1lxU3UvYmRDUi81TnV1L3pRc2kvYXJWQ2ZKbVREVy9mTFpVWlhOKzEvemdI?=
 =?utf-8?B?d0U5SWJON29mbTNuVjllUUJFMTRFRjJ0aDA5cDVBQVJNaC95Y2lUdDhjc3J0?=
 =?utf-8?B?R085SW4wTUpLZG5DckZLM2h4UllWNUZzODlMNk5zTGh6ak1UWmtvR0V4WEdH?=
 =?utf-8?B?TEtRd3ZkRmNNMmJwRVM4YlROVzN2YWZMd3FHRCtjRWUyeGhIMkprS0RIM24y?=
 =?utf-8?B?N2x4dUdsNHdDMlF4VDlFNE9uL29PbzNaKzFRU0o4Z0k2R2R2QzRVT05ZU2p5?=
 =?utf-8?B?UWtWUHAvVmNKUjB0ZGl2b3lucGtleFJ1Zk5xU3BkcmgzbTAwaWtMZ0d1bkl0?=
 =?utf-8?B?UVExUEVPN05WYkZhVTJxOTdvUUJiVDVmUHhwZUF4MUNaSE4zakNza25vZURH?=
 =?utf-8?B?YThDN0ZQaWRrb0VzMjVqclZQN05iamJIbU9YNFEyWGJ3NVdSaHV6dnVwNmJF?=
 =?utf-8?B?aHNRb2NJUlV5MVJqU3Q5SFBkM3IwelhrVXR4RGpuOWhCZXk2cDJTeVUxL29K?=
 =?utf-8?B?aFJTdy9kODJ6eTB5a240RndVVHJENkd1Y3JnMVdCMU1pcEptYTVubjhkTXlN?=
 =?utf-8?B?Y2pUTmZ6RnBPY2w3RzFpUTd3Zk56VHVMOUxoTW03NFN0NFgvOGl2Ni9ENzVz?=
 =?utf-8?B?ZVZ3aEkrdld2WHRYanlvVHlicEVoVWp1NFgxeS9iR3p0WEpUSi8yS1pabUZi?=
 =?utf-8?B?WkpvMWQ1ZEVSdzNuTnoxWWtBWVAyU3QvMzU4Z09QN2FDWERnYTNkRHFMZkhG?=
 =?utf-8?B?UTBHaEZiS1E5cFlZR3N3UEtpRWd2dFBaL1VBOUFTVFZEaHdEUXd4N0UzZ2to?=
 =?utf-8?B?SVpueTZNMDhuNFJubk0ranR3dHdFbXNIbzVFcnZwVmoxMzBwMEV6aEl4SU5U?=
 =?utf-8?B?YlFXY2R2eUd2aVNuZnNTSlJVeXZIT1pPQkFTZndXQkFjL3FHWkh2NU1idlRi?=
 =?utf-8?B?MngzUVh2TFQ2eVV1V21ya0xqQmZrUTNpa3pRbThiRng1N1VkVWsxODdaS0Rt?=
 =?utf-8?B?c0U1a3BPcWp1ZGN5UTdkSGd2M0NEQlZ3RjdNUUM4ZEo1VEUwUDhYQkQ3MHp0?=
 =?utf-8?B?b2Yxam1VcXJzWHl4UTluZU9Ia21RTDQrMGNGVG1tWElPZzRFbExCRUR6c3Fy?=
 =?utf-8?B?eXMrYktMT0F4djc4RmloYTBCWFgrVEFmdWRHQzNjNmhzb0ExZERVN0ZYaDhF?=
 =?utf-8?B?R3U3aXV2M3J1amdBSHI0aEYrZzF2U2hyaFBmdTRsdG1aWlVpOGdURm5mVEM4?=
 =?utf-8?B?Y243UWJJTzU1RXVsZVRBZUZlZXdjV2tEV3dESUhxQkJlQlVuVy9zb2FYUGg3?=
 =?utf-8?B?bkVrOGg0TldVTkFFMUJjR0JvYUsrNDN6WWdGMm1YR0JiNkNWVlh4cEpFOU1x?=
 =?utf-8?B?dG9pN1BFSkpsUHZzQ082cVZrZHNrSzJ6R1pjZTRYYmVCdDFwekRNOFRJQ3NE?=
 =?utf-8?B?MVYzcEg1WjJOZXl5Q1krMFdUMDhWN2s5aWFVNkUzMGViMkZuamVJcmpwQVMy?=
 =?utf-8?B?Vzl0ZmkrVzAvc0dGUHNOYUtZVW1obnFwc1lpK0tYVnJPbEVhc0E5RUQrbGNN?=
 =?utf-8?B?QlNLTXd1YS9mZUwwamZydW5ZZ2dmZzFuTVlweEIzUTZPUGNjbnhQV2ticlJa?=
 =?utf-8?B?NFRYaE1zRTNNVC9ZcHQ4VFB3UmpJNTdWaGg5NTNWS2lXSEZBMlZEL1N4N2xP?=
 =?utf-8?Q?V+r8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <991A566CD3F9554AB237BBD0EFE38CD9@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f352c1c2-9cae-4d52-1092-08dd1055bf4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2024 09:11:02.3535
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XDoh6F6BhyKQYGACxEcoOHlS3QicOaNRe2NEt9D+068gkWHI/onrHYA4HctL+szIlhUlm6PsvBpjFpahIHGVjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7737

T24gMjAyNC8xMS8xOSAwMDowNSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+IE9uIFdlZCwgTm92
IDA2LCAyMDI0IGF0IDAyOjE0OjE4UE0gKzA4MDAsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4gSW4g
UFZIIGRvbTAsIHdoZW4gcGFzc3Rocm91Z2ggYSBkZXZpY2UgdG8gZG9tVSwgUUVNVSBjb2RlDQo+
PiB4ZW5fcHRfcmVhbGl6ZS0+eGNfcGh5c2Rldl9tYXBfcGlycSB3YW50cyB0byB1c2UgZ3NpLCBi
dXQgaW4gY3VycmVudCBjb2Rlcw0KPj4gdGhlIGdzaSBudW1iZXIgaXMgZ290IGZyb20gZmlsZSAv
c3lzL2J1cy9wY2kvZGV2aWNlcy88c2JkZj4vaXJxLCB0aGF0IGlzDQo+PiB3cm9uZywgYmVjYXVz
ZSBpcnEgaXMgbm90IGVxdWFsIHdpdGggZ3NpLCB0aGV5IGFyZSBpbiBkaWZmZXJlbnQgc3BhY2Vz
LCBzbw0KPj4gcGlycSBtYXBwaW5nIGZhaWxzLg0KPj4NCj4+IFRvIHNvbHZlIGFib3ZlIHByb2Js
ZW0sIHVzZSBuZXcgaW50ZXJmYWNlIG9mIFhlbiwgeGNfcGNpZGV2X2dldF9nc2kgdG8gZ2V0DQo+
PiBnc2kgYW5kIHVzZSB4Y19waHlzZGV2X21hcF9waXJxX2dzaSB0byBtYXAgcGlycSB3aGVuIGRv
bTAgaXMgUFZILg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBDaGVuIDxKaXFpYW4uQ2hl
bkBhbWQuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNv
bT4NCj4+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBDaGVuIDxKaXFpYW4uQ2hlbkBhbWQuY29tPg0K
PiANCj4gQWNrZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255QHhlbnByb2plY3Qub3JnPg0K
PiANCj4gQnV0LCB0aGlzIGZvbGxvd2luZyBjaGFuZ2UgcHJvYmFibHkgbmVlZHMgYW4gYWNrIGZy
b20gUENJIG1haW50YW5lcnMsDQo+IENDZWQuDQoNCkNvdWxkIHlvdSBwbGVhc2UgYWRkIHNvbWUg
Y29tbWVudHMgb24gYmVsb3cgY2hhbmdlcz8NCg0KPiANCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2h3L3BjaS9wY2kuaCBiL2luY2x1ZGUvaHcvcGNpL3BjaS5oDQo+PiBpbmRleCBlYjI2Y2FjODEw
OTguLjA3ODA1YWE4YTVmMyAxMDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUvaHcvcGNpL3BjaS5oDQo+
PiArKysgYi9pbmNsdWRlL2h3L3BjaS9wY2kuaA0KPj4gQEAgLTIzLDYgKzIzLDEwIEBAIGV4dGVy
biBib29sIHBjaV9hdmFpbGFibGU7DQo+PiAgI2RlZmluZSBQQ0lfU0xPVF9NQVggICAgICAgICAg
ICAzMg0KPj4gICNkZWZpbmUgUENJX0ZVTkNfTUFYICAgICAgICAgICAgOA0KPj4gIA0KPj4gKyNk
ZWZpbmUgUENJX1NCREYoc2VnLCBidXMsIGRldiwgZnVuYykgXA0KPj4gKyAgICAgICAgICAgICgo
KCh1aW50MzJfdCkoc2VnKSkgPDwgMTYpIHwgXA0KPj4gKyAgICAgICAgICAgIChQQ0lfQlVJTERf
QkRGKGJ1cywgUENJX0RFVkZOKGRldiwgZnVuYykpKSkNCj4+ICsNCj4+ICAvKiBDbGFzcywgVmVu
ZG9yIGFuZCBEZXZpY2UgSURzIGZyb20gTGludXgncyBwY2lfaWRzLmggKi8NCj4+ICAjaW5jbHVk
ZSAiaHcvcGNpL3BjaV9pZHMuaCINCj4gDQo+IFRoYW5rcywNCj4gDQoNCi0tIA0KQmVzdCByZWdh
cmRzLA0KSmlxaWFuIENoZW4uDQo=

