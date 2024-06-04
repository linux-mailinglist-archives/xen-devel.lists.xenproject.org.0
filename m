Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC5B8FB18D
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2024 13:57:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735381.1141568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sESmc-0005hw-6R; Tue, 04 Jun 2024 11:56:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735381.1141568; Tue, 04 Jun 2024 11:56:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sESmc-0005fC-2l; Tue, 04 Jun 2024 11:56:54 +0000
Received: by outflank-mailman (input) for mailman id 735381;
 Tue, 04 Jun 2024 11:56:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0C9R=NG=epam.com=prvs=2885f2d17f=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1sESmZ-0005f6-Og
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2024 11:56:51 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85d36877-2269-11ef-b4bb-af5377834399;
 Tue, 04 Jun 2024 13:56:49 +0200 (CEST)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4549fJFG009223;
 Tue, 4 Jun 2024 11:56:35 GMT
Received: from eur03-dba-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2168.outbound.protection.outlook.com [104.47.51.168])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3yhqvu1upu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jun 2024 11:56:34 +0000 (GMT)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DBBPR03MB10533.eurprd03.prod.outlook.com
 (2603:10a6:10:53c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.15; Tue, 4 Jun
 2024 11:56:30 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%3]) with mapi id 15.20.7656.012; Tue, 4 Jun 2024
 11:56:29 +0000
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
X-Inumbo-ID: 85d36877-2269-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cW97bfir6t/KVEW94iLNomyIbB5DJYbsRXkR4FlrevqEwmVVUnGkKV7sX83k+kY5Guxeo1z0tTrTv3syH+eFjcIhd3cgaOSsGIBzsGwter/QzLDEz33Ic4TXqmOcfKY7L/e+Le30AFsoCyFdDMfy+xzqjOkR8GV6bNpfkqcBniOVSjX7YMmwUUktz9y2Dmke3p6cR9NuZtDZh+rDWRzomPtiGSUPEEX9vn9qiLTfJp8GGQjWbAIRU2L9IA0ya1UhyMoh4VDHAcQ8/UvH5SY6rxSYzYGI88Rzx4dxylundQIr8lgjbXZ6HaQGWZdSHNUnb1aHEQNDBy4w1boe2vcbUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EoN9sTZzTcVWUtCrs7tmGwoVMb12tIiwhSXzCe3yGdE=;
 b=F5vj9BDsu8BgZ0p3Y8OLdD2KaDjwHWKYaMeGH+i7p/Rf937BjZMgop0BdYcXEP9iVaqBKYrox1uZzk2ZfDf64BGAv4Zdc8WaYfSBVHKLk1XtKZ52dodZdr5hf7kumo2mTqnYJxf1SIDi8Wj+qmtWkYOTOkvti5Ybr2v9CkEXHujBWemJ01451JuU33UinjNZphe4WqrEjpVHzVXs/PLKTK4rX2QB7MLkTletiLHP457vWFIQafrqXq6mHQC20+lf7m7+skj5LoCW/Ya9Ug0fCnKoyG7RyLKK9QBOgnrTgiZY6msarIp6L9gNFdHZwbdZjMIpyNnph6WsaAhHfGm54A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EoN9sTZzTcVWUtCrs7tmGwoVMb12tIiwhSXzCe3yGdE=;
 b=uCMDQnKy52c+mX8ID3cIy9VBd/n8Thsfcc23Xs4izIaY6bWnQGoiTA3MD3fpvlPM6GeL4SmSnUNnhOmhhzTyEHNPzPKE9F0rZt396okM3nQ9Ecw8kOgUQnnaH9bN1DRoMtQiTTvSlbV2IAn5JbyWwr/yGhOSPGzsa7s7AQB/G8HLBVOqgFM/Ut9E+CQ8uha7Ljw5BaP6GZ1XXQ330lE0gUwgWvKlxlj/F5jwyhX2zx5HJoqAF/fBqeg9P7NrfbSIZAAfmHyNiG5F5+UtOYh9PCYD/EYZNvTLqglR+4MJDT9ql0pzMsXojRE5YXsOKMt24qXnnYobWwWs2Zc8Xf6EQw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>
Subject: Re: [RFC PATCH v2] arm: dom0less: add TEE support
Thread-Topic: [RFC PATCH v2] arm: dom0less: add TEE support
Thread-Index: AQHas4LmA3+MKr53jE6Kc+pdYgdQGLG3cwAAgAAM7IA=
Date: Tue, 4 Jun 2024 11:56:29 +0000
Message-ID: <87tti8x6oj.fsf@epam.com>
References: <20240531174915.1679443-1-volodymyr_babchuk@epam.com>
 <9e62b5d9-9c80-4f7c-9cc6-3b863f0c90ad@xen.org>
