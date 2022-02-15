Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A31C34B6F71
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 15:54:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273269.468390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJzDo-0003Pm-Fc; Tue, 15 Feb 2022 14:54:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273269.468390; Tue, 15 Feb 2022 14:54:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJzDo-0003Mv-Bp; Tue, 15 Feb 2022 14:54:28 +0000
Received: by outflank-mailman (input) for mailman id 273269;
 Tue, 15 Feb 2022 14:54:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xOiq=S6=epam.com=prvs=4045782cdb=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nJzDm-0003Mp-68
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 14:54:26 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 297c73db-8e6f-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 15:54:24 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21FEjLHo030307;
 Tue, 15 Feb 2022 14:54:20 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e8dky86j2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 14:54:20 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR03MB2958.eurprd03.prod.outlook.com (2603:10a6:802:2d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Tue, 15 Feb
 2022 14:54:16 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73%4]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 14:54:16 +0000
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
X-Inumbo-ID: 297c73db-8e6f-11ec-b215-9bbe72dcb22c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SZJBzpPAZgDVRdQ+Rhx8khYagEPiY19wzqgl5VOyX53E7Z1X2N56XlFKDKPK9bHaO1P2xhUKsPfK/CEc5rEhHj0XYXZ+JigQ6HvLJ6/uHF+4M4D8u2XcOXGuy2MYSO4DB2fuuz6CW/8lS/9aNj/B7BQcPGSJdg4KDoxoN2d1M0c7SjbxlGHKfSanJgbnd6Ad1Jgb7Q2iHYJ6QmWOqNxssrurHJtQCw0K48DDqgbiE9w1Q/6SaIQlfukvtCqCpbRy/LHck47QBIOd4OPpvpznIoPSyHiyiJeGtl+nZjTXSFAlF3Sy1DGNsmQex5n1xmXapgT/ienUdGQK+UHTgXmNfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grJ8uqXQhD6KACc2B+omCmEyqZdwimffM0KIj5QAK9I=;
 b=bGUJdkei/JsXYvG06l84FauzMpVD+SnWqDYwDUa+XxOV00WwxYO0MJh0WxcLdncsDV7EAKOaLxW476A+WwUDU/Q6sAuCoxkc5EYJb+ksfRPOBGoT8YbWbBgfMWEDTXSl7bs6+RYCkzVyRikQgLBGy9nIxAoGEDPXMVRT95RJrccduep5has/sGk4VmoWK9EdNjTpo78OEg4G2t5KM72SPxNCpcWtqDePWK7QmGq8lRFdhJ6S5JAXN1IoeYGfsCVWhjzlLw39Owz6y5pdcZ3Bsb6WO23J1/m/EIxrolFct8JXlmAlwfQc226c9oVFu+MCVrWMvl3awKXNcRCtJa6IBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grJ8uqXQhD6KACc2B+omCmEyqZdwimffM0KIj5QAK9I=;
 b=IfXDy8a88b4We674ogEPkfmUY/dmCshyN0psV8Np+slHms1IHdPsJLTEoVA1LkzRz6HJxIJzTOVfAfdSpLY6N5giXtn75K4dQLfDCaxIftjdTe3AqkuikYLeWwZdV55Fo6MY7z/gZ0rxQp9Jg4mwlJ64RCif5Ry4zkjO3J6mahjqMHktqNLE++3zDCiP4cz5gkJjqGl79mcY/fugOX8BacOPMLTzqL6oGh77S3EHDb1iEl7KTE/kLTB/+qg2bR7c67vJdCylDBsTiTNDyz6RMK7CsmqXXzfkCfUiZVNOf9E89l9mwqlkGtvajyBwsWqAEKYKGe8ynCrUDyYmc5wl8Q==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
        Juergen
 Gross <jgross@suse.com>,
        Anthony PERARD <anthony.perard@citrix.com>,
        Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH] tools: remove xenstore entries on vchan server closure
Thread-Topic: [PATCH] tools: remove xenstore entries on vchan server closure
Thread-Index: AQHX7cJnOJurcgYme0yvunOBFlJKtayVGKiAgAADoIA=
Date: Tue, 15 Feb 2022 14:54:16 +0000
Message-ID: <bc1ab993-0316-89d9-0f20-921b2931a0e3@epam.com>
References: <20211210123519.595163-1-andr2000@gmail.com>
 <CAKf6xpu76umJXWJm2FyG2ST6fm0_iU7RSGGQkTt7_uG_HLi-iw@mail.gmail.com>
In-Reply-To: 
 <CAKf6xpu76umJXWJm2FyG2ST6fm0_iU7RSGGQkTt7_uG_HLi-iw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 01752adb-555d-49f6-3b45-08d9f093099e
