Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF504A487E
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 14:42:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263106.455685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEWwK-0006hB-IV; Mon, 31 Jan 2022 13:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263106.455685; Mon, 31 Jan 2022 13:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEWwK-0006dx-FD; Mon, 31 Jan 2022 13:41:52 +0000
Received: by outflank-mailman (input) for mailman id 263106;
 Mon, 31 Jan 2022 13:41:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9o41=SP=epam.com=prvs=4030d24c28=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nEWwI-0006cY-Ej
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 13:41:50 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 894ae853-829b-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 14:41:48 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20VCwDXK014021;
 Mon, 31 Jan 2022 13:41:44 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2055.outbound.protection.outlook.com [104.47.1.55])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dxbec9c06-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 13:41:44 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by PAXPR03MB7763.eurprd03.prod.outlook.com (2603:10a6:102:209::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Mon, 31 Jan
 2022 13:41:39 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 13:41:39 +0000
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
X-Inumbo-ID: 894ae853-829b-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GpxQ2eI5h7dJxEMo8WjrlccsVw3xXo2ckVBHKudSWdtGRkS/lbKIL0CcI9XeSAfUglVQCntLY207Oy0dCusT+/vGgAv6LchZtaRpsaObkVX0d95A9F1rC/kzaI4L9KQ/jj1fc9hXTTdp0F4uGhfDhdnPXl83Uwc1K7LKZQHZ25oRwgb+4eiBF/PbumEWDaTVaM9IhZQCr8fl34cOFOL9grMzm/wP6pPCNmZqnmBCiC9aKBMMPZHUqzsv+VqPSN8p2whstI5MakNMvmIXNskRcKYchLZtuY9sSkejgsG/vGnxZ39PrXTDS9MTLTsUmjjAE9MRcVtVpLTEQAHxmAAvng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r6aSQR8yWXogU0YXpl8wHMKZdaFhSqq05PAe/YsnMKQ=;
 b=mDJplXBLHoL4hglbRpoF/Z8RxqvZj4TpnIeDhf41nXU47Mo/bF/G0zuWouqGtSe1rEa9aismgG8lBrUyO/7VQzAVVMpzo9kkmicIa7lt37vkOMZ7KpZcr6tUtvP6rPQODZdhzTeE/n6USjxp+ct9TB1PGgnemU0GuCsH885mrfwbPgK7PhKq8/zL073vj9lpUE/WcpCsQVvTra0Sv66x+xkSKVhwdMEuDXb2xUf1kYkXoPKvem53/Q+D/rHgugrQV1SQlFjEgeTjXMbonacNMMBG6o6OU/yC7iCt7lgS1ha9kNbqdSXKkC5s114EtPe0JDBCJLfoVIEA6gWMVzwlog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6aSQR8yWXogU0YXpl8wHMKZdaFhSqq05PAe/YsnMKQ=;
 b=N+jMFAezveoQMj6i4KH8jUF/6/fZATR5XBOSpX5W6P5nQ8PmCBajpipMLxdE1HhkCe7MN/bThgo36krjKsyjQUSvrFbGjeHbc0UMYJ2rPRcmmbeQwsGKPnDMIa7CU8ed82UoJh/YGRkvzzjIz9mv+iCz7pwRlt+JRppaD4BrcFPV6yF+r35D/7UYhQoQDA87MURvA6kH8QbH3tFSr9oF0I7oohPGmiHWc+t1NEi6iKJiQTI3hfwqW5eXi4jmYNuh5mUyTf5Y6dWg+xcmawU9WUAJwlOXrk+P23JHNdPIIXfXJpD+svPDadDWgWHN6PHQf7WVsRXu8E1MS20PbBLvYA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
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
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Topic: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Index: 
 AQHX4ewHyWAyD811HEGp8pIjUuVWNaxfndGAgB2tWgCAAA7+AIAACECAgAADxgCAAARsgIAAHxiAgAABegCAAAGFAA==
Date: Mon, 31 Jan 2022 13:41:39 +0000
Message-ID: <39966ef4-ed69-3bf5-ef6b-a4790c7164a2@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com> <Yd7K+9fvnBz+WTXA@Air-de-Roger>
 <77c00154-646c-a2a3-98cb-be4324003446@epam.com>
 <c7e87ebd-2c56-d510-b08b-02d53f9158d1@epam.com>
 <YffDmW4JGk+iDIVF@Air-de-Roger>
 <6d1772b1-25f1-0f63-8b8a-5dfaf94b2953@epam.com>
 <36fe9000-87a8-eefd-9baf-331bf4bbf1ad@suse.com>
 <0b20be9a-61e6-d286-b379-92c29ee9a804@epam.com>
 <2cfb6134-ab5e-3231-45f4-692c31302b1e@suse.com>
In-Reply-To: <2cfb6134-ab5e-3231-45f4-692c31302b1e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12db8921-ed9a-44c3-1a87-08d9e4bf688a
x-ms-traffictypediagnostic: PAXPR03MB7763:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PAXPR03MB77637E0B9039D772E2B2B0C7E7259@PAXPR03MB7763.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 wuirACQvoS7kpL4X6IJ+UZZ3OMT2iajzF4hdagYW2zx7WyrFQ8poudoEwkcN+jTsDHQJLIGZsliWopaj6/P9+/xPlw0Mr64PnFeUSdetjWDmJ5NyhVUMAC2bTOSZTNnvxZRP1J3J3ab70761d9Im2Ljw/TUi+e0ig0RqqQlOU8tU4PYXFDLAUIDkn/vQXt2ne9oLU83LnpCZG0+IDj/lbisC/XxnRhgiX9II98VwTO0ZJrVMghUatZmdSqY559SiyDu+ed7DFRriJHGFIK/xrD7XpGY+T8qFYJZoxbdpxXvd/NVSUgY82Mi0MLvbuVfJ5D8ufbPVLac7+O9uBq3iLC1xmKGwBI9Ir1d6UeBPwL4Xk2jvhiIARnfXymWIGw6/lGcQfrADSspA+JMWLUf0y5l+LWamW0hvWwOfbGCZG0n95xVrglhG2toxanQzT3RBmQGyUj6VNspkal4D90gQW2LyMHJ7cNhw9abNky4czohqDwh3FgFHOpD8L10tY0bq6znDe1RVsONPurGjeo7/My2JsNE1U1P310wZ56SBSg9JVH+UXovSKxz/apMC6X8RgjcpI6e2BFqEgv4dsSWotdqj1I/Jm5i4eaNtznxg792tegK/26ww2VvtoOyxIVyoyxyT0PlLxLgNbE7afmIdJh1sbM0J705RIlKeZ9Dc8Q6PaF0vtEAYObzcXMRZ/lOLc41OnHso2iYLKrpKq8IaZpfkFRdrV7nuHvhmto8g59OHs3vo8gQs/bzE47WIjoGu
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31696002)(86362001)(64756008)(76116006)(38070700005)(31686004)(6916009)(54906003)(66556008)(66946007)(66476007)(508600001)(6486002)(8936002)(4326008)(8676002)(7416002)(66446008)(5660300002)(316002)(122000001)(38100700002)(6506007)(53546011)(36756003)(71200400001)(2906002)(91956017)(2616005)(83380400001)(6512007)(186003)(26005)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dWF1ZFo1d0kxbDE0OTZuV1NiRXIrWnZsODQ0WG5KUWI4bHd5WW55ZjZyRkJi?=
 =?utf-8?B?NkdzOFltdGNzZTdMVGJZaUdXRFNWSk5IMFY1UnZGTlRmOWR0bFVISmVQNVZl?=
 =?utf-8?B?TXhiT2phVm5OUDJ2RlNQeWZ0NXNkSTdhalRLWkU3MVdKYXQzTmFhZU10TTFL?=
 =?utf-8?B?RjNERWhDcVZ6RnI3NUtXdlpIODUvVzBXanNVdVFHOFlvU0Fma0lvSy9mcjVy?=
 =?utf-8?B?TEE3R3MwQ1ZUNnM2QktqemtRcUo5b0VtMVh1WnI2byt3djgrT1g0Y3FMc0h3?=
 =?utf-8?B?SUR4bXRaNUxFRFlLdU01a01MME9kdnRhU0VzdUZkVGRmckNrSlNybXZjSGpz?=
 =?utf-8?B?OE9WRkE4ZG94TUtoRlVocWlGMXVCZWI5QlV6amhhVE5ZRHo3TEQybGpFaVpz?=
 =?utf-8?B?Zm5acnNIWk9jVUU0QjdJMFlPOHMzWElLUkYwQmdyR1hXS1hVa3F0TjgzM2FB?=
 =?utf-8?B?Wk8yYlEwc0pLaGdVSFJpNXJvUjM1YVg0TFVJR2k5WkpUZ3VsbjVnaU9aYXU3?=
 =?utf-8?B?UFBSeTU3VTRtSDgxYXhURFlsNHF3WHIrUVRMVmw5ZmxWSWFqM1NTOXFIOVhQ?=
 =?utf-8?B?bjB5TlJoOVZUK0wyZ3BNWFpjOHhWOHlDS0Y1bTZxSlV2cWNkZXhJbEswSlRQ?=
 =?utf-8?B?TGRWQ1lkZFUxc2REUitLbFlIakhaZmhteDczVHhSZ0MzYjd5OFRhRXZ6MGNI?=
 =?utf-8?B?YXZjMU03d2dsMGR4L0Exem80T0xhT1B2ZnZBQXBjbU5TK2RaUE41Sk82b2JK?=
 =?utf-8?B?N3UzVUhuNytHektJcEV1Mi91a1JLTi9TU2ZIUUU5SkUxazZ6UEVVYmJZUkgv?=
 =?utf-8?B?c0ZhZ1hhOGJuMTd2NWwxUmsvM1dvWEg3aWtKQnRENFFLaUF5cFlZS0t4akc2?=
 =?utf-8?B?Mk41U0FGa0k0c0UxR1BGYVl2UlZBaEowcDRTNk1kSGVSSTRXZTZhY2JBU1Q1?=
 =?utf-8?B?eGFkZ0Vyd1kwR1JRb1h6c21tUG5GTm4rK08yR2FiT0plRitndzBxMjBWTmEz?=
 =?utf-8?B?RkZ3Vlk5T1o3L0pSYW5LYXRzb3pIRURyakkraERwSUtHekFsRCtUMlFnek0y?=
 =?utf-8?B?NXhZNXdxbDNxbEFYSkMrSm9sT2JOVE1EQTV3cERTOExjWStJWUZSd1NpQWN4?=
 =?utf-8?B?QXJHMElvdmVENi92R1FmelUvZkdqWnQ0ak1GUFp0NStpUWxMcnAxSHVvZTJY?=
 =?utf-8?B?bkZwVldjTXR3QitmcTM5QndlUytudFE1a0lnNjd5T0x6S1ZBU29jMW1rRmJu?=
 =?utf-8?B?WCszNFY3Q2s1OUs0UWlieVRSMm84azduTUV2RXB0aEs1YW55UFJ2L1JwYkdB?=
 =?utf-8?B?ZU9zNFpncFdudzYrdnJTOXZ0emV1Qzk2VW1VaWliclBCaUZUUDc5andRRlhU?=
 =?utf-8?B?SVBTdncvd0lyR1VxL1JtMUxPeVQ2NGNESDJjOWViRVpudXpMck1QUENmR3kx?=
 =?utf-8?B?V1VVUDk4NENsckxpUUtqUGErS1pOdnU0QWFueDFNQ1VzaEJJWStiOTZ2YUxt?=
 =?utf-8?B?aTdySUZqVFVSU0dBWmcxOFdvdHc2RUJqUDJJT1FwUnBzL1lVNEhsQU1XNURL?=
 =?utf-8?B?cXZVV1J2TENyTEhxeE5iaURaRDlmQTdRQS9ITE5pR3I5Wnp3SFJNaHFUZ1pD?=
 =?utf-8?B?K2k5akh0cVU2dXhnZVJmNmg2VFBYdjBtWEp4eW5WODFFekt3b0ZpeURGanJF?=
 =?utf-8?B?dW1WMHFxZEJKaGI1RXhUZU9RUHNpRWg1OW1jMVlmS0FyYkllNGQ4RDBhMEFU?=
 =?utf-8?B?MlUvQkhhT1BvdUtwczZKSkpVTllQcWhvdE5lZGxUeXlodmwrNzFMLzZjSWht?=
 =?utf-8?B?MDhSVXlCa1ErYUFYTDFsM1B4NmdZRXJqV0o2SDZ2Ylp5bG81RGFPYUgxYTho?=
 =?utf-8?B?VGpQTlZ1UmcvSkxCNE1FYzBobUV1T1NmQytLUU5xdTkveUx2WDBsajUxT2N1?=
 =?utf-8?B?czdoaW1ZNnZGUFBGT1EwZlRjbG1LYU9IZ3dFUzBXWmQ0TktFN1E3SHFoU3d1?=
 =?utf-8?B?alE1c2tSRDhlSUdxTGZKVk1pK1AvY0s0eHFaR2VZT3ZDTlNjWGFBMElaY3BI?=
 =?utf-8?B?Tnk4NHVMeDdJQ2p2NFFtU2lQVytRNnY4OEd6cHB2VDhkd3VHclo1d0lTQ1ls?=
 =?utf-8?B?dFpVckd2RFFBMlloUUNRckwxSXRwWXZtLzRab2tybG9ZK1VmOEl1MFFKUk1j?=
 =?utf-8?B?a0F4cENDc1pRanJoZ2Z4c2pEWjBmbHgrV1F0Q2lwVHQyU0t5TURiZ3JkVUJC?=
 =?utf-8?B?QkJPaUhjNmtkZzFManVnQmVkMDVLWGYrK08wbDVjZEdYdjFHeHRDTVNlVUM1?=
 =?utf-8?B?Wm5GdGtvTnJaR0h6YlM0SjNFZmppQ1ROOWFOWXovZ0dibnFCWk8zdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C220B128BD4645469E7AFE4E0B579E68@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12db8921-ed9a-44c3-1a87-08d9e4bf688a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 13:41:39.2934
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lfjBcq+5/c/JCIiUhk9QXWwNiactvXzFvNFAANk9+lVyggkIJzqYjGCwblr35jKXKwznVrAojDdcY6sgCWZsrfeYeOg/dhOOEFAHY8K2gMbEiE0tePCtwCTzejzTS+5C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7763
X-Proofpoint-GUID: NQxeXQ3bSAurcRYwxXF4p5-wag-QTysy
X-Proofpoint-ORIG-GUID: NQxeXQ3bSAurcRYwxXF4p5-wag-QTysy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_05,2022-01-31_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 adultscore=0 priorityscore=1501 mlxlogscore=812
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201310091