In-Reply-To: <9e62b5d9-9c80-4f7c-9cc6-3b863f0c90ad@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.3
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DBBPR03MB10533:EE_
x-ms-office365-filtering-correlation-id: 34a9f589-af8f-406d-c149-08dc848d5ef3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?a53Af0pFE0IEc8ptUQ1MZ+Fdth14iveeeN+sl1GPe+LgbziOlWW9Qgm9Hh?=
 =?iso-8859-1?Q?jiTT7rMeky9KFF4RQly/Q6xOi9yfhSrMloHIEast6Q8hXiHJN6ns0ALWT/?=
 =?iso-8859-1?Q?+BImAz/srFGgwZLuZAE1BblBzXZBdqGDe8orQBtIlYjx3YLhqueaLLvQBK?=
 =?iso-8859-1?Q?Sckjf+Q6OPHzOJkBbEy9OnGgXw3ZkTsH0AlwFvHEcur3yrMNVQfrGeQKgP?=
 =?iso-8859-1?Q?w7ZOT+v/qYeVd4cYXm9fYt1hmQntNEdWwwqTGBKb6vhyP4pyBy7rO2IUbk?=
 =?iso-8859-1?Q?fxVqgQaC+hkx1fLQChFpBbPmrE3BuZfECCFJHuVI05rDDA8jlP4qkxQpdj?=
 =?iso-8859-1?Q?t+O6C0stRhD72tYa7JUUrh840Fa1urYtp/6Ob6kL1EUYNgGzRzk7efFxVF?=
 =?iso-8859-1?Q?48igQh2iHej23oDRwGu+4jPnCLpaXrN4dPwXmBxOyx86sh54uwyolMAL39?=
 =?iso-8859-1?Q?4hJflCOhKyzdY3/c7+zIU2wzmvOAB0uBstyjcrDgNZLeQOAs9t6r+Cm4lP?=
 =?iso-8859-1?Q?jhABbJrVilPk9L3YvIXhtjEMpp5X9edyYVGQhFf1MJdJZem29yrmzTI+iZ?=
 =?iso-8859-1?Q?HG2whb7yeXhsYiDXAfnXNNxl5KIutBKKdMXie8czWtsQCVlWhgA/toBojC?=
 =?iso-8859-1?Q?AIOPtptsac/3FhRvPsvRghqd6+0vCkdaokzji6E83DtX73DBB0VMIE32kB?=
 =?iso-8859-1?Q?6e9ioU3cCkwTwRODjbpjBexEfrsjHl7JKKyKNBQLSljKpk1KnF3NbfZ/wi?=
 =?iso-8859-1?Q?KtTSAwMWg2d1Tt7rnIBjZPYsI1mpU62qziH1uMCw5usNj/rek8acN7rPuV?=
 =?iso-8859-1?Q?i6ZKS+3YG9ViaWYCwpcxlptpmpHtH6RLsLGupOZlj4TVP3zheHCYAK8NPv?=
 =?iso-8859-1?Q?BSH4GlalXyxA/x31qKy0vk20anaYcu82GPav1PLeRQ5hterUK2++LTHU4n?=
 =?iso-8859-1?Q?7oHefKNfeBIAwvouSKfIiMPH+TLyZ7gvaVR6CU/ydBzKM/BRNSdz14CGVN?=
 =?iso-8859-1?Q?pKNqABwlSaKGiZy0P0pwVPKEuCnCenW/LBgIEZPnxVPf3W7f+6o+hSGNic?=
 =?iso-8859-1?Q?HeDTDR0b2ftSc31sVAbtRl/gtWSbEUEsSRDle/SrHg8wnw8L5P6uKQbHhJ?=
 =?iso-8859-1?Q?PSmOpbpYZZQkn3dlgS4qJa53zyadsnifZsSWgfwwlfQmdVKl8O56V+LdVj?=
 =?iso-8859-1?Q?0JzRFC/9MpmvlAxYWkP0+otX6sfElKnX7oLNrpUfOpX2hO8Jpfs9KcFJKi?=
 =?iso-8859-1?Q?m1RcUjpi0G+qkEpUf68DZO5TSkBTNBPF4vJ9Qm8X/JRNvoXHSxm8entJx/?=
 =?iso-8859-1?Q?U/i9Tvt/vOhwHusRjomVtnSFQ267Z4eodb2DRSUn4VblLAcjN6u8+OpNIb?=
 =?iso-8859-1?Q?/GjEVgoWoxHFdia7ybO93MaQPt0lsOGA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Z6ZuQIA3ZNwvRxzNOaxzWGcNPsuBeJnWbGKDLKMrQueduw6x41YHA3CMN0?=
 =?iso-8859-1?Q?RHLukb8dVPwc+8gDH5z6MtXeBjWqVXik31fXpxgu1jRlfLiTriYEN6eSY9?=
 =?iso-8859-1?Q?1xlhW8BwThmX9cLuWYvTVuwsyr19bBoN4crPM+k1ZJyA5aN74d3Zbk9bP5?=
 =?iso-8859-1?Q?tDPdjFFcXMLsTiBImE+M+nPXW3Mjf3uHV1GfhTdnvOupJxD/gBVyFA1wki?=
 =?iso-8859-1?Q?v9lCuettbr53h0slehRn5B4/C3rfexj2/MC3OZ34tNL7hyYb2RVv9ELd7r?=
 =?iso-8859-1?Q?lMQavl0aBqP6PqMs5Tnzl3x1aLeoMWqhHDSkcAgsqA9HDfTUxuRAbjAHFC?=
 =?iso-8859-1?Q?afi0uftwlLLEQAsybfiFF5fofjOtKljBiXVALLqMHt7UCPJziE8EZ0wD1r?=
 =?iso-8859-1?Q?ZT3kSWdNwGotjHOphgLgSC5MuTsP1JhGFUklRJN0XQXjJ1xgSuyQPe5zv1?=
 =?iso-8859-1?Q?86R/OW6+ZJPHUEqMlWiS40nFwenn1ZB78yNGye3qb8F/1DbdgBRoSwXuFd?=
 =?iso-8859-1?Q?PAolmaq7BP+9t9ge9cYnq5xsXiBNCRAjF+6XTUB9dcLZlmeppHDg7uhaSS?=
 =?iso-8859-1?Q?p86llzGv1BEKeFBpqswhpC4rV2YegMv4gTjuoZmzjt1Xm56QTwGCbMKUH4?=
 =?iso-8859-1?Q?N7SBtZAeHCbwYhXSFSMJmzHK9jRdAY5rTVjm+KoCKpnXaPEHNDjtQG1rQL?=
 =?iso-8859-1?Q?YvsM4DZnEdtTLf6ZbmS+TBOSIJF/oxpNAW0W/6QJvdn3zWVLmMYqMCM61S?=
 =?iso-8859-1?Q?XvO2k8z/GEnI9WD5+8xv+J3m7CsZNgicYtDsLyjbZFJwYIAUp61N3PLnRu?=
 =?iso-8859-1?Q?25RGS1IuB1r1bgWHW29/UqUfnm9a1lj6kmQtItaxGjXYdL4c6c9LQY15ST?=
 =?iso-8859-1?Q?BgAezcnmFmZ38XDd3Uv/7kY/19a6u+KDfa/vddni6eJoQRKqk6HwrQS+Xe?=
 =?iso-8859-1?Q?0UfXt+J/AUalRMQmAsxoZ1kjL89JMeqghwIPk4JF42miSjntnd1+x1pVUK?=
 =?iso-8859-1?Q?Tbm95AUzl4rL5BY0vdr7j3sR4w/da8My+ypnesX1PTQEyEeIdtC/1XZXSW?=
 =?iso-8859-1?Q?54S3w1tsNAuUUP85Pf/H6u5uvHWup2+nHWw4CCQisWvMbBUFAaL6qqh0qx?=
 =?iso-8859-1?Q?q5f2Xt33V6e0m+Ki9aeICJcbVpliOTruQ3CvI6yHnnl4o7V70VcVreEGEW?=
 =?iso-8859-1?Q?lwFGQ3w6u7rEDrT1mI5TEOMqTSc0k/fidKngDi4FSAK4IyqWn17lK1JV9E?=
 =?iso-8859-1?Q?mTwxztMC+/Xym1S2d0OF7oqCJTzjg+0EGD+Ni6PXcMo0Inf9md75Y0ZTvW?=
 =?iso-8859-1?Q?oJNqbMy9pDU2Ni6K0cVgOqWD+ux3Z3M0k4T8qgCzjoXQEzTXzRm3dWq2ST?=
 =?iso-8859-1?Q?hSGJ45dwtRdoz6r1ekMV49KX5T/uH1Px1UsPRVfFwHDVBOVfxgJEuj5u0I?=
 =?iso-8859-1?Q?mOwSifIwiAVWsfr+kb0P+ytjmQFRz/JsJUNsJmagSh6jYs0oLD8eNOzQ6m?=
 =?iso-8859-1?Q?4pnJKtWQG4zUnrLgSTODERg2YuG7RpPeuR6oi4djevrSIW6sz5fn4o+ntl?=
 =?iso-8859-1?Q?jB+pYf3Knz7FJUZTunlzcAZJ2iV3hVEUKi6L5ROkj92xLtRERam8kJ9RmK?=
 =?iso-8859-1?Q?7wYFqNFCDsLBHMZ/FNI24+a76YLQIah0oiUQ6vBF135e5u/OMjwjob+Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34a9f589-af8f-406d-c149-08dc848d5ef3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2024 11:56:29.7993
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OR1B+Yjyn0SIwSp18fX0ySjvoeL5OUVQ/wB5VYfa19Z7/SeA3aKezNSdc2YQK0zkgR6DDNaENLD0riNljVntIJohC6/skt6v3sBOSTFKA9o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10533
X-Proofpoint-ORIG-GUID: 4j_CJ_K4mbfb_dTqFkCxcky0kWVg679m
X-Proofpoint-GUID: 4j_CJ_K4mbfb_dTqFkCxcky0kWVg679m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-04_05,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406040096


