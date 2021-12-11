Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C650047130A
	for <lists+xen-devel@lfdr.de>; Sat, 11 Dec 2021 09:58:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245203.423221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvyC6-0004UD-Vq; Sat, 11 Dec 2021 08:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245203.423221; Sat, 11 Dec 2021 08:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvyC6-0004RI-SL; Sat, 11 Dec 2021 08:57:26 +0000
Received: by outflank-mailman (input) for mailman id 245203;
 Sat, 11 Dec 2021 08:57:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CEJF=Q4=epam.com=prvs=2979f4f7e6=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mvyC5-0004RC-Fa
 for xen-devel@lists.xenproject.org; Sat, 11 Dec 2021 08:57:25 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a6a6a8a-5a60-11ec-a74f-db008197e53d;
 Sat, 11 Dec 2021 09:57:23 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BB5x0P3017209;
 Sat, 11 Dec 2021 08:57:18 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3cvpaar5x9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 11 Dec 2021 08:57:17 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB3470.eurprd03.prod.outlook.com (2603:10a6:803:1f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Sat, 11 Dec
 2021 08:57:12 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::7593:b5e4:6534:5e55]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::7593:b5e4:6534:5e55%5]) with mapi id 15.20.4778.016; Sat, 11 Dec 2021
 08:57:11 +0000
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
X-Inumbo-ID: 5a6a6a8a-5a60-11ec-a74f-db008197e53d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aRH+mo9x9rj/pNeLjqEiaYuT2aFdsOaEYF2JQM3lXpE8TNhPBwdYdIAAv0kF4e1IH+ftf3Jx3rmk5Loj1YUgDu+nnPGMBfna7fvxA386KCnjj6z+qd1yKQoYE6DZLRmSpTC3d+LEQQsfOCh8UOC17DXdZatP9nXVoHBVygmWwNg8Q74vmEr/P0g4DSfOknmwWCxtUnlcK513KWAVdMmy8OMU1CMCshKG0tLK4w0bvtWtPBkgDHP1qV2ktHXiuhSSzUYV/GCspPA2vP8uWpfc3VED/A3f1EYL53bNAW1hUU2+YDjmUa6hXDQ3VYaVoUmohkDtwUgWbAFks3D1XP+9Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=99nK2sr9zhnAvkiKxB3DoZv/nFevP8TNWfxcbsWK5Uc=;
 b=GrvRRG/nkaEsCtR24HmyjBF1j8eL2uI38TwRWP3N3d2cz/eTiqghOFfQltL09XA3TiFppjmwzIQREqVmyU5qjYXq5pKowjqwqghfN7Oc3Be0SdjOCSS2hRpi5+364tb1wDGwhDvALhmBFWxkINkZUarZaAsDm9bo9GrsiNNHU8f40cJQ3BZCYvwnJ2QWzrFBUtJaLzWBWmdiPy5tdq/goSNr++UQJapfjCq0H/6PKjM2gZ4OhVCT2iM72FvH0E6eMFM1CyNwp0fQ/Uwl1y02V4+JYfKImDlQJNb+pOXc0M1gMWh3CKBprwqS/HvNpha/mP1tplG/Z5q7bRX3icmdrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=99nK2sr9zhnAvkiKxB3DoZv/nFevP8TNWfxcbsWK5Uc=;
 b=Xbc7WDmSqlTKsQfF7kcpQuAemo5aXC1or/lNwx6+KJgLn0cglPkZJowLqb4CpjEpFB23J+jyxNI9+J9bA5fU5bdt5Q9XwOLOzivVMbwF0njMoWWcPfGRBC1oJf59qsvq61oZ3sPSchU2MjTkCSzfwmfXCgONAUaTA9OXzLPW41vfvNpJzXNJrTGSBMCdMtBcAdudtDlSDI+mwlypTWw75aKffpb1twCocLOwXtqVyPBwJN9ajgpC4EeFweLDDzQxAS49YRh+dO98WETERozguwtmmpseNXXVT+w2IPmsX830V0MiihVExkDV2rYa/+QhLU/pvnArHBqOwSpwtdB3hQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Julien Grall
	<julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
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
Subject: Re: [PATCH v5 02/14] vpci: fix function attributes for
 vpci_process_pending
Thread-Topic: [PATCH v5 02/14] vpci: fix function attributes for
 vpci_process_pending
