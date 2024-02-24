Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5A58626C9
	for <lists+xen-devel@lfdr.de>; Sat, 24 Feb 2024 19:31:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685111.1065464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdwmU-00048C-3C; Sat, 24 Feb 2024 18:29:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685111.1065464; Sat, 24 Feb 2024 18:29:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdwmU-00046B-00; Sat, 24 Feb 2024 18:29:50 +0000
Received: by outflank-mailman (input) for mailman id 685111;
 Sat, 24 Feb 2024 18:29:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y+9+=KB=epam.com=prvs=8784076af6=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1rdwmS-000465-AO
 for xen-devel@lists.xenproject.org; Sat, 24 Feb 2024 18:29:48 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad1f204d-d342-11ee-98f5-efadbce2ee36;
 Sat, 24 Feb 2024 19:29:44 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41O4Qn1V010989; Sat, 24 Feb 2024 18:29:38 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3wf9edh1nx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 24 Feb 2024 18:29:38 +0000 (GMT)
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by AM7PR03MB6213.eurprd03.prod.outlook.com (2603:10a6:20b:133::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.33; Sat, 24 Feb
 2024 18:29:33 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::82af:59a5:4446:9167]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::82af:59a5:4446:9167%4]) with mapi id 15.20.7316.031; Sat, 24 Feb 2024
 18:29:33 +0000
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
X-Inumbo-ID: ad1f204d-d342-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E9nkhVCNt/mo3BBKIs2B4gA8+51wEKwyiNfyJGmppjV6+hN4ySYUErzRF0ZVftRIkbygrhIlb4q87BzcHbjr/DbOpueIpAvlbz/W8kB8KpFJ4vxyKBioTMneTcufYsulSNpMQ1Q0MinjwHguBuK81d009kABoANIAOzkjbFbsa6Z14F3Ij77IlMJgTsCOs+HVNHPxTBxu2V9Ay6FfkyO7613HICi0CCOIVcOOz+UzC2KCnEAb20rqG3ttQ1XOrbhOxE0+3VRLTRKzoNQjAAHjbS/QPHsYwZbdYrFQtwMIvYJQljtkXwVK1vX6dUQYBUlyP/Eh3lQ0AV1AYYbbEA/aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRqDv77eX0nJWM6k/FgQqWszLWJKFqMdp3Sby4DuzZI=;
 b=BsfagtrVYNzNmygwbtiqWLDowpP28VG49XMdYmM/zjI8kMWtSj8V4sYc4QCX+gDDBNqYG9nmk10GAco6OLyslFWR6ZyYwefVIJB1XTh3c+2RuWw8q7FhxscnCiclZTTECYU5vDAmNS8oiktTX5m3KEIfWlA80RDwgHTXpDv0kq/G9evJ0ad+Cv9sJn8oQ1fDNj9JfWzrhVV2hR6Jyvu2o0Wrg7JFAUF8qzIrhXlrvFJQl4/ENusld6suSjfKI6ggX0yF4CEKwXvhcVsFfqYCINUIdUcWWWK42Z48boMwdT1VLApL1KTIKWPr+uqCdS21l4kFpctxfUgtE0gv1W+dcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRqDv77eX0nJWM6k/FgQqWszLWJKFqMdp3Sby4DuzZI=;
 b=aoUNlt1UM3thSudUOU6h2gRHabLe5Q661ybfWWBh+uuray/ur3/yRGWFNpCAzYkxX7Z142/ulfoP2zANatOYG+eb+Y+KjO2aWOcNMIE1xhQS36RSei+s6RirjepzrYLB+Td1mVB/zKmle3s+TIm8VSO3P8LNQ7ykJfAmV7aSIIrlYx20hkfXxU5lFDu63YjgkBtvfXDmYD2OOz9zP6rmvjq0Qj3tz8xUQ8R+vVSy1d4agprApHoMGUlx5g2hd6OGazUTSos2H5HMq9tXRq0WjgYbirx0wMMJoftvF8wv7aHvBxegDFeUKHkNxjd6aOuqJOE3eLhNHort1OXhy0PGIA==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Stefano Stabellini <stefano.stabellini@amd.com>,
        Peng Fan
	<peng.fan@nxp.com>
CC: Julien Grall <julien@xen.org>,
        "vikram.garhwal@amd.com"
	<vikram.garhwal@amd.com>,
        Leo Yan <leo.yan@linaro.org>, Viresh Kumar
	<viresh.kumar@linaro.org>,
        Stewart Hildebrand <stewart.hildebrand@amd.com>,
        "sgarzare@redhat.com" <sgarzare@redhat.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: question about virtio-vsock on xen