Hi Julien,

Julien Grall <julien@xen.org> writes:

> Hi Volodymyr,
>
> On 31/05/2024 18:49, Volodymyr Babchuk wrote:
>> Extend TEE mediator interface with two functions :
>>   - tee_get_type_from_dts() returns TEE type based on input string
>>   - tee_make_dtb_node() creates a DTB entry for the selected
>>     TEE mediator
>> Use those new functions to parse "xen,tee" DTS property for dom0less
>> guests and enable appropriate TEE mediator.
[...]

>> +
>> +    A string property that describes what TEE mediator should be enable=
d
>> +    for the domain. Possible property values are:
>> +
>> +    - "none" (or missing property value)
>> +    No TEE will be available in the VM.
>> +
>> +    - "OP-TEE"
>> +    VM will have access to the OP-TEE using classic OP-TEE SMC interfac=
e.
>> +
>> +    - "FF-A"
>> +    VM will have access to a TEE using generic FF-A interface.
>
> I understand why you chose those name, but it also means we are using
> different name in XL and Dom0less. I would rather prefer if they are
> the same.
>

Well, my first idea was to introduce additional "const char *dts_name"
for a TEE mediator description. But it seems redundant. I can rename
existing mediators so their names will correspond to names used by libxl.

>> +
>> +    In the future other TEE mediators may be added, extending possible
>> +    values for this property.
>> +
>>   - xen,domain-p2m-mem-mb
>>         Optional. A 32-bit integer specifying the amount of
>> megabytes of RAM
>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build=
.c
>> index fb63ec6fd1..13fdd44eef 100644
>> --- a/xen/arch/arm/dom0less-build.c
>> +++ b/xen/arch/arm/dom0less-build.c
>> @@ -15,6 +15,7 @@
>>   #include <asm/domain_build.h>
>>   #include <asm/static-memory.h>
>>   #include <asm/static-shmem.h>
>> +#include <asm/tee/tee.h>
>>     bool __init is_dom0less_mode(void)
>>   {
>> @@ -650,6 +651,10 @@ static int __init prepare_dtb_domU(struct domain *d=
, struct kernel_info *kinfo)
>>       if ( ret )
>>           goto err;
>>   +    /* We are making assumption that every mediator sets
>> d->arch.tee */
>> +    if ( d->arch.tee )
>
> I think the assumption is Ok. I would consider to move this check in
> each TEE callback. IOW call tee_make_dtb_node() unconditionally.
>

Ah, okay, makes sense.

>> +        tee_make_dtb_node(kinfo->fdt);
>
> AFAICT, tee_make_dtb_node() can return an error. So please check the
> return value.
>

Yes, you are right.

>> +
>>       /*
>>        * domain_handle_dtb_bootmodule has to be called before the rest o=
f
>>        * the device tree is generated because it depends on the value of
>> @@ -871,6 +876,7 @@ void __init create_domUs(void)
>>           unsigned int flags =3D 0U;
>>           uint32_t val;
>>           int rc;
>> +        const char *tee_name;
>>             if ( !dt_device_is_compatible(node, "xen,domain") )
>>               continue;
>> @@ -881,6 +887,19 @@ void __init create_domUs(void)
>>           if ( dt_find_property(node, "xen,static-mem", NULL) )
>>               flags |=3D CDF_staticmem;
>>   +        tee_name =3D dt_get_property(node, "xen,tee", NULL);
>
> In the previous version, you used dt_property_read_property_string()
> which contained some sanity check. Can you explain why you switch to
> dt_get_property()?

Because I was confused by dt_property_read_string() return values.

I made a fresh look at it and now I understand that I need to test for
-EINVAL to determine that a property is not available and I should use
a default value. All other return codes should cause panic. I'll rework
this in the next version.

--=20
WBR, Volodymyr=