Thread-Index: AQHX4ewFDAQe3UpzbkCO75DuGK42PKwsGkWAgADxxACAAApIAA==
Date: Sat, 11 Dec 2021 08:57:11 +0000
Message-ID: <9ecf5a52-4fa8-04c7-d0f4-8d08b07fcf90@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-3-andr2000@gmail.com>
 <19c43763-966d-e336-9282-ff12b1b3b2c6@xen.org>
 <YbRfRv3x0lxZvPcw@Air-de-Roger>
In-Reply-To: <YbRfRv3x0lxZvPcw@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fdc0b36e-e0cc-4cb9-d16e-08d9bc84387c
x-ms-traffictypediagnostic: VI1PR0302MB3470:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB347004B9F76C3E577E95106EE7729@VI1PR0302MB3470.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 /a4x7zm/OCqlFv6uIIVYbz/rl2RL/T/3JxCZEtCI9Q082/A1wcGOvG+UavafORckwz92Hxa7lsanBf0v+At4uUHQ03Km4luBkKvh1FF00Z0XSKBUZ4+9SHV6ZGYaGiiTdgVjIQsXUn4gCXjI9NCZYEl0QHaObkK4Ys+u22yR7ceCPsNJu58XTkseK3MQ8yh+BJiv/Men7hA//wEsc+2Z0b4adFC8rRhGLLCvbjROIzvKdFkksjWzYhr34Txnic5fNkF8Igjd+UIT5BAX3TOTZuH3OC0/nBTItuE0K/mefutQ7AeSb7hBZ4xrHUbZXmfnXFUwrkBCPxCeI7W/2qehp0SBd99z8nJvhWVTXhHZpk9NzNcw9r7Q04QLER91bivSZSLWDmGJ08cji4gsr887XPyZd5mca9bgrT3vD0ILTgKzkcbU6s9xbBP58JoZONbpO1287DEqgQzfe2qP7GkpVn0c3bk2BaggiqzEwfxXgIaTtvQNrUgADdTbUF+YUUPWo4tbi9seU1tOpkLsmqzqILN1Krk3gChNncyxwd6JHr3uEFEYyOOb/trJ7mzVZyUHhGidfK++42fm2JePQET/ZhrXzuv0v1Q3kQdH12lPkmH3HLdl1MRSrkqn6IDxVPZx8Teq9RJqHVBjlw7aFpqgtrIUSL+riwBCNbMOqC8eSIdu9n/7EAyp9bSfRV4y68eVoPpHpASaTTqJRya57UfXgCvHxV65kj/QMQ8l+z5JL1AhDE6OsjUB5A0tQQZq+QyX
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31696002)(31686004)(86362001)(66446008)(66556008)(8936002)(8676002)(66476007)(66946007)(76116006)(91956017)(7416002)(508600001)(2906002)(110136005)(54906003)(316002)(64756008)(4744005)(38070700005)(55236004)(26005)(53546011)(6506007)(186003)(6486002)(6512007)(5660300002)(107886003)(71200400001)(36756003)(4326008)(2616005)(122000001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bk5YYkRvbEhJcGJhZndGVWc1bHRJMkViUUJLMEtZemRkK2lDTEVTallvUm1S?=
 =?utf-8?B?KzNMOFBLdlgxRlJMUW0wQ0xGOHEza0w5WHIzVXF6Mkp3dWJ5SEEwaVBLOS9U?=
 =?utf-8?B?TkxJSjNmamhOejd3bUkyTTlaVWovTTZXZU1nL1lCdmFQQ2MrMDgyWk9MS0VK?=
 =?utf-8?B?bElDNElVYXFFQzNTNU1Hd3dvSTY4MmVZOUdoRUNkOXVSL1RKRXVzZk5FSzdh?=
 =?utf-8?B?dzdRS2pYWE1rSkVFaEoyZjJTY3hFcmVUN2ZsVjgvUUNhbEhNLzRSVjY3a1lU?=
 =?utf-8?B?MGVQa1VsSDA1M0NBb3BWLzRpcmN2SmNkbkxCWFdvd2kxSVZaNkdWY2xnTEpU?=
 =?utf-8?B?RTlwTmFDbHFYbzBJUmVpZ2VJQmpHU0tMOUFHUEZqSFJnV0YyVkorWUkzdCtV?=
 =?utf-8?B?cDNWd0NnWkpPWjBnUjhnL3JXZVJvUHgzNjBGekhmRHRwRWladndEc2hPeE14?=
 =?utf-8?B?YjdNV09UU2RaUTk5TmlUK2R5OGdjVVJ5UW1BOUZ2b0Jad0tHZDAzNC81R1Fl?=
 =?utf-8?B?MEZidTBqdGkyK1pYYVhtZTJkc21qeGNUZTZKZmhiblRuTDlneE4zSk05T1l2?=
 =?utf-8?B?b2JkOTFQUFY4QzN5b09zeWZjWUpVSWhaOWhhSGRkQllhcU4ySDBQQUYyNTJq?=
 =?utf-8?B?M3RQZDI0SFhMZEJOdlJyakNaU2hBYjh2bDF0Q01qYkZvOGlEbzNDVjlkbUc2?=
 =?utf-8?B?QzRwS1BteGlJdDVJalM5MDRNMUxOOGVrRnlMM3F6RVkveGlQK1F2R2dMRjZx?=
 =?utf-8?B?b1FzeG9ZV0plRkFzb01SZmw0eEpqWHhmMTViMDFEdlpBaDJDWFA2SEZYSTNL?=
 =?utf-8?B?VWdQTGtGak4wZmJwOCtOM3V2STNOU2ZvMWxBejI5YXd6dm9JRFRTa1k3dlZo?=
 =?utf-8?B?a25MUGJCaTZWQldPa3Z6WU81U1h1eUc4b3N0MzQrQTdqUlpibVp3ZG4rd29C?=
 =?utf-8?B?TWwvOHFkRkpQZkQrYjhCUTdFMkhsSjV4aE0rbnYvejZ5ZHJkQjZvTlhUOVdL?=
 =?utf-8?B?Ny9TdSs0OFFieGdKd0M3akNsK2RBTXNFSVZCbm1vL0xYOEFkaXV6NzI3eDRZ?=
 =?utf-8?B?WTVJb1lHblU4dTZha2VCWjlqR0Q5UHExbzdtRWJiSUNZUmNXWW9OZFBURkow?=
 =?utf-8?B?Znk5cHBOOEhpOTA4UFdYb2JJdzYxN3E1eWd1ZUFYSjJtRkpRVmhzV28xVGpj?=
 =?utf-8?B?eURxdWhKT2M0Z3VzellxeHpFcHBRTi8wRW1VNllvenNORkF6bXNiNXRmODNw?=
 =?utf-8?B?Y1MrZGhNSGt5RWV6K2YxZllDd1ZJMkVQT2lsei9XYVZZeEtVVmZQeGxTQjU4?=
 =?utf-8?B?TThMOFNUa0FhOXE1SjlqZDFuQ3hRZlJ2dXROUjVTbVYxQ2kwVUVuT0Qva0lt?=
 =?utf-8?B?aHRTRnVxN3NFYWhDTC9KRmZxc3hJcjlQbzk1WmpiRVFiU2kvM1RpNGZBbENY?=
 =?utf-8?B?K0pIRDB0cGsvZ1Q3KzFaSFFzRk9qM1NDTnJWZ0QyVm50bnVrQ2VBQjZFTldr?=
 =?utf-8?B?b3prSGJhQlVkMjR0YTNIc0J1VFBjK2tHN01Helhyd0pBR25EMnc4MW51a3lP?=
 =?utf-8?B?TmNqTjFpVFRSbjVPeURoVVRrcGVPUythOXk4MTl0SGNLeERJTTBkNFh6WCtH?=
 =?utf-8?B?azBqc252OU9hK1pDSi9VTXFybUVOTDNNU2hqYUl1ZzRGdlpySlNiSVpMTlhM?=
 =?utf-8?B?TlN1TkRhWFFmUXM4ZTliVFE3ME4xMkZ3WEx6UnV3WldVLzMvVjc3WUZwU01E?=
 =?utf-8?B?WXpYZGRZVHJmaXVqdHlzTVdYamFEL2JRb3ZJaVoxMnltVUp4cWZOWTUrMlE3?=
 =?utf-8?B?bjJ0cXZ5d1VSWXQvWW5xU1BmSjZuNlZtNnFzaGxWcXJqRlRQU3ZreVlGa2N0?=
 =?utf-8?B?cVFqdm4rTTVlczRLZ2ZxZHVFZy9RVU40VURRSm5pd3Q1Q0lUTFNwOTd0SVQ0?=
 =?utf-8?B?STk4MjVVQXhsS0lSRjlaaW5qRWhpc09NNGJob1JibXc3MFoxclVkTTJwdjJI?=
 =?utf-8?B?SFJ6WmZISnRRUHRPbXVqSVFoUENmUk01emNzYUVtV3NQVTA4TWo3Uk1RbGh0?=
 =?utf-8?B?Mm85UmJXQUVhdlNqNWVjY0lHVnFOeFJmYUxnb25WRXdydGtQZFM2VGxSY3Fo?=
 =?utf-8?B?b2JmVzlMTEUyb1V3TllhMUhkSUdpbFM2b2Nha29KcFZpVFVOM1JDK0orbVBF?=
 =?utf-8?B?UkZySTBsZkNjMk5mSkhGTXVvTTNnNWN2cmVPT1hpSUc2UHZQTVRsUnd4QlQr?=
 =?utf-8?B?ZnFFTlkzSW5BWEFpTTZJTDM4ZnR2LzFlbnUrUzNvZS9YVFFtODJrWjd3OG1K?=
 =?utf-8?B?dU1NOGpaR3FTN05MRWRZNzcwYUxUejdSWHpzdXJQYzdJTFJzMHI1VW1Jb2lI?=
 =?utf-8?Q?amWDKEUcOdNMJjD4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6BA07D634B607C4C86E13D4567FF2EB4@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdc0b36e-e0cc-4cb9-d16e-08d9bc84387c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2021 08:57:11.5296
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FjEjb0Xj5mb+SnH7ogjfVTm68OKYGuN9olxHU/e3PlsiuE6opoOvx4pSGSettAuis/ccSgQLhX5xGdXN7Rct/KyGWNRsBBsn28h0X9PMBSq+PnS57zS4h6yyUi8s53mf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3470
X-Proofpoint-ORIG-GUID: l8NuhSNdVEVUH-ZvjnZnAMYZ1s3kP4Hp
X-Proofpoint-GUID: l8NuhSNdVEVUH-ZvjnZnAMYZ1s3kP4Hp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-11_03,2021-12-10_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=973 spamscore=0 impostorscore=0 mlxscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112110047

SGksIFJvZ2VyIQ0KDQpPbiAxMS4xMi4yMSAxMDoyMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToN
Cj4gT24gRnJpLCBEZWMgMTAsIDIwMjEgYXQgMDU6NTU6MDNQTSArMDAwMCwgSnVsaWVuIEdyYWxs
IHdyb3RlOg0KPj4gSGkgT2xla3NhbmRyLA0KPj4NCj4+IE9uIDI1LzExLzIwMjEgMTE6MDIsIE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+Pg0KPj4+IHZwY2lf
cHJvY2Vzc19wZW5kaW5nIGlzIGRlZmluZWQgd2l0aCBkaWZmZXJlbnQgYXR0cmlidXRlcywgZS5n
Lg0KPj4+IHdpdGggX19tdXN0X2NoZWNrIGlmIENPTkZJR19IQVNfVlBDSSBlbmFibGVkIGFuZCBu
b3Qgb3RoZXJ3aXNlLg0KPj4+IEZpeCB0aGlzIGJ5IGRlZmluaW5nIGJvdGggb2YgdGhlIGRlZmlu
aXRpb25zIHdpdGggX19tdXN0X2NoZWNrLg0KPj4+DQo+Pj4gRml4ZXM6IDE0NTgzYTU5MDc4MyAo
IjdmYmIwOTZiZjM0NSBrY29uZmlnOiBkb24ndCBzZWxlY3QgVlBDSSBpZiBidWlsZGluZyBhIHNo
aW0tb25seSBiaW5hcnkiKQ0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4gUmV2aWV3ZWQt
Ynk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQo+IFJldmlld2VkLWJ5OiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4NCj4gSSB0aGluayB0aGlzIGNh
biBiZSBjb21taXR0ZWQgaW5kZXBlbmRlbnRseSBvZiB0aGUgcmVzdCBvZiB0aGUNCj4gc2VyaWVz
Pw0KSSB0aGluayBzbw0KPg0KPiBUaGFua3MsIFJvZ2VyLg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