x-ms-traffictypediagnostic: VI1PR03MB2958:EE_
x-microsoft-antispam-prvs: 
 <VI1PR03MB2958D1D214AF22DE1519C68FE7349@VI1PR03MB2958.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 /UqVeP1VaIbaKHevN4Ve+tcyUFA5cD3rV4PUKxR9Tar90fwvgW2A8Av4heaqlpui7geERQ0sKGhG/ysCnnchoDasgKgRmDqBJqxLZlzGEwEFdQjJ9yie0xOb+ziBOss8AGpyblaHpi4olA8EPbey0nSQGBO77axoLhQBDetu3pnUTc30Ue0kmkY74uNqc2eHl9skOECknBLkDfa4f4T2KjAiHBjlVg7BH3uDcgS/N9nlTFzrhNR9M0O3vAghUhlq6RaGx2S3lKBErP9EiEiMlAgqKq6HGtFP+6Kn9EcssKPFe3UhU3snGQXi4tbrjgcFGhnfRw+GBw5a1vXBznkC7ZyahhRn28WGA7oSVS0F11tCdnfjLpKkHQ64LjoWFPoKkHFv+uclw+E452GLPVvH9+JrGxmdtmgrg0Ph6cwPlLu5eS8bnFZyTgurFDc88BH1Njwu1R/XwhcmSWlRjEdakkW5aL/2dEHThRwUm8SbQkhQ2jUSGFMuyFsbTe3rgDtJWmAJA50n5hH2QGscBA+yC8CCiDj2DPEUjVvkA+y+4q8x8nkTe5dwzylc3J4EpGHjpzjVmO4Hd1TAa1ehqBQGUrRfqFtH93d+1KQDrQid5cRttgF2DsaxmlscAlqB1N9zOCeFGXbqVazuhp+v4gq2E9lDf3lOFwiAEJoxQwslmGRosTZflJYjk3QeMYm2Nv/RXE/1W/cLgqPoj1p0/0H7KPDijNtBppTIL86DPcLmC+7XEAsRHa7NvgIRkcpzhILp
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31686004)(8936002)(508600001)(2616005)(76116006)(36756003)(53546011)(6512007)(66946007)(107886003)(86362001)(6506007)(26005)(186003)(122000001)(54906003)(2906002)(38100700002)(6916009)(91956017)(316002)(6486002)(5660300002)(38070700005)(66556008)(66476007)(64756008)(66446008)(8676002)(4326008)(31696002)(71200400001)(83380400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VEpreFQ4ekN1ZXNhVVcvMXdmWGlRYnJHek5XemtxQzBKcHEremJoMWdRcmZh?=
 =?utf-8?B?NGR5bHRvaFcvV2lGZy9TOVY1ZTVSZkVLdU9JL2hyRWlSMHpvRllxQjJ5dkxU?=
 =?utf-8?B?UDAzZVNBbXBFdFRKYmlNL2pVaTFwZHM1QXBGWFR3WitteHFYV0g4REg4NEFS?=
 =?utf-8?B?SEUxdUtxaS9EZE5oZVY2ais2dERmMFQzSEVuOHJRelpPemRtOFZZVHhEYzRz?=
 =?utf-8?B?RlpzRkwvc05VRDUrQjU3ZVE2L0xSU2FLQkkwMWlGMitDeWhDUDluZGFvakts?=
 =?utf-8?B?SXhqNDhjc0FKK0NTMTdOS0FYVFc0bWV6dzVQWUpPbEJtZ0FRc1Y0Z2tLSEtp?=
 =?utf-8?B?OEFoZFl2T2tsdHUwVW84NjYxNUMwOGpITG5Xa2dSRTZJaFZkcytlODFEWXFs?=
 =?utf-8?B?THlMeUpmeW1VODBjdmZyMjNTUW9mTFp1dTRZMURPa3hLcWdXT1c2VzBUaVFk?=
 =?utf-8?B?bzdZNzMxYnY3WTVyUzJoNTN3MDhFejNWKzFPS1dyVzhTMU5HMGRLM1lJR0N6?=
 =?utf-8?B?eit5SFBPQXZ2ZXBHSFNDeWZiVVoveGdPTzVocEhBVzBrSXhLeXNSSWdsOVRS?=
 =?utf-8?B?RkFrUkpZUktpblRoemJ3NmN0VlNIZVVFbFd0c1Y4UGlrOVVzMGRmRzRJaUtP?=
 =?utf-8?B?SXhlZVJpYnc1cnlmWGJuYnhkNkRZSmlUVHdVUkl5cGdEcHJqb3g5UkdWYkRm?=
 =?utf-8?B?RDlXQ2FLcXBHTmVUa2FpRnlQNVBHOGZ4SWtUcDhLcW0vZjdzVGxzU2ZTU0NV?=
 =?utf-8?B?c2g2aXJ1UkkvY1NhMXpTNDQ3V3lGa05YRHl6T2Zad09pSHdURnBkRHJwZU4v?=
 =?utf-8?B?L05ocVFjOXpXczlrZGFKZHdYUmJYOHBIWkRZdjllU1BHam10cE55UFJuRG9i?=
 =?utf-8?B?aTN2d1B6Wlg1OTRNWlRPdm4rWDZ6OHNPclVPaVJ0c2VGeGMza0dPOVpmeERY?=
 =?utf-8?B?WEUrdHh2RzdjWkQxc0ViSTlsUG1HMTJ0NnhFblYxWEkrYW9sSEQyWGxoMEwx?=
 =?utf-8?B?N1Jvb3pEZFdxYmlGVFZacHpDZnQrZnNLZ092OEwvcWRGdnFRUmd5VjFqUlRF?=
 =?utf-8?B?amoxbkFtclZTRTBjeVZaSkxza25oUVhaM2s0Rll2Y3EzYkh6V2lTU0Fidk5y?=
 =?utf-8?B?VFIrZUJsT05MUENiSTFENVVhaVR2OCs5Q0hCOGxqVHU5REdoVVBkOEU3Vnd0?=
 =?utf-8?B?d1hIK1ZjKzM1L0tRN2dzVnRvNVFzWThHZDlNeWI4YmNuNWV2enhRbGg3RUdm?=
 =?utf-8?B?Q3Vsdjk2L0h6Ty80UFhLTHdqdE42YXVZcXFmNmtSSmNIM3N1WldEZFN3MDdM?=
 =?utf-8?B?RHFpVVFVcE4xbnpBUVNGN1o1RjkxczVNbVZtcDFEcWpFb0JtVVdsSmtVRitj?=
 =?utf-8?B?VEVDYlhGcXBYb3ZKQ3UvZkRHeVBsR3VHaEdPbXA0ckJwVUlhQm9Zampma3pP?=
 =?utf-8?B?ZXB1S3VVZ1NJNFErYlNoYVBWcEoyWXQ5cWN1Z0hrQkJqb0sweEpZT0EwN0VU?=
 =?utf-8?B?akp5U2VwdXIrMkp4alJlQUxXMkxKM2RJbk81MlROTDVQNTVjOVZ1TGJNV3A1?=
 =?utf-8?B?dExVdnRKQy9adlp2Ymk3VVFnbGNJcGFWQU1ySFQ2UHNBTHZpcVc2cG5Qd0hT?=
 =?utf-8?B?WkJBM0hqdnRHelZGa1NXSnAwait0TmQvYkxZK3JjM25Ea2JHcW1ucnBTU3Br?=
 =?utf-8?B?cC9EeDZBYk5PVEVMbDdqMFZld3VxS2RTZmxjck03dWs1bDVscGhJb1pjSlpM?=
 =?utf-8?B?QzYxcVdQai9mbG0yTi8wdlF3Qmt4cHMzN25KdEdsY3EyTDRXL05MRVNKMWRN?=
 =?utf-8?B?NFBHNXVYOUhmZE9ZbkJIRVJjWlhiRU5yRXUzYWhhMGZTM1paUDVXdVQwUXU4?=
 =?utf-8?B?SFZJU05ZSmh0d0czRFkvckdEY25QWFVSYjZ5MEc3ZXpER1AzZmozbXFxZ2dt?=
 =?utf-8?B?Umg3aFlJM2EvbHpoc2NuQjJYN3VjalNsL0UyRjJDU2dBTytjVUozNjI2QXl1?=
 =?utf-8?B?bUVjSklHRzJ0aUZCMDY3LzAwZ2REUE1xbllmRisycVJXWjNaU1NsamJJSXg1?=
 =?utf-8?B?b3k4WjNtcVhGT1h1MnBxeWpSM0NGVVJTM1l3VE13bUpPRDQvd0NRNzA1T285?=
 =?utf-8?B?UDBkdjlRcWVMN2hLSk1vcWFhV3dYaURMNlQ5M05pTVMxbUFRYkFMVmVsN0pj?=
 =?utf-8?B?UFhaMUgzbEU4aXYxK0JBRzdTYUpqZ0pESFZudU10bk1LSG45YlBSSU8zYjNw?=
 =?utf-8?B?TWg2SmlDUkdRMkVBS0ptRVdTdTQyM3JwVkRRcnZGOG10VHRCVjM3bjVBOGIx?=
 =?utf-8?B?Y00xMmh5Y29XVGtrR1ZPSW5zeGtUNW9nNWcvcFg0TnF3U1gvdmo5dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <116C96751329824D8972F9C751BE90D8@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01752adb-555d-49f6-3b45-08d9f093099e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 14:54:16.0922
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iTgKQISvC82AfVB/JG4SBi3TXmU+k6MrHAaQiQ7abjHSVFrmLXKPtePprivwuRQN0Qw3G01Yu7e2NhPvYZFN4k35V93zusAvyoOtAbhigTc0naC+wHDQyHA2unHqXHQg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB2958
X-Proofpoint-ORIG-GUID: NshA4DnjmfOZVtcFyeEyTSY72qRWsBhM
X-Proofpoint-GUID: NshA4DnjmfOZVtcFyeEyTSY72qRWsBhM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_04,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 mlxscore=0 priorityscore=1501 phishscore=0 malwarescore=0 impostorscore=0
 mlxlogscore=894 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202150087

DQoNCk9uIDE1LjAyLjIyIDE2OjQxLCBKYXNvbiBBbmRyeXVrIHdyb3RlOg0KPiBPbiBGcmksIERl
YyAxMCwgMjAyMSBhdCA3OjM1IEFNIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvDQo+IDxhbmRyMjAw
MEBnbWFpbC5jb20+IHdyb3RlOg0KPj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9s
ZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4NCj4+IHZjaGFuIHNlcnZlciBjcmVh
dGVzIFhlblN0b3JlIGVudHJpZXMgdG8gYWR2ZXJ0aXNlIGl0cyBldmVudCBjaGFubmVsIGFuZA0K
Pj4gcmluZywgYnV0IHRob3NlIGFyZSBub3QgcmVtb3ZlZCBhZnRlciB0aGUgc2VydmVyIHF1aXRz
Lg0KPj4gQWRkIGFkZGl0aW9uYWwgY2xlYW51cCBzdGVwLCBzbyB0aG9zZSBhcmUgcmVtb3ZlZCwg
c28gY2xpZW50cyBkbyBub3QgdHJ5DQo+PiB0byBjb25uZWN0IHRvIGEgbm9uLWV4aXN0aW5nIHNl
cnZlci4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xl
a3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+PiAtLS0NCj4+ICAgdG9vbHMvaW5jbHVk
ZS9saWJ4ZW52Y2hhbi5oIHwgIDUgKysrKysNCj4+ICAgdG9vbHMvbGlicy92Y2hhbi9pbml0LmMg
ICAgIHwgMjMgKysrKysrKysrKysrKysrKysrKysrKysNCj4+ICAgdG9vbHMvbGlicy92Y2hhbi9p
by5jICAgICAgIHwgIDQgKysrKw0KPj4gICB0b29scy9saWJzL3ZjaGFuL3ZjaGFuLmggICAgfCAz
MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+PiAgIDQgZmlsZXMgY2hhbmdlZCwg
NjMgaW5zZXJ0aW9ucygrKQ0KPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvbGlicy92Y2hh
bi92Y2hhbi5oDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2luY2x1ZGUvbGlieGVudmNoYW4u
aCBiL3Rvb2xzL2luY2x1ZGUvbGlieGVudmNoYW4uaA0KPj4gaW5kZXggZDYwMTBiMTQ1ZGYyLi4z
MGNjNzNjZjk3ZTMgMTAwNjQ0DQo+PiAtLS0gYS90b29scy9pbmNsdWRlL2xpYnhlbnZjaGFuLmgN
Cj4+ICsrKyBiL3Rvb2xzL2luY2x1ZGUvbGlieGVudmNoYW4uaA0KPj4gQEAgLTg2LDYgKzg2LDEx
IEBAIHN0cnVjdCBsaWJ4ZW52Y2hhbiB7DQo+PiAgICAgICAgICBpbnQgYmxvY2tpbmc6MTsNCj4+
ICAgICAgICAgIC8qIGNvbW11bmljYXRpb24gcmluZ3MgKi8NCj4+ICAgICAgICAgIHN0cnVjdCBs
aWJ4ZW52Y2hhbl9yaW5nIHJlYWQsIHdyaXRlOw0KPj4gKyAgICAgICAvKioNCj4+ICsgICAgICAg
ICogQmFzZSB4ZW5zdG9yZSBwYXRoIGZvciBzdG9yaW5nIHJpbmcvZXZlbnQgZGF0YSB1c2VkIGJ5
IHRoZSBzZXJ2ZXINCj4+ICsgICAgICAgICogZHVyaW5nIGNsZWFudXAuDQo+PiArICAgICAgICAq
ICovDQo+PiArICAgICAgIGNoYXIgKnhzX3BhdGg7DQo+PiAgIH07DQo+Pg0KPj4gICAvKioNCj4+
IGRpZmYgLS1naXQgYS90b29scy9saWJzL3ZjaGFuL2luaXQuYyBiL3Rvb2xzL2xpYnMvdmNoYW4v
aW5pdC5jDQo+PiBpbmRleCBjODUxMGU2Y2U5OGEuLmM2Yjg2NzRlZjU0MSAxMDA2NDQNCj4+IC0t
LSBhL3Rvb2xzL2xpYnMvdmNoYW4vaW5pdC5jDQo+PiArKysgYi90b29scy9saWJzL3ZjaGFuL2lu
aXQuYw0KPj4gQEAgLTQ2LDYgKzQ2LDggQEANCj4+ICAgI2luY2x1ZGUgPHhlbi9zeXMvZ250ZGV2
Lmg+DQo+PiAgICNpbmNsdWRlIDxsaWJ4ZW52Y2hhbi5oPg0KPj4NCj4+ICsjaW5jbHVkZSAidmNo
YW4uaCINCj4+ICsNCj4+ICAgI2lmbmRlZiBQQUdFX1NISUZUDQo+PiAgICNkZWZpbmUgUEFHRV9T
SElGVCAxMg0KPj4gICAjZW5kaWYNCj4+IEBAIC0yNTEsNiArMjUzLDEwIEBAIHN0YXRpYyBpbnQg
aW5pdF94c19zcnYoc3RydWN0IGxpYnhlbnZjaGFuICpjdHJsLCBpbnQgZG9tYWluLCBjb25zdCBj
aGFyKiB4c19iYXNlDQo+PiAgICAgICAgICBjaGFyIHJlZlsxNl07DQo+PiAgICAgICAgICBjaGFy
KiBkb21pZF9zdHIgPSBOVUxMOw0KPj4gICAgICAgICAgeHNfdHJhbnNhY3Rpb25fdCB4c190cmFu
cyA9IFhCVF9OVUxMOw0KPj4gKw0KPj4gKyAgICAgICAvLyBzdG9yZSB0aGUgYmFzZSBwYXRoIHNv
IHdlIGNhbiBjbGVhbiB1cCBvbiBzZXJ2ZXIgY2xvc3VyZQ0KPj4gKyAgICAgICBjdHJsLT54c19w
YXRoID0gc3RyZHVwKHhzX2Jhc2UpOw0KPiBZb3UgZG9uJ3QgY2hlY2sgZm9yIE5VTEwgaGVyZSwg
YnV0IHlvdSBkbyBjaGVjayBmb3IgTlVMTCBpbg0KPiBjbG9zZV94c19zcnYoKS4gIEkgZ3Vlc3Mg
aXQncyBva2F5LCBzaW5jZSBpdCBkb2VzIHRoZSByaWdodCB0aGluZy4NCj4gQnV0IEkgdGhpbmsg
aXQgd291bGQgYmUgbW9yZSByb2J1c3QgdG8gY2hlY2sgZm9yIE5VTEwgaGVyZS4gIElzIHRoZXJl
DQo+IGEgc3BlY2lmaWMgcmVhc29uIHlvdSB3cm90ZSBpdCB0aGlzIHdheT8gIE90aGVyd2lzZSBp
dCBsb29rcyBnb29kLg0KSXQgZG9lcyBuZWVkIGEgTlVMTCBjaGVjaywgdGhhbmtzDQpJdCBpcyBh
ZnRlciB3cml0aW5nIGNvZGUgd2l0aCBhbGwgdGhvc2UgYWxsb2NhdGlvbnMgYW5kIGdhcmJhZ2Ug
Y29sbGVjdG9yDQppbiB0aGUgdG9vbHMgc3RhY2sgd2hlbiBhbGxvY2F0aW9ucyAiZG9uJ3QgZmFp
bCIgOykNCkJ1dCB0aGlzIGlzIGluZGVlZCBub3QgdGhlIGNhc2UgaGVyZSBhbmQgbmVlZHMgYSBw
cm9wZXIgY2hlY2sNCkknbGwgd2FpdCBmb3Igb3RoZXIgY29tbWVudHMgYW5kIHNlbmQgdjINCj4N
Cj4gUmVnYXJkcywNCj4gSmFzb24NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

