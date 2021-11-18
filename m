Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE0A45560D
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 08:49:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227154.392795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mncAY-0003bd-90; Thu, 18 Nov 2021 07:49:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227154.392795; Thu, 18 Nov 2021 07:49:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mncAY-0003Yx-4z; Thu, 18 Nov 2021 07:49:18 +0000
Received: by outflank-mailman (input) for mailman id 227154;
 Thu, 18 Nov 2021 07:49:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HVvB=QF=epam.com=prvs=1956dce401=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mncAX-0003Yn-Bq
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 07:49:17 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 067ff4ee-4844-11ec-a9d2-d9f7a1cc8784;
 Thu, 18 Nov 2021 08:49:15 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AI6XxnS022679;
 Thu, 18 Nov 2021 07:49:11 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cdchgru8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Nov 2021 07:49:11 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB7427.eurprd03.prod.outlook.com (2603:10a6:20b:267::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 07:49:06 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.022; Thu, 18 Nov 2021
 07:49:06 +0000
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
X-Inumbo-ID: 067ff4ee-4844-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S6xYWGp/g0FtOcMB6E95Icdv0WwsZM8DbP+KsaG0OqgeFkT83dPugwyyiw35UTKVBOZDFkbe77nREJz5I4fV899wwY0t4ugZGPxJ4uCFU9NvC9lI0R0Pf2uah3cec+bjBX/ci6XhPsryK97F7h9DBLA4mMhr4V+EkFWYEKgi0nspAgI1yn6sNiWfUboAsgut0q8Wf+N56LKWj/fI+VnlRxahS6ZndZO6eXxYBx/KcNInfsueQ6PgRJ1OdYdH5psbghVIDIA2xJvZ6icQZQrM3wkXsynjD5ZtkYjYCvYzsp/1ZbhoOrm8AEsDfZeAvo6XTjdEoyoD27YHaiHMXX4Pgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nmp+qFIFD+EkQb+Qai1M7TC7Z9wkvbtKTE3EEwcSzrI=;
 b=iRBRclvgFeP7u5jYiCWlKLKhdMM6IVGps6/D0Ky374JiCx43DqEWR7C2XvgMiQUYp39/2RCjE2WvxEIS2LCpKCPnfMSZmMS1Pb8L/g1pOY/SNL207bDdr4423AU1LPXBhik1ydmDLZmvUNzR/obypZaDr3VYIms8kJD5vECIAs7mFc9XrgYbWSaQOeUnj8O4y6cENFKyZTNvM3tnRF6L+aMCZiv4SMR0SXC6tlI202nYAX/TXI1T2akQ7Y3xu6D6tM+YI68EY8FkzvKGQhXGFylnr97xP3VXvOJ9ZLk91EK8ucNhHFcI8Qd18fGraO68dNpF6zhbk/fEgpbBbUbNUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmp+qFIFD+EkQb+Qai1M7TC7Z9wkvbtKTE3EEwcSzrI=;
 b=noiGKgRgi7S89oEIqD4KQjZ0LSUreLLSLgEIKBPaq/USthIRRow538XIAMX3vVgeX5hZ78mSYIET+dsuWacQSh0jXgcB9zXBmbBx1Z0Mf+6GNG8LXs/3CaYDKUTpEMQ4cnQy0pYfeJ/m6t0ExVyoig1mhZ4m3zKqYpsuI07zdAuRWumhgEiBm/a7ruRtx6f6aotnepbwcl6+bPAoquf1xRmUk4Q4v28IUMlNo+lbFQIUfqQjtsLACEIooYZ8PwP8t8fgaGt7cGmvdtRIUUe/ZBkbifoTrCWBso5DwMTsUsnSS4tnCC0if00kImwOLzWNItxsBROgonA3hJyVVC4Fyw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        "roger.pau@citrix.com"
	<roger.pau@citrix.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Topic: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Index: AQHX0hJIYALl/D9fL0OD6N0XGDJh2awHdhMAgAGHTYA=
Date: Thu, 18 Nov 2021 07:49:05 +0000
Message-ID: <e2e83bee-5191-761d-f38b-55605de51002@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-3-andr2000@gmail.com>
 <cf0d5566-5629-76f2-ec8d-a05e6ecb4248@suse.com>
In-Reply-To: <cf0d5566-5629-76f2-ec8d-a05e6ecb4248@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 957e03d0-7a82-441e-fc57-08d9aa67e59d
x-ms-traffictypediagnostic: AM9PR03MB7427:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB7427368D8C1FECB573084D24E79B9@AM9PR03MB7427.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 mD58uaNATVRddZclKGLfeLpUmCCeM1RgFowFZiNZYgJIXi5wPmsGLp6EocEpnQnoPbDiELqY4UxTH5S1kmO6rV/4OQGnhbVcadozV1hPHH8jvsf3zk7yQ+UJ1pLnkggGv9u9KhWLNa4lZAV1HknXL+HaezJNc+hi0yeC/Ga2o2cX6vmUOi1rawLi3XfcJJR3IjIDUbPl6b0JwhVODAUu70WDi+PHBF2zai+LzmCAmOOYtOkj4KE2O2lUjC/UKCjEIFsgzjJG7J6z8kku6Ph66iviJlRYmAzlwD8l5YnlUyr6TLOBedbLQthiCzbt9IICsgjSK4WuvJVed+6pzgTpD4w1i7w1SIx/a0lKZCfHd1KE48U5OKDVMqWM/aTuluE/cHLavf09Q13OxtX16DZTrIef3WSht8trShFKqzC7nPhzww3CfTflBj9uEwwUtZ0O8KhEJSZrcwbla8a/a+G2xJWGe+nPB5wNGeBTbwSZ21+uChWwiOqu0VgzBs8GDi54agvShVrG/3eia8mOvAGJ8Nj7e7MxqmavpekbmDuWaOWUmsrshZKilrzMBKhbcaWuVGRjZOkQZprn0zTwoAPsmnTdEuqaJKcI/O0hgI/0HwsLgqZwaljazAdACQGLH5mGM3idt3RoR7ATROen7B5MEKl5SzWE1/p4zJQsKQgADWtOCJ5GNkisO/k9BfMN/r93PHia6uJCMvgThqQqS7Kj8Pm9BbA071j3f/oL2Dhyed9o90YAnnwFwI+w3L/32rel
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31696002)(122000001)(38100700002)(6506007)(8936002)(83380400001)(91956017)(508600001)(53546011)(66476007)(76116006)(64756008)(66446008)(66556008)(31686004)(8676002)(26005)(66946007)(2906002)(186003)(36756003)(54906003)(4326008)(107886003)(86362001)(6512007)(110136005)(71200400001)(38070700005)(6486002)(316002)(7416002)(5660300002)(2616005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RHFEd1FIZXlrdjBDZ0hCRzc1ZWdod0tkUWtmUkh5a3lNWFZHQTdXL043SHd0?=
 =?utf-8?B?RHBSVHpVUzB1RGRrMHVGTzR0QUc5RmVjQi9sVlZiWlhXMFBIWnAvNDZ1QzQ4?=
 =?utf-8?B?SllicWVUOCtQckF5ajE2ZkEyVTVWTUZkUUd6cjIxVVJ3RUdHSjVLbDhSa2VY?=
 =?utf-8?B?aUdMOU5wRWFjUUtHdlV6ZmE0Uk93a0czV1NDR0ZNdkhkcTdtRWRMNis4VGtM?=
 =?utf-8?B?N2tqdDhSaUxCVWFSMUFkTDI2cWErS09kOVlrVlVNbTQ5bzBwcnQ1OE5zcENu?=
 =?utf-8?B?L2xkQWRvc1kvQmJxV3NaZDhyWFZBL0JPeDZsSWZJQVRsVVlybG5jMXhPT2Zh?=
 =?utf-8?B?R1hjRmhJRHRiWWJLdm1KL1doUkp1eFlRRElMcDdiYTRnSmxzSUxvdVBnclFO?=
 =?utf-8?B?cFYwWVVwejNvMGxNU3dPdmlPWFYwWmJSbzFDUkhCUDZXNklld1piR0J5em4z?=
 =?utf-8?B?NjBiTEJYOTlrbG4wZ3dHNytKYlV3MU9oL0ZpcHVlZGg5dnFQWVJLOThMNWh5?=
 =?utf-8?B?OVVBTnJPQWR5dHUxRjI0Q0x6cGxMbVJXaUpic2E1cXVIMWhkS0pSaXJsaTBH?=
 =?utf-8?B?UTVlVXhWMW1ta2RNV2R1eTAzdmlnNFYvQWd2eGtDVktObWxHMkY3MHE5b1g5?=
 =?utf-8?B?cms0d0htS2NjS3ZOQ1JjZGpPcHZNaEVtOVFFT1ZZb3hDTUl2NG5sSFNpNXMr?=
 =?utf-8?B?WnQ0VXFHdEhmaVB6RUNhSlBobDY3N252cThKSk54MFhOd09pdXQyZjBnZlVF?=
 =?utf-8?B?czNLMEdleGk2L1NxVW1EZmtlL01FWXpoWFFNTDBaQW4rakttdjcreGZMZEFW?=
 =?utf-8?B?cjlPSldXbmNIZU1ScDZWazIvL3N3ZUpYNFNXM2UrV2diNzB0akhnRnVCd1NR?=
 =?utf-8?B?YWNqaWZjWDBLZUJNWVZ6MzR1YUUzMzNNK0JqalQvMW1tZHBOeW5ieGFvYjYr?=
 =?utf-8?B?aHZPMW1URk9yemlYb0JHMEZsZDFCTTJHeDUwY0pjaENZdVRpeThCSDRBSnpt?=
 =?utf-8?B?eE8rdHdYek1MZm15OHVwT3dDM1MwaXZwR3FKQ3RVODlieWpleW01ejYxY05U?=
 =?utf-8?B?d1JxZWczaEhqdlo2MTgxaGFwcEVrSytwZW41dDFnQnJUTFFXNy93RUhWckJx?=
 =?utf-8?B?eUlBTytpMFBXdExYQVFVMGJqTElQb1BnV3hYVkQ3ZmlZenJXcVhXeXZVcHhx?=
 =?utf-8?B?UFNmRmw4dlpuZEFoYXdFZWgwZGNodENDQ2N4VGdKbWdSTy80NXVuNmU5Qy9P?=
 =?utf-8?B?WWxpdmFYN21TTFdSZXZvekVrMHVsYzF6MURFbVRZTzY1MmJ4Q2pSdE9wVnhC?=
 =?utf-8?B?ZjIrdHRXRW8xTzFMZ2JrbVUxUXpENnh1RE51M0tmQVFvZFZiaTVIQ2tYSDA5?=
 =?utf-8?B?R2JLMHlneXkycU53NlRpYzA3ekkzM2dHbVg2TTc0VjBOcC85ZWJhSFM0enJF?=
 =?utf-8?B?c2liMlNXWEMzaUJ3bklsYk9IN0ZNSGwvR25OdDZqK3JSR0ZST3g4V3hVMXdK?=
 =?utf-8?B?Zy9KT3Q4MmFPQmw0VHpGUnNGYVRpWFpsbW1obVdMOEdJRGRocVVMM2pxbnpm?=
 =?utf-8?B?eDdENkdabEZ2UVQ4ZHkvVk1iMm8xcHJHWm0wUGlWc0JYRW11azFOY1FiaEZn?=
 =?utf-8?B?eVJpajVkbjk1T3E0OWtGTUpGUm1TQjdUdXo0ZnlTOTNxVTh5TUp4WWVUdEtn?=
 =?utf-8?B?a2hMazNmZ0VRQUM4aUFiN2luZWFic0R4Y3Z0YkorcUppV2l4REdxa0JadHJ6?=
 =?utf-8?B?VmlJUGg5dWFNZzMxOVVqeWxwcWpQd09UK1UxeXBWclpxSVFmc3dGLytGNEg0?=
 =?utf-8?B?QmRyMFJZa1ZrQkRaRmxLQS9HR2p3eEdRbHd4aU9hdlJuT0Yxb0RxM21zOTFY?=
 =?utf-8?B?SE1jU3pYeUkvTFFUTllXMXpXcjFoOXdCRWNLOGhUcTE4cDJWWVhYdnlzUnk2?=
 =?utf-8?B?ck8waGtmVWhscW1OTEcreUt0aHl6c0JDcE10TlRudXpiM0svMG9TZVVtakFJ?=
 =?utf-8?B?QTUwMnBoVjZoQ3I2NkxuS1RoY1hSWityU1docGt5L2drRTZMd3IyY25uU2xJ?=
 =?utf-8?B?MVlzRGE1aEM2VmdwaWIxVjdPRVFVNDVOSVdlNVNLNE5QT2p3WmREOG5DVVU0?=
 =?utf-8?B?cmJ4eXhyVXlucGNGbVc4ZXhNbkNDY1kxZy9PUDBPNWgxelA0U0hhdXVxMHl0?=
 =?utf-8?B?REhibFdWc1REQnNlbmsvOGtrMGFUTUUzMjNaenJjUUNsbTlBYWlPN01FaDU1?=
 =?utf-8?B?TUdGRHVvWHhRc3J6ZlQ3TVo1OVVNWWkzOHBLOEYwcFk2dms3OGhwSnlhRktX?=
 =?utf-8?B?ZlZvaG5YdkErN2xpYW51SE5FblBTRFRVU0FsZlh4SDNyQ0FHaC9lUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D300308B1E30242AB8B9249CA270415@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 957e03d0-7a82-441e-fc57-08d9aa67e59d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2021 07:49:05.9578
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FLBFOlnEKGXEC1pTf7yWHwAxIWuKEGXNwpiigr1ezBICVHtk/nSI0wEIXLRoglBCLqTXpbL4yV3KnevU4cHllgo1hwyX0pGUZ+HjLyiOQpo0XWopuNA+CE/+073ZJYXA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7427
X-Proofpoint-ORIG-GUID: rwl5zYgc_CttZ3afqlgSzXOGTNpQ7nDq
X-Proofpoint-GUID: rwl5zYgc_CttZ3afqlgSzXOGTNpQ7nDq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-18_02,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxlogscore=394 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111180044

DQoNCk9uIDE3LjExLjIxIDEwOjI4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDUuMTEuMjAy
MSAwNzo1NiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0K
Pj4gV2hlbiBhIHZQQ0kgaXMgcmVtb3ZlZCBmb3IgYSBQQ0kgZGV2aWNlIGl0IGlzIHBvc3NpYmxl
IHRoYXQgd2UgaGF2ZQ0KPj4gc2NoZWR1bGVkIGEgZGVsYXllZCB3b3JrIGZvciBtYXAvdW5tYXAg
b3BlcmF0aW9ucyBmb3IgdGhhdCBkZXZpY2UuDQo+PiBGb3IgZXhhbXBsZSwgdGhlIGZvbGxvd2lu
ZyBzY2VuYXJpbyBjYW4gaWxsdXN0cmF0ZSB0aGUgcHJvYmxlbToNCj4+DQo+PiBwY2lfcGh5c2Rl
dl9vcA0KPj4gICAgIHBjaV9hZGRfZGV2aWNlDQo+PiAgICAgICAgIGluaXRfYmFycyAtPiBtb2Rp
ZnlfYmFycyAtPiBkZWZlcl9tYXAgLT4gcmFpc2Vfc29mdGlycShTQ0hFRFVMRV9TT0ZUSVJRKQ0K
Pj4gICAgIGlvbW11X2FkZF9kZXZpY2UgPC0gRkFJTFMNCj4+ICAgICB2cGNpX3JlbW92ZV9kZXZp
Y2UgLT4geGZyZWUocGRldi0+dnBjaSkNCj4+DQo+PiBsZWF2ZV9oeXBlcnZpc29yX3RvX2d1ZXN0
DQo+PiAgICAgdnBjaV9wcm9jZXNzX3BlbmRpbmc6IHYtPnZwY2kubWVtICE9IE5VTEw7IHYtPnZw
Y2kucGRldi0+dnBjaSA9PSBOVUxMDQo+Pg0KPj4gRm9yIHRoZSBoYXJkd2FyZSBkb21haW4gd2Ug
Y29udGludWUgZXhlY3V0aW9uIGFzIHRoZSB3b3JzZSB0aGF0DQo+PiBjb3VsZCBoYXBwZW4gaXMg
dGhhdCBNTUlPIG1hcHBpbmdzIGFyZSBsZWZ0IGluIHBsYWNlIHdoZW4gdGhlDQo+PiBkZXZpY2Ug
aGFzIGJlZW4gZGVhc3NpZ25lZA0KPj4NCj4+IEZvciB1bnByaXZpbGVnZWQgZG9tYWlucyB0aGF0
IGdldCBhIGZhaWx1cmUgaW4gdGhlIG1pZGRsZSBvZiBhIHZQQ0kNCj4+IHt1bn1tYXAgb3BlcmF0
aW9uIHdlIG5lZWQgdG8gZGVzdHJveSB0aGVtLCBhcyB3ZSBkb24ndCBrbm93IGluIHdoaWNoDQo+
PiBzdGF0ZSB0aGUgcDJtIGlzLiBUaGlzIGNhbiBvbmx5IGhhcHBlbiBpbiB2cGNpX3Byb2Nlc3Nf
cGVuZGluZyBmb3INCj4+IERvbVVzIGFzIHRoZXkgd29uJ3QgYmUgYWxsb3dlZCB0byBjYWxsIHBj
aV9hZGRfZGV2aWNlLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hl
bmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4gVGhpbmtpbmcgYWJvdXQg
aXQgc29tZSBtb3JlLCBJJ20gbm90IGNvbnZpbmNlZCBhbnkgb2YgdGhpcyBpcyByZWFsbHkNCj4g
bmVlZGVkIGluIHRoZSBwcmVzZW50ZWQgZm9ybS4NClRoZSBpbnRlbnRpb24gb2YgdGhpcyBwYXRj
aCB3YXMgdG8gaGFuZGxlIGVycm9yIGNvbmRpdGlvbnMgd2hpY2ggYXJlDQphYm5vcm1hbCwgZS5n
LiB3aGVuIGlvbW11X2FkZF9kZXZpY2UgZmFpbHMgYW5kIHdlIGFyZSBpbiB0aGUgbWlkZGxlDQpv
ZiBpbml0aWFsaXphdGlvbi4gU28sIEkgYW0gdHJ5aW5nIHRvIGNhbmNlbCBhbGwgcGVuZGluZyB3
b3JrIHdoaWNoIG1pZ2h0DQphbHJlYWR5IGJlIHRoZXJlIGFuZCBub3QgdG8gY3Jhc2guDQo+ICAg
UmVtb3ZhbCBvZiBhIHZQQ0kgZGV2aWNlIGlzIHRoZSBhbmFsb2d1ZQ0KPiBvZiBob3QtdW5wbHVn
IG9uIGJhcmVtZXRhbC4gVGhhdCdzIG5vdCBhICJiZWhpbmQgdGhlIGJhY2tzIG9mDQo+IGV2ZXJ5
dGhpbmciIG9wZXJhdGlvbi4gSW5zdGVhZCB0aGUgaG9zdCBhZG1pbiBoYXMgdG8gcHJlcGFyZSB0
aGUNCj4gZGV2aWNlIGZvciByZW1vdmFsLCB3aGljaCB3aWxsIHJlc3VsdCBpbiBpdCBiZWluZyBx
dWllc2NlbnQgKHdoaWNoIGluDQo+IHBhcnRpY3VsYXIgbWVhbnMgbm8gQkFSIGFkanVzdG1lbnRz
IGFueW1vcmUpLiBUaGUgYWN0IG9mIHJlbW92aW5nIHRoZQ0KPiBkZXZpY2UgZnJvbSB0aGUgc3lz
dGVtIGhhcyBhcyBpdHMgdmlydHVhbCBjb3VudGVycGFydCAieGwgcGNpLWRldGFjaCIuDQo+IEkg
dGhpbmsgaXQgb3VnaHQgdG8gYmUgaW4gdGhpcyBjb250ZXh0IHdoZW4gcGVuZGluZyByZXF1ZXN0
cyBnZXQNCj4gZHJhaW5lZCwgYW5kIGFuIGluZGljYXRvciBiZSBzZXQgdGhhdCBubyBmdXJ0aGVy
IGNoYW5nZXMgdG8gdGhhdA0KPiBkZXZpY2UgYXJlIHBlcm1pdHRlZC4gVGhpcyB3b3VsZCBtZWFu
IGludm9raW5nIGZyb20NCj4gdnBjaV9kZWFzc2lnbl9kZXZpY2UoKSBhcyBhZGRlZCBieSBwYXRj
aCA0LCBub3QgZnJvbQ0KPiB2cGNpX3JlbW92ZV9kZXZpY2UoKS4gVGhpcyB3b3VsZCB5aWVsZCBy
ZW1vdmFsIG9mIGEgZGV2aWNlIGZyb20gdGhlDQo+IGhvc3QgYmVpbmcgaW5kZXBlbmRlbnQgb2Yg
cmVtb3ZhbCBvZiBhIGRldmljZSBmcm9tIGEgZ3Vlc3QuDQo+DQo+IFRoZSBuZWVkIGZvciB2cGNp
X3JlbW92ZV9kZXZpY2UoKSBzZWVtcyBxdWVzdGlvbmFibGUgaW4gdGhlIGZpcnN0DQo+IHBsYWNl
OiBFdmVuIGZvciBob3QtdW5wbHVnIG9uIHRoZSBob3N0IGl0IG1heSBiZSBiZXR0ZXIgdG8gcmVx
dWlyZSBhDQo+IHBjaS1kZXRhY2ggZnJvbSAoUFZIKSBEb20wIGJlZm9yZSB0aGUgYWN0dWFsIGRl
dmljZSByZW1vdmFsLiBUaGlzDQo+IHdvdWxkIGludm9sdmUgYW4gYWRqdXN0bWVudCB0byB0aGUg
ZGUtYXNzaWdubWVudCBsb2dpYyBmb3IgdGhlIGNhc2UNCj4gb2Ygbm8gcXVhcmFudGluaW5nOiBX
ZSdkIG5lZWQgdG8gbWFrZSBzdXJlIGV4cGxpY2l0IGRlLWFzc2lnbm1lbnQNCj4gZnJvbSBEb20w
IGFjdHVhbGx5IHJlbW92ZXMgdGhlIGRldmljZSBmcm9tIHRoZXJlOyByaWdodCBub3cNCj4gZGUt
YXNzaWdubWVudCBhc3N1bWVzICJmcm9tIERvbVUiIGFuZCAidG8gRG9tMCBvciBEb21JTyIgKGRl
cGVuZGluZw0KPiBvbiBxdWFyYW50aW5pbmcgbW9kZSkuDQpQbGVhc2Ugc2VlIGFib3ZlLiBXaGF0
IHlvdSB3cm90ZSBtaWdodCBiZSBwZXJmZWN0bHkgZmluZSBmb3INCnRoZSAiZXhwZWN0ZWQiIHJl
bW92YWxzLCBidXQgd2hhdCBhYm91dCB0aGUgZXJyb3JzIHdoaWNoIGFyZQ0Kb3V0IG9mIGFkbWlu
aXN0cmF0b3IncyBjb250cm9sPw0KPg0KPiBUaG91Z2h0cz8NCj4NCj4gSmFuDQo+DQpUaGFuayB5
b3UsDQpPbGVrc2FuZHI=

