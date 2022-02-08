Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 594DF4AD2E0
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 09:14:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267658.461400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHLdE-0004sh-Kh; Tue, 08 Feb 2022 08:13:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267658.461400; Tue, 08 Feb 2022 08:13:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHLdE-0004qF-HW; Tue, 08 Feb 2022 08:13:48 +0000
Received: by outflank-mailman (input) for mailman id 267658;
 Tue, 08 Feb 2022 08:13:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1FiY=SX=epam.com=prvs=40383cc40e=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nHLdD-0004q9-2E
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 08:13:47 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 087803a4-88b7-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 09:13:45 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2187D1mT022166;
 Tue, 8 Feb 2022 08:13:42 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e3kc2rbgq-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 08:13:42 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by PA4PR03MB6927.eurprd03.prod.outlook.com (2603:10a6:102:ee::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 08:13:38 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 08:13:38 +0000
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
X-Inumbo-ID: 087803a4-88b7-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B0sgjKu+24e50whOrTleAJBoD/OgU3Hdfk/fh5A3YnddLRuhLTVn4tUfcbtPCt+4YfiMQzAT6b0lVcJYm6h2/shgLw6uL0NUf05IdIKaXMz5Ot6eg1R7xcmIG1413Kivh6R7yKgSshxVitWtTzRgpET1NFgOhmmsS33/lOoPokVqlTOSh4f9eBLV7/TLO6CH8mCnUwjIZxc00c9HPdBzPrd8/ZSkFC7pi7sDoeJ9ht/7Tm6THxr4zEdcNE9xIle6kOJ13LlwYd0+MLANCtKkVoy0dclMcbgwCVxwQvieNh9LYkDTLdLzoKBFp0RIrMGDFna4HRFgMmoWrUYKkChkew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8ch4WfXor1N/AUY7DVD+/V13wWWbKYKrQu3rRj8EQc=;
 b=lCDAph4BlBnUntnvY5U1+pGoJonkFWCXGalZldnM4i5Mk79TG2/4CPy8hcKeRm2lZ67CzPFGAOt72Tqha2EPULuT01SB1GkDZ5Q24X3uaKO1uZsYbm0Z29InXwmoPKTvoF0UINVKAmGljoc2tnzxdPXhB4BUTDY4zDvP6HClYygLQ6wR+d0OFVXoHC1Zbt8Uc7zOftUFk2Xw0BnExgHwY9xkVuvufyJtW0bmVuIMShI3yPytY9OTcnPzbhD5gdrOPRaIbJSZDym77TMVY5uZLWfHHgsHWYD2ufvvpf6U7T/uKs66gI0/maYc1PRA8LD1c/FdIh8qiBVeIqSGLjqmoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8ch4WfXor1N/AUY7DVD+/V13wWWbKYKrQu3rRj8EQc=;
 b=Gaw3iEdlYwpXTJ3MruS2d8PgxQjQIEpkFDHqHgOFsPwJUGfIwnGKYu5h160D3j2EotqqZqRgNyuar9k4jXie/BPE7UaMeYskmtLk8VOCa4WkyVY4+vPOdYHdQIPJ4S4QRbYVddvWfTKTIZH07t8DpI45RAiLdB9FvLaYyqtcg0xV1m3UcamsuZjBalyYff9A76nvBP2YsdaykQ48anJJZBejSToKhE58+MzDvjUlxKTEbhR3F/7Zg3DXb8ZbGoDRWhlIEeqZ4HE9/R1acsvaaK8EkaIkvv2hsroymZbXSEIaqzeqBlZVWsumab/h8echvWsVrHjur6IOuepY+zv6+Q==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
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
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 09/13] vpci/header: emulate PCI_COMMAND register for
 guests
Thread-Topic: [PATCH v6 09/13] vpci/header: emulate PCI_COMMAND register for
 guests
Thread-Index: AQHYGZFfEau2yoVfs02TXHZP7JM5E6yDcw0AgAXhW4A=
Date: Tue, 8 Feb 2022 08:13:37 +0000
Message-ID: <0ff2a524-9a65-861a-df87-cf3f682862d7@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-10-andr2000@gmail.com>
 <7df2379e-1c30-c362-3106-c7ef23af5c73@suse.com>
