Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2095FFB19
	for <lists+xen-devel@lfdr.de>; Sat, 15 Oct 2022 17:48:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.423503.670203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojjNw-000657-Ru; Sat, 15 Oct 2022 15:47:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 423503.670203; Sat, 15 Oct 2022 15:47:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojjNw-00062c-PA; Sat, 15 Oct 2022 15:47:36 +0000
Received: by outflank-mailman (input) for mailman id 423503;
 Sat, 15 Oct 2022 15:47:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=caCr=2Q=epam.com=prvs=2287b79f1b=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1ojjNv-00062W-2J
 for xen-devel@lists.xenproject.org; Sat, 15 Oct 2022 15:47:35 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id adf37e3e-4ca0-11ed-8fd0-01056ac49cbb;
 Sat, 15 Oct 2022 17:47:32 +0200 (CEST)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29F3pSvt002897;
 Sat, 15 Oct 2022 15:47:21 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3k7mvn10s3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Oct 2022 15:47:20 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by AM9PR03MB6755.eurprd03.prod.outlook.com (2603:10a6:20b:2de::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Sat, 15 Oct
 2022 15:47:17 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::93be:22b1:654c:e4bc]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::93be:22b1:654c:e4bc%5]) with mapi id 15.20.5723.029; Sat, 15 Oct 2022
 15:47:17 +0000
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
X-Inumbo-ID: adf37e3e-4ca0-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRgdl1AsuhpOBx5tEj48z6ac3AgXDpHfE32aecnDqqFcND3nvd5j8QiTqhxhYz4V4ovDSHwVTwys+aALbP2IlrZIM9jvE+dzub8qCPEPDA/ioKLTYNH/Y6tTU2Ss0l2yK+ba8jzyBSLL1A9bKbsAjLjuOY+WBmPGkZBT8cZgU1fbi/TMJAYwMNFQly9h1NoizIZjJC7IBTuYx2MdKT+FFPSzIERiHrUl8FCS+ak2Uv7EK2mJcfh1NBb+/2rs6Ah18r5vFvEDPUfJi9c4cPj17xvB+mUl78aRCBAMPnlR0uHVPq5iM99D0LmBCWT36+qTBjuINCnATEhHcjPzZEgIDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/IiSCY8nMZpbHYji191Mgg8/7QXWRdgVHdRmWENPns=;
 b=eIG2WqrwjH9Nzst4cyh127VVw+FVhCNnyNTETWOX5tQ+8ieti0VuaDRAYCitMBtFhklfMkBGN1VETxx8XlZSk+Wex6Q8PNXX4wmoXtn4SmLJXncF2QFo0W8SXn5k3x/jRFCkoRUNZ0SbrMryrPRxESmM9+NgO9U0xQ9Jf50CAV09ztFtEIDlVj3XH6yWqba7KSHk0HKiRHmN3ZSTYGKgSDCwS/Sct/kbx4LYYtVJsIuWoi5HzP8BxboXvuc1hhSsEMhp6+pVWX0wKZ67//TkKOWTt2ROs32ZiTJ6K9B3jON8S1vRfVQvGO+5tiLl1Xa3pI1PtwiMEb89jyJslsaQXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/IiSCY8nMZpbHYji191Mgg8/7QXWRdgVHdRmWENPns=;
 b=QQl3RtQHKjOuDSNB5OLPK9qcNrhFQrmmhFIWIV0lszzkxoRQtvoCtOEwE5icMlRt7Pd5m4hC8ZH6kJEHqZ02Qljaz7tfKteFM5wOogkvzJAaZZ4L08fSB0Jld1w4VRgiaECz05KnmevNghU+axJssRTS4wBFmH/nlrTyohU63lEOcHe6pxqwuftcUo2QLWcSt6BGLMkIWHM7JAcoBbLrj8Ddn3XhXvrpBju+e2PDCavZceZX+Bt7cwnfWeo/yG9Ivx/J9BN3MOqO2INmxxLqWAGDbAgDng/7bP5v/pPye4a44DSK6UxnKj+6ZhM1EmoqeRxKMxhkHJhqDgSyqIQfUw==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksandr Tyshchenko <olekstysh@gmail.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Juergen Gross
	<jgross@suse.com>
Subject: Re: [PATCH] xen/virtio: Handle PCI devices which Host controller is
 described in DT
Thread-Topic: [PATCH] xen/virtio: Handle PCI devices which Host controller is
 described in DT
Thread-Index: AQHY2avbTqg8YKTBpUCScd7xSfM5Yq4CIOiAgAkdnYCAAET3gIAEI/OA
Date: Sat, 15 Oct 2022 15:47:16 +0000
Message-ID: <16485bc9-0e2a-788a-93b8-453cc9ef0d3c@epam.com>
References: <20221006174804.2003029-1-olekstysh@gmail.com>
 <alpine.DEB.2.22.394.2210061747590.3690179@ubuntu-linux-20-04-desktop>
 <f98f9f44-20e9-af8d-8970-9f6241c8dc44@epam.com>
 <alpine.DEB.2.22.394.2210121733240.3690179@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2210121733240.3690179@ubuntu-linux-20-04-desktop>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR03MB6108:EE_|AM9PR03MB6755:EE_
