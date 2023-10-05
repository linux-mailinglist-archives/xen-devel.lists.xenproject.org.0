Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 634A87B9BBF
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 10:11:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612876.953017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoJS5-00032I-4z; Thu, 05 Oct 2023 08:11:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612876.953017; Thu, 05 Oct 2023 08:11:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoJS5-0002zr-1O; Thu, 05 Oct 2023 08:11:21 +0000
Received: by outflank-mailman (input) for mailman id 612876;
 Thu, 05 Oct 2023 08:11:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gndL=FT=epam.com=prvs=46423b4a7f=andrii_chepurnyi@srs-se1.protection.inumbo.net>)
 id 1qoJS3-0002zk-7H
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 08:11:19 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0f7c972-6356-11ee-9b0d-b553b5be7939;
 Thu, 05 Oct 2023 10:11:16 +0200 (CEST)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3950luOV019571; Thu, 5 Oct 2023 08:11:07 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3tha412bkw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Oct 2023 08:11:06 +0000
Received: from AS8PR03MB9583.eurprd03.prod.outlook.com (2603:10a6:20b:5aa::18)
 by VI1PR03MB6478.eurprd03.prod.outlook.com (2603:10a6:800:17d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Thu, 5 Oct
 2023 08:11:04 +0000
Received: from AS8PR03MB9583.eurprd03.prod.outlook.com
 ([fe80::529f:7d90:7f52:64aa]) by AS8PR03MB9583.eurprd03.prod.outlook.com
 ([fe80::529f:7d90:7f52:64aa%4]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 08:11:04 +0000
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
X-Inumbo-ID: c0f7c972-6356-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V7GyDsOS7poCbYQR0TO5yzDiJNHjRk/E/HA7IxfsVz/qH+NUa2W/H+PyFm5SQ9GfvRK+tx/Vz94UWGxpMqqvL76V/OGyaCP/czqHtETYZrPy/YeBUeg40H81i2vm+WeFaVrGAmzl0iWW2MLYd5l0mx1w+kX68QwX4ueXKZ0YH2BlOUbDBKS/5lFKMftny8G3ds62JHMEmpBTnAUaVzZqkmIj6s4bhecz15VrSVPXDfpEgebHtxa0/rfPj3byK0hDovNlzIW9msduXYIdb/p1FmSjkMJk5pX2vP3LvWN1DkiK+B0sgoi6Mk+LljqPQxNHcNeck5BPy60YZQQOE2u7Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M47XiSu+LMFNLzzswY8HLK/UPKHw9wp3v2+upPQdER0=;
 b=CdVfH6TiITfo71NByUgYKadrTfTVZxLMEHQPqZksvBYXvfIIXn/K71fgNCHtGi+0WZuEycVOAZ8qJJvVUowHZJ4Y0ZwLzcQofWQVCbfh3+UOsDAWw+ADXUt6OhBW8OaDdcLGOLPL6OLAWaPM/gngzKS0M775q0hQ6WKFtn6czAAhm+x6XfWK0JQXlnDAxkwCZ7r+/5c7sH1VqZoo0y3YrD4sRBnYHLqTY/LsipAX9KEkw6JTnELA5tWavroJMpNmE8ORHS/BFSJXovMNgJS2dl+eFnpGG5oyZOdw7kyuTh5Nykm2/ole3Y0ZpEEn/beC96iX1NEfmMPiNMxCLPiuxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M47XiSu+LMFNLzzswY8HLK/UPKHw9wp3v2+upPQdER0=;
 b=mv8HsUUL7xlDYAyQX9otqBBPTZkSZflNx3N1gsyPcDB7jqt0UVzvUldVwNdcmlOGRgkD4OJkfrBo4+wvwuGQDijEtkNeYbvQIfvCTf9v87ypu/MhjHsdwhNNppn4nd2Ud4oLscQ+92PpoKGVyyZDb9Hp+2JUBVQN+PuElI151+yPvwo9buj/2xMpXCpQ8M+AO17CW+O0wSylkK/cN1l265zkXyxFBklQb5Eh7tvdnuYlAOD/h9ro6NQHWE9+jesDJUJwr5z6IpOilHLzHFgjd5mg1TfA2pPci958vv/aMpscNNeJf+nVQzBPnH0DwvA5nwS+p5nNU/e6Pe3mqRQ+Yw==
From: Andrii Chepurnyi <Andrii_Chepurnyi@epam.com>
To: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        "andrii.chepurnyi82@gmail.com" <andrii.chepurnyi82@gmail.com>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] arm/ioreq: clean data field in ioreq struct on read
 operations
Thread-Topic: [PATCH] arm/ioreq: clean data field in ioreq struct on read
 operations
Thread-Index: AQHZ9fw82LZSu4lXwEi+r3jS4xqDm7A4FMmAgAE8lwCAAHUlgIABFHmA
Date: Thu, 5 Oct 2023 08:11:03 +0000
Message-ID: <47c0e1b3-d00b-30e4-eaa9-a32ca0b6cd78@epam.com>
References: <20231003131923.2289867-1-andrii_chepurnyi@epam.com>
 <27044e68-4a49-4f1d-b8a9-174810efb5fe@xen.org>
 <ec7089d1-0111-1e34-900b-b5c40dcb41d2@epam.com>
 <f419a108-f594-4a00-9445-e1c072777379@xen.org>
In-Reply-To: <f419a108-f594-4a00-9445-e1c072777379@xen.org>
Accept-Language: uk-UA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR03MB9583:EE_|VI1PR03MB6478:EE_
x-ms-office365-filtering-correlation-id: 56e52ee4-5921-45f9-8bcb-08dbc57a9e85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 zrKF3v5NFsrtGNysuCYVZXhodeBxibyLaB1dFFf+UiAIQ97/9Dt2O8gfVsA/CdeT10N6mj96Z7jdGbMBhJEfgjiK4Mfh40MisOUkiGL1Xe3dP+pu4IUpZ+g4X9HsXRAZlnfQii7sAZsbp9uCnTpYh5UYNO42ASSTKTVk+d5Q9MQNzugVByYsOqraWtvQ+6NQIhB63y5UPza6bu2RVhYeKixhMVSIqdaE2h1uPWCaT9hshMm1yoD45jilivRBk2QmdxZzGzFn2Lutk4AUREoWr2Pr/1Lltjf5hHatMB7VXsVEM/uPUOO+0laCXWtb/qcdElv/SAp+lUfGaDFYhefbmq+QFaUttfofn9jjlXbwLwRdsN1Rb8RxOSRu62Yb+AHM7riUnm+yddNw1y8U/rh9BktDriu52gEr7Ii3R8gSaeEwfJ9JscHgzFlgHVWrzAuhTWQs6E/hzqSnsRUsg4TKpw8aBB55KX2WU4YY+VE6ks+ys/bC0fAPvklYqhtuuh9OqdZuZnDSQ+niv+X5D3sQcpIwa0W05aEDdF8zqHUxdsoJUezYdXl+mkSgxuIrywCYnBwHnNZN157jZW11J0yiSKAZgOjyeCdsWr3Acm1zYBCEFJaAavoNiez0tXDSM2Jl
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9583.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(39860400002)(346002)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(2906002)(38070700005)(83380400001)(86362001)(31696002)(38100700002)(36756003)(122000001)(316002)(66446008)(6512007)(66476007)(64756008)(76116006)(54906003)(66556008)(6506007)(107886003)(91956017)(110136005)(41300700001)(66946007)(966005)(6486002)(2616005)(478600001)(71200400001)(31686004)(8936002)(8676002)(53546011)(4326008)(5660300002)(26005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VDFOdzJwdTB6clVwQnpBS1RSa3FTV0VVSTRNVGpKcXlaM29mQmNQdGppb1V1?=
 =?utf-8?B?TmNhMDVyUUYxN3JERGlYTy9yK05QdHZGOVJEck1lTFM2UmdVWUg1KzJPaDlW?=
 =?utf-8?B?RnU0TmFVUDVrYlVTcDNuV05mWnZVOU05S2VPZVVSUUd1U2xMb2hEdjZqNGlv?=
 =?utf-8?B?b3VJamJ3emJYNDNKajJJcXRSemdJRXJZU0JBR29seW1ZaW42dHZRMzFGZWxQ?=
 =?utf-8?B?OENERjBxWkNRUURVWDhJdmhRMTgrVmNvT2ExVlZmZDBzbDVSQmIzM1VBK2hj?=
 =?utf-8?B?MnZ4bm15TTUzNWhmMTFpeGdYTkNVOXdUSndTaGFJeEozMzJ5dUczd3pjUU84?=
 =?utf-8?B?T1FaakcrUDljMnR0T1J0MHhqNmZ0SUt4NXlJVTJiRUdKSEU5RHFqS2NWSlVG?=
 =?utf-8?B?ZUVDbWg4aVo2Q0VjbWNIVThJam9TUnZIdW9seUQ2SU1FM0pYZnoxTWY0NTdl?=
 =?utf-8?B?SURvZjB0bDRILzFPRVNSaG1pMFowaFRpQXF3OXFOeW1ubjdzb2pOUEJaS1Fx?=
 =?utf-8?B?MVVQK2ljSGF6UnE5TTBCYnh1WEo2NWhxdXJzbTZhOStibTRPbTA5cExvZmhE?=
 =?utf-8?B?S2NlWGVRdVRpSWRybFEzY2IwQzZhRG5ZQyt5RStNbk90aHo3b3MveUVwUjJY?=
 =?utf-8?B?U3NrNnpFMVJkdURjbFdPcUdWRVkwRjFCNW42dUNwbzMvWEtIM2t3N1E3Y0to?=
 =?utf-8?B?b3JjY2hodFdodlN3OUI4aDlPOWo1c0JwQkowVWNTNXNSS2xBRG04WVVSS0o1?=
 =?utf-8?B?N29nTVh5SHA5L2NmUHZ2SnBqYVVoVFVqRWpLTkJnN1ZiN21DUjlKNUxlbVZv?=
 =?utf-8?B?dG4rRldaZ0FhNHROTzMrNXFyNGRJR2lXblMzOHpLY3M4bGxFcEJ4WDBNTzd4?=
 =?utf-8?B?dnpFZ3VWNkFVVWFVUngxWEJpWEF2dDdvL2k0Zk9nV1cwQWdadWt2N2FhUWVH?=
 =?utf-8?B?WVUzUHI0Yk1xa0ltSnhVWEF2VC8wWS9yS3JzR3JQTVNhMGpKS2NVWHUvd00r?=
 =?utf-8?B?YVgzNU9Pc3B6T2tXL2RmS1RrNEJPZGwwRHJsN0I4K0FqWjBDaHlWdGVqbkF6?=
 =?utf-8?B?cFhwU3gzK3JIYkh0RGtSQ3MzM1l2KzFVc0RmMUwxaDRCTlR5ZDBwSEsvNWpU?=
 =?utf-8?B?bUVZYWdDUStCVVppNUk1WjY1MVlHRkhrUWVYVFE4UUJEYUNnUmErTjNWZi8r?=
 =?utf-8?B?V3BQVjh2azFkVnJjbE1IVG1ad2NPL0hrQThFakhWT1dDUW9qOTcxT21QYnpj?=
 =?utf-8?B?VTlQVnFUbmtMQlc5S2kvbDlpRDJ3b1pmc0NlemZZaE5EN29MRy9zekw0OFZ5?=
 =?utf-8?B?ZVFIRTdNTnU3dGZJWm5DeTNsa2VsaXNZZktEME0wUjkxZkhPZ0xzWFdlUU5J?=
 =?utf-8?B?S3J2alRVQjVHd2NRMUJoTVUzKzFub2lOWVI1RmNYWGs0SVJVSCtDVG14VnhO?=
 =?utf-8?B?aHdQQkZ3MmhrMjJVdWo3ejUvNHBZSERjSjF1VmE3NmJxVU95WEZIQ3A3S2JO?=
 =?utf-8?B?QlhGT2ErN3NvM0lMOFhKMkZlYmdYcldtQnRhSU1kMXo5NzJjYzMycVJmdVhk?=
 =?utf-8?B?d3M2VnJud29tQnY1WjZpMUoydzJKcm5Md1ptUXNLb0hMbzBOc0JtR2lFVVAv?=
 =?utf-8?B?OW9MVEMzWERpMG03QytKbHRFTnEzQkM1LzB4NHk4bTBjRkhBbjcxc0FXR29P?=
 =?utf-8?B?NG1mdFVPdGxMN3Z2MCs5K21md0w5bml0aUxWMjBpYXUvOGMybHhLWDlqYnlo?=
 =?utf-8?B?eXd2c0I0cUxqelEvSldVa3UzbGpIMkdnZ0NncHluaC84cENiWW1makx6b0I4?=
 =?utf-8?B?cXRINTR1RUY2VzFPSzFXeDdybkUySkphbXBDQnpoYkhndHJiSy92TGR5WjRw?=
 =?utf-8?B?d3NGaXJpSFM0dWhsT1RnVjNXcmtXZERXUU9hc3Bqak80VVJZVlE3eTIzUVdn?=
 =?utf-8?B?UmtZMlNTU2RCSGRWSytFSDl2b1FjZE44WlI3Y1pjZERUNmhOcWU5RmIyRWd1?=
 =?utf-8?B?Tm5rWFNPZ1d0TlVRMUdjUnZWZWhCdldLWXJjRDQwd0syREkxZW80ZGpQZTh6?=
 =?utf-8?B?dEo5ckRhcUVhdEJtZlVoa0d1VFR5OStIR1NSUlBXa1lRdTdZUDhqblo3Tkpn?=
 =?utf-8?B?Ykxaelc4ZDZRcjFiSjlCSzhmK0c5V3NMMnE3UUVJdCtjaEkvZlNpZGVWeFhj?=
 =?utf-8?B?Umc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C91C654BFDB09448B62FBDE711960A71@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9583.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e52ee4-5921-45f9-8bcb-08dbc57a9e85
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2023 08:11:03.9269
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7GxX/CnUN9jKiwHTUI22yw9l/1BGedoJzCgFXgqqZRS9sylGKp0iFw2rfz0nGxMfhlOmIl8lkBI4npPgW+zXy2+x/SMuMHXJXlBB8H9lX3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6478
X-Proofpoint-GUID: cuYCG93HxuDmhDwN6bz0IZumYC1dxW3J
X-Proofpoint-ORIG-GUID: cuYCG93HxuDmhDwN6bz0IZumYC1dxW3J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-05_05,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 adultscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=663 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310050062

SGVsbG8sDQoNCk9uIDEwLzQvMjMgMTg6NDEsIEp1bGllbiBHcmFsbCB3cm90ZToNCg0KPiBJIHdh
cyBhc2tpbmcgYSBwb2ludGVyIHRvIHRoZSBjb2RlIGluIHRoZSBEZXZpY2UgRW11bGF0b3IgKFFF
TVUgaW4geW91ciANCj4gY2FzZSkuIEkgYW0gY29uZmlkZW50IHRoZSBjb2RlIGlzIGNvcnJlY3Qg
aW4gVS1ib290LCBiZWNhdXNlIHdoZW4gdXNpbmcgDQo+ICd3MCcsIHRoZSB1bnVzZWQgYml0cyBh
cmUgbWVhbnQgdG8gYmUgc2V0IHRvIHplcm8gKHBlciB0aGUgQXJtIEFybSkuIEJ1dCANCj4gSSBh
bSBjdXJpb3VzIHRvIGtub3cgd2h5IFFFTVUgaXMgbm90IGRvaW5nIGl0Lg0KDQpRRU1VIGZsb3cg
aW4gdGhlIGNhc2Ugb2YgdGhlIHJlYWQgb3BlcmF0aW9uIHNob3VsZCBiZSB0aGUgZm9sbG93aW5n
Og0KDQpodHRwczovL2dpdGh1Yi5jb20veGVuLXRyb29wcy9xZW11L2Jsb2IvdjcuMC4wLXh0L2h3
L3hlbi94ZW4taHZtLWNvbW1vbi5jI0wzODkNCmh0dHBzOi8vZ2l0aHViLmNvbS94ZW4tdHJvb3Bz
L3FlbXUvYmxvYi92Ny4wLjAteHQvaHcveGVuL3hlbi1odm0tY29tbW9uLmMjTDQwOA0KaHR0cHM6
Ly9naXRodWIuY29tL3hlbi10cm9vcHMvcWVtdS9ibG9iL3Y3LjAuMC14dC9ody94ZW4veGVuLWh2
bS1jb21tb24uYyNMMzA5DQpodHRwczovL2dpdGh1Yi5jb20veGVuLXRyb29wcy9xZW11L2Jsb2Iv
djcuMC4wLXh0L2h3L3hlbi94ZW4taHZtLWNvbW1vbi5jI0wyMjgNCmh0dHBzOi8vZ2l0aHViLmNv
bS94ZW4tdHJvb3BzL3FlbXUvYmxvYi92Ny4wLjAteHQvc29mdG1tdS9waHlzbWVtLmMjTDMwMDIN
Cmh0dHBzOi8vZ2l0aHViLmNvbS94ZW4tdHJvb3BzL3FlbXUvYmxvYi92Ny4wLjAteHQvc29mdG1t
dS9waHlzbWVtLmMjTDI5NzMNCmh0dHBzOi8vZ2l0aHViLmNvbS94ZW4tdHJvb3BzL3FlbXUvYmxv
Yi92Ny4wLjAteHQvc29mdG1tdS9waHlzbWVtLmMjTDI5NDINCmh0dHBzOi8vZ2l0aHViLmNvbS94
ZW4tdHJvb3BzL3FlbXUvYmxvYi92Ny4wLjAteHQvc29mdG1tdS9waHlzbWVtLmMjTDI5MjYNCmh0
dHBzOi8vZ2l0aHViLmNvbS94ZW4tdHJvb3BzL3FlbXUvYmxvYi92Ny4wLjAteHQvc29mdG1tdS9w
aHlzbWVtLmMjTDI4NzYNCg0KIEZyb20gbXkgdW5kZXJzdGFuZGluZywgb25seSB0aGUgcXVhbnRp
dHkgb2YgcmVxdWVzdGVkIGJ5dGVzIGlzIHVwZGF0ZWQuDQoNCkJlc3QgcmVnYXJkcywNCg==

