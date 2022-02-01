Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1CA4A58DA
	for <lists+xen-devel@lfdr.de>; Tue,  1 Feb 2022 09:58:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263436.456125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEoyI-0000UX-Qm; Tue, 01 Feb 2022 08:57:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263436.456125; Tue, 01 Feb 2022 08:57:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEoyI-0000SB-N4; Tue, 01 Feb 2022 08:57:06 +0000
Received: by outflank-mailman (input) for mailman id 263436;
 Tue, 01 Feb 2022 08:57:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7bwX=SQ=epam.com=prvs=4031c7af39=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nEoyH-0000S5-43
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 08:57:05 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebf08d1a-833c-11ec-8eb8-a37418f5ba1a;
 Tue, 01 Feb 2022 09:57:02 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2115xhwb021026;
 Tue, 1 Feb 2022 08:56:53 GMT
Received: from eur02-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2056.outbound.protection.outlook.com [104.47.6.56])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3dxy72rh01-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Feb 2022 08:56:52 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by DB7PR03MB3929.eurprd03.prod.outlook.com (2603:10a6:5:31::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.22; Tue, 1 Feb
 2022 08:56:49 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 08:56:49 +0000
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
X-Inumbo-ID: ebf08d1a-833c-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=inC7thQC3NqW6sBfOAGgNBnUwNV9dE+O+E/8NdO1J/mTcY8WjLd9ZwqGEd9D1H1CsYc7euFUwtFiI/JjlTlp0iOM77BDGNTsNOyD3AuJ0vCdbbL+Su3a9mBonJ1I36h/BAdCCa8Ssy6G6zINWO6XzngkUDloGtirC5i4czA01JvNSYrjkl2gYY8iALukaEpEtT/Mej3GJyYieJ7mvOJmuOnb3kwg+Psaur5Ke7lGpQG11ZRxwAE4mVjfpHLJAuXrv0YMl9mzvkUqrfO6wnrxxzvWjz35txPNyPsoG6k0BCV7rtT+OuWwHIQF0IClSNhHILu42j5Q8VgXjCjQLOZrQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTEAzn2QKlrnanGbNbEOp+KGNujiJhs8kDtbcRKZ/ZE=;
 b=auR72im0oYth6438RTWl3VSeiegZkv+XKaPi0kANDyKLZTz1IV/lSsMJjtGNLBiWg81Ftwt5nRolMhh78bKrq3z3jETYOYP+DNTb0h7gPrSLALtlFIVi61KsVhaxpQo0r3ISHm+osLGQlC/NYQHKM7KDv3NsU/9A/qk84EwnY6yMJye50qXMmX6fX9dZLUefftDu9Nt/shMWR+CjnijnBJ+wYym5WCa+BBplXvv26suwPJeDrVm7u5tMe5wgGUDtPnteg4stXObsZQQZcBS2Y2i8P4SH7gEb2zX/d3n5XGpU307so27Q3dpkZ2Ohgt5ks7Rokd5eQLJVN2AwiB2PpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTEAzn2QKlrnanGbNbEOp+KGNujiJhs8kDtbcRKZ/ZE=;
 b=C9vuTg9x9PG/GBF4mcBrPiCWDpHMWPNQt330V6stK8eMp4BDwnkkwLlVtRiGG06oCIaKwjEP3jsyjN8CekhCfpwTY7Nk8VYxbVYtrxIOqjsWv+wxqq7q+M6cLRfO/N+xzxjbrgF1TFkaTG7Rxv3dUWTAdxVhNvWBKm/6wWRGEe8l9yiRM+vK5Dk4ppYbd5JPCPmUScaYiM/yLuPenq/hxbMw15JzukmINZ9DfkiITvdx/mgvggo79cdWZHhVOK+ijm0lyiA0oQk9tgd3VO334Ueu+Z5lpP2iGJM2vneH1b3VkyUeePacxch036AIn9CE7h48P8yeNHKc2EumWokicg==
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
Subject: Re: [PATCH v5 05/14] vpci: add hooks for PCI device assign/de-assign
Thread-Topic: [PATCH v5 05/14] vpci: add hooks for PCI device assign/de-assign
Thread-Index: AQHX4ewGcVFZUW6RNkyJ6BxXBZzZQqxhIP0AgBwY6ICAAZWNAA==
Date: Tue, 1 Feb 2022 08:56:49 +0000
Message-ID: <ef8feba1-695f-5cd6-bdf6-8ef6c55e62e1@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-6-andr2000@gmail.com> <YeAPxA8gZZ/xBYdA@Air-de-Roger>
 <f4ea5ece-551e-8a91-90c6-d9f806c97d5b@epam.com>
In-Reply-To: <f4ea5ece-551e-8a91-90c6-d9f806c97d5b@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4cb6705-38f5-41c5-235e-08d9e560c884
x-ms-traffictypediagnostic: DB7PR03MB3929:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DB7PR03MB3929E4CAFB6E3E9B54CB79FFE7269@DB7PR03MB3929.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 1VpazAIX4YfeWvAY1UtflwSb4X42OMtVzu5IFOAqcoRI54k+9Wgjqxk4xpCDTGK/+lL03c+7fYxYBadlfVhfHqg3KswLkDYZgsH/pVySf8YCNMjhAq1CdVZS8/7bTNzZa9zhTMx2sXmXI13IGUKXd3u9SR5hLgg+5EYEAbHcZQ1cR3YU1lmWBJa0iSjH5lTRdWOHWhx1ANbECK1t4MrsFEFYx4i2zoj1DYgIDMszo2hAIrX3CDhnGELwadrJd2bNsTgay37RoG8q8lNe8jIAfhhhl+GQcfEI2yU8MeCE1O8pybMZytUykHARSTsjaMRGq2ZL3zeG8LojCwiB5J4NXVBi3IaBDpbsM7CNoh1ZBiMhJaYUOYQo1DmsZNy4TPv96K+YegoRafjOPpPrYajsWNgDhGW82mLVoFvBaJZ4G0sZ2eCVHXmLbVYa5y9OSXIVfwg7ERz9LKbqyQt7a8t5zuo7IA08UM/mHKFBbZ/rqSXPCaepgDuqmLkwW+MJXgx/XyPvhwjpw7bb7t5f4cm4fA6S7/+QLkiLRSIAnzQAfrP9+AtM3aCOaiV7IZsyImKzqSh6yalsBNf+74pffrQ6eIImL22twCkE3bQTkUJaSgrbEL/aorR62rDTmAT6VWvF1fUQ4v8JFegWcvnFH17Lw3j2Itc5uy6lBSyrKyKLg4zHaU2oxffyTnm9UfwqQRPA0HgAiOiUs5MFrYSN09sEzhT9fVAoN8KTEs5DQWICtTtTTaAmmzrVjFHvHlVVcFWl
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(107886003)(54906003)(6512007)(7416002)(508600001)(186003)(5660300002)(6916009)(26005)(31696002)(2616005)(86362001)(83380400001)(2906002)(66946007)(66556008)(6506007)(64756008)(76116006)(36756003)(8936002)(38070700005)(6486002)(66476007)(31686004)(71200400001)(91956017)(53546011)(38100700002)(4326008)(66446008)(122000001)(8676002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?K3JVdm8yNkxoeVZ0Y1FWc2lHWlF3aFNZQlB5Uk9xVDdadThXWEoyekxFUnNL?=
 =?utf-8?B?bytvOHJJekhremgxU3g5Q2tZRUJvZERuUGR5SDEvQ0QxQXRPVnJDeTM2M1NT?=
 =?utf-8?B?Z0E0ek1pcHBWc3RhUFhGRkREV2RscUpPTDlSNHRTeU8zRmhMZ1czVFhHbndJ?=
 =?utf-8?B?L05pZzM1N0hMa3AwaUc1MWMyRHRPSDJ4aDh0NmFSNHkvU1l5aG03TzlIL3dj?=
 =?utf-8?B?NzFFWUcrYVg1MnFHSm9wbW1tTHI0VDF1cnlTUlJWUTF5MitUeFRETEprZTQz?=
 =?utf-8?B?NFIyY01HN0tGV0gvdkIwcWVHL3FsVU9xZnp1MVFJWVUySExDZkVKY3BHWE9G?=
 =?utf-8?B?eUx1VFBIVnNIUVplcUhid2lwaG9yU2RTcS91TUZJWjZDaktySzR0SHp3eUk4?=
 =?utf-8?B?N0hKVno1cE1MQzcwcEJRRXNoemJsYU9KMEZOZndLRkJPdXZ2QnpXdHVoejU2?=
 =?utf-8?B?RHU1am5yY3hEZXBEZzFpZ3BIQzhhUTdxS1pyOERMRUF6Y3FiYnpkSCt3U0RH?=
 =?utf-8?B?aG5FdEVkdFBJelpuak55U0pZQUdSeUMybk4zSlBLcE5Zd0ZIUFJFMTNWWThJ?=
 =?utf-8?B?cEo3Q3hXQVF3VVV0MU5mTytSaDBpQUdWOUMwVGZPSE5PNlJXelhKZWttVUFL?=
 =?utf-8?B?L3BxejBSQTJMdkgrd3QyenBPelJpRlVrd1BTaWUxMGFOYkdyOWtkb2U2bUhY?=
 =?utf-8?B?V1hoZ1Vla3BxMThTdm1OMkpkQTgyQ0hYa2I2OWY4bE5ieURSbDROWmhzTGs2?=
 =?utf-8?B?QUdvMnh6YzJ0MTFYUW4vWkFkYkN0M3lwSlUvUDVOc2Q5dGNuVUlyMWw5ZVZT?=
 =?utf-8?B?cnYvbXVYN0xZZHg2RFBVaVdGUHB0UmN2Z0FoeDN4aHdBckd5MnYveFZtbW5r?=
 =?utf-8?B?ZW5kYTMzVW9tcWpqSVlqdDhLelJrVlVvMm9CZmwrWnQxRDlNYm8yYVUvelNH?=
 =?utf-8?B?aGtZdzVRdGdhUlJuTzllY3RWTnVucTNWRmVwby9PQWxUZlpxSlh0RUZ2N1ZR?=
 =?utf-8?B?RGFMR2NOdS9qcVZtelEwNXJ1ZStvL250Sm9lSWk1dUUvTk5CTlk3ZW5sclVK?=
 =?utf-8?B?OGJlRVg4OWlUSU1peHdRTFc3dVFwRUE0UG91TEpCODFKeWhVQU9kS3Q5QlFT?=
 =?utf-8?B?QXhmcERkWnV0dHBuZno1Mkh4UnlKRkJQZE92NWs2SmhSTUZVUGR6SzBOWGVm?=
 =?utf-8?B?V01FcWdNT1AxcGUxaU9oaXY0NVFsRk94SzBLVnpNdEdJYzBJRGJFd1RsQ0I4?=
 =?utf-8?B?Q093VHkreU4rck1XTjFyc2V0UHJHajFoaXZxQmRmc1J1YWM3azVDWWNFZHZQ?=
 =?utf-8?B?ckhqZjBmTTRieWE3L2dqMmhvZlZudU1aYXM0YnVkaVVVMmxEeTJXWG1HNTFX?=
 =?utf-8?B?QlNGYUU5blRVSXVyR1VhN1JsclVlVUJNRExqb3VPcEo4VjFYNUpkR1A5YjNk?=
 =?utf-8?B?c1lsbVJWQXdVaGRXM2NSRG5EdjZZZDg5QWtreXd5UUd3a1FnOWUxUGpZTzQ0?=
 =?utf-8?B?WVJ1Q2pjejZGbmJSVVBwL3lOdUJLRVFsbnZ4U1ZKMmhjY3dwRDFmclhaejNQ?=
 =?utf-8?B?anE5L24yQlNhN0VmMkFWS3REY2tySHczVFBidnRlTjVROS9VZ3NqM25OSXNI?=
 =?utf-8?B?WmR2Sm93VzJkNWFTeHZOcFp5WXo3Q2k2ZnpnVWxDTjVZSDJ6eUJVelJRSjZU?=
 =?utf-8?B?ME5JaDZJeE5nZ05JNWw0dWFybXBvWHJZOFMySkU3ZXI5U0RGczg1dkc5SlNx?=
 =?utf-8?B?TUNLdXFabGVBRThWdkRxV0hWN3BjbXJHejRhdEExYlRhQm5lOEx4ditQMHV5?=
 =?utf-8?B?YnBaZU5xcUpvOXp0aHZsbG5IUVh2VURjbHZNeFltRUgyZ0FHS0RNT0t3MVA0?=
 =?utf-8?B?dHhkNzkrTHB4Mk4wckNycjhTa2Z3OVFHUkRqZlNHaWg4WkUwd2JSVi8wQjNK?=
 =?utf-8?B?emJYYkNSbTZ0aXoxbDF4WHJsdjNJZ1B4TjdLRHQ3OUxQb1BLRFlVQThOc2xX?=
 =?utf-8?B?Qm5YV1lBcENXSytCWTEvYm4vWkdURmVWVXFqb0luZ1ozMWNrbnozZ3pSUVNv?=
 =?utf-8?B?M1JPNFRxM0pnbGx0M1dJa2tjZmFtWG1MN1RxMlZYZmYzR3Jaa1NvdCtVS3Bp?=
 =?utf-8?B?VDYxMFVmQk1iT0hSWnNvTnQyVndkdnk4dWlsTEZMeS9CQnhTVkJwSUkvWC84?=
 =?utf-8?B?ckdzekZBSXdKbWZPS1JTeEFGaGsxUDFPQUVrNjAxQ0RtdVFPam85QmlwSjlN?=
 =?utf-8?B?UGk2ek5FKzlWNzNjTHRubnRkdDN6aWJJci96N3RRSHVNOGs2ZXBVdFRmY2tq?=
 =?utf-8?B?b3VSQ0xBam9vek0wcUlEVEY2a1NhcFl1TWVRbExQaHJ3U3VGRy9MQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E5FE73DAFC72042A45F4426C3336061@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4cb6705-38f5-41c5-235e-08d9e560c884
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2022 08:56:49.2110
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SU8tTIZZa3ylKQc/dwum49IKy96O5E0hTxqb0yAuTx8WtsZbBwf3MU6cNS+QypDzba/PyB/FR6Tm6B3JNLYwQeGlqmCRnUD4Cxx209j7VAMHwLbNX9q57WyUMkhRNDaz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB3929
X-Proofpoint-GUID: iElkrQrFAetVdpzHuEuv47a_DAXaf3za
X-Proofpoint-ORIG-GUID: iElkrQrFAetVdpzHuEuv47a_DAXaf3za
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-01_03,2022-01-31_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 mlxscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202010048

SGksIFJvZ2VyIQ0KDQpPbiAzMS4wMS4yMiAxMDo0NSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28g
d3JvdGU6DQo+IEhpLCBSb2dlciENCj4NCj4gT24gMTMuMDEuMjIgMTM6NDAsIFJvZ2VyIFBhdSBN
b25uw6kgd3JvdGU6DQo+PiBPbiBUaHUsIE5vdiAyNSwgMjAyMSBhdCAwMTowMjo0MlBNICswMjAw
LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+PiBGcm9tOiBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pj4gKyNpZmRl
ZiBDT05GSUdfSEFTX1ZQQ0lfR1VFU1RfU1VQUE9SVA0KPj4+ICsvKiBOb3RpZnkgdlBDSSB0aGF0
IGRldmljZSBpcyBhc3NpZ25lZCB0byBndWVzdC4gKi8NCj4+PiAraW50IHZwY2lfYXNzaWduX2Rl
dmljZShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+PiArew0KPj4+
ICsgICAgaW50IHJjOw0KPj4+ICsNCj4+PiArICAgIC8qIEl0IG9ubHkgbWFrZXMgc2Vuc2UgdG8g
YXNzaWduIGZvciBod2RvbSBvciBndWVzdCBkb21haW4uICovDQo+Pj4gKyAgICBpZiAoIGlzX3N5
c3RlbV9kb21haW4oZCkgfHwgIWhhc192cGNpKGQpICkNCj4+PiArICAgICAgICByZXR1cm4gMDsN
Cj4+PiArDQo+Pj4gKyAgICBzcGluX2xvY2soJnBkZXYtPnZwY2lfbG9jayk7DQo+Pj4gKyAgICBy
YyA9IHJ1bl92cGNpX2luaXQocGRldik7DQo+PiBGb2xsb3dpbmcgbXkgY29tbWVudCBiZWxvdywg
dGhpcyB3aWxsIGxpa2VseSBuZWVkIHRvIGNhbGwNCj4+IHZwY2lfYWRkX2hhbmRsZXJzIGluIG9y
ZGVyIHRvIGFsbG9jYXRlIHRoZSBwZGV2LT52cGNpIGZpZWxkLg0KPj4NCj4+IEl0J3Mgbm90IE9L
IHRvIGNhcnJ5IHRoZSBjb250ZW50cyBvZiBwZGV2LT52cGNpIGFjcm9zcyBkb21haW4NCj4+IGFz
c2lnbmF0aW9ucywgYXMgdGhlIGRldmljZSBzaG91bGQgYmUgcmVzZXQsIGFuZCB0aHVzIHRoZSBj
b250ZW50IG9mDQo+PiBwZGV2LT52cGNpIHdvdWxkIGJlIHN0YWxlLg0KPj4NCj4+PiArICAgIHNw
aW5fdW5sb2NrKCZwZGV2LT52cGNpX2xvY2spOw0KPj4+ICsgICAgaWYgKCByYyApDQo+Pj4gKyAg
ICAgICAgdnBjaV9kZWFzc2lnbl9kZXZpY2UoZCwgcGRldik7DQo+Pj4gKw0KPj4+ICsgICAgcmV0
dXJuIHJjOw0KPj4+ICt9DQo+Pj4gKw0KPj4+ICsvKiBOb3RpZnkgdlBDSSB0aGF0IGRldmljZSBp
cyBkZS1hc3NpZ25lZCBmcm9tIGd1ZXN0LiAqLw0KPj4+ICtpbnQgdnBjaV9kZWFzc2lnbl9kZXZp
Y2Uoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+Pj4gK3sNCj4+PiAr
ICAgIC8qIEl0IG9ubHkgbWFrZXMgc2Vuc2UgdG8gZGUtYXNzaWduIGZyb20gaHdkb20gb3IgZ3Vl
c3QgZG9tYWluLiAqLw0KPj4+ICsgICAgaWYgKCBpc19zeXN0ZW1fZG9tYWluKGQpIHx8ICFoYXNf
dnBjaShkKSApDQo+Pj4gKyAgICAgICAgcmV0dXJuIDA7DQo+Pj4gKw0KPj4+ICsgICAgc3Bpbl9s
b2NrKCZwZGV2LT52cGNpX2xvY2spOw0KPj4+ICsgICAgdnBjaV9yZW1vdmVfZGV2aWNlX2hhbmRs
ZXJzX2xvY2tlZChwZGV2KTsNCj4+IFlvdSBuZWVkIHRvIGZyZWUgdGhlIHBkZXYtPnZwY2kgc3Ry
dWN0dXJlIG9uIGRlYXNzaWduLiBJIHdvdWxkIGV4cGVjdA0KPj4gdGhlIGRldmljZSB0byBiZSBy
ZXNldCBvbiBkZWFzc2lnbiwgc28ga2VlcGluZyB0aGUgcGRldi0+dnBjaSBjb250ZW50cw0KPj4g
d291bGQgYmUgd3JvbmcuDQo+IFN1cmUsIEkgd2lsbCByZS1hbGxvY2F0ZSBwZGV2LT52cGNpIHRo
ZW4NCkFmdGVyIHRoaW5raW5nIGEgYml0IG1vcmUgb24gdGhpcyBJIGhhdmUgcmVhbGl6ZWQgdGhh
dCB3ZSBjYW5ub3QgZnJlZQ0KcGRldi0+dnBjaSBvbiBkZS1hc3NpZ24uIFRoZSByZWFzb24gZm9y
IHRoYXQgaXMgdGhlIGZhY3QgdGhhdCB2cGNpDQpzdHJ1Y3R1cmUgY29udGFpbnMgdml0YWwgZGF0
YSB3aGljaCBpcyBjb2xsZWN0ZWQgYW5kIG1hbmFnZWQgYXQgZGlmZmVyZW50DQpzdGFnZXM6IGZv
ciBleGFtcGxlLCBCQVIgdHlwZXMgYXJlIGNvbGxlY3RlZCB3aGlsZSB3ZSBydW4gZm9yIHRoZQ0K
aGFyZHdhcmUgZG9tYWluIGFuZCBpbiBpbml0X2JhcnMgd2UgY29sbGVjdCB0aGUgdHlwZXMgb2Yg
dGhlIEJBUlMgZXRjLg0KVGhpcyBpcyB0aGVuIHVzZWQgd2hpbGUgYXNzaWduaW5nIGRldmljZSB0
byBjb25zdHJ1Y3QgZ3Vlc3QncyByZXByZXNlbnRhdGlvbg0Kb2YgdGhlIGRldmljZS4gRnJlZWlu
ZyB2cGNpIHdpbGwgbGVhZCB0byB0aGF0IGRhdGEgaXMgbG9zdCBhbmQgdGhlIHJlcXVpcmVkDQpk
YXRhIGlzIG5vdCBwb3B1bGF0ZWQgaW50byB2cGNpLg0KU28sIGl0IGlzIG5vIHBvc3NpYmxlIHRv
IGZyZWUgdnBjaSBzdHJ1Y3R1cmUgYW5kIEkgYW0gYWJvdXQgdG8gbGVhdmUgdGhlDQphcHByb2Fj
aCBhcyBpdCBpcy4NCj4+IFRoYW5rcywgUm9nZXIuDQo+IFRoYW5rIHlvdSwNCj4gT2xla3NhbmRy
DQpUaGFuayB5b3UsDQpPbGVrc2FuZHI=

