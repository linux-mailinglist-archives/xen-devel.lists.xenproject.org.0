Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF3B801975
	for <lists+xen-devel@lfdr.de>; Sat,  2 Dec 2023 02:27:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645830.1008248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9Emu-0002N5-JG; Sat, 02 Dec 2023 01:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645830.1008248; Sat, 02 Dec 2023 01:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9Emu-0002HK-BI; Sat, 02 Dec 2023 01:27:20 +0000
Received: by outflank-mailman (input) for mailman id 645830;
 Sat, 02 Dec 2023 01:27:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jVJG=HN=epam.com=prvs=6700ee1bd8=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r9Ems-000271-Nj
 for xen-devel@lists.xenproject.org; Sat, 02 Dec 2023 01:27:18 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebfa4255-90b1-11ee-9b0f-b553b5be7939;
 Sat, 02 Dec 2023 02:27:14 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B20exWZ004068; Sat, 2 Dec 2023 01:27:12 GMT
Received: from eur02-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur02lp2040.outbound.protection.outlook.com [104.47.11.40])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3uqt8mg1hm-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 Dec 2023 01:27:12 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DU0PR03MB8599.eurprd03.prod.outlook.com (2603:10a6:10:3e6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Sat, 2 Dec
 2023 01:27:07 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7046.027; Sat, 2 Dec 2023
 01:27:07 +0000
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
X-Inumbo-ID: ebfa4255-90b1-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hP60KBmfNMFnjfgi1NsdMQEhxrg1U9g4M9jo8A6E9qNb9kDA9lmalLgcqOL77+sm4L1FyYepuJiiMlqbGh8oGPY7NHfTpDpbmGmdKxXgPM9pZ503bdwRHi4ntmmhfSHrqDlCVFS9mRKXag7RmMqHShJavjjDb6MSdNOJsk8NKs3iW36He4ugQLtEjcT9U1SUfAJ11sl2xAvvxC6U/4nHaCFn/vsphczfKc1KB0VjM1aINSuoqZxYoFlufUBedqC9k/mZxAf2W5GQm6HUDl6pKTMF3EQok/G/3Q+f4mYAfWQfnTgClnJAdRUPkrKDUzfUjzi3PDfsf4PZ0zjAuiqjbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SFwYHxU24LM47Wx7eKT7t91aTd5L+oJ//Tk/2jLWySA=;
 b=euaBkwaH4JkwfYUsiOJbB8lyo2DSGT3Pp19b0KD/ttzezvKzta83irEPVvdLDNDqfmUqZfeSeQGo3E7DBkHmoxmBltOtBuSU/IyDVpg/qVtFmCRC7Pj4vT70ri/7IX63PB/igZNrdU6zvg3Ig7deQBDy4r2WG/gWa99y0KJROavN2EbR6ToHKjUhlYs32DQD72egn8nCurnj4V5Kx0Raho1mkVKsHqMP/ciUuHWYlYeI0j9qnOSwpQxUKPZookA1a33aeiH6KRgjDMDXlil74II88BfSVyI7vI+4upXZ5qbMs24aMMFIHE+c/fpYEelPdtCpTWfZ84ItW8+XeXVHCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SFwYHxU24LM47Wx7eKT7t91aTd5L+oJ//Tk/2jLWySA=;
 b=P6GtjoKrKttcLr4AYJm9tfR4Cm7oSOmuKtCFLa/x0kIjrtkE7EcKdWpRkA74IRIVmfxLp6pXm6usY3Ic8RtEGBJcbEb1NwV03BTl1b2keVyktQFKdRwaiksjRiabCqDwfnjqyyP1Z8pcb6CV6AGewjtj5V+ypD48PdvBXxXZyHmD394Fu642H2+29r/+STMyZP5RGJplhGn1DgrWNCvz+SalpB3fQGLjKEUI/olq7J6H7dLYsyuOoaKBZqv4RQ34kHpuMae3Tdj9VLY6O4qczxibzyXjEdOhfNrbchXkaYV9pFDeNntq5G72pyWmoduGaD6+r0tqW5vl/JCp0Dsk1w==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: [PATCH v11 06/17] vpci/header: rework exit path in init_bars
Thread-Topic: [PATCH v11 06/17] vpci/header: rework exit path in init_bars
Thread-Index: AQHaJL6n1kPp1+DEXkyG3DA4rY4zlA==
Date: Sat, 2 Dec 2023 01:27:04 +0000
Message-ID: <20231202012556.2012281-7-volodymyr_babchuk@epam.com>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DU0PR03MB8599:EE_
x-ms-office365-filtering-correlation-id: 9198ba8e-0535-4f38-dfc3-08dbf2d5cc2b
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 is4K3x+RaHsNn5pOgEiOOEKDVwXh7Y6YF4KcfKgo6iXJObxSNcTYyiJ9sVsXS8i1Cxf2/fXhY/RtoQy/SbEMwqxJ/oTgC6vug6PkMkMbO2iqwJYIwT4HnM1JVtH89AxWEViW0oFgnNOd9VJ0r4ow/yqxelLdo8d0QIxEt58nUK6XuWW2dRMCrItiIbu9pbgs6M0PAtMjmgqi/yh1kiAN8ACdP/bR0Lj5mtWX1J3NGD0+JsB0Gqfk91qmC/NEmtbk55ibPASYvs4RsW/nHlURoHdryK2ndeUGrB7x8rTb4c5aRZ/eVjE8SK6imTa+JqGxi0Q85fLQwAsvVzI75wOl/S7VXO49jnq/0AohqriaV4a2s5n6Lvao6v4S+RqVo5vPDbNiygULFZMKOplflS06RR5ciyXtKfGLfQ24Vi/6a3dz/guc72oBe1w28aDGgJCNYwqoWVooRxIldxQWhXFRKcTpVgiADaGw7he6ndFLpgrrZbf1d1hFsXYUw4YI7bcPD0qB/W3ghS+pywiekB95EITkA/V4afqWH119yTyquF6gwPp7jjvDvalgMBOJJpcidKG0DBMtb/zBYNXBazfv7Rnb3Ix88v5G8fwg1z7tVvyI5QHSdj2fUMC1usApD8nG
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39860400002)(346002)(376002)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(5660300002)(86362001)(4326008)(8676002)(8936002)(2906002)(38070700009)(41300700001)(36756003)(2616005)(1076003)(6512007)(6506007)(55236004)(83380400001)(6486002)(478600001)(26005)(71200400001)(6666004)(38100700002)(122000001)(316002)(91956017)(54906003)(64756008)(66446008)(6916009)(66476007)(66556008)(76116006)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?N2hjdUJQVHpoYWJGSW9xZ1hlL1dLK051MGdIY2k3Q1pLSVpUNksyZWVIZjFh?=
 =?utf-8?B?eXFwQlJPSU1oWGp0ZGxrRmR5UE5SMU9sTE5GVlVmSUVVWXY2YmtzMmtueStr?=
 =?utf-8?B?dEl4UWNseEZ6dm9LYjY4TW1kMWhiMUttOFVMOExiYkUwWndrY01HcHNlYitx?=
 =?utf-8?B?K1Y5OUZhN3NVMFhLQU1neUFMRXo3K3NMNWoxMGdHeHNqQWQ3NEZieUkrb3Fz?=
 =?utf-8?B?VXA2NVByNDVnTkxOUVN3NmNmaTJmaERpK0FnaU8zV1grNmYyV1IzV28zQ0Fo?=
 =?utf-8?B?YTQ5TlNBajlQVTVGTk9RbUxYTyt0UU5jRzB3aDJYdEMyYXZMZnhpSjl6SUhm?=
 =?utf-8?B?Y09qZU5mR2tFSENDejNTZDhKendHYkxBUTlEaUtWTG9VMUluWnZzei9OZHo4?=
 =?utf-8?B?QjFXc0xqOWtrd081YnIrZDZjQW5NYXZ2L0d2b2djRGt6NjFiQ0kyS2FuMWRm?=
 =?utf-8?B?elBWZUhHQ0kvd21mVVlYNlRRb2d4T1dCT0xSd1VtbnFhTVFYSEZDQllsb08r?=
 =?utf-8?B?cFBRdTlvSiszYzlDWWFnT1ZJR2NScW9nMWlhcFI0aXRZbFB0N2ljbDE5VkJK?=
 =?utf-8?B?eThHYUhTMzJQQlRSdFdFRVBYUEEvU3owRHdvVEsyWXUydk9wTlkxbDY3dGNr?=
 =?utf-8?B?QmFjaWxUQyt2bm9UaWozSGNWdjRldUpQdWhBOHh1YnMrRTBhS2F3aXZSN1Uv?=
 =?utf-8?B?MTQ0OXdYQU5PQkZabUhLZk1LMVQ4T0RmYkxLNkVCWGxCdGhvK09QWXp4djYy?=
 =?utf-8?B?aFFRNnZ2QlVRZ0EvRy9udktTQjVnOUJadTljTFFkc1VEVjc5TDhFSWRkank1?=
 =?utf-8?B?U1BIUkxESk9LYzA4L0FvVFJTcTZwNG5KTHV2bkw4cUZpVER5K212ZEVWL0gy?=
 =?utf-8?B?dVRTYmZBVEc2bE92Sm9KbDlZemkwS085Nm5nODM1L0YwTXdMc3RmYlloUVZ0?=
 =?utf-8?B?L3krMmt5eUxTWGp2b1ZFemFDM1BIY2RiVXB4WjlXYmlnT0FZcERmVVltT0Qx?=
 =?utf-8?B?N1N1VldhaGsrTGxFbHlBQzZlU3lPbDJ5RlRxeWl2OHdDMWNSLzEwR1lEK2lM?=
 =?utf-8?B?bDY0bHdnNmhvOVpRS2Z6aG8zYVBubkRrOXFwRGp1L1hiWG9FWDZxbU96bkwy?=
 =?utf-8?B?MUhCMG5YQk5GS1FYakJrSUFyQ1MzbWh3NDROTzhTTlUvL04rK1N3ZXdLYUNo?=
 =?utf-8?B?NGIrN2pkYnhOVk5ya09UVDdlTExsYUR4eDlHa09XYlU0VG90NjJLMUxPbWlo?=
 =?utf-8?B?M3E3eUhFZGdxNjFkQWdnWC9OMm1iTlZPSThGbG8rbEhPdW56aUVxdmpBcVZk?=
 =?utf-8?B?bzFxdEdha3pxVkl2SzF1MUhnM2o0Zm93czFaSnNXa3RsblhpWm5Oa2huRC9O?=
 =?utf-8?B?aDFkdW1wYlg1MzdxVC9WNmMxTGNOMmpjL09xV1dyY0xaMDJWdHlsMXNtdzE3?=
 =?utf-8?B?S1R6NXk3YXNJbEFTQk13QXRaQ2wxRVE4eVdpci9hUVJzZ2pXbzBNb1JoRnpu?=
 =?utf-8?B?ZkNoRU9XT0prRSt1SjZ1ckowRG5tam4xREVpZHk1WUZqVWJjZGpsRmxlMXVI?=
 =?utf-8?B?Y3VoWUtzWXZWMmpKTVZmd2FMUGtkUmZsTFc0S3R6aHlmcnFqN3RISlV5em5y?=
 =?utf-8?B?K1pVMUNKa0VYdllvYkN6L3dUMEtmMXB4azhZMzdTb2R0dVRKRlp2eGtpeGlL?=
 =?utf-8?B?Zm0ySnphZjFZQ2prVkFpbkY2anFnRlJtMm1oUm9wSi90czBMRzFDa05HWnV3?=
 =?utf-8?B?Nk1FTVRYSjFUSXZWZXR3YjNPU2hsTGVrNkF0SXFSblYweG92M2xEZnozOEJr?=
 =?utf-8?B?Y3Zmc2RxTS93UmJUNXZSNG1uNTV4Z0JLTVUweUUyS2tTbFhoWEZoaHBCR2hE?=
 =?utf-8?B?WHUybHJBZzJDRVFwUmRUMnVjZEZGSjNIR3A4Z0xSUFh3Ty80S0piV241dzhj?=
 =?utf-8?B?eVpSL2U0MDRuZ0ZyM1VFTmNxdnR6L0JPK3k4ai91U1R4SVpFWU5pS2lHUUts?=
 =?utf-8?B?dDgrTnZaZVJDWEVON2FiUGpTY3J0R216MXlVcmhsRWtDTDZ2TGxhVi9KYXdC?=
 =?utf-8?B?ZWtXSFh0c1NvV2xTb3Nlai84YVVuWGhZK3gyUEYwaVVQc09aWitlVldZTE9C?=
 =?utf-8?B?czEya2hIU0tjdTNjelVJeUlKSWxUSE5KVS9DV21udEFQU3pZL0tCLzF3L29w?=
 =?utf-8?B?K1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B94DC1D15413C241802C71B6AE82126B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9198ba8e-0535-4f38-dfc3-08dbf2d5cc2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2023 01:27:04.1397
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bPrDjI8ZhUaHNyVjvH0tWsCZwlrQWOQKz+4lQKh6DTveeedSLI32RgMW7zprGVlSmtTLnSHIE4L4zWu8MJXey8LeBehgPHEbKIlrCCIKYsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8599
X-Proofpoint-ORIG-GUID: T730irxzVb2dsD5u96ynCg5bhDM3i3Kk
X-Proofpoint-GUID: T730irxzVb2dsD5u96ynCg5bhDM3i3Kk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_24,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 mlxscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=930 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312020008

