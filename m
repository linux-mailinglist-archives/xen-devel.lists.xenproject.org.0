Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1804A62AB
	for <lists+xen-devel@lfdr.de>; Tue,  1 Feb 2022 18:39:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263729.456569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEx7x-0002dK-QD; Tue, 01 Feb 2022 17:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263729.456569; Tue, 01 Feb 2022 17:39:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEx7x-0002bV-MX; Tue, 01 Feb 2022 17:39:37 +0000
Received: by outflank-mailman (input) for mailman id 263729;
 Tue, 01 Feb 2022 17:39:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7bwX=SQ=epam.com=prvs=4031c7af39=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nEx7v-0002bP-Uz
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 17:39:36 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea58cce0-8385-11ec-8f75-fffcc8bd4f1a;
 Tue, 01 Feb 2022 18:39:33 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 211HXLFu018704;
 Tue, 1 Feb 2022 17:39:30 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2051.outbound.protection.outlook.com [104.47.0.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dy9bx80pp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Feb 2022 17:39:30 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM6PR03MB4840.eurprd03.prod.outlook.com (2603:10a6:20b:83::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Tue, 1 Feb
 2022 17:39:22 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 17:39:22 +0000
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
X-Inumbo-ID: ea58cce0-8385-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6cTTfjN3Q5ZYgIyOBoDsapDFSkuLv//Y2X0z9rerNW0NpHSOjybdZOqSmdkj9dpmkWKIItUIs36sMY52f91TQ4O+QLmyW4e9CcGcD3RIYf29Ma2abpQXctkxGF9ErsEjnTc5P4W+wGnMouTUYTUqd5+x4KiUMXVWOFFDMHbr36DVvPmFZRts20ZZWo8awMCcfpqzODf9pk1Nr1ujp1BVhcJ2CuCKWhp+J545jmm3jijj8s+j8J8+MOEdqp76uNYJu+kYp65HqRXua/i7mW7K0soMMG7ezn+3ZQJYGc7RCaKxQCxIRq2btsJezOYY66RTj/Y7famFHdf1eNGNAbR9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81LxUlPDo2sWHZT7xAoYqcn8XarcMNspnnIrsRV9hPY=;
 b=FY9vkgMqDP6FOqALfJLXOwUbdngZYFENBh1U5TCkZNIPhspUvZ/ZCd0Iu1v15bXeaYQZkeWDE3+uxmMBxFUvW/zXmKU7YlQhMy6hbLGFI7dbDK28nJ2CTzbwD028zyF4p/PH/9gpcxeqjIVE+x+p088OvtENMx80kos1XfhLjDl5TcKeqOqPRUXlQQO19nY7fsrdrM2pGGu9H4Gv9s6q5Cyf99QZx9cl/Pk1AcFvybLbXYaZKxr4E7clQdzC+oyLMrr0XvDOiD665mpqIOZQUYJPwuaPufMzFkaM7Wn5oZXXt+Tf1PathCWMHnZwMG6z09Epv3b/pjf67on1z5IEBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81LxUlPDo2sWHZT7xAoYqcn8XarcMNspnnIrsRV9hPY=;
 b=SQgMrtJaqasDAHB9WzUR6RkJAuwnq5mQa7gvXgkCAoMIjUmoyASha/h6xCcF0+JB0STwswxQCLSJu6L9XjJ42EKnfyAEdRaXxn7zw28HMZe7PJjOmj3ims7uuO84Fv2INpbjw244SXz0vbLa1VkwPm4Sd3Z7aelAym9YIHKbdZ2NYW4FLoI6vfuptPTKNl6HcorrCW0mQzLupm8rRct3a/XaOMPB4FcC+FN8QFARqYjIHWIKjEO3iWjcReTdpb6kanQN3jYFW92sY85l29mVKNmTFgF9nKUtz1wxvGuhOVl2+6FP6Ao4zxrkvs76ngUbaUT/fpOAXfYt4C6Iz2BuwQ==
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
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "jbeulich@suse.com"
	<jbeulich@suse.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH 2/4] rangeset: add rangeset_reset helper function
Thread-Topic: [PATCH 2/4] rangeset: add rangeset_reset helper function
Thread-Index: AQHYF4hPV7SJ+mLtNUi4YvDbTFD9Qqx+7KUAgAACoYCAAAVmAIAAAY2A
Date: Tue, 1 Feb 2022 17:39:22 +0000
Message-ID: <8207249a-4f51-4ca0-cb53-693df013fb15@epam.com>
References: <20220201162508.417008-1-andr2000@gmail.com>
 <20220201162508.417008-3-andr2000@gmail.com>
 <bb5010df-5e5b-9de1-7ad8-1ba5e8e37edc@xen.org>
 <ef8b93f8-5333-fc84-ac0a-8197d084f99b@epam.com>
 <63d5b282-3826-0c4e-d64f-2495c5a42b22@xen.org>
In-Reply-To: <63d5b282-3826-0c4e-d64f-2495c5a42b22@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 426a5cb9-00e7-4690-0f63-08d9e5a9c87e
x-ms-traffictypediagnostic: AM6PR03MB4840:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM6PR03MB48400A6A5295A7A60EEA6D9AE7269@AM6PR03MB4840.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 dOKa2p35M0wCSE6xOUTOQyScJDsLyIID+cdWyTqPt9t7O7foeoyYTOVeHd7IJ89xvtcWmGL/MuiVzl4USR3TEaKc+Ydo6awWcP1zwZbNBBGVljbKrtaNTLnv9/2YbeMqqq3Uglu+XgV7PkcML1lhZ5Ltu5JXZ2V+R1A290mc71HD8tTmoObfdppIeqioak6FJboolWD09/8cdqEQTs/+mrb3UgQtJiQRGuOVZtgbb7ro0IQ0vYcV8QM54xPbm1xAqhg71teVTs1YSzGL5I0XKX8jPI6HOAU695xfwKh3NBT6ud9da3S9D4XTFuFGM2x/ZNaqEd1eqEfONwNoavacoPmTCVxpceWanu2pK5ZE6vU5FSREVQ3pHrmPvh2ICQvU8OhNCDusThC484xwgt0AQiU7xzyYex6Lf+pJRlr3yDfytw6jaGHKW8X2mrmOmqm/dlo1YNHav3cGhtAIAU0cJLKpw5YJKuZrVCPVUFkWcPIWpZzjS0uX+3yXAAnDnkOxyBGZfTrwDXTto2fvE5a5cMVa+EcsEznuDtbsnmma3rSgUtGZfCqOlIo4HI5bwIK+F8kImtlhtifLEbkV8SbSdiX0Sc2YvX/bxVA7pNUstAio0Mh0I321mRMEdleky0Ac5T4/4wY8OnanuWvHe9ay7koSvwON3M7+Ie3H+tZfRXtXw7awRrpeS312/QRUxA//rl3+GeZYoQ41DuzA4vzTZP7vESk+u9bRSUTnKBYzwLtfSxQnv5kkLNf/JQlf1Ca5
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(71200400001)(36756003)(2616005)(107886003)(83380400001)(31686004)(508600001)(6486002)(186003)(26005)(6506007)(6512007)(2906002)(54906003)(4326008)(38070700005)(8676002)(7416002)(8936002)(64756008)(110136005)(5660300002)(91956017)(38100700002)(31696002)(122000001)(76116006)(86362001)(66946007)(66556008)(316002)(66476007)(66446008)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SXpxM1ZrREhxOFplbHFWZDUyWlA4NGpITzVlcjdmNlhQaTVjRkFaQXlIWDQ4?=
 =?utf-8?B?Zm11RFZtdG5YK01hUmNVZ042T1Z4SkJoRlR1eVBFVEkwUUlDQVZHUmNVdCtp?=
 =?utf-8?B?L1hjWkNLK0JFSEtmY285ZmhCeWg2TUF5dlpWYzhLOHJzckJPbmZSNmY3NURV?=
 =?utf-8?B?MzE2WVlwL3ZGdXJPMmFXU1lEbWMzaFVhbWFrblNTOEd0M1Bib2tuS041blZK?=
 =?utf-8?B?WGRyM0w2Z0gzL0ZKZVp6cjFGeXFHelNGcE9YbmtaM25zOWFJcmREOUo0Zzhp?=
 =?utf-8?B?dFUzT3dLNXRmdW16OEtpWGJOaHJ5UGd1d2YwWFcyUktPclk3UlZJZFAvWlRN?=
 =?utf-8?B?MkpuUzJFa0lWMWd3M3FvQ2pvYlNWZHlFdHhqdWhDZXZqNGxHVUpUbkkyU3R1?=
 =?utf-8?B?cFBqNHZicW03SEt3UWNBS01VSmpoREtGeFdqYVV0UldRZ0FhZ3diem00Kys2?=
 =?utf-8?B?U3AwbWZBSXV1dXRNNzRkSWE5RnBtMCtzN2FjSENTWGQ1TU14ckJPRXhwT0Vp?=
 =?utf-8?B?MkJvb1dReHRxRjNzODNETGVpWWx2K3pKdUtuKy9CMWNqN3ZhVGZjcHN2d0lD?=
 =?utf-8?B?NWViUWwwQ2RaRzJ0S1BXYzY0RUJFVDZ6RzVLejE2OEJrZ0xRbkw2azRzOXBM?=
 =?utf-8?B?eVZqRmhES1BIclRjeHZmMkpRM3FOVUhTNkJsMU9vZFlFbXlBL2M0R2lsZDlC?=
 =?utf-8?B?eXE0Wk8xN256ZDBEalFDSFM3cmNEcTJNTERTMjdlcTNwRStpU3VCL2ZQMzB5?=
 =?utf-8?B?NXJ2SHZYQk1NU3YvTUtjWXVzUHZJSkRUWGlZc3d6MGxyNmRtRGZtRWtLSXhH?=
 =?utf-8?B?ek8xcElsRVZZWHFDYWpDVzRRa3VWTVpjSzhid0huY01uWHdIcm8ydXNlUVFU?=
 =?utf-8?B?MlczY2ZlcWJtSWx0SWlxMmliOWRPZUdIMVFtVlF0b3RHZUpMbzhLM2Y1c0tR?=
 =?utf-8?B?L0VWc25SQ1JUT3BxcHdIMGZ1dzZzdzJYQXZtSC82TFlTdUd3dTJMNDZEUkdz?=
 =?utf-8?B?b01ZMVZXYnhmYVV4Q3ZUOVJuTTgrZlhDR0hQT3dINjBoZy9NZm04MGpad1Jv?=
 =?utf-8?B?ZFNuVFlKWmxZQmYyd1E4aitKWllib3U2czUrd2RGTmFzY1VqOStaeGNVY29x?=
 =?utf-8?B?NndZRC9Ma3pKUCtiNkdZZGZvTk1MeUY1b2tSRHFhN1VlMFF5MWlFaW9mdHJh?=
 =?utf-8?B?dkVjcS8yRW11WG0xU1c3RDB6MGJEWjRYejRzSkp6TWdmaXlOcVhmYTFvT1k4?=
 =?utf-8?B?ekNhYW9POWxJeHpjOUlYTjg3WDNVdmtvWE1GMGtJalEzSFJ4QTRTd2dOZW5t?=
 =?utf-8?B?Q3FCSGtEbjNzdkRqMUxPaHpCWXdVQUFuSnV3Tk5vSW84R1hKSEJVWTdhQ0Ey?=
 =?utf-8?B?UTd3ZW1SZmliTmI1M2VPSnBZd3ZxYjErMTYyN09zR2M5Sll2U2RUR0FEVjZX?=
 =?utf-8?B?Vm9TSDZ2UE14MFZXOURGeVEzeWlUNlZOQWhiR3M1R3hqTlA3RDNRYlh5aWU0?=
 =?utf-8?B?b3JSTi9UL0twczBJYmhVSFpSc2t5T3lPa2lLL0hHWVpPR1RzTzMxUnRkeVgy?=
 =?utf-8?B?b0hxTmdDdEIzVS9MKytVQXRGcWRkSVpmNU5nc0p3bjRuTDBxOUo5NWFJSHNO?=
 =?utf-8?B?RFhjemFnd1NpcXdiQnpMS2ZqeEZ5MEMxc2lKNlZCQ0lzNWcxSWZwblhNUmta?=
 =?utf-8?B?NG1YY3VNS3hLSmJZQSszSndhdXlHK3N2R1Z3UVExM2ZZenpxcEU4ekEyV3FB?=
 =?utf-8?B?UEVQdGtxdnREVVlBOVBoaWlGNzRDYnBSTGpBSE5QdGdIbVRnQUxURlJBOWNK?=
 =?utf-8?B?NjduQjQ4TXQ3Nncreko0Znk4R3dQaXc0STB2dWJxbnU0Z0ZSMU9lQkRXaHBR?=
 =?utf-8?B?OHRzclNhL01qYXdJWVZKYnBMOW91Nzdia0I1V2FRM3FEQ3MwdTgxWlhCRmwy?=
 =?utf-8?B?MHdSOW5YQzFWK29RdTAwUUtCNGRJSUZiTVFJMENPVldpRnZoZitHRWkzaUVW?=
 =?utf-8?B?MGhYT3hyQXlxSTZxTS9ER0c3Z2I5eTFoT2wvU1BTdVJDNzgzeDdMYmJ5b2Z2?=
 =?utf-8?B?ZndsdDNhSFRLQ05vOU1HTnp5ZEZVTVpYYUFpN3FXS1pMODRxYzUzdU84eGZw?=
 =?utf-8?B?SUtEd3ZQejl6aVdWT0JJMWREajZhZDBkUVlyQjFmS1BYd0tNY1B5Tklaa3hK?=
 =?utf-8?B?V3pHL3VkQmM5MVVnOHJsKzZ0R201bW1IcFZRbUI1UzVjSGZobDgrM1I4aGhx?=
 =?utf-8?B?U25pb1FVamZpaEFVeW96UllNRkJXMmtGQ3VrZWRyeW03bThadTdUNmpkL2hZ?=
 =?utf-8?B?UENNZUdhYWJaem5WZEJrNnNBT3lLZUVCYy95UEVFS1VtdXNVbTdzQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A4287DCB3AD76B42B74716E6407AF542@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 426a5cb9-00e7-4690-0f63-08d9e5a9c87e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2022 17:39:22.4480
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Rvl+I0DUnXYPIaOzSx+1v4sRWmhRPp3HPmdvG4cbXit6b8xbjKzl/7VWC2SqkAqjbRZ/dgsIK4POk6RzKQCJwbgNUgJfMytvM7AT+hZwVQm47eFBAf91BHebfak4HhL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4840
X-Proofpoint-GUID: Q7t_fKVT7Vv5J6QJhJOcU2AxP0a_iScK
X-Proofpoint-ORIG-GUID: Q7t_fKVT7Vv5J6QJhJOcU2AxP0a_iScK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-01_09,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202010098

DQpPbiAwMS4wMi4yMiAxOTozMywgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPg0KPg0KPiBPbiAwMS8w
Mi8yMDIyIDE3OjE0LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+IE9uIDAxLjAy
LjIyIDE5OjA1LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4gT24gMDEvMDIvMjAyMiAxNjoyNSwg
T2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IEZyb206IE9sZWtzYW5kciBBbmRy
dXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+Pj4NCj4+Pj4g
VGhpcyBoZWxwZXIgZGVzdHJveXMgYWxsIHRoZSByYW5nZXMgb2YgdGhlIHJhbmdlc2V0IGdpdmVu
Lg0KPj4+PiBQbGVhc2Ugbm90ZSwgdGhhdCBpdCB1c2VzIHJhbmdlc2V0X3JlbW92ZV9yYW5nZSB3
aGljaCByZXR1cm5zIGFuIGVycm9yDQo+Pj4+IGNvZGUgb24gZmFpbHVyZS4gVGhpcyBlcnJvciBj
b2RlIGNhbiBiZSBpZ25vcmVkIGFzIHdoaWxlIGRlc3Ryb3lpbmcgYWxsDQo+Pj4+IHRoZSByYW5n
ZXMgbm8gbWVtb3J5IGFsbG9jYXRpb24gaXMgZXhwZWN0ZWQsIHNvIGluIHRoaXMgY2FzZSBpdCBt
dXN0IG5vdA0KPj4+PiBmYWlsLg0KPj4+Pg0KPj4+PiBUbyBtYWtlIHN1cmUgdGhpcyByZW1haW5z
IHZhbGlkIHVzZSBCVUdfT04gaWYgdGhhdCBjaGFuZ2VzIGluIHRoZSBmdXR1cmUuDQo+Pj4+DQo+
Pj4+IFN1Z2dlc3RlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJf
YW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+IMKgwqAgeGVuL2NvbW1vbi9y
YW5nZXNldC5jwqDCoMKgwqDCoCB8IDYgKysrKysrDQo+Pj4+IMKgwqAgeGVuL2luY2x1ZGUveGVu
L3Jhbmdlc2V0LmggfCAzICsrKw0KPj4+PiDCoMKgIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRp
b25zKCspDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3Jhbmdlc2V0LmMgYi94
ZW4vY29tbW9uL3Jhbmdlc2V0LmMNCj4+Pj4gaW5kZXggZWEyN2Q2NTE3MjNiLi45Y2EyYjA2Y2Zm
MjIgMTAwNjQ0DQo+Pj4+IC0tLSBhL3hlbi9jb21tb24vcmFuZ2VzZXQuYw0KPj4+PiArKysgYi94
ZW4vY29tbW9uL3Jhbmdlc2V0LmMNCj4+Pj4gQEAgLTUyNSw2ICs1MjUsMTIgQEAgdm9pZCByYW5n
ZXNldF9zd2FwKHN0cnVjdCByYW5nZXNldCAqYSwgc3RydWN0IHJhbmdlc2V0ICpiKQ0KPj4+PiDC
oMKgwqDCoMKgwqAgd3JpdGVfdW5sb2NrKCZiLT5sb2NrKTsNCj4+Pj4gwqDCoCB9DQo+Pj4+IMKg
wqAgK3ZvaWQgcmFuZ2VzZXRfcmVzZXQoc3RydWN0IHJhbmdlc2V0ICpyKQ0KPj4+PiArew0KPj4+
PiArwqDCoMKgIC8qIFRoaXMgZG9lc24ndCBhbGxvY2F0ZSBhbnl0aGluZyBhbmQgbXVzdCBub3Qg
ZmFpbC4gKi8NCj4+Pj4gK8KgwqDCoCBCVUdfT04ocmFuZ2VzZXRfcmVtb3ZlX3JhbmdlKHIsIDAs
IH4wVUxMKSk7DQo+Pj4NCj4+PiBJIHZhZ3VlbHkgcmVjYWxsIHNvbWUgZGlzY3Vzc2lvbiBpbiB0
aGUgcGFzdCAobm90IHJlbGF0ZWQgdG8gdGhpcyBzZXJpZXMpIHRoYXQgd2Ugd2FudGVkIHRvIGF2
b2lkIGNhbGxpbmcgZnVuY3Rpb24gaGF2ZSBzaWRlLWVmZmVjdCBpbiBhIEJVR19PTigpLiBTbyBp
ZiB3ZSBkZWNpZGUgdG8gcmVtb3ZlIGF0IGNvbXBpbGUtdGltZSBCVUdfT04oKSwgdGhlcmUgd291
bGQgYmUgbm8gaXNzdWUuDQo+Pj4NCj4+PiBCdXQgdGhlbiBJIGFtIG5vdCBzdXJlIGFib3V0IHRo
ZSB1c2Ugb2YgQlVHX09OKCkuIENhbiB5b3Ugb3V0bGluZSB3aHkgY3Jhc2hpbmcgdGhlIGh5cGVy
dmlzb3IgaXMgYmV0dGVyIHRoYW4gY29udGludWluZyAoZS5nLiB1c2UgV0FSTl9PTigpIG9yIEFT
U0VSVCgpKT8NCj4+IE5vbi16ZXJvIHZhbHVlIHdpbGwgaW5kaWNhdGUgd2Ugd2VyZSBub3QgYWJs
ZSB0byBjb21wbGV0ZSB0aGUgb3BlcmF0aW9uDQo+PiB3aGljaCBtdXN0IG5vdCBmYWlsIGJlY2F1
c2Ugb2YgdGhlIGNvbmNyZXRlIHVzZS1jYXNlOiB3ZSByZW1vdmUgYWxsIHRoZQ0KPj4gcmFuZ2Vz
IGFuZCBpdCBpcyBub3QgZXhwZWN0ZWQgdGhhdCB0aGlzIG1heSBmYWlsLg0KPj4gSnVzdCB0byBt
YWtlIHN1cmUgdGhpcyBiZWhhdmlvciBkb2VzIG5vdCBjaGFuZ2UgSSB1c2UgQlVHX09OIGhlcmUg
d2hpY2gNCj4+IGlmIHRyaWdnZXJlZCBjbGVhcmx5IGluZGljYXRlcyB0aGF0IHRoZSBiZWhhdmlv
ciBoYXMgY2hhbmdlZCBhbmQgdGhlcmUgaXMNCj4+IGEgbmVlZCBpbiBjb2RlIGNoYW5nZS4NCj4N
Cj4gUmlnaHQsIGJ1dCB0aGF0IGNoYW5nZSBvZiBiZWhhdmlvciBtYXkgbm90IGJlIG5vdGljZWQg
ZHVyaW5nIGRldmVsb3BtZW50LiBTbyBJIHRoaW5rIHdlIHdhbnQgdG8gYXZvaWQgQlVHX09OKCkg
d2hlbiB0aGlzIGlzIHBvc3NpYmxlLg0KPg0KPj4NCj4+IEkgY2FuIHR1cm4gdGhpcyBpbnRvIFdB
Uk5fT04gaW5zdGVhZCwgYnV0IHRoaXMgbWF5IGxlYWQgdG8gbWVtb3J5IGxlYWtzDQo+PiBvciBz
b21lIG90aGVyIGVycm9ycyBub3QgaGFuZGxlZC4NCj4NCj4gSU1ITywgdGhpcyBpcyBhIGJpdCBi
ZXR0ZXIgYnV0IG5vdCBieSBtdWNoLiBMb29raW5nIGEgcmFuZ2VzZXRfZGVzdHJveSgpLCB5b3Ug
c2hvdWxkIGJlIGFibGUgdG8gZG8gaXQgd2l0aG91dCBhbnkgb2YgdGhlIGlzc3VlcyB5b3UgZGVz
Y3JpYmVkIGhlcmUuIFNvbWV0aGluZyBsaWtlOg0KPg0KPiDCoMKgwqAgaWYgKCByID09IE5VTEwg
KQ0KPiDCoMKgwqDCoMKgIHJldHVybjsNCj4NCj4gwqDCoMKgIHdoaWxlICggKHggPSBmaXJzdF9y
YW5nZShyKSkgIT0gTlVMTCApDQo+IMKgwqDCoMKgwqDCoMKgIGRlc3Ryb3lfcmFuZ2UociwgeCk7
DQo+DQpZZXMsIHRoaXMgaXMgYWN0dWFsbHkgd2hhdCBSb2dlciBzdWdnZXN0ZWQgdG8gbWUgcHJp
dmF0ZWx5IG9uIElSQy4NCk9rLCBzbyBJJ2xsIHJlLXdvcmsgdGhlIHBhdGNoIGFzIGFib3ZlDQoN
ClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

