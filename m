Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E539E4A8406
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 13:45:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264683.457872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFbUE-0006xX-D9; Thu, 03 Feb 2022 12:45:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264683.457872; Thu, 03 Feb 2022 12:45:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFbUE-0006uP-A2; Thu, 03 Feb 2022 12:45:18 +0000
Received: by outflank-mailman (input) for mailman id 264683;
 Thu, 03 Feb 2022 12:45:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ArrP=SS=epam.com=prvs=403311c35b=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFbUC-0006l6-KY
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 12:45:16 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21d91b94-84ef-11ec-8f75-fffcc8bd4f1a;
 Thu, 03 Feb 2022 13:45:15 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 213CX0T4008878;
 Thu, 3 Feb 2022 12:45:05 GMT
Received: from eur03-db5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2058.outbound.protection.outlook.com [104.47.10.58])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e0dhuge6x-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 12:45:04 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by DB7PR03MB4827.eurprd03.prod.outlook.com (2603:10a6:10:75::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 12:45:01 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 12:45:01 +0000
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
X-Inumbo-ID: 21d91b94-84ef-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cthrr9zQG1Qf/B4RBfWDTSR95e872kSxX1PIn5i6HI7i3kynXI8Mwhx28hBfTVuorZncbBd9SwMU1jLTMbR9xj4cMxrncdqtLwLZr7+64ogtSbndDwQRx0uRxpb3iJgzZklke2W0Y5s8Np/H1+3qY7TQmNB5PnZnPHpBrvAevnc/hh9Rx1bSFuHdO3GSAcYx07YuSCRQJSU2g6fPt3CqRgjljAIl22/jbcMuzpF+zb1WpASnPLoIISgK5CDzLtBbrhG2C7bfkjImysBYRnev0QVw9IifJOwi4tYljbGBaSoXCvF7xJxjPg4JtoZxH6ikbhguaWIynV1DKxd8znp3LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YzD327I/5O8F3nb1JPeYO8Iyf3svDbljUweJy4ygqMU=;
 b=dBpiu5vZLq16gEzp/urPcxgoctYfcw3Wv47VrZr1xUV8ZVJy0fMalzmYCFf3wAViDhCIkMHHhrMf6SRAqmYFCzEUvNlgyZ30rIIH9jCkZCcitoMyS2BpbAKGtc1KK5zIY90tQA+jE4QWvFIT35xnbVRpHzzn46gxJhMO3C3/ImIBfzeaPS4Jbs/C2nyaQ8xN01fB9Ug2kmpcI6bTVwRqnUWhvoyvwVeT+WwOdKjNAgtutfhE/9qPgWVlHe+31A6ttIWxpWUxBIBy6SCK4zm/5LyjgGVgcrT+dyIuFl/TEOAE1ERVEyuUzYwwMnD728Jqi6tJu65Lc7KUn5pnMpoCDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzD327I/5O8F3nb1JPeYO8Iyf3svDbljUweJy4ygqMU=;
 b=aXdsZG5zVXPr1fLq5McClAvUE3YaVz7ZvWAMmoxU0YouEOUCPVmhBl5FwhwhGS+fQqgdH80x36vj5Un3bpQ3v8VzpjJcBOvZYAdAiRuCa43Z27y35myLv2Jf+VezQfnpFYpMDYE7L0/5qCUaC9I3BOLtLiICLZxdUjrUWN2VtW4l6Y7LKDEOjqL1NoCf50Dg9784XZ5SLU+rB1bROxDJtvKYGAeZ7qwXtGqBXqJIU0h3/BUUSc9AiWGJlJAM8bC+H6mvk4Dl8TT4xZmAnPLi75PqJlmqU7AoFqdP1jfyhQnAAnGKB29yRIqMBl/fjXKUQ3urkHhfvEj3vvPXVwAIDQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Topic: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Index: AQHX4ewHyWAyD811HEGp8pIjUuVWNaxf8XWAgB1bfoCABObrAA==
Date: Thu, 3 Feb 2022 12:45:00 +0000
Message-ID: <df98cdbd-36fe-0386-c068-2a1540f10188@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com> <Yd8RJfpEalnfl+CC@Air-de-Roger>
 <d493b022-3c78-1721-e668-48f4553056a9@epam.com>
In-Reply-To: <d493b022-3c78-1721-e668-48f4553056a9@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee8c57cf-bde2-42d2-3e88-08d9e712fe37
x-ms-traffictypediagnostic: DB7PR03MB4827:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DB7PR03MB4827DA59BC13FDBC1A2E968AE7289@DB7PR03MB4827.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 iSclE5MVbOwv32ungxQKPLI6H+0svCPHoYeyMeDCxhI5MRpVKD8J3x7exryOPZebTrX1igWdY702WrV5BGx42sUauJZpTaan2Q1kOqT4xwNIy0ieHyEPTYkgxpF0ei34rE12BgLfuuNJ4tbyFo3vthnkt8H55vmSpyWz1POtaZQ+S+d6uXz1qw07g9VITiPuaPE84cxkdqTIv/BiOH7R7tWzo6pXONh4NAr+07dyg11yRlBpxjnTsaGLNn6bgmOrigQX8ge5IW0lHJHe6hlfkZO40+65fIOntYzaH6Bx+3MwDByy8TQcynk39337fTcZqCvy3h9JjYkQDlkVWnLubKKbkEG7uZq2ZGWHDQE91w3o0bzBuwMzBqVIMYatK4H3m/dFrVnWCNH0qMYypZZZPSYfY2pePC0S25yViwKoLBrEG8OrQh4DQQlMp1V3tPH4i7JlYUvU4ow6kIvrGx2l4dBchuUOt2d+X4cpo1t+MlxVLIRLHa8ueiUSqrYl5VfUWfo9pYy/+kxTNypswba9ffLpBq1VJ6Cc6ShXG8Zx27swN4BRCtMWCRlhSZIuvk93NQEvAQ+e/J6A9S4VsR+h30btKF8xKfGwNaee2/RNQXOLot1MNBPUg3w4b7d7jH2/yvXHimShwz+JNs0VBQ/Cl6uzrZ3bwmF89uXivZGPGn7HtW5qPA9H8OaqFx77k/V6XZMY481Emmr2ZpbSbOd/8cr6U/KLXBQNQlO5TjaaOh3bm1LjXM1QrJHO5wg2z5xY
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(54906003)(6916009)(2906002)(36756003)(122000001)(8676002)(6512007)(8936002)(38100700002)(66946007)(71200400001)(64756008)(66446008)(86362001)(4326008)(66556008)(31696002)(76116006)(91956017)(508600001)(66476007)(4744005)(107886003)(6486002)(31686004)(7416002)(5660300002)(186003)(316002)(26005)(6506007)(2616005)(38070700005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NW5ITDM3YjVabVlwSmhVVXc3RjM1RnlSVFVyckI4TzBoZlNpOHEyd1ZxZkFy?=
 =?utf-8?B?NlhWK2h6aFZkcmc0andHZVNwbGxHRXFnR2ozVTJYbTFXaHdPZ3ZFTzhyTzRG?=
 =?utf-8?B?eFAyTlBoYkNrVTA0b29NZytQL2d0b0RpdXNpSlNueTQ3TGp0Wk5weEJ6WUJW?=
 =?utf-8?B?c1JLSXllWUNERW5IRTBTMUl6MDFHMHFpUGlkS2JRZUhta1QyYnlzUWZ0OXpQ?=
 =?utf-8?B?R2JOWG5sd0grQTlyLzZoc2tIOEFKS3JRcmFqOWZTQmVSQVB0bSs3RFFyMGhD?=
 =?utf-8?B?OW5xYW5TMDJCREd1N1R3NjhXU0tpZVhLQmJ4WHJMSkNkR2hqbk5NWFFtbXI0?=
 =?utf-8?B?VS9sbHgxazVUS1ZmZ1g2VStacFVESitBNjFsRDdHZjVhVHlOeGx6QkNaU0RB?=
 =?utf-8?B?NjlIeE1jQ3owLzhSL0RQSTE0bEd4d0dweU5rTWFOR1F3b0d6RUlhZHovYUpF?=
 =?utf-8?B?eUFKdVRrcVdCaktlUDZ4VkF3bnJSQzQrclZCdzYybU13TXhKNTYrU1F3Yll6?=
 =?utf-8?B?eFB3ZWxsUHA4azVSK3I1RkpLY3hpZnFwRDBsWDBFb296UjVYQ2V6a0kySXJz?=
 =?utf-8?B?V1c0OGhPRzQrSzFLeXp6TWxWelBJUjhTT0pqeUlPMXZMRlh0TjQ2eWh3TWk5?=
 =?utf-8?B?SUtpWE5BeFNGRDRZcjMxT0V0OWUwMk5jVUZEdVozVlY3VFV2cTBMdU9YWVF3?=
 =?utf-8?B?cWRMditldnQ3VmFEMXRkeENtNlJMZ2UweUNBaW10TkZ6UFdvTVcyWFVNNFUw?=
 =?utf-8?B?cVE1U0J2YUcrRERWRmNJM2dHWmhqaFZ3TUx6NWhlTHFZdlV4bFdjNjRxeHpC?=
 =?utf-8?B?Wit4Z2hKbWJMZWQxNXB6YlNCVVFQY2JhY2FCQWtnUmw4dk5FUHNwZVY5bkJY?=
 =?utf-8?B?bWRTbVFLUjVuc3p0QUtMOW1BY2lsSUZSS29UZE9xQk1PTDBQdVhTOVFSTVE4?=
 =?utf-8?B?bFJjdVF1U3oyNTZmYnYrTENMcFBPQW5aZHA4MzJ2ZkY0cStuQmgzbm1iQkN0?=
 =?utf-8?B?N1JJQTFxTitGNis1SVBCa29VaUJ3YkFCU0tHeC9TR3VOM3E2MU4xT1Q4Ulpu?=
 =?utf-8?B?QlRObVY5bDlHaFRldFgvMkZMT2F3dFJzNllLV0dKUmFZMEZxWnZBQjE0QTdX?=
 =?utf-8?B?Z0x3QldtTStqOGdTaHNRSmZkem04SDY0U3N3YUE5cVVUa1dWN21yTVlza2xT?=
 =?utf-8?B?RUdhczRLTE81cW5GbXFzaElsdkxqN3crVXdMTldBRytDZjFhREk1NStKZFpI?=
 =?utf-8?B?ODEwSDR3M2JHdFhvYWo2WmRuWnp0bU0xSU9OMjNaWFRjbzJSR3JqMjNjOXRV?=
 =?utf-8?B?M3NadDdQV2I2bStKSm10MnY1THJRVGN5ZUhMQXpRU3lFVTBWcko2enJkSUhB?=
 =?utf-8?B?bGFndk96RWV3UEk4VUxrRWtPSGFZVFlpdVQ5KzJoTDFnRTVxWlI2bmFaR2pU?=
 =?utf-8?B?SEdxbVY1NG9JaFg3YnNzSW9HemJOY29QZUZHVExYT0VmdFJRbFBWclFlZDc3?=
 =?utf-8?B?M3NrUnpSaVVDeGQ4WUdqN2pnL2FrZDE1RitEKzNPWHV2M25NOHpHWmd5dnNH?=
 =?utf-8?B?NURiOTJ2T1pVQlFwdS9TRVRJc3V1Q1dRUnNuYURSaVpIblFsZTFWanpPa1BR?=
 =?utf-8?B?Q2VMUTNzZ1I5RVhZSXRFOC9xQVg1UUFvWHplQ21KR1BvTUtnNVB4cTVKblQx?=
 =?utf-8?B?M29seDFOMnB2a3JKOWV1cGJvZmszZmxnK3NkRXRjdmV2UkR4R1EvRTBZdGw4?=
 =?utf-8?B?TGhTbEtnbTlLaHh1YnZ2dUVTbDZSbVJyUCt6MUQ2cWJHRVU4SWlPb2w1Z00r?=
 =?utf-8?B?anJRZkdIcXFhaWZmSlJLQjc0QngxZ3VjZXBXdGE4MnBkdmlKaWRTOFcraTBz?=
 =?utf-8?B?MDhmcTV0bUlOeDk2QVAyUDltbnZ2VkZKcWdLTXRPL0lWMHRVOGhGcDVrdEUr?=
 =?utf-8?B?N3dpbGZZekVZZS96T2E3dElaWjJscjhaOUlsdkhBc0FpK1kzWTd3T3BNdkZv?=
 =?utf-8?B?YVpMN2czZzBkeVUvbzZ1VWV6NkluSGJMUzYrKzVyb1NIczJ4WlFiZkVlZ0Iy?=
 =?utf-8?B?RVhyWjhZWVZ4RGZCUjJteW5hSVVjOEFicW1aSTYwTDBPM1FSbHQxOVF4ZFg3?=
 =?utf-8?B?Y3p3OFBUWkdCUU1GYnlwdDFYeFR6cHdjanJDU1VOMERKeVc3R2pqTG5lYVND?=
 =?utf-8?B?Qm1XWHh5c25SVFYxS2J1YS94Sm1ORGNNRHBMTUFycGxCT2gvcXpaelZuRmNT?=
 =?utf-8?B?RDJ5dm9ZTUlrVWc3YkxNYm1oRjJlQlVXcVdnYXBXVzBWTDIwVUJRY1VIV0Mv?=
 =?utf-8?B?amJjQUV5N1hQTGw3Y3g1L1NFTmtaQkNUOW8zMFpsWVpjczNlMFJUZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A3F69A1F0D3C141A8E3905BD4F0FD4B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee8c57cf-bde2-42d2-3e88-08d9e712fe37
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2022 12:45:00.8846
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LttdC/Ossk8vQ0VxEiPRc7jYLUR1iNFAiQOxEiKqhBzJ+VAgfOybuDba/jD7um3HFqQy6vjR3fwxYR0keclJeDudb2bC8hu/TES/JXZkp2uSUBzAaYyN7L17rKkWq8xF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB4827
X-Proofpoint-GUID: DwtCkC3jzbpd5i4f-la-Le-iTNVO4-K2
X-Proofpoint-ORIG-GUID: DwtCkC3jzbpd5i4f-la-Le-iTNVO4-K2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_03,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 mlxlogscore=914 mlxscore=0 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202030079

SGksIFJvZ2VyIQ0KPj4gQWxzbyBtZW1vcnkgZGVjb2RpbmcgbmVlZHMgdG8gYmUgaW5pdGlhbGx5
IGRpc2FibGVkIHdoZW4gdXNlZCBieQ0KPj4gZ3Vlc3RzLCBpbiBvcmRlciB0byBwcmV2ZW50IHRo
ZSBCQVIgYmVpbmcgcGxhY2VkIG9uIHRvcCBvZiBhIFJBTQ0KPj4gcmVnaW9uLiBUaGUgZ3Vlc3Qg
cGh5c21hcCB3aWxsIGJlIGRpZmZlcmVudCBmcm9tIHRoZSBob3N0IG9uZSwgc28gaXQncw0KPj4g
cG9zc2libGUgZm9yIEJBUnMgdG8gZW5kIHVwIHBsYWNlZCBvbiB0b3Agb2YgUkFNIHJlZ2lvbnMg
aW5pdGlhbGx5DQo+PiB1bnRpbCB0aGUgZmlybXdhcmUgb3IgT1MgcGxhY2VzIHRoZW0gYXQgYSBz
dWl0YWJsZSBhZGRyZXNzLg0KPiBBZ3JlZSwgbWVtb3J5IGRlY29kaW5nIG11c3QgYmUgZGlzYWJs
ZWQNCklzbid0IGl0IGFscmVhZHkgYWNoaWV2ZWQgYnkgdGhlIHRvb2xzdGFjayByZXNldHRpbmcg
dGhlIFBDSSBkZXZpY2UNCndoaWxlIGFzc2lnbmluZ8KgIGl0IHRvIGEgZ3Vlc3Q/DQoNClRoYW5r
IHlvdSwNCk9sZWtzYW5kcg==

