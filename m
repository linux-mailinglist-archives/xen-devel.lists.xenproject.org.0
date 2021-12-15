Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B04F47600F
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 19:00:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247523.426818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxYZa-0003jK-9T; Wed, 15 Dec 2021 18:00:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247523.426818; Wed, 15 Dec 2021 18:00:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxYZa-0003gm-62; Wed, 15 Dec 2021 18:00:14 +0000
Received: by outflank-mailman (input) for mailman id 247523;
 Wed, 15 Dec 2021 18:00:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9HFQ=RA=epam.com=prvs=2983c13036=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mxYZY-0003gg-54
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 18:00:12 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d78f5d03-5dd0-11ec-9e60-abaf8a552007;
 Wed, 15 Dec 2021 19:00:10 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BFFEViS024119;
 Wed, 15 Dec 2021 18:00:06 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3cyjh6rp8j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 18:00:06 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6065.eurprd03.prod.outlook.com (2603:10a6:208:15c::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 18:00:02 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::7593:b5e4:6534:5e55]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::7593:b5e4:6534:5e55%6]) with mapi id 15.20.4801.014; Wed, 15 Dec 2021
 18:00:02 +0000
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
X-Inumbo-ID: d78f5d03-5dd0-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jktSMo4HL0mgCrEux1SX6+UdpvZIHKO7NgtzUIkVWZ2N3wRFDcYxjdv99vaJPx2dT7i9JL9Rw7YKXbRGrxhbDavNEEYnVSPy7pOEh7Xx6fYyi8TuVfEDeiqV/IsgzxXfRZWGrP5e+iAfqYkn7h4JMspCxf2/9BGPYBbbvxMcXaUIYzfXNYUARQQjzSq0XNI9MfaMkkUzxvlzSsm021mR+6YDUh1AugYeJMWkS0x3hZ551dGl5Cienysh+KsM++FawEKAvOAUhXi6CSpzSfE0GA51dwY/+jGYqsuFZfyuXObVKJI66tFYSBYdG12/+dfBXIfXnsFUBAw9HKdEQ9KCGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FBZ0WjRYw7ztx2TEcfgsACygr4F8867E8Ng6HhwkZpA=;
 b=ESINfCA1g4mTFqVOtqgQXxRdWnDH4U9R1rHkKWkA7lhEA9Z0d5To0Jtcink694fj1tVRp72ku37ScgTXp2ZaCsKEIXu20gG3QBOgbcPnZ4if3l6/fAD1LbQqagV1hlmZjamnxu9diehvFKxlJmknJL5CEuCdb1slXKzdwi5FaWEQSTLSE/ieJ0r8JIAthyftvAQ+8RlxfXYWpQpq5vs2CyFmctpDcwhGR+TElw1ytzq9exE+s8e3hfVBRvni2EvSP4xCtJyiSZMECrgRaTGXy82qoWJlUQvUsbktKwpXvlHpg2OhGvFsf9SH6E7Oc12l8MH/4PxbvQ655x/vhBX0BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FBZ0WjRYw7ztx2TEcfgsACygr4F8867E8Ng6HhwkZpA=;
 b=MWmqkKjAZ/ZUDogqamVLjKng++bdRYLTP6Q7Eiywb7STs4ABtw/xn9SJsg5g5d/IK0U8GnbrQsN1357S/OMLcqP+mZz2KA5Q7Z+I7kSjp23idRPAutBEzAcRCVIStCET45a/di5HXk9uIqENso0PB5V1c3x8XCNEc5EY6thQg2LFvDQyweIpve9c7uQN5Ry19aFUk6vFomQdOznanJarwFHb9Bw3f8drQnKIQhg3D1bIEPeEcD2CVaVHKlVAJJubGD9sy+qZvNZxaocFaK/9XUrS3/KXXmAQvXGJrMPgShIW5U1e4sOEeCI426tE0OWQUMQSML+kwJQQu2S2Ig+tUA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v8 0/4] PCI devices passthrough on Arm, part 2
