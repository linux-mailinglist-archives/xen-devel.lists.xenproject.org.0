Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 876B43FCDC4
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 21:54:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175945.320341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL9px-0008Lo-JT; Tue, 31 Aug 2021 19:54:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175945.320341; Tue, 31 Aug 2021 19:54:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL9px-0008J8-GS; Tue, 31 Aug 2021 19:54:25 +0000
Received: by outflank-mailman (input) for mailman id 175945;
 Tue, 31 Aug 2021 19:54:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IVWi=NW=epam.com=prvs=9877576b21=roman_skakun@srs-us1.protection.inumbo.net>)
 id 1mL9pw-0008J2-3m
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 19:54:24 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c3214cc-0a95-11ec-ad83-12813bfff9fa;
 Tue, 31 Aug 2021 19:54:22 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17VIuZkP025660; 
 Tue, 31 Aug 2021 19:54:19 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50])
 by mx0a-0039f301.pphosted.com with ESMTP id 3asnvh10d1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Aug 2021 19:54:19 +0000
Received: from AM7PR03MB6593.eurprd03.prod.outlook.com (2603:10a6:20b:1b4::10)
 by AS8PR03MB7127.eurprd03.prod.outlook.com (2603:10a6:20b:29d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Tue, 31 Aug
 2021 19:54:15 +0000
Received: from AM7PR03MB6593.eurprd03.prod.outlook.com
 ([fe80::7cb2:a2bc:d477:683d]) by AM7PR03MB6593.eurprd03.prod.outlook.com
 ([fe80::7cb2:a2bc:d477:683d%9]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 19:54:15 +0000
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
X-Inumbo-ID: 3c3214cc-0a95-11ec-ad83-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DlJlAJBINhEkjaZ2HoesFo6PtA1LV1zcQmePsaGr3Tn+mfRx20BAfz4tDlTeb5avMPGsUQOLdpCzoDWqP+voFaR981u+/t4dXDncZ4j7vZJCxfuHyB/RUUrpXg8kF1WjNrNYGJ1Eha6e8hTMebCkHk0GMg9ibN10TzxxMZdFCORONHVuPfGi6M1wqMbRsGCklm82wmQpXjXgfs3RiWVQ/LAfOlVKBPuTiiV6q8nd6dIosF/G8uYyw0oSXrIundkpxsob6xnvcmAy8SNGxcaqUz7EgzbXnkCYNfXkH4cNSCycDfJ/VYZGfowf3Jvd5TNeiPZS7i3B49FF2C8AcePpqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=nDLNefUNb4PsIQ89YPEUs7LFlJsYZuT9SUaTQZvUryY=;
 b=L5sPeqdLXDTDMvb+E3oV/AnQzPYvEl9fSPAi2Q3Dtl/4/W6gq3bG/AhftDe3kfw6GyNWBgrJ/CSnbtZldvh14naR+kAApQ16NlaJy4UQxF5NdgSXTiDpFAnI91Ko/Y/NjLOn3gtcOJ75C5bdimjZ4NdiDMUb+Mcb8Rsx3DU1cMN/rE3kPLrc2FyU3XPK/+6iNjsyaxHUnKLHXOjz0eMeso5xh6OmHYf2F2amIxX7ki5Vph1bAWfhTrIgvntnEl7NEAGslZocmlU1F65AuvTkZWLq0jcBV85IkktVDwKKgJFnNdOu53GqO/WRbzBA5QlXkty364pwJYcuWDXbSqGYmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDLNefUNb4PsIQ89YPEUs7LFlJsYZuT9SUaTQZvUryY=;
 b=VvJyA0aVpXQIBfoHCO/s0UXbsr+abVyGNlh+W+/rP//QzmOxZlhPyHyXbW+EufrmLtubGPkwPomxEdPf/Stlcc7W53VRtZ8jhVcubjnlkM3Tw5/NNCcVOzmKo3g/vIH0nEBL3SV5ql1TxTHeDNYpuUgVQtsS4nXbT28PjmYTOmDux2enME7i5FCxT5L2Z13oh8SyXd/gLY2thtUIegPEXIdor5gmyljRJhzrDVx09ZsbahVo+leb6U6eRKiSOIsYZzEhk7vBGJTP/nCjo9Gy6ljN39k+bime6errhwsCIXsz6IalMJbpey4mUZF9DKTzNoOhf5RswMXDKlCk9t7X1Q==
From: Roman Skakun <Roman_Skakun@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Andrii Anisov <Andrii_Anisov@epam.com>,
        Roman
 Skakun <rm.skakun@gmail.com>,
        Roman Skakun <Roman_Skakun@epam.com>
Subject: Disable IOMMU in Dom0
Thread-Topic: Disable IOMMU in Dom0
Thread-Index: AQHXnnd7IVjUu+L6S0mPq9naNxJ1FQ==
Date: Tue, 31 Aug 2021 19:54:15 +0000
Message-ID: 
 <AM7PR03MB65936E5D0B25567D1B2FAECA85CC9@AM7PR03MB6593.eurprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e946b38-8d2c-4edd-c561-08d96cb91cb6
x-ms-traffictypediagnostic: AS8PR03MB7127:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AS8PR03MB71272CFE1932A50CF27030A685CC9@AS8PR03MB7127.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 aConv2Jd1mvZlqGg9rE58WkeSOtK3D73wOXwUvBDdP9CghiLRB4SAuyW1b0V4eVEOL4TP8/V9yBXp6PnHU8UZmcWTfx7ahOSZRPKPEgiaRmYVsBgAhupRDBW8zu2muY9HC+SGN5bKED2cdcb/Xsxj37uTudBW8pNa/ANJx1vidEkqJ/Z+Xa/ystXeN0dd+wAxqsHy8p1JPvBYaOuxROJ/OKWsrp2RD0SWWa692x4SWsuR+Na3KXK3rejDqQ/gvByE+bc8ZG2MFmxpBRkePiPa4Y5xedXGVhM5GseAgq4GfMoKTiWkPsQmreDc4IdQs8VRQo5rWv7MgjHX2/dq1scpFxVaFWtJeYS7Wqcb+dBdmY0QTuTTwqnODTUkNrnRI//ew7y/ILRwPKIPDIEhasJokIb/Z5I/AzMppLvTgbUsWfTeJ/zxkTxIdWItvNG7Od2NjVEuPXOU9jH1664lAbX91bhNyVao4+HboRu+7bFUoZhxp8VNNsPM+RBLl/gttQRorChYULPJPsVaSd/7Q9kfIi6E32yS0aTtNmyosaHMKW4akBz+ORjn8frT+ydH+/3T7QAJ2I/ajuKeZiQeVQbfr89T0aV9vhFmxasjRVYW9t+EOUqmSYA7RQO80bumvAg2UGo9dQqtIqU3SDapMTf3w/u31DL/J57lBRazgmodRp7mM7dNikLqOcA+TeTBPdP0jTBmzhOOY+PkJHOCNy0QqgLbns0ehhiulb69fFIjHTc+MIsbnxSF2+Ruap/a0LgbJE+1x3gBkVFJnYftbd4I/dt8VnF3GAELbJCcNeYbLU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6593.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(39860400002)(346002)(366004)(9686003)(54906003)(55016002)(38100700002)(107886003)(6916009)(33656002)(86362001)(83380400001)(66476007)(316002)(8936002)(8676002)(38070700005)(2906002)(66446008)(122000001)(478600001)(6506007)(26005)(71200400001)(966005)(66946007)(186003)(76116006)(4744005)(4326008)(66556008)(64756008)(7696005)(52536014)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?GioNeT5WIZbwMQ9nZpzfSWPhW2JEgg/yFx84A4xzKfBpDge7NomaMIUqDS?=
 =?iso-8859-1?Q?daOPgcFpA26dhJICFLT9rEjugb5j7uwnQitrZD9SltKgDVvik2neE1SqsK?=
 =?iso-8859-1?Q?jaF8hUw2rOjjGgflkyt/tkAfhdcGC/1rlKHMzOmmm7YdauDbQCtP1H1+ow?=
 =?iso-8859-1?Q?ECKu3m59AGCLja4Rw8gHyJ2nqtBX8XV9ibEliS1k/XZBlsXy+MEuABohfF?=
 =?iso-8859-1?Q?yg2BB2zmGZ2ypdD2akQA+zhERubBnnk0NhECq5Zo6H+C6BAWDfWOvkg1u/?=
 =?iso-8859-1?Q?4qcMFKiL2s4JNSwJrgiLRKZNHFmtyGdmqBlsqSqcH4ilOWVMETLXXUOgSn?=
 =?iso-8859-1?Q?fkfFSh8xRmtgF5Wi+hSToo17G6eJ+XUMTMgQSTroGrFTwSNTshi4bMkBuM?=
 =?iso-8859-1?Q?S4//sMKQJuNjaWq/y3wyomKlLpx9y6DJEKOHTcOtO5HsQTD8nZO/uIzzBu?=
 =?iso-8859-1?Q?fW369jDLiY2kgz3kKTNm/sQRvLJCI3agNJU6PVRy9H6ldIljygZpWsn9Ba?=
 =?iso-8859-1?Q?jGyL4opFHCRAXKGFtXpcY9NI1jMH4oza9csENa2nysMhiD3o36ZTWW2m4C?=
 =?iso-8859-1?Q?4mEA4GB6KBjYnqb4YAhU5BKTPr+VnpoKDLzGDC2Dhb2NncRiSpyeOerqqO?=
 =?iso-8859-1?Q?Ujzp3LAB/B/SEMu9BYLOTGZRl07ZoOarj2t8eKrXEr0wWAbhCTsphclcn9?=
 =?iso-8859-1?Q?MghLUsjgl64RS+0o0zyAe4YZqcBevO8XfEE4YV8krPIxqC+lnnjHbZlxO+?=
 =?iso-8859-1?Q?k2zap6Mt/HW63Iu/uzFZSXh+ZU/T7BBUp8IIV3oXUFobHi66z71uS7Gbql?=
 =?iso-8859-1?Q?Er/ak7H9hULWI2DXdi84LVOvygp3rQtdtXAKLu7IrY+WvjuLIm/lxFsLo1?=
 =?iso-8859-1?Q?4QSZPjy/kOpxeINUNtFWF5WSvBZ/DT65k8KAME/6M4mJtM1RaHGKkB5ySj?=
 =?iso-8859-1?Q?LbkrcpLtyxnc50Q3n8s1lnIJmO/cavP62LBI7EJ7YvCI5nQTFmVWFJnpX6?=
 =?iso-8859-1?Q?bNYN6V5MJYcmpYVASoLgCJaco7O1+HoY0AMiMSGOnBUU8xoqs8Dl2o6bvf?=
 =?iso-8859-1?Q?t2ZqsD84gWGSB+qb9F6Kjr8Dg8DrLHqURR63VT3Q+TDwpFPiOCP0Np1oRT?=
 =?iso-8859-1?Q?QAxdjuHt+GFeoVlVXsIPJCM2nziIZ1vtJxSg7+vnBomHd/VxWJ6Ys2MraG?=
 =?iso-8859-1?Q?S0i+sA8OI5+7E4z66fsjLcbD814qbFyw1MWSgPIG+J6x+q9vG0F7y9WIxH?=
 =?iso-8859-1?Q?ZI48WSgrVnJZYJkzyKoiLB3X7CfiVRc77ppK622aME8Emi+3+C2XlrI+iH?=
 =?iso-8859-1?Q?i5YZQtAosmPQaZTXV0In9e+MJ+ZscMrXZr3FgnHtB/B9FDkURmAPOeVats?=
 =?iso-8859-1?Q?ADdGZg+pD3?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6593.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e946b38-8d2c-4edd-c561-08d96cb91cb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2021 19:54:15.5030
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MMzjwB3hzjMvjaoSHe2x2a7et8bZhiLShBoUnLYXIATTK+t6majNiqDV0SgvX69xph4HwrEb2qx74AbDPxeHyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7127
X-Proofpoint-GUID: KQfq1wwSwjRwdGRgYUnKmuhUHRM53wOY
X-Proofpoint-ORIG-GUID: KQfq1wwSwjRwdGRgYUnKmuhUHRM53wOY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-31_09,2021-08-31_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxlogscore=582 mlxscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108310107

Hi, Stefano!=0A=
=0A=
I have seen your negotiation of disabling xen-swiotlb for devices which are=
 controlled by IOMMU in Dom0:=0A=
https://patchwork.kernel.org/project/xen-devel/patch/alpine.DEB.2.21.210216=
1333090.3234@sstabellini-ThinkPad-T480s/=0A=
=0A=
As I was thinking to create a common implementation because I have the issu=
e=0A=
when device controlled by IOMMU using xen-swiotlb fops and bounce buffer as=
 the result.=0A=
https://lore.kernel.org/xen-devel/060b5741-922c-115c-7e8c-97d8aa5f46f4@xen.=
org/T/=0A=
=0A=
Do you have any future plans to finish implementation for upstream?=0A=
=0A=
Cheers!=