DQoNCk9uIDMxLjAxLjIyIDE1OjM2LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMzEuMDEuMjAy
MiAxNDozMCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4gT24gMzEuMDEu
MjIgMTM6MzksIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDMxLjAxLjIwMjIgMTI6MjMsIE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAzMS4wMS4yMiAxMzoxMCwgUm9n
ZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+Pj4+IFJpZ2h0IChzZWUgbXkgcHJldmlvdXMgcmVwbHkg
dG8gdGhpcyBjb21tZW50KS4gSSB0aGluayBpdCB3b3VsZCBiZQ0KPj4+Pj4gZWFzaWVyIChhbmQg
Y2xlYW5lcikgaWYgeW91IHN3aXRjaGVkIHRoZSBkZWZhdWx0IGJlaGF2aW9yIHJlZ2FyZGluZw0K
Pj4+Pj4gdW5oYW5kbGVkIHJlZ2lzdGVyIGFjY2VzcyBmb3IgZG9tVXMgYXQgdGhlIHN0YXJ0IG9m
IHRoZSBzZXJpZXMgKGRyb3ANCj4+Pj4+IHdyaXRlcywgcmVhZHMgcmV0dXJucyB+MCksIGFuZCB0
aGVuIHlvdSB3b24ndCBuZWVkIHRvIGFkZCBhbGwgdGhvc2UNCj4+Pj4+IGR1bW15IGhhbmRsZXIg
dG8gZHJvcCB3cml0ZXMgYW5kIHJldHVybiB+MCBmb3IgcmVhZHMuDQo+Pj4+Pg0KPj4+Pj4gSXQn
cyBnb2luZyB0byBiZSBtb3JlIHdvcmsgaW5pdGlhbGx5IGFzIHlvdSB3b3VsZCBuZWVkIHRvIHN1
cHBvcnQNCj4+Pj4+IHBhc3N0aHJvdWdoIG9mIG1vcmUgcmVnaXN0ZXJzLCBidXQgaXQncyB0aGUg
cmlnaHQgYXBwcm9hY2ggdGhhdCB3ZQ0KPj4+Pj4gbmVlZCBpbXBsZW1lbnRhdGlvbiB3aXNlLg0K
Pj4+PiBXaGlsZSBJIGFncmVlIGluIGdlbmVyYWwsIHRoaXMgZWZmZWN0aXZlbHkgbWVhbnMgdGhh
dCBJJ2xsIG5lZWQgdG8gcHJvdmlkZQ0KPj4+PiBoYW5kbGluZyBmb3IgYWxsIFBDSWUgcmVnaXN0
ZXJzIGFuZCBjYXBhYmlsaXRpZXMgZnJvbSB0aGUgdmVyeSBzdGFydC4NCj4+Pj4gT3RoZXJ3aXNl
IG5vIGd1ZXN0IGJlIGFibGUgdG8gcHJvcGVybHkgaW5pdGlhbGl6ZSBhIFBDSSBkZXZpY2Ugd2l0
aG91dCB0aGF0Lg0KPj4+PiBPZiBjb3Vyc2UsIHdlIG1heSB3YW50IHN0YXJ0aW5nIGZyb20gc3R1
YnMgaW5zdGVhZCBvZiBwcm9wZXIgZW11bGF0aW9uLA0KPj4+PiB3aGljaCB3aWxsIGRpcmVjdCB0
aGUgYWNjZXNzIHRvIHJlYWwgSFcgYW5kIGxhdGVyIG9uIHdlIGFkZCBwcm9wZXIgZW11bGF0aW9u
Lg0KPj4+PiBCdXQsIGFnYWluLCB0aGlzIGlzIGdvaW5nIHRvIGJlIGEgcmF0aGVyIGJpZyBwaWVj
ZSBvZiBjb2RlIHdoZXJlIHdlIG5lZWQNCj4+Pj4gdG8gZXhwbGljaXRseSBoYW5kbGUgZXZlcnkg
cG9zc2libGUgY2FwYWJpbGl0eS4NCj4+PiBTaW5jZSB0aGUgdHdvIHN1Yi10aHJlYWRzIGFyZSBu
b3cgYWJvdXQgZXhhY3RseSB0aGUgc2FtZSB0b3BpYywgSSdtDQo+Pj4gYW5zd2VyaW5nIGhlcmUg
aW5zdGVhZCBvZiB0aGVyZS4NCj4+Pg0KPj4+IE5vLCB5b3UgYXJlIG5vdCBnb2luZyB0byBuZWVk
IHRvIGVtdWxhdGUgYWxsIHBvc3NpYmxlIGNhcGFiaWxpdGllcy4NCj4+PiBXZSAob3IgcmVhbGx5
IHFlbXUpIGRvbid0IGRvIHRoaXMgb24geDg2IGVpdGhlci4gQ2VydGFpbiBjYXBhYmlsaXRpZXMN
Cj4+PiBtYXkgYmUgYSBtdXN0LCBidXQgbm90IGV2ZXJ5dGhpbmcuIFRoZXJlIGFyZSBhbHNvIGRl
dmljZSBzcGVjaWZpYw0KPj4+IHJlZ2lzdGVycyBub3QgY292ZXJlZCBieSBhbnkgY2FwYWJpbGl0
eSBzdHJ1Y3R1cmVzIC0gd2hhdCB0byBkbyB3aXRoDQo+Pj4gdGhvc2UgaXMgZXZlbiBtb3JlIG9m
IGEgcXVlc3Rpb24uDQo+Pj4NCj4+PiBGdXJ0aGVybW9yZSBmb3Igc29tZSBvZiB0aGUgZmllbGRz
IGp1c3RpZmljYXRpb24gd2h5IGFjY2VzcyB0byB0aGUNCj4+PiByYXcgaGFyZHdhcmUgdmFsdWUg
aXMgZmluZSBpcyBnb2luZyB0byBiZSBlYXN5OiByL28gZmllbGRzIGxpa2UNCj4+PiB2ZW5kb3Ig
YW5kIGRldmljZSBJRCwgZm9yIGV4YW1wbGUuIEJ1dCBldmVyeSBiaXQgeW91IGFsbG93IGRpcmVj
dA0KPj4+IGFjY2VzcyB0byBuZWVkcyB0byBjb21lIHdpdGgganVzdGlmaWNhdGlvbi4NCj4+Pg0K
Pj4+PiBBdCB0aGUgbW9tZW50IHdlIGFyZSBub3QgZ29pbmcgdG8gY2xhaW0gdGhhdCB2UENJIHBy
b3ZpZGVzIGFsbCBtZWFucyB0bw0KPj4+PiBwYXNzIHRocm91Z2ggYSBQQ0kgZGV2aWNlIHNhZmVs
eSB3aXRoIHRoaXMgcmVzcGVjdCBhbmQgdGhpcyBpcyB3aHkgdGhlIGZlYXR1cmUNCj4+Pj4gaXRz
ZWxmIHdvbid0IGV2ZW4gYmUgYSB0ZWNoIHByZXZpZXcgeWV0LiBGb3IgdGhhdCByZWFzb24gSSB0
aGluayB3ZSBjYW4gc3RpbGwNCj4+Pj4gaGF2ZSBpbXBsZW1lbnRlZCBvbmx5IGNydWNpYWwgc2V0
IG9mIGhhbmRsZXJzIGFuZCBzdGlsbCBhbGxvdyB0aGUgcmVzdCB0bw0KPj4+PiBiZSByZWFkL3dy
aXRlIGRpcmVjdGx5IHdpdGhvdXQgZW11bGF0aW9uLg0KPj4+IEkgdGhpbmsgeW91IG5lZWQgdG8g
c2VwYXJhdGUgd2hhdCB5b3UgbmVlZCBmb3IgZGV2ZWxvcG1lbnQgZnJvbSB3aGF0DQo+Pj4gZ29l
cyB1cHN0cmVhbTogRm9yIGRldiBwdXJwb3NlcyB5b3UgY2FuIHZlcnkgd2VsbCBpbnZlcnQgdGhl
IHBvbGljeQ0KPj4+IGZyb20gd2hpdGUtIHRvIGJsYWNrLWxpc3RpbmcuIEJ1dCBpZiB3ZSBhY2Nl
cHRlZCB0aGUgbGF0dGVyIGludG8gdGhlDQo+Pj4gbWFpbiB0cmVlLCB0aGUgcmlzayB3b3VsZCBi
ZSB0aGVyZSB0aGF0IHNvbWV0aGluZyBnZXRzIG1pc3NlZCBhdCB0aGUNCj4+PiB0aW1lIHdoZXJl
IHRoZSBwZXJtaXNzaW9uIG1vZGVsIGdldHMgY2hhbmdlZCBhcm91bmQuDQo+Pj4NCj4+PiBZb3Ug
Y291bGQgZXZlbiBoYXZlIGEgbm9uLWRlZmF1bHQgbW9kZSBvcGVyYXRpbmcgdGhlIHdheSB5b3Ug
d2FudCBpdA0KPj4+IChhbG9uZyB0aGUgbGluZXMgb2YgcGNpYmFjaydzIHBlcm1pc3NpdmUgbW9k
ZSksIGFsbG93aW5nIHlvdSB0byBnZXQNCj4+PiBhd2F5IHdpdGhvdXQgbmVlZGluZyB0byBjYXJy
eSBwcml2YXRlIHBhdGNoZXMuIFRoaW5ncyBtYXkgYWxzbw0KPj4+IGluaXRpYWxseSBvbmx5IHdv
cmsgaW4gdGhhdCBtb2RlLiBCdXQgdGhlIGRlZmF1bHQgc2hvdWxkIGJlIGEgbW9kZQ0KPj4+IHdo
aWNoIGlzIHNlY3VyZSAoYW5kIHdoaWNoIHBlcmhhcHMgaW5pdGlhbGx5IG9mZmVycyBvbmx5IHZl
cnkgbGltaXRlZA0KPj4+IGZ1bmN0aW9uYWxpdHkpLg0KPj4gT2ssIHNvIHRvIG1ha2UgaXQgY2xl
YXI6DQo+PiAxLiBXZSBkbyBub3QgYWxsb3cgdW5oYW5kbGVkIGFjY2VzcyBmb3IgZ3Vlc3RzOiBm
b3IgdGhhdCBJIHdpbGwgY3JlYXRlIGENCj4+IGRlZGljYXRlZCBwYXRjaCB3aGljaCB3aWxsIGlt
cGxlbWVudCBzdWNoIHJlc3RyaWN0aW9ucy4gU29tZXRoaW5nIGxpa2UNCj4+IHRoZSBiZWxvdyAo
Zm9yIGJvdGggdlBDSSByZWFkIGFuZCB3cml0ZSk6DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9k
cml2ZXJzL3ZwY2kvdnBjaS5jIGIveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMNCj4+IGluZGV4IGM1
ZTY3NDkxYzI0Zi4uOWVmMmExYjVhZjU4IDEwMDY0NA0KPj4gLS0tIGEveGVuL2RyaXZlcnMvdnBj
aS92cGNpLmMNCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+PiBAQCAtMzQ3LDYg
KzM0Nyw3IEBAIHVpbnQzMl90IHZwY2lfcmVhZChwY2lfc2JkZl90IHNiZGYsIHVuc2lnbmVkIGlu
dCByZWcsIHVuc2lnbmVkIGludCBzaXplKQ0KPj4gICDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgdnBj
aV9yZWdpc3RlciAqcjsNCj4+ICAgwqDCoMKgwqAgdW5zaWduZWQgaW50IGRhdGFfb2Zmc2V0ID0g
MDsNCj4+ICAgwqDCoMKgwqAgdWludDMyX3QgZGF0YSA9IH4odWludDMyX3QpMDsNCj4+ICvCoMKg
wqAgYm9vbCBoYW5kbGVkID0gZmFsc2U7DQo+Pg0KPj4gICDCoMKgwqDCoCBpZiAoICFzaXplICkN
Cj4+ICAgwqDCoMKgwqAgew0KPj4gQEAgLTQwNSw2ICs0MDYsOCBAQCB1aW50MzJfdCB2cGNpX3Jl
YWQocGNpX3NiZGZfdCBzYmRmLCB1bnNpZ25lZCBpbnQgcmVnLCB1bnNpZ25lZCBpbnQgc2l6ZSkN
Cj4+ICAgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIGNtcCA+IDAgKQ0KPj4gICDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgY29udGludWU7DQo+Pg0KPj4gK8KgwqDCoMKgwqDCoMKgIGhhbmRsZWQgPSB0
cnVlOyAvKiBGb3VuZCB0aGUgaGFuZGxlciBmb3IgdGhpcyBhY2Nlc3MuICovDQo+PiArDQo+PiAg
IMKgwqDCoMKgwqDCoMKgwqAgaWYgKCBlbXUub2Zmc2V0IDwgci0+b2Zmc2V0ICkNCj4+ICAgwqDC
oMKgwqDCoMKgwqDCoCB7DQo+PiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBIZWFkaW5n
IGdhcCwgcmVhZCBwYXJ0aWFsIGNvbnRlbnQgZnJvbSBoYXJkd2FyZS4gKi8NCj4+IEBAIC00MzIs
NiArNDM1LDEwIEBAIHVpbnQzMl90IHZwY2lfcmVhZChwY2lfc2JkZl90IHNiZGYsIHVuc2lnbmVk
IGludCByZWcsIHVuc2lnbmVkIGludCBzaXplKQ0KPj4gICDCoMKgwqDCoCB9DQo+PiAgIMKgwqDC
oMKgIHNwaW5fdW5sb2NrKCZwZGV2LT52cGNpX2xvY2spOw0KPj4NCj4+ICvCoMKgwqAgLyogQWxs
IHVuaGFuZGxlZCBndWVzdCByZXF1ZXN0cyByZXR1cm4gYWxsIDEncy4gKi8NCj4+ICvCoMKgwqAg
aWYgKCAhaXNfaGFyZHdhcmVfZG9tYWluKGQpICYmICFoYW5kbGVkICkNCj4+ICvCoMKgwqDCoMKg
wqDCoCByZXR1cm4gfih1aW50MzJfdCkwOw0KPj4gKw0KPj4gICDCoMKgwqDCoCBpZiAoIGRhdGFf
b2Zmc2V0IDwgc2l6ZSApDQo+PiAgIMKgwqDCoMKgIHsNCj4+ICAgwqDCoMKgwqDCoMKgwqDCoCAv
KiBUYWlsaW5nIGdhcCwgcmVhZCB0aGUgcmVtYWluaW5nLiAqLw0KPiBFeGNlcHQgdGhhdCBsaWtl
IGZvciB0aGUgInRhaWxpbmcgZ2FwIiB5b3UgYWxzbyBuZWVkIHRvIGF2b2lkIHRoZQ0KPiAiaGVh
ZGluZyBnYXAiIGVuZGluZyB1cCBpbiBhIHJlYWQgb2YgdGhlIHVuZGVybHlpbmcgaGFyZHdhcmUN
Cj4gcmVnaXN0ZXIuIEVmZmVjdGl2ZWx5IHlvdSB3YW50IHRvIGRlYWwgcHJvcGVybHkgd2l0aCBh
bGwNCj4gdnBjaV9yZWFkX2h3KCkgaW52b2NhdGlvbnMgKGluY2x1ZGluZyB0aGUgb25lIHdoZW4g
bm8gcGRldiB3YXMNCj4gZm91bmQsIHdoaWNoIGZvciBhIERvbVUgbWF5IHNpbXBseSBtZWFuIGRv
bWFpbl9jcmFzaCgpKS4NClllcy4gQW5kIHdpdGggdGhlIGFib3ZlIHBhdGNoIEkgY2FuIG5vdyBy
ZW1vdmUgdGhlICJUT0RPIHBhdGNoIiB0aGVuPw0KQmVjYXVzZSBpdCBpcyBzYXlpbmcgdGhhdCB3
ZSBhbGxvdyBhY2Nlc3MgdG8gdGhlIHJlZ2lzdGVycywgYnV0IGl0IGlzIG5vdCBzYWZlLg0KQW5k
IG5vdywgaWYgd2UgZGlzYWJsZSB0aGF0IGFjY2VzcywgdGhlbiBUT0RPIHNob3VsZCBiZSBhYm91
dCB0aGUgbmVlZCB0bw0KaW1wbGVtZW50IGVtdWxhdGlvbiBmb3IgYWxsIHRoZSByZWdpc3RlcnMg
d2hpY2ggYXJlIG5vdCB5ZXQgaGFuZGxlZCB3aGljaCBpcw0Kb2J2aW91cy4NCj4NCj4gSmFuDQo+
DQpUaGFuayB5b3UsDQpPbGVrc2FuZHI=

