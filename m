Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 923E845B913
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 12:28:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230358.398228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpqRx-0006o8-OO; Wed, 24 Nov 2021 11:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230358.398228; Wed, 24 Nov 2021 11:28:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpqRx-0006m2-LK; Wed, 24 Nov 2021 11:28:29 +0000
Received: by outflank-mailman (input) for mailman id 230358;
 Wed, 24 Nov 2021 11:28:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gGpx=QL=epam.com=prvs=1962e93d75=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mpqRv-0006lt-OZ
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 11:28:28 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a301fadd-4d19-11ec-9787-a32c541c8605;
 Wed, 24 Nov 2021 12:28:25 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AOAFnDj014606;
 Wed, 24 Nov 2021 11:28:23 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3chhcwrv26-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Nov 2021 11:28:22 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB2765.eurprd03.prod.outlook.com (2603:10a6:800:e1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 11:28:19 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 11:28:18 +0000
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
X-Inumbo-ID: a301fadd-4d19-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CApRkJm6VQKcGYvT27vUIqM5ypKf7JCE1P3LpGj/Emw8eJIPqJ+6lOZNx0Irpl2kiUTjv+AFLUeCLTMeaS5FvuqdKBCMJ57IXyQxvZK7j/4Y2LLnPxDi70pewNy1UgoKMtHtU8zBNDoRPsuqh6jXa90a4LpWZqfi56KD2Ra03sI36igBrp837OKJ/HfvVmfEC9wknO1Rnfeh4D2N/4M9tusNepG7GHw8oBYklb5MbrGaRH0h1LspuBxWYNtXN9wa60Gtoi3hqJc6enSsQAoMlTIgm96VgdhL7KvX+EkDDV6HI6on/uBRObgQxeWCpaIMkHxsl3FEqjIG6WCEX+ty3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rKz2L4sR7JssQTEC4wJObsF0gJL5kKJsK6R1kmixfI=;
 b=X35c+oPqde1iTUAIjQiyf/VeW6+f5wxaCr/W/Ec7/Hk9aCuay7LWyk5Ck/7c595O9F+eaVKh+Hfx1cYjhk6DIqhLN8DijfMlhczIvkL0MXgiwrjCeS6camT7He585Wjs5GmHwQl0PTV/bCjut7zSi+cR4bq5nyIUBsG0BRsdka0zLPd/vGny2p5Ev3Qm5p2ypOh9wVBUOzAciytMGtLxjPbZb6+F0ZwHJpRZUSzqUJVrDcZRFbZ8n5OPAuJ5R8vl2YysVqy09FnSkcTdwtpWWsVAitDSYCmfjkd4G/bPJtTVuEwnvPOCbU86i3lHiDHBLqTjDryBJMQ1LsItTtKFlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rKz2L4sR7JssQTEC4wJObsF0gJL5kKJsK6R1kmixfI=;
 b=Byvfzr7LB6E5yXWrjhRDeDOzlL7S7nVTCgXoX/fq86yaY4RAnylxYmvSVZebt88yL7SfTSvnoYdMrbR+cp8x4srf7RUdk22+rG/TZxr8/hTG5xQx/D4ar7HORHfaZsdoOl8lBMA4gXiX2IsGmA3+2ywdoFO9HBc5pxmF8vJlU5XGv1+Hgz6ozsgCzoxSlLLcRzvY0/Qg2U9qPRBjS8vwixRnn5pM+pMgmnF9jzTY0/yRng9R4Bq+NJ5Miag4xl+mALBs6iHmBG1oDxbT5sPQGxbmn+df6Z4I/vOUrJbnaJWfl6PHDCas7omGRbfQe0zfadgm+bmPjeG8qHFSRwvOMg==
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
Subject: Re: [PATCH v4 10/11] vpci: add initial support for virtual PCI bus
 topology
Thread-Topic: [PATCH v4 10/11] vpci: add initial support for virtual PCI bus
 topology
Thread-Index: AQHX0hJNBZwMmlboFUG58hx6442EAqwJkx2AgAkVfoA=
Date: Wed, 24 Nov 2021 11:28:18 +0000
Message-ID: <6c6951dc-2abe-e180-1442-e68097e59d22@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-11-andr2000@gmail.com>
 <217a5684-34af-e08c-2d70-563857ec5595@suse.com>
In-Reply-To: <217a5684-34af-e08c-2d70-563857ec5595@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 729840eb-5125-4c51-6dfd-08d9af3d83d6
x-ms-traffictypediagnostic: VI1PR0302MB2765:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB2765323F53ACF5074D392E98E7619@VI1PR0302MB2765.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 HaEppwkGP7gFRhKPdtA7hKU2a8Ic07419fNkGkVgA6jtIxu5PML46WLrP0jMIZJiXWQVvyL66In7kebKZBKrKS30dICnVuqkMPB/Zaj0jgdYZ8oZ8P20xVEYwuGkE4R26oU9lX/rE4PSbt8HsdrC0Fg213v3Noqg5pKhOs6qYhZiiy0tNoVFsrDSfZvJx5kVWK+1VINtRWbUzNho+A/Xgm1bL+Hz6MD2H1f8eT8j20WjRODDWx5HgjH+grbRjnV13QGmxnSx7/AjcC9TIy7FAH22Dz0aX9SZi/rZUrrxCuUAKMLIIYbFG65uPLJlITVKCMy+s3hGcXHWJYRv0rL6q3WQV/YzkNygSQp51zgBIg8R1lcaGTpGdQc3bv674dDIo0oh/dTHdiBauXo9niY4jbbFPHwOKZBD0GIz2xWkJa4hu/bbysBld+lyKVUkQAIBFKCEZAfXYOiSjuYsyvyvRUOO3UCmo7AwjFh1GdkzN6b7zKJesbTpBgrNZ7F8+Fahv+BvQjE9i993xUwKjG8KKUqpf02RYaWcxU+yD9XrvwrbnP0Yw1puJMrqHjIYCDR9Jw00+LWVHZExTuQj2ZlsKDsQPcjsUKOMX+AdlocxBeDrvwFt+aixEr7OiS4YS/ocGlXdC0rySernMa1+iI6tKhv7Cowbdy7NQlOULifzYyWnEWO40Pl9dUBoGOmYn5o1UzsgWAwsacOo9UM1suSfW03Eu0sKrKhejF6vlFMxqyUog+MAgXn7APjXhSnGdrjo
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(4326008)(498600001)(53546011)(6512007)(6506007)(186003)(83380400001)(38100700002)(38070700005)(122000001)(26005)(2906002)(54906003)(31686004)(5660300002)(110136005)(64756008)(66476007)(76116006)(66946007)(6486002)(66556008)(66446008)(91956017)(8676002)(31696002)(71200400001)(86362001)(36756003)(107886003)(7416002)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VnVTSHgyLzRESTJOaVJWdld6UTRlTnBySjBZaEZ1c3RjY1hFT0lWYisyaldu?=
 =?utf-8?B?VkJJeUJCQWRnTDRWSlNGRTMzYnI4VzcxYjhXajNXODhjNmtHdm1UYkNGZlRo?=
 =?utf-8?B?Tk5UYVpWVzBNdGp2bExXdm54eHM5eWJMY3lIZU0xMm9yUTB6Y0NxcTdadTNS?=
 =?utf-8?B?Z3FLdzZBb0Q1MzlYYXpLOXJDcFFaUlBhMDI1b1lnYTR0QjdObDdveEtYWFZr?=
 =?utf-8?B?eFhWbjVYKy8waWI1MFUraVYyQUVRdWd4NTlrb3IxZE1hNTMzOUgzWHhSSzhv?=
 =?utf-8?B?ZTRRdkNYaTVoc3B0VXRrTHpJaG84cE5DdGhhakM4ZVdMS0tTcUhtYjZzRHJ5?=
 =?utf-8?B?ZmkzNXJnUzhpR3JTNzNJQXFxRFdTV3A1RTJBSW9tYUdza3hkVmY2TC92OU9J?=
 =?utf-8?B?WHVXVWVCRk56amN5ZVlraDdCZmlrZXlHT2NOeFhCQzlKR09ZYWRQcWg3eVA0?=
 =?utf-8?B?b08rMDVUNGNVWHVlRzBIS0x1cFdEaDBJa2VPRTg2LzFPQWFxMU00YUYzMUZt?=
 =?utf-8?B?cWtyZEdDNS9XQkVKSm4wOXowd0FlTW1UUUNVeUQrekhTc09iSGZHdEs2dElp?=
 =?utf-8?B?YUptT3RUY0E2eVlYQS9FRDJNb2R2bUtlVngrSXp1SWxuM1dGWXEzVTZzeTZj?=
 =?utf-8?B?dmxmSGR6VURYUHdIeG9GZ1BWdXoxNEpLSmN5TU9WcVBrblB2RU9HZTNxZXVx?=
 =?utf-8?B?bXVsMUd3YVhiUHZXZUI5Yi9YNnJJRndoNlJUWFJPUHVaZXFuMVZWZ0xhK2lM?=
 =?utf-8?B?SlVNRVR1Wk9xRUg3NS9iTE1jTGRPclVCc05zcFZXSFZZR1JnRTNhZUF4LzV2?=
 =?utf-8?B?RVp3cys0OThkaGI1dzQyL2owZ0dHeXpUVmNsZnNTTUlHc3psem1jYVZSdzNF?=
 =?utf-8?B?amxmWmtSRTNNWUE0aWQyeTVEaFg3WVUvTXhFQ0xuK3pIZXNsZk9xb1dFTWlm?=
 =?utf-8?B?VnZuaFhnbEdXUFpUWm5CZG5rQzZiZ1hZM3hFTUtIb2t2VjRGMy91TmtWSWZJ?=
 =?utf-8?B?UHdzV3ZtZ014OTYrKzVLcGc4dHNKQlptcG1OOTFOcHBEcnFFbllWMC90VjdX?=
 =?utf-8?B?ei9xR1owalcvWENwYWpYN0VpSElNYTZsSEtMWlZkVy9uZmRTd00xM1RjdFBa?=
 =?utf-8?B?N1B4Mjd1eWdpMWJGd1Q5eFNiSmdabWVwTW5NWGc0NjNUSkI1YTQxaU9nN1NS?=
 =?utf-8?B?eFE1R09Vak9jRk4vN2xrYmI3ZjlaSDJsd0Jxa0M1MmllZ3dTOTFsdUlvSmd1?=
 =?utf-8?B?dmdBWTRDVjI0K1JzK1BCazE5WDZKMGV4TlBaY0RVRkhVWkFpRnlZYkNjR0Fo?=
 =?utf-8?B?bURscjJ5dEZEd2c2K251amlSOHhMQ1kvTFYwOHZDWFdVbVp5blpvQzNVNlV0?=
 =?utf-8?B?T0ptNTVSbEsvZ1MyV29nRDVXSllhb0xPYmloUU5uZEJ3RUZYWGZhSlVMOXZK?=
 =?utf-8?B?RFZNaWZmWklJTjhrODI3N01VNUUyWDJuaUM1VE01M2JRYkxScnJKbmVqbTUw?=
 =?utf-8?B?bjBTaVpXNy9SZ01VNnFUMkVZbjdCS2JBSTNFOHRnZGxlZkZDNUJhWStlOHFP?=
 =?utf-8?B?NFBnUjJ6N0xZS0NtWkxDZnEzdGVBOEdGTXF2bElIeUs1dVBEY0M2ekt5d0VN?=
 =?utf-8?B?UHppZUs2UVJZR294OUhpdWNOZnZSdTFxdlMvbDdkR1hCYUlTSzVYWTdxQk56?=
 =?utf-8?B?c2JicUpscFo5MmUyZUhIM2NxTTNqdXBEUjVEUjQrTzY5ZVV0TG4xVzJrWS8r?=
 =?utf-8?B?aXo5cGhFa3hndFFLZkMxdlVPYklyMG9CWlo2RE12VWk4aHhZRXF6NWxyOFdx?=
 =?utf-8?B?a0dCOWllYVZ4MGlBZ2tnYk95c2FCZzJxL09sYlI1Z1Z3dXY4SGhJMUJ2TWda?=
 =?utf-8?B?Q09RT1R5Yk5FSlZsMG9EMldQb2Z6OUtQaDRwangyc2VWazI3K0NJcEd5b3pS?=
 =?utf-8?B?VStVU05OWUtrNGxUdlZBNG9kSUhiRk9jZzRsS0RSYzZMc2FQa1YxdjZuTWVy?=
 =?utf-8?B?Qys0STBOZnczQ2R1Y0tVYjNSSCt4dDEvRFd3YWQzcTlaeEsyaURYK0tGT2NB?=
 =?utf-8?B?RTY1V2NFZ3lOdEpTL2ZucGZsSFNqaitQa25xenFJZmRDeGdBR0hBL1EvaVpt?=
 =?utf-8?B?eEZJQmM1MnBFM0xlRngzNEhiVTZwQUlwSWlBLzZReWgzTXdaN3ZySjlGMkJW?=
 =?utf-8?B?UmFncGMxMk1UdCtzVEQzZ2JOSlhraUw1WXlVY1JDa200bHE3RTR4R2RJVFlO?=
 =?utf-8?B?MTRQODNWRTRZWlFXdkRsN2drNkU2NlVJQVlNcmxlZzU0K0F4cHowV092Qitw?=
 =?utf-8?B?VVJCaGlBdEhncVIvVHVhSm9FZ0x4cG5pYURVZFUxZlVibVpjcjlTQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A25678C4C9AF264C86A1D7D0DE2088CE@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 729840eb-5125-4c51-6dfd-08d9af3d83d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2021 11:28:18.7896
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JIb0L71SbW9g5KbJu6oN4V5US+jo/C/dgKDo7kDjhehAAOYHGiP7PjsUrdDEinOfJSB4UXa2M0ix+WnQe4EzgOOb2T8FE9XHIFZqRvTQkWG4rTNrmyq4ugJOWVrMdbe+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB2765
X-Proofpoint-ORIG-GUID: 4GLPUT-FGOKEzl72gxhpMtczUHNH9Zie
X-Proofpoint-GUID: 4GLPUT-FGOKEzl72gxhpMtczUHNH9Zie
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-24_04,2021-11-24_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111240064

SGksIEphbiENCg0KT24gMTguMTEuMjEgMTg6NDUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAw
NS4xMS4yMDIxIDA3OjU2LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+IFNpbmNl
IHYzOg0KPj4gICAtIG1ha2UgdXNlIG9mIFZQQ0lfSU5JVA0KPj4gICAtIG1vdmVkIGFsbCBuZXcg
Y29kZSB0byB2cGNpLmMgd2hpY2ggYmVsb25ncyB0byBpdA0KPj4gICAtIGNoYW5nZWQgb3Blbi1j
b2RlZCAzMSB0byBQQ0lfU0xPVCh+MCkNCj4+ICAgLSByZXZpc2l0ZWQgbG9ja2luZzogYWRkIGRl
ZGljYXRlZCB2ZGV2IGxpc3QncyBsb2NrDQo+IFdoYXQgaXMgdGhpcyBhYm91dD8gSSBjYW4ndCBz
cG90IGFueSBsb2NraW5nIGluIHRoZSBwYXRjaC4gSW4gcGFydGljdWxhciAuLi4NCkkgd2lsbCB1
cGRhdGUNCj4NCj4+IEBAIC0xMjUsNiArMTI4LDU0IEBAIGludCB2cGNpX2FkZF9oYW5kbGVycyhz
dHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICAgfQ0KPj4gICANCj4+ICAgI2lmZGVmIENPTkZJR19I
QVNfVlBDSV9HVUVTVF9TVVBQT1JUDQo+PiAraW50IHZwY2lfYWRkX3ZpcnR1YWxfZGV2aWNlKHN0
cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gK3sNCj4+ICsgICAgc3RydWN0IGRvbWFpbiAqZCA9IHBk
ZXYtPmRvbWFpbjsNCj4+ICsgICAgcGNpX3NiZGZfdCBzYmRmOw0KPj4gKyAgICB1bnNpZ25lZCBs
b25nIG5ld19kZXZfbnVtYmVyOw0KPj4gKw0KPj4gKyAgICAvKg0KPj4gKyAgICAgKiBFYWNoIFBD
SSBidXMgc3VwcG9ydHMgMzIgZGV2aWNlcy9zbG90cyBhdCBtYXggb3IgdXAgdG8gMjU2IHdoZW4N
Cj4+ICsgICAgICogdGhlcmUgYXJlIG11bHRpLWZ1bmN0aW9uIG9uZXMgd2hpY2ggYXJlIG5vdCB5
ZXQgc3VwcG9ydGVkLg0KPj4gKyAgICAgKi8NCj4+ICsgICAgaWYgKCBwZGV2LT5pbmZvLmlzX2V4
dGZuICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgZ2RwcmludGsoWEVOTE9HX0VSUiwgIiVwcDog
b25seSBmdW5jdGlvbiAwIHBhc3N0aHJvdWdoIHN1cHBvcnRlZFxuIiwNCj4+ICsgICAgICAgICAg
ICAgICAgICZwZGV2LT5zYmRmKTsNCj4+ICsgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsNCj4+
ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBuZXdfZGV2X251bWJlciA9IGZpbmRfZmlyc3RfemVyb19i
aXQoJmQtPnZwY2lfZGV2X2Fzc2lnbmVkX21hcCwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFBDSV9TTE9UKH4wKSArIDEpOw0KPj4gKyAgICBpZiAoIG5ld19k
ZXZfbnVtYmVyID4gUENJX1NMT1QofjApICkNCj4+ICsgICAgICAgIHJldHVybiAtRU5PU1BDOw0K
Pj4gKw0KPj4gKyAgICBzZXRfYml0KG5ld19kZXZfbnVtYmVyLCAmZC0+dnBjaV9kZXZfYXNzaWdu
ZWRfbWFwKTsNCj4gLi4uIEkgd29uZGVyIHdoZXRoZXIgdGhpcyBpc24ndCByYWN5IHdpdGhvdXQg
YW55IGxvY2tpbmcgYXJvdW5kIGl0LA0KTG9ja2luZyBpcyBnb2luZyB0byBiZSBpbXBsZW1lbnRl
ZCBieSBtb3ZpbmcgdnBjaS0+bG9jayB0byB0aGUNCm91dHNpZGUsIHNvIHRoaXMgY29kZSB3aWxs
IGJlIHByb3RlY3RlZA0KPiBhbmQgd2l0aG91dCBsb29waW5nIG92ZXIgdGVzdF9hbmRfc2V0X2Jp
dCgpLiBXaGVyZWFzIHdpdGggbG9ja2luZyBJDQo+IHRoaW5rIHlvdSBjb3VsZCBqdXN0IHVzZSBf
X3NldF9iaXQoKS4NCkFsdGhvdWdoIF9fc2V0X2JpdCA9PSBzZXRfYml0IG9uIEFybSBJIHNlZSB0
aGVyZSBpc8KgIGEgZGlmZmVyZW5jZSBvbiB4ODYNCkkgd2lsIHVzZSBfX3NldF9iaXQNCj4NCj4+
ICsgICAgLyoNCj4+ICsgICAgICogQm90aCBzZWdtZW50IGFuZCBidXMgbnVtYmVyIGFyZSAwOg0K
Pj4gKyAgICAgKiAgLSB3ZSBlbXVsYXRlIGEgc2luZ2xlIGhvc3QgYnJpZGdlIGZvciB0aGUgZ3Vl
c3QsIGUuZy4gc2VnbWVudCAwDQo+PiArICAgICAqICAtIHdpdGggYnVzIDAgdGhlIHZpcnR1YWwg
ZGV2aWNlcyBhcmUgc2VlbiBhcyBlbWJlZGRlZA0KPj4gKyAgICAgKiAgICBlbmRwb2ludHMgYmVo
aW5kIHRoZSByb290IGNvbXBsZXgNCj4+ICsgICAgICoNCj4+ICsgICAgICogVE9ETzogYWRkIHN1
cHBvcnQgZm9yIG11bHRpLWZ1bmN0aW9uIGRldmljZXMuDQo+PiArICAgICAqLw0KPj4gKyAgICBz
YmRmLnNiZGYgPSAwOw0KPiBJIHRoaW5rIHRoaXMgd291bGQgYmUgYmV0dGVyIGV4cHJlc3NlZCBh
cyBhbiBpbml0aWFsaXplciwNCk9rLA0KLcKgwqDCoCBwY2lfc2JkZl90IHNiZGY7DQorwqDCoMKg
IHBjaV9zYmRmX3Qgc2JkZiA9IHsgMCB9Ow0KDQo+ICAgbWFraW5nIGl0DQo+IGNsZWFyIHRvIHRo
ZSByZWFkZXIgdGhhdCB0aGUgd2hvbGUgb2JqZWN0IGdldHMgaW5pdGlhbGl6ZWQgd2l0aCBvdXQN
Cj4gdGhlbSBuZWVkaW5nIHRvIGdvIGNoZWNrIHRoZSB0eXBlIChhbmQgZmluZCB0aGF0IC5zYmRm
IGNvdmVycyB0aGUNCj4gZW50aXJlIG9iamVjdCkuDQo+DQo+PiAtLS0gYS94ZW4vaW5jbHVkZS94
ZW4vdnBjaS5oDQo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vdnBjaS5oDQo+PiBAQCAtMTQ1LDYg
KzE0NSwxMCBAQCBzdHJ1Y3QgdnBjaSB7DQo+PiAgICAgICAgICAgICAgIHN0cnVjdCB2cGNpX2Fy
Y2hfbXNpeF9lbnRyeSBhcmNoOw0KPj4gICAgICAgICAgIH0gZW50cmllc1tdOw0KPj4gICAgICAg
fSAqbXNpeDsNCj4+ICsjaWZkZWYgQ09ORklHX0hBU19WUENJX0dVRVNUX1NVUFBPUlQNCj4+ICsg
ICAgLyogVmlydHVhbCBTQkRGIG9mIHRoZSBkZXZpY2UuICovDQo+PiArICAgIHBjaV9zYmRmX3Qg
Z3Vlc3Rfc2JkZjsNCj4gV291bGQgdnNiZGYgcGVyaGFwcyBiZSBiZXR0ZXIgaW4gbGluZSB3aXRo
IHRoaW5ncyBsaWtlIHZwY2kgb3IgdmNwdQ0KPiAoYXMgd2VsbCBhcyB3aXRoIHRoZSBjb21tZW50
IGhlcmUpPw0KVGhpcyBpcyB0aGUgc2FtZSBhcyBndWVzdF9hZGRyLi4uDQpAUm9nZXIgd2hhdCBp
cyB5b3VyIHByZWZlcmVuY2UgaGVyZT8NCj4NCj4gSmFuDQo+DQpUaGFuayB5b3UsDQpPbGVrc2Fu
ZHI=