Thread-Topic: question about virtio-vsock on xen
Thread-Index: AdpmUSXKZvg8Aft6RRu9smUwoggtbwAUAHAAACuPlYA=
Date: Sat, 24 Feb 2024 18:29:32 +0000
Message-ID: <ee69684a-5aad-417a-8522-1cd1b5322bbe@epam.com>
References: 
 <DU0PR04MB941734DA793D87B7FF3A491488552@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <alpine.DEB.2.22.394.2402231332580.754277@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2402231332580.754277@ubuntu-linux-20-04-desktop>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR03MB6108:EE_|AM7PR03MB6213:EE_
x-ms-office365-filtering-correlation-id: 437c4e30-1d0e-4cb9-2b22-08dc35668be7
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qjoZd5/TfrsEGLs4nO/21NIOmZ3lxRMRs7E07pN4zP2591YR6G3HdtQyRQkR86jkzVFE3LDwOvef4uCNjjBnDeKb2Z+GtJV5wrNRYKuQSuTfK14fmMezvOY4sxBBVqsZMWgb5NHHKnm4HF3UnphPqhLpDipYzKhniWKuBPsVAKJ+qTlz7wwUZu0qTjOcFBa4kUCDwNH7TwLwjqs9NkLsig294sHiL/ACeMSedk8lVbBWB1AvpZK4hVAlfX0huou3oV+s15v9jLvSynYp2u2+rEPizim7ggMtRPNtCWemldOsO8qXTMrpVas13Xhh444x81P+CxfFLLLPtzWAgPdC3qiNnUiiuxJuVJBHpnQqrczagJQCp9EnbBzrxmKGCBnAYK8BCsbBSdxcByWOrboqrLYCpWq2OCSZvsOU2qmgR4V92M/80sj4d93J824q2rHINsLnEgyknPyvbvztq1jKDvb1g9T4xw+GUlp/auQp5jjMeCvhkFuT/KtEv55jbmC59fc9Ui1BBHaoHtzHyipkDl5DSETfSHFvLl/vYRJB+mG1XLbsslX4NjUwHNw6DaHqWimc1qK0xMM2QvH1Rqzw+sCjngOqZG54btfz+98bWEg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NzAvNXhDVTIzNlRyQk1xZk5va3BrbnlYUXpJbDBYZUNaRktnUVRoVGEzWFp6?=
 =?utf-8?B?Zkw4YllUOFlFMlRYVGJUbkpFOExNOG1OQ0xiUU1tYnJaWlRrU0JOSExSemZt?=
 =?utf-8?B?Q0FnNzhjbHE4OE1HSGxFYUcwbkl3SWRtV0JUZVFRWHBLVTlNbkJYNlZOcDYz?=
 =?utf-8?B?eVJwQWo5YjF3OVZReWgxVUo5dVVtWDNlbmM2UVlBaER3eVkxL2JPM0FOQkpR?=
 =?utf-8?B?eWdPUW13cVZ2RS9oTnIvKzlsVTdFc1dabnpncHNjR3I2WFZVcmhHajI3ZzRU?=
 =?utf-8?B?SzBNeUpIZ0s5REFObHByQ21ZU0pIUUE4clFIL1RqeWhJekJwcVphK1pRTTVa?=
 =?utf-8?B?dEUxc3ppbGloOGxNeERqb2JQV3l3blphcmtJamVzVGdLZ05KK3hqa2dFdTZ1?=
 =?utf-8?B?NEFXWXFCY2F5OXkyaDNJVFBCQ0w0NUdqUWhsQ05XNEdKZ0tETnJDWTRFQUNJ?=
 =?utf-8?B?TjFqUVk1dWkxQXpkaWkvQitLN3ZVQWd4V2VxN3JwTkI0L0VkUis5M1dFTGE2?=
 =?utf-8?B?SzhZTTkwMm54RlNadVNXaHRVWXdlcnRZb3djOG9MUXkwcjBOenNsUG5vVmls?=
 =?utf-8?B?UHlMMi9BUk9sRTR5R0ZKeDZiZVl3RWpLSDRYN1BIamJRU00vN3VKMkc2UU1H?=
 =?utf-8?B?QmhMY2dRN21va1lKQThJT1FubzlTYWNpTFBhcll2bUpEVGNPd2RrbkxQTTN2?=
 =?utf-8?B?YXhaT3FaenZkLzBXNUUrUXBBdjYzM0FvSE1HYTNRVTdxTHRvblNtMzZMSHlX?=
 =?utf-8?B?MFRhQTIvY0Jsc0V4MWJwdGNTRi84MTR0NUwwLzFEQmJRajI5N1hBZnd4VFN2?=
 =?utf-8?B?UHBiMUlPeVpNc29XVXg3a05uSTNYVERmS09lY2t2Ui9ReUVCbXNlUGI2aTJ5?=
 =?utf-8?B?eVFJR3FFVDhzTE1tRytpZm9LLzA0RG5mUGVtM3lzcGRCeDNTZEpaUmIvU0M0?=
 =?utf-8?B?cXgxaWx6VUJvdTVqd2Erc1UyWmNMRjI1WitnUlFZa3ZKUXJuMEV6eWZCWjhk?=
 =?utf-8?B?WFZlc2trOEZFVGU2RjkyNmpXbmI4bWhlRmIrUVpSc2p4dHhTbTNVUkRQQUcr?=
 =?utf-8?B?Q2lNWjR3ZGtpMW12YUYrU2wxWTFEYnlNRWxieEFoS2dNdERMM09sT2JUU0RN?=
 =?utf-8?B?YWRyaDBvejk4cmRhbTFwRVRRYzkrZkw3aVlYZ2pMMDBQVWxzMENFN2VNQlAr?=
 =?utf-8?B?b2xaWDEyNTUvZWYxNnBWVFBzTzVQZ3dpRG1GeEpQUU1JQWhOdkQ2REhXS2hx?=
 =?utf-8?B?TlhnQlB6QiswOTF5QmhQamIvWmRuV3pPSGltaGdmMmZtdXI3RlBiVVlGdUNI?=
 =?utf-8?B?azduSkhhRVhKdW9VNmxmL2hSdlgwZXJQZUZWRUpEcmM5U0JsSythRjNDMEdo?=
 =?utf-8?B?bUVYRkszVm51eXlEYnQwbkpuL0Q0Z21ac3NNdlg3RHpvcm9XR0F4V2l4T3R5?=
 =?utf-8?B?aDVreDMxS1FsS0lFUHkyU3ZXSnlZRGV4a2FTRFZuellhRXBnZ3lzRHk1SXM1?=
 =?utf-8?B?U3hkamJHaWx6V3BkVlFHOHBDOTBCR2k2amp1S05hMnpmdGtvR2hpNWgrVGZ6?=
 =?utf-8?B?eWFJUHdwY3hKV2FHTmx6TllhN25FVFV2V0tnSzlYVUp5TEdZZGgrWEMyYmxa?=
 =?utf-8?B?aENrcy9iWWliVTNxNmpMQ24yYzd6QlFGUDRYNUtVWlMxM29GVXFaa3ZmbzRW?=
 =?utf-8?B?MVdraURBZW5sRkx2NmtnTzF4V0Z4L2JLSktFQ3ZkVDJMT1Zta0Rhc1ZhL21O?=
 =?utf-8?B?dFk2ODYvZGMzTmV4L1FvOW9uWm9QWlFpMFcyZjl0NFlmVWV6SGVJNU5WZ1Nz?=
 =?utf-8?B?V0pwVjE5SkhWbVBTeUNQOWV6dzM3bEwrbE01QTdFamN5dkxIV3d3cVpIU1Yx?=
 =?utf-8?B?TlpicnVDWmY1WXdSVERtU1QvV0xMazMrOUppNkNoREtFM08zSTdQeEtVV2U5?=
 =?utf-8?B?Ukg3cnFUQjhwLzNETDZlTzdxVVdWVXNYRGp2MlhRZkVrZVJJWittTzRka2t6?=
 =?utf-8?B?N2I1NWY4cHFmK3dwK1dJaWU5RVZEV1FjaUJnV0djRDg2THcwSHlZcjZwTkF4?=
 =?utf-8?B?OXJNai9LZUhRYjZCRTd0dmxrNElvSy9qWGUxcG94VjdxMnZPcHdpOXJnYzVu?=
 =?utf-8?B?eC9pUXI5UytnQzRNVkl4TDlNM2ZUVjJ5YkhOZExqU2lQMHB1Yzllc3lUSWJp?=
 =?utf-8?Q?p6jgiS0AZuSD5Ff7/07wyBA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5704C126A50E5843859A76BC896C5010@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 437c4e30-1d0e-4cb9-2b22-08dc35668be7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2024 18:29:32.9821
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z07OaLiuzJu85eQNbr7+rcRbwgb8V3pf+OPxB3KWnO7l36k+Jn5QnUac74tvvIZg9BLC6/3WpiPq0jN+D8ePvP+EYQSiG1pohEGrD4Xi730=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6213
X-Proofpoint-GUID: kPyHaw7B8u5j66o8FAhKxxrKOYoKvH2X
X-Proofpoint-ORIG-GUID: kPyHaw7B8u5j66o8FAhKxxrKOYoKvH2X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-24_13,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1011 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402240155

