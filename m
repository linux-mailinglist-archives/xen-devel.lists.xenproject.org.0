Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C1384B533
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 13:31:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676882.1053202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXKbC-0004fe-AW; Tue, 06 Feb 2024 12:30:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676882.1053202; Tue, 06 Feb 2024 12:30:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXKbC-0004ds-6n; Tue, 06 Feb 2024 12:30:50 +0000
Received: by outflank-mailman (input) for mailman id 676882;
 Tue, 06 Feb 2024 12:30:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nZJ8=JP=epam.com=prvs=87667faf2e=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1rXKbB-0004dm-1A
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 12:30:49 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8cf5d1d9-c4eb-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 13:30:46 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 416Bo7GN003642; Tue, 6 Feb 2024 12:30:42 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2051.outbound.protection.outlook.com [104.47.0.51])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3w355a28jy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Feb 2024 12:30:42 +0000 (GMT)
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by PAWPR03MB9155.eurprd03.prod.outlook.com (2603:10a6:102:340::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Tue, 6 Feb
 2024 12:30:38 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::82af:59a5:4446:9167]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::82af:59a5:4446:9167%4]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 12:30:38 +0000
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
X-Inumbo-ID: 8cf5d1d9-c4eb-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVmDq/FgSdIlQfS7hCz9xbOFKGHzYD5ecsBFcnS/vEIHhiFhQ+TxxcIsSVBYH4F+jzstCAQxadQIDHmFr+Z0AhudJESOkzHmgbLPgQsM/EXZCQDVqvHt2SJKUOry52uvs+IcXSPMR3Nxv101r0LilzX//am919R1ZRFCasB96EjAjLiu59pz90Kv8OCVG6XQnl2hnQxT721sJ6wPUbWgpG7TopctBusssQI6MBAFhqa5F8n84zozKvYslDLl2INKL1b5LZh9tGZk/SEsolXwP+9d+jdlehvuz2cE4Y/tjopWNW8fXLMn66CmEbnDI5w8YRSUJSCbRIbPVFSeSgMOCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjTwo6Y8AhEnUu4RAdJb86EaseaQxPTBS9Cm49fcLlo=;
 b=XJKAnmV0DDZ/U+GCwpxAVQzmhb/c4oUi/fnd0Ekb95Ly3/xQWcfork9j9Y/iWZFUfMSnHuL4winqelTAZcDBb9IoM30KOEIzOn9nswZSh//d6/RiSsEpnTvAJ3ts/J6aPTSxoOcg2c2o/42h0uBwEDDcwO197e8gQnAa4tKfd5RDzhTCiBTS/Xntz3rDUi8pVScom8wBRusFXeS48o/30DeXbgsi/1MMJUgxFtG1jEynSgb4UHBtbYn10R1EhGMxzUtB9ai/nUO59cDVGkLyISIKDEzYFqcjcJb+jxZbXeUJgmHYhxFsWzm3LGbU6+5ZfAynJZuHCReHYnZPSA4ENA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjTwo6Y8AhEnUu4RAdJb86EaseaQxPTBS9Cm49fcLlo=;
 b=CrZicSFu2diSlpCHibFWOGngxwlA40TTfr1Uxeqo99Yo9/QW2RMn2eSD7QmUU8OGvoWeSrTRLFiaZCK4xJRANUz8LSlKRWW9b9zQ0QTt1RKX4rmPNKazC5L999refcIUcQ6zSzfg3L2E8vbKTsBUKDjeYe+Mu3rb66dlK+flcu/YbaoYu0eLXO3lcCHYbjsIweBLtGTGk0RVjOEoKPmRniCNpYGObU50FlvuTqNJPvfwDknyNNbITbMSnoWMlcsEVTkdiJmjS9f7om0xsq+4aAakexfn3AqMTKIIkQT8RJVmIIo+4Gxj5aBcYZQhanIB+t8lcBIOtqfjaKjOf40kbA==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Wei Liu
	<wl@xen.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>,
        George Dunlap
	<george.dunlap@citrix.com>,
        Nick Rosbrook <rosbrookn@gmail.com>, Juergen
 Gross <jgross@suse.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] libxl: Add "grant_usage" parameter for virtio disk
 devices