SW50cm9kdWNlICJmYWlsIiBsYWJlbCBpbiBpbml0X2JhcnMoKSBmdW5jdGlvbiB0byBoYXZlIHRo
ZSBjZW50cmFsaXplZA0KZXJyb3IgcmV0dXJuIHBhdGguIFRoaXMgaXMgdGhlIHByZS1yZXF1aXJl
bWVudCBmb3IgdGhlIGZ1dHVyZSBjaGFuZ2VzDQppbiB0aGlzIGZ1bmN0aW9uLg0KDQpUaGlzIHBh
dGNoIGRvZXMgbm90IGludHJvZHVjZSBmdW5jdGlvbmFsIGNoYW5nZXMuDQoNClNpZ25lZC1vZmYt
Ynk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4NClN1Z2dl
c3RlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQpBY2tlZC1i
eTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQotLQ0KSW4gdjExOg0K
LSBEbyBub3QgcmVtb3ZlIGVtcHR5IGxpbmUgYmV0d2VlbiAiZ290byBmYWlsOyIgYW5kICJjb250
aW51ZTsiDQpJbiB2MTA6DQotIEFkZGVkIFJvZ2VyJ3MgQS1iIHRhZy4NCkluIHY5Og0KLSBOZXcg
aW4gdjkNCi0tLQ0KIHhlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMgfCAxOSArKysrKysrLS0tLS0t
LS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0p
DQoNCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jIGIveGVuL2RyaXZlcnMv
dnBjaS9oZWFkZXIuYw0KaW5kZXggZWM2YzkzZWVmNi4uZTZhMWQ1OGM0MiAxMDA2NDQNCi0tLSBh
L3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMNCisrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVy
LmMNCkBAIC01ODEsMTAgKzU4MSw3IEBAIHN0YXRpYyBpbnQgY2ZfY2hlY2sgaW5pdF9iYXJzKHN0
cnVjdCBwY2lfZGV2ICpwZGV2KQ0KICAgICAgICAgICAgIHJjID0gdnBjaV9hZGRfcmVnaXN0ZXIo
cGRldi0+dnBjaSwgdnBjaV9od19yZWFkMzIsIGJhcl93cml0ZSwgcmVnLA0KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgNCwgJmJhcnNbaV0pOw0KICAgICAgICAgICAgIGlmICgg
cmMgKQ0KLSAgICAgICAgICAgIHsNCi0gICAgICAgICAgICAgICAgcGNpX2NvbmZfd3JpdGUxNihw
ZGV2LT5zYmRmLCBQQ0lfQ09NTUFORCwgY21kKTsNCi0gICAgICAgICAgICAgICAgcmV0dXJuIHJj
Ow0KLSAgICAgICAgICAgIH0NCisgICAgICAgICAgICAgICAgZ290byBmYWlsOw0KIA0KICAgICAg
ICAgICAgIGNvbnRpbnVlOw0KICAgICAgICAgfQ0KQEAgLTYwNCwxMCArNjAxLDcgQEAgc3RhdGlj
IGludCBjZl9jaGVjayBpbml0X2JhcnMoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQogICAgICAgICBy
YyA9IHBjaV9zaXplX21lbV9iYXIocGRldi0+c2JkZiwgcmVnLCAmYWRkciwgJnNpemUsDQogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgKGkgPT0gbnVtX2JhcnMgLSAxKSA/IFBDSV9CQVJf
TEFTVCA6IDApOw0KICAgICAgICAgaWYgKCByYyA8IDAgKQ0KLSAgICAgICAgew0KLSAgICAgICAg
ICAgIHBjaV9jb25mX3dyaXRlMTYocGRldi0+c2JkZiwgUENJX0NPTU1BTkQsIGNtZCk7DQotICAg
ICAgICAgICAgcmV0dXJuIHJjOw0KLSAgICAgICAgfQ0KKyAgICAgICAgICAgIGdvdG8gZmFpbDsN
CiANCiAgICAgICAgIGlmICggc2l6ZSA9PSAwICkNCiAgICAgICAgIHsNCkBAIC02MjIsMTAgKzYx
Niw3IEBAIHN0YXRpYyBpbnQgY2ZfY2hlY2sgaW5pdF9iYXJzKHN0cnVjdCBwY2lfZGV2ICpwZGV2
KQ0KICAgICAgICAgcmMgPSB2cGNpX2FkZF9yZWdpc3RlcihwZGV2LT52cGNpLCB2cGNpX2h3X3Jl
YWQzMiwgYmFyX3dyaXRlLCByZWcsIDQsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICZiYXJzW2ldKTsNCiAgICAgICAgIGlmICggcmMgKQ0KLSAgICAgICAgew0KLSAgICAgICAgICAg
IHBjaV9jb25mX3dyaXRlMTYocGRldi0+c2JkZiwgUENJX0NPTU1BTkQsIGNtZCk7DQotICAgICAg
ICAgICAgcmV0dXJuIHJjOw0KLSAgICAgICAgfQ0KKyAgICAgICAgICAgIGdvdG8gZmFpbDsNCiAg
ICAgfQ0KIA0KICAgICAvKiBDaGVjayBleHBhbnNpb24gUk9NLiAqLw0KQEAgLTY0Nyw2ICs2Mzgs
MTAgQEAgc3RhdGljIGludCBjZl9jaGVjayBpbml0X2JhcnMoc3RydWN0IHBjaV9kZXYgKnBkZXYp
DQogICAgIH0NCiANCiAgICAgcmV0dXJuIChjbWQgJiBQQ0lfQ09NTUFORF9NRU1PUlkpID8gbW9k
aWZ5X2JhcnMocGRldiwgY21kLCBmYWxzZSkgOiAwOw0KKw0KKyBmYWlsOg0KKyAgICBwY2lfY29u
Zl93cml0ZTE2KHBkZXYtPnNiZGYsIFBDSV9DT01NQU5ELCBjbWQpOw0KKyAgICByZXR1cm4gcmM7
DQogfQ0KIFJFR0lTVEVSX1ZQQ0lfSU5JVChpbml0X2JhcnMsIFZQQ0lfUFJJT1JJVFlfTUlERExF
KTsNCiANCi0tIA0KMi40Mi4wDQo=