DQoNCk9uIDIzLjAyLjI0IDIzOjQyLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+IEhpIFBl
bmcsDQoNCkhlbGxvIFBlbmcsIFN0ZWZhbm8NCg0KDQo+IA0KPiBXZSBoYXZlbid0IHRyaWVkIHRv
IHNldHVwIHZpcnRpby12c29jayB5ZXQuDQo+IA0KPiBJbiBnZW5lcmFsLCBJIGFtIHZlcnkgc3Vw
cG9ydGl2ZSBvZiB1c2luZyBRRU1VIGZvciB2aXJ0aW8gYmFja2VuZHMuIFdlDQo+IHVzZSBRRU1V
IHRvIHByb3ZpZGUgdmlydGlvLW5ldCwgdmlydGlvLWJsb2NrLCB2aXJ0aW8tY29uc29sZSBhbmQg
bW9yZS4NCj4gDQo+IEhvd2V2ZXIsIHR5cGljYWxseSB2aXJ0aW8tdnNvY2sgY29tZXMgaW50byBw
bGF5IGZvciBWTS10by1WTQ0KPiBjb21tdW5pY2F0aW9uLCB3aGljaCBpcyBkaWZmZXJlbnQuIEdv
aW5nIHZpYSBRRU1VIGluIERvbTAganVzdCB0byBoYXZlIDENCj4gVk0gY29tbXVuaWNhdGUgd2l0
aCBhbm90aGVyIFZNIGlzIG5vdCBhbiBpZGVhbCBkZXNpZ246IGl0IGFkZHMgbGF0ZW5jeQ0KPiBh
bmQgdXNlcyByZXNvdXJjZXMgaW4gRG9tMCB3aGVuIGFjdHVhbGx5IHdlIGNvdWxkIGRvIHdpdGhv
dXQgaXQuDQo+IA0KPiBBIGJldHRlciBtb2RlbCBmb3IgVk0tdG8tVk0gY29tbXVuaWNhdGlvbiB3
b3VsZCBiZSB0byBoYXZlIHRoZSBWTSB0YWxrDQo+IHRvIGVhY2ggb3RoZXIgZGlyZWN0bHkgdmlh
IGdyYW50IHRhYmxlIG9yIHByZS1zaGFyZWQgbWVtb3J5IChzZWUgdGhlDQo+IHN0YXRpYyBzaGFy
ZWQgbWVtb3J5IGZlYXR1cmUpIG9yIHZpYSBYZW4gaHlwZXJjYWxscyAoc2VlIEFyZ28uKQ0KPiAN
Cj4gRm9yIGEgZ29vZCBYZW4gZGVzaWduLCBJIHRoaW5rIHRoZSB2aXJ0aW8tdnNvY2sgYmFja2Vu
ZCB3b3VsZCBuZWVkIHRvIGJlDQo+IGluIFhlbiBpdHNlbGYgKHRoZSBoeXBlcnZpc29yKS4NCj4g
DQo+IE9mIGNvdXJzZSB0aGF0IGlzIG1vcmUgd29yayBhbmQgaXQgZG9lc24ndCBoZWxwIHlvdSB3
aXRoIHRoZSBzcGVjaWZpYw0KPiBxdWVzdGlvbiB5b3UgaGFkIGJlbG93IDotKQ0KPiANCj4gRm9y
IHRoYXQsIEkgZG9uJ3QgaGF2ZSBhIHBvaW50ZXIgdG8gaGVscCB5b3UgYnV0IG1heWJlIG90aGVy
cyBpbiBDQw0KPiBoYXZlLg0KDQoNClllcywgSSB3aWxsIHRyeSB0byBwcm92aWRlIHNvbWUgaW5m
byAuLi4NCg0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBTdGVmYW5vDQo+IA0KPiANCj4gT24gRnJp
LCAyMyBGZWIgMjAyNCwgUGVuZyBGYW4gd3JvdGU6DQo+PiBIaSBBbGwsDQo+Pg0KPj4gSGFzIGFu
eW9uZSBtYWtlIHZpcnRpby12c29jayBvbiB4ZW4gd29yaz8gTXkgZG0gYXJncyBhcyBiZWxvdzoN
Cj4+DQo+PiB2aXJ0aW8gPSBbDQo+PiAnYmFja2VuZD0wLHR5cGU9dmlydGlvLGRldmljZSx0cmFu
c3BvcnQ9cGNpLGJkZj0wNTowMC4wLGJhY2tlbmRfdHlwZT1xZW11LGdyYW50X3VzYWdlPXRydWUn
DQo+PiBdDQo+PiBkZXZpY2VfbW9kZWxfYXJncyA9IFsNCj4+ICctRCcsICcvaG9tZS9yb290L3Fl
bXVfbG9nLnR4dCcsDQo+PiAnLWQnLCAndHJhY2U6KnZzb2NrKix0cmFjZToqdmhvc3QqLHRyYWNl
Oip2aXJ0aW8qLHRyYWNlOipwY2lfdXBkYXRlKix0cmFjZToqcGNpX3JvdXRlKix0cmFjZToqaGFu
ZGxlX2lvcmVxKix0cmFjZToqeGVuKicsDQo+PiAnLWRldmljZScsICd2aG9zdC12c29jay1wY2ks
aW9tbXVfcGxhdGZvcm09ZmFsc2UsaWQ9dmhvc3QtdnNvY2stcGNpMCxidXM9cGNpZS4wLGFkZHI9
NS4wLGd1ZXN0LWNpZD0zJ10NCj4+DQo+PiBEdXJpbmcgbXkgdGVzdCwgaXQgYWx3YXlzIHJldHVy
biBmYWlsdXJlIGluIGRvbTAga2VybmVsIGluIGJlbG93IGNvZGU6DQo+Pg0KPj4gdmhvc3RfdHJh
bnNwb3J0X2RvX3NlbmRfcGt0IHsNCj4+IC4uLg0KPj4gICAgICAgICAgICAgICAgIG5ieXRlcyA9
IGNvcHlfdG9faXRlcihoZHIsIHNpemVvZigqaGRyKSwgJmlvdl9pdGVyKTsNCj4+ICAgICAgICAg
ICAgICAgICAgaWYgKG5ieXRlcyAhPSBzaXplb2YoKmhkcikpIHsNCj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgICB2cV9lcnIodnEsICJGYXVsdGVkIG9uIGNvcHlpbmcgcGt0IGhkciAleCAleCAl
eCAlcHhcbiIsIG5ieXRlcywgc2l6ZW9mKCpoZHIpLA0KPj4gX19idWlsdGluX29iamVjdF9zaXpl
KGhkciwgMCksICZpb3ZfaXRlcik7DQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAga2ZyZWVf
c2tiKHNrYik7DQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+PiAgICAgICAg
ICAgICAgICAgIH0NCj4+IH0NCj4+DQo+PiBJIGNoZWNrZWQgY29weV90b19pdGVyLCBpdCBpcyBj
b3B5IGRhdGEgdG8gX191c2VyIGFkZHIsIGJ1dCBpdCBuZXZlciBwYXNzLA0KPj4gdGhlIGNvcHkg
dG8gX191c2VyIGFkZHIgYWx3YXlzIHJldHVybiAwIGJ5dGVzIGNvcGllZC4NCj4+DQo+PiBUaGUg
YXNtIGNvZGUgInN0dHIgeDcsIFt4Nl0iIHdpbGwgdHJpZ2dlciBkYXRhIGFib3J0LCB0aGUga2Vy
bmVsIHdpbGwgcnVuDQo+PiBpbnRvIGRvX3BhZ2VfZmF1bHQsIGJ1dCBsb2NrX21tX2FuZF9maW5k
X3ZtYSByZXBvcnQgaXQgaXMgVk1fRkFVTFRfQkFETUFQLA0KPj4gdGhhdCBtZWFucyB0aGUgX191
c2VyIGFkZHIgaXMgbm90IG1hcHBlZCwgbm8gdm1hIGhhcyB0aGlzIGFkZHIuDQo+Pg0KPj4gSSBh
bSBub3Qgc3VyZSB3aGF0IG1heSBjYXVzZSB0aGlzLiBBcHByZWNpYXRlIGlmIGFueSBjb21tZW50
cy4NCg0KDQogICAuLi4gUGVuZywgd2UgaGF2ZSB2aG9zdC12c29jayAoYW5kIHZob3N0LW5ldCkg
WGVuIFBvQy4gQWx0aG91Z2ggaXQgaXMgDQpub24tdXBzdHJlYW1hYmxlIGluIGl0cyBjdXJyZW50
IHNoYXBlIChiYXNlZCBvbiBvbGQgTGludXggdmVyc2lvbiwgDQpyZXF1aXJlcyBzb21lIHJld29y
ayBhbmQgcHJvcGVyIGludGVncmF0aW9uLCBtb3N0IGxpa2VseSByZXF1aXJlcyANCmludm9sdmlu
ZyBRZW11IGFuZCBwcm90b2NvbCBjaGFuZ2VzIHRvIHBhc3MgYW4gYWRkaXRpb25hbCBpbmZvIHRv
IA0Kdmhvc3QpLCBpdCB3b3JrcyB3aXRoIExpbnV4IHY1LjEwICsgcGF0Y2hlZCBRZW11IHY3LjAs
IHNvIHlvdSBjYW4gcmVmZXIgDQp0byB0aGUgWW9jdG8gbWV0YSBsYXllciB3aGljaCBjb250YWlu
cyBrZXJuZWwgcGF0Y2hlcyBmb3IgdGhlIGRldGFpbHMgWzFdLg0KDQpJbiBhIG51dHNoZWxsLCBi
ZWZvcmUgYWNjZXNzaW5nIHRoZSBndWVzdCBkYXRhIHRoZSBob3N0IG1vZHVsZSBuZWVkcyB0byAN
Cm1hcCBkZXNjcmlwdG9ycyBpbiB2aXJ0aW8gcmluZ3Mgd2hpY2ggY29udGFpbiBlaXRoZXIgZ3Vl
c3QgZ3JhbnQgYmFzZWQgDQpETUEgYWRkcmVzc2VzIChieSB1c2luZyBYZW4gZ3JhbnQgbWFwcGlu
Z3MpIG9yIGd1ZXN0IHBzZXVkby1waHlzaWNhbCANCmFkZHJlc3NlcyAoYnkgdXNpbmcgWGVuIGZv
cmVpZ24gbWFwcGluZ3MpLiBBZnRlciBhY2Nlc3NpbmcgdGhlIGd1ZXN0IA0KZGF0YSB0aGUgaG9z
dCBtb2R1bGUgbmVlZHMgdG8gdW5tYXAgdGhlbS4NCg0KQWxzbyBub3RlLCBpbiB0aGF0IFBvQyB0
aGUgdGFyZ2V0IG1hcHBpbmcgc2NoZW1lIGlzIGNvbnRyb2xsZWQgdmlhIA0KbW9kdWxlIHBhcmFt
IGFuZCBndWVzdCBkb21haW4gaWQgaXMgcmV0cmlldmVkIGZyb20gdGhlIGRldmljZS1tb2RlbCAN
CnNwZWNpZmljIHBhcnQgaW4gdGhlIFhlbnN0b3JlIChzbyBRZW11L3Byb3RvY29sIGFyZSB1bm1v
ZGlmaWVkKS4gQnV0IHlvdSANCm1pZ2h0IHdhbnQgdG8gbG9vayBhdCBbMl0gYXMgYW4gZXhhbXBs
ZSBvZiB2aG9zdC11c2VyIHByb3RvY29sIGNoYW5nZXMgDQpob3cgdG8gcGFzcyB0aGF0IGFkZGl0
aW9uYWwgaW5mby4NCg0KSG9wZSB0aGF0IGhlbHBzLg0KDQpbMV0gaHR0cHM6Ly9naXRodWIuY29t
L3hlbi10cm9vcHMvbWV0YS14dC12aG9zdC9jb21taXRzL21haW4vDQpbMl0gaHR0cHM6Ly93d3cu
bWFpbC1hcmNoaXZlLmNvbS9xZW11LWRldmVsQG5vbmdudS5vcmcvbXNnOTQ4MzI3Lmh0bWwNCg0K
UC5TLiBNYXkgYW5zd2VyIHdpdGggYSBkZWxheS4NCg0KDQo+Pg0KPj4gQlRXOiBJIHRlc3RlZCBi
bGsgcGNpLCBpdCB3b3Jrcywgc28gdGhlIHZpcnRpbyBwY2kgc2hvdWxkIHdvcmsgb24gbXkgc2V0
dXAuDQo+Pg0KPj4gVGhhbmtzLA0KPj4gUGVuZy4NCj4+

