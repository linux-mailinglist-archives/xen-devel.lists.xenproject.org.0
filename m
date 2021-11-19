Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E84456FC9
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 14:41:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227946.394388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo48p-0008F6-KT; Fri, 19 Nov 2021 13:41:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227946.394388; Fri, 19 Nov 2021 13:41:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo48p-0008D9-GW; Fri, 19 Nov 2021 13:41:23 +0000
Received: by outflank-mailman (input) for mailman id 227946;
 Fri, 19 Nov 2021 13:41:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W8RP=QG=epam.com=prvs=19578d545c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mo48n-0008D3-Sd
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 13:41:21 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 600802b0-493e-11ec-9787-a32c541c8605;
 Fri, 19 Nov 2021 14:41:20 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AJDDq1i030927;
 Fri, 19 Nov 2021 13:41:16 GMT
Received: from eur02-am5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2050.outbound.protection.outlook.com [104.47.4.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3cebkv8bf9-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 13:41:16 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB7122.eurprd03.prod.outlook.com (2603:10a6:20b:2d7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 19 Nov
 2021 13:41:12 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 13:41:12 +0000
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
X-Inumbo-ID: 600802b0-493e-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQJoyFCrE0xHuLF1S7gMmRN8WakALixnsUlMDjLXlr+TzjDxKt0NUgip7FvyNlg+qwrzoYleHJqbsbK0zR1UuJXPOXFktOhWUdq5dnc1xmKqyEqq3NRhpy/3TDAP74EnsvdtzA+m28W9WOyGw9kuKCBJwoVpSaeApHm4nWan1on9VTnBu5HedOKlnjbN11dy3OZmuckbdbRnSMW0oFyS+6ndYoQS/2/5KEg6DLIBk26chx9J/LdMyJ8vBrEz1kLW6pJGWQa6txbg+m8zi7gUHilyCRDH20ESWLRtGEaHjjxRDfF4a5IuqS46ZyobyBG2LReBISiGZo0FcAVGjDwUHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mdjUaUuvmkK2au7R7pSabC6xgXPInAR5bksrHymMn6g=;
 b=Qhr8Ihg7EIeyEgJ7KMJY8ltvof6Y0gB0v6PqXU2aUj6XXvmZTh8QKUt0sfmDXqpWyXC/mx5dq1l9P+nvb5D/1Z2KRI3gne1I0pz9JX4k4DhktFErGemJfuJhRj5uO1V4UdZa4PsHENanAM1LEoJUOr+HflTZoZiiPM71DQHxOiTAHQxTXnPiBmYrbrz14MtIWQfE2WCWnnvxuiFn1FPRP5jqEkET+/8umNaiwgqKzxS11howA69BAt7cNeczJWy4On6pbi7LdF7t7WFtEaApA1T5MvftgNSh4IhX4G19al4ySvVBA1gceNCf6lOdl051g1OTeQwQ8zFWA9TIzDW6MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdjUaUuvmkK2au7R7pSabC6xgXPInAR5bksrHymMn6g=;
 b=ToX0Pt6Agu5ndXELvj2m3pBE7QmJzB5PUSssbt7YZ35pjCgoUYpkGo9W5Hmw1i8aSJDr1+ZfM8d+nCM+U5Z/4NqNaK3/dChm00RjdGYH8EQCYzBWtkxyk3v7du+PDXuRkJGR85P9yLHEKF7c/TQ/4l8VE9mV9O/McTSOn0yGhwXMQkUHvwUSMMRoXr3lwKBAI/0LWXF+tnpxLk/7Tr04a6HRgxV7eWugwp7CyxY55fwX4rTh7LoEeg0Wvz/t8BCLIqeMgTlKQbKCLp6Wlp1+o0jLElpvPr+mHHPag0iSz3ge3QA9vZ6CvAJU8tPmyG0EjS6fSBcoM0NhqsvjeUC9Fw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 06/11] vpci/header: handle p2m range sets per BAR
Thread-Topic: [PATCH v4 06/11] vpci/header: handle p2m range sets per BAR
Thread-Index: AQHX0hJLwt+wJ2t1lka5jlbMIq7ZAqwK60SAgAAG0YA=
Date: Fri, 19 Nov 2021 13:41:12 +0000
Message-ID: <6b2d4825-3b00-4034-2804-a44059de15a1@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-7-andr2000@gmail.com>
 <3a7f4c3a-7162-8cd3-0879-2f87572f0225@suse.com>
In-Reply-To: <3a7f4c3a-7162-8cd3-0879-2f87572f0225@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50fa2a1e-0361-4d44-7e52-08d9ab62403d
x-ms-traffictypediagnostic: AM9PR03MB7122:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB7122C3D90317781E733A4C6DE79C9@AM9PR03MB7122.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YU1GXa7GtscQSAxRPABRDHeUxvAY3v1kpFTPWLgCYECeHiI6nYVohxVyExFyJ4TiK9LThPkXRtcbDnfJ2MW8/j8rGVZTy2AAcoOxmEFAYE6oa6XiGhbmMZJx0n1SacMiodgFlaqAXnLRS47CSZqsmaccE8ed2UmeQwHsAKdKTSdqU5vSSgiMKbXeieOsJb1olwsSoOOAAxDVvjli/52UzxR4YymYrTY7Zfln7tyhX74Q3RwVNmZZh7LxR1UOSu7uxHyebc6bT1wacwAq6TU9YQRfdi6cKfhTue/c8nroXFfG0HxqUjl5/aJ41hWThhhvvSWCh+PKQnOd5ocmXXOqdG/DbV8OkBanJzdR1F0WriP5xq8tnbI6/GCwYipDM6s24pgBo/dP5uiM3XGKlizZLDuptSBJQB6CoJ3bZgnpYmx2ve5TY4fhjtdhN7ZP2yayi68dFwMKbhs5o2T8EI3VYT/CnC0cXw1s9U7z/gcnB+mICDYSv13XWVnT3/FLHdiNf84huwvyS7fsEOwZTT2AICuqCzjWhPBwWl1masc+0axbXbq14IbUOe+RG65x8m5Z9ArV9odDNALBewEOPRMFryDqqTNi4h78WEUYu5d5Q/Nfm+fWOP69yS6IaStMrQVSCkEMW7OycJm0XGZEpRryipqkxK5ToVHdhjhthTPSs25mUErcG6ISk3/Kh+O6XaR4gGVni7H3DH6dxTKbf3b/txaOfpfuR8XZLvXGvP96TCrLDr7WBITQ0JNDpbIu+H6h
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(4326008)(2616005)(2906002)(122000001)(4744005)(38100700002)(31696002)(508600001)(38070700005)(7416002)(76116006)(26005)(53546011)(8676002)(5660300002)(6506007)(6512007)(91956017)(71200400001)(64756008)(54906003)(66446008)(316002)(66476007)(8936002)(83380400001)(110136005)(86362001)(66556008)(6486002)(31686004)(66946007)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Vy9wYys4ckZBTlhpVTB6Zlp0S3JHVVVleHo3aUVHZitNUTNsdmsxWGVPbnVJ?=
 =?utf-8?B?Q2tabEtXNnpCRHVZYlJXTDFTcVZLSXdmZVlUNXJ0SHNGbFFraEN6UTNERnFS?=
 =?utf-8?B?dUVpaFczUy9xUjIzM28zM0M4U1lvUWpvZUQ2bFdVaHN3MUN6enlzVXJSZS9G?=
 =?utf-8?B?OUF2b2V4ei9mcTVqV1BVZmpoRk5yS3B2MVhaaUNQRndEcjdtZ2hvcTNXd0xD?=
 =?utf-8?B?R2U1dFFwR0VhQlo3OGE4ZC8vM1pQLzE1UDR2L0l6dUphNG56NHdhZUx0YWh4?=
 =?utf-8?B?NW93NXdsL21EZWc2QXlNS01xNUc3RDhFczlzSmt1U0RIQjBTVmxKQWNIUTlN?=
 =?utf-8?B?N1h2YlZ2N3hCallxOVcvc0kzL0loRHRCaG1jdFIwZEllaUxPMWNXUHdlV1g4?=
 =?utf-8?B?a0o3REtlUnA4TlRSdCtiRHNVYzlaWWN2bHlraUtiaVZheENHSVUyRVF6QlVs?=
 =?utf-8?B?MVd3NG1WamVPcjQyeVJpa2dTb0RqNTZJSUdEUVM0ZjRLcHN5clBxeSt0VWpB?=
 =?utf-8?B?emJJRTc5eW8xVTc4NW0yWW81ZHFxOFdXeERMQ0I0d2N3SXh3SU9VSnlkZEZY?=
 =?utf-8?B?Q3RlT2thTU1mQTFrUHdBOEhlZVJaMGFMSTNSQkR2eHR3dlZRNEZPblFnMkNy?=
 =?utf-8?B?b0kzaUNGRUd4OTFZT1d2YkNiRDYzVlNhZ1Q3cGJ4cG50MjgzVmFlWXowUXNF?=
 =?utf-8?B?UWN5NTJjaTcwU0x3L0c5M0tTZlp5MG95WFh6S2NOUnh2V1IweVY1MTdwcUI0?=
 =?utf-8?B?eEovd0p3Tmt0QTFMa2hqUHpRUFo3NXkzd3lDVTRvVFBRTkJGK2srK3ZFckZy?=
 =?utf-8?B?a21zSk9kMmkvSkpSVHpOaFdDNjU2Q0locmhqSnhLemN2NWFsbmhUSVAyMUtt?=
 =?utf-8?B?NkN6eTVYQXFSbklCekxpSzZabCtaNFliU1B3cWd3QTVOTVE1RDYwYWsxMzNl?=
 =?utf-8?B?L3RkVitUV0U4aStNOW1sb2lPUmJyNnVjNFI5S3VXdUFBVTFOd29iSVJvdlU2?=
 =?utf-8?B?MVJHZlpaNW9Eb2txVGFvRXo0b3BTamFla2Z4OXN2OEw1eE4wRkRFU016V0dV?=
 =?utf-8?B?MkRCMC9KSVJRQTB5eTg3RW9MS3NkUnBMWVdMa3RZTTlMTi9FTElJMU11MEti?=
 =?utf-8?B?cjVKTklodmpkU01uOUUzRHl6ZjVyTnBwNFFkOXFCdkU3U1ZHV296eFoxd3BM?=
 =?utf-8?B?Ny81YVBBTEVCUFREZ3lWWHYrZFlxSjQrOGl6bjdxc1BNZWY5NkY1a0QzYXpm?=
 =?utf-8?B?SzZFVGtNOGxPY3k3bTdhVE1HZHBNd0krU0NWQlhSc2dzTGJVYTdKSldBclBP?=
 =?utf-8?B?U1hXWXJGYnJwRDJWa09QVnFKeWltampJQW9jWFYzand3c25MR1dVRUZnb3Vv?=
 =?utf-8?B?emtFdEV5ZUhrMC9oL0NkU2xpMyt3c3JoVE5LY2VVbS9hQWRQKzdPaUlRU2l1?=
 =?utf-8?B?NkU4UnBHanpBSnNQckxIVFFCM3k4VWZHcllNR0I5b01XOWhKUUpLTzU1cTB0?=
 =?utf-8?B?WHAzQ0J4TU5nbWphbFJuUFZ0ZzJUNUFMaUxnK1NZZEttSitTcnAvMjFBUHJ5?=
 =?utf-8?B?WHRxbUk4d21xcGs1M2ZzbnlJcGhWVUtOUmhhOE9UTHl5bVNKTUszTXEvY0Iy?=
 =?utf-8?B?OTdReXVaK1V3U1RzR25zMVpIa1pFbHhJb1BJNUtuQUxIUFZXWTlBQkl1Tzk0?=
 =?utf-8?B?QzJBcVo5Y1VuYzlLcXg0VWVCOEFpL3psNGFPMThudXNDeERpOUFSZEVuMTJD?=
 =?utf-8?B?emlJK3ZXVDRvYUxqNlhQc3IzWHJKQWpEOEkrNVRGdW52NkRYSHZ1Y29sanl4?=
 =?utf-8?B?Wko0cXVRUWxVa2JCU014ZTJjQVMyZERTWGpRR3Q1YzdtVEhONHcra1hmUTU5?=
 =?utf-8?B?WjBlRHVET0pEVmFIRXlXZGMvTDlzcXdnQ3BINnUreGJINEowNXN0eStxSGVY?=
 =?utf-8?B?b3V3S1VVNnBQRVpBSzlrVUFValpVcVFxQVpXMU1pRVlyVS9JelNNbWYxTTl4?=
 =?utf-8?B?d1ZJOTZaaVF3VnBNd2E4WGN2MW42M3VGM25abExMNUZxYmJ1MFdvdEVnODZV?=
 =?utf-8?B?T2xNU1JMZFBMNk9QOVFObG1tMlM3K3NpTXRzTXU3ZXlLbU0wK1BpZ0Y4cHp1?=
 =?utf-8?B?T2xRUDJKdEVmeXRLelU1bWRvSjg3ZE1KeHZXd0tNVFJTRzU0OWhGbll5Yjds?=
 =?utf-8?B?YmdIS3pKbDNEQUFOT2RNSG8wc3B2SnZZeXBjMmpPbDZyOGFrazNPN2tLSEY5?=
 =?utf-8?B?Tk5UUUJQL1l5ZGNiYUs4VW1OcUIvVzB3QlIrQjJ1Qjg1N04xS2lLNVdldGJD?=
 =?utf-8?B?bFdENDhGTmZmdTNMMW5JMEpzWGZOK0NMOU5uNlFLU1gvcGtXZlZQQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <74E9B5D73179A049ADFE4E0A2F7D615D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50fa2a1e-0361-4d44-7e52-08d9ab62403d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2021 13:41:12.0859
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lm7bJoBplKfQHaatbHpeKkGlpAf1zGu9AAH/7uQT5pTXFTrQQi7rXtOJrVhw/iAguQQDLFO1wZk2Bjsuov8Dy8taMzLPOgFaoxbn+WRyEcqdxq7OVdHwi9HaLjHEDG5z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7122
X-Proofpoint-GUID: vIncJB3uf3H_L-GrG0_EW0aRmV2WAiE4
X-Proofpoint-ORIG-GUID: vIncJB3uf3H_L-GrG0_EW0aRmV2WAiE4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_09,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 mlxlogscore=853 phishscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111190076

DQoNCk9uIDE5LjExLjIxIDE1OjE2LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDUuMTEuMjAy
MSAwNzo1NiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBAQCAtOTUsMTAgKzEw
MiwyNSBAQCBpbnQgdnBjaV9hZGRfaGFuZGxlcnMoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiAg
ICAgICBJTklUX0xJU1RfSEVBRCgmcGRldi0+dnBjaS0+aGFuZGxlcnMpOw0KPj4gICAgICAgc3Bp
bl9sb2NrX2luaXQoJnBkZXYtPnZwY2ktPmxvY2spOw0KPj4gICANCj4+ICsgICAgaGVhZGVyID0g
JnBkZXYtPnZwY2ktPmhlYWRlcjsNCj4+ICsgICAgZm9yICggaSA9IDA7IGkgPCBBUlJBWV9TSVpF
KGhlYWRlci0+YmFycyk7IGkrKyApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIHN0cnVjdCB2cGNp
X2JhciAqYmFyID0gJmhlYWRlci0+YmFyc1tpXTsNCj4+ICsNCj4+ICsgICAgICAgIGJhci0+bWVt
ID0gcmFuZ2VzZXRfbmV3KE5VTEwsIE5VTEwsIDApOw0KPiBJIGRvbid0IHJlY2FsbCB3aHkgYW4g
YW5vbnltb3VzIHJhbmdlIHNldCB3YXMgY2hvc2VuIGJhY2sgYXQgdGhlIHRpbWUNCj4gd2hlbiB2
UENJIHdhcyBmaXJzdCBpbXBsZW1lbnRlZCwgYnV0IEkgdGhpbmsgdGhpcyBuZWVkcyB0byBiZSBj
aGFuZ2VkDQo+IG5vdyB0aGF0IERvbVUtcyBnZXQgc3VwcG9ydGVkLiBXaGV0aGVyIHlvdSBkbyBz
byByaWdodCBoZXJlIG9yIGluIGENCj4gcHJlcmVxIHBhdGNoIGlzIHNlY29uZGFyeSB0byBtZS4g
SXQgbWF5IGJlIGRlc2lyYWJsZSB0byBleGNsdWRlIHRoZW0NCj4gZnJvbSByYW5nZXNldF9kb21h
aW5fcHJpbnRrKCkgKHdoaWNoIHdvdWxkIGxpa2VseSByZXF1aXJlIGEgbmV3DQo+IFJBTkdFU0VU
Rl8qIGZsYWcpLCBidXQgSSB0aGluayBzdWNoIHJlc291cmNlcyBzaG91bGQgYmUgYXNzb2NpYXRl
ZA0KPiB3aXRoIHRoZWlyIGRvbWFpbnMuDQpXaGF0IHdvdWxkIGJlIHRoZSBwcm9wZXIgbmFtZSBm
b3Igc3VjaCBhIHJhbmdlIHNldCB0aGVuPw0KInZwY2lfYmFyIj8NCj4gSmFuDQo+DQpUaGFuayB5
b3UsDQpPbGVrc2FuZHI=