In-Reply-To: <7df2379e-1c30-c362-3106-c7ef23af5c73@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e761a04a-3111-4037-b0ca-08d9eadae8e0
x-ms-traffictypediagnostic: PA4PR03MB6927:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PA4PR03MB6927762135C3FAAFE0286EA2E72D9@PA4PR03MB6927.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 1esZIxf2jY306GdXGS7sKyy7/PJX0kjKrBj61jWlX0KLTPxzi/XuFai1LAxFe9xrBibbTVzrZExVwP87skN37HTOEiU814tNSD7NKlXaVBSPDEXCsCmPu3JeX0AZXyDrwE7CAQ2MweFpEmwpNP9uJe13GPYlV57Gq6aMYSY7AfXeM7dmC7t3GeuNd2Osw9vm9k/mTY4IbYVweeYduAyQ6kSt1UHhmmNn4uiMG7OGFiIJF9CpbiOVbu/MbcAqFoqiIMYFsIbSq6zmM9EuC8kWTPJ6sKIZwQ+md+wQPNLTJc7hcwgeIjLXMEmnN1f/h1bGIVHwFmB3PhAbVZBvmqQQpXRWJhaIxBR1MXTaXN07TUj19kWotUz9ZbXJd5Hk4wornTEkGD3D0ZeqDIZHLJh3t/LOWXWNHxw2+U+0uZY/O+8f/W/gHcxC42GNfmb/dMjV8xY/CCk8AVQmT+/0jmk4NZ0ij9+QvWhBBjj2cG1AQhWv4IMrMoChIaDvcrjNgeHDfIvvCSZByttJRcmapU2aoGZWPN3T6VC1iOFt86q/q5BTsIPIoPwN35dg8T90y9RST4fcrqVwfQgqKFJ0QHaf9Y1RxfhiKmMFl+Zqd1c07btfwWOiZgz4sSxwaPfacbu9L6/VNxAbORJAYCcygUhMsIilie05LcQwBYqtCysiQkkLWjz6/WfdzR6BEXrM2Ef6ACcCwToOKEBlChPN8OJtMra/G1+83DcCPs6rrRKo8TDKACh7DUA6yr6zjliw8HVh
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66446008)(7416002)(83380400001)(122000001)(31686004)(66556008)(66476007)(64756008)(5660300002)(38070700005)(6506007)(91956017)(36756003)(76116006)(316002)(6916009)(54906003)(86362001)(6486002)(71200400001)(508600001)(53546011)(55236004)(38100700002)(8676002)(2616005)(4326008)(2906002)(8936002)(66946007)(186003)(26005)(6512007)(31696002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YjhFVGhWaTdDcVozMjhVUURNUTA4a3MzY1YycFBvOFRjbSs5Tm13MzlyeGVn?=
 =?utf-8?B?eFJiM1Rrdnd3Q25Bby9iL2M5RDNFdEZIU3d4eGlxeXM4aEQyd3VMTHQ3WVJk?=
 =?utf-8?B?NEhhdXlNaUowc21YUEtTRkprd2RXeFBrZXpqT09DRHBTZVg5MGhObDhEOTZW?=
 =?utf-8?B?ckZKaU9YNU1nYWdjbWp4NzBLa1BKbnVuT1lUUjk1VjUrdytxV3FReFF6MUNH?=
 =?utf-8?B?MzBEQm9GNWJiNnY0L3NWVWFEd3lvaHZIby9UaW1tQ3Q3OGF0REU3QTBreVZu?=
 =?utf-8?B?dTZ3czdQWDNDYWxGRzVWcHIyZk4wV3lvTFMrUlZuckpwbjNwaGpFalNIUURO?=
 =?utf-8?B?U3B5WDMyUGtZRHRzMER6MmhUaEowaWpUN3E2WnAzRCsrRUpEeHNnYlhPRVQ0?=
 =?utf-8?B?WlAwOXhqKzVIb1phNlpjRmRKaS96TlFERVNyelRRaXBCRVZkT29RN0dmNGty?=
 =?utf-8?B?NXFtZEdRQW9QS0hBRlJoRnE0aUxvUGZzM3hHcU96MmtUSTJ3NVArNDdheTVW?=
 =?utf-8?B?TWdLblZ4Y0U1KzN3cjhzbGhFYUdlTEJYeU9OenFDQWtUOVZEQkxBd2k3ZWxy?=
 =?utf-8?B?V3BPVVpWbHhoVzdBaHZ4MGdoUEpNKzh3L3pTcTA2RUpnb0Z0VVZMK0dyQjZn?=
 =?utf-8?B?SXRGSmxmNkhGS05CYW53Q3IycnZZckQzbVlxM2N6elN4eHV1RUh3NXpKdmR2?=
 =?utf-8?B?a2phMjhaQUNkT0N4R2gzbnNYeWFHcmJ6cGxNN0NodTJ3blJJRGlwNkhvcGZH?=
 =?utf-8?B?ZXpKaHhTeTJPQTlobkdJVXZJL0lYU0NxZlMrdlV3N1RiaXBQMjU5c0ZHS1Rv?=
 =?utf-8?B?dzk0Z3RxbVRMWVJDY1RDdmRXdzFhNUJJSG9ERHhhcjI1eTZUVGNxUUVlODBw?=
 =?utf-8?B?WFZtbm1nakI0cXZKZUFtTVhkRFV3Q0ZjZlNyRDBZVlJqOUJISEpLcHdUbzIx?=
 =?utf-8?B?cXZtWDZ0VnVBRmJZN0lPVlVVelQ0RmRpbnpIa3I0NEhpbUhQZ3ZYcWNTaGNr?=
 =?utf-8?B?SzJjMjFRQmJIRGRDVjRzRkcxeWtiNHZkbGVpRzBzOFkvakpNTFZqaXBtblkw?=
 =?utf-8?B?bFpRRmlaRFFNVjg1WGx2SGo5U2VrbWhUSE1Bei9Bb1V4SUwzWEpiR1lkZUlU?=
 =?utf-8?B?SmlYM3E4eG96amhBU3hZeXE1Sk9qc2tuaUNVR3BRQjR1MXlKLytmUll0a2pp?=
 =?utf-8?B?Z1Q2eTNNVG01alpmTUpWajRkOXE1TFNjMmFhNGxpSVMyTHpTcHpFOUxFTi9U?=
 =?utf-8?B?SVVaZE9pSGlQUnVkU0J0YUVFenlmMEN5Q2NIMUZzWHMyc21mUWtFRlJmTEtk?=
 =?utf-8?B?ZUFWcUpPZTlwZ3ppdEQxaFNXTlY5SDVNNDFoczBOL3Q5WHZXNlJnODc5bVky?=
 =?utf-8?B?Z0UxU1Nta1NHaGkzTnFrNGZFRk9URTVMYzFNSGM2bWovTHNSTUJoLzVkVTFq?=
 =?utf-8?B?ZmJ4OE5lVjhQY0NyRGkzcmlYcm9MSElXWDFGQ0hhN2R3RDRJTkhHdjdMNTFG?=
 =?utf-8?B?Zmo3TFZ1V04raFEyMUtZeEppTCtQTmZjL3M0OE5DbzRtWFkyL1RrbGQ2cHEy?=
 =?utf-8?B?STFYa2tCOGo3NDhSSlhIdkp2Sm5Pb2d2RFdRUmNHR2h6a2syNndJOG5MQVFD?=
 =?utf-8?B?Zm9oSFhSYnRqMkR2UjFGUGtGZGx4Qy9NZGNDNXB2aDlzSTVDQnF5cE4wSzh5?=
 =?utf-8?B?bk9FSERFUVlVdSs3Z1V5aGVucGxmSnowbm9jeG81K1BBY0YzUjlSaHE3aXNG?=
 =?utf-8?B?Y2p3L0ZndFF2d29uSFJEbGVCMkFmdmxoU3UweGkyMElXZXBRZWt3eGx5R2Nl?=
 =?utf-8?B?UDBXeGUyVjB6dDREQmNWQUNzb1psT2QyWWVIVFI1Zk9MUVZkcDhUVmtYVmlr?=
 =?utf-8?B?M05oS1B6TkdKMTBCbk5xa3U3RmRRK3BKWGxmdkdMbGM5bUpYYW55eTJhTjNR?=
 =?utf-8?B?Nk9zR3hwaXdNUldGWkJCbWt5Rzg2T0QwR2paeTRVeFNOcmdwVlNMbGNHNGtP?=
 =?utf-8?B?QWl2aitzMnVtT054emhNMENjWFhadldCUnZCbVo2MHd0Wkh6bXpUdmp2bzJB?=
 =?utf-8?B?RzRwbkVCR1ZvWHA4bllxcjlZdmExRFRnNlVkN2dzUjRpc0dRVUJjMmh1Mkp5?=
 =?utf-8?B?TzQwSzVUY1YzdnJjdzVCMmQ3SnJmY3U4UERXZDhBc1RyUGNYcEdXcVRkdms4?=
 =?utf-8?B?b01yQnhiS3hlQUR6clRFNHkzY1lTcHdORWxnc1gxdXZPZS9qV0xHZWUzUDRG?=
 =?utf-8?B?MHcvb3IrZmxEL3lVaDZ4OGwySXU2REdtM29Tbi9GMnlsVmxXdFJRNzNQSmVE?=
 =?utf-8?B?QWF3RlY5Z0xUKzhQT09xUEd6RUhidks0U0s4a2RDYnFYRytpMTM2SFFuV3Fm?=
 =?utf-8?Q?uhtrrEm/9MmDCs3w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <91E3CA620D38A64BB7B121787C2D06C7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e761a04a-3111-4037-b0ca-08d9eadae8e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 08:13:37.9351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bpp8iZnZjziBgRiFFSCv6nyX3Ioq+4Tivl2I+8uSwXERaWfV9+zARxVDNJ4/exEKp+iBGXXlXebd5I8IZ+3S5m3/zNlzAmmXTfd2LxhUoojZOmrQsAOOlT1+dZRqLEGR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6927
X-Proofpoint-GUID: 93oHW9lRI-NApiXidVTyNbDlLxSdu2HG
X-Proofpoint-ORIG-GUID: 93oHW9lRI-NApiXidVTyNbDlLxSdu2HG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_02,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 mlxscore=0 mlxlogscore=874 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202080045

DQoNCk9uIDA0LjAyLjIyIDE2OjI1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDQuMDIuMjAy
MiAwNzozNCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiAtLS0gYS94ZW4vZHJp
dmVycy92cGNpL2hlYWRlci5jDQo+PiArKysgYi94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQo+
PiBAQCAtNDU0LDYgKzQ1NCwyMiBAQCBzdGF0aWMgdm9pZCBjbWRfd3JpdGUoY29uc3Qgc3RydWN0
IHBjaV9kZXYgKnBkZXYsIHVuc2lnbmVkIGludCByZWcsDQo+PiAgICAgICAgICAgcGNpX2NvbmZf
d3JpdGUxNihwZGV2LT5zYmRmLCByZWcsIGNtZCk7DQo+PiAgIH0NCj4+ICAgDQo+PiArc3RhdGlj
IHZvaWQgZ3Vlc3RfY21kX3dyaXRlKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1bnNpZ25l
ZCBpbnQgcmVnLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBjbWQs
IHZvaWQgKmRhdGEpDQo+PiArew0KPj4gKyAgICAvKiBUT0RPOiBBZGQgcHJvcGVyIGVtdWxhdGlv
biBmb3IgYWxsIGJpdHMgb2YgdGhlIGNvbW1hbmQgcmVnaXN0ZXIuICovDQo+PiArDQo+PiArI2lm
ZGVmIENPTkZJR19IQVNfUENJX01TSQ0KPj4gKyAgICBpZiAoIHBkZXYtPnZwY2ktPm1zaS0+ZW5h
YmxlZCB8fCBwZGV2LT52cGNpLT5tc2l4LT5lbmFibGVkICkNCj4+ICsgICAgew0KPj4gKyAgICAg
ICAgLyogR3Vlc3Qgd2FudHMgdG8gZW5hYmxlIElOVHguIEl0IGNhbid0IGJlIGVuYWJsZWQgaWYg
TVNJL01TSS1YIGVuYWJsZWQuICovDQo+PiArICAgICAgICBjbWQgfD0gUENJX0NPTU1BTkRfSU5U
WF9ESVNBQkxFOw0KPj4gKyAgICB9DQo+PiArI2VuZGlmDQo+PiArDQo+PiArICAgIGNtZF93cml0
ZShwZGV2LCByZWcsIGNtZCwgZGF0YSk7DQo+PiArfQ0KPiBJdCdzIG5vdCByZWFsbHkgY2xlYXIg
dG8gbWUgd2hldGhlciB0aGUgVE9ETyB3YXJyYW50cyB0aGlzIGJlaW5nIGENCj4gc2VwYXJhdGUg
ZnVuY3Rpb24uIFBlcnNvbmFsbHkgSSdkIGZpbmQgaXQgcHJlZmVyYWJsZSBpZiB0aGUgbG9naWMN
Cj4gd2FzIGZvbGRlZCBpbnRvIGNtZF93cml0ZSgpLg0KTm90IHN1cmUgY21kX3dyaXRlIG5lZWRz
IHRvIGhhdmUgZ3Vlc3QncyBsb2dpYy4gQW5kIHdoYXQncyB0aGUNCnByb2ZpdD8gTGF0ZXIgb24s
IHdoZW4gd2UgZGVjaWRlIGhvdyBQQ0lfQ09NTUFORCBjYW4gYmUgZW11bGF0ZWQNCnRoaXMgY29k
ZSB3aWxsIGxpdmUgaW4gZ3Vlc3RfY21kX3dyaXRlIGFueXdheXMNCj4NCj4gV2l0aCB0aGlzIGFu
ZCAuLi4NCj4NCj4+IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvbXNpLmMNCj4+ICsrKyBiL3hlbi9k
cml2ZXJzL3ZwY2kvbXNpLmMNCj4+IEBAIC03MCw2ICs3MCwxMCBAQCBzdGF0aWMgdm9pZCBjb250
cm9sX3dyaXRlKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1bnNpZ25lZCBpbnQgcmVnLA0K
Pj4gICANCj4+ICAgICAgICAgICBpZiAoIHZwY2lfbXNpX2FyY2hfZW5hYmxlKG1zaSwgcGRldiwg
dmVjdG9ycykgKQ0KPj4gICAgICAgICAgICAgICByZXR1cm47DQo+PiArDQo+PiArICAgICAgICAv
KiBNYWtlIHN1cmUgZ3Vlc3QgZG9lc24ndCBlbmFibGUgSU5UeCB3aGlsZSBlbmFibGluZyBNU0ku
ICovDQo+PiArICAgICAgICBpZiAoICFpc19oYXJkd2FyZV9kb21haW4ocGRldi0+ZG9tYWluKSAp
DQo+PiArICAgICAgICAgICAgcGNpX2ludHgocGRldiwgZmFsc2UpOw0KPj4gICAgICAgfQ0KPj4g
ICAgICAgZWxzZQ0KPj4gICAgICAgICAgIHZwY2lfbXNpX2FyY2hfZGlzYWJsZShtc2ksIHBkZXYp
Ow0KPj4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS9tc2l4LmMNCj4+ICsrKyBiL3hlbi9kcml2ZXJz
L3ZwY2kvbXNpeC5jDQo+PiBAQCAtOTIsNiArOTIsMTAgQEAgc3RhdGljIHZvaWQgY29udHJvbF93
cml0ZShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdW5zaWduZWQgaW50IHJlZywNCj4+ICAg
ICAgICAgICBmb3IgKCBpID0gMDsgaSA8IG1zaXgtPm1heF9lbnRyaWVzOyBpKysgKQ0KPj4gICAg
ICAgICAgICAgICBpZiAoICFtc2l4LT5lbnRyaWVzW2ldLm1hc2tlZCAmJiBtc2l4LT5lbnRyaWVz
W2ldLnVwZGF0ZWQgKQ0KPj4gICAgICAgICAgICAgICAgICAgdXBkYXRlX2VudHJ5KCZtc2l4LT5l
bnRyaWVzW2ldLCBwZGV2LCBpKTsNCj4+ICsNCj4+ICsgICAgICAgIC8qIE1ha2Ugc3VyZSBndWVz
dCBkb2Vzbid0IGVuYWJsZSBJTlR4IHdoaWxlIGVuYWJsaW5nIE1TSS1YLiAqLw0KPj4gKyAgICAg
ICAgaWYgKCAhaXNfaGFyZHdhcmVfZG9tYWluKHBkZXYtPmRvbWFpbikgKQ0KPj4gKyAgICAgICAg
ICAgIHBjaV9pbnR4KHBkZXYsIGZhbHNlKTsNCj4+ICAgICAgIH0NCj4+ICAgICAgIGVsc2UgaWYg
KCAhbmV3X2VuYWJsZWQgJiYgbXNpeC0+ZW5hYmxlZCApDQo+PiAgICAgICB7DQo+IC4uLiB0aGlz
IGRvbmUgKGFzIHJlcXVlc3RlZCkgYmVoaW5kIHRoZSBiYWNrIG9mIHRoZSBndWVzdCwgd2hhdCdz
IHRoZQ0KPiBpZGVhIHdydCB0aGUgZ3Vlc3QgcmVhZGluZyB0aGUgY29tbWFuZCByZWdpc3Rlcj8g
VGhhdCBjb250aW51ZXMgdG8gYmUNCj4gd2lyZWQgdG8gdnBjaV9od19yZWFkMTYoKSAoYW5kIGhl
bmNlIGFjY2Vzc2VzIHRoZSB1bmRlcmx5aW5nIGhhcmR3YXJlDQo+IHZhbHVlIGlycmVzcGVjdGl2
ZSBvZiB3aGF0IHBhdGNoIDQgZGlkKS4NClllcywgZ29vZCBwb2ludC4gV2UgbmVlZCB0byBhZGQg
Z3Vlc3RfY21kX3JlYWQgY291bnRlcnBhcnQsDQpzbyB3ZSBjYW4gYWxzbyBpbXBsZW1lbnQgdGhl
IHNhbWUgbG9naWMgYXMgaW4gZ3Vlc3RfY21kX3dyaXRlDQp3cnQgdG8gSU5UeCBiaXQuDQo+DQo+
IEphbg0KPg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