Thread-Topic: [PATCH v8 0/4] PCI devices passthrough on Arm, part 2
Thread-Index: AQHX7M5/eWAVb5SkUEuZj2suH/4dRawz3lKAgAADOYA=
Date: Wed, 15 Dec 2021 18:00:01 +0000
Message-ID: <83cb4029-276d-7851-1535-819deb3ba69e@epam.com>
References: <20211209072918.460902-1-andr2000@gmail.com>
 <17e4ce2b-be61-8fdb-d742-ea6ddf8fa996@xen.org>
In-Reply-To: <17e4ce2b-be61-8fdb-d742-ea6ddf8fa996@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47fd8b4b-5075-4ae7-2583-08d9bff4b779
x-ms-traffictypediagnostic: AM0PR03MB6065:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB6065E5332A7FF55CF48471BDE7769@AM0PR03MB6065.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 oWh8a8bdDz+1BkmWN7ZQszzfssah8WLsvcWz59FKiMCOzkqj2eqxEkHfYs9gcS1I6h4SX0lWYZtPeFmaXAXOcW7/VY1VQqDf9IijF7VqF+G+LSU8hab2fkQYj5mlI3IQJL01LFXHB+xMtzcv6oYoE8NaAB6hwT1pzM5uAytbXM1CE2+EKQvgJeNVHZLFUVAU0k5gGK8J/aMwhVxvXS/YbQnnotHlj3KaAJlQF13MiwZfGJLJnj2/ly53HUawMLIHJBOrGGdSeTBhfN1GxtBjeDudw1axuvG9r9aWKryEVmhvlczDfBaMf4SmL2oX10kuAp30KNs+xSs3z3GkqGWCGLMuM8HWLt1zh1zpnC6vR8CIA5Iizh+dUvphP/ACLTSXcfh60soBb9OFoDgV35FnPk6+Y5PdP42YAXanv3kQV0UHJuQ9z1Rummq6S0X6eTWEu/jc8elH776lPNdmcG0dXi7stmTfb4oHTgUc7vYO1G3W0u4T7oxmK2Bj9rKxZuVgwUQgesBGv9mHFWsJny5uRw/jcjSv8oMORO/19TDy5aNRvZKOUNUf779k0myNIzZ8NkdnsU7WNQH7/j0R9Et9oYoiHSvaRnTnm7KeAOrDJqkCKIgxxlkOcvlKt4xmHQsT8AougXS/1mIDXkWeXtwTbINzmmC8C/xt3iyLTjM3YTCLajiCqvT5K+oKuU/ybxcdNnqpOkXIITKlvW3TwzrSSGnSAO8xRHb7yLjIDGp1h7DeKpz2PNmWEvTNLYHhIRMIdkqre73geOX8Vzcf1UhA82CoDuMDnpvIbiTUQ6LzII4R9C4lJPG2VqtVbI883eI29s0UTHB7b7p6VmB6Vpr6EVIbUiLScD34mIPD/td6Ohg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(86362001)(508600001)(6512007)(316002)(110136005)(8676002)(38100700002)(966005)(83380400001)(6486002)(31696002)(38070700005)(66446008)(186003)(71200400001)(26005)(53546011)(107886003)(2906002)(55236004)(76116006)(91956017)(122000001)(54906003)(6506007)(8936002)(66476007)(66946007)(64756008)(66556008)(36756003)(2616005)(4326008)(31686004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bElwMi9oYnd4YXNrS25TeW1EdURiejdsbGZkNm82aHNNbnNyelJzbU8wWUpw?=
 =?utf-8?B?LzBkcjdjejFpRGNsbS9EL2JLMjlFZXFGS2Y3UzZIcUxUcVJhSmdSRUM4NS8y?=
 =?utf-8?B?VzlmemtPYkE4MjhOY1Z2K0lzNWwwVVpUWXBKOVh4cGp4cGoyNjBkcytUVGxy?=
 =?utf-8?B?aXlhU3lxVUx5bHRWdmlYTHZBWER1SHdHc2hidHBHc2lHZnBFdGdXNTExV2NO?=
 =?utf-8?B?WnNPTUJsSXJmZjhvdjRVcVNsVHlrRzM2UE1WYnNmWDd2MVZqeWJRK2RWVFRp?=
 =?utf-8?B?MFJiYlJlS3ZDeXZsMzFIZXptWnRjVm94U09kOFBFQ2Z5cG1HaGFOUFhQcFMy?=
 =?utf-8?B?dUVWaVdMcC81dFRhcVVVQmYvME1sQ3JFd0M5MXNSUVNzaml0dGJjMWdsQWt3?=
 =?utf-8?B?Rmx6WU0wR1pqSGN3d040VXA2M1pUY0IyTjBlWGllS3cva2JaTjRRZzAyQ21V?=
 =?utf-8?B?MFNHWjFkSmp2N0hwNkZrSFl0L0xhV2R4Z0RFYXcwUXJxcmJWOUtCTVRMTkVq?=
 =?utf-8?B?V29NMEZkc1picUQxSWtiOGhkK1VubHhOeUk3Z2wzZ1JwWUlQLzNLQlFmT2Fs?=
 =?utf-8?B?dHZKOUEwWVU5QVFlSk50MWNpOERXOHI4dXRlRURNZnYzcEp2V3NaYW5nODlJ?=
 =?utf-8?B?QnVmWDZBK0dML0tzalYxWW9pM3hVaHBxUGNtU0l5YTNkV080ZTZjcURUM2Ft?=
 =?utf-8?B?aGQyUWx2dHluV1U0cWNJTzdxdnB3elRrOFJRQjA0emhRaWxrUnZ1c1g0R1lr?=
 =?utf-8?B?c2ZSOUtwQWtCWjJyeGM5VDUvSkhnZ2cxQy9md3NNanF6NXN3YWhTQTlDdlpF?=
 =?utf-8?B?eGwzYXNGNERFSTFXbnduTkNPRDlOYVhGQjc1ZEI4VDRRcEdNOWVxai80YVg3?=
 =?utf-8?B?Nm0vdFh5djNOdERETUFhRExCbnh4allQQUtrWUdKT2hUT1QyOGhxUnhZSGp2?=
 =?utf-8?B?YWh1ZWJPQjY2aVhjcTloRmdHWGwyekpDRVFadzVLaG83L3ZuYzJTb0dCM0Nj?=
 =?utf-8?B?UVFrNk11SDNIVXpIdW4rRW05WSt3TU5TNFlreHBJemFrRVordHBvSHQ4MWxp?=
 =?utf-8?B?THI5SktTTUV6OWJSRzhqYzlpejJhTWNoQUU2SDlVSkU2bVd3OW9VVUViR1RG?=
 =?utf-8?B?MWdHT0JQTlZBRVljZGZCRjEzYmkxSHpESTMra0N2cms5V2I1UnhCWnloL3Uz?=
 =?utf-8?B?Ry9uem05eVlJTmpVUVMvWno1bzJPaG85YzVZWmU3dXk4T1E2QmxoNWJidm5G?=
 =?utf-8?B?Zm1vZFpEd3RvQll1bHVjSnZ4OVRPV0s5L04xZXdqTlpwRk1HVmU3VnpUMkZO?=
 =?utf-8?B?NmN1QXlqYXhVdzJFQlRJWnJ6ZklGWkxBRERVUFdpYXY5NG93YjBUTmE0RTlP?=
 =?utf-8?B?a1k1V0Q3SFRGb0hsTCtEeXcyUUVBYXpxLzdzZHROMzFXbkJlUlFlU2RsYVFT?=
 =?utf-8?B?YmVRemFyUHpaVmQ2dWxxQkFmcmRQSmd0QjAvK0dBRE5SbDZKMzBKVkxRUGd3?=
 =?utf-8?B?ZU0vRXUrT2NaaE02ang0UDRYK1pycyswZ2JvV0RTMXRSS3A5SG1oTzJuWmFx?=
 =?utf-8?B?M1ZqV2lvUGJLaWRmQUFWaWIvZjVqUjFJZWlSNXdFdko2MDYvYVRnLzVSQ1FS?=
 =?utf-8?B?WVNKUFdoaEd2UW80ZGRKbUh1UjlROFNkekdIOFZlMjV2NDRVMGxLeUs3dDNO?=
 =?utf-8?B?cWtjNWNlT25RMHlTdXE2M0E4TVY4QlgyeG9zcWZZL2VhV1BteGtzN0ZSbHVT?=
 =?utf-8?B?YWpOdkRHNEM3K00rd1BSOTlBaEhGMnI4ZFBJMy9aRFZVWXg4UkthdW5IQ1Rz?=
 =?utf-8?B?V1pyYSt0V3V3a2V0WXkxS0JaUUpsLzFHYXU3M242cmgyNXEzMmZoS0RHYnBX?=
 =?utf-8?B?T292d0lLQml6Z3NBL1lnM1VScVNXS3NLYk1zVlByQjdDS2h6c1BkR2sxd1VM?=
 =?utf-8?B?WlBJTXpjNEpQQVNRSHdEMjg3eERQMDhBcnlYVXRMK1JKSFJOYVRhRnh0cjdL?=
 =?utf-8?B?b05rb2NWNXRNSEptMGMwWlV4dHMxOTdDWW1pTWJaZzQwSjBNSEhVUzZvSWdM?=
 =?utf-8?B?ZmQxMkUwNU9SZDFvZUZlY1lKazFrd0xlV3M1ZEZvNGd6c1UyQ0NHL2szMUha?=
 =?utf-8?B?T3pCNFFUUU5JcUFJSjlCdGN3OGZzaUpqSHcwdjhxaTEwTlRyVFJaZWJyUHpa?=
 =?utf-8?B?dlBMMVhaTTU3cUlzZTU4elF4MHJZUlNYaTVOR0Y1clQvKzNTTmEzV3N1WGRw?=
 =?utf-8?B?RHk5ZE4wVUdiU3BpRkZPOEsySlFYa1F4azJkdnA5N3F3QjdqTGRham1xWHNz?=
 =?utf-8?B?djlianJtNHQ5ZmZNM3dOM2FrMjRIcHRndTNwTFc0OGMxZVZReVg0QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2630DD1CF5CFB447AD2A9FEA7D831DFC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47fd8b4b-5075-4ae7-2583-08d9bff4b779
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 18:00:01.9637
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jvX6sVdtC5F1uKdJNR7PQg9Ht12cz7XIVZ/vwVkKa4Z7uE4isQDRor8h8TH63FVhAgUYukt5hZq6IsM6hwwMqhkoivz9s0lfjExCjyJnkHm1piMmulPgxwSheqnOfVSs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6065
X-Proofpoint-GUID: PC9ASQ8DAKmA2fu61_MDcWkyCPnoW_Gb
X-Proofpoint-ORIG-GUID: PC9ASQ8DAKmA2fu61_MDcWkyCPnoW_Gb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150101

SGksIEp1bGllbiENCg0KT24gMTUuMTIuMjEgMTk6NDgsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4g
T24gMDkvMTIvMjAyMSAwNzoyOSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBG
cm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBh
bS5jb20+DQo+Pg0KPj4gSGksIGFsbCENCj4NCj4gSGkgT2xla3NhbmRyLA0KPg0KPj4gVGhpcyBp
cyBhbiBhc3NvcnRlZCBzZXJpZXMgb2YgcGF0Y2hlcyB3aGljaCBhaW0gaXMgdG8gbWFrZSBzb21l
IGZ1cnRoZXINCj4+IGJhc2lzIGZvciBQQ0kgcGFzc3Rocm91Z2ggb24gQXJtIHN1cHBvcnQuIFRo
ZSBzZXJpZXMgY29udGludWVzIHRoZSB3b3JrDQo+PiBwdWJsaXNoZWQgZWFybGllciBieSBBcm0g
WzFdIGFuZCBhZGRzIG5ldyBoZWxwZXJzIGFuZCBjbGVhcnMgdGhlIHdheSBmb3INCj4+IHZQQ0kg
Y2hhbmdlcyB3aGljaCB3aWxsIGZvbGxvdy4NCj4+DQo+PiBSRkMgaXMgYXQgWzJdLCBbM10uIERl
c2lnbiBwcmVzZW50YXRpb24gY2FuIGJlIGZvdW5kIGF0IFs0XS5IaQ0KPj4NCj4+IEkgaGF2ZSBy
ZW1vdmVkIHBhdGNoDQo+PiBbUEFUQ0ggdjYgNS83XSB4ZW4vYXJtOiBkbyBub3QgbWFwIElSUXMg
YW5kIG1lbW9yeSBmb3IgZGlzYWJsZWQgZGV2aWNlcw0KPj4gYXMgaXQgc2VlbXMgdGhhdCB0aGlz
IG5lZWRzIG1vcmUgdGltZSBmb3IgZGVjaXNpb24gb24gaG93IHRvIGFjaGl2ZQ0KPj4gdGhhdC4N
Cj4+DQo+PiBJIGhhdmUgYWxzbyBhZGRlZCBhIG5ldyBwYXRjaA0KPj4gW1BBVENIIHY3IDQvN10g
eGVuL2FybTogYWNjb3VudCBJTyBoYW5kbGVyIGZvciBlbXVsYXRlZCBQQ0kgaG9zdCBicmlkZ2UN
Cj4+IHdpdGggYSB0aW55IGxhdGVudCBidWcgZml4Lg0KPj4NCj4+IFRoaXMgc2VyaWVzIGNvbnRh
aW5zIGFsbCB0aGUgcGF0Y2hlcyB3aGljaCBhcmUgbGVmdCB1bi1jb21taXR0ZWQgeWV0Lg0KPj4N
Cj4+IFRoYW5rIHlvdSwNCj4+IE9sZWtzYW5kcg0KPj4NCj4+IFsxXSBodHRwczovL3VybGRlZmVu
c2UuY29tL3YzL19faHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L3hlbi1kZXZl
bC9saXN0Lz9zZXJpZXM9NTU4NjgxX187ISFHRl8yOWRiY1FJVUJQQSFncXo1ZTNkTC02VXJzY0pz
NlpvcktnRE9NcFlzZmlQTkZuMGZmb3J0S3JjR0JraWw5U01LamJEY1g3Vl9UOVJWSURfdnJVMWlV
QSQgW3BhdGNod29ya1suXWtlcm5lbFsuXW9yZ10NCj4+IFsyXSBodHRwczovL3VybGRlZmVuc2Uu
Y29tL3YzL19faHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1k
ZXZlbC8yMDIwLTA3L21zZzAxMTg0Lmh0bWxfXzshIUdGXzI5ZGJjUUlVQlBBIWdxejVlM2RMLTZV
cnNjSnM2Wm9yS2dET01wWXNmaVBORm4wZmZvcnRLcmNHQmtpbDlTTUtqYkRjWDdWX1Q5UlZJRC1H
QVl2MjlRJCBbbGlzdHNbLl14ZW5wcm9qZWN0Wy5db3JnXQ0KPj4gWzNdIGh0dHBzOi8vdXJsZGVm
ZW5zZS5jb20vdjMvX19odHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwv
eGVuLWRldmVsLzIwMjAtMDcvdGhyZWFkcy5odG1sKjAxMTg0X187SXchIUdGXzI5ZGJjUUlVQlBB
IWdxejVlM2RMLTZVcnNjSnM2Wm9yS2dET01wWXNmaVBORm4wZmZvcnRLcmNHQmtpbDlTTUtqYkRj
WDdWX1Q5UlZJRF9QV2staFJBJCBbbGlzdHNbLl14ZW5wcm9qZWN0Wy5db3JnXQ0KPj4gWzRdIGh0
dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL3N0YXRpYy5zY2hlZC5jb20vaG9zdGVk
X2ZpbGVzL3hlbjIwMjEvZTQvUENJX0RldmljZV9QYXNzdGhyb3VnaF9Pbl9Bcm0ucGRmX187ISFH
Rl8yOWRiY1FJVUJQQSFncXo1ZTNkTC02VXJzY0pzNlpvcktnRE9NcFlzZmlQTkZuMGZmb3J0S3Jj
R0JraWw5U01LamJEY1g3Vl9UOVJWSUQ5U3poSzRidyQgW3N0YXRpY1suXXNjaGVkWy5dY29tXQ0K
Pj4NCj4+IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvICg0KToNCj4+IMKgwqAgeGVuL2FybTogYWRk
IHBjaS1kb21haW4gZm9yIGRpc2FibGVkIGRldmljZXMNCj4+IMKgwqAgeGVuL2FybTogc2V0dXAg
TU1JTyByYW5nZSB0cmFwIGhhbmRsZXJzIGZvciBoYXJkd2FyZSBkb21haW4NCj4+IMKgwqAgeGVu
L2FybTogYWNjb3VudCBJTyBoYW5kbGVyIGZvciBlbXVsYXRlZCBQQ0kgaG9zdCBicmlkZ2UNCj4+
IMKgwqAgeGVuL2FybTogZG8gbm90IG1hcCBQQ0kgRUNBTSBhbmQgTU1JTyBzcGFjZSB0byBEb21h
aW4tMCdzIHAybQ0KPj4NCj4+IMKgIHhlbi9hcmNoL2FybS9kb21haW4uY8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoMKgIDIgKw0KPj4gwqAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5j
wqDCoMKgwqDCoMKgwqAgfCAxMzIgKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0NCj4+IMKg
IHhlbi9hcmNoL2FybS9wY2kvZWNhbS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMTQgKysr
DQo+PiDCoCB4ZW4vYXJjaC9hcm0vcGNpL3BjaS1ob3N0LWNvbW1vbi5jIHzCoCA3NyArKysrKysr
KysrKysrKysrLQ0KPj4gwqAgeGVuL2FyY2gvYXJtL3BjaS9wY2ktaG9zdC16eW5xbXAuYyB8wqDC
oCAxICsNCj4+IMKgIHhlbi9hcmNoL2FybS92cGNpLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfMKgIDg1ICsrKysrKysrKysrKysrKystLS0NCj4+IMKgIHhlbi9hcmNoL2FybS92cGNp
LmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNiArKw0KPj4gwqAgeGVuL2lu
Y2x1ZGUvYXNtLWFybS9wY2kuaMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMjIgKysrKysNCj4+IMKg
IHhlbi9pbmNsdWRlL2FzbS1hcm0vc2V0dXAuaMKgwqDCoMKgwqDCoMKgIHzCoCAxMyArKysNCj4N
Cj4gQXMgYSBGWUksIEphbiBwdXNoZWQgdG9kYXkgYSBjb21taXQgdGhhdCBtb3ZlZCB0aGUgaGVh
ZGVycyBmcm9tIHhlbi9pbmNsdWRlL2FzbS1hcm0gdG8geGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNt
Ly4NCj4NCj4gSSBoYXZlIGhhbmRsZWQgdGhlIGNsYXNoIGZvciB0aGlzIHNlcmllcyB3aGlsZSBj
b21taXR0aW5nLg0KVGhhbmsgeW91IGZvciBkb2luZyB0aGF0IQ0KPg0KPiBUaGFuayB5b3UgZm9y
IHRoZSBjb250cmlidXRpb24uDQpUaGFuayB5b3UgYWxsIGZvciBzdXBwb3J0aW5nIHRoaXMgd29y
ayENCk9sZWtzYW5kcg0KPg0KPiBDaGVlcnMsDQo+DQo=