Thread-Topic: [PATCH] libxl: Add "grant_usage" parameter for virtio disk
 devices
Thread-Index: AQHaVcWXJV0m8uwkbEKeSgAhd5N6SLD734GAgAAcRoCAASbqgIAAIlMA
Date: Tue, 6 Feb 2024 12:30:38 +0000
Message-ID: <ce3dedb7-2e66-477d-bafa-485b1261a504@epam.com>
References: <20240202104903.1112772-1-olekstysh@gmail.com>
 <ace5b3c8-38e7-4661-9401-ac9ac77a5e9f@perard>
 <78bc7890-cfcb-4de4-a676-a3c2bbbb6d9f@epam.com>
 <d7291530-9e32-43dc-8b82-34d3962d2551@perard>
In-Reply-To: <d7291530-9e32-43dc-8b82-34d3962d2551@perard>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR03MB6108:EE_|PAWPR03MB9155:EE_
x-ms-office365-filtering-correlation-id: 80c750cb-3aa8-4c79-00cf-08dc270f6cc0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 TpTfjKkZAVCcfUtxwJts0oLEkzI1zIzABvu8rM5mVGP2Dg+7miV7nunC5UU/WGIZUyZEq9JLIfo0OxsuoD3FOColrGszZb9zJyRnH0N/wu3fqc52toSbtq0viF6pzS7veJJeehyWUxk9tqpz59z+e9EZHQRWnNnCTXskTdrQ9SYLNcznt3AgIODjtD5PXMIi2OjFajeaQ4C4UuHlmqymgW/cpVL9HrP8BNNVpkkxHn+0g+WEzqSrgeNXlvbB2Bx8OnWbkIa98hVMW+uFKz5Tra/8hPFe0Y/o7xj/3jkDa+ilZK0f6ubaRpDUh7YJBrAdZMGBP2WtePah3elooA3qTZtLHIGHFdpaHm4lWfHvspbyko3bsZdscsAbvnS0DguRSWmw0DmMtrzLOMDx/if3J/VTjltZjLVQRxxDDW6AnjslJdFHc6GUZ7/lPpq3yCJ1a/4pK5VpgF+y/9PmmcB4Kp6BqNmJPHnB105goZM9EQIeegRxbgU9OmzBUyK+o3DI3rIkfP9YKqsjRxGju4qBfqpzOilbzq7yjscVbCWs8yylL5GzCY6z6lk5N510jgEFCPNtiU9uIMA+8alGMQ4gNsa8x6UwQ+yRLrLiBno63eqDIx8zXR4XyMijCR79esb18NZ+lblVLR4rm4/9ByMXFw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(396003)(136003)(376002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(53546011)(38070700009)(71200400001)(478600001)(6486002)(6506007)(86362001)(122000001)(6916009)(38100700002)(31696002)(66446008)(66556008)(41300700001)(6512007)(5660300002)(31686004)(2906002)(66946007)(66476007)(2616005)(316002)(64756008)(36756003)(54906003)(76116006)(8936002)(4326008)(8676002)(83380400001)(26005)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NmdCTFlPNFNmN2szdWdtdXFOdXNJRW5BTk1HOW5OZmRqelhCY3hSVkNDRExJ?=
 =?utf-8?B?Q3RHL0owaGxKM3F2d0RBVXNXMXZ2cmlVSUltcm5mV3R5QTNYS0xsZXl1Z0g3?=
 =?utf-8?B?SEp6b0k4RWlwVUNaUGRaRVZlbGVvaTZvWFZldzIzMXdzMXYyd2pZNnlMQTNJ?=
 =?utf-8?B?VHNZQmIvWEUwemx4dVJ2NXg0SGYxR0t3YnppZVdkQW9NcHhudnlaN28vZ3N5?=
 =?utf-8?B?czFMcU45ZDQwRWNMRmpyelJFcElpUlJTQU9EZ3RrOFl0OE5HSXZPeU1aWWpU?=
 =?utf-8?B?Wjg1R25qdExwNlBUVTVQWjFub0lHaTVoTnpLbGFmWGhhdDQyaEZMelNZbkw1?=
 =?utf-8?B?T1BMS3grS1VPWVVIcm93Yk9iM1pNS0Zvem52dXFYU2g0RmdoTnhEL1lFOHdS?=
 =?utf-8?B?S0p6OExMV1ZVa1Q4L04zVzdERTF3OVR2Sk9HU2FmK0pSaXlYVUJFQVJZSnFP?=
 =?utf-8?B?aTV0d0xDVVc5SWlEL0oxdmtlQ3RXV1hpZmthc1BDSE1mVzZmVVc5VUJ0aWs4?=
 =?utf-8?B?dFlrK2daZFRrMGI0VTNWa2FneG5YdWZJUWZWT1lGTWlrQXpGWEp0Y1J3OWhs?=
 =?utf-8?B?UWhrRzVrS2lyays1VVh6VFFKNlJWR2k3c3FwNDdrWXRML1lJK210MlBva0tm?=
 =?utf-8?B?SHhRNEZSZURMTC83dG1ybGc3VkIwb2FkY2h3cElqVEdNblo4bzJDRTN1SEpX?=
 =?utf-8?B?bVFMU0JWcTBSZjZFSXA4NlZhMDh4a3JsU3dXL2RtMFRVbGJxMnhseGp0S1pW?=
 =?utf-8?B?SGxzc1dkMjd5dEYySnhjYVZkbEFVL1h0WGxlV0tVWU1YU0NrQ0s3elVqSU9i?=
 =?utf-8?B?SEk2VlpqYkpEZGxLUW1mb3U2b3V0OFRuRnd3dVJDQzN4Y083WlRCOHptZmtN?=
 =?utf-8?B?eGRlSEVpMlAycVlEa2xrcTFsZStFOXArR2VBUHFsa0Yzdm9hQ0QzeWtKZURV?=
 =?utf-8?B?YVNNb0J5b0cyL3lyakhmcUUrRUV4THF5Rm04WDgvRjFZRUNlUG96MlNmSGlN?=
 =?utf-8?B?UkEzVkhORW04VEFPWWxSV2dyTlJ2WmpKTWtkR25VeGVrdWREOEFvbXBqTVVC?=
 =?utf-8?B?TXBvVTlja2ZwRnpwMUx5SldIT1NnWUI4SHU5UkNjRE5TV29DRnFtVVhOQU9M?=
 =?utf-8?B?U2FJUGtMVnNyNXNsUmxMOGUrRURhUzVib00rSm9pYlNBVVloVU55Q2NIQlQw?=
 =?utf-8?B?WFBxNEVNeWVMbEs4aXVjZzJyZDl2c1ByVFY1elJUUVRhTGUwQ3ZuRW14WFZ5?=
 =?utf-8?B?WHNwUGFBb2hTVDFwOFVYMkJBbVJFemRobmdIcnFRYWJFcE9MNlJ6T0dxVHVx?=
 =?utf-8?B?aE9PeUFwMUVLbUlUZHZwTWl1QmE2MWZHUlVRbVhGWXBETWlabEpvZnNZWG1R?=
 =?utf-8?B?TzFEN3lEWUpXaURwUmszZjA0Tng3MzEzY09jd0NPZHRhVFpvYkRHM2ZoNFFa?=
 =?utf-8?B?V1AyNGhSMkd6K1ptb2NJNTh2WTZXaVpKenAxbW9sVVhjTm9JSEd5QWdXRWRy?=
 =?utf-8?B?Q1lZNGVDaVdOZTlEUWl5b2NWcVduOVBTWWFlM1hrREZySnZvME8yQ0pEWDdH?=
 =?utf-8?B?eDNwd2NRRjZWQWw2Z2orY2dNelg2SVZIbHhWV0VqRFVZQkFOMUx2RDdoV3B5?=
 =?utf-8?B?dmRSbGNBR3MzQjNNTmxseFczNFVkZlkrWlNMV0prNkNvanVtdEhwMlNPQ0NU?=
 =?utf-8?B?c0c0S1NnV3YzaWk1a2JTNFh4aFc1K3ptN1d6TW9WbWFlWks1UmdBZTRxQ1k2?=
 =?utf-8?B?ejhOMGVwTDk1VEFtTjhLT241N0t3VCtqdlFaRkxTMmUwL2RIRVNEOEVZOWJO?=
 =?utf-8?B?NDEybERvNk04ODZUZ3BoVFdvWU81VkkreGFRL0hzSkxKUUJSTWxQcGgrVFox?=
 =?utf-8?B?dmRybkpKbW9LUU1JaEdvT1dKdkJFTzJvVEtnS0hCQ2w1cmFyVEV0K2ZzejZY?=
 =?utf-8?B?M1BEU2E5cjRrY2dKWUU2Z1RLZzhXTEZEY3JYTmxJQ0hpUnF0blJQdTVRZitG?=
 =?utf-8?B?OGFCdzV2bk9jdUVCUnI1cUsvSGluc2lwV20wS2Z2QW5RelJBemRPTjNxeWNt?=
 =?utf-8?B?QWFUUjVtWDFxZmRoMThpRGdBU2EwcjNxSUdzaHBEQVhrbmllMThEQ3paOGps?=
 =?utf-8?B?TTkrZWFkYWtoUzNQVmZJL0tVbFRvU2pOL1lNd3RBaGRNaWRBanJSRkxiU0hS?=
 =?utf-8?Q?vuhYrCN7AOEelbNt6futuN4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4ABE65077FDF7E4DA83413FDDA06EDC4@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80c750cb-3aa8-4c79-00cf-08dc270f6cc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2024 12:30:38.2004
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ju4bLkBgNbl1+fGUAeeCPmqaHOHNHxVlzWAV1gZSgz6w757IpWYwI2vyO31ca4nIYI1DlrPGFRNtJxFLftZbM+vnC4O3L0sS7HGgcQFMlo0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9155
X-Proofpoint-ORIG-GUID: -3rZAFBQrGk1hHSXl7ixMfE6VqIs4y1G
X-Proofpoint-GUID: -3rZAFBQrGk1hHSXl7ixMfE6VqIs4y1G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-06_06,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 mlxlogscore=999 adultscore=0 suspectscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402060088

DQoNCk9uIDA2LjAyLjI0IDEyOjI3LCBBbnRob255IFBFUkFSRCB3cm90ZToNCg0KDQpIZWxsbyBB
bnRob255DQoNCltzbmlwXQ0KDQo+Pj4+IGRpZmYgLS1naXQgYS9kb2NzL21hbi94bC1kaXNrLWNv
bmZpZ3VyYXRpb24uNS5wb2QuaW4gYi9kb2NzL21hbi94bC1kaXNrLWNvbmZpZ3VyYXRpb24uNS5w
b2QuaW4NCj4+Pj4gaW5kZXggYmM5NDVjYzUxNy4uM2MwMzU0NTZkNSAxMDA2NDQNCj4+Pj4gLS0t
IGEvZG9jcy9tYW4veGwtZGlzay1jb25maWd1cmF0aW9uLjUucG9kLmluDQo+Pj4+ICsrKyBiL2Rv
Y3MvbWFuL3hsLWRpc2stY29uZmlndXJhdGlvbi41LnBvZC5pbg0KPj4+PiBAQCAtNDA0LDYgKzQw
NCwzMSBAQCBWaXJ0aW8gZnJvbnRlbmQgZHJpdmVyICh2aXJ0aW8tYmxrKSB0byBiZSB1c2VkLiBQ
bGVhc2Ugbm90ZSwgdGhlIHZpcnR1YWwNCj4+Pj4gKz1pdGVtIEI8Z3JhbnRfdXNhZ2U9Qk9PTEVB
Tj4NCj4+Pj4NCj4+Pj4gKz1vdmVyIDQNCj4+Pj4gKw0KPj4+PiArPWl0ZW0gRGVzY3JpcHRpb24N
Cj4+Pj4gKw0KPj4+PiArU3BlY2lmaWVzIHRoZSB1c2FnZSBvZiBYZW4gZ3JhbnRzIGZvciBhY2Nl
c3NpbmcgZ3Vlc3QgbWVtb3J5LiBPbmx5IGFwcGxpY2FibGUNCj4+Pj4gK3RvIHNwZWNpZmljYXRp
b24gInZpcnRpbyIuDQo+Pj4+ICsNCj4+Pj4gKz1pdGVtIFN1cHBvcnRlZCB2YWx1ZXMNCj4+Pj4g
Kw0KPj4+PiArSWYgdGhpcyBvcHRpb24gaXMgQjx0cnVlPiwgdGhlIFhlbiBncmFudHMgYXJlIGFs
d2F5cyBlbmFibGVkLg0KPj4+PiArSWYgdGhpcyBvcHRpb24gaXMgQjxmYWxzZT4sIHRoZSBYZW4g
Z3JhbnRzIGFyZSBhbHdheXMgZGlzYWJsZWQuDQo+Pj4NCj4+PiBVbmZvcnR1bmF0ZWx5LCB0aGlz
IGlzIHdyb25nLCB0aGUgaW1wbGVtZW50YXRpb24gaW4gdGhlIHBhdGNoIG9ubHkNCj4+PiBzdXBw
b3J0IHR3byB2YWx1ZXM6IDEgLyAwLCBub3RoaW5nIGVsc2UsIGFuZCB0cnlpbmcgdG8gd3JpdGUg
InRydWUiIG9yDQo+Pj4gImZhbHNlIiB3b3VsZCBsZWFkIHRvIGFuIGVycm9yLiAoV2VsbCBhY3R1
YWxseSBpdCdzICJncmFudF91c2FnZT0xIiBvcg0KPj4+ICJncmFudF91c2FnZT0wIiwgdGhlcmUn
cyBub3RoaW5nIHRoYXQgY3V0IHRoYXQgc3RyaW5nIGF0IHRoZSAnPScuKQ0KPj4NCj4+DQo+PiBZ
b3UgYXJlIHJpZ2h0LCBvbmx5IDEgLyAwIGNhbiBiZSBzZXQgdW5saWtlIGZvciB2aXJ0aW89Wy4u
Ll0gd2hpY2ggc2VlbXMNCj4+IGhhcHB5IHdpdGggZmFsc2UvdHJ1ZS4NCj4+DQo+Pg0KPj4+DQo+
Pj4gQWxzbywgZG8gd2UgcmVhbGx5IG5lZWQgdGhlIGV4dHJhIHZlcmJhbCBkZXNjcmlwdGlvbiBv
ZiBlYWNoIHZhbHVlIGhlcmU/DQo+Pj4gSXMgc2ltcGx5IGhhdmluZyB0aGUgZm9sbG93aW5nIHdv
dWxkIGJlIGVub3VnaD8NCj4+Pg0KPj4+ICAgICAgID1pdGVtIFN1cHBvcnRlZCB2YWx1ZXMNCj4+
Pg0KPj4+ICAgICAgIDEsIDANCj4+Pg0KPj4+IFRoZSBkZXNjcmlwdGlvbiBpbiAiRGVzY3JpcHRp
b24iIHNlY3Rpb24gd291bGQgaG9wZWZ1bGx5IGJlIGVub3VnaC4NCj4+DQo+Pg0KPj4gSSB0aGlu
aywgdGhpcyBtYWtlcyBzZW5zZS4NCj4+DQo+PiBTbywgc2hhbGwgSSBsZWF2ZSAiZ3JhbnRfdXNh
Z2U9MS9ncmFudF91c2FnZT0wIiBvciB1c2UgcHJvcG9zZWQgb3B0aW9uDQo+PiAidXNlLWdyYW50
L25vLXVzZS1ncmFudCI/DQo+IA0KPiBMZXQncyBnbyB3aXRoICJncmFudF91c2FnZT0qIiwgYXQg
bGVhc3QgdGhpcyB3aWxsIGJlIGNvbnNpc3RlbnQgd2l0aCB0aGUNCj4gb3B0aW9uIGZvciAidmly
dGlvIi4NCg0KDQp0aGFua3MgZm9yIHRoZSBjb25maXJtYXRpb24sIHdpbGwgZG8NCg0KDQo+IA0K
PiBDaGVlcnMsDQo+IA==