x-ms-office365-filtering-correlation-id: 40d02e63-0fb6-40a4-63b7-08daaec48980
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 FPgMLQUEW5zdVvAjxfSd6oXRCgFMzYgc05CDJbcclc06u9nkfrxaf/C8v9t9NO81/ctQPDsnGhz/8wXdNJehsWASS4IK3xTkR5JjW9+julSxrR9xDQj/pT9zDPdvXeV8pXN7Ib34IXnl91RaDZmsM9ODLJ9bIW4yUeuJ4qDOu3Vtao+QfdSxsNqr4mbCdO2yFTdoKfxLja7cemihmJktNgGjPl9HH82NsVOKNLhpHFefkbHSS1FsO5Cz34BoywjXIWn9C8uFVifMU0iQnskaDzmR9c9pui8+WVChs16vaVzbgkabVK38VTECwtD0CL57X3xi6nUS34qwhdws1vMHHozq9k8OUxlaolKXbuuOYuoRY2KjsB2YncA6Zy8Km5YLCXQUccPoEjy9ZuXqJ6ZVjklASiNxAah18D9U2xSw6RGZELeTE4QDefqMWO5QCAGtiYUHl7JXJp5TgucDKcCVbosgzM4DAzXJcSuvzZPiMdYQdP6m9LXH20JMG3aX8BB/5b5dOQV6xsM8LLl9DtVne1MGWNy8SRDTcvDhr88Bfg4f9UdQ8pTYHmEPtijmg0trS/f9PDgxZfeSQuRhwyxsFy/aJAb++Nu8/zLkJ2a/psJ9diAL1KOH/C8OWhK4LDXyfPkrze2g+pUpI/bz1aB6woaTOgsiey1p0vsgW9pPqpLdQIEcUvMI2MWG5FELrzcW2YHlEBRCytQfUYZPDZqQjnXIiGAH400hV4AEBUF+x1p6eQ0r/qqllXuZOBll7+OymMN5Ar8afa1I6w8ZBjpVC0RBwNZ05f5FuVVIlDlQa0k2zuemPW/xM/sOQPbvTVOp
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(451199015)(66946007)(66899015)(478600001)(71200400001)(122000001)(966005)(38070700005)(6486002)(38100700002)(86362001)(83380400001)(66446008)(54906003)(31696002)(4326008)(76116006)(66476007)(6506007)(30864003)(36756003)(64756008)(6916009)(53546011)(55236004)(26005)(66556008)(316002)(8676002)(186003)(41300700001)(31686004)(91956017)(6512007)(2616005)(2906002)(5660300002)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QU0zbDBGQlVMTnBSRWxKNjY4UThnNFZiRGZmbXg0Z1FYY3lHaW9obUJFUm5V?=
 =?utf-8?B?T2lrVTFHRHhRTS9xVWpMZFZtU3ZwbGVyWGEzbW03bzFLV25RVHZvV1FLN3pH?=
 =?utf-8?B?QXJaL1h3QnJ4eGJUWXE2TUtEc1lEWFRNb1N4bVNxWGpLT0k2SDBCK3BOL2Z6?=
 =?utf-8?B?WU5oSFFOK0NXMGY1VTZNVG5ZbTc5TkpybzcvTGo1NDA1S3cwaldQZjllQUpQ?=
 =?utf-8?B?N2U2cEExQUZIa0xRbmxSVDRZN2FvcHlCcTR3K003amJXY1dKNmc1Wm4yNCsz?=
 =?utf-8?B?WDg1cWVIRVE1YUlJSUFzSXRIYk1Pd3NDTk8rME1qd1BMaUV0VHMyeFNUVmh5?=
 =?utf-8?B?cDEzKzk2OERFeHJncDlBeVVGaGV2eWphS1NxTXRrZlpLZjRUMU9oSzJRbllm?=
 =?utf-8?B?aGtKWUd3ZUFJMWVhL1I4TlkzdnpsMGdjSWFNS1liMVVxYUdEZHY2UWt3TWh5?=
 =?utf-8?B?eFNBRDVZYXRoV09MWDRNSjMwckY0R1drRGJuc3AxZVhDbW1ZZnpZWFpmSjRK?=
 =?utf-8?B?YjQ0Q3laNC9WemoxOGdqV1F0RFdqdENvdWFKUDVKYmxxUlhWWDIxUGNOeDJl?=
 =?utf-8?B?T3FCQWNOMmNacGZyNFR2Nk1UN3haNFIxUkFXLzVGdm5pdmVSTFRHS1pISTFw?=
 =?utf-8?B?M3hKd1ZBdUhoVzRYSUVOSHY1YjROMG11eVlPSkMvOEIxcDJiSFRUc3J6M0Rv?=
 =?utf-8?B?ODEyTnBjc1FrUEtxYnZZT2ZTR1FEM3dYdDRHUEJJa0ZLNzVQbElkTE5veVBR?=
 =?utf-8?B?TXlkZ28vYytZdUh4SklCSDdxb0JLUklaYkF4MTlYV3FGUmZrRStnaExFVGRY?=
 =?utf-8?B?UFdTMTRMbE50L3o0VkxUbEJUQmxORmVXeDRRcjY2SjlpVFdid3M2bUlaTzcw?=
 =?utf-8?B?clJnN083TkNkNzFrWGd3anEvdWhxejZ6MTlhYVI5azI3bzNsOTFQMG03TXBu?=
 =?utf-8?B?eXFGZUg0N0tSNzk0RjUwZ25VajJOK3JjV2NFRm5Fa0FtUE8yWHBqajZqMHFo?=
 =?utf-8?B?L3FSeGpJSUFpTHgxbVh6dE1sMlFyTEpjYmxWUTJKZ0ZZY0ZrYW14VnJLQVp4?=
 =?utf-8?B?NXFOdzdnQU5uM2VuYnJDZ2hMeDQwZDcvZWw4STdlWEcwQ1pKREJiWGZtOE0r?=
 =?utf-8?B?U3FGeVJ1b1p0UFpMVk1Zb1Rnc3ByRzRNSytGRkhXbzBLR05MSXpCYWVqKysy?=
 =?utf-8?B?dUg0QmNYSWV6aExNUi90aHVOL0R4VjJpenJoNmgrTUhiL3J2cUNndkYxSWZM?=
 =?utf-8?B?UitvQlN5YWU0MENLTDJVWGRuNCtMZm0xUmhEYXA3UUQvMlFUckZUKzBSTlRT?=
 =?utf-8?B?RWtHdEF2VTNiMnkvM1UrL0NFQmU5SDFJOFBqbzMvM3R3RFprZ0ExVFBENlEw?=
 =?utf-8?B?UVFPMEFrMGdtODR1eWtac0k3N000cWxwMWpqSU8xSExNeWdaNG9FUkszakk3?=
 =?utf-8?B?TEpRTHBWd1NVNnI2S0xPblpvSm1NRmtKaGRTNUQ0Sm8rTjlhM3lpbUx3UUY0?=
 =?utf-8?B?YUt0Y1RCNG9qZUpPS2ZpbFJnUTUrM05hZU9pSlZJdlplVVcwZFRSL0JSL3Zs?=
 =?utf-8?B?VXprT3FxSWpCc1c1V2RzOTN5akJxMjZDOE9Wa056Ty9XRFJ0c1IyVmhSVXUw?=
 =?utf-8?B?SEhJcFhQQUplcnRpTFhEWkRiWjRGMFNINWVHaTZPcngxczJoTU9lUW1wNk4y?=
 =?utf-8?B?Z0JVOFBrNUZCYkx3NW9aN01yU0Z4YmtiaUFlT1FuZFlCdEpBOFZGNVVMb3Ey?=
 =?utf-8?B?aFlQODBaUy93YWV3ZW5UUGg3VW43dGdtWmFKcEtxTklRcDRtWUE3amxCSWlC?=
 =?utf-8?B?bVFuUDFWRHRzdEs4MmRLUzRKNG5zNEU5aEN5NWpBYVVLMUpzMVFWUyt1MnB0?=
 =?utf-8?B?NG4rSkFrTStQTXNkczlYbUZvTGlGZWYyNnBjMVJUZEhsWVZBazV1Qmp4cWhL?=
 =?utf-8?B?RGZhL0JzVFlnRXl3akxSVUs4RWxPZ05NNWtDRkFSbmk0U3RvbFIzTVZqcjhj?=
 =?utf-8?B?aHlmeStOSE9rdlpoNlU5TFBkYVhIYjU2NjVXbmpjWFdBVmtCcm9Rb0dBUUtO?=
 =?utf-8?B?N0ZCTFpFRVRwaG1JV0gyNjZOK0k5UGNGOXFyU3pjUnd4YzlzYURMV0FsRVNt?=
 =?utf-8?B?YnZrQ2hyL2h6V08xSW43UTlFY09NK3JKdkpXZGxIeUROREN5UnV5cDZqV3Bq?=
 =?utf-8?Q?Eq4CtSUbQcO9EU8h7jOi30g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <938C44169C049B4987801F0F46BBA412@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d02e63-0fb6-40a4-63b7-08daaec48980
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2022 15:47:16.9906
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IVszAMB7xtQPMqUw7HeoD7SUYGCKF8cybF3UoUgT6o650VAis57Q4tQi67xtemjjRBki1dAPW1fiWBCTw7TBx7DO2kOC+rEzFaK9O77te0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6755
X-Proofpoint-GUID: D6Kn1JwypycZJrk4_fgrpBnLpzyn0ntf
X-Proofpoint-ORIG-GUID: D6Kn1JwypycZJrk4_fgrpBnLpzyn0ntf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-15_10,2022-10-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210150094

DQpPbiAxMy4xMC4yMiAwMzozMywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KDQpIZWxsbyBT
dGVmYW5vDQoNCj4gT24gV2VkLCAxMiBPY3QgMjAyMiwgT2xla3NhbmRyIFR5c2hjaGVua28gd3Jv
dGU6DQo+Pj4gT24gVGh1LCA2IE9jdCAyMDIyLCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3cm90ZToN
Cj4+Pj4gRnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVw
YW0uY29tPg0KPj4+Pg0KPj4+PiBVc2UgdGhlIHNhbWUgInhlbi1ncmFudC1kbWEiIGRldmljZSBj
b25jZXB0IChiYXNlZCBvbiBnZW5lcmljIElPTU1VDQo+Pj4+IGRldmljZS10cmVlIGJpbmRpbmdz
KSBmb3IgdGhlIFBDSSBkZXZpY2VzIGJlaGluZCBkZXZpY2UtdHJlZSBiYXNlZA0KPj4+PiBQQ0kg
SG9zdCBjb250cm9sbGVyLg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgVHlz
aGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+DQo+Pj4+IC0tLQ0KPj4+PiBT
bGlnaHRseSBSRkMuIFRoaXMgaXMgbmVlZGVkIHRvIHN1cHBvcnQgWGVuIGdyYW50IG1hcHBpbmdz
IGZvciB2aXJ0aW8tcGNpIGRldmljZXMNCj4+Pj4gb24gQXJtIGF0IHNvbWUgcG9pbnQgaW4gdGhl
IGZ1dHVyZS4gVGhlIFhlbiB0b29sc3RhY2sgc2lkZSBpcyBub3QgcHVibGlzaGVkIHlldC4NCj4+
Pj4gSGVyZSwgZm9yIFBDSSBkZXZpY2VzIHdlIHVzZSB0aGUgc2FtZSB3YXkgdG8gcGFzcyBiYWNr
ZW5kIGRvbWlkIHRvIHRoZSBndWVzdCBhcyBmb3INCj4+Pj4gcGxhdGZvcm0gZGV2aWNlcy4NCj4+
Pj4NCj4+Pj4gRGVwZW5kcyBvbiBKdWVyZ2VuJ3Mgc2VyaWVzOg0KPj4+PiBodHRwczovL3VybGRl
ZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcveGVuLWRldmVsLzIwMjIxMDA2
MDcxNTAwLjE1Njg5LTEtamdyb3NzQHN1c2UuY29tL19fOyEhR0ZfMjlkYmNRSVVCUEEhd2FPazJH
b2M3cWxoTm81LWNzUk9icnlpbF9Hek1GX2U2MUVKUjUwMW9KMDhjSDJkbkp1bHNaWFdsZWxCRFRC
cWE2M1RWb1VjV1FUQjVOZWNKMXA0eEZOZ2gyX0V1QSQgIFtsb3JlWy5da2VybmVsWy5db3JnXQ0K
Pj4+PiAtLS0NCj4+Pj4gICAgZHJpdmVycy94ZW4vZ3JhbnQtZG1hLW9wcy5jIHwgNTEgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQ0KPj4+PiAgICAxIGZpbGUgY2hhbmdlZCwg
NDEgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3hlbi9ncmFudC1kbWEtb3BzLmMgYi9kcml2ZXJzL3hlbi9ncmFudC1kbWEtb3Bz
LmMNCj4+Pj4gaW5kZXggZmY5YmUzYWZmODdlLi43OWQxMzEyMmVjMDggMTAwNjQ0DQo+Pj4+IC0t
LSBhL2RyaXZlcnMveGVuL2dyYW50LWRtYS1vcHMuYw0KPj4+PiArKysgYi9kcml2ZXJzL3hlbi9n
cmFudC1kbWEtb3BzLmMNCj4+Pj4gQEAgLTEwLDYgKzEwLDcgQEANCj4+Pj4gICAgI2luY2x1ZGUg
PGxpbnV4L21vZHVsZS5oPg0KPj4+PiAgICAjaW5jbHVkZSA8bGludXgvZG1hLW1hcC1vcHMuaD4N
Cj4+Pj4gICAgI2luY2x1ZGUgPGxpbnV4L29mLmg+DQo+Pj4+ICsjaW5jbHVkZSA8bGludXgvcGNp
Lmg+DQo+Pj4+ICAgICNpbmNsdWRlIDxsaW51eC9wZm4uaD4NCj4+Pj4gICAgI2luY2x1ZGUgPGxp
bnV4L3hhcnJheS5oPg0KPj4+PiAgICAjaW5jbHVkZSA8bGludXgvdmlydGlvX2FuY2hvci5oPg0K
Pj4+PiBAQCAtMjczLDEyICsyNzQsMjggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkbWFfbWFwX29w
cyB4ZW5fZ3JhbnRfZG1hX29wcyA9IHsNCj4+Pj4gICAgCS5kbWFfc3VwcG9ydGVkID0geGVuX2dy
YW50X2RtYV9zdXBwb3J0ZWQsDQo+Pj4+ICAgIH07DQo+Pj4+ICAgIA0KPj4+PiAtc3RhdGljIGJv
b2wgeGVuX2lzX2R0X2dyYW50X2RtYV9kZXZpY2Uoc3RydWN0IGRldmljZSAqZGV2KQ0KPj4+PiAr
c3RhdGljIHN0cnVjdCBkZXZpY2Vfbm9kZSAqeGVuX2R0X2dldF9ub2RlKHN0cnVjdCBkZXZpY2Ug
KmRldikNCj4+Pj4gK3sNCj4+Pj4gKwlpZiAoZGV2X2lzX3BjaShkZXYpKSB7DQo+Pj4+ICsJCXN0
cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2RldihkZXYpOw0KPj4+PiArCQlzdHJ1Y3QgcGNp
X2J1cyAqYnVzID0gcGRldi0+YnVzOw0KPj4+PiArDQo+Pj4+ICsJCS8qIFdhbGsgdXAgdG8gdGhl
IHJvb3QgYnVzIHRvIGxvb2sgZm9yIFBDSSBIb3N0IGNvbnRyb2xsZXIgKi8NCj4+Pj4gKwkJd2hp
bGUgKCFwY2lfaXNfcm9vdF9idXMoYnVzKSkNCj4+Pj4gKwkJCWJ1cyA9IGJ1cy0+cGFyZW50Ow0K
Pj4+PiArDQo+Pj4+ICsJCXJldHVybiBvZl9ub2RlX2dldChidXMtPmJyaWRnZS0+cGFyZW50LT5v
Zl9ub2RlKTsNCj4+Pj4gKwl9DQo+Pj4gSXMgaXQgcG9zc2libGUgdG8gaGF2ZSBtdWx0aXBsZSB2
aXJ0aW8gZGV2aWNlcyB1bmRlciBhIHNpbmdsZSB2aXJ0aW8tcGNpDQo+Pj4gcm9vdCBjb21wbGV4
Pw0KPj4geWVzDQo+Pg0KPj4NCj4+PiBXaGF0IGlmIHZpcnRpby1uZXQgaGFzIHRoZSBiYWNrZW5k
IGluIGRvbTAgYW5kDQo+Pj4gdmlydGlvLWJsb2NrIGhhcyB0aGUgYmFja2VuZCBpbiBkb20xPw0K
Pj4+DQo+Pj4gT3IgZWFjaCB2aXJ0aW8gUENJIGRldmljZSBzaG93cyB1cCB1bmRlciBhIGRpZmZl
cmVudCBQQ0kgcm9vdCBjb21wbGV4Pw0KPj4NCj4+IEdvb2QgcXVlc3Rpb25zLiBUbyBiZSBob25l
c3QsIGl0IGlzIG5vdCAxMDAlIGNsZWFyIHRvIG1lIHlldCBob3cgaXQgaXMNCj4+IHN1cHBvc2Vk
IHRvIGJlLiBCdXQgbGV0J3MgZ3Vlc3MuLi4NCj4+DQo+PiBJIHRoaW5rIHRoYXQgaGF2aW5nIGEg
UENJIEhvc3QgYnJpZGdlIHBlciB2aXJ0aW8tcGNpIGRldmljZSBpcyBvdmVya2lsbC4NCj4+DQo+
PiBTbywgSSBzZWUgdHdvIG9wdGlvbnMgaGVyZToNCj4+IDEuIFdlIHByb3ZpZGUgUENJIEhvc3Qg
YnJpZGdlIHBlciBiYWNrZW5kcyBkb21haW4gdG8gdGhlIGd1ZXN0LCBzbyBlYWNoDQo+PiBQQ0kg
SG9zdCBicmlkZ2UgY292ZXJzIG9ubHkgdmlydGlvLXBjaSBkZXZpY2VzIHdob3NlIGJhY2tlbmRz
IGFyZQ0KPj4gcnVubmluZyB3aXRoaW4gKnRoZSBzYW1lKiBkb21haW4uDQo+PiBXaXRoIHRoYXQg
d2Ugd291bGQgYmUgYWJsZSB0byB1c2UgcHJvcGVydHkgYXQgUENJIEhvc3QgYnJpZGdlIGxldmVs
Lg0KPj4NCj4+IDIuIFdlIHByb3ZpZGUgb25seSBhIHNpbmdsZSBQQ0kgSG9zdCBicmlkZ2UgdG8g
dGhlIGd1ZXN0LCBzbyB0aGF0IHNpbmdsZQ0KPj4gUENJIEhvc3QgYnJpZGdlIGNvdmVycyBhbGwg
dmlydGlvLXBjaSBkZXZpY2VzIGFzc2lnbmVkIHRvIHRoaXMgZ3Vlc3QuDQo+PiBObyBtYXR0ZXIg
d2hlcmUgdGhlIGNvcnJlc3BvbmRpbmcgYmFja2VuZHMgYXJlIHJ1bm5pbmcgKHRoZQ0KPj4gdmly
dGlvLWRldmljZXMgdW5kZXIgdGhhdCBQQ0kgSG9zdCBicmlkZ2UgY2FuIGhhdmUgdGhlIGJhY2tl
bmRzIGluDQo+PiBkaWZmZXJlbnQgZG9tYWlucykuDQo+PiBXaXRoIHRoYXQgd2Ugd291bGRu4oCZ
dCBiZSBhYmxlIHRvIHVzZSBwcm9wZXJ0eSBhdCBQQ0kgSG9zdCBicmlkZ2UgbGV2ZWwuDQo+PiBB
bmQgd2UgbmVlZCBhIG1vcmUgZmxleGlibGUgb3B0aW9uKHMpIHRvIGJlIGFibGUgZGlzdGluZ3Vp
c2ggYmV0d2Vlbg0KPj4gdmlydGlvLXBjaSBkZXZpY2VzLg0KPj4NCj4+IFRha2luZyBpbnRvIGFj
Y291bnQgdGhhdCBmb3IgdmlydGlvLXBjaSBvbiBBcm0gd2UgbmVlZCB0byBlbXVsYXRlIGENCj4+
IHNwZWNpZmljIFBDSSBIb3N0IGJyaWRnZSBpbiBYZW4gdG8gaW50ZXJjZXB0IHRoZSBndWVzdCBQ
Q0kgY29uZmlnIHNwYWNlDQo+PiBhY2Nlc3Nlcw0KPj4gKGRldGVjdCB3aGF0IFBDSSBkZXZpY2Ug
aXMgdGFyZ2V0ZWQpIGFuZCBmb3J3YXJkIHRoZW0gdG8gdGhlIGFwcHJvcHJpYXRlDQo+PiBiYWNr
ZW5kIChJT1JFUSBTZXJ2ZXIpLA0KPj4gaXQgZmVlbHMgdG8gbWUgdGhhdCB3ZSBsaWtlbHkgbmVl
ZCB0byBnbyB3aXRoIHRoZSBzZWNvbmQgb3B0aW9uIGhlcmUNCj4+IChvbmUgUENJIGhvc3QgYnJp
ZGdlIHBlciBndWVzdCksIEkgbWF5IG1pc3Rha2UsDQo+PiBidXQgSSBkb27igJl0IHRoaW5rIHRo
YXQgd2Ugd2FudCB0byBlbXVsYXRlIHNldmVyYWwgUENJIEhvc3QgYnJpZGdlcyBmb3IgYQ0KPj4g
c2luZ2xlIGd1ZXN0IChtb3JlIGNvZGUsIG1vcmUgcmVzb3VyY2VzLCBldGMpLg0KPj4NCj4+DQo+
Pg0KPj4+IElmIHdlIGNhbiBoYXZlIG11bHRpcGxlIHZpcnRpbyBQQ0kgZGV2aWNlcyB1bmRlciBh
IHNpbmdsZSBQQ0kgcm9vdA0KPj4+IGNvbXBsZXgsIHRoZW4gSSB0aGluayBpdCB3b3VsZCBiZSBi
ZXR0ZXIgdG8gY2hlY2sgZm9yIGEgcGVyLWRldmljZQ0KPj4+IHByb3BlcnR5LCByYXRoZXIgdGhh
biBhIHNpbmdsZSBwcm9wZXJ0eSBhdCB0aGUgUENJIHJvb3QgY29tcGxleCBsZXZlbC4NCj4+IENv
bXBsZXRlbHkgYWdyZWUuDQo+Pg0KPj4NCj4+PiBUaGUgZmlyc3QgdGhpbmcgdGhhdCBjb21lcyB0
byBtaW5kIGlzIHRvIGRlc2NyaWJlIGVhY2ggUENJIGRldmljZSB1bmRlcg0KPj4+IHRoZSByb290
IGNvbXBsZXggaW4gZGV2aWNlIHRyZWUuIEFsdGhvdWdoIGl0IGlzIHVuY29tbW9uICh1c3VhbGx5
IG9ubHkNCj4+PiB0aGUgUENJIHJvb3QgY29tcGxleCBpcyBkZXNjcmliZWQgaW4gZGV2aWNlIHRy
ZWUpLCBpdCBpcyBwb3NzaWJsZSB0bw0KPj4+IGFsc28gZGVzY3JpYmUgaW4gZGV2aWNlIHRyZWUg
YWxsIHRoZSBpbmRpdmlkdWFsIFBDSSBkZXZpY2VzIHVuZGVyIHRoZQ0KPj4+IHJvb3QgY29tcGxl
eC4NCj4+Pg0KPj4+IEdpdmVuIHRoYXQgdGhlIGRvbVUgZGV2aWNlIHRyZWUgaXMgZ2VuZXJhdGVk
IGJ5IFhlbiBhbmQvb3IgdGhlIFhlbg0KPj4+IHRvb2xzdGFjaywgaXQgd291bGQgYmUgZWFzeSB0
byBhcnJhbmdlIGZvciBpdCB0byBoYXBwZW4uDQo+PiBUZWNobmljYWxseSB5ZXMuIElmIHdlIGRl
Y2lkZSB0byBwcm92aWRlIG9ubHkgYSBzaW5nbGUgUENJIEhvc3QgYnJpZGdlDQo+PiB0byB0aGUg
Z3Vlc3QsIHdlIHdpbGwgaGF2ZSBoYXZlIHRvIGRlYWwgd2l0aCB0aGUgdmlydGlvLXBjaSBkZXZp
Y2VzIHdpdGgNCj4+IHZhcmlvdXMgYmFja2VuZF9kb21pZCwNCj4+IHNvIHdlIGNhbiBjb25zaWRl
ciB1c2luZyBtb3JlIGZsZXhpYmxlIHByb3BlcnR5DQo+PiDigJxpb21tdS1tYXDigJ0v4oCdaW9t
bXUtbWFwLW1hc2vigJ0gc3BlY2lhbGx5IGludHJvZHVjZWQgZm9yIHN1Y2ggcHVycG9zZXM6DQo+
PiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2Mv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9wY2ktaW9tbXUudHh0X187ISFH
Rl8yOWRiY1FJVUJQQSExN0RrX3M4Y181UUNRRG1MTTFGWXA2OTVMdVVNU1RyVVY2SFBmUkE5Qmdt
Vno5VFJSRFpCT3V6c2Rad19jNkcwb2dreTFQMTFncWw5Q0hBT3NodWtXbXY3eldTMGRRJCAgW2tl
cm5lbFsuXW9yZ10NCj4+IEkgdGhpbmssIHdpdGggdGhhdCB3ZSB3b3VsZCBiZSBhYmxlIHRvIGRl
c2NyaWJlLCBpLmUgdGhhdCB2aXJ0aW8tcGNpDQo+PiBkZXZpY2UgQSBjb25uZWN0cyB0byBzdHJl
YW1faWQgKGJhY2tlbmRfZG9taWQpIFggYW5kIHZpcnRpby1wY2kgZGV2aWNlIEINCj4+IHRvIHN0
cmVhbV9pZCBZLA0KPj4gYW5kIHZpcnRpby1wY2kgZGV2aWNlIEMgdG8gbm90aGluZyAoc28gaXMg
bm90IHJlcXVpcmVkIHRvIHVzZSBncmFudHMpLA0KPj4gdW5sZXNzIEkgbWlzc2VkIHNvbWV0aGlu
Zy4NCj4+DQo+PiBJIGhhdmUgbG9va2VkIGF0IGl0IGFuZCBJIGRvbuKAmXQgc2VlIGF0IHRoZSBt
b21lbnQgd2h5IHRoZSBpZGVhIHdvdWxkbuKAmXQNCj4+IHdvcmssIGJ1dCBJIGhhdmVu4oCZdCBl
eHBlcmltZW50ZWQgd2l0aCB0aGF0IHlldCBpbiBzdWNoIGNvbnRleHQuDQo+IEkgdGhpbmsgaXQg
d291bGQgd29yayB0b28NCg0KDQpJIGhhdmUgZXhwZXJpbWVudGVkIHdpdGggdGhhdCwgaXQgd29y
a3MuIEFuZCBJIGhhdmUgYWxyZWFkeSBjcmVhdGVkIGEgcGF0Y2guDQoNCmh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL3hlbi1kZXZlbC8yMDIyMTAxNTE1MzQwOS45MTg3NzUtMS1vbGVrc3R5c2hAZ21h
aWwuY29tLw0KDQoNCldoYXQgSSB3YXMgdGhpbmtpbmcgaXMgYWx0aG91Z2ggZ2VuZXJpYyBQQ0kt
SU9NTVUgYmluZGluZ3MgDQooInhlbi1ncmFudC1kbWEiKSB3b3VsZG4ndCBsaWtlbHkgYmUgc3Vp
dGFibGUgZm9yICpmdXR1cmUqIGhvdHBsdWcgc3VwcG9ydCwNCml0IHdvdWxkIGFsbG93IHVzIHRv
IGhhdmUgdGhlIHdvcmtpbmcgc29sdXRpb24gb24gQXJtICh3aXRoIGEgbWluaW1hbCANCmNoYW5n
ZXMsIG9ubHkgZHJpdmVycy94ZW4vZ3JhbnQtZG1hLW9wcy5jIGlzIHRvdWNoZWQpDQphdCBsZWFz
dCBmb3IgUENJIGRldmljZXMgd2hpY2ggYXJlIGtub3duIGF0IHRoZSBkb21haW4gY3JlYXRpb24g
dGltZS4gT2YgDQpjb3Vyc2UsIHRoaXMgbmVlZHMgdGhlIHByb3BlciBzdXBwb3J0IGluIHRoZSB0
b29sc3RhY2suDQoNCg0KPiAgIA0KPg0KPj4+IFRoYXQgd291bGQgc29sdmUgdGhlIGlzc3VlIGFz
IGZhciBhcyBJIGNhbiB0ZWxsLCBidXQgSSB3b3JyeSBpdCBtaWdodA0KPj4+IG5vdCBiZSBhIGdv
b2QgaWRlYSBiZWNhdXNlIGlmIHdlIHJlbHkgb24gdGhlIHBlci1kZXZpY2UgZGV2aWNlIHRyZWUg
bm9kZQ0KPj4+IHRvIGJlIHByZXNlbnQgdGhlbiBpdCBiZWNvbWVzIGhhcmRlciB0byBpbXBsZW1l
bnQgdmlydGlvIGhvdHBsdWcNCj4+PiAoVmlydGlvIGhvdHBsdWcgaXMgaW1wb3J0YW50IHRvIGFk
ZCBkb20wbGVzcyBzdXBwb3J0LikNCj4+Pg0KPj4+IExldCdzIHNheSB0aGF0IHdlIGNyZWF0ZSBh
IGRvbTBsZXNzIGRvbVUgd2l0aCBhbiBlbXVsYXRlZCBQQ0kgcm9vdA0KPj4+IGNvbXBsZXggd2l0
aG91dCBhbnkgZGV2aWNlcyB1bmRlciBpdCwgdGhlbiBhZnRlciBEb20wIGlzIGZ1bGx5IGJvb3Rl
ZCwNCj4+PiB3ZSBhZGQgYSB2aXJ0aW8tbmV0IGVtdWxhdGVkIGRldmljZS4gSG93IGRvIHdlIHRl
bGwgdGhlIGd1ZXN0IHdoYXQgaXMNCj4+PiB0aGUgYmFja2VuZCBkb21haW4gaWQ/DQo+Pj4NCj4+
PiBEZXZpY2UgdHJlZSBhbmQgb3RoZXIgZmlybXdhcmUgdGFibGVzIGFyZSBub3QgcmVsZXZhbnQg
YW55bW9yZS4NCj4+Pg0KPj4+IFdlIGNvdWxkIHJldXNlIGEgUENJIGNvbmZpZyBzcGFjZSByZWdp
c3RlciB0byBleHBvc2UgdGhlIGJhY2tlbmQgaWQuDQo+Pj4gSG93ZXZlciB0aGlzIHNvbHV0aW9u
IHJlcXVpcmVzIGEgYmFja2VuZCBjaGFuZ2UgKFFFTVUpIHRvIGV4cG9zZSB0aGUNCj4+PiBiYWNr
ZW5kIGlkIHZpYSBhbiBlbXVsYXRlZCByZWdpc3RlciBmb3IgZWFjaCBlbXVsYXRlZCBkZXZpY2Uu
DQo+Pj4NCj4+PiBUbyBhdm9pZCBoYXZpbmcgdG8gaW50cm9kdWNlIGEgc3BlY2lhbCBjb25maWcg
c3BhY2UgcmVnaXN0ZXIgaW4gYWxsDQo+Pj4gZW11bGF0ZWQgUENJIGRldmljZXMgKHZpcnRpby1u
ZXQsIHZpcnRpby1ibG9jaywgZXRjKSBJIHdvbmRlciBpZiB3ZQ0KPj4+IGNvdWxkIGFkZCBhIHNw
ZWNpYWwgUENJIGNvbmZpZyBzcGFjZSByZWdpc3RlciBhdCB0aGUgZW11bGF0ZWQgUENJIFJvb3QN
Cj4+PiBDb21wbGV4IGxldmVsLg0KPj4+DQo+Pj4gQmFzaWNhbGx5IHRoZSB3b3JrZmxvdyB3b3Vs
ZCBiZSBhcyBmb2xsb3c6DQo+Pj4NCj4+PiAtIExpbnV4IHJlY29nbml6ZXMgdGhlIFBDSSBSb290
IENvbXBsZXggYXMgYSBYZW4gUENJIFJvb3QgQ29tcGxleA0KPj4+IC0gTGludXggd3JpdGVzIHRv
IHNwZWNpYWwgUENJIGNvbmZpZyBzcGFjZSByZWdpc3RlciBvZiB0aGUgWGVuIFBDSSBSb290DQo+
Pj4gICAgIENvbXBsZXggdGhlIFBDSSBkZXZpY2UgaWQgKGJhc2ljYWxseSB0aGUgQkRGKQ0KPj4+
IC0gVGhlIFhlbiBQQ0kgUm9vdCBDb21wbGV4IGVtdWxhdGVkIGJ5IFhlbiBhbnN3ZXJzIGJ5IHdy
aXRpbmcgYmFjayB0bw0KPj4+ICAgICB0aGUgc2FtZSBsb2NhdGlvbiB0aGUgYmFja2VuZCBpZCAo
ZG9taWQgb2YgdGhlIGJhY2tlbmQpDQo+Pj4gLSBMaW51eCByZWFkcyBiYWNrIHRoZSBzYW1lIFBD
SSBjb25maWcgc3BhY2UgcmVnaXN0ZXIgb2YgdGhlIFhlbiBQQ0kNCj4+PiAgICAgUm9vdCBDb21w
bGV4IGFuZCBsZWFybiB0aGUgcmVsZXZhbnQgZG9taWQNCj4+Pg0KPj4+IFdoYXQgZG8geW91IHRo
aW5rPw0KPj4NCj4+IEkgdGhpbmsgdGhlIGlkZWEgc291bmRzIGluZGVlZCBpbnRlcmVzdGluZyBh
bmQgd291bGQgcHJvYmFibHkgd29yaywgYnV0DQo+PiB3b3VsZCByZXF1aXJlIGd1ZXN0IG1vZGlm
aWNhdGlvbnMgb3RoZXIgdGhhbiBqdXN0IGluIGRyaXZlcnMveGVuIChhbmQNCj4+IGxpa2VseSB0
aGUgc3BlY2lmaWNhdGlvbiBjaGFuZ2VzIGFzIHdlbGwpLg0KPj4gV2hpY2ggaWRlYWxseSBvZiBj
b3Vyc2Ugc2hvdWxkIGJlIGF2b2lkZWQuDQo+PiBBbHNvIEkgd2FzIHRoaW5raW5nIGl0IHdvdWxk
IGJlIG5pY2Ugbm90IHRvIGRpdmVyZ2UgbXVjaCBiZXR3ZWVuDQo+PiBjb21tdW5pY2F0aW5nIHRo
ZSBiYWNrZW5kX2RvbWlkIGZvciBwbGF0Zm9ybSBhbmQgUENJIGRldmljZXMgb24gQXJtIHdpdGgN
Cj4+IGRldmljZSB0cmVlLg0KPj4NCj4+IElmIHdlIG1hbmFnZWQgdG8gcmUtdXNlIGdlbmVyaWMg
SU9NTVUgZGV2aWNlLXRyZWUgYmluZGluZ3MgZm9yDQo+PiB2aXJ0aW8tbW1pbywgd2Ugd291bGQg
bGlrZWx5IGJlIGFibGUgdG8gcmUtdXNlIFBDSS1JT01NVSBkZXZpY2UtdHJlZQ0KPj4gYmluZGlu
Z3MgZm9yIHZpcnRpby1wY2ksDQo+PiBhdCBsZWFzdCBmb3IgYm9vdCBQQ0kgZGV2aWNlcyAod2hp
Y2ggYXJlIGtub3duIGF0IHRoZSBkb21haW4gY3JlYXRpb24gdGltZSkuDQo+PiBUaGUgbW9yZSwg
dGhlIGJpbmRpbmdzIGlzIGFscmVhZHkgcHJlc2VudDoNCj4+IGh0dHBzOi8vdXJsZGVmZW5zZS5j
b20vdjMvX19odHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90
b3J2YWxkcy9saW51eC5naXQvdHJlZS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
aW9tbXUveGVuLGdyYW50LWRtYS55YW1sX187ISFHRl8yOWRiY1FJVUJQQSExN0RrX3M4Y181UUNR
RG1MTTFGWXA2OTVMdVVNU1RyVVY2SFBmUkE5QmdtVno5VFJSRFpCT3V6c2Rad19jNkcwb2dreTFQ
MTFncWw5Q0hBT3NodWtXbXZwZkY4R21BJCAgW2dpdFsuXWtlcm5lbFsuXW9yZ10NCj4gSSB0aGlu
ayB1c2luZyBhIHNwZWNpYWwgY29uZmlnIHNwYWNlIHJlZ2lzdGVyIGluIHRoZSByb290IGNvbXBs
ZXggd291bGQNCj4gbm90IGJlIHRlcnJpYmxlIGluIHRlcm1zIG9mIGd1ZXN0IGNoYW5nZXMgYmVj
YXVzZSBpdCBpcyBlYXN5IHRvDQo+IGludHJvZHVjZSBhIG5ldyByb290IGNvbXBsZXggZHJpdmVy
IGluIExpbnV4IGFuZCBvdGhlciBPU2VzLiBUaGUgcm9vdA0KPiBjb21wbGV4IHdvdWxkIHN0aWxs
IGJlIEVDQU0gY29tcGF0aWJsZSBzbyB0aGUgcmVndWxhciBFQ0FNIGRyaXZlciB3b3VsZA0KPiBz
dGlsbCB3b3JrLiBBIG5ldyBkcml2ZXIgd291bGQgb25seSBiZSBuZWNlc3NhcnkgaWYgeW91IHdh
bnQgdG8gYmUgYWJsZQ0KPiB0byBhY2Nlc3MgdGhlIHNwZWNpYWwgY29uZmlnIHNwYWNlIHJlZ2lz
dGVyLg0KDQoNClRoaXMgbmVlZHMgYW4gYWRkaXRpb25hbCBpbnZlc3RpZ2F0aW9uLg0KDQoNCj4N
Cj4gVGhhdCBzYWlkLCBmb3Igc3VyZSB0aGUgZmV3ZXIgY2hhbmdlcyB0byB0aGUgZ3Vlc3QgdGhl
IGJldHRlciBhbmQgSSBsaWtlDQo+IHRoZSBleGlzdGluZyB4ZW4sZ3JhbnQtZG1hIGJpbmRpbmcu
DQo+DQo+DQo+PiBSZWdhcmRpbmcgdGhlIGhvdHBsdWcgZGV2aWNlcywgeWVzIGl0IGlzIGEgdmFs
aWQgdXNlLWNhc2Ugd2hpY2ggc2hvdWxkDQo+PiBiZSBhbHNvIHN1cHBvcnRlZCB3aXRoIHZpcnRp
by1wY2ksIEkgYXNzdW1lIHRoZSBYZW5zdG9yZSBjb3VsZCBiZQ0KPj4gcmUtdXNlZCBmb3IgdGhh
dCBwdXJwb3NlIGlmIGl0IHdvdWxkIGJlIGF2YWlsYWJsZS4NCj4+IFRoZSBYZW5zdG9yZSBpcyBh
dmFpbGFibGUgd2l0aCB0aGUgdXN1YWwgRG9tMCBhbmQgdG9vbHN0YWNrLCBpcyBpdA0KPj4gYXZh
aWxhYmxlIHdpdGggZG9tMGxlc3M/DQo+IFhlbnN0b3JlIGlzIGF2YWlsYWJsZSBmb3IgZG9tMGxl
c3MgaWYgd2UgaGF2ZSBhIGRvbTAgcnVubmluZyB3aXRoDQo+IHhlbnN0b3JlZCBhcyBvbmUgb2Yg
dGhlIGRvbTBsZXNzIGRvbWFpbnMuIFdlIGN1cnJlbnRseSByZWx5IG9uIGl0IGZvcg0KPiBYZW4g
UFYgZHJpdmVycyB3aXRoIGRvbTBsZXNzLiAgQWZ0ZXIgZG9tMCBpcyBmdWxseSBib290ZWQsIHdl
IHVzZSAieGwNCj4gbmV0d29yay1hdHRhY2giIHRvIGNyZWF0ZSBhIHZpZiBpbnRlcmZhY2UgZHlu
YW1pY2FsbHkgaW4gdGhlIGRvbVUuDQo+DQo+IFRoYXQgaXMgd2h5IEkgd2FzIHRoaW5raW5nIG9m
IHVzaW5nIHZpcnRpbyBob3RwbHVnIHRvIHNvbHZlIHRoZSBzYW1lDQo+IHByb2JsZW0gd2l0aCB2
aXJ0aW8sIEkgd2FzIGltYWdpbmluZyB0aGF0IGFmdGVyIGRvbTAgaXMgZnVsbHkgYm9vdGVkIHdl
DQo+IHdvdWxkIGRvICJ4bCB2aXJ0aW8tYXR0YWNoIiBhbmQgY3JlYXRlIGEgbmV3IHZpcnRpbyBp
bnRlcmZhY2UgaW4gdGhlDQo+IGRvbVUuIEJ1dCBJIGNhbm5vdCBzZWUgYW4gZWFzeSB3YXkgdG8g
bWFrZSB2aXJ0aW8gaG90cGx1ZyB3b3JrIHRvZ2V0aGVyDQo+IHdpdGggdGhlIHhlbixncmFudC1k
bWEgYmluZGluZ3MuIEkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIGlmIHdlIGZpbmQgYQ0KPiB3
YXkgdG8gbWFrZSBpdCB3b3JrIHdpdGhvdXQgeGVuc3RvcmUgKGJlY2F1c2UgeGVuc3RvcmUgd291
bGQgYmUgYQ0KPiBzYWZldHktY2VydGlmaWNhdGlvbiBkZXBlbmRlbmN5KS4NCg0KSSBnb3QgeW91
ciBjb25jZXJuIHJlZ2FyZGluZyB0aGUgdXNhZ2Ugb2YgeGVuc3RvcmUgaW4gZ2VuZXJhbC4NCkFs
c28gSSBnb3QgdGhhdCBob3RwbHVnIGlzIHRoZSBvbmx5IHdheSB0byBnZXQgdmlydHVhbCBkZXZp
Y2VzIChlaXRoZXIgDQpQViBvciB2aXJ0aW8pIHdvcmtpbmcgZm9yIHRoZSBkb20wbGVzcyBzeXN0
ZW0sIGlzIG15IHVuZGVyc3RhbmRpbmcgY29ycmVjdD8NCg0KVGhlIHZpcnRpbyBob3RwbHVnIGNv
dWxkICpwcm9iYWJseSogd29yayB0b2dldGhlciB3aXRoIHRoZSANCiJ4ZW4sZ3JhbnQtZG1hIiBi
aW5kaW5ncyB3aXRoIHNvbWUgcHJlcmVxdWlzaXRlcyAoYmFja2VuZCBkb21pZCBzaG91bGQgDQpi
ZSBrbm93biBpbiBhZHZhbmNlKSwNCmJ1dCBJIGFtIG5vdCBxdWl0ZSBhcyBJIGFtIG5vdCB0b28g
ZmFtaWxpYXIgd2l0aCBkb20wbGVzcyBkZXRhaWxzLiBCdXQgDQphbnl3YXksIEkgd2lsbCB0cnkg
dG8gZGVzY3JpYmUgaXQuLi4NCg0KQXMgZmFyIGFzIEkga25vdyB0aGUgZG9tMGxlc3MgRG9tVXMg
YXJlIGNvbmZpZ3VyZWQgZnJvbSB0aGUgZGV2aWNlLXRyZWUuIA0KU28gdGhlIGNvbmZpZ3VyYXRp
b24gaXMga25vd24gYW5kIHByZXBhcmVkIGJlZm9yZWhhbmQuDQpJIG1heSBndWVzcyB0aGF0IHdl
IGtub3cgaW4gd2hhdCBEb21VMSB3ZSBhcmUgZ29pbmcgdG8gcnVuIHRoZSB2aXJ0aW8gDQpiYWNr
ZW5kcyBhbmQgd2hhdCBQQ0kgZGV2aWNlcyB3ZSBhcmUgZ29pbmcgdG8gYXNzaWduIHRvIERvbVUy
LiBTbyB3aGVuIA0KWGVuIGdlbmVyYXRpbmcgZGV2aWNlLXRyZWUNCmZvciBEb21VMiBpdCBjb3Vs
ZCBjcmVhdGUgcHJvcGVyIGlvbW11LW1hcCBmb3IgdGhlIFBDSSBIb3N0IGJyaWRnZSBub2RlLiAN
CkFsdGhvdWdoIGZvciB0aGlzIHRvIHdvcmsgd2Ugd291bGQgbmVlZCBhbiBhYmlsaXR5IHRvIGNv
bmZpZ3VyZSBkb21haW4gDQpJRCAoZC0+ZG9tYWluX2lkKSB2aWEgZGV2aWNlLXRyZWUNCmFuZCBs
aWtlbHkgcmVzZXJ2ZSBzb21lIHJhbmdlIG9mIGRvbWFpbiBJRHMgKHRvIG5vdCBjcm9zcyB3aXRo
IA0KbWF4X2luaXRfZG9taWQpLiBCdXQsIGl0IHdvdWxkbid0IGJlIDEwMCUgaG90cGx1ZyB0aGVu
Lg0KDQoNCj4NCj4gTWF5YmUgd2UgbmVlZCB0byB0aGluayBvdXRzaWRlIHRoZSBib3ggYW5kIGZp
bmQgYW5vdGhlciBzb2x1dGlvbiB0aGF0DQo+IGRvZXNuJ3QgcmVseSBvbiBob3RwbHVnLg0KPg0K
PiBGb3IgaW5zdGFuY2UsIGxldCdzIHNheSB0aGF0IHdlIGV4cG9zZSB0aGUgdmlydGlvIGRldmlj
ZXMgaW4gZGV2aWNlIHRyZWUNCj4gaW4gYSBkb20wbGVzcyBjb25maWd1cmF0aW9uIHRvbyBidXQg
d2l0aCBzdGF0dXMgPSAiZGlzYWJsZWQiLiBXaGVuIGRvbTANCj4gKG9yIGJhY2tlbmQgZG9tYWlu
KSBpcyB1cCBhbmQgcnVubmluZyBpdCBjYW4gc2lnbmFsIHRoYXQgaXQgaXMgcmVhZHkuDQo+IE1h
eWJlIGlmIHdlIGhhZCBhIHNwZWNpYWwgWGVuLXNwZWNpZmljIFBDSSBSb290IENvbXBsZXggZHJp
dmVyIGluIHRoZQ0KPiBndWVzdCwgaXQgY291bGQgd2FpdCBmb3IgdGhlIFhlbiBzaWduYWwgYW5k
IHRoZW4gY29udGludWUgUENJIHByb2JpbmcgYXQNCj4gdGhhdCBwb2ludCBob25vcmluZyB4ZW4s
Z3JhbnQtZG1hIGJpbmRpbmdzIGlmIHByZXNlbnQgaW4gZGV2aWNlIHRyZWUNCj4gZXZlbiBpZiB0
aGUgZGV2aWNlcyBoYWQgc3RhdHVzID0gImRpc2FibGVkIiBpbml0aWFsbHkuDQo+DQo+IEl0IGxv
b2tzIGxpa2UgdGhhdCB3b3VsZCByZXF1aXJlIG1hbnkgZ3Vlc3QgY2hhbmdlcyB1bmZvcnR1bmF0
ZWx5Lg0KDQoNCkl0IGxvb2tzIGxpa2UgeWVzLCBhbHNvIHlvdSBtZW50aW9uZWQgIml0IGNhbiBz
aWduYWwgdGhhdCBpdCBpcyByZWFkeSIsDQp0aGUgcXVlc3Rpb24gaXMgYnkgd2hhdCBtZWFucyAo
eGVuc3RvcmUgd291bGQgYmUgYSBnb2QgZml0IGhlcmUuLi4pPw0KDQpBbmQgSSBoYXZlbid0IHNl
ZW4gdGhhdCB2aXJ0aW8tcGNpIGRldmljZXMgYXJlIGRlc2NyaWJlZCBpbiBkZXZpY2UtdHJlZSAN
CnNvbWV3aGVyZSwgb25seSBnZW5lcmljIFBDSSBob3N0IGJyaWRnZSBub2RlDQppcyBkZXNjcmli
ZWQuIFRoZSB2aXJ0aW8tcGNpIGRldmljZXMgd2lsbCBiZSBkZXRlY3RlZCB0aGUgc2FtZSB3YXkg
YXMgDQp1c3VhbCBQQ0kgZGV2aWNlcyBkdXJpbmcgYm9vdC4gVW5sZXNzIEkgbWlzc2VkIHNvbWV0
aGluZy4NCg0KUmVnYXJkaW5nIHRoZSB2aXJ0aW8tbW1pbyAocGxhdGZvcm0pIGRldmljZXMsIHll
cywgd2UgY291bGQgZXhwb3NlIHRoZW0gDQp3aXRoIHN0YXR1cyAiZGlzYWJsZWQiLCBhbmQgdGhl
eSB3b24ndCBnZXQgcHJvYmVkIGJ5IGRlZmF1bHQuDQpUbyBiZSBob25lc3QsIEkgaGF2ZSBleHBl
cmltZW50ZWQgd2l0aCB0aGF0LCB3aGVuIEkgd2FzIHRoaW5raW5nIG9mIA0KcG9zc2libGUgaG90
cGx1ZyBmb3IgdmlydGlvLW1taW8gZGV2aWNlcyAoSSBrbm93LCB0aGlzIHNvdW5kcyB1bmNvbW1v
biANCmFuZCBzdHJhbmdlKS4NCkkgdXNlZCBMaW51eCBmZWF0dXJlIChDT05GSUdfT0ZfRFlOQU1J
Qywgb3ZlcmxheXMpIHRvIHVwZGF0ZSB0aGUgDQpkZXZpY2UtdHJlZSBvbiBydW5uaW5nIGd1ZXN0
LCBzbyB0aGUgdG9vbHN0YWNrIGluaXRpYWxseSBpbnNlcnRzIA0KdmlydGlvLW1taW8gZGV2aWNl
IG5vZGVzIGZvciBub24tYm9vdCBkZXZpY2VzDQp3aXRoIHN0YXR1cyAiZGlzYWJsZWQiLCBhbmQg
YXQgdGhlIHJ1bnRpbWUsIG9uY2Ugd2UgcmVjZWl2ZSBhbiBldmVudCBmb3IgDQpleGFtcGxlLCB3
ZSBjaGFuZ2UgdGhlIHN0YXR1cyB0byAib2siIGFuZCB0aGUgY29ycmVzcG9uZGluZyB2aXJ0aW8t
bW1pbyANCmRldmljZSBnZXRzIHByb2JlZC4NCkJ1dCBhZ2FpbiwgaXQgaXMgbm90IGEgMTAwJSBo
b3RwbHVnLCBhcyB3ZSBuZWVkIHRvIHByZS1hbGxvY2F0ZSBtZW1vcnkgDQpyYW5nZSBhbmQgaW50
ZXJydXB0IGluIGFkdmFuY2UgKHdoZW4gZ2VuZXJhdGluZyBndWVzdCBkZXZpY2UgdHJlZSkuDQoN
Cg0KPg0KPg0KPiBBcyBhbiBhbHRlcm5hdGl2ZSBJIHdvbmRlciwgZ2l2ZW4gdGhhdCBYZW4gZW11
bGF0ZXMgdGhlIFBDSSByb290DQo+IGNvbXBsZXgsIGlmIHdlIGNhbiByZXVzZSBvbmUgb2YgdGhl
IFBDSSBsaW5rIHVwL2Rvd24gZGVsYXlzIGZvciB0aGlzDQo+IGluc3RlYWQsIGxpa2UgInBjaWVf
d2FpdF9mb3JfbGluayIuIEl0IGxvb2tzIGxpa2UgdGhlIHdhaXQgdGltZSBpcyBpbg0KPiBtaWxs
aXNlYyB3aGlsZSB3ZSB3b3VsZCBuZWVkIHBvdGVudGlhbGx5IHNldmVyYWwgc2Vjb25kcyBoZXJl
IGJ1dCBpdA0KPiBtaWdodCBiZSBwb3NzaWJsZT8NCg0KSSBhbSBub3Qgc3VyZSB0aGF0IEkgdW5k
ZXJzdGFuZCB0aGlzIGFsdGVybmF0aXZlIGlkZWEuDQoNCg0KPg0KPiBPdGhlciBpZGVhcz8NCg0K
QW5vdGhlciAoY3Jhenk/KSBpZGVhIGlzIHRvIHJldXNlIENPTkZJR19YRU5fVklSVElPX0ZPUkNF
X0dSQU5UIGZvciANCmRvbTBsZXNzIHN5c3RlbSAoSSBtZWFuIHdpdGhvdXQgInhlbixncmFudC1k
bWEiIGJpbmRpbmdzIGF0IGFsbCkuDQpJZiB2aXJ0aW8gYmFja2VuZHMgYXJlIGFsd2F5cyBnb2lu
ZyB0byBydW4gaW4gRG9tMCB3aGVuIHdlIGhhdmUgaXQgdXAgDQphbmQgcnVubmluZywgdGhlbiBp
dCBzaG91bGQgd29yayBhcyBkb21pZCA9PSAwIGlzIHJlc2VydmVkIGZvciBEb20wLg0KSWYgdGhl
cmUgaXMgYSBuZWVkIHRvIHJ1biB2aXJ0aW8gYmFja2VuZHMgaW4gb3RoZXIgKmJhY2tlbmQqIGRv
bWFpbiAoZm9yIA0KdGhlIGRvbWFpbiBJRCB0byBiZSBhbHdheXMga25vd24gd2UgY291bGQgcmVz
ZXJ2ZSBhbiBJRCBmb3IgaXQsIHNvIGl0IA0Kd291bGQgYmUgYSBjb25zdCB2YWx1ZSksDQp3ZSBj
b3VsZCBwcm9iYWJseSBpbnRyb2R1Y2Ugc29tZXRoaW5nIGNvbmZpZ3VyYWJsZSBsaWtlIA0KQ09O
RklHX1hFTl9WSVJUSU9fRk9SQ0VfR1JBTlRfQkVfRE9NSUQgd2l0aCAwIGJ5IGRlZmF1bHQgKG9y
IGNtZCBsaW5lIA0Kb3B0aW9uKS4NCg0KLS0gDQpSZWdhcmRzLA0KDQpPbGVrc2FuZHIgVHlzaGNo
ZW5rbw0K

